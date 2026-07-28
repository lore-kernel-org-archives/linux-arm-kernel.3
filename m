Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D63C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pnnw3JHFaaC6x08vGFcx99YtllWt4ifCUVtU2BIzrw=; b=POTDc97LCBDRn+C5ybVFA4YA/c
	cQjiQ485FWUeSRIvdGjd5A/qoMMkXqOP5gBtG0kO5CrHQv38VW6CiNjxZDZj3NSJPXmqIfK5qZKlG
	qYMLnOamcLPqs4V7bH2+LaUYoIls5iPEGKcd9dd0tYC6+rG+TmYlhcYCl3TkhHpb1AG6oIALA0PZA
	I5Z+wuCBfsALwIhmojjuKh7dAoi+8JFvHCYUtZMW6NJp7+k0IUuCUOgtQQZ0Ijur3pcCQogYoGyu+
	jk/F4yvT9MIC5qYUsHdb303435Gus5yt/27D0MbbqeOkIXfHqbLhGiWij5e+z3JrjJ8BC0CcFPNut
	2CNPXBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcv-00000004lLG-0QhC;
	Tue, 28 Jul 2026 08:57:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcn-00000004lJo-0XhG;
	Tue, 28 Jul 2026 08:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785229038;
	bh=lUhD51bc6FbmG7QU3H2DChRpvP96MhevdBzHdhS/M5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WyV6xFHQVO1MkoWRzNERwwuHvdoo1TpMtSmpAgrFCtPK56bPUjBmJLxe+ahdzPKv+
	 xnu6ghGr6T795gabC6orDVpbRy/TeSOCNXvUUyTrl2UlIG/kkao7lF+iBoJ53nUM7Y
	 7wVwyQY4zHuao3vr8Ana9wLGEvhg+CkBZ0eZR/zSN3EPG/y5tkclmr/WMycB/z5s42
	 D3X7CXCJi53cbVfc7g9yPDIlAFWY9ORlBKPREM9yNlRQFTIejqZ0HM+zValwQAOb4s
	 U+Kf1R/q4/HURt7f+RYZeqGd1dvpH/jdzc0qgWQusxfDJgeMmAQCgRTEaJLFN9M79Y
	 yFxnnBbgxzTQQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18BB917E019E;
	Tue, 28 Jul 2026 10:57:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
In-Reply-To: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
Subject: Re: (subset) [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323
 PMIC
Message-Id: <178522903805.10327.4229525653360897202.b4-ty@b4>
Date: Tue, 28 Jul 2026 10:57:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_015721_328221_6C68DEFA 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, 09 Jul 2026 13:52:46 +0300, Roman Vivchar wrote:
> This series adds support for the 15-bit AUXADC hardware block found on
> the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [...]

Applied to v7.2-next/dts32, thanks!

[4/4] ARM: dts: mediatek: mt6323: add AUXADC support
      commit: 6326a6811b1af6674e3eef128df6a3825de26872

Cheers,
Angelo



