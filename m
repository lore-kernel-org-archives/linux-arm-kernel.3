Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63821C531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPNIcIi1LOzsQXqWK+o75R02GnMwM8fKyeQ91BeHjVU=; b=3PaSOlaNaZ5Pi05e1HH1RZx6W1
	U/l3A9+ZKb1Bn9abHF4KqgO1iH9xfFmSajxI/gFdv5PM7L7hKEm30TtlqHGDzqlCJy+NFi/sMRRiH
	RmJgDCR2ge484UkxZVmPGuidBaWXwU1z8hGfa+15uFnJj6+fa90qx1ilzdph+a6/zlfNyiv/0Wt+Q
	Nqa7OLYJ0+idgnV+5OjiN6XP377mLpCD+S010Sh1iSINDbOhzK2whrI79KZe0D2Cuf747HRjhBjD1
	J7LuSez0N2lx7w91hLXPGgMlElRCxBGJY1fA0/5kOGexMpvfx1B67RXFVGid8tOKg5x4x2A2t5Ybk
	1571TMRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrur-0000000EBaG-3QpZ;
	Thu, 23 Jul 2026 11:48:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmruq-0000000EBa5-2orJ;
	Thu, 23 Jul 2026 11:48:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D9C27600AD;
	Thu, 23 Jul 2026 11:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FEC1F000E9;
	Thu, 23 Jul 2026 11:48:36 +0000 (UTC)
From: Lee Jones <lee@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Roman Vivchar <rva333@protonmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
In-Reply-To: <20260709-mt6323-adc-v5-3-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-3-d11b8332a735@protonmail.com>
Subject: Re: (subset) [PATCH v5 3/4] mfd: mt6397-core: add mt6323 AUXADC
 support
Message-Id: <178480731596.3380420.12025738982623132782.b4-ty@b4>
Date: Thu, 23 Jul 2026 12:48:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Thu, 09 Jul 2026 13:52:49 +0300, Roman Vivchar wrote:
> The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
> devices array to allow the corresponding driver to probe using compatible
> string.

Applied, thanks!

[3/4] mfd: mt6397-core: add mt6323 AUXADC support
      commit: 0e03ecbb17b1249471560227f210c3f98acaee08

--
Lee Jones [李琼斯]


