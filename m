Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D0CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=; b=QN++rtbZLLlioZvae2s2OZN9Xa
	kVwMOAnngezMAEwzDOHjAE1AfBBKajMjutUKW2fk1SBkxqZAjYLx6vlglBlAZkrRDoq6MtdIWxGRJ
	pMiG4ZIoRPdIF3XD1Bn6kl3BXBTZCY1boGyykxVfAlNU/cG+GPZ54vfOJpxW+/EX0N6DTCArisjvb
	sTo8pHxdTI80phYN0Ypg7spUmXrHpoC4mxJHpbs5zWbq7Pf5N2jnHUb2pel18pNHM0ZnR9mNbFyxG
	Z8CfSrpqbha9gAw+/3Xr3/E5Mu+Q6gSlAx5JTx8U6Y2lFDyw9H8pEoTS8e1qyvuuMHcGkqQCPg7Rz
	kabP3ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUQs-0000000HW5S-3gyE;
	Wed, 08 Jul 2026 15:43:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whUQp-0000000HW4s-2qEQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 15:43:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3ZCT2579769
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 15:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=; b=Gpi7Z0iHanVc4ewT
	7FQ/iOmgIDYfQPNsLWBPahVUdstaYgfQlDtGjG8VdQQA7J4awDImmOUNWK7vXyEM
	tSCOlLcy4XHryPydn5GaRVu0CuNO/LMFBPRrPiUtLOo8SoV/IcsywNpNveG3cn6g
	VDgjqyDZIdd4vgQqIb9ZYLZc55+qR8tBPSNrjrvHWDGsX/3Tk3aD30L/o2F4t6w2
	zphI+wMiWRJYxTClL0K5W1KWq+cUBGielBfTLp041HPpIH7eneORQez1UM2tN+J/
	M9UK/hSLMSNSRYjxhJwXnpci8Kuk8ap5IbJmXjvS3+m3abiBsrAgD6FN7RfdohoZ
	qd31EQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gbjet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 15:43:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1e6f602cso16274221cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 08:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783525406; cv=none;
        d=google.com; s=arc-20260327;
        b=SiiuzmsH1K9ck/RV1eb1dRb9RyXvoAkwMhvNS4EkW+S6D+x1m4Aj6m7XqRpufaPlpK
         Cpo9WkEuMAyzUXttrgBCe3OOGJQQdM2kjLyoWoOJ1FUvOIQpnRY1tnzN5X+bo71dS5Ae
         QLgIl6fuhuF8L3I6k49q/h+dIvAVOSadTMGdc0xM/UZCVEdT1AMGwCS4XBBLhTPsyj0G
         XZ/A2A26oc3t3KmH9U/URdOMzg9pFW/9p209+8r1pCEfQCRcufA2wfGETs93BuoQYjxX
         4xm2sz+8jHN3ICEo58Ooyn9eJHpvGxLUba1gwf4/JCNxluRkZgHtErImpKgQB6BolBMy
         QvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=;
        fh=ca70+9VlU+7bX4g5hjJJy6IgQ2xaH+FV+lF2ZBVTZbk=;
        b=C4ypA+5L+PkmFYzOXYmCYWe4oooAg/G284vp9hK+q0r5ADxCAD0MDbURwD7muZYQm9
         JQy9sl2+N3rcJrzcMGHSEoWBEVY2q5WuZ28Ne6ujpq9AW5diHSPyfOwqm4spSqCNH80i
         543TQBPpAd0HemCrJjkQ1MTlmNHcqGzm3xPqxsT8SJt1/7LCn+TukWsjux7cDrc2zB+Z
         LHcjb1L6NUMLoXCPmyfooouUc8PNw35I2vAfLIJfhi10bYkLUj7quxEvn7XeewMQwXt7
         c/82y7ybCxi3UFGO9jCoEWizLxajSkIEnAD9ZN04XFLBODC3UoLVw9Tjs/2SOqDFb65H
         wPVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525406; x=1784130206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=;
        b=RIVdQXs1jyISS27CgFNiDfeMfsMrkRBW5wS6UWicW5wsPZOVYWh3Xk64YaTfoDD/1L
         oaS0+IJwDBaxHaFImU2awy/5XURNBYEBZ2Uj5U2k18ZyY3tHgort8U4x2xT8vXzoje3J
         lp3EflaywRf5uPFrL7U18LPHNpsLfe1esHokYkuD5YUAuUSlGBgjYFIpzLSw5xSTvdc4
         DEG8WNXLvyJPl/FEBQWBYtgpHW47cODVRhxeemg8n4OwejdobEVboAioT/pHmr2hOvEW
         wSyoWeZDc2k5AOXSIzL2+vLtwxbEskwAHZBHbBRkd+j9Q0E53kf3qcai0VDVcd+Kzksm
         5nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525406; x=1784130206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OW7Jo5BTMAK0p//WyaSFrL7dEi1HJV9QqxfZvItnF1A=;
        b=fy+QdLA7ljckG41EKgtDDq9FTyv8bIWWO3cUWzfIhvH6+InCTVwP6d9pTtWk2b1gVn
         jZs+epoy5FdyNP7d4TpGf+JF4gUyXQkRr0lZMoW/cL39rznaU/1WG+fr+W6G0CzfMduO
         nDsVYBDeX6vXjVZssAL0qKsE9WIsLqOD6Fw8J13uWyqnB1GRFiDczINFdx8J/f0bb9Jy
         aRyt2thdwYuv9vT/Jv5Y5h9HdkH7lrfHYdFvNbI6vdgA2XBG85JwiTcBcNisju8WciWS
         TIpkSONeH8UccdpegMpux+Ijg9eUQV2r1kaJR7lzN8YKxf3mn/qba6iJN6kRXx2lhI9J
         hvaw==
