Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB03C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=; b=cFw5FieR22p86Y5JlwUbxZVHiQ
	Q+yF/KjZMdITLMCsrR3vX43k9rUAhICnONB+rCS1GqTPD7l4o0R3ZkbqllQj0fK2Sn50OoZlC9JeR
	ZhXyGIVXb73hZVP+CcZ4x0yZAVeKEzDPPKZq1Z4k7b42RgvdWjDyuFanGihSnWfu2zpvVaDGmNsYc
	vx2tf2yigX5TzB9rdVLCSYv7SqMnz+J3cd4y4ApGv2VnGYQhkb8gv42MnDztKoaNM48HGhMXLgMvh
	8DiJg+Fwy90mZJrraN8CXLRUpiJZFKzOHFGEz65dH21KcOgJe95z+nbkQ4oyr2yvxTI8eOJrVa2ns
	BNsHj5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEml-0000000A8u0-25Os;
	Tue, 21 Jul 2026 18:01:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEmj-0000000A8tV-17PT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:01:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2cEU2186862
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6k5png2EebTSIaZVxRWm8CM
	pbRPFtbdYVyNuYkr3Bc=; b=mLQXOczGSWLql6CaoiBRiSt2MSd/PEkDyEOCPiO9
	Qi2BBfj7JoMKyL6h7LFo2V3JMxJQTywe2i1oTTKpzKC9q3Hz0Njq4d7bboprE6CC
	iWSW2bW74uDvso864zQ938lON6ywA1pYuTMVm+IFAkpOCmlACRB9zQr5GOBmYv5x
	ZHwK8NP5yC53S4a5Rh3FROK/zOlBOd+7aG9uvZUGdN5id6Fg2J4uf/UObCKn02uS
	MYcrAKzMTPI6qrUhjWk8Bzwd/Hv+HHbJZS93p75EG9f9+0fwl5H7ytjhh55AXjQU
	M1MKKRM4Pa+Bf38JL7Z/TsQk/dh9Z5EsdNXwda7M7jaDyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae9hpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:01:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so113994395ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784656899; x=1785261699; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=GcLW9CiLjWS0oqHMq4R3h8OkPmeYCASPDv9r7vj5N+/hg0snLULLzWH8SVQyvSMI4m
         2FxSUowTQSZtheB4TwgMKgRO80d5EVF10jjeT+ysqNHY4EXozTEtvmMqTdFK1tc9IM02
         RZ++1/vTU7m0ejLMBH35xgbDMt33VFqr91xerm9wYfj6XNSRJl8oWkHoSB6MtL4wFkVs
         TpTDJQSTq32gOZ7Kyzqq7C/aY8glkiRWcrsI5qTLU2ZB3JP6TEd0Lf2/qDBOVh7kDXqH
         y4YuZnRoeoCFLetngEx3JrqiLLvk53cTQJnopns5qQaLviv+YIP8UtL4IGcMTsRmUSY0
         mW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656899; x=1785261699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6k5png2EebTSIaZVxRWm8CMpbRPFtbdYVyNuYkr3Bc=;
        b=DZ8CaCEF9AnwRW8FjnyXZq7MBFRVJPpn0Gn5GSezGHhV6ZPxEayTpW6HNYy7EbkB9k
         869keJHqwWhRH+NJytCuauzyWOVspuaD9JdzxOtQaCxtvSCc2JeQgwtVpYDrNw2BYpMQ
         de4IfPJ1k0+B91x21CBXMv3M1vFpxnGc+6OwCdAsB8MZyztrPRot47rm8L/4ttHjBdZq
         +4orZDWdPLwF8IbrX23mSAsHpXCPTlU3lkHKfa7KdpX4Wa3BTyglHvaCuJBvYl31WTI0
         8OGC9sNy8E3blnM2cp5NWu2Ko0GjFvZzl9F+4TtVvLKqpu0ADlJD4u9tGUnS7fWpqOXN
         uO7A==
X-Forwarded-Encrypted: i=1; AHgh+RpaBrNKZeLvd/iBrQq8lrhMoYVSfpquYKIvjuzYbn3bn2PJ2HbSviIwf+D2KCihlCXzmZvs8HVLSH/Wi7DHLEzF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0ZVjrGOwIh1aAw3HhD1RciKPqaCUdg7O6W6rb6chyI5G7j2G+
	lR6dzqlIYb1Ug7NzPor1IbcDNAJfyylCPBXnoogPaNjqsLF9lGu/F2BWhPkiCTTtTLeKY16z6Bx
	tk7r6IejEJT8TbzL5gZ4aI+l8WWhCAtsSNyFKthxV+kqOb1Y2uhlbzQ4T6KJYo8OcPfR2kOgjMp
	P6Rg==
