Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B96C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUo1LO52BYWcoiJd1dWpDlLgNt48xObBzCM2IkzYHyY=; b=dZ71ELzXFIHNdV
	bI4Hx6Czds+ElK6SfCQl6KlX52wWbkfFRJbRKEOuAzWXqR5XH1M7fptfQNTrY57WcSEK/ILPy+31x
	fT6jUx/oUiL60g/d4zKRjzo8DW14DAEvDBDhVi2Yzmw2xu02PP1Qi7DMt/abRjZTHWVw+eoZGCWuI
	StTj8uZ9RehGlYufcWTWHCVyePtDh6NI1SdpVVXVTNOjSPOsFwgLFa3YHrmEcgZPSEHtd9BBKOW9C
	+B/q6QUsWDQOPoSm6A5R5DXzVYCeY0cO8pRYDoYwuOADkG8JSWsNjhABxmfi1gBIOmNMUX1b/bVj7
	PBhvu8qrC8QNTBRSEWqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwC5-00000000Bw1-0ZBU;
	Mon, 03 Aug 2026 17:11:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwC3-00000000Bvo-19sQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:11:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FA1D40B06
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1441F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777074;
	bh=FUo1LO52BYWcoiJd1dWpDlLgNt48xObBzCM2IkzYHyY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NfGftYnBfCQtA4iYivRTo6vxQG6mxmsK57/zIQ4cXNsMMGJJcKE6+iXd8OIBRG2JU
	 zURXcsGGpsRSmGIHsTSzoed9DilauVTCNRrKpiW6AtPEN5/QrQeJJGEjSFCFOZHxvs
	 VCZcKwG2fJwkvnjPy6PrktY0J+5BuG8ek44duC9ZbdWTv3wgetM/JDOmt2ddwp8mde
	 ngxktLJ117g8ktHUsZrFvng0s8r5K6R+PivfWE1hMZAy7r8rgeBIquOc79AKr8V0l1
	 QgMLkkkCnavtufeNnHO6djpj8e7C9AMRD7pHNBIuhbJNXTGJlwugsn3KZX2LeaL3Qh
	 RcQJNHDWugB4w==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c953950dfso30339901fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrlayHQvq4di1EvK60xVST8jGvDFK0v1Fy12TSgzk1y2FWFtrChqGaECh/US1B4JIeqnRm8LxKDojFQETmq7qPI@lists.infradead.org
X-Gm-Message-State: AOJu0YxsD2zDZ6QFdqLdX0rZrBmCUAj+BzdIo1abbD0jI0XmkBIbv87J
	OJeeRmrZiiToor0BDZU+wG5hvQ2pHc34R0RJodMLoz3FUUxZnG8e+ilcqvX5uqkqMX09uobR9cU
	qlnPzwo9jPW7d7eSYLvEzeRBTpam06jM=
X-Received: by 2002:a05:651c:1993:b0:39b:2757:c1d3 with SMTP id
 38308e7fff4ca-39f86123ea9mr23096581fa.9.1785777072773; Mon, 03 Aug 2026
 10:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <aec9060209473b8176eb43bc7c63c20b21306adf.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <aec9060209473b8176eb43bc7c63c20b21306adf.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:10:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dgpoMwpackOsKGb7JFUMP-1Vc667xFE54j5odCdpv+w@mail.gmail.com>
X-Gm-Features: AUfX_myw6C25eVU1rBodfF_fAck2j4rXU1pTMBlvs-af7cQRwy-_-acRDgCMMzA
Message-ID: <CAGb2v66dgpoMwpackOsKGb7JFUMP-1Vc667xFE54j5odCdpv+w@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at
 594 MHz
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The 8-bit entry of the last MPLL row (594 MHz) doesn't lock reliably on
> H6. 4K@60 RGB/YUV444, which is the mode that reaches this entry, doesn't
> come up.
>
> Align the value with the vendor driver. Other entries are left alone,
> they are used by lower pixel clocks which work fine.
>
> Tested with 4K@60 on a LG TV.
>
> Fixes: 0fb4b858b102 ("drm/sun4i: Add support for H6 HDMI PHY")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun=
4i/sun8i_hdmi_phy.c
> index 4fa69c463dc4..489ea94693ff 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -91,7 +91,7 @@ static const struct dw_hdmi_mpll_config sun50i_h6_mpll_=
cfg[] =3D {
>                 },
>         },  {
>                 594000000, {
> -                       { 0x1a40, 0x0003 },
> +                       { 0x1a7c, 0x0003 },
>                         { 0x3b4c, 0x0003 },
>                         { 0x5a64, 0x0003 },
>                 },
> --
> 2.43.0
>

