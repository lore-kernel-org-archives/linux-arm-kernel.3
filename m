Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BECA100B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbSWQH4bFjDPLvG/kct3uB1vklz5zdXrHO0a0fdTay4=; b=PLPXqEPWqQQwpiV1uuLTKzbJYZ
	fbhMnIYpWxhWC0mh0S7Ljgk5WYITsa3uwRgKfIvUL+XTgcPRX7M4hXQtVu6eTOoln7RWUKQ6RRtTw
	l73/jko5mz0+pAUOUhxSnDXpCnU9LNO/U+2Xz48FQNw739tHtIf3aPKGvX5cUbytCd2crTRD7fAtV
	Dak/iyg555+BgIHcmpiWBXoIQwNYZdUwTyl1fzPYsizG+vlpJSzPmBAGBokS11im8WGXcmKLRbYB+
	xpJRb0kDlBBnkotYqhKpf55eHhKr3gvk+f1ZLvy3moUEcMQlCz+pOV4s3J6x0JxpAbZaMa+ev0uMg
	aJj6Ugag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6AV-0000000CzGE-3Fgy;
	Mon, 01 Sep 2025 15:10:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3cA-0000000CQVN-3q22
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 988FFC8F1CA;
	Mon,  1 Sep 2025 12:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72A3C60699;
	Mon,  1 Sep 2025 12:26:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF8801C22C8BB;
	Mon,  1 Sep 2025 14:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UbSWQH4bFjDPLvG/kct3uB1vklz5zdXrHO0a0fdTay4=;
	b=QNTbYNtZGe/Rez2qkXQ8x/CtwL54EdeCkYpZimpV6z9LZpAAQhzSoQSGHRowQPL65c6YOn
	h5DHmNwb9cdUNlhZ6IsGEWP3Fn+t3tVXZ2b2JGqxwCBuK0n0jFx4Di4OE6OdPZ6iLuFlfh
	5xvvn77xkblzZgAd8R6ssFvDwqvgwRmaYKdd7CuMaKslNGRp6Ynwb3SbPU9gWugcf9U76D
	BQ6R3EIv92iIaUohi40gFILMLcUyX9TvySgtQKv78bfhivWMpHQu1VgXJ/M4CHfqpECzWk
	m5g57zuMiTqNX4CMIhGNvN4y4REkGgcBQ33UsKmcKmniKvUH2ykhoKd20VL+4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Balamanikandan.Gunasundar@microchip.com, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
References: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v2] mtd: nand: raw: atmel: Respect tAR, tCLR in read
 setup timing
Message-Id: <175672957665.48300.9426658311064681547.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052627_135879_BBC7A69D 
X-CRM114-Status: UNSURE (   7.10  )
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

On Thu, 21 Aug 2025 14:00:57 +0200, A. Sverdlin wrote:
> Having setup time 0 violates tAR, tCLR of some chips, for instance
> TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
> being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
> 98 dc 90 15 76 ...).
> 
> Atmel Application Notes postulated 1 cycle NRD_SETUP without explanation
> [1], but it looks more appropriate to just calculate setup time properly.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
      commit: fd779eac2d659668be4d3dbdac0710afd5d6db12

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


