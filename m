Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75205C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=; b=D39YL1ev18/SxJxHXnv93sqqXg
	UzOimuH08ZfaVeyA51kCAF3xNJZDCoHID6YPKnF5IUZTEp6Vno/FHmBWQA4x/I9fT4XZCOm+qIola
	8pWQjS2y3lJjTSw70OH6y2hzExzgDv9gj3oJWrxnae5ETpwHIczUheu7roRHoJM7kCPlnHuVbXpBs
	/QSjRdqm9JlpWf7FyFGUFYL46VhB5SpQNmVZ3Zzs5UrhajRUEGZILF1Abmc5LK7pKID95RCUYze/J
	vIyys8bEReE7UmMo+wNZwzfKSSsp/KhQbyYBEBTvYVxLNtClAjRHEJTdHJ8pYWTKyW3osQbhuNkHr
	uubM+IYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHU-0000000265i-3eBy;
	Tue, 04 Aug 2026 14:38:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGHS-0000000264Q-35CO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:38:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXthP3896331
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 14:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=; b=bnJhHFml3sy2gaQz
	Ci9sZKYL5yG+Oj4FnR8ardvu1diFIEzPYOoDyi2MBDkws7UtwGx5DdY4SbgkVHM/
	rjB5F45uD1naCjeUuhfE2hn720XV1fP5rhFMk7CagCzppXhXY9cZcMcUHdpWF86k
	ang3AV6bobCsHplowoD7u1DdABblZtmgz4KNFHA7HmBegrvSLch4YcMlTB5u/3Xj
	V8wxWuiAavYP36IHqXQrqdbBJudqfgADLtBWEp7wSnwmSBkAgYPN3yJBEqYWu/gE
	hH6v86h/WN2eKhRULlmY19wxzW1YrgPDQPg6s+DZnZEYW3RBIQh/W3rQokgGChoo
	5pegZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8c4qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:38:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-904ee4473a8so46534546d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 07:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785854289; cv=none;
        d=google.com; s=arc-20260327;
        b=mLax7h1ibnErBQ35thEjxutqS+A7xq2YOF7nd+0duw84m4FyxiCxcV/HRECwQmN8nQ
         d7EDpf3n6t8BVgvfLjRzAGb9JkCtrJOipvzeIk6+fdlTvR/xP6dKTToD1O2uL+DFR9pv
         +RaUm1UMK2kvWrNT+B6y8VdCC/Or31DUxoBulbCryQ7/GTqnu4MhFX5AMBjxpDRXM4db
         yVJpGsDD1opsr2AkOa1MEH1JBdOqhUdAYaCCWya6jnEcpK8hkKyA5RS2J6Xg72yPF2TV
         5MiHWRzqtJ3r16teSiPSvT5SdiC/aMYpykF2vb3DfAslSC4AxoFNxHLOvroqD3UCdlUi
         uJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=;
        fh=gsYs8sw6n+VP7jsZjC9dw9vHSNyBSCL/8evN5cuBVNU=;
        b=SD0c9NoRos8MZKlOuHbiGPmjararSMKvv5cMhHBW64Ya61lhZX1YYIY2pKBWoZKMx9
         est6eFViWUQRFmQd1QsPcO/ZCl3+SQOblS1gNiqQHrEmltO9jZMwkNZqNeBoTNAhLleT
         J0DNGOD/fud9wPqEqr6b18+wwf/HqcnSj4j4dZf0IOlEKVX/dKDepkylSD3rLTY79eeS
         58xwCy9DqWm8nfWgIdhCl6/u/8n/Fjn8yZWF8IrvZTb3+dyt5tPIQz9Ttd5S6Poz9VL5
         W3CY/vQyO6KMr8nDKjnyAP8MIy9Dy/4zm6tZsefdwwxJY5Vmc43MOum/ZgsuW4sSEiUL
         hz/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785854289; x=1786459089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=;
        b=Q6/SnKwLDqEgOzEE8MTseRujTy/syZgADYO69wS9BE8l08chNNaD6+2kpLNURdDFsM
         cBsAIjilk0+DycvvXZZVHcdgEiF5UXTr6RMkYV8MmM9LRL7uzBkAtf/aDSXfF4j8D1My
         Tfr7Ht8+v+Nn/od6m4ujNcAU1xdLfBc+240hFY/xT9Mc2sB4nNnRkRidyH7UCCNcopFc
         9SwEdrqkr9PkU6R1s0NI32BCkIDQvome1777CQR06meB7/hpMT3uUfIFvcm2XByLxF/T
         qsiMxBLav3P6PJqKX9hnXXFAfnYmzXbJMOU9YQ787hqy8Z96vtH/kVRKW4OHQacsLF4j
         IamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785854289; x=1786459089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8ixtTzRipWSng2lUt2MxnHT7dTmpb44so3J9utVvq8=;
        b=ANB0S1zfRzxXkCqVnJt8wXUO4K0agwYaHrkcDYkuUb60HbFMNgaBi4gdqwF7Aa5/OT
         7Dnr6n+H7LMybsbKBRbiXva26W0YmMtfA5NfCvTzBwYcW00VGrwEOQ9KSf4jCQgBQ2v4
         cM5UzjDnDe2pDs05IJk18xtmB0YuCiXx1eFz8JemoG9fjzW09H8kRS390peSciLCc5tv
         om5TLS+ZtJtwZSl3ktp8T3zkNkI2YfhcJbKjSyuzZQ2aRSJHZbcdyo1I4tzAhJKZkh/i
         DTxz03Ei0gSb93wLeC3XEi7hteLi78cYx00ICUVNl8HN37QalQqHvBImIqCL/HrvLgMc
         QyBg==
