Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF91C55822
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BOhkhN+nD6eTFoBG4yVgCP6CfGcQEWxk1diIr5TtuM=; b=YiyBJI8oQTpcZt
	N15uqoYBk6yYRN5+d2jCEXGc7gacw55IBTO/4GOpM5xLnDSuQzVV/ubXVdP8iwQqv1F0tWJVMZWPC
	uE8NWYQhIyCY0dOaHT7EkLnt4R5WAvePKWeOsazHL8PMVmaSlfQKGpnX5lUM/+k+z0BwuBJra77h8
	QloWXSkfnRrvtoPERWVC15xqSXVwSHwWkUR3nPugUQbwplckwF3Vyq3GE1jzwg4JXzTZnBtydYFhu
	IKN0O/biArdyBqIlbwvNYlyrHBfekNcoPD8xoAt0jzDG6CvkuD1w9fjaGjejwbNNX4/EZjMrGfK1n
	5Jaw1WAiWmZ8gxR+7H0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwQm-00000000EPS-3M67;
	Mon, 03 Aug 2026 17:26:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwQl-00000000EPA-1qAx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB10D416B1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEC91F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777986;
	bh=2BOhkhN+nD6eTFoBG4yVgCP6CfGcQEWxk1diIr5TtuM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=TOdmjbZ2iH/jgLMW0euKcOBac7p7mK/rCN9x9HW4PIcef93PUhmSxnheRPA3JFkOL
	 9RqriVpqHlLfXJn/2feJu8WCCg6FwIzTHTm3w0ASuRlh5pPmyy63f326l4+2WMJ7dC
	 P2BeNZuCEcB7di6VqJ9X7rOIeS1v5oJDFqw5mmSrLlo1RjYm7DyPvsQAsey6kX9BnB
	 5JVuSrMtiLRAyHNuTuaFG8nl8cjjCdil//IPqwCARyciuaXdNbDoN0pUammbZOFZGd
	 lPiezk4Q0QoYjQ8WH4b8KCJwtSFoP9gvwWILXaFGgaXIwngqo+6HiSnDYgHf4sSs+Q
	 pMrduqxSp+/Dg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39f75e1e9d9so26568401fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:26:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr4qiLclO09MlOWPtxXeV9pKR9X3ZKJaaNCw8O2UHde1xncnk41/SdORp09WCPelGkRJmiBVqVh43kV3aUYQ/ss@lists.infradead.org
X-Gm-Message-State: AOJu0YxrqQO5shOVN0CzZrJqSI8N8aoLivLnOTaGSnx2sonqF5Y6es5d
	a/wDM3FVDGQcZvos3W5JMFpdvPka3J6eFX+2H+bsKC2+GKGTj1YEdGJAQf2li+eEJWLZB32Bt2H
	FUK9PoQda3iEBwvHD0vNfW2VkllQ/3as=
X-Received: by 2002:a2e:be05:0:b0:39c:6fad:2bc4 with SMTP id
 38308e7fff4ca-39f861a8b58mr22384021fa.16.1785777985252; Mon, 03 Aug 2026
 10:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <51ba0918ce016a4b45313d5df1b6ce31b8c8731e.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:26:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v67j7nGbnCCG_2XCuFOzYkBJzyqu-YJ-w6QgLY2idndhwA@mail.gmail.com>
X-Gm-Features: AUfX_mwuI2xct4yNs35NtVK4bvQPSjfvQWC7fMdYbuzLo9QKn0Un44VUoQL0gtU
Message-ID: <CAGb2v67j7nGbnCCG_2XCuFOzYkBJzyqu-YJ-w6QgLY2idndhwA@mail.gmail.com>
Subject: Re: [PATCH 07/13] drm/sun4i: hdmi: Don't leak sync polarity bits into
 packet control
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
> sun4i_hdmi_enable() keeps using the same variable after it programmed
> the video timing polarity register with it. The leftover TX_CLK, HSYNC
> and VSYNC bits are then ORed into the packet control register, where
> each nibble selects the packet type sent in one slot.
>
> As a result, slot 0 selects packet type 3 instead of the AVI infoframe
> whenever the mode has positive HSYNC polarity, and the TX_CLK bits set
> nibbles which the driver never programs.
>
> Assign the packet types instead of ORing them into the stale value.
>
> Fixes: 9ca6bc246035 ("drm/sun4i: hdmi: Move mode_set into enable")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun=
4i/sun4i_hdmi_enc.c
> index 74c7c3720ba8..a27d394d0570 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -161,7 +161,7 @@ static void sun4i_hdmi_enable(struct drm_encoder *enc=
oder,
>
>         drm_atomic_helper_connector_hdmi_update_infoframes(connector, sta=
te);
>
> -       val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
> +       val =3D SUN4I_HDMI_PKT_CTRL_TYPE(0, SUN4I_HDMI_PKT_AVI);
>         val |=3D SUN4I_HDMI_PKT_CTRL_TYPE(1, SUN4I_HDMI_PKT_END);
>         writel(val, hdmi->base + SUN4I_HDMI_PKT_CTRL_REG(0));
>
> --
> 2.43.0
>
>

