Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BE7E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TceyOsbgXrP9OVMBWMLProxIlsK6QAaRS+A9GhoV8Yw=; b=U2VU+6Zvfl3+4evKfJI33zezCs
	4kJ7kuim4kI+hUA8HpjImFtNckeQZXoW2jko2u6w3HE3vtWVF4RRy13e6f4wsodYrwXHuCY9dKtTV
	p8tDn4JgdwxgcRpd0JtpO73rf82Bqg9c/wILrHqZr6WgoRBLX21lmyisjlvQdujBZNlRKdErAwozt
	vJj3LwNeIpFLhBDd4+GWuGNdSUTbKHNiFf7TMBVZsOJHXWL8Ir2cLUEHqW2OYwKNQjdtCH6xBYqtL
	s0D+AS8+gEn0hC566TIUdeImJgTKxOA4+ldLUpJCo19M/z54N9vZqfmMq6Ewm2rZtdz45inHRv2oV
	9KzxYm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMBr-00000002rL9-1CoM;
	Thu, 19 Dec 2024 19:28:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMAj-00000002rAA-3n35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:26:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJGGkT5011022
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TceyOsbgXrP9OVMBWMLProxIlsK6QAaRS+A9GhoV8Yw=; b=cOUPudBNl7MXFp7C
	4lw00F7muICON8ZEQEBOrjdc+TBV1T8VYEWIGs9g4e0Lxx493bSbWhkgKfzJ3IY8
	dj3dVWCNJVMqLjscBH4W1QP36/LaRh78Yq2CtuziMzTcMBswd9YlWBf20QE/qNfM
	Er3RPM+N5q38+4ZNHx7Ghp26ehNhChXCX+SP2qfTOWOTC92R9wwyCiP/VaIKYGR2
	Y01pDuQsVavqoHXjACnwNuBDgm5jtO/Xvovvn23C+cgrbE6ar4ELUwX6UJ9nw9Do
	//uCio/hyXMGniBGL8L8brgljxEBW6ickyziqjM8BlGebZ3MFnsDEam9kp2LuJeA
	8O3ZjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mpvagewb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:26:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a437e5feso2616631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636416; x=1735241216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TceyOsbgXrP9OVMBWMLProxIlsK6QAaRS+A9GhoV8Yw=;
        b=gLGPbWBAqtrcZYmZjcyXOXz6+7aK+FEWMo1cOrLcLtouu15a2YkNRMoVFMT1ULZpRc
         Cellqb3AH6UpihT3/ImYXU6RZZqzTMXthfUC3inTwqL0xnkS3Igrlc8rLSI+K858Y2ab
         eHG8l3PLUbeNoUobOmuZ47ao1qQXoHAdmZe+D6cVcxzXxRfOCCqIUmo+60Xjwra6kQVx
         wKmAN999P4cLoEEq6UXoT997kYwzybxB2fwdLmxllTyZXJTwnj8c/L46uWUCMkxBwT00
         qKVTL+b3ezjNonY2v2CZrqs3BwfhVEcaE9PF0ypzs70YEgxQOp/2mj7JbPOixb9fxciz
         LCuA==
X-Forwarded-Encrypted: i=1; AJvYcCWnkpJr9nq9EBqtHP6MPBn3kKrUGNj3TX2SQni7hgg4yZ7LxN1kDgkIh/PiegdGqDCvtX1XSurhX4M2oFE/lQ0r@lists.infradead.org
X-Gm-Message-State: AOJu0YyLIViJuxTsqiUvGGVZIKWFkbszBhTuT3oOVQ7xyImfaxe+6hzg
	Vuh8LFoqGfa5asMjl6Hj5/BsbLVWRtTA057aaRAlFy34Ff5NgwZKjj9BC7lvue5Gba4/Czx47Fk
	727a9n+cpv8VSqjw/76w48EuvgaehwLvwMN8qE1DEsOz7Q6mfEwRU+ZPwY/W8r90QZc1HGNUu3w
	==