X-Gm-Gg: AR+sD10WsKNYH1NX2oW/eMysClDVEpKsVaRAc9oKi2qDVKL6+ubkPqFAikExf+3VFsr
	1u+10w83t46gmKBtKiCwHend5v0JaEsfOnpm31R7G2LIntINjgdy2Hkyp8mrL4DyqiIrCyAg/KL
	OjHdT5qxoEc/K6l7g7g9pLC5NTjtbEVCajZKn35Da9k/Cv1RgzSfGbpM42TVJmz/D8lMPfEolUE
	/pCkLlMccHAaed9Wu3pGI1nU9Bdv3dRIslSo3KUDZUGhXMl9EQAOQuMvDxRuKds5aEdRm82i/U1
	8YexsB0BwhcL6OvZBpVMq5sXw5Yyt5h4er6CfhtXy9R1ANpBNbotVPKvzAjEn99xyh0Gp+HJ4W7
	8ibSAhEY/EY+DgYscnXr9xdOeypAt7YMYpg==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205347625ad.32.1784656897494;
        Tue, 21 Jul 2026 11:01:37 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr205346725ad.32.1784656896901;
        Tue, 21 Jul 2026 11:01:36 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc61637sm1021861eec.8.2026.07.21.11.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:01:35 -0700 (PDT)
Date: Tue, 21 Jul 2026 23:30:59 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 01/13] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <ac030bd2-6b14-4b55-b277-422514da5f32@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-1-e7453c548c21@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: n-sZZ2--orbePPqImtp0pU3YGBEbgQIK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX46lCt/4LSEzm
 BgyWrznE3qqmvqfnz67IEOMS1cczA84RG0NNmWC5itWlrzIA7FPkhBH3APoBV6hPn9L1gaD4hpw
 YxmazHVA0Pq3Q5JQNbbuAc2dMg7g84g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MCBTYWx0ZWRfX5N7D2nAI5BSz
 8FxGaZZ9pM70KWZUIfgkse8IDLSjbp2+VoAl/4a6k3SkILF9o4EHKH7Gjz5XWvfYyUqpGq6HL3g
 EsZ9/2EwavJNo3yHgtR1S0YJAc4cQM0DI2UmyAyfXMuiCnoa3Obx/t06+l/HT5LiHCTREFbDEH9
 RpDfD+14aen0zS7UERIr73vpN26lMGZiHPNW3LLXMrlBVvdkNFhQBYcUIg03muO/9KtRPz2HWH+
 ephPuxVp8bf9bbVPJ+qBnECA3xI/KaWSJqwBkp0QaU5VSkTxZZx8/V2h9G/T5x43Cm8rCMTGvu1
 nTAb+A2/fg+kjdhDyd+Bo+1UEov89Zh5tF4wJ8v4ZRbczroQUZcQLecp1WugTr5ZHVr47x9j/ty
 uiGw1Ig7loLKqbFCsVZR4ebLHxzMFkzfhHJWCy425Pa1Eim7yXu9JC2h22m0T42jkyqXm32BEfG
 6qhwReT+QkLgdUiYO/w==
X-Proofpoint-GUID: n-sZZ2--orbePPqImtp0pU3YGBEbgQIK
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fb403 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=GxRVn01Nmxo37F9Fo38A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_110141_428077_35729C8B 
X-CRM114-Status: GOOD (  25.45  )
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

On Tue, Jul 14, 2026 at 10:46:29PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that

You mentioned driver may not be attached.

reboot_mode_register()->reboot_mode_create_device() is using
`reboot->dev->driver->name` directly for creating the reboot class
device? 

> they will not be referenced after the managed resources have been
> released during driver detach.
> 
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index d20e44db0532..7a74f72a8313 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
> @@ -10,6 +12,7 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
>  #include <linux/slab.h>
> @@ -168,10 +171,11 @@ static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
>   */
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
> -	struct mode_info *info;
> +	struct mode_info *info = NULL;
>  	struct property *prop;
>  	struct device_node *np = reboot->dev->of_node;
>  	size_t len = strlen(PREFIX);
> +	u32 magic;
>  	int ret;
>  
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -180,19 +184,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
>  
> -		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +			pr_debug("reboot mode %s without magic number\n", prop->name);

Any reason for converting dev_xxx to pr_xxx here and below?

> +			continue;
> +		}
> +
> +		info = kzalloc(sizeof(*info), GFP_KERNEL);

The recent commits to this driver adopted kzalloc_obj().

Thanks,
Pavan

