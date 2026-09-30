Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DB9CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=my1/07f1CulK0UA/JMd9zJxqBQXOzzWengmFLOXpouM=; b=Fg/EKGrAH4ZAbZz/yL++JqXLKF
	njEWg4/HttpoeUV7qG0EwDIMy8GB4dBqDObJPINh+wS6MvCGaDIkAtAH+KL7vRPitE+CBsnS1OseH
	gd1W2TplpZ3JzDG2pTGqcorSENWBlIvmbveUEcVDo/NWUrH+8GhAlrkplLDLqSpCWLLVhrFMtacbv
	U5sYyik24YbLO+K9omzs21ppX3gAvY5YFKrZx+pykRMac/6KHrw89zQL0hEP0nZCeBQGUKaaTETrO
	iLDJRFLcuCgqzYNGk1k24a9CG1QrE7NN6qRmILMMWheaI3LYootgPWuCcJas5DbyxHKOuRMzJ3/8l
	HFWqOFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy4j-00000006p6u-3fHL;
	Wed, 30 Sep 2026 17:26:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBy46-00000006ovJ-03MD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=my1/07f1CulK0UA/JMd9zJxqBQXOzzWengmFLOXpouM=; b=EpKS3pJo90f391CZ9LVDz7NLt4
	QK/XHlD6c/a3VehmDnB4nSpD0jS5axNfNoyHmKaaaPfNhsA6kXyI0KvokxAp2NVHWZ31eD7JZAcPe
	fJl8hQIuUfgIoVtP6lo9ogRYjxIsT3LXbBvI+j/O4GtIwtMINOXmYRU6Bc/+CKZla2pdeT8jxeJ7l
	LPGBObgfMOKuYrugKNUtti3amEx+vhNN7N8B8fpAOREwsvxCdRa+QyOrVxEzmr47R4rHx0jmKd0MW
	egdZRwHDv/ZgatCzl2K2/ViK2raAkMsIhkNT/O7ZuvI/8AW3C2bUiHLcRRplbJfDo1PhhrqPyAN8E
	m8dgIEHg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBy43-000000048Wo-0jGk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:25:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8173A4E410D4;
	Wed, 30 Sep 2026 17:25:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 554CC60749;
	Wed, 30 Sep 2026 17:25:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5189E10328A02;
	Wed, 30 Sep 2026 19:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790789152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=my1/07f1CulK0UA/JMd9zJxqBQXOzzWengmFLOXpouM=;
	b=O9gMj+LPZwQNs73ZYdghyQmEOOyyan00c3snYOq/XWHsz9z5vSBenRZFPopk2L0L3Eof8w
	9NIF3V233tlFlfRVx0hG+k+w2P007v6VT70nijdzHPJajoRI0LmoqjDb03ixAi4dxCjvNL
	tUV7Fc3+QFtiUrxT7pcDq4mDdLk5lYViyzNsgnx9I58G9EYRwjbHy2gCdzoybg/B49NKpB
	2gdeUDLEq6rwQR/8zDaDBWr6OKPd7NLeIN82smpJZd01G2d0PGlq3S/a2pvNcrixqmX4cy
	khKCPtJxxKCg7n/WtQWksBZSKTlffCthNmrohj9mDq6tg5lN4p116dWqvQC6HQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 30 Sep 2026 19:24:53 +0200
Subject: [PATCH v6 07/12] clk: nuvoton: ma35d1: Avoid possible error
 pointer dereferencing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-perso-ma35d1-upstream-clk-v6-7-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_182555_443753_DBA30D05 
X-CRM114-Status: GOOD (  17.75  )
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

MA35D1 registration helpers store their parent_hw
argument straight into the parent data, without checking it first. In
case of registration failure an error pointer will be stored in the
table, which is then forwarded to the clk core, which treats any
non-NULL parent as valid handles.

Bail out early when the parent is an error pointer, instead of building
the parent data.

This issue is mostly theoretical in practice, since reaching such an
error would involve a very early -ENOMEM.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1-divider.c |  3 +++
 drivers/clk/nuvoton/clk-ma35d1-pll.c     |  3 +++
 drivers/clk/nuvoton/clk-ma35d1.c         | 13 +++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
index e992e7c30341..57a7b4ed3b5e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
@@ -90,6 +90,9 @@ struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *name,
 	int ret;
 	int i;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	div = devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
 	if (!div)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index c7c0dc91a012..92424e9c669d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -336,6 +336,9 @@ struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode, const c
 	struct clk_hw *hw;
 	int ret;
 
+	if (IS_ERR(parent_hw))
+		return parent_hw;
+
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 1a857f28310f..ceebcbd8c18b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -130,10 +130,19 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     const int *parent_idx, int num_parents)
 {
 	const struct clk_hw *parent_hws[MA35D1_MUX_MAX_PARENTS] = {};
+	struct clk_hw *parent;
 	int i;
 
-	for (i = 0; i < num_parents; i++)
-		parent_hws[i] = (parent_idx[i] >= 0) ? hws[parent_idx[i]] : NULL;
+	for (i = 0; i < num_parents; i++) {
+		if (parent_idx[i] < 0)
+			continue;
+
+		parent = hws[parent_idx[i]];
+		if (IS_ERR(parent))
+			return parent;
+
+		parent_hws[i] = parent;
+	}
 
 	return clk_hw_register_mux_hws(dev, name, parent_hws, num_parents,
 				       CLK_SET_RATE_NO_REPARENT, reg, shift,

-- 
2.55.0


