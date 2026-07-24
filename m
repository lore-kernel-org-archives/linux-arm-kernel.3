Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93100C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=; b=dCI7mZYo0Vkunh4xtIaxnZRZ5S
	UitZ7ulBXEwSUybq8EWoRTmDiRsLBKVXkgur2hXan2ucxv5qwzo23ap6tmRN7hPpBn8vMcKUl5Hv1
	RwntF/xqR6HtwvRXnBD/hCYv2kDSK23cR2BevDJYdKYjQBpTF99hcMU385NglsO70Il1iVCwTB/Uk
	v0JxQTtdYsonVkb+dZkoGS6qiKbTVWNsEsDRyx8pUBKkkNojSVe/ju/ZNVuejUwY4CcwnN+dJ3mfF
	CKn4GJesTl7OujuPg/hBHxh3X+mGyEQUvSsoixbBNs+scWbtVj/5S2Q9lltOyoQVSRo2gBD3a+w3K
	ZNpJ2v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHPK-0000000GdIt-0cXl;
	Fri, 24 Jul 2026 15:01:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHPI-0000000GdHi-0N9r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:01:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OEHUxw3467953
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=; b=Y4OGqcDoSP91mLoj
	Ie/WNF1TbGYkZhheGKZuMX7DXMpAOzWGIEIkPV97Pilj/04TI6bPRTjT7cwbc/dR
	mdNLx93Phh11sEc9a9uh+h9xGPWpE9wEVWkFPD62qsIkVp0ewA/IvuCopDh9xPRf
	Odv/D+eUk8/HMyqxdQfGlARylz7WlM6PPSi/GE5GYO2d6LFBc/To4woo9XLp/W68
	9pneAbBjBA33iRUWbUF3T/kqgkHKigWGA8ORqYjSPRELA8hvAma+vewxRqXomP1L
	WjTEtCcONNzguVikCaGnqoQ6IeWIp8rj5XvTYrMOYYsbEC3tos5PNrNfYPTORVw4
	UM4FZw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd05w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:01:46 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6ae12b42so5700107b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905306; cv=none;
        d=google.com; s=arc-20260327;
        b=ozugX54IbAW/jEYFRuGlnUxspin119ZmQUDssPjpaU8SIFA6KKJTpVusoMd72uy7zu
         GxF0wzhO2SVpnR1bZMpeIffGBNaHDd4vCEeFxgM8TMHV/tNkayaQnQpp4QzXXrvHWBOP
         ntcWA1Ff7odVVe/ou8pr1txmdzyOD8/r/tIL16e+ZsbRfliUH3mW+tLCwLNzU6vPXb+J
         qO8lXkJeKPFGD8c9baPO2Kwm8JHJtoW5Py+XdK/LwU4VSX8tbpdaFyezLSgH3Wz01+pB
         s+TUdIM6ZJ49/S6/6UxlHlYt2Sfd7f7KNOVdi8PKrxaiXg38l+GfWngm4ff6GLwpcQ/1
         faDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=;
        fh=5ZBWhCmGwny/3LumlCWBxBjx7iFNm00GEfytTK9Wm+s=;
        b=BjfyOCyAjCeXAt/3hPL77rCz1tjjeXd1pIdx3gjnzZ2DE/Mp4+3/GcgIQRnj9/cgwe
         bVNa8gREM0wqDl1pXePxJ1DL53lhWHwbX+3/H4spkI/SmN2x79YZ4PZ/OPyZv1VH4iLr
         AV+4BshzYSnP9v5ZW/MkTCqndmNk2n72QwVs+rsJvWSBKbpUMWgP8037PvOtzrixt0tm
         BKVOUKd5fBIO4t9SWJq+ib2YlZDCFY8uPWC4B/k1ilArWguP8pZzpi5cIloI5oBO7zFb
         2y6Qs/Cgfv+CA4j0S9vSfX2uXaspEkBLjh6abH4bEvElxy7H+34m66MYn5wHkUl/4rWP
         bKVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905306; x=1785510106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=;
        b=QyBaXfaHi50uIKJQEQfteXTH+gbC9+q6z6vvPfLx0bzd1UiN0Y2RCD0ouHhKIBS6LJ
         X+6yOJMkjyvDNluQzU/K3TpDTrdwgPlOWXZ//LO+e6iM3hEn9/RtPv9QUcmO8HThNI9q
         5PL8ZUfsKcbB9M174n68KKdcgNMcYkcqpPHhO95T7sY6jDkgXss2GD3NSRKdL9dMOSNF
         FE3omTxZ/hb84e/rO6Rd4l8TWPk0+JB/x19qyY9WwVU3h3Wc0ulhHq7LGOyeCWOoqmke
         tZr3bTg1MQHS/nwHtuh5z4X17YYpJB5Axn2DIhtLxVKIipCz/O4cEpfEyu7FTJmuArEl
         YCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905306; x=1785510106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uD+5izwod7lzNMQrYKeunGpTKt32Jca4KiCQa3SdMss=;
        b=Pvomi5r6niX9tqUvQAZ+hKwWHi1jAMWRwcnHd4ZVWRceLP0hanqzl1o5YcYVtG6U/i
         6vyObw0QjNSLrHRZ75HV01gXHN7UCGwWAaSYl+GH40MGMbxnxhQLXL38wG+hsxLrTBtA
         BnEMHvmE9qo1pdwonzD7lG3kRqBXVHIPdh2+4yBVTlbGGv0x9B2oKiDaZhm23t2DM2mJ
         5GsBh5brD5JJBknQOHJ+1pe/UlcQtHI/A+w+U/e9e69/AxlErAfJCKw4Rj20c15OsbI/
         Jppf3v1rlO3lAgkY1FO7EE7d39qxzmR1RPKHPyqcVKk/lS7muCDOicKsj8AZ7xGkK/JR
         6/pA==
