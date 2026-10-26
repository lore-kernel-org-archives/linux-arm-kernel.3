Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wwAjQQ+A;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=jUES+ATa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YvL7WO9Qw1q6ibNOgJWDcAWvN4SLSOgyAvGF80Zshr4=; b=wwAjQQ+AohN/WxBxxa9ztCf9zH
	BUJIAbGL4ySZuqOW+rOOdefkQZ0Xy3pYArnYgEeHq2WqTg8WFn++Ahh5zHoVX62mahSX1Lny4Q4zp
	tnH6+ksnoJI8sZAa8L966RIhcCNhq17DeEezURLnb6QQihunhhstl6J3bJtnVjFYRW+YVgK82dsVS
	P2s0E6bd8SBrGic7MAg0cpE4vMsB/NUBcUc1mVAeOUWCTtM5x3rs10o/M5IQkph41YlL6bINT35Ue
	sZPHX2Zt05rslrLHPEPk93Ro5cTQ9V0DuP5tFjJqdHFo96xa+tjG1/N7gUEEjTROLAaPeETG8t1PF
	HMmjOk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM07-00000002hOk-2023;
	Mon, 26 Oct 2026 14:48:39 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM04-00000002hNn-0Nbp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Yv
	L7WO9Qw1q6ibNOgJWDcAWvN4SLSOgyAvGF80Zshr4=; b=jUES+ATay1UNY6Zu+4
	877kKgw2yEEO1AaQJzGqdbxkzFiFt7ddfiQfdLBN87IxnIu9Yx73HAWjjBAyPTGM
	S4/TfyoaZfCA96ynYMu8n8cG5xvBE0LdPNl8esffgPx54Y0bgQMvdkziRKKEr/BM
	3FGoHnjBJmDZvR7IcvUFDJGtE=
Received: from SYPC (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgA36gkvaN9qPCpOCA--.62724S2;
	Mon, 26 Oct 2026 22:48:16 +0800 (CST)
From: hsyysy@163.com
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Siyuan <hsyysy@163.com>
Subject: [PATCH] pinctrl: sunxi: skip unused per-bank supply on controllers without IO bias
Date: Mon, 26 Oct 2026 22:47:51 +0800
Message-ID: <20261026144751.1392715-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgA36gkvaN9qPCpOCA--.62724S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17Kr1xAw1kZF1ktr1fWFg_yoW8ur4rpF
	sxXFyayr18XF4aqwsrC34ayFy3Gan7G34fCF48KryrXFsxCan8ury2kryrKF4kGrZ5Xr4Y
	qrZ8ZasFgFn8XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi2NtOUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7hC47GrfaDABZAAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_074837_003475_110EA296 
X-CRM114-Status: GOOD (  13.12  )
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

From: Yang Siyuan <hsyysy@163.com>

sunxi_pmx_request() always requests the "vcc-pX" regulator of the pin's
bank, but that supply is only consumed by
sunxi_pinctrl_set_io_bias_cfg(). Controllers without io_bias_cfg_variant
never use it, so the request only makes the regulator core warn:

  sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
  dummy regulator

The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
R_I2C bus, so every H616 board hits the warning during boot.

Return early when the controller cannot configure the IO bias voltage,
and teach the free path that no supply was requested for that bank.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 70099052d..a5222cfbd 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -924,6 +924,15 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 		return 0;
 	}
 
+	/*
+	 * The per-bank supply is only used to configure the IO bias voltage.
+	 * Controllers without bias configuration (e.g. the H616 R_PIO) have no
+	 * supply to request, and asking for one only makes the regulator core
+	 * warn about the missing regulator for every bank in use.
+	 */
+	if (!pctl->desc->io_bias_cfg_variant)
+		return 0;
+
 	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
 	reg = regulator_get(pctl->dev, supply);
 	if (IS_ERR(reg))
@@ -959,6 +968,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctldev, unsigned offset)
 					    PINS_PER_BANK;
 	struct sunxi_pinctrl_regulator *s_reg = &pctl->regulators[bank_offset];
 
+	/* No supply was requested for this bank (no IO bias configuration). */
+	if (!s_reg->regulator)
+		return 0;
+
 	if (!refcount_dec_and_test(&s_reg->refcount))
 		return 0;
 
base-commit: 091b06388b117fefdcb63336ac09956a4914b961
-- 
2.56.0


