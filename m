Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E84C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLoWi3Wg0eiQh/tot5fchMc56NRkY1AedYStPaUs9Pk=; b=Ui8WntbXZ+DoRRAe+Ny4VqQb3Z
	GYfzw8LRgyyqo0FPDdrf34+gOJuZ2O4z0vE/0mWvCwxvLxDBxexs3uPrFDzKPgltZxA36WDd10Ni3
	8a/SnQ7TE2g6GuisNJpsmdC6MqVAx/vZfjS2pRNAsRP88LGTuqPg8p3ZMg0Mya6ugtu/vSg9WsCZf
	cKrc/XMYAV/UL1NIwhHnvhduaW5Nr0MyeBJ9wgyDbcRtYL8rWapgXHUovSJAfZRhmL5rEqSgYM3/9
	5eVGq/EL7l1nLpTpyyPmMXCBgj+9cdoXPAXqE93S/Gp3+fMHXDStlzW3ZsG4XPuUMPfU1+PHO1Rc+
	u2hzBmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8OD-0000000CoQm-3hV0;
	Wed, 15 Jan 2025 18:45:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Ab-0000000ClLs-4ADC;
	Wed, 15 Jan 2025 18:31:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 420B0FF803;
	Wed, 15 Jan 2025 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736965870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLoWi3Wg0eiQh/tot5fchMc56NRkY1AedYStPaUs9Pk=;
	b=XVoQSRAsHPXADFu3jVGI7dBwCecPD+dviwtiINSG7gG2QTYI7ZKoCGbAlzsXnHawAhGKwl
	24LiXfzCQR3pIZBqvn9qb/WI76bBR/gYM5iK3v27XfrrihWyj6I9DuAIL0fsvT3vsw3I/q
	czvnLPptcYBnGEnhrm8GhgmQ8vCeUtjENVYUkzFUKo7lU8h2121ib4vf8mK5lggJa2imhw
	wuKxnh8Eev9ag9+Xsu7zpWrkt2h27deaKdBBBwhgImA9Rm+AwpotMeHj0kiG0/Az9PUc1t
	KHhtrdM1rJLw5PWkyTBKEJFeu2A3AfGxN8CmN6JVLXE0bXGUEx1cXfp5ava0qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <stlin2@winbond.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v3 21/27] mtd: spinand: Create distinct fast and slow read from cache variants
Date: Wed, 15 Jan 2025 19:31:02 +0100
Message-ID: <173696548250.435435.10416906996871126975.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
References: <20250110-winbond-6-11-rc1-quad-support-v3-0-7ab4bd56cf6e@bootlin.com> <20250110-winbond-6-11-rc1-quad-support-v3-21-7ab4bd56cf6e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103114_290445_E54B9906 
X-CRM114-Status: GOOD (  13.19  )
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

On Fri, 10 Jan 2025 15:45:23 +0100, Miquel Raynal wrote:
> So far, the SPINAND_PAGE_READ_FROM_CACHE_OP macro was taking a first
> argument, "fast", which was inducing the possibility to support higher
> bus frequencies than with the normal (slower) read from cache
> alternative. In practice, without frequency change on the bus, this was
> likely without effect, besides perhaps allowing another variant of the
> same command, that could run at the default highest speed. If we want to
> support this fully, we need to add a frequency parameter to the slowest
> command. But before we do that, let's drop the "fast" boolean from the
> macro and duplicate it, this will further help supporting having
> different frequencies allowed for each variant.
> 
> [...]

The following patches have been applied to nand/next:

[21/27] mtd: spinand: Create distinct fast and slow read from cache variants
        commit: 042087247835dad1ec5e39052abf022fd13c6326
[22/27] mtd: spinand: Add an optional frequency to read from cache macros
        commit: 7ce0d16d5802bfde4209e52ee8ad644ca1eab423
[23/27] mtd: spinand: Enhance the logic when picking a variant
        commit: 666c299be696f02c3354da104295fb94b8f65d25
[24/27] mtd: spinand: Add support for read DTR operations
        commit: 8586bc8d95488dfaadbc1af89ba59900d2c39119
[25/27] mtd: spinand: winbond: Update the *JW chip definitions
        commit: 1ea808b4d15b9bddc48af75b0668b82366b5b927
[26/27] mtd: spinand: winbond: Add comment about naming
        commit: 61c7155e3fe938d4da4671b2f84e29eaf79f5f46
[27/27] mtd: spinand: winbond: Add support for DTR operations
        commit: be7a05db4252edbffb43484b14755048fb8db710

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

