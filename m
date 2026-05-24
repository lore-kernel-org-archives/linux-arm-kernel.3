Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C104ACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jo/vbPByOEa/DPjlGN3cnyIvKkPU6P7russhnbY7K8=; b=xsfbPJYTIX6NCXZfFqKR029Dcw
	t1tRLozlgvWIlSoQEzF/2vlwJ/Mo5TFJ+yyh5OBgsmBWQtYWl4witefIAgmmCRV9Vi6v5olScM91g
	+CpGL9KEcM9LsMUcNFs7FqqMJhtgHGFCzFOsOOsPe/cCcmFdZyvA2KuCG2C9dCPdeUUViu9GYdPLV
	MbLcVA1uZ7kny2BZyF+spbKZAmMiLKoFUCpCemZFyA50DBW44m/sQXEhtmz6JpV4DdEkQtNJ2/K6R
	FuHshl+x95SY048DvccXMS/gIfRUgHg4bP2t/tKjxMZUqhF4HnUAyPpf37pIX0Nr0zNr/76NbhQ0h
	pkJpVu6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFze-0000000FdYv-33TV;
	Sun, 24 May 2026 21:04:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRFzc-0000000FdYI-37dN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 21:04:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8338439F5;
	Sun, 24 May 2026 21:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C463D1F000E9;
	Sun, 24 May 2026 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779656655;
	bh=4Jo/vbPByOEa/DPjlGN3cnyIvKkPU6P7russhnbY7K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=amvIA7xB2VEXc9wVdXYXtZoGXXAu1O2/4qbr3ZDz5XtTea7HAQgaWPeBvyIJjxa8s
	 YEuPoezesW64Za2ZwISj66+GaRvWpRXvdeGtFmF54zYzBJy1KK0FeCCHjBDzBBBGsu
	 2u+c9mOd9q+q4FiLGF404nQ0or5xSFYlR2cveLfthQqimDeQWROTBJwsL26V1S/Hbi
	 d09By8DToFYTgcPq2U7AYzOMEUgGNvH7csIjvKbg236z2FvzO/G5CiiJnw2ZtQw33f
	 OXMNrNviyyqMGvHq9Iq5h/LnQC/l7h6yxl0mejmZqKZQ2+/b9H6Y9EVQtnFi/GcGiY
	 bp0vjK4NWnFqw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Maksim Kiselev <bigunclemax@gmail.com>, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
References: <20260516-sunxi-a523-gpadc-v3-0-a3a04cff2620@mmpsystems.pl>
Subject: Re: (subset) [PATCH v3 0/3] Add GPADC support for A523
Message-Id: <177965665249.167937.6469450269441634899.b4-ty@kernel.org>
Date: Mon, 25 May 2026 05:04:12 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_140416_815079_A2AD94DF 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

On Sat, 16 May 2026 07:34:13 +0200, Michal Piekos wrote:
> Add support for Allwinner A523 GPADC in sun20i gpadc driver and describe
> corresponding node in dts for A523 SoC.
> 
> A523 uses same model as existing driver except it has two clocks.
> 
> Added support to enable more than one clock in the driver, extended the
> binding with new compatible and wired up dts node for A523 as its own
> fallback compatible.
> 
> [...]

Applied to sunxi/dt-for-7.2 in sunxi, thanks!

[3/3] arm64: dts: allwinner: a523: add gpadc node
      https://git.kernel.org/sunxi/linux/c/44cf19e41c76

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


