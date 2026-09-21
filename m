Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BADC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDplaWJfaunbrVntrk6zp9NxBt0dzB8llgC0vJ6omJM=; b=sEAy9x/dbC1A7L+3ij9h9goyb1
	3ahCn5r5suwhW2mXd0v/CNJCOrJkKgppcF044GvpI0ZyZMxVCSI+nKwvBX37Hue3LrKMKEatFlJ8A
	aJ5FMYSuRgmXJYw3c92tn5naHsJ7eG/z2cPVc653rkRsFb9RMMF7KP9A5Ajx9tWU5ApocSBxzWlUu
	qO04a2tKRN/3ncEDjH5njmPZQEAVhOJ2Tb/omkT76gBPCBfm+tE83VpzNY5nocjFrvJu+sxy6DGfD
	jLUT6iw4oZ3x7HeBU2cW1zgcFQOKnxQFEFsLNK5eNIx6sXowIKtV+2SNmztdKZXtlHN/d6fFKlihZ
	omVlJ5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XmM-000000016YL-1Fob;
	Mon, 21 Sep 2026 06:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XmK-000000016WL-3Y2j
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 06:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UDplaWJfaunbrVntrk6zp9NxBt0dzB8llgC0vJ6omJM=; b=dnTb1WlsL4YBIddRHinkTGWfeq
	KXQ8c9YsMeAv7cULsU0jycqDlsquO5HyvLWoaKKY+Gf+26dWlYbfb5ZaEI87BPFXIggo1HgKAX8CV
	veQMsMRMbfyDEVWV1TUbJH0RKuIElnQfpJFksHqQ83B9BGe9t2S3IPgidF7oFB9B4foSQ9F/HLLvA
	lBNcCRU3YMWqFlO1ChmNQwLtl8FViecBefd6ZHBVSUPU7hlwebCb+xFrxW2QQdhIirlYIDE155/Y2
	eJwX58bao19KuKUzQgm+kAMM9KRF+UjiZkUmGATIIQeQ+p/TROIINiColZo7i7FN1Zd060sVnllDa
	y3rrOMBw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Xly-0000000BtWN-2lye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:45:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 10E241A0DF7;
	Mon, 21 Sep 2026 06:45:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D834760339;
	Mon, 21 Sep 2026 06:45:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBD17103290BF;
	Mon, 21 Sep 2026 08:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UDplaWJfaunbrVntrk6zp9NxBt0dzB8llgC0vJ6omJM=;
	b=mLSVt3NvznNsyukRDsWlt4K+0I9Pa3xrVTnGdtXcz1GQRZo2EAPl3+Z/a/rGQmwRJ+wrwz
	ueT/pOSqPYcwnA+pay7Jv37SghzHgdhdqhDGrI7329L3LLIQJm/CamD+1Zifikd9sxjm1k
	63u4g5Y08U0hBqJSJ/UUHnyE2DA1EtvPcMTzE9SHKySjhyS+xFJ+2JAL4DezoSm59fdf0k
	0amBfwXWOILlzaxjFrMCTqBUliVx2ckjAFYAkDZsySHg3bf/T0zbUtBsCsxjlOumgDgAPb
	+KC5B3eODNDXImfvNzv99qLigGUQYW25SOhmsXQheaiRs8Cih6nn/7jtJvSXLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:44:47 +0200
Subject: [PATCH v2 3/3] clk: nuvoton: ma35d1: Avoid possible error pointer
 dereferencing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-perso-ma35d1-upstream-clk-v2-3-209fd32a8b00@bootlin.com>
References: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
In-Reply-To: <20260921-perso-ma35d1-upstream-clk-v2-0-209fd32a8b00@bootlin.com>
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
X-CRM114-CacheID: sfid-20260921_074516_873353_2A9C2F6A 
X-CRM114-Status: GOOD (  16.20  )
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
index e45b3b12f359..f13e7040f71e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -129,10 +129,19 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
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


