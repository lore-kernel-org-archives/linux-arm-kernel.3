Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72747CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=; b=YPp1sml5sLOPyYmgGvWkifCt9D
	yZLV4r9DFp2F1lpy1n1oLiMeosDHtnwqf3ZwwQJm9poDcKVeBi2vdPSWdDb+rnUomjTTDWYBy+kjO
	Ni6vxenL0CeNvQu95OIJmKu6pklNqKa2YcxAdU7ZWKpaTyt11k6FXcVRNchS1h2EyICsJdk3pkPKQ
	uYhubeikhJh0ddf3wqvOJxE3W4CcSvmJBqXV2eYDeBkKREA5WP5oHEuy0QVAbg5i64Lg7a6PoOdMk
	9JfcG5MnA36zzyVOET1KY7Ncxosw35uuxJNDlxlrliCQCqYvA06TZtbUrpe9JplTuGvuFi9R3EukH
	oOke9QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHC-0000000DGTG-3Zba;
	Tue, 13 Oct 2026 15:18:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeH5-0000000DGMe-3ava
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:47 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1181745a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904723; x=1792509523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=;
        b=Z4Blhqj5OJ5yeZslzuHODU6xdxR+MkCptG74IwNrNG+mAS4NPa7SgslobhH9wx3+ZN
         tKBnOgMdxOSpRND1pY03v/kLuEbYZjHAI2PzNGTKoytM8bH5p5ew9pTY5m0AqlTCRW8B
         e3hO3MwoEdsCJdpVE7Tf/RTM45fzvCc1ixDVWkyJicZ8XDUW11PPUyGDEIm0pUuxEn5M
         nzlzjyUePoUj6dgkbSWRjVC9O7EOdP6swHY8ukTcmDQ7TRKBwLVQRcWaHkiBP5QTNU46
         w/9OQPSi9+kFsyLY8DWS02xEFE0TC4ygWUahE2n8/ibPOFuFbLrjzUyBqAfV9uyvnPFS
         IYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904723; x=1792509523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtzOa1NC8kzjOt9xbG2RWY9BgPG84LDft99j4Hfp8TU=;
        b=EtFF3AdRqrRlmT+dmvfRukqb/MKgzB8F+3b4WSepUX5keWQLqmjv2Fm5ggvaMnWH6K
         X7Dw4+oROBFIjXb22eMr2GjeCHWcwOzgbW+nn+FCZoE6GY3eQuiS2ZO1ofl8OlAwjohK
         LCrh97rPc+S9VibIa941k/p7Np/EQ7jXCRRxbCV+0Up1LVVqakpKJXdzSOrG8l8scADF
         PW20HgdugbI5ue4gIFbLqj+xpXvgoHayMwSE6vjVPbSx62J2QkAgsjqIu6zXo4Y8Cffu
         nQzqzsYdDGf41Wzklk9dNuiN/CoAly1A64+544h24++/so+TDO4S3SgqO6HKF3UkwPbp
         suJA==
X-Forwarded-Encrypted: i=1; AKwUvBxbbyV6HJlT7weyDuj3X/LQT2hELjAV5VzpNZylfofrqQ3fSdkS23VWsIEkumv/maRAMwBIU6UBQkqSanq4MXu7@lists.infradead.org
X-Gm-Message-State: AFq9FYKHX3lZrXcSQZNRWI8mu6GBdfVXzLtQogaMK43BT2NYiqsX6/G7
	2JKGN9q+txQAND1r8g5i/56KRatVVtmoYLqGVqFWff4nnMas4AxEW7S5
X-Gm-Gg: AYBFou1xOaU1sftSImzEC+rAUJUpNN0RTP3Mlvz0M/nDFb013CvG2K2I8gqCOVQUBbg
	v6byzD31IajVC6+ksxmrp+g2CahQ+kJMOpltFFPovhtldRGakdHGx814Uhy71H46J/nf8KGXMyn
	WglOGoOBjQGM39GerIFJXlHEhiweEF2oHJXe+P1EnLHq7ubpW6a8PU6Hutq2jXI2psPyR89JwMH
	fOfTa62Km77fYqjYohRuEBY9LGMN1PL0q0sVBgbsL6PGDGbI4nCv67cTSDl3mucsk9EsPMSbyQq
	EIZVNQeH0fwU4GQ81RuWn4K1Ine3uvnKOWPtXxAW6lQUgvBhC5r1C/HfNj8SPPvufUjsFHppP4b
	7TpPJ5fC16Dz8iz31HGrnNxWSx10/JvrTIfoGN4olwlP80bJjrR31j5BB9z0ieQol0GTpquIK3k
	4AIkjrEfi+vpF0Dia6y7U1Z+5BAzPp4nkmQlFAKJahFa/mVeKPBUYwd1ecw4whqSDt71Bc+EdI+
	gycZWvU1b2a4sSPU6mh2cOOb0AU
X-Received: by 2002:a05:6a21:4eac:b0:3dd:a00a:7ac8 with SMTP id adf61e73a8af0-3e16bebfd96mr10253819637.53.1791904723172;
        Tue, 13 Oct 2026 08:18:43 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:41 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 08/35] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
Date: Wed, 14 Oct 2026 00:17:07 +0900
Message-ID: <20261013151734.3177690-9-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081845_627530_89F1214F 
X-CRM114-Status: GOOD (  13.68  )
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

Add MODULE_DEVICE_TABLE() to the MT7988 apmixedsys clock driver to
export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
No changes in v2.
---
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediatek/clk-mt7988-apmixed.c
index 416a4b88d100..24f4e7b87a31 100644
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmixed[] = {
 	{ .compatible = "mediatek,mt7988-apmixedsys" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);
 
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)
 {
-- 
2.56.0