X-Gm-Gg: ASbGncv58s0QSx1aeZWIOQi/94h4WKK8jDzaOcBO6stWZRhp65SfFLhWEyi8+1bJJCr
	LCkJnzUmY1OC854Zif5G/PVTf8w+GaOVZuW0+SIXFczlYjGxMr8Oh9UmTkJ3HhiSH6Mv0penyZs
	ixFuUdNY485ApzHf0oPg5swxFoLXjeQXmJ0HWJxtgmMgm414p+Z8e8EUTuuvjkbANS+Y8rCbbuA
	ftsmjO3FaVIqyxABntLpz30bsKRL0GiptY063DXNLsIaMoJzGJGVJa4mxJq8E4h41c+uHStSYT/
	WBuXhTL/eplu5a+GoTbKI9zzdxRYFOf4JJY=
X-Received: by 2002:a05:622a:1a03:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46a4a8bd016mr1224781cf.2.1734636416002;
        Thu, 19 Dec 2024 11:26:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCTR89xxu1vHIWAIqsQT8kRuL/oLnSLIOveVBByFKOkmA6Uq0iREZhkNLGVD3V8cyr3KWBBw==
X-Received: by 2002:a05:622a:1a03:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46a4a8bd016mr1224521cf.2.1734636415607;
        Thu, 19 Dec 2024 11:26:55 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c5a4sm925835a12.38.2024.12.19.11.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:26:54 -0800 (PST)
Message-ID: <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Elliot Berman <quic_eberman@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B_q3K-X8Tnt2arcV7oKfGXgj2NPQDFF8
X-Proofpoint-GUID: B_q3K-X8Tnt2arcV7oKfGXgj2NPQDFF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_112658_062722_99BB24B3 
X-CRM114-Status: GOOD (  26.40  )
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

On 14.11.2024 2:10 AM, Elliot Berman wrote:
> On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
>> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
>> CPU_SUSPEND instead. Inform Linux about that.
>> Please see the commit messages for a more detailed explanation.
>>
>> This is effectively a more educated follow-up to [1].
>>
>> The ultimate goal is to stop making Linux think that certain states
>> only concern cores/clusters, and consequently setting
>> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
>> NVMe, see related discussion over at [2]) can make informed decisions
>> about assuming the power state of the device they govern.
>>
>> If this series gets green light, I'll push a follow-up one that wires
>> up said sleep state on Qualcomm SoCs across the board.
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20231227-topic-psci_fw_sus-v1-0-6910add70bf3@linaro.org/
>> [2] https://lore.kernel.org/linux-nvme/20241024-topic-nvmequirk-v1-1-51249999d409@oss.qualcomm.com/
>>
> 
> I got a bit confused, but I think I might've pieced it together. Konrad
> wants to support s2ram (not clear why) on Qualcomm SoCs from 2015-2023.
> On these SoCs, PSCI_SYSTEM_SUSPEND (s2ram) isn't supported but doing
> s2idle gets you the same effect. You'd like s2ram to work, so you
> provide a way to replace the PSCI_SYSTEM_SUSPEND param with
> (effectively) the CPU_SUSPEND command. If this is the wrong
> understanding, please correct me.
> 
> Could patch 2 be sent separately? I think it seems fine without the
> rest of the series.
> 
> I'm not sure why you'd like to support s2ram. Is it *only* that you'd
> like to be able to set pm_set_supend/resume_via_firmware()? I hope this
> doesn't sound silly: what if you register a platform_s2idle_ops for the
> relevant SoCs which calls pm_set_suspend/resume_via_firwmare()?

S2RAM is what you get after entering a certain state, but currently
it's presented as just another (s2idle) idle state.

That means some hardware that may need to be reinitialized, isn't as
Linux has no clue it might have lost power.

One of such cases is the PCIe block, with storage drivers specifically
looking for pm_suspend_via_firmware, but that's unfortunately not the
whole list.

Konrad

