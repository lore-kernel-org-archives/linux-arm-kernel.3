Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C0F112583E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 15:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aett3IMUD9KEZqaMbiw5Gxih3cHDfRoXRUmqjmLuoSo=; b=hMS9Zd4moEstZi5pkE0XruLh4D
	Jy4PTevwQO6vlG0ShwHMzqlCTFPd4H44c8Sz8MPiLsigoByCYj2rCjptimoG2JNVIWn/vlCnbzave
	LT5MV7XZ2kktW9MbZyp4FFYKzVdTu6Wlj1e3qcCe13LRMXVaCQHI5/0DPNe0PU9Gi1b69ek/IqeIP
	5e5oHa5XZGGoe8kr0VwmclrVJWJtCtMCRY+yv/Bf7v2DDYTnHzeTg/kOi2CVfHTLzWU4XuyUb6S8R
	d7vPxsflHIr/ZkiVUHW3WiiPL/UZ7PmZx0LFX52lihj/QRi1pCx1T4PzEdSkL5rCPT/eXQlnY8TuX
	M+JiRcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LGO-0000000Bm86-3ORl;
	Wed, 11 Mar 2026 15:14:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LGN-0000000Bm7o-0pZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 15:14:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46DD360054;
	Wed, 11 Mar 2026 15:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE44C4CEF7;
	Wed, 11 Mar 2026 15:14:16 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Use of_phandle_args_equal() helper
Date: Wed, 11 Mar 2026 16:14:14 +0100
Message-ID: <d8338ff1fd795912b466ccf55b49dcd6885b6925.1773241833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Use the existing of_phandle_args_equal() helper instead of open-coding
the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is an old patch of mine, and originally used of_phandle_args_eq(),
which never made it upstream.  Only recently did I notice the existence
of of_phandle_args_equal(), so here we go ;-)

To be queued in renesas-devel for v7.1.

 .../mach-shmobile/regulator-quirk-rcar-gen2.c    | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
index 4277ba5b3ae052bb..747a96c58df15075 100644
--- a/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c
@@ -141,7 +141,7 @@ static struct notifier_block regulator_quirk_nb = {
 static int __init rcar_gen2_regulator_quirk(void)
 {
 	struct regulator_quirk *quirk, *pos, *tmp;
-	struct of_phandle_args *argsa, *argsb;
+	struct of_phandle_args *args;
 	const struct of_device_id *id;
 	struct device_node *np;
 	u32 mon, addr;
@@ -171,14 +171,14 @@ static int __init rcar_gen2_regulator_quirk(void)
 			goto err_mem;
 		}
 
-		argsa = &quirk->irq_args;
+		args = &quirk->irq_args;
 		memcpy(&quirk->i2c_msg, id->data, sizeof(quirk->i2c_msg));
 
 		quirk->id = id;
 		quirk->np = of_node_get(np);
 		quirk->i2c_msg.addr = addr;
 
-		ret = of_irq_parse_one(np, 0, argsa);
+		ret = of_irq_parse_one(np, 0, args);
 		if (ret) {	/* Skip invalid entry and continue */
 			of_node_put(np);
 			kfree(quirk);
@@ -186,15 +186,7 @@ static int __init rcar_gen2_regulator_quirk(void)
 		}
 
 		list_for_each_entry(pos, &quirk_list, list) {
-			argsb = &pos->irq_args;
-
-			if (argsa->args_count != argsb->args_count)
-				continue;
-
-			ret = memcmp(argsa->args, argsb->args,
-				     argsa->args_count *
-				     sizeof(argsa->args[0]));
-			if (!ret) {
+			if (of_phandle_args_equal(args, &pos->irq_args)) {
 				pos->shared = true;
 				quirk->shared = true;
 			}
-- 
2.43.0


