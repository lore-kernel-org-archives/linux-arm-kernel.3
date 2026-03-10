Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D84DFD2D63
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IU8oWwwvjxEc+ee+Sw/7Fv1DFEugv27jyfna2MxitOo=; b=yCaqC9tLzbNCQwSE5Qgi5hbEpO
	bV5zx3zcF9FAczxcAapCG7DcVmqPucIktuaTMP8mzTSVsmgig3SiVyVHKvwuv/E1tHmKlDbJ0yuEf
	vThd+YZZ0Hej+dK/Uqm7myKhydrKPHxGfmcCr1ABgo5OtFEApGI/N3WwQ5sA5uJwoaniQVqXHjdvk
	eQHgeYw0iHMfFxiH2ou0aVfCUUM1G07gsvvFsykeyFimCWDA9onRWWGYuu54CenqYQplvFk6IBR3/
	pqG5LVKgV4Ux6d1fGaXAaOI7/G7BcSUhADjtoeTymbygb+FdqN3KOpv+J6F479d+wgudfj5pDIUWr
	15zORyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwKL-00000009Uv9-40Ab;
	Tue, 10 Mar 2026 12:36:45 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwKI-00000009Utg-3ZSM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=IU8oWwwvjxEc+ee+Sw/7Fv1DFEugv27jyfna2MxitOo=; b=NaN+ur9ZCceLTp
	bMFKuyyOxhDvOqyiTk+pNrPJoRtIx4qBxz2xjDvWEBCMcblLgO93klik3wtkqqeYShVqfxONVkZLh
	/4pIG0LC6oCz1QywgnhL59vXRTmpH+CDNeXo8zw1B8shUDKKUKjj0Q+n8xD8EqgJfUCgU5g6C0ZZm
	CZrYosjNCev1+MRrA7y0sFoM3vMInLYf8InbMaKHHbeVVFR7DKtV6Yzkl1I+yLHKSTbg4Z5ohHkyc
	ZkmA/GLBS8aSiU64bv5hfUFKv6MT999TukfMhFFOi4rNvMRRU1mPMYo/khhKxGfKHWz+d1CbVmH8y
	DCW5pVWDjR14ezyocPZg==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vzwK3-006p9w-CY; Tue, 10 Mar 2026 12:36:27 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vzwK2-00000000gct-2Y8k;
	Tue, 10 Mar 2026 12:36:26 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-clk@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.co,
	andrew@lunn.c
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] clk: mvebu: armada-37xx-periph: fix __iomem casts in structure init
Date: Tue, 10 Mar 2026 12:36:25 +0000
Message-Id: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_053642_996104_E720D122 
X-CRM114-Status: GOOD (  10.79  )
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

There are a number of casts to "void __iomem *" in the initialsation
of the driver's clk information. Fix this by adding a helper macro
for the cast.

Silences a number of sparse warnings:

drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg1
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg2
drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
drivers/clk/mvebu/armada-37xx-periph.c:255:1: warning: incorrect type in initializer (different address spaces)
drivers/clk/mvebu/armada-37xx-periph.c:255:1:    expected void [noderef] __iomem *reg
drivers/clk/mvebu/armada-37xx-periph.c:255:1:    got void *
...

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/mvebu/armada-37xx-periph.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index bd0bc8e7b1e7..3123771b9c99 100644
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -126,9 +126,11 @@ static const struct clk_div_table clk_table2[] = {
 static const struct clk_ops clk_double_div_ops;
 static const struct clk_ops clk_pm_cpu_ops;
 
+#define __reg(__x) ((void __iomem __force *)(__x))
+
 #define PERIPH_GATE(_name, _bit)		\
 struct clk_gate gate_##_name = {		\
-	.reg = (void *)CLK_DIS,			\
+	.reg = __reg(CLK_DIS),			\
 	.bit_idx = _bit,			\
 	.hw.init = &(struct clk_init_data){	\
 		.ops =  &clk_gate_ops,		\
@@ -137,7 +139,7 @@ struct clk_gate gate_##_name = {		\
 
 #define PERIPH_MUX(_name, _shift)		\
 struct clk_mux mux_##_name = {			\
-	.reg = (void *)TBG_SEL,			\
+	.reg = __reg(TBG_SEL),			\
 	.shift = _shift,			\
 	.mask = 3,				\
 	.hw.init = &(struct clk_init_data){	\
@@ -147,8 +149,8 @@ struct clk_mux mux_##_name = {			\
 
 #define PERIPH_DOUBLEDIV(_name, _reg1, _reg2, _shift1, _shift2)	\
 struct clk_double_div rate_##_name = {		\
-	.reg1 = (void *)_reg1,			\
-	.reg2 = (void *)_reg2,			\
+	.reg1 = __reg(_reg1),			\
+	.reg2 = __reg(_reg2),			\
 	.shift1 = _shift1,			\
 	.shift2 = _shift2,			\
 	.hw.init = &(struct clk_init_data){	\
@@ -158,7 +160,7 @@ struct clk_double_div rate_##_name = {		\
 
 #define PERIPH_DIV(_name, _reg, _shift, _table)	\
 struct clk_divider rate_##_name = {		\
-	.reg = (void *)_reg,			\
+	.reg = __reg(_reg),			\
 	.table = _table,			\
 	.shift = _shift,			\
 	.hw.init = &(struct clk_init_data){	\
@@ -168,10 +170,10 @@ struct clk_divider rate_##_name = {		\
 
 #define PERIPH_PM_CPU(_name, _shift1, _reg, _shift2)	\
 struct clk_pm_cpu muxrate_##_name = {		\
-	.reg_mux = (void *)TBG_SEL,		\
+	.reg_mux = __reg(TBG_SEL),		\
 	.mask_mux = 3,				\
 	.shift_mux = _shift1,			\
-	.reg_div = (void *)_reg,		\
+	.reg_div = __reg(_reg),			\
 	.shift_div = _shift2,			\
 	.hw.init = &(struct clk_init_data){	\
 		.ops =  &clk_pm_cpu_ops,	\
-- 
2.37.2.352.g3c44437643


