Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D7DC98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=; b=4dh2gWIyvJrbl04bdfpeR1rNW3
	BgrpkIoDgj/vRv0ecpHD2iOqbrVbOE+5KT5/Ino+PtBQReewCR5z/xQ6WCGsyz2w7t1s/bLhDo6Xt
	Tz8sK6D0W6nzmFhJH6aGtpZLqpNMZV3fBRwuj2PVj7+68wAcmv8lknng9UJVMiu2OxxZNjA0QTIQa
	dOZJVTjA09jJ++/fp73ia0EQQU2GYDLsdKU0cOy+sh58FtKYNlExACAGHl+VXqYDDgZWJVuOTXuji
	JVZmj3mqj28cMuMK38inYlMPIhQlsTQrwZ4ecm5mtAC+H30o26LNlG3yTx694owR0eXIqQaEo7mj5
	8MQMkNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jlB-0000000B7eN-2quj;
	Thu, 24 Sep 2026 13:45:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jl8-0000000B7dR-3pFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:45:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5Bva1430342
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=; b=OXNqTZaW1hVXUEuA
	RpbpIDZ5ZyZIMz5G3cp/uC/FgcuVeu3hcEkHU+lrs0zGQ9LslzczkcYpfSViC2pQ
	HDAj2sS5zlACKFUS3vuWUqwcHy/Pirw2f88NsGnJYR7H0RLWPSY9G/qjBuA7oVxg
	r7JUkZP6oRWhIYTIB6Dlxk0JYowYsovizQ5kDwCHxSzWKeHWGpUMjP2vryZbILNt
	p4jOnHT3okmy53j8LtMoyl+sGDCmTjkISbe/J+tNphd93NjcoU2TBMXKYrYszQ5t
	96fw3+VpQemov/UV82Yj085pC3Ts6ZG23ZZMYfL+KsMe2dJihm7aww+cvUEExwLZ
	/JxeBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgha9q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 13:45:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd7d0751efso8516525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257510; cv=none;
        d=google.com; s=arc-20260327;
        b=aqTXcQ63oVnacsSc4cyZ3NcIyy48xt2uoGBMAbzISI+mc8IvbR15/hoGmVgj70z7kn
         tgx1FjQTB6QIynKCdq7sMa7Xos0FPgrSi0WGy9eJpQwZrX3kEwiW4RFu3Y/0eudDxuav
         raOGZLJ8fQ43i0N3nLLufEWX75KwZ4JcS9QnifxcCP9C54s0JqyTZyE4ztkC1BGUJ6D2
         5Fun89QMDFXZ58cWqm7Kfu0WkbGYFiO0nEnmE8FjxlV2C7BxrY0D1jaApZT8JV73KKxR
         B6tFTSIj19NZsFldrv/8g0dhv3V9yNBaNJvgB5toXznC1F0HN5aTsqg9MldQzZqrlNAf
         Q1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=;
        fh=77Hoidn9vDPJAhRw1XyuHm0cxaigijA4GWXOS1In4bU=;
        b=hd5PHmTmhuUzVbL8ZGluf+DPZzDL1IsLGpDTBbZgcAK7hti0FOt8qJkI0OYjvCwA+W
         DRK1yZ+QR8u8zeph1+lIvfBKC5t3PZ2PNMXU4JOaNdR0XxV3KdZ88mK1z16z1oikzpVj
         FEMZFX3BmHRg5oHp3nF0+cfqj9KQTONwN90ZQuGrdVfZHfBCmeS/SWiSo3hur4cDu7gU
         PMvYj32LsZ415ioH0e23OksFlL5CKLEczX/7lTM2u7AFMCYjBKephY6AQzGQy7WNTdBj
         zNSO+miUUNdXJk/XJBO7ee5TUxWiYqHWQzRbWj05RIZyMpShqjf//luBUduxiwyXPQhV
         jWbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790257510; x=1790862310; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=;
        b=PwjykwjGPFHuJbD61PZmmZPLfbZ2EM7s7dwIjHvhcL8ug0+OteCmFmo4CiE+ds55aW
         qn9Q4AWX1K2sm4xtRb/9eT7kWfWEsDOm/h71EDwO/W3pVOpyZDnoV30hPU2yYT4VLEfK
         pzdoRbeD6//1zcinLCAIj4ys7/FAWtHH7LOMKQAdMGdTJNRFyGbOIJs1XmZutWqqHtNS
         BYG3fjVskl7BjdE2Ym4iFr8NYUshfPKHlr1oqhRIvisOQdihOmE6oBgI2VFJEHRneF+K
         jTkYxNylBoS5fpgP8qkmjw4wSSGEWv0Aj+ID5165EYtvxvbiqhl4BNuBPatwjrRdYUyi
         er1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257510; x=1790862310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+92HIZiD8BjzLF20PEwnQGtt9JR2IY1fehiHqBhK2DE=;
        b=mfxs2yqdyNahlor2rnInEtqZr/psEeaoQFoxa9x5dtBd/mgHJ/sST24On2iItZBD5p
         t750z+330QCFZG1VdHCttrktMH4tV4OsCZF3QT4ej4I/Fwo4/eXxphKj+a6/4exfysGS
         ef5DOO/blZyxRNjqMuy8eBFnq54iYW8rblDWsj/3ZFx1nVLBJGEYwnPAnXcPTPVLGcAv
         sKYvM5aZA1vvpSqBrQcpjLT/QWrd7bbAr6bzQq8P/tr4q/ov1H7zIVhRPy3QoPULQwtJ
         qEIxVNwCFmG7i8w4lbPmeSTQg1dY/NVoHnTOSWFd2wC0naSYYRTTlGcABPKr1TiG5ZBu
         gpxg==