X-Forwarded-Encrypted: i=1; AHgh+RrX0DlWaoRM/oDi/EEOGIuIBWkwUngo308m2MIy3xZHpG6tSXc952fZYWfG1jXJBa7YQXIBPNXI9bHTABDm5IwE@lists.infradead.org
X-Gm-Message-State: AOJu0YxS9eWvoMl5NxhCWLBt6R2/vbdK7f/Ias1Xf6w4wyvl+7Ls+WVC
	rY9LI6TRM3SUt5o/EmtUTmqLziUz7mUeZkPr9fllz5km1MSdsq0CJYC+PIGzJ6Qq13GM6h4YA/+
	KYR3Q8//iw8faD/M92uommoBL6vSBrb6EJUISTNaQdYcDp6k3dSnvPoLj+Qz0xeuUdobcYcZJb0
	9fYwPC5fIpfazHCgQuAMUS4UbN1PUGT+vICHtmXpGWm1aKa3uF4BZ7
X-Gm-Gg: AR+sD13EBCXRuVDbfA9WlWrojKVd/qaGOnYf94KE7wxsEswRdXCOFp6MjHQQQG2MJAZ
	11ON4+B7XhAXggbNKsLFsjNU0vvDsI4lD8IU1CyrFJwozG1TsG6UzdtB2yrl4Ex3z5Y1Edg3MLY
	CEjVath8HcokcTN7E36SlrRmgdBdCNsErPaKSdz5ZNA+fsZgM7VvL9qii50A==
X-Received: by 2002:a05:690e:440d:b0:668:7e4:aeac with SMTP id 956f58d0204a3-668a504e648mr1538829d50.106.1784905306073;
        Fri, 24 Jul 2026 08:01:46 -0700 (PDT)
X-Received: by 2002:a05:690e:440d:b0:668:7e4:aeac with SMTP id
 956f58d0204a3-668a504e648mr1538798d50.106.1784905305595; Fri, 24 Jul 2026
 08:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:01:34 +0200