X-Forwarded-Encrypted: i=1; AHgh+RqE7ovSR8yF+EvML5a7BCMoifLKSO2PzB/K1VNz6hmBjB85PzaVp8D99PX3DtGN4tI0vO6OVNZe3qUKnS6k799w@lists.infradead.org
X-Gm-Message-State: AOJu0YzvJF5LF+5gW2jt1QGmBqzv+bfjTGWX02N1HAOoyOAWEQlIXuo0
	ZDD2c0ha7B3c/vhL11EMxaYWKu8S4SH5c54RdoLP2D6BRQbMDKQ4cOnQrEbXsM2vXL85LlNF4St
	WZgiCK/UBiCt8n0GJ2vJiKVDFIstgQemcLokuVT1T6ft2TPyBqDWc1chYxdXsuMX6Q2ov6MJeBP
	lLhR4eAJcymWbVZk/BcFYckn+Z+DlcXYUOpV7c3/YHz/vBABjE093yDaWTMCLUwkM=
X-Gm-Gg: AfdE7cnYX1PdKQhv+YVt54P0xa4meYANiV+p35KtkXPS2+5VAQgLJJj21D1OliavuHI
	cOfrkhIA2uynZQG7s7hVtH1kkwNPpB6jaFW8hu4ZXegK7jOoZeNGUkSnKkjYwyrscm+3PiGBMp3
	CH6bLdtnvc90E6vWQGt6AEv6YUJsx86OcB6EsZxFUoUK5HdTpd76JccsyljC/hd6PU4jOu
