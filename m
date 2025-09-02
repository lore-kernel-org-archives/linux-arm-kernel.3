Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0824ACA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9a6GtTXtoxuJyBbnHBz6l0K5hhQ+6jxe0VIlfDfGZE=; b=2EDufAIzfTbC+EwWkt2SuS/8nO
	hM6qjXXZ81LdeSx+iM74dYSQiP9Amp3RxOkeL67gFdO4cO7S39qkUfkx1zfokpbsHQ5vuZt++P4/P
	IAr+9VL86isDqfagCPkVplxGfX48Vd8Q1IeQha2DzPM2lM1uREgbdfeo547yEIM7RmgepnPLyA/8/
	OdrTTtqkY3IQwfb4SEt0JPfmNx42dianvChiP4HGPtOLyOf9dV0MoIIBqPklafQJdXIXu5u0PMDZ7
	MLY/XZ4zExr7PZ9zMAOgmFpWTvxaAfKzFaXSKizHMFaLr03dnMj0EZVpD42UtCwdoVg/FbCtNf64e
	/loPYU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQA5-0000000HIHK-3Zt4;
	Tue, 02 Sep 2025 12:30:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNkL-0000000GWCW-3wy5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:56:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SBwm010468
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 09:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9a6GtTXtoxuJyBbnHBz6l0K5hhQ+6jxe0VIlfDfGZE=; b=gVCdi+Ji3DJ8iHKV
	QG6JRyvKFk1L0LPiESnNzyGxqNsHRsCK4IejX12uMXtSj3lu03F0A9ANdayl64Jm
	lmoxXQjakMJxP+7y0NLF0lhlZrbNsFAgI3xmcjyriVQa3iWy8xYEjCEzzkYStMIf
	OrPex6+kiRE+/0jXsLBxY3sMFMSWhmbJ62u1Tqy8luhu9RDwokgL8Khial7uAdA+
	fronRDR3wXdJk6OFbf6xNv1po96n3ASzhTPYlYkWpsWyxPJR5m+JaFmF2uuvOirR
	pctSQFuWsVoWOoHVPpMMJDU4mAq+k+g19Wv7lj630S5qonqBwjo5sOeDveey99aY
	RzXE8g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjfc6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 09:56:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-329ee88fb47so352064a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806970; x=1757411770;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B9a6GtTXtoxuJyBbnHBz6l0K5hhQ+6jxe0VIlfDfGZE=;
        b=Tepc2yZrPA7OEvRhImRuOrMEgXCBWOOvMjhQ00koBvqnxasF3k5Pj5dtAF1mGkdgSQ
         lW3CBzo+rKr7jhQMFZaQuIZSUh84VP+jRQhbhQzpR1T2WRKh+SKKiCajka6bvz13QzSJ
         DX3PGDh4OQv29c2ed8Vxb2oZTjO2vaoPWMtmBYU+nkWyHkZOSrkqSBHY/vTnAuO8ktGA
         TAaDUpFwrZCnc7937XKZ7cZS6r0G6KpDHwbg5i807h5t4Ypu5Rbc5vH3AZ/EDR0jP0VK
         tZEa8jqh+SufAjCf63b4u+WA9ITyzeERBIacLH4rFD0g4R0YeiQCCvVw6HVHMaK5V48L
         FPtA==
X-Forwarded-Encrypted: i=1; AJvYcCVRmlONxEgWSe5R3t6n9utqxuvkPY1qwOfuqM5PPde/JpIbKhhGBAQkDysW+MOB6yNcfqN3zbqrMn+y08Bsa1BJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzzHeqgkk2KsFL4e+RNeIv1gxxQe6GSPqjWbVWsPzz3FJhc1Tj8
	J/VekjaxzePmWoMDUZ8WDM64EnGvpBo9BmfAfNwatPsDykC3lniyPJjXokxPqnVDM3Boh4srbJU
	DbnGbpsyypEb5NtEEiWp8iHZlcntC1pSdoGAEpVHHxHlSTzhw7yPKQQL8wVwrKLt8qoFMnufW0/
	WAhw==
