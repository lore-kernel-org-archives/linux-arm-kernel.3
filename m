Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D543C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=; b=Oe5LtaAlnn1WoyiEHzfdUpHUPf
	M+uT5hv9/Vi8N53bcblp743yMxuaTnzgTKFDBU5WNvGMJv6wUQ4IVYTUSp4Qcsatmh28hngs4wL2K
	GUcG3LD9ow3Uumtbac+TodWYvRFGhd0NNS5xodBitFH9qTK82aoPJCfUksoiuW3WkDzVfy/CI87GQ
	P5grcHoVNlhkULDObcLbGL7Aaac+aqBPdrNhwcrqBvMWDkmoJF0Cs8POSV7eg4gnLJdycP+tSFVGP
	2kNBw8ZHlr2MdOk+dKoHUXAzEGJswp4Sq0Dem0En9obNvxFBScONOdgYmY3arsUcLwrm3dEleMGki
	1ThNn9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiYa-00000005Rab-153o;
	Tue, 28 Jul 2026 14:13:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiYY-00000005Ra9-253q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:13:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDP8Ro3030426
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=; b=O+PRf6Q18rVeH3gY
	Uqkrus2jVtV3oQufriVv9zWcJYn/SoAR8gAygIFWUsnAykxqY3vVLF1sm0gUjS7o
	AyY2f+mkCOlxeFH4WBC9dJvdTWHIY9gdQelpzzjA8ETR7kOW8ag7/wHOW3RD9brZ
	MnF+p07UPtX9d6TMbcukCuE/ru8WReKLW3rZfo1kJRYJ30xrzy7VrRaeye9XBMcj
	IS1As90XUQoOvLkQ8dv1Rcg79maqZSKrkWP+hDObgIQcjMsnmJ1c/JgtzUSuCo3d
	XTTVOF+y92D03yOh+qD5PSZ9hKTWrVU4Nna9a2kVtHDov80g3W1vTU7f5RKW5hiy
	MvdUVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvtv8ccx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:13:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b6bdcb4fso596310385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247997; cv=none;
        d=google.com; s=arc-20260327;
        b=iJ9NAKdCCKaB4JaJGsh+Thczo7FiRQzszOkjj7Nmv/1TawQ6LQrRN7KPmBKlvxo6FN
         heMFIkhe+klqHdnscdfYl0tofeY/30trA7Bcd0+ViMPQ9fc00huoBHFx3s3mKATwavBh
         qDQU6EA9HnVZTRKg87PHQSd8cRTZfyWaJbqm69GCZusS3YL5d5sE8eKIGndliPUSLewj
         pLFRgpRVpuiryblQAe31dPNrRnI5363C9Mu0Jjjknk0lso8DPqHVehSx/otL1kKClCp7
         OT2LYYG2uvu3T55qHqhyh8RKZtW6OCj27rIiwtiQqHDGZWjecYVT/XRvB4bspJ2jUP2i
         /qzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        fh=X3Bmwx2vWs6HP01OqSu+kzOshjiI0jKbLpQz7pDCd8w=;
        b=EQdnV6Rz+BB0hLBNKsm9hVE/sewF/T1z54Bnp/gF8xjPM7MzwILuqCjjdSYTFNKz/V
         kfa/GAKTSoam5rrKrfZ6Hl6gz89C2kQB2m/8nk69DASWlnxxw4g8v6zFNk3Tuour/dbm
         xmuNXpjVbyKo8ZRLHfd4+j+cNgNm2aoNRWRifOZkY+Ihs9dXenq5TqNU3p+JjHcz05kX
         Dpi2UZv/KUJiRia0ct856N2rpkSiKGlOszPoGRZZzidyfCJsHDuyizH2OWyix7xqMYRN
         /4aE7KC9k72cwIfdgiS+AdawqEFCErYM2D+F1iEDxKtTTHij6RCYZRwIU6QA7GG4T91z
         ZiBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247997; x=1785852797; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        b=L8bSu319yZ3/8nr1dc5PBndie+Qkccb9FRNI0uBHNmlsmOUk0lWla8W9gbFXVdXU6Y
         3V5wtdNHZIWZXG3ppTR2gYYfIAOn3pcFeJJFehVjEbZQbqNh7dhCDBEGn9WAIRz34Mt7
         5j3fJj1Ro5whQfmCf1V0Tu0yBTKVM9cY8PvpJFYUJiXrfCgs41bzh2Oo3xZs3CEHW+gf
         qSVyDs0vVKLVyM2PQoOwhwG6jNt494TntvQ/AGwnVlkkOEu9hN4qN64sZntKlqKJhieJ
         akwuRLipy9FKFNu7h6fjo0wclIre2hqJGx5vyneM1+xlQT01VfRq3r5y1GkFtjtIYswZ
         gMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247997; x=1785852797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXyemsWnZ3q9NF+uPWcOp+prjYyPZwTFCjD45rA2xa4=;
        b=bGhVaazIAhSTrwPN5vm3YU+1mHR5RcivXniBMQMosg2s4sXeNfPv+4bHE6pmDBp5+G
         +Lzpnw1sa6EAwCoFa4xbS2pvSV6fpwxfvJ5DBj2QFFlu/Kp1Ze+lWww4oFByLrSd8EaV
         JhtpSq/Q50PIHCs80B/AWCA4p7NlNy5b8G04c+XSGcwi0+YoQ+aPO4kpCxrOOi77NqGT
         USMVSuqv3TQ5cezW0BGhSPQg/fzZUT9FIHLQzzvvFk3tV5CncHLj7w5U3RLBTwDfa8o9
         rERv3NGkiNy1tLdauIvD88Cdpmt+vpWhO+HBrMu1Sp5IeuVYHos7McdgSyBi4U4Tu/OQ
         npCg==
