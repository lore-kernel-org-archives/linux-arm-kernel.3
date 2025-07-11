Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2B1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yUxiWOGlCs35rCfqD4oAy1uFpwrIW5gk0AdeeQDOzs=; b=olynGEqqu9H/vtievxI6fcuCcL
	u6iy37/3rErt0kUOiUe+b4pxbVS05ClAkSb/iMf9352KSU1L/2Dr/G3pHN80NGZx4Y03Up7AmlU50
	u6DtZKig3LoZxGtI2C3Ahfikl0ceqYPorILwHVwmKfrt6o82vR2bQ66zCjSE8boIK7BAWVO2UwV8f
	XgajEsO02U5TzjSemzPwTs8JiuGE3bFHQfNRpl/j7tnrRfbrKaqwbLbLoKM1WoonFvKhIFmsOgr8O
	ui4BgPgXuvSCBYR7FslZlJs1KknM+qARWp8Wq6fjYroV/ostJUHK8SEa2Al04RzwFykEXhXnlQ3Fd
	8tGL7eQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICd-0000000FT0x-1Ejf;
	Fri, 11 Jul 2025 18:10:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHJy-0000000FNNW-2FDY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:14:03 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAQt9T031370
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+yUxiWOGlCs35rCfqD4oAy1uFpwrIW5gk0AdeeQDOzs=; b=dEa/dwq+qpYCp9ov
	IwRHGfEsQXTn43yLpCT4+xX/3a7ltSkZSMokDMIE38v3evpbApnArv+9rfpFfgv+
	sE8M3YGTtI0B0kJnQ4glXiPL0ahgiGk2cyyzjmpWf7U//T312lcmwB0uANxwwqAm
	Y/g7DfZWTHTbPgzXBsnwKI3tFzsWH3uVx7Ve2i1N66S4qY0wA4WBV+vSIKFEaBbj
	SE93RvPCIUB4+go9Kd3WeUOSWupWlAiXk6YPp20rUFRTrbo+DkG9Bl0a4r3rLJ6W
	CHTF5zkuY7PP4Mbcx8HQ+ccxeHvsKOefhJkmsimVzEOQ4cjo//lOTj3+pajpdLda
	6PzSHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbescfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:14:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso2472720a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752254041; x=1752858841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yUxiWOGlCs35rCfqD4oAy1uFpwrIW5gk0AdeeQDOzs=;
        b=maAZoGB9FZPAS/J22m6o47cyAlPF+tU56+hPW4AXIzz+2AoX5f9jh5kvNEuYkShVsz
         q+TyqkdEZlWIJyQG5MIqqYNVLbK+fp6f4BEuCBRFBkD/7sKKVp8U0W2lFdx6370BcpbA
         EjPrNr7JydWiIUaaAAjT3daI+th+demdimthfHVZv7qNkIt0CRb2ur8DdO0NwPpqqy9h
         XzzxqYAjxfpJLBJTK5lhc2pyZB7pizaXoZV++oOQQp+AR6wnda9yAP1bPpYNlsyHPSQp
         kMn1/uyxtt+mC1nBIDui7x5n7iSp4XxFv5LyYohfi7ocfscTPDSlzovC5xcRve5I1LL3
         aBSw==
X-Forwarded-Encrypted: i=1; AJvYcCUuromgtOby8Hq7kf/XvvfauNDrl/aUH+kMTxfxAGwnPExudESXLDkbiOpeeqt0KwCGrNINjoAoE9Z1US+Pw6Mv@lists.infradead.org
X-Gm-Message-State: AOJu0YxDysk17f5mp4pTKgsQEZO0QCB3CxCUpzTjMwLFLj2fwLWiAipZ
	ii4FA0j4yYoQdlGaW3NN2GWAL/feCae7nCt1bhTB7EWvITIFJCdHriTUF4K8Vzw5RhtjrZ1PLik
	SlgWHo86roTuLYUneYaGZsK4H9hXK+A1GbxRApzG4QP29q/0dgtfO/tozap5vk7PchKT6+ahr72
	AhmA==