X-Gm-Gg: ASbGncuSQ3+90IM+vr2GHvUtFWoljOHZ+UpYTwDHn8Zk3myXn2QhtGs+ZqGMCZvZmlj
	uSwCJOhpwTG+EAn04hjrZWK/V0a1kBBFfSjApEf9h5v/ZPDjbEeTgux0hvhD0z67xz7egQLSL0m
	cXrgY9juiRF/4jqaWJNMIukg9cSWrBT0EfGpf71sXrPDyDeD/ladSoqMkLDLiRBFVag7tXfKhmY
	fYV94Uc4X4NAAvAZTuTdZsdRW1pLQFEgj5s7RZqqpCj6h9kZGrdsT9Tt/oZ3w3kN7IHb0kazHEI
	k9C+PVHODFoXMA6e+IEKmlbIu/sShO1eB8Vyb2phqEb/sk4hab4zHAPn1Ms44ZWWvssAT+jdaw=
	=
X-Received: by 2002:a17:90b:2692:b0:328:725:970c with SMTP id 98e67ed59e1d1-32815452f62mr16043532a91.16.1756806970127;
        Tue, 02 Sep 2025 02:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZVuzFiwlfBsSZxogTgJWw5dQ7gwHZiQ9EvvRoG0AY6Zu/sUmSXNmDrdeZxxVTBwQDQosRIg==
X-Received: by 2002:a17:90b:2692:b0:328:725:970c with SMTP id 98e67ed59e1d1-32815452f62mr16043495a91.16.1756806969618;
        Tue, 02 Sep 2025 02:56:09 -0700 (PDT)
Received: from [10.216.28.67] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d8c939e6sm2349177a91.29.2025.09.02.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:56:09 -0700 (PDT)
Message-ID: <b4e26633-b892-fda1-4738-5c8aa85d71d1@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 15:25:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 03/10] power: reset: reboot-mode: Add support for 64
 bit magic
To: Casey Connolly <casey.connolly@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
 <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b6bf3b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=FBzynz1gJkPyhc2EhIcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: vXh9ETODsrB9osgEWmZH8_pbm1RVn765
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX6SB59lpZZHuA
 wHkXQ7HwUen94SvYGHqnbUc+xsxANcsCvCCgwQ//zv7sj4bNg9E/6B8u3GuC8OPAsWEk8h6MPxJ
 AZ5m87g7QyTRtvs8G+MtKYuIJWyKOaIJD5gbKl0WEf1yFSUle2PGDsPVgczjHYH1UCsAcVMrr1+
 kES1xrH6t1RMO3VeXaZFBSJc50sHF8WEnLfZylyt+mnBMdWBxNUa+Q0DlVxCh4esC9q5mcr1+nU
 hP1m9r0kPDT+7seJX3qF4XRKiqoVQn1dJFq4YXHfi40JBIjoZNjWT9iDC4+7VYcAFefRHgD5nlB
 7TMBP38My6bwd9bheHJ042+2dtnWcCnvDHJCkZdCsdLSdJE+YjVzSjG2MeVEC8Gx34r7GfwUHVy
 3EasL/3y
X-Proofpoint-ORIG-GUID: vXh9ETODsrB9osgEWmZH8_pbm1RVn765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_025614_096969_773CDFC2 
X-CRM114-Status: GOOD (  20.47  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 8/28/2025 6:52 PM, Casey Connolly wrote:
> Hi Shivendra,
> 
> On 15/08/2025 16:35, Shivendra Pratap wrote:
>> Current reboot-mode supports a single 32-bit argument for any
>> supported mode. Some reboot-mode based drivers may require
>> passing two independent 32-bit arguments during a reboot
>> sequence, for uses-cases, where a mode requires an additional
>> argument. Such drivers may not be able to use the reboot-mode
>> driver. For example, ARM PSCI vendor-specific resets, need two
>> arguments for its operation – reset_type and cookie, to complete
>> the reset operation. If a driver wants to implement this
>> firmware-based reset, it cannot use reboot-mode framework.
>>
>> Introduce 64-bit magic values in reboot-mode driver to
>> accommodate dual 32-bit arguments when specified via device tree.
>> In cases, where no second argument is passed from device tree,
>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>> compatibility.
> 
> How about adding a n_magic_args property to struct reboot_mode_driver?
> Then in struct mode_info change magic to be a u32 array of a fixed
> length (currently two in-keeping with the DT bindings).
> 
> Parsing the DT values then gets simpler (u32_array) and the magic value
> can be passed into the ->write() cb as a pointer since all the
> reboot_mode drivers already know how big the array is. Unpopulated DT
> values would just be 0.


sure. Will convert it to u32 magic[2] and ->write can now pass
"u32*" and can be de-referenced by the using driver.

Could not understand that how we want to use n_magic_args and who shall
set it? Do we statically define it to two for now? or should we skip
n_magic_args for now?

thanks,
Shivendra

