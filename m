Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDBCEB2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=; b=F1svFAq2CBtWRr
	EC2dQpkA0skJvJDeDXuix6coPoqG5sqL/7pXnc7ufB+NSGHb0vc+7hGm+fMg12ke6moUYbRVdihmv
	ez0haDSVvxjIyfWrma0H/al8PC2uhgf7MLoeQRvYrLJhOOHp4z74L25LhTQO34Y8WC/fG9pm0k1ku
	qcHXtoeaohmJmmBioloY50xlhZlaeVxWjXEZVMOAwkEWQVlbWyIPs35of8KMOCA31Sh+fp2ZxKHCi
	NrGhJ94Pmy0EN7F2UB3i7XTkjFIioSvr5TWPxAmSnb82q+qNDAAQv6ojCIcCNk2sB2VkE5i67+LnW
	Ywgnq9gHTNvV23+hZ7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHSH-0000000DrAC-3V2g;
	Sat, 15 Nov 2025 14:40:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKHSH-0000000DrA3-0vXV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FC2C6016F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 14:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61FCC19425
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763217641;
	bh=Sue3DiX7aivO+CREJvjgnQK9H3Tgu+sLekJRMaXhs2A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=j8/5ngWcMu4uR2+5U32ZtsMBluoXbq4r00xSz5DFwqXGpsDqRehYBPhU4JwhuqdfY
	 rbVIFrFXl0tSiZAoGw3l9jYyYqA6bwRpq1DPDHpzDfun+qQbWSPHJhH5uwWnAjrWsB
	 XsLsCQmT6BCZGBLG3EMH8TeJwriHOIpa+OSTKqdCivadSieOI412P2DW3qbVSSDdhh
	 r1vPdMJnHak4ggiJaMEuXkxhwGd4LayTdLi12cAsnrQUhIXhK+j9ktydZdL80ClfRh
	 Sp3WkhGUiPnVVHT9HaUeGJGEVLZPmIyM6BmSmJTCA0zgUBPBjzCLGdiKGqgagqrKU9
	 PNPs7HXAp1YAg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a3a4d3d53so26187431fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZQ9VHtJarhpNW+F2mV4AeLDI+B3QlP4DCFi9rhgee2eWsJ8Mdg9vyZ/hE8kmcktsigur302MNmLaIuAVWFoCV@lists.infradead.org
X-Gm-Message-State: AOJu0YxTm6m+pekns1yuEg91byI9qe/gl2VJER4bcWxSXCSamDCRYsmL
	IZP4r1w6X9Ux2naCdxjhdbsKSJjB1frqyTXL+twKIUeIDZyv7dk0cnYnXnGbb53WOALVgpkuEtf
	Kw6NOu8pUX8qdwceWGGLEssfo0INV1vg=
X-Google-Smtp-Source: AGHT+IESjGE8+0xVTH/QjhjF8+obf5TP9Oc8OEClkcCl8dEd7PpJQsH5CVoNDaeGwAe6R1UChVfXuLbguHAeh3ulKxU=
X-Received: by 2002:a05:651c:41c8:b0:37a:455e:f302 with SMTP id
 38308e7fff4ca-37babd5cb6cmr20120411fa.27.1763217640107; Sat, 15 Nov 2025
 06:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com> <20251115141347.13087-3-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-3-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 15 Nov 2025 22:40:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk6LAUI84UIq1LoT1dh5454sL5SZsNoWjCZBYs2iLefOyWq2c142CwfOnM
Message-ID: <CAGb2v654AOqwOs26SjYji5K00oM_3U54sSFU-RMGqRPwRMnqCQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

I assume a fixes tag isn't needed because technically DE33 support isn't
there yet?

