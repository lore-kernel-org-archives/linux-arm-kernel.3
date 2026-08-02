Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2125C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIgY+IMYJBLWoIJQunkjMT26i2eXWjAiHggq3CCm8wo=; b=wu9CjeT77dkn3mjh+UWHWaYhtW
	FJTVjgN+l50M2oY6t6h8u80FVZvnDV9Bk86YfdXvJ+Zl8QAzDJJAjX4GI9tXpDibT5iO88+OO/y0s
	amhNYOu1Tux3rRphviiwimm0VmL7KOlKnTW522wsBvo+YW0B1SNFVJxMNarym/rxYAg1I1uarJ/uY
	dmWpikckYq5Vls9a08eZqbZTeZgPefcPS2qg4e6bFHv+4hy+omhptsW1kRzCaSxYHAEL8CeooGc77
	z4YXmsYqLcy2gwGrnOp8iMFPY9dniLwWikegMIGDM2ZRBOMxA7Up2csXouvT4bfp1dyVrGn/8vOS9
	3GxjCcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqVYi-0000000Fdie-1Rn3;
	Sun, 02 Aug 2026 12:44:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqVYg-0000000FdiY-36b7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:44:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E8F343287;
	Sun,  2 Aug 2026 12:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15DF1F000E9;
	Sun,  2 Aug 2026 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785674690;
	bh=wIgY+IMYJBLWoIJQunkjMT26i2eXWjAiHggq3CCm8wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lFZMu0QQXsZFP2E4DZe/wDPcZTBokID55KNR65R3vOUvSrvETjuZiGbPX3KKu5H+2
	 s6J2RQXRO0cafFKdaLMByN0oKj+LeOJTv36L8cQFl+hMYgD+P/e1tGQjwFtX36o12I
	 NMu9a/kkCgU6HViPhjoReM1r7B5l7Wo8XiNTlF8wN+YAo9OuA6XTCNmdiLd6dEAWkN
	 wfqm/YvcckDXj4YO6GlqeAG7YrFo677KnOUi+v+40oDYP07ZdGGt86x91mLNl8sqw6
	 kqBN9QMaGLTM96e9iOZ7/wko4SXaL30DlExU0G1bJHD6yKqwta4kmNrzxLQpP0f7e3
	 dHypnth62L99w==
From: William Breathitt Gray <wbg@kernel.org>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] counter: microchip-tcb-capture: Fix DT channel validation
Date: Sun,  2 Aug 2026 21:44:40 +0900
Message-ID: <178567458124.1423913.11797126534465463278.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714042910.7-1-bbnpreetsingh@gmail.com>
References: <20260714042910.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=wbg@kernel.org; h=from:subject:message-id; bh=0S4lXB13dHTIa2w5VuqTQh0fZHhgzlprGNYaCmPYFMk=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFn51pvu//3FqvhQdUJKMlvevmmza9+usUpd/qW4N/BQ8 IVNVR8Wd5SyMIhxMciKKbL0mp+9++CSqsaPF/O3wcxhZQIZwsDFKQATEVzK8Fe4/d+JZQzFLRf3 qKod+13Rulxu3sK/zkkxa6O+fu2bk2vC8E/rTp7cGlUN5qUfHFXWNc5N/T75FJPnmh2F+RLXJe6 HZPEBAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
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


On Tue, 14 Jul 2026 04:29:10 +0000, Babanpreet Singh wrote:
> mchp_tc_probe() reads the devicetree "reg" cell - a u32, per the API
> contract of of_property_read_u32_index() - into a signed int, so the
> bounds check "channel > 2" fails to reject cell values at or above
> 0x80000000: reinterpreted as a negative int, they compare below 2 and
> pass validation.
> 
> A malformed devicetree can therefore drive a negative channel into the
> ATMEL_TC_REG() offset arithmetic, making the driver access syscon
> regmap offsets outside the TC block's register window, and into the
> "t%d_clk" clock-name formatting, where it truncates clk_name (sized
> for "t0_clk".."t2_clk").
> 
> [...]

Applied, thanks!

[1/1] counter: microchip-tcb-capture: Fix DT channel validation
      commit: f1a3a9946aab611dd2200c01ff122f64b033dad2

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