X-Forwarded-Encrypted: i=1; AKwUvByTCBIfkOvFBWyLekXYhEKQFgt3Gxhlz6X2gmp4AtZZH3CJDjvNwhNjwPGxzGKiqWzAUcGAIJkzCK7PNiB92g30@lists.infradead.org
X-Gm-Message-State: AFuF++mGz9rRemS/xPlleU2E7FrQn86nYym27TsTf1iAvivQ88d1ZlzP
	zzCGOP7n+5nC7J0dWTndoeXdZwYrpcLpgbnbPxrNW4PLVabryEmUrgH9srJWr9zD6+2xo0j7J5h
	EMTg8ZUNQFSPPy7iyj8zAMea9Z7AZrnf04FBLntekomSTwTAWGTbA9sesyDgm9hKKXLhZxgq51q
	ySrfpssDvOmMGwKF3tNpM0OqJNZqYH3zNZdxhIxo/s9uh6Xm4zKRnc
X-Gm-Gg: AYBFou3ryy2iEIBIOltP753IQ5fGfiRLn7YV4egvOr9rNcw2bHWcT01fdFy8LECRVlI
	JGIgRvhwsANnOjqsQtVp7HVcvWlubc4f3hCQAuWBZBswJ+ZtiZewCtn67+HlgZJ5gqAKRNtUdUw
	jVZ/62CTv1x++oeeGOQG+RCKh8GC55DB7BhO6LiFzUvDv0oM+nf6b+udYfKQ==
X-Received: by 2002:a17:902:e747:b0:2df:89ac:a9f3 with SMTP id d9443c01a7336-2df89acb234mr4396925ad.30.1790257509535;
        Thu, 24 Sep 2026 06:45:09 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2df:89ac:a9f3 with SMTP id
 d9443c01a7336-2df89acb234mr4396605ad.30.1790257508990; Thu, 24 Sep 2026
 06:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-ux500-power-domains-v7-1-v3-0-9352be6b86b1@kernel.org> <20260921-ux500-power-domains-v7-1-v3-12-9352be6b86b1@kernel.org>
In-Reply-To: <20260921-ux500-power-domains-v7-1-v3-12-9352be6b86b1@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:44:57 +0200
X-Gm-Features: AclHuK8823By2ir4rvAhJl6ftcMi5z7VMEo6jrXMBPTc2AtobSCQW7MLn1qCZ9I
Message-ID: <CAPx+jO-3aZXatF+zL=G_cG0QaSjjCPrdhpXOGZC+_zNYxjsP1w@mail.gmail.com>
Subject: Re: [PATCH v3 12/18] pmdomain: st: ux500: Control DB8500 EPODs
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab52966 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=-O4hDVTBhx9-GJANRbkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: PfpBXckBhpCFnUL1EtGQx20BIgw8q1BY
X-Proofpoint-ORIG-GUID: PfpBXckBhpCFnUL1EtGQx20BIgw8q1BY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfX4tjrEnnFi5O5
 ZofhH1vGfOOBJg8fZL1ejzjLV2tl0OuKKJc2e4/zsBJM5g4Dbx8OfiEeVQW71pAJBCUGwUfRClo
 8FJHCsSnbSPg/RNlzJzq08Oi8eyvnRY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NiBTYWx0ZWRfX2jkCefQaAnfq
 3pgIGx+mu4ja8t6d8m0X+ygFiyPdGbh6aDIKu35XmQRC7Ya+bst9z8b95LbEYvi5DKj4Y1LshDT
 kn2D9i+fkjMUGp9KKM3qyp6i5S78vHlvzsUhzmsV4n2hmUrXMWUQoZ5gAuSeG6ZQRzCAxApB4U5
 BKVtdYeORJqm+XI1JYcnFdnFGi5pyqryYK/d94pPEp2yuk8I6lixZH9FdGuAGpklKpxBb67v2Vv
 auWVTc8Yl4xPsMn0y6fZ3Fc7+7v5BwN7ysYD1MFsNsg2TaH5XXTkgF0Mi5aaQpUbyxd7H3wV2bv
 rC9vfShAxCmdLRtb/x8hkNJjQVxfszdCf97eppmyu1ZTGdm4Yz0RDU/MJWcI6juynCcZzU7CSEd
 gOeQ+OexY4kaMNY9ZQmsQbv9/T69Zy5k1rhbEsOOR3aZrcXsjAIcZrNj4FxG8lH4cVYdSvoSmMd
 Ut+Vas6Fze81nHU/ixg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_064510_964119_7688494F 
