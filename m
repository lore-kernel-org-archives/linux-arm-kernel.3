Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lJ4qBMvu;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AllCAX8h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yxHn6IyMEc/gFXG0FL2K57vaxjrPtjjGVPSWUg++9V4=; b=lJ4qBMvuX4/mu9
	DdBqDyQg7p25PhuMYUHvVU+ZEFunkNw36hzajLgNxgIr7wvhe3FCjUQcyQXU2No415DGn6Z8a5+gI
	/BwJaGhkjCI/EZdlQD6+k/ci8AvFXQCmLsTQY0Us8oJnoFuCsPjcv+0wH9mPaQPLGRmG0QEadIfQe
	j9xjKkVgHPq6fxqulHHLyez4jLmJZA2ruWoxHuFWRl0yM541d4hiLgDmDt8AbWcXHvKO6AoUMqzBh
	iN1SV6cYjvafTgm7MsnZbX4xZ3xdHSVUtcb1wVowb63Q9Q13Ld4xYaZ/ExyQSmsTfOyBGJUrWBUEK
	4Px+9z+SJ826XH5tyi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLO1d-00000002wa6-2eMu;
	Mon, 26 Oct 2026 16:58:21 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLO1a-00000002wZI-1DjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yx
	Hn6IyMEc/gFXG0FL2K57vaxjrPtjjGVPSWUg++9V4=; b=AllCAX8heHI5B0M6rm
	uaSDf4/DxlryL9aKMWSKG8xrdThIwsF0UzOUPYKhIEu1YCaVCbfQUg/R7Fx4GiZi
	zJfs2C8k0BgUyq8xI3c2XrEIOZHOHSy/8afrTgu1XvFxofxm+RE5zXWdOcCVKh6H
	Zb93DHSNEyOlUZ1u3TouaW65g=
Received: from SYPC (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXWG+fht9qNCbrCA--.16615S2;
	Tue, 27 Oct 2026 00:58:08 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] pinctrl: sunxi: request the per-bank supply optionally
Date: Tue, 27 Oct 2026 00:57:42 +0800
Message-ID: <20261026165742.1478383-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026152027.1417178-1-hsyysy@163.com>
References: <20261026152027.1417178-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBXWG+fht9qNCbrCA--.16615S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW7AF4rCr1UtrW5trW7CFg_yoWrtF1xpr
	4fXryayr4rJFyxJw4xAw12yryS9a1xJa43CFykK345AFn8GFy3Jw1jkF4YkFs8Cr4kJr4Y
	vFyDZ34xGFn8X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07ULo7_UUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QBckGrfhqBnzgAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_095818_758460_9803A260 
X-CRM114-Status: GOOD (  21.54  )
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

Use of_regulator_get_optional() instead.  A bank supply that is described
in the device tree is still acquired and enabled, as it powers the
physical VCC-Px rail, but one that is absent is skipped without a
warning.

The OF-only lookup matters here: regulator_get_optional() also falls back
to a global regulator-name lookup.  If a regulator with the same name as
an absent bank supply is registered later, a subsequent pin request in
that bank could acquire it and start the per-bank refcount at one, after
earlier pins in the bank had already been requested without a regulator.
Freeing any of those pins would then disable the supply while other pins
in the bank are still active.  Restricting the lookup to the pinctrl node
makes an absent supply permanent; record that state so later pin requests
do not retry the lookup.  The refcount therefore stays balanced.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---

Changes in v3:
- Use of_regulator_get_optional() instead of regulator_get_optional().
  The latter still performs a global regulator-name lookup, which can
  bind an unrelated regulator that appears after some pins were already
  requested and unbalance the per-bank refcount.
- Remember that a bank has no supply so later pin requests skip the
  lookup, and keep the existing no-regulator check in sunxi_pmx_free().
- Link to v2: https://lore.kernel.org/linux-gpio/20261026152027.1417178-1-hsyysy@163.com/
- Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1-hsyysy@163.com/
---
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..d2345a85a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -913,23 +913,44 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 	struct regulator *reg = s_reg->regulator;
+	struct device_node *np = dev_of_node(pctl->dev);
 	char supply[16];
 	int ret;
 
 	if (WARN_ON_ONCE(bank_offset >= ARRAY_SIZE(pctl->regulators)))
 		return -EINVAL;
 
+	if (s_reg->supply_absent)
+		return 0;
+
 	if (reg) {
 		refcount_inc(&s_reg->refcount);
 		return 0;
 	}
 
+	if (!np) {
+		s_reg->supply_absent = true;
+		return 0;
+	}
+
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
-	reg = regulator_get(pctl->dev, supply);
-	if (IS_ERR(reg))
+	/*
+	 * Use the OF-only lookup: regulator_get_optional() would also match
+	 * a same-named regulator from another device.  Such a regulator can
+	 * appear after some pins in this bank have already been requested,
+	 * which would unbalance the per-bank refcount.
+	 */
+	reg = of_regulator_get_optional(pctl->dev, np, supply);
+	if (IS_ERR(reg)) {
+		if (PTR_ERR(reg) == -ENODEV) {
+			s_reg->supply_absent = true;
+			return 0;
+		}
+
 		return dev_err_probe(pctl->dev, PTR_ERR(reg),
 				     "Couldn't get bank P%c regulator\n",
 				     'A' + bank);
+	}
 
 	ret = regulator_enable(reg);
 	if (ret) {
@@ -959,6 +980,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* The per-bank supply is optional, so this bank may not have one. */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 8bd00c6ff..651249b23 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -162,6 +162,7 @@ struct sunxi_pinctrl_group {
 struct sunxi_pinctrl_regulator {
 	struct regulator	*regulator;
 	refcount_t		refcount;
+	bool			supply_absent;
 };
 
 struct sunxi_pinctrl {
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0


