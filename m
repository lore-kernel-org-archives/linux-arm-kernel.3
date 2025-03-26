Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B770C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=; b=mQegvyf7DqHHguBPHQKv5HX4Hw
	ZEsGA0YdKsPyIfsx/z/qZNkjZ14CClfhsiDbBvJA/3GvVMgpxTd0PLLnhNkFyLu2djjAwbfmznvhd
	9lcCMKYeYgs+XfNKzoVna8oLqf5RJ7B06oWXyU5gfpPyYZYrICRq78f0RM2RPq9eTRwchxuOkU/aU
	yv7Om4zRjKVDSakiQ+nLijtKr4mpiVEbrFjzem7SV45soMvXowFHnd8yceVveCiA9U+6CDLy3w2vy
	tlFe48soK29eSQQ5xPI6zh8lwl6KDIrjbzqrPvfNB8E5MeViUwZhcKDxdg8P57E5Acid9Cg/kMABY
	eBm5HdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXoJ-00000009bDc-0dp8;
	Wed, 26 Mar 2025 20:57:15 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txXma-00000009b5y-1gmQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 20:55:29 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e8fce04655so1926206d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743022527; x=1743627327; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=;
        b=kKacjFwsjQRExlBWHZPfOJvuvxDGuM1YrevRcjLnxvTys7sHCXLhOUgfoWX5GoIkJm
         iNz0KSCWXhgb7jSf2q0KT/GjzUk96bTciwNVoZiquJ3he0SXw7c+0BNH498ZUoKjAKkn
         opy8Cx0tzzFldy/3J2IxBrxACzqeNqd2Ll/oOn01rcE6AP4V6ehcnsJFPDI5+a+q5TUG
         5p7lYkivdiHXrWgr0AJnGprebq/yvDegZ3Oy7IOKETREVDxVSJf8G2xkT3FDdak4PWTU
         paqnFzAit6q8D0CrdwcZhtKrLOeA5YyQSmLttBnnuwi5pf4b1D3gD2MpoxkmzZZ7yred
         OS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743022527; x=1743627327;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5W7eit3LvJ+Cj4I9mmTKcAopJ4/V9ebVZTl7mNDE+uo=;
        b=PoVCmMAkiUEaWYohGi8rgaeH+jYco0+fuFJKenF2C5swmnsP5THqskQIcPdZymVTKQ
         s1fKrcw+QkFUKBDhom1bKE+0A9qxxGL0BEQ36Ls21oMFlm2bPTsPfKfxKZIQM14lMnzR
         KhN/mQgI8Y6P6CQFjEd18S7zw6z/BCFAMJcrYjRpOwWirFnHEDXuJnjifU/REZi5FQ0n
         Abcb5LUpyQu8GpEHn9CsUCqhsQOtVVbj/Ykoimn7qcOdFibQ18zO4jsjg3+1dqCMWvOL
         IuOiiy46sme8inA9T4ZiK1aDlpHAhfNl9llFtZY8U6iyjVSEI1oVaIC3Hp1AilIAQCCJ
         Z2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbNEjkMGYZ6LjkaWwtWlU4ae8J6/WedYiUYcWKVAglBqeW7dUpXDIEP/Gc40yA5UUBKm3X4UmRRl4jldSMMGf9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RLgrxL6xvAgJ6xJjpoD9kQYC8ed95klkOrkLbdEiTmTizEU1
	9VAf566V8pNBiMhuDPDSLupAzDZjE5SG77LDIeL0/LTMYE5/5yRblGZ0iqrOc9E=
X-Gm-Gg: ASbGncv3Nwi6dOGa5Jqcs3Alq25g/P6wIABBQKNpKCUjQjjqdw/aRnxCsbLyVyBicOh
	cj+KOA9BWqO1wmfVTLHRFYCxH2Sg8ogujBMS0lpJip03z9t67XawwEiK2A+TshAgC6MUA3ygC4H
	uSH0EgKZANDeAegTySb0jyvuuVwEsJJ28lJvObJf1JS8HhaF7eAOXQRwFL06GEoYMnNHRMOHhT0
	qSFrZgakWOp8N/pIlR0ojOPArqHOtWR41r49bllKls+0f/Gw97dJCmXRz/JIijEcy/vKidNe5kn
	YrFwFTndzSHWZHZ9mX0WDW1FQxaJVyVzXvOHlEkAFhd699AiyA==
