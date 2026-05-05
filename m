Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0343CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgiGLGYytpsX1pgqNn5cf1PRDgS58OvOTWHFQqfn3bA=; b=4fk3BL+6F/gA8y
	+JOD1hWUkXz86jou+dDwZn04pgg9m7VgKYZb8YjRzI6lGs966FqVpCF3zexlN7wHEcsyArVVMycKE
	/eNRvhQgHU+ZUiMsMpPBraU4uWWPL8/MTkj+6MhWLSOrtFgc05QpSaL+TNY63PkoyuLcNU7bbhpgG
	lWWfZFtR6UCbL9pNSB+HRK6+tcVGYQE0VTeZwv85F7jGBl70E4bdpPYBwnt2qcUlzBPUiUTyW/Tzj
	Ij3zv3ECwCTOA8QU59CXuvsZV7jjDp8Ebrjqu5dlVMZ/Y7HfUxjqWkTjfuc+px9LAblufUP3zP41y
	/tsJuClJlXVK+1/hQUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGtN-0000000GWza-1aIA;
	Tue, 05 May 2026 14:36:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGtM-0000000GWzK-1aNj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 709C160181
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24215C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991815;
	bh=NgiGLGYytpsX1pgqNn5cf1PRDgS58OvOTWHFQqfn3bA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=RWmiCI0nBv/UTy4FGEg7lrvr09YUX19lour1NiIK6RnPunEXWKepTzMpQ9KhNMW/n
	 GuYyQHTqPGiTjsjqd1fFkIBI57zroopOggbhR5vxspnfiAi4gx0iT5BDxwtfRlNnI3
	 w2mto6h8n++NrczrbNAf9J/X0zfkeJ6QXxw2Pfwla54OMCo8FPfcTKlSJMXv8v5p9L
	 A4gavqn6xJsUgaUfFTp987IntjK7Tg7pto0RcrvP0Ec+DrlNG8YcKCPtmCWiys9wxF
	 wzuKaE+XBXkQPLWmdL8oXkPSDkWSEnUpo3Vzw2Awrfjtoy1c2pTK3DZy/BKF/xqlDq
	 txV/tdezXmgQg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-392445f11c5so70743941fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ijDwh+k20MhhjE99zCEz56S8kR7dyJlX1PKZjb+DV42/h+sRWvEGIng9dxD2tCDyIHvOUx2JE/GedtE7EYZOU@lists.infradead.org
X-Gm-Message-State: AOJu0YzmfWhjROIV8E3Bhcn+JfcUPuydPIEBERoFSD4JLs9bIVg0q8P2
	/0da+gOHNWPJ7UG9NPJ9WcuNIlUbNwJRZr2Ovjj/tPkhU9XI3+Un9SICtvvZl1esmoLGPGBCZRK
	TIEiE+t4RebCOgj7A0cKpX6g6CdAxyNw=
X-Received: by 2002:a2e:a812:0:b0:38e:7f8b:7f1b with SMTP id
 38308e7fff4ca-393b2a578e2mr14991301fa.13.1777991813597; Tue, 05 May 2026
 07:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-3-7e02178a93ee@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:36:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v650GZbwnhaGwOxZk5nVgUyuvwqE3GcHxDk+BZ26Q5KE8Q@mail.gmail.com>
X-Gm-Features: AVHnY4JCAjDbIT8r8nJuAn49eNRODzDKBY5vH6JTPS5Yu21u8RVJw3ugY1TH6gw
Message-ID: <CAGb2v650GZbwnhaGwOxZk5nVgUyuvwqE3GcHxDk+BZ26Q5KE8Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm: dts: allwinner: t113s: add hstimer node
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
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

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Describe high speed timer block on Allwinner T113-S3.
>
> Tested on LCPI-PC-T113/F113:
> - hstimer is registered as clocksource
> - switching clocksource at runtime works
> - after rating increase hstimer operates as a broadcast clockevent device
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

