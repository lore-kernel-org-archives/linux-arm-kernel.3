Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C453C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=; b=LtvOk944UhNe3sdMihkROgJudx
	azbIOFpGV/Nk372aimRmuVWOx18s/1cGQnFgZW4vKLexU8wU4pI4YRQbcsRV9DLt28OsX256VzCS7
	1Azx5fW2RGNO9taHqv8M9HGl6s6WS9zJ/jeJnyNFbItT9D6Q7vWTdxm7TZqaqQ0RncRX+xZOKVY59
	CxG0k4OvrrqhNd5Fld2iQNsz/9u6vqPlMX+ZD3YmGXRgKO4vXAU6650AZPGJAq1OsbJWqz6OyZzxg
	/jimE7ecgzQf9cWQxhy6NnselvwywX77YKy5KQ7fCTqxdRvUnuJfSTIU7kR8IlkNl/EVs1nDtWPap
	H+IUxWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VUF-0000000DHpA-3966;
	Thu, 10 Sep 2026 03:30:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VUD-0000000DHoR-3b37
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:30:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4869b6f8629so513078f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 20:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011004; x=1789615804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=I+7QM6yex88wECCB9jE64nopLtevXp5aP0XqEy2uQ58XCeR+4CvjIpokzG7AOX25QG
         6XPrNZYX5kIPHXTPxkCtWIOmp2LtHMCF64HG3MhcHboZO9yUZ+zysGiXYaFIj/cQmRon
         /H1T7iG1jmJsfJiDN6imX2bCRf50uFS2PmoXk5ghMnJissZCQbZlCJShpmTh2OiGZuY5
         Ick0pojxAC/DN8z2p4D62/AhVPMt0PZij4R4C3/vFFE28Lj89VSEMJp8fVOGsssctnAU
         JQgsDZWvrBLToqyqSWqnyxc5x8MdickO/21tn+5x5CLb3DTdqznse0s77rECMtL2LxWU
         cODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011004; x=1789615804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKJjaLrDLwATiTkeesDmHnGi32ozSCfkATjDcADW814=;
        b=Jy8/ACkZ/p2mAhdgr0MQ6F1uQYlvdeSwfEqt38Matr7osiAQgwSEEuQQBPiAOc0PpP
         3ZRBOQFrOFIitBN0oIu7VZNd7xxLy9Qi3pbcFTH3ovKkXVda2S0n6WrjBKzBwB2d09MY
         /jAINgtu5sFWnT6AQO+pSpDrYFDZ55mpK1yEg5pdjvy0AeYUlNL2s/0YwvbPfYVbm9Rm
         YCnAPtVCaPHPouyQpqYceWMSQxCR7q2xbhppTNap5tyrrAbNVoQ9VC2OsbIEZ1ILqIAh
         SBBqutBbXyUuyWx47nG4ZHLLsbiIFnPxiy/UJreF3XPVeCozdRCViPP6CSA9YlrIlLz+
         g/1w==
X-Forwarded-Encrypted: i=1; AKwUvBwWc/EMx7PZVm1WL0oIja+RdNzJXnbYHwrsTyMNcOMiDt2XS6ko3Ic23ewfRxLcs4ymeXpmpKNq29cvBrdSylas@lists.infradead.org
X-Gm-Message-State: AFuF++lroIjEM5kD2kRvBHPpgPlcRNAXtEJlcLE9pikkOgwzXUEwg+Or
	ySSel8DK8WwqL4deNEH5cVVmB0Q43XeWWvsE8LgWPdGnR91j31IXkdB8
X-Gm-Gg: AYBFou1qTC8Y41aL8C7BJTtPYyj13tx7uWWIcVEkvUHlDQrIjUNueKiOdK5ib46cRUs
	4bHe7n3Sdj5D7fNaY+nGVHAPAHPbrjSyihP9OQJzSxGODokEfPvbsxVTY7CFcEBHWL8EU4T7r/f
	ZqN99lZUV8fouvIB18EEl2XTwybly6t0obTINI/kL1DiX/afag86eUv7nNP6nvrGSDk7Qn3DRUi
	/Xnlcuc9YML/bQ7GHFy1WfO3eMFZuVIOyzyf2AV9ZOHZaZ6E8JdT0JSMaEbsVRJAqe4odEhqTOq
	e2/eaKrvMR3Xud/VRzs+0QHej/+0s4BnYI1tiRX6R1xQYmPRSUVIGDaMcZbjcjl9Rk1OemA3i0u
	QGVq1K+qgiVWvb8yGDYRJ4Q9JVMAb7OL6qNpzMYKuSfbKma+/9ifyeJdGDrZRcIwcrf0wRD5z4m
	zQqR6OtprXh9kl4EG+MXV9DvpHWit/6rwxAehjaR+7Na3nrwx7kV3u6Vrimm12dejhl23krouBe
	AoWxx9gxabSwSJiUu2AlXYnDemzPfn0PPJhLAD3yEAuPR4IiQkFt0EbhN0tDNQSpVowZkMZP1EO
	g8x3cI/ZqZ3I5lLCZV+PTk3WtG9oSgZqemeFBqc0H/N2KOFoMqitGU3Qsrai5KPSaMiZUE769Yk
	=
X-Received: by 2002:a05:6000:46c2:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-485872cd677mr30353937f8f.14.1789011003718;
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b3d9-b901-0402-5aad-0ef4-88ac.310.pool.telefonica.de. [2a02:3100:b3d9:b901:402:5aad:ef4:88ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm42468266f8f.9.2026.09.09.20.30.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:30:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
Date: Thu, 10 Sep 2026 05:30:00 +0200
Message-Id: <20260910033000.15926-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_203005_936907_59CD7B81 
X-CRM114-Status: GOOD (  12.22  )
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

The comment for mtk_register_reset_controller_with_dev() names the
older helper and documents np rather than dev. The new helper takes
a struct device and obtains its device node internally.

Use the actual function and parameter names and clarify that failures
return negative error codes.

Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/clk/mediatek/reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 562ffd290a22..b09cdcab0c4b 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
 };
 
 /**
- * mtk_register_reset_controller - Register mediatek clock reset controller with device
- * @np: Pointer to device.
+ * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
+ * @dev: Device used to manage the reset controller resources.
  * @desc: Constant pointer to description of clock reset.
  *
- * Return: 0 on success and errorno otherwise.
+ * Return: 0 on success, negative errno otherwise.
  */
 int mtk_register_reset_controller_with_dev(struct device *dev,
 					   const struct mtk_clk_rst_desc *desc);

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.39.5 (Apple Git-154)


