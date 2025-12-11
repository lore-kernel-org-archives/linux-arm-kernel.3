Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9442BD43342
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xde55l1+l063XLIdBkYxC3zt4ii+GgBNTpUoXkw8nGQ=; b=gMHte9ueD/Sj7fSIEXPyC0k9JD
	XMfRP5mWlcE3xpQjj7JvyBwN2K1v2QC67oO7KR1wEv59zVDj+mmFvgUIiuN6Yty5UUH283AjT3RTU
	d0pBRG3l9d1vy1yXmrr+nk4UDdjGuQKy18uBLNIKTEs+6wCd3AMP5mXxpa+YCJGZc687ObDoLABgA
	QDVr+BxvyxqHVRRGBzRFpfTwuavTCSZDvCJPhepRwukHBQaX5VlXtSQB1b7N3CVxsd4cHLjhnrw/r
	mtEOZXntgX1TiuFpwQ1s77HGnWM/+sOGxlibXOKQNzDs/mQx++FMRfeM9hDWdMYce9yo9UBMtDrKl
	gUu2vobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTlcu-0000000H8XP-3yzy;
	Thu, 11 Dec 2025 18:42:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTlct-0000000H8X1-4Avv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 18:42:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD8E86013A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 18:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B79C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765478574;
	bh=xde55l1+l063XLIdBkYxC3zt4ii+GgBNTpUoXkw8nGQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y1cQrlcylH5RW60wSmlNSGQvi677MfNH9X2UECZKuuGrBFyZNYPwrvhPYbp7I3iC6
	 Fm0JuurXVZuKf/5gut3Ctba9qlHJrokeUOfEc6yApp5jDtkZbWCMH2e+PWqjvHRx96
	 6PaDgMiJchLrbf4B31+Y0g2lKgd88WMeDOzCmm+J5sHz8Z+tCTdXp04Ai85F1uzoQt
	 TOSZzUjKKjqUIfKWi8LP79gU7xmaeK2Bf5BEZn09FfW66q55bgXgtAErNuffJ+SA3G
	 lKcONLlzyOVY4BbQ+pNdQD2wqASH15MQUZSaghX8EiHvRLCDy9IJTp1Z6Knu/v7z4j
	 d80pRYrpDoCSg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b77030ffad9so69815266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 10:42:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqZmvDdtc7JFPXPkn/cCk7K1zqb/d20RJs6o/ToJW8K+p3JFStvgxSHo1UL2Mi731wn6OMahln63JY3nqyovqN@lists.infradead.org
X-Gm-Message-State: AOJu0YwKu6oxcsAinUuLrbSQz+gLvWGmGHbX2lFbTqCgn9HIIi1dMWAq
	OKLfyBEYgWCNJ1swyaLdKKxAgSdxGfnGtOK+i/i247Mszd30PlfOOMt/FCX4VXook9UYLGRNQnb
	pWF22iPinwhk3DmedzaGMWuOL65whBA==
X-Google-Smtp-Source: AGHT+IFpmaU0LcryYHssF+cowN0/nMLDb46BHPTQJIXNPRiW6IO8ZNGX6e8APIIJ+Jyxyhkd4VkX6j+L9z8nATjdLnM=
X-Received: by 2002:a17:906:f5a5:b0:b40:b54d:e687 with SMTP id
 a640c23a62f3a-b7ce84c41f8mr740618166b.47.1765478573074; Thu, 11 Dec 2025
 10:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20251102111443.18206-1-laurent.pinchart@ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Dec 2025 12:42:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJg4aYGyd49UAAPBw+FGpmGxV5JkdkXp2FK_7Gt+7DLZA@mail.gmail.com>
X-Gm-Features: AQt7F2qf3K0rkVXOm1iy4rqcFXVI0LVf2cqClY1Ty4vWkJyrAnEhQy1pz5G1wvc
Message-ID: <CAL_JsqJg4aYGyd49UAAPBw+FGpmGxV5JkdkXp2FK_7Gt+7DLZA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Andrea della Porta <andrea.porta@suse.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"Ivan T. Ivanov" <iivanov@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Stanimir Varbanov <svarbanov@suse.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Nov 2, 2025 at 5:15=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The RP1 ethernet controller DT node contains a local-mac-address
> property to pass the MAC address from the boot loader to the kernel. The
> boot loader does not fill the MAC address as the ethernet0 alias is
> missing. Add it.

My change here[1] is going to effectively revert this. The RP1 stuff
needs to either be an overlay or not. We don't need both ways.
/aliases don't work for overlays. I suppose that could be added as a
fixup when applying. The kernel also assumes aliases are not dynamic
and uses indexes which aren't present, so even if it did work there
would still be problems. OTOH, if the bootloader might use the
ethernet controller, then why would this ever be an overlay in the
first place?

Turns out digging into RP1 stuff, it is a mess and needs reworking[2].

Right now, I just want the warning gone so I don't get further complaints[3=
].

Rob

[1] https://lore.kernel.org/all/20251117211503.728354-2-robh@kernel.org/
[2] https://lore.kernel.org/all/CAL_JsqJUzB71QdMcxJtNZ7raoPcK+SfTh7EVzGmk=
=3Dsyo8xLKQw@mail.gmail.com/
[3] https://lore.kernel.org/all/CAHk-=3Dwi+ge-gtCg+iLd6dgjisGchjtsKY8AXG9tX=
GOxqVv8Fkw@mail.gmail.com/

