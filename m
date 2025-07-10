Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA56C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=; b=WBwlCmQJhdFX0ErunIrPL8WmfU
	BJB5EMGQSUU+Zhcyaf08biwgMuEQL7/zDbLILzv+Y9gQpkNWEtTI6UkmzVRXNA1i/p2BF3XPPBNMD
	whuRIyP+i6lb9IpADyWHL52JJd4oMPaRnp3G05UXH1IHaZeVlyZRStckHWt8GPMdehFsGraTS3zqr
	AtEaU3O8ONm4HuYEG1EJv0yD6gd1GktsKJNf9e/x4Ykz0a7BtJkqzdU0zonNJ8OxU4xRAd3DRTYUx
	xjtwYr8AWFGO6hwRtRJ/WPlrU1FHtHIO/bGJyVsIZSHFX/AHeg1UmzmOpjMUTEqGHZEePE87jBnC/
	/mATonYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZx0Y-0000000CoyB-0GYr;
	Thu, 10 Jul 2025 19:32:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuWv-0000000CVkC-0MZR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:53:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9WhD1011638
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=; b=JOtXlvyYzwn25xXB
	DnH4/ZPBSqb2hwUscr7qSxMyx0IUmJIWpou//KtU8TgKGTm3L81SsGqJ3BO6zv1w
	LzA1p2dhaSr18KnWEXBK9Fx5wXu+dm3sgt6hZrAEkXrmD9EndinnVdcuCokajMb6
	S1vWu6PH0OoQULV5FhVKKrHD4xZj5e/jShEo5rsiXpByBfwBTTVCNBMdYfESDFT6
	kF+tsApEQ8j872KG3rCFBpHjLJCBspHWZuQw9M9R1+77YrEn0YbftLksCVnkK52x
	pVzOWCIR3FIsRo2cEPz8+ovQIUG3siHH0+tZ8de7R/EFk5m14OYSG6Z9BDGbjRvz
	z8b5mA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smafnmww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:53:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-740774348f6so1017930b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752166431; x=1752771231;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vfb8B/yryQh/PYLYMQLTf7EgWVJB4S9JcLJ8lU/8XF4=;
        b=mL9o6/QxNm6mDUFwAPVUpopIncnTb/vPZGtWA8iLUb+l+/oEOeZDre8tKFvnuLYR3c
         NpzOR2jcaAdMqwwZBIJ5x2WOz5IDNG2Tk5aKfJX6uS8Noh7tCuuVlehEwMjHlzqL1/QS
         aeuCLa5NNweoH3yVrCyqnyh5yNbFnP2Rxkrzt+oi4tR1KS7GxPivujqBwNP95Cfl+gbo
         TJcaDg0CtQUPbtkBZdHPHt5+FEns0CJi2v51leXwzqS82Hr9BgHnLmb3Q2nDWqogVaGv
         VeTP/T/vPX+OKXp2oXM4X+gr4/iSBTkLQV6O0jg+D0o5Gp+brvepHrwuB2NZxt5+sjoF
         z0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCV+ZQckz+dxs/hhUFWgrbuwFoP+ZflU/Gv5ewZyd3YupqO3SbPJYN+hU9bdr2uPPuTo3uiTqCbnKSB7HqxIk5/h@lists.infradead.org
X-Gm-Message-State: AOJu0YxVQgWxqHAS4WPtKCzpwPh9n+nKfIwR1p/So9qM77eaX7EUo5SA
	K5lgpWddmIkNy3sxK6K5btpbMOS2fjEn4zDfLqLuqyQSuLihpXTqefTHAsqN/YJKg5gkRaWxXLF
	tkoAMlnk4kYKRiePnI0w+VCt4RqIsLfsy0+D9g06eqNDXPeMaDoLxdghLCDP+FbEgC3ZS4rF+4z
	8HNQ==
X-Gm-Gg: ASbGnct9AxT9u9Pp455oAri9jFLIvVsokzhYMNCJPjYfwsd+38i+Vl42G0XCSqQUfUO
	MDoLQQ21qURGOkw2ypWTDqirHJFOAlrJSvFYaO0Rvf0Von/beFWLh797vGpeHeOwfMRrgaNuL38
	NyRelLuxv9Ebk8T2soj6103jQ2gGG2v3uCUahomCwlb27QggNHjI/Td2bWdnfFcLZsJseBFY1bZ
	2xijLOmVnJjU2L2yB4AjPzJk6tKfk+DOBERIm31VU/Ig/0/2PtMx80U1vIPAMOW/V/3exAnMvJz
	zrpjS05zmyVi5svjT/hE7AzZGbWSTY7WA2BORg6s8qtG2LvVL4B5ApcI
X-Received: by 2002:a05:6a00:3a05:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74eb5634899mr6389843b3a.20.1752166430599;
        Thu, 10 Jul 2025 09:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRSPr0EphfUz6oNUApD5i2gJBSco9YazNRfkr6HyyRBAwDmdRRKU0prxAQ4k9j6X+8VeHj0w==
X-Received: by 2002:a05:6a00:3a05:b0:740:9a4b:fb2a with SMTP id d2e1a72fcca58-74eb5634899mr6389798b3a.20.1752166430065;
        Thu, 10 Jul 2025 09:53:50 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f98ff8sm2985645b3a.177.2025.07.10.09.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:53:49 -0700 (PDT)
Message-ID: <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 22:23:35 +0530
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
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZJ/XmW7b c=1 sm=1 tr=0 ts=686ff01f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=8g6h00HoWaIZ3EdQG8aEvw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=IQD7W_zIqse-sWlNMbcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: CX81vcitOlYV0zYOwxC1lQ7rplJht7nY
X-Proofpoint-GUID: CX81vcitOlYV0zYOwxC1lQ7rplJht7nY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDE0MyBTYWx0ZWRfX45D0l0evVP0F
 tmtLKM49iYUHCUYQnke6Ghnbf1yZ7pv8f+e0lEmuR9sQkP7aNxJs1kw6PZ6PltGXTFCuwvKBke/
 Ix3qHVem+iU7iSXj0kU2Y5Nz2tZ4m7ZzzxsiD8YUPbUqK4bUV2bl+M32yBNQW7XzPW0izNkHRtt
 dk/pdNd1/lnplxD+BBTp3SDBJ1MtnkQZeDSC8/cZ52W/YVDPUtzbLE9/Ab7btNh6pvesZgsA6pQ
 GL3aULorZqRYRNtj4DChyXR8iyv81D+xJjI+trMmNw3WaD2zKIvjQ8Yq4LRsLZLBQZkluEWHiCX
 yyp5lim9295toRUdBkELM0Lo18ewWlM3CY8Bwdo+umFnSE9wBYnmnftrbupqIQLXxxy/uI9ZwcX
 lxGgoebBIGvU8Dt1pZodE34aGFVCoU0tZWRUAtn8jCvSAS1lmiyqETYDUAMysSWZXdOGdgeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=940 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_095353_258872_91C4911A 
X-CRM114-Status: GOOD (  14.80  )
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



On 7/10/2025 9:00 PM, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
> 
>> +  reset-types:
>> +    type: object
>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> 
> The other users of the reboot-mode.yaml binding all call this
> node 'reboot-mode' instead of 'reset-types', can you change that
> here for consistency?
nvmem-reboot-mode and syscon-reboot-mode use reboot-mode in the
device tree node name.
qcom-pon does not uses reboot-mode at its device tree node name, it
uses pon.
Kept it reset-types as this patch was already reviewed earlier and
the name makes it closer to vendor-specific reset-type.
Should we make it reboot-mode? Please suggest.

thanks.
> 
>      Arnd