X-Received: by 2002:a05:622a:4c05:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-51c8b398897mr31022531cf.11.1783525405897;
        Wed, 08 Jul 2026 08:43:25 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51a:8b64:69e0 with SMTP id
 d75a77b69052e-51c8b398897mr31022071cf.11.1783525405268; Wed, 08 Jul 2026
 08:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org> <20260618-ux500-power-domains-v7-1-v1-6-eb5e50b1a588@kernel.org>
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-6-eb5e50b1a588@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 17:43:14 +0200
X-Gm-Features: AVVi8Cdq0rtjAP0YSg4WhxzCqmLPP1um1vAPUHWXvoo9MmpPquQaWcjqsUHRPk4
Message-ID: <CAPx+jO-teiu9vQfw+MeTbixH4PnARaqSC+_7bvHUMAAEPqtDaQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] pmdomain: st: ux500: Control DB8500 EPODs
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX2h7m0V7plw4b
 OQnWIpSQlDwA0c5Em32Pxi0Z8+NR/chhT5PSbh1/0RosnEaIzA7EzPMZUAHMHPBodIX7W0wR/8j
 3ueBH47tAjJFb57PfTghnyC4QfqMUxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXwAD/EkdAFRzE
 3OaefLsCNTnsIevEuMMC77bv97um9pCCS7zjBkc3nBp1DtYdLmx68RnOcZUDTZxgHZN1rm7jjti
 lAozP7TtrVPpNJRyr7DdTDKTuZ7x944lLKV8SHfVFND/dbghiiTCenvjpdMwb0/GMRSmnkLrjrd
 1zxns4+XSFq0ZqZrrvYmTXhvKUtcHL4PuzMhFI/wIPA3J+fzDXy/K98S7NLGlTGceGBsIhDkhxw
 xQK1dOYA+fyoXDdmSHHPO1m02YnAKrW7Rbmm2b6WxREbh+DqSwD0EGMjRcPgjnru0MdP34DQegS
 tHX/kwUvyAnkPQhbSGnkm4h5LI/kTlF6wb475iU9n+Rz89ROuB21eOVyKFtBrGmT47qz9yseiFg
 cQJjC72JoaR3a/EO/PO16gM9+fgs/iUvDgTHVDaRTpoid3fkwwkZCC8NymkNlNe3sYw6LUtcqWU
 Eown0gkTNY30NvFeVYg==
X-Proofpoint-ORIG-GUID: aFyFNoHurHFw8k9-OfhbgUksgCxXWCHg
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e701e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=-O4hDVTBhx9-GJANRbkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: aFyFNoHurHFw8k9-OfhbgUksgCxXWCHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_084327_833759_6B31D033 
X-CRM114-Status: GOOD (  28.24  )
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

On Thu, Jun 18, 2026 at 7:01=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Move the DB8500 EPOD state handling into the Ux500 power-domain driver.
>
> Keep the old regulator driver mutually exclusive with the pmdomain driver=
.
>
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm/mach-ux500/Kconfig               |   2 +-
>  drivers/pmdomain/st/ste-ux500-pm-domain.c | 380 ++++++++++++++++++++++--=
------
>  drivers/regulator/Kconfig                 |   1 +
>  3 files changed, 282 insertions(+), 101 deletions(-)
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
> index 723001004690..1cd5b4985db0 100644
> --- a/drivers/pmdomain/st/ste-ux500-pm-domain.c
> +++ b/drivers/pmdomain/st/ste-ux500-pm-domain.c
> @@ -6,172 +6,315 @@
>   *
>   * Implements PM domains using the generic PM domain for ux500.
>   */
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/dbx500-prcmu.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/printk.h>
>  #include <linux/slab.h>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/pm_domain.h>
>
>  #include <dt-bindings/arm/ux500_pm_domains.h>
>
> -static int pd_power_off(struct generic_pm_domain *domain)
> +#define UX500_EPOD_NONE                NUM_EPOD_ID
> +
> +/**
> + * struct dbx500_powerdomain_info - dbx500 power domain information
> + * @genpd: generic power domain
> + * @epod_id: id for EPOD (power domain)
> + * @is_ramret: RAM retention switch for EPOD (power domain)
> + * @exclude_from_power_state: exclude domain from power state count
> + */
> +struct dbx500_powerdomain_info {
> +       struct generic_pm_domain genpd;
> +       u16 epod_id;
> +       bool is_ramret;
> +       bool exclude_from_power_state;
> +};
> +
> +static DEFINE_MUTEX(ux500_pd_lock);
> +static int power_state_active_cnt;
> +static bool epod_on[NUM_EPOD_ID];
> +static bool epod_ramret[NUM_EPOD_ID];
> +
> +static void power_state_active_enable(void)
> +{
> +       power_state_active_cnt++;
> +}
> +
> +static int power_state_active_disable(void)
>  {
> -       /*
> -        * Handle the gating of the PM domain regulator here.
> -        *
> -        * Drivers/subsystems handling devices in the PM domain needs to =
perform
> -        * register context save/restore from their respective runtime PM
> -        * callbacks, to be able to enable PM domain gating/ungating.
> -        */
> +       if (power_state_active_cnt <=3D 0) {
> +               pr_err("power state: unbalanced enable/disable calls\n");
> +               return -EINVAL;
> +       }
> +
> +       power_state_active_cnt--;

The whole power_state_active_cnt thing seems to be a leftover from
debug exercise, no?

At least, I can't see that it actually adds much - or maybe following
patches makes use of it somehow?

>         return 0;
>  }
>
> -static int pd_power_on(struct generic_pm_domain *domain)
> +static int enable_epod(u16 epod_id, bool ramret)
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
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_RAMRET=
);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D true;
> +       } else {
> +               ret =3D prcmu_set_epod(epod_id, EPOD_STATE_ON);
> +               if (ret < 0)
> +                       return ret;
> +               epod_on[epod_id] =3D true;
> +       }
> +
> +       return 0;
> +}
> +
> +static int disable_epod(u16 epod_id, bool ramret)
> +{
> +       int ret;
> +
> +       if (ramret) {
> +               if (!epod_on[epod_id]) {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_ramret[epod_id] =3D false;
> +       } else {
> +               if (epod_ramret[epod_id]) {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_RAMRET=
);
> +                       if (ret < 0)
> +                               return ret;
> +               } else {
> +                       ret =3D prcmu_set_epod(epod_id, EPOD_STATE_OFF);
> +                       if (ret < 0)
> +                               return ret;
> +               }
> +               epod_on[epod_id] =3D false;
> +       }
> +
>         return 0;
>  }
>
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
> +       else if (!info->exclude_from_power_state)
> +               ret =3D power_state_active_disable();
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
> +       else if (!info->exclude_from_power_state)
> +               power_state_active_enable();
> +
> +       return ret;
> +}