X-Gm-Gg: ASbGncuRHsiRGqXVC4m34WDSiWPL2Z6bmmNl1eQSKopF4/NBdPMQNuUHsQOoO37mwAN
	hnrM+9pY2Qh3GnK64HyneTUFMQ7gK4ZlDB4Uk5lvk14ATKCTHUOogNTI3TNxm0GEg1qxjQBX8+R
	77T6W/ihqXq+NlAy8pKM5arTU5k6l4w1oDsa0ATu5lUsHbH2lu6QCmeqzzJVH/PKXvrs0y8YfVN
	+873s6SCVacaRAeb/QvbipzyHN2daubOM/H5u8GdZLV6tUwtpDU2aBlYe8VmKs0RRM8GOFxhgN8
	PGOZHwHtRMWG7YL6AI+NyneYNjXr6c56n3DAZq239e8df+S+eKUX6kvlChtVbAwSKuY2jBHHhw=
	=
X-Received: by 2002:a17:90b:2287:b0:31a:9004:8d36 with SMTP id 98e67ed59e1d1-31c4f512a2emr3401837a91.20.1752254040912;
        Fri, 11 Jul 2025 10:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8jwEw4xKzZ2Gauazi95OMMWknYXW3kdStTOkWdXT5CV0YXjXLaabiJCMU/29GPhFaCVApJA==
X-Received: by 2002:a17:90b:2287:b0:31a:9004:8d36 with SMTP id 98e67ed59e1d1-31c4f512a2emr3401777a91.20.1752254040270;
        Fri, 11 Jul 2025 10:14:00 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3e973e80sm5633493a91.15.2025.07.11.10.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 10:13:59 -0700 (PDT)
Message-ID: <b6f4819e-462d-7a59-eb19-bfb65ec27229@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 22:43:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
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
        Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
 <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
 <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
 <23e0f0d5-c0f6-4fc5-9775-c0ae73681d31@app.fastmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <23e0f0d5-c0f6-4fc5-9775-c0ae73681d31@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEyNSBTYWx0ZWRfX2Lzn/XC7KxH0
 bYGfXunmeCJoGEzNj7n47Zarn7WnQsDnl+Ocz0uuncYTANaCPxnaUX8xbVjJb0zQI/tDTBgxk1O
 u4t33r0CqJ+mOoCyOVbEmyKAMvMS/w8wnnjZHbxZEiqqwMJJzeS5C283CUdFmEbkAF232V/eFmI
 I09tbK0EowIAtcAOrXVcRw6WqldrGEEGmbvJNJu9rbMHnkuspzOx+PwEwaxXhBAqg5t4n70LT7l
 EurGlZWrdpdxzIaGAEIbPl3I8HlVxVMSLBGE7d2r4XVu2qeuyhWrPpoN7TuaGygFRU2t0mFPx7+
 59/BqBeA+WshE5zzEoJxk4soPYvadMNKqbJvw46uVfdOUNeESwhd31ALYhweUQygAATbADHJFN1
 LxrTvEp4ISVRXLQd1BWUvlJGpHDLTq5FXgj03s/qX3cH1PROnglZgzGQ+RD3HQ4xH84D4RpA
X-Proofpoint-GUID: LeGUAjyb4Sw3q_qLNXH_Ne5Wb_Cymeyf
X-Proofpoint-ORIG-GUID: LeGUAjyb4Sw3q_qLNXH_Ne5Wb_Cymeyf
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=68714659 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=rM0-y_1GYM4-gDGtagQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=924 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_101402_582975_1B886091 
X-CRM114-Status: GOOD (  15.43  )
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



On 7/11/2025 11:10 AM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 18:53, Shivendra Pratap wrote:
>> On 7/10/2025 9:00 PM, Arnd Bergmann wrote:
>>> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
>>>
>>>> +  reset-types:
>>>> +    type: object
>>>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>>>
>>> The other users of the reboot-mode.yaml binding all call this
>>> node 'reboot-mode' instead of 'reset-types', can you change that
>>> here for consistency?
>> nvmem-reboot-mode and syscon-reboot-mode use reboot-mode in the
>> device tree node name.
>> qcom-pon does not uses reboot-mode at its device tree node name, it
>> uses pon.
>> Kept it reset-types as this patch was already reviewed earlier and
>> the name makes it closer to vendor-specific reset-type.
>> Should we make it reboot-mode? Please suggest.
> 
> Yes, I would still change that. At least all the platform-independent
> drivers are consistent that way.
Ack. will change this to reboot-mode.
> 
>       Arnd