X-Gm-Features: AUfX_mzjLOgOcCUz76_T9HJlbASNTyiIQVZ65cjhf0ZB5m8FWwTsm9XV6DD0K38
Message-ID: <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com>
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: x75fEkWJ_KsSbpUTF-5xniEkNjrv5OjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXzqXe6ChZmS1H
 qSaILGJDMpk5di5NOcUrqG4q1xCjuaAaqBnPzv+TGgM8UwoC9d2Wzs0/g4/sL+RhiTtg62s/SWp
 dcz5EYDEIftDc+O8xhiDirrHptfXTfjcJGakTvsFB91nEAUvLFopODl3vxqtSkzw9qjsGybJuBi
 YA+spkaUjy4QRJirHrC7GLJKN15taz8SqWVftp4TBrIjRbRZzaOqzIRBqRIX/fC4M6sIdNR2hYJ
 vR05cCAvWLnE59DTmk9psqq8A2/lB8tyo/z7OYZLWVMO2CXNzzLmcShWk72x2spCWrV9grrIxpy
 BiaaknreVZru76ycQWNvqv2NupPrQUtuO5KB/pVegOKtYYaN8kZeOFR0V/k/NZLCYJ3JM/Jt8Ls
 APef3hzIef2dHaEW0dd6k+RVNxyUNoFJLQEuY9DugrmHhXWU9soCapQE2Jw0QACO4ZrRGQL/Yln
 BjLzJ/sHszzeH+7frkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX0bcxM22AOxzg
 ZtqJ2OQgu+j4xlZtoQuBIghhwdwHPiBusq0zHNTgJSQhAwfLPXmrVQ6nVme97OYeh/b8BFggw8c
 LP8nF86UpU/ptY5Mkvn6ZsQuMu0ygu4=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a637e5a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8 a=W51c6IlItZHyHODVoFAA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: x75fEkWJ_KsSbpUTF-5xniEkNjrv5OjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080148_265496_A3CA5FDD 
X-CRM114-Status: GOOD (  26.44  )
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

On Wed, Jul 22, 2026 at 3:28=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Depending on firmware, part of the MFG domains may be left ON at boot
> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
> region when the display controller is brought up. This doesn't play well
> with an eventual delay in probing Panfrost when the display controller is
> fully set up, as that would make genpd's sync_state() to power off the
> domain while ACP tries to prefetch: this is causing an AXI stall,
> effectively freezing the AP indefinitely. In order to prevent this from

I haven't made any detailed investigation, but to me, it sounds like
there is a missing consumer somewhere.

Should the ACP/panfrost devices be a consumer of the MFG domains as
well? Or perhaps, if the ACP/panfrost should rely on the display
controller to be probed and powered-on, to be able to probe?

> happening, the sync_state() functionality must be obliterated on all of
> the MFG domains: while this guarantees a power leakage if the bootloader
> boots the kernel with MFG PDs partially powered on, this is the only way
> to ensure stable operation of the SoC during boot on devices with such
> firmware because, of course, those will never officially receive a
> firmware update.
>
> Fixes Kappa Chromebook hanging during system boot.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until la=
te_initcall_sync")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Kind regards
Uffe

> ---
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mt8183-pm-domains.h b/drivers/pmdo=
main/mediatek/mt8183-pm-domains.h
> index 3742782a2702..5e33b8628e85 100644
> --- a/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8183-pm-domains.h
> @@ -47,7 +47,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D 0,
>                 .sram_pdn_ack_bits =3D 0,
> -               .caps =3D MTK_SCPD_DOMAIN_SUPPLY,
> +               .caps =3D MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_=
OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG] =3D {
>                 .name =3D "mfg",
> @@ -57,7 +57,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> -               .caps =3D MTK_SCPD_DOMAIN_SUPPLY,
> +               .caps =3D MTK_SCPD_DOMAIN_SUPPLY | MTK_SCPD_KEEP_DEFAULT_=
OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG_CORE0] =3D {
>                 .name =3D "mfg_core0",
> @@ -67,6 +67,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG_CORE1] =3D {
>                 .name =3D "mfg_core1",
> @@ -76,6 +77,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>         },
>         [MT8183_POWER_DOMAIN_MFG_2D] =3D {
>                 .name =3D "mfg_2d",
> @@ -85,6 +87,7 @@ static const struct scpsys_domain_data scpsys_domain_da=
ta_mt8183[] =3D {
>                 .pwr_sta2nd_offs =3D 0x0184,
>                 .sram_pdn_bits =3D GENMASK(8, 8),
>                 .sram_pdn_ack_bits =3D GENMASK(12, 12),
> +               .caps =3D MTK_SCPD_KEEP_DEFAULT_OFF,
>                 .bp_cfg =3D {
>                         BUS_PROT_WR(INFRA,
>                                     MT8183_TOP_AXI_PROT_EN_1_MFG,
> --
> 2.54.0
>

