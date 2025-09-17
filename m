Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7A7CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CldjWF1Kec39RRy7IefPImhF3OKmtV3emAzZ2/VbBsc=; b=UbB5puf2X1Bjw6MByDuVhJ/pLZ
	XOOUOntVwLt8FsrzmGA8HJ8f5LfHPHKZmiHKUW/lgwvBbUmgTrBXwdHHv24KKYFePY6orc3P4jbbq
	VarAjNSARvqK38pWLGI0MAv15CjkpzBNBmGsvs4G+C/atsib7Ddy8tHG/gML5in8D2nVay3DWi7uv
	iW881BlP80g9IbNwULoUdEgccSf4RMPqcVYby8b4CvO1ZRWbG1xKFF8SXAG6Nxb6E4Wy5vGd8i0Cl
	nqU77bPjO7ZnwA9ELo039NlDGplM0ihQd5bScI1e/Nc51Uer3IKRugxlMKz2qsoMlbD83CmIJHvXX
	RHE6PTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvc5-0000000DQ6T-3chx;
	Wed, 17 Sep 2025 17:06:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvc2-0000000DQ4O-2xG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:06:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HG86qf019523
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 17:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CldjWF1Kec39RRy7IefPImhF3OKmtV3emAzZ2/VbBsc=; b=TUEtssX0LEp4+Yxj
	JKISkX+yfP9FaUzYI7MnA84nLIbPhWzkDwswuy06e9tZtu1ufEXn9TY5FHq5KtEQ
	QOk2Sj2p4JsG31ZA20mZYG5t9YHKpHhhAVoVeBjdF/eLpsxoUHYoORtpDBHE+DJ0
	8chO+dMThHKCxYrIZ61qXJLb84+83OE+DDc6ZvHWTGHUKtyQ2molI6e45D4FmTWh
	KIlhcFt37AQzo8ZA/XrIFFK/5ZM2U02MzhYZUWb9D1ATL8BYQ0P/S3RVy/sWfa+W
	MaBeAURM1jxhrpN+VzmWeh1tOj9sGaKmamNMjLTXLuk+1nyG7hkXQdrphs2VQmIx
	7Evx6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1u8bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 17:06:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2659a7488a2so245725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 10:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758128792; x=1758733592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CldjWF1Kec39RRy7IefPImhF3OKmtV3emAzZ2/VbBsc=;
        b=EcSbjgwnEwXO3M+9D78Ley7utFcVap84j1eNEYDcacHJmz2Szx0FuhtAyHeQlFDcDy
         1A+Y27WqwmVcu4DeCI3dgN3QMf+smM0tG44woAd+2kXL5/aPh7EMZ2/yWowDTIbEu0Tb
         3J7Xqv0ZmA9KVNG5tGsVn8QgkeflKiQPTIFWPAo+PEG5rbRUWJwyWhZU584cMTTvq7Qf
         0dNx3RqD5jsn2odKRcLcYeEyMciQjr8Q1XB8pT2M7st4Ud0tdtsPpPisQ84VAeurjENt
         JWqIefjcUAOJZfO75y1WZZdBM9cn+1FarJzeqKw/x8AGjtrUN/f8G3xr02jWiLRpcD5M
         tXwA==
X-Forwarded-Encrypted: i=1; AJvYcCUhPzm4QP9DwSn4HiY2LB9jr3S0McaBNrKk8YQ/PoH03zMF0QrmQX+agu8sJCrHBVCn0OPviFphQRXd9IW0ijzZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvZ92rH35IY+w/2tFluB/nqzd37myzn54yvXnxb7eBRcPe1ySA
	rwKggU3YcHGIHHbTYsAld6PqZS3A+PUrQcAIwkmbctYvRAx6ltLc74O0K/LjoQ0zHumAcL4DBFy
	lMecgXvbVWMWfUCPwEEdILoAY8WaH/BSzNG1hpFrwCAqdkhXGzHHPoyxh8ckJnkw11sNMc1v5IA
	bw7w==