X-Forwarded-Encrypted: i=1; AHgh+RocFFie+9drJyM1phVPgYA5Mf/zNmTbCwJ+6kKo/i63A3ID8MjeVuA748raWr3ZyGOReptrACI/7bNPqDD0NrzL@lists.infradead.org
X-Gm-Message-State: AOJu0YxCu0vXy3beoI+mkVT34UAXdJfAGHV/SdzuNR5+9bOmQacarhye
	6ZX0VEXbo4WP8GeU0A2T1VRWBNIO8KbzHmrQOGBejroRNov7cfmD/xavN4skLBxjozJRKlSwI72
	qQDHHQjY51Wsi/7Zm1LbxjchYD8AnMAH2/+gOnDKvBoOeSI8ari30F1wtL3jBKkPkNfDwWj1Wl7
	D7RgXVPyEfxlOhA2KA+DzO0jgU4viY20xtOlIwM3gn+3KQojn5oQRC
X-Gm-Gg: AR+sD11L0eijknASAx9SQsHGb7mL4EmL2xRe5BbpOIH8WhcDV1LXfLc8i/VH8ILtt2U
	33KQEmR5KZTje9Ev1zD1SqRQENSkjdk4zdSCGK9w7kT5B+29nQdwDWEjWlhgMsHLDCPbiusRlWd
	uPo5ujdpt0NfN6wovXAgrARMhap+wDN6HpYWOx1fCNBxTlLSLB/iqX9LsV1grCIhNQKVHTU3Vg+
	F8I4xMjZSMx2Aj76CIyRRiicMkPi+P4H6rGiuVt9k290mMQ5dUpKefLMNCX2AkiooGlVIRykis=
X-Received: by 2002:a05:620a:4154:b0:932:f1ce:9a1f with SMTP id af79cd13be357-93302730834mr223456085a.56.1785247996425;
        Tue, 28 Jul 2026 07:13:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4154:b0:932:f1ce:9a1f with SMTP id
 af79cd13be357-93302730834mr223449685a.56.1785247995855; Tue, 28 Jul 2026
 07:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:13:04 +0200
X-Gm-Features: AUfX_mxRAoOnuuKFN9kfgl1STgWBnsdv1V9nVK68cViEsTLyUdBDzyYhHSFuho8
Message-ID: <CAFEp6-3MR3v_+3rMhi3wFRCPn70e_=fXp9o4tQ5oE0RuWEHSfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Jacopo Mondi <jacopo@jmondi.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Robert Chiras <robert.chiras@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 3OBgVUbB8wt92hdkhRQpSuYOCnIsGugw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfXxgIJgUWkEXfQ
 od4Iu8CCUgNEhrxLVoNL3iDnzfTZj/zCFKr2B/TZZbBrsX5+x/lvslHqh1nvosZlH7Q1MQXRmCq
 FblyrewF/nbSG0vs+57v2i+bthwiDbI=
X-Proofpoint-ORIG-GUID: 3OBgVUbB8wt92hdkhRQpSuYOCnIsGugw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX98tEvl0RbDE0
 xHGjFEZqgNuZIVS7uZnJIA96W3GfAtyk/4VZqXsbjISJHM06IIyqAaofdMZpJnb3dkTKWut96TP
 YIE7e/BCZoRm7N7Ry+abtKatA2uu/Pso9QFCg3gEGxvNacsAyV7PILgJwHPdOPocp6ZtCJFBtSQ
 modVTg6EzSL0hnuDTwLYJ3BAZEbPgUKw7kiYz55hGLMddXLiQZ28W81fndlTcIg0a0ynx8mCd7M
 ElxTFvB0sZiYG0kOKfHCtioO7w36dZ+DYxSnwu9Y6aqicgkczfQIAnbjy6c1Z0pKbH/tE2xvpUM
 EpZd1Ay17SqpQDdhglXBKlSIBVNbu8EytyORXG+O2mFI27nA+7MLmQYTB4MkxP6EtxGJ1SF20LK
 zRVx5Cj/3HcflHgDK/+WEiNk5SqXy9q9iuNloVqVlR98mOuEWIw8N10ZIJfclP33Z5muH44fMqE
 VtOW6TdQcf1rcajKrog==
X-Authority-Analysis: v=2.4 cv=dOiWXuZb c=1 sm=1 tr=0 ts=6a68b8fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=TKf_yFmVHvvbg1ESzF0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_071318_653990_FFC791BB 
X-CRM114-Status: GOOD (  19.68  )
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

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.co=
m> wrote:
>
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010).
>
> Formats with alpha channel (BGRA32, RGBA32) only support capture as
> ISI ignores alpha bits when reading from memory.
>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Changes in v3:
> - Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Lauren=
t)
> - Remove Android requirements from commit message as alpha formats
>   cannot be used as M2M input (Laurent)
> - Add Tested-by tag from Laurent Pinchart
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index a6e044056762..f45c2aae59ce 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 32 },
>                 .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_BGRA32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_RGBA32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_ABGR8888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_BGRX32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RGBX888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_RGBX32,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_XBGR888,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_RGB888_1X24,
> +               .fourcc         =3D V4L2_PIX_FMT_ARGB2101010,
> +               .type           =3D MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M=
_OUT
> +                               | MXC_ISI_VIDEO_M2M_CAP,
> +               .isi_in_format  =3D CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_A2RGB10,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 32 },
> +               .encoding       =3D MXC_ISI_ENC_RGB,
>         },
>         /*
>          * RAW formats
>
> --
> 2.34.1
>