X-Google-Smtp-Source: AGHT+IHbfejsmynMze516eRewXRtjx57eaFY2IsodhkGJRNoTFNQq3NQr/NHsm2iVzU1A+1ZgZFRqw==
X-Received: by 2002:a05:6214:cc1:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6ed23934b0dmr10501496d6.33.1743022526776;
        Wed, 26 Mar 2025 13:55:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efda74esm70987466d6.102.2025.03.26.13.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:55:26 -0700 (PDT)
Message-ID: <927a67500f3e4495e7efe03f3d3c8250a393192d.camel@ndufresne.ca>
Subject: Re: [PATCH v3 2/2] media: amphion: Add a frame flush mode for
 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 26 Mar 2025 16:55:25 -0400
In-Reply-To: <20250305062630.2329032-2-ming.qian@oss.nxp.com>
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
	 <20250305062630.2329032-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_135528_445734_586DF0D8 
X-CRM114-Status: GOOD (  23.84  )
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

Le mercredi 05 mars 2025 =C3=A0 14:26 +0800, ming.qian@oss.nxp.com a =C3=A9=
crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> By default the amphion decoder will pre-parse 3 frames before starting
> to decode the first frame. Alternatively, a block of flush padding data
> can be appended to the frame, which will ensure that the decoder can
> start decoding immediately after parsing the flush padding data, thus
> potentially reducing decoding latency.
>=20
> This mode was previously only enabled, when the display delay was set to
> 0. Allow the user to manually toggle the use of that mode via a module
> parameter called frame_flush_mode, which enables the mode without
> changing the display order.

Ok, so in short the DISPLAY_DELAY breaks the reodering like intended,
while this module parameter only reduce the delay. Perhaps I'll ask
again, is is compliant or does it break some test vectors ?=20

>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v3
> - Improve commit message as recommended
> - Add some comments to avoid code looks cryptic
>=20
> =C2=A0drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
> =C2=A01 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/=
platform/amphion/vpu_malone.c
> index 1d9e10d9bec1..4ef9810d8142 100644
> --- a/drivers/media/platform/amphion/vpu_malone.c
> +++ b/drivers/media/platform/amphion/vpu_malone.c
> @@ -25,6 +25,10 @@
> =C2=A0#include "vpu_imx8q.h"
> =C2=A0#include "vpu_malone.h"
> =C2=A0
> +static bool frame_flush_mode;
> +module_param(frame_flush_mode, bool, 0644);
> +MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 (disab=
le) or 1 (enable)");

Depending on the explanation, I may come back and suggest a different
name for it. Meanwhile, have you consider simply "low_latency" ?

> +
> =C2=A0#define CMD_SIZE			25600
> =C2=A0#define MSG_SIZE			25600
> =C2=A0#define CODEC_SIZE			0x1000
> @@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct vpu_=
malone_str_buffer __iomem *str
> =C2=A0
> =C2=A0	vpu_malone_update_wptr(str_buf, wptr);
> =C2=A0
> -	if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
> +	/*
> +	 * Enable the low latency flush mode if display delay is set to 0
> +	 * or parameter frame_flush_mode is set to 1.
> +	 * The low latency flush mode requires some padding data to be appended=
 after each frame,
> +	 * but don't put it in between the sequence header and frame.
> +	 * Only H264 and HEVC decoder support this module yet,
> +	 * for other formats, vpu_malone_add_scode() will return 0.
> +	 */
> +	if ((disp_imm || frame_flush_mode) && !vpu_vb_is_codecconfig(vbuf)) {
> =C2=A0		ret =3D vpu_malone_add_scode(inst->core->iface,
> =C2=A0					=C2=A0=C2=A0 inst->id,
> =C2=A0					=C2=A0=C2=A0 &inst->stream_buffer,

In principle I'm fine with adding a module parameters, I just want to
know more about it, perhaps we should add small hints in the
description (or a comment in the code).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>