X-Gm-Gg: ASbGncsjMCTYe0h0AtNcufORARPQbSQ+AaB7JI5PHa3a2mK1wpWZ7Fan4gKZtxDwc42
	5xFTeJYNszeAkDPt4Bw17FHfLSRT4lFMCZC/17aiwMFtSmWbfJJY97u9g17Mf4ka2NEZrK8LdLn
	TFP7FmWikMRnRqHT9+vCUswpNAUy7R98LyzR5XZmrbtyMNy0oQyZGYKFAt++h4hE60ULFwU+Ydk
	XZvGTcx9AgxQ6wkjVy+WXE6/6UApv4KwKk5zI+eevGeo1sRFa+NBZn1V0Sg0I997lABRd4ABR1S
	21qhpKydNW0CzAdiIs+/3s9lCw+6fGXm9VOpYgpunCMsMN3DWwu0S4UZOr6yb5A=
X-Received: by 2002:a17:903:3d0d:b0:266:2e6b:f5a7 with SMTP id d9443c01a7336-26813d04f4bmr37704555ad.58.1758128792205;
        Wed, 17 Sep 2025 10:06:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiYS06pnxVlJyVc8usIQK/iQa6m8Xw/xXXNj5CZpC/OXWCWIJ7/dsM3zh0SSUhq8YicFepBA==
X-Received: by 2002:a17:903:3d0d:b0:266:2e6b:f5a7 with SMTP id d9443c01a7336-26813d04f4bmr37703845ad.58.1758128791682;
        Wed, 17 Sep 2025 10:06:31 -0700 (PDT)
Received: from [10.216.34.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053dbdsm1270735ad.9.2025.09.17.10.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 10:06:31 -0700 (PDT)
Message-ID: <472265f5-8463-e0ed-6386-f52478d4f2fd@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 22:36:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 01/10] power: reset: reboot-mode: Synchronize list
 traversal
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-1-37d29f59ac9a@oss.qualcomm.com>
 <7eqa3rs3nvy7htvrkwyh5m7ok34n6c3h2dxn7xm2abdjzav4hp@i275ed4owgru>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <7eqa3rs3nvy7htvrkwyh5m7ok34n6c3h2dxn7xm2abdjzav4hp@i275ed4owgru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YaxK4X1t1Bn_NtGGAdxjYWjwV7X_NgOo
X-Proofpoint-ORIG-GUID: YaxK4X1t1Bn_NtGGAdxjYWjwV7X_NgOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXyJJ2aR+AN/qx
 BgxcKFdMoyJLp6RnAtqdqOulfs2xH47SCBvPXwgdln1YSV5XT8cVGw4zZ1hKtxCLs+ohMIXgB0B
 Ei2fUxVUCefc+FmhC8KD1umdRpHZMK+Cpr79CvfMB2Fy7xrVwgyjW2sMGNvoVQxCuk1Q4CiyrqL
 Qvjc+w6CcEfQeb9Ih9j9G/K9sKnnyB3tMUiPSpvYHD46L8EyB6/v4bVGD/q1p7Xp5oosuvaf50j
 jXTHJ2DfyuWF4w8hDfBVZPOMEiYTCcTFT4s9zZa+85m61YPdZrsy8/RVDQ/HNahtlRzQ1VX7mOy
 xdu9FKj3UfwdxeIGPnNcrToJBcn/lJjKFV+3BpXEehj8i3DopZB7rgL2vG2udkUncGTv6Et9k28
 rrJLOZH5
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68caea99 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hMdzhsAlQAsAiGmCIg0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_100634_867754_E76B0A5A 
X-CRM114-Status: GOOD (  15.19  )
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



On 9/17/2025 12:14 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 15, 2025 at 08:05:06PM +0530, Shivendra Pratap wrote:
>> List traversals must be synchronized to prevent race conditions
>> and data corruption. The reboot-mode list is not protected by a
>> lock currently, which can lead to concurrent access and race.
>>
>> Introduce a mutex lock to guard all operations on the reboot-mode
>> list and ensure thread-safe access. The change prevents unsafe
>> concurrent access on reboot-mode list.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> This should use scoped_guard() and a Fixes: tag. Otherwise LGTM.

ACK. Will update this patch based on scoped_guard() and add a Fixes tag.

thanks,
Shivendra