X-CRM114-Status: GOOD (  31.36  )
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

On Mon, Sep 21, 2026 at 12:49=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Move the DB8500 EPOD state handling into the Ux500 power-domain driver.
>
> Keep the old regulator driver mutually exclusive with the pmdomain driver=
.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-ux500/Kconfig               |   2 +-
>  drivers/pmdomain/st/ste-ux500-pm-domain.c | 355 +++++++++++++++++++++---=
------
>  drivers/regulator/Kconfig                 |   1 +
>  3 files changed, 254 insertions(+), 104 deletions(-)
>
> diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
> index c18def269137..56636c993f49 100644
> --- a/arch/arm/mach-ux500/Kconfig
> +++ b/arch/arm/mach-ux500/Kconfig
> @@ -26,7 +26,7 @@ menuconfig ARCH_U8500
>         select PL310_ERRATA_753970 if CACHE_L2X0
>         select PM_GENERIC_DOMAINS if PM
>         select REGULATOR
> -       select REGULATOR_DB8500_PRCMU
> +       select UX500_PM_DOMAIN
>         select REGULATOR_FIXED_VOLTAGE
>         select SOC_BUS
>         select RESET_CONTROLLER
> diff --git a/drivers/pmdomain/st/ste-ux500-pm-domain.c b/drivers/pmdomain=
/st/ste-ux500-pm-domain.c
> index d90a563cd6f3..b31a36a4acd1 100644
> --- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
> +++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
> @@ -6,174 +6,292 @@
>   *
>   * Implements PM domains using the generic PM domain for ux500.
>   */
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> -#include <linux/kernel.h>
> -#include <linux/platform_device.h>
> -#include <linux/printk.h>
> -#include <linux/slab.h>
>  #include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/db8500-prcmu.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/slab.h>
>
>  #include <dt-bindings/arm/ux500_pm_domains.h>
>
>  #define NR_DOMAINS             (DOMAIN_ESRAM_34 + 1)
> +#define UX500_EPOD_NONE                NUM_EPOD_ID
>
> -static int pd_power_off(struct generic_pm_domain *domain)
> +/**
> + * struct dbx500_powerdomain_info - dbx500 power domain information
> + * @genpd: generic power domain
> + * @epod_id: id for EPOD (power domain)
> + * @is_ramret: RAM retention switch for EPOD (power domain)
> + */
> +struct dbx500_powerdomain_info {
> +       struct generic_pm_domain genpd;
> +       u16 epod_id;
> +       bool is_ramret;

This one is unused for the defined power domains. Is the plan to add
support for this on top, later on?

> +};
> +
> +static DEFINE_MUTEX(ux500_pd_lock);
> +static bool epod_on[NUM_EPOD_ID];
> +static bool epod_ramret[NUM_EPOD_ID];
> +
> +static int enable_epod(u16 epod_id, bool ramret)
>  {
> -       /*
> -        * Handle the gating of the PM domain regulator here.
> -        *
> -        * Drivers/subsystems handling devices in the PM domain needs to =
perform
> -        * register context save/restore from their respective runtime PM
> -        * callbacks, to be able to enable PM domain gating/ungating.
> -        */
> +       int ret;
> +
> +       if (ramret) {
> +               if (!epod_on[epod_id]) {
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_RAMRET);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D true;
> +       } else {
> +               ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE_ON);
> +               if (ret < 0)
> +                       return ret;
> +               epod_on[epod_id] =3D true;
> +       }
> +
>         return 0;
>  }
>
> -static int pd_power_on(struct generic_pm_domain *domain)
> +static int disable_epod(u16 epod_id, bool ramret)
>  {
> -       /*
> -        * Handle the ungating of the PM domain regulator here.
> -        *
> -        * Drivers/subsystems handling devices in the PM domain needs to =
perform
> -        * register context save/restore from their respective runtime PM
> -        * callbacks, to be able to enable PM domain gating/ungating.
> -        */
> +       int ret;
> +
> +       if (ramret) {
> +               if (!epod_on[epod_id]) {
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D false;
> +       } else {
> +               if (epod_ramret[epod_id]) {
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_RAMRET);
> +                       if (ret < 0)
> +                               return ret;
> +               } else {
> +                       ret =3D db8500_prcmu_set_epod(epod_id, EPOD_STATE=
_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_on[epod_id] =3D false;
> +       }
> +
>         return 0;
>  }
>
> +
> +static int pd_power_off(struct generic_pm_domain *domain)
> +{
> +       struct dbx500_powerdomain_info *info =3D
> +               container_of(domain, struct dbx500_powerdomain_info, genp=
d);
> +       int ret =3D 0;
> +
> +       guard(mutex)(&ux500_pd_lock);
> +       if (info->epod_id < NUM_EPOD_ID)
> +               ret =3D disable_epod(info->epod_id, info->is_ramret);
> +
> +       return ret;
> +}
> +
> +static int pd_power_on(struct generic_pm_domain *domain)
> +{
> +       struct dbx500_powerdomain_info *info =3D
> +               container_of(domain, struct dbx500_powerdomain_info, genp=
d);
> +       int ret =3D 0;
> +
> +       guard(mutex)(&ux500_pd_lock);
> +       if (info->epod_id < NUM_EPOD_ID)
> +               ret =3D enable_epod(info->epod_id, info->is_ramret);
> +
> +       return ret;
> +}
> +
>  /*
>   * Apart from these voltage domains there is also VSAFE which is always
>   * on. Vape_esram0_pwr for eSRAM0 is connected to VSAFE.
>   */
> -static struct generic_pm_domain ux500_pm_domain_vape =3D {
> +static struct dbx500_powerdomain_info ux500_pm_domain_vape =3D {
>         /* Vape_pwr */
> -       .name =3D "VAPE",  /* 0.95 .. 1.20 V */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +       .genpd =3D {
> +               .name =3D "VAPE",  /* 0.95 .. 1.20 V */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,

Several power domains below share this epod_id. What does that really
mean? Or is this only temporary?

>  };
>
> -static struct generic_pm_domain ux500_pm_domain_varm =3D {
> -       .name =3D "VARM",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_varm =3D {
> +       .genpd =3D {
> +               .name =3D "VARM",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vmodem =3D {
> -       .name =3D "VMODEM",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vmodem =3D {
> +       .genpd =3D {
> +               .name =3D "VMODEM",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vpll =3D {
> -       .name =3D "VPLL", /* 1.8 V */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vpll =3D {
> +       .genpd =3D {
> +               .name =3D "VPLL", /* 1.8 V */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
>  /*
>   * CHECKME: as these are used directly by peripherals as regulators,
>   * perhaps they should stay in the regulator subsystem?
>   */
> -static struct generic_pm_domain ux500_pm_domain_vsmps1 =3D {
> -       .name =3D "VSMPS1", /* Also called VIO (1.2V) */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vsmps1 =3D {
> +       .genpd =3D {
> +               .name =3D "VSMPS1", /* Also called VIO (1.2V) */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vsmps2 =3D {
> -       .name =3D "VSMPS2", /* Also called VIO (1.8V) */
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vsmps2 =3D {
> +       .genpd =3D {
> +               .name =3D "VSMPS2", /* Also called VIO (1.8V) */
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vsmps3 =3D {
> -       .name =3D "VSMPS3",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vsmps3 =3D {
> +       .genpd =3D {
> +               .name =3D "VSMPS3",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };
>
> -static struct generic_pm_domain ux500_pm_domain_vrf1 =3D {
> -       .name =3D "VRF1",
> -       .power_off =3D pd_power_off,
> -       .power_on =3D pd_power_on,
> +static struct dbx500_powerdomain_info ux500_pm_domain_vrf1 =3D {
> +       .genpd =3D {
> +               .name =3D "VRF1",
> +               .power_off =3D pd_power_off,
> +               .power_on =3D pd_power_on,
> +       },
> +       .epod_id =3D UX500_EPOD_NONE,
>  };

[...]

Kind regards
Uffe