X-Forwarded-Encrypted: i=1; AHgh+RoXw1LIzIQXmcSeX5FWCmuKabCtHxhf6zJyEzOuNcDHJyK6sOsu3dR2VEuLqgFJPZ3sYAt6q6XDVinwQqw78kbm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6LM6z8Mea+Dld92wugBzox4Be+tUBPzXRFoiNksisN5DGkxNt
	QV0/aAQFWC22R55aQw8D23kVo76Z85yorbGnTBfJxJymbey1Z2E8KIyDR0T9nZVfxtxDnFuBJWa
	l37b+fqwEcZGZ721W2bo+be3e+3WpLBKKA8P/AlGzga2d8xO75ilu4IHZCrPdXIKC4w5xpbzOUs
	QsKC+qmqLNtWQtrDdiDDI2wcr3KJ+iKUBB7+8r110MqmkjHtqqfvOp
X-Gm-Gg: AR+sD13wJ4CeWmL5BElZzqxRYG+zHSGFrVAys6cP/D2V1BA2++T2ELlcq8MJPFjXZsX
	Wx2P4EmGO/J99UpX7CBI39uVGeYij1hc1AHSEfisRSe/yFbzejTpNXNBmyj0shED6F+73Ady28H
	ZCDvYiDwiULfzaD4sxDMVNlxOxR9zVn6dlhsBgai9w454qEIAsQAwFkFPpeA==
X-Received: by 2002:a05:6214:4009:b0:908:1bd5:9c38 with SMTP id 6a1803df08f44-9084957bcb6mr304720046d6.14.1785854288952;
        Tue, 04 Aug 2026 07:38:08 -0700 (PDT)
X-Received: by 2002:a05:6214:4009:b0:908:1bd5:9c38 with SMTP id
 6a1803df08f44-9084957bcb6mr304719426d6.14.1785854288513; Tue, 04 Aug 2026
 07:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260729125907.830090-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20260729125907.830090-1-dmitry.osipenko@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 16:37:57 +0200
X-Gm-Features: AUfX_mz-i8dB5SWfHvWpOVnVTkawqldOEJi0_Rvnt1_rX3o7xhgWlAFvXqEMTd4
Message-ID: <CAPx+jO--DskGufFZyhObH_t+H_idykV0gBPqPC6=g5uFUAJeRQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Fix mt8183 hang on boot
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71f951 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=QX4gbG5DAAAA:8 a=W51c6IlItZHyHODVoFAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX15s5YVICGdBm
 ez04S0giu2FwYQTUWe7X8lUj3Z5dufvtc9M0PkabWdEx6OYJHLbFNpCF5E+pSEGUwo8G4UOE99k
 AGw+JDPChTmF2xW5hPkq+KECE2L7CjCYFPYlQR8vD2RXwdeHlp/pMga8ZnIrekyQJWUR+E2kiO4
 ObhZRLVPMlCxx+EgDvSQwxIAC1qlaSGzYjK+A00Xg7E54MSISLqXEPiRlRq+fwkeUKHKgWlESml
 C0d2Qb98v06LYmKapNq+egXOZbiun1gs6KxWunijfkGcCA96F6rs9X3gIipJDE8g864xDXI50gu
 ggHa0exh8DaZ/zm1jh2/6d45095pvto7fmYrRxlGOsSbLCaBP01HFLqBjYQjrjIbUnPZM9bLUKk
 6jGo9VcBSFbUcWgLReUvAYTq6Qxpg+Lfemxqn0BqBbo9CMXrmR4NTh9WCdzy2mpEaTP/ZVoPSoN
 0O1QC89FJC8WP8VTjvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExOCBTYWx0ZWRfX2n89eEfK67GF
 7As67XGQhXWVJbjmiwojZlQe2W0QbnDfCSwDIhzmN5c0zRJGlQpc0ODhQC9H8/4ZKRoRU5mHhYr
 hunn7iYHv47C/ozspXyvPBZdv/zMPZw=
X-Proofpoint-ORIG-GUID: Tb6gTAVv7K-1_NlBJLaMu0yiLgiiRMeJ
X-Proofpoint-GUID: Tb6gTAVv7K-1_NlBJLaMu0yiLgiiRMeJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_073810_904626_6264C82C 
X-CRM114-Status: GOOD (  27.81  )
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

On Wed, Jul 29, 2026 at 3:00=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Depending on firmware, part of the MFG domains may be partially left ON
> at boot time with kernel detecting PD as ON, while it's OFF.
>
> Some of MFG cores may be left powered after bootloader, to let the ACP to
> prefetch the GPU region when the display controller is brought up for a
> continuous splash animation performed by downstream stack.
>
> This doesn't play well with an eventual delay in probing upstream Panfros=
t
> driver when the display controller is fully set up, as that would make
> genpd's sync_state() to power off the domain while ACP tries to prefetch:
> this is causing an AXI stall, effectively freezing the AP indefinitely.
>
> In order to prevent trouble from happening, the sync_state() functionalit=
y
> must be obliterated on all of the MFG domains: while this guarantees a
> power leakage if the bootloader boots the kernel with MFG PDs partially
> powered on, this is the only way to ensure stable operation of the SoC
> during boot on devices with such firmware because, of course, those will
> never officially receive a firmware update.
>
> Fixes Kappa Chromebook hanging during system boot.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sy=
nc_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until la=
te_initcall_sync")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>
> v2 - Expanded commit message with more clarification about kernel wrongly
>      detecting PD state left after bootloader.
>
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

