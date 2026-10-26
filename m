Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=faDdtK2h;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Zdp1usVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NgUZou+QAUenodbqqsNTHG+MAZHRcJXPTQZv1JbHVys=; b=faDdtK2hsYNR5T
	mrW+Wj94GiwRND9HWEGieiK5oyEtpudOzg6bEGSYAb7+zpb3e0LmMVIPOusgU/c7x0Y7ao+xRP9oO
	StsnOUw0XRNTvcqEFP9WENKaEj1nHsxYQFGCNyhKfbocuaOM71+0oVy4pNu48kBlD0epvM1lAHYbd
	Cy6uue1YW9QbXkwryTi/4TbLdVTqjA3ybiMloiq2HytZpHRLpOouFFYEnHwoHAmO6HBWY2AoOBRn9
	AnZ5PsiL0s97wvWpLpjWFJfrHPq3oIpvBcnnH8xhjYBNXIXb1c5eOf17QkPbeFkcjetTGmFaUqzPm
	nfFqySQuqpLZgeOMEl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMVg-00000002kjz-15Xg;
	Mon, 26 Oct 2026 15:21:16 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMVd-00000002kjW-023q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 15:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ng
	UZou+QAUenodbqqsNTHG+MAZHRcJXPTQZv1JbHVys=; b=Zdp1usVO+wA1HyRZky
	ELohWUrb/FJ+Wz0rd8BNcMAJLR2AJTCopWLgYZjKLUQrhK2qtFJIp8OBGc82TKSJ
	XJDf45LKpo/wjE6WreuMLkMg14/R/8xSMf45Cc6Vrixj9BJddKRvmlWXk86cUPr7
	iHtijdSLB3Vlf6BkvdfoVPlxU=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDXXx3Ub99q1qL2Cw--.8607S2;
	Mon, 26 Oct 2026 23:20:52 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: sunxi: request the per-bank supply optionally
Date: Mon, 26 Oct 2026 23:20:27 +0800
Message-ID: <20261026152027.1417178-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144751.1392715-1-hsyysy@163.com>
References: <20261026144751.1392715-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXXx3Ub99q1qL2Cw--.8607S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF43XF4fAr4UAFyftFb_yoW5Xr4kpr
	sxXr1akr4kAFyfKw47uw1xtr1fuan7Ja43CFy0g34rXFs8AFs3Xw1akF4YkFWkGr4kXr4Y
	yryDZFyxGF45Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UH7K3UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7RWj12rfb9XufgAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_082113_489192_6423B130 
X-CRM114-Status: GOOD (  16.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The per-bank "vcc-pX" supplies are optional in the device tree: the
binding documents them, but notes that many boards do not describe them.
sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
falls back to a dummy regulator and warns for every bank that has no
supply:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Use regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---

Changes in v2:
- Do not skip the supply on controllers without IO bias configuration:
  the per-bank regulator also powers the physical VCC-Px rail, so a
  supply described in the device tree must still be requested and
  enabled.  Use regulator_get_optional() so only banks that have no
  supply are skipped, which silences the warning without changing the
  power management behaviour.
- Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1-hsyysy@163.com/
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..23c1fbd46 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -925,11 +925,19 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	}
 
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	reg = regulator_get_optional(pctl->dev, supply);
+	if (IS_ERR(reg)) {
+		/*
+		 * The per-bank supply is optional: boards that do not
+		 * describe it simply have no regulator to manage.
+		 */
+		if (PTR_ERR(reg) == -ENODEV)
+			return 0;
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +967,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* The per-bank supply is optional, so this bank may not have one. */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0