[...]

>
> +static int ux500_pm_domain_add_subdomain(struct generic_pm_domain *domai=
n)
> +{
> +       return pm_genpd_add_subdomain(&ux500_pm_domain_vape.genpd, domain=
);
> +}
> +
> +static int ux500_pm_domains_add_subdomains(void)
> +{
> +       int ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sva_mmdsp.=
genpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sva_pipe.g=
enpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sia_mmdsp.=
genpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sia_pipe.g=
enpd);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D ux500_pm_domain_add_subdomain(&ux500_pm_domain_sga.genpd)=
;
> +       if (ret)
> +               return ret;
> +
> +       return ux500_pm_domain_add_subdomain(&ux500_pm_domain_b2r2_mcde.g=
enpd);
> +}

We recently added a generic "power-domains-child-ids" DT property,
that allows us to describe child power-domains for these kinds of
cases.

Moreover, we have of_genpd_add|remove_child_ids() to easily hook them
up when probing. I suggest we use that here as well.

> +
>  static int ux500_pm_domains_probe(struct platform_device *pdev)
>  {
>         struct device_node *np =3D pdev->dev.of_node;
>         struct genpd_onecell_data *genpd_data;
>         int i;
> +       int ret;
>
>         if (!np)
>                 return -ENODEV;
> @@ -196,7 +372,11 @@ static int ux500_pm_domains_probe(struct platform_de=
vice *pdev)
>         genpd_data->num_domains =3D ARRAY_SIZE(ux500_pm_domains);
>
>         for (i =3D 0; i < ARRAY_SIZE(ux500_pm_domains); ++i)
> -               pm_genpd_init(ux500_pm_domains[i], NULL, false);
> +               pm_genpd_init(ux500_pm_domains[i], NULL, true);
> +
> +       ret =3D ux500_pm_domains_add_subdomains();
> +       if (ret)
> +               return ret;
>
>         of_genpd_add_provider_onecell(np, genpd_data);
>         return 0;
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 87554ab92801..35d1b191462c 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -414,6 +414,7 @@ config REGULATOR_DBX500_PRCMU
>  config REGULATOR_DB8500_PRCMU
>         bool "ST-Ericsson DB8500 Voltage Domain Regulators"
>         depends on MFD_DB8500_PRCMU
> +       depends on !UX500_PM_DOMAIN
>         select REGULATOR_DBX500_PRCMU
>         help
>           This driver supports the voltage domain regulators controlled b=
y the
>
> --
> 2.54.0
>

Kind regards
Uffe

