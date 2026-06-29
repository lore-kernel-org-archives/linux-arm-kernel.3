Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A482C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQXKnNh1b5EuPBwmDipG7e1JVmal6ripcmfgsJxs5jk=; b=u0QnCcykzYngdXgbNwcfQJB3NP
	QMHCeVtTHShjC1pgZ+qzhsxBtnT15O8+fDcZPPqSmRAb+d2ogwYkGBeWmgoVqxiM1592oBQ2FEyZN
	IcyEM3QtjC4HoYlAx0yiTYCwJoadxoYLioQidi8wPh3ymcWdJaUMciGEJPNFYBXZSiOUP3/OEGohn
	b3g0rTl2ig6MqFckOAykir+xBuDKoW4wUPJn+PtxA8T2tl3IS+v5xg/+373O3xPQzkUHfus/GrVnS
	piVoEFOayq69ruaESfotztdotqiH/IJp/1pQ2w9CnZxZe/YdR4uLznFrc5vPi9jvmtqg96+zIDG0t
	XZHtHbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5oF-0000000Dnis-41fb;
	Mon, 29 Jun 2026 06:49:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5oE-0000000DnhL-3uY5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45B1960052;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED214C2BCF6;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715774;
	bh=o9rQxS6VSnLZ8UKdGcYxwjs9cwreXI3LIctajGTw3oc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jO8UnOjMxgR7T59iLunDizziDNuV9ICXSGMpyrRKLa5eU5bVC3K23QiQ2zRu3Q6B7
	 n+D2MbuYJ2iitwtqZtWECRmaK7XM4a8uiEP6sY31YHsw9E004TMM5BHk459ZqgGzlK
	 uMIjAuDvLkEYOoF4dV8D6RSMa2PyFZOSwLEFY9eBKydN3OB1gtbKp0O02lKjbhDSZP
	 lzYASnAPeTykIhgyr/rld767lCazOM8u/AHfP/aU5z6Q+ZVa+3Te+upwTt3GKrU/et
	 euImpHD4B4TLWaH3PYxdMOZ5daR5uTcqZVRUv9EMd3Q3NvmYBF91PZxBLdwEVYRtG8
	 cp7rltm1ZAs6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4F3C43602;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
From: Yu-Che Hsieh via B4 Relay <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Date: Mon, 29 Jun 2026 14:48:59 +0800
Subject: [PATCH 2/4] ipmi: bt-bmc: Track open state per device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-aspeed-bt-bmc-multichannel-v1-2-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715772; l=1964;
 i=yc_hsieh@aspeedtech.com; s=20260629; h=from:subject:message-id;
 bh=kkcdpH7g4gFHRExA7T4VUvsyg0bKpkuItRJGEI3xPJA=;
 b=yHQTY1jCvmxKBbcWqHMlIZQ8QIbmxk/w14R13q3bhtuzMgZpj11PsEVwfZCzFGlKhBzXd+Lfs
 TSHkqXBCUHbCjiz3yJ7vSAa2XwHJor+R157niWVbLj+PCVz3VziveqT
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=kLxUeF7g6teciq79it9N3tYNgp3yCspZ+AHlYSnZ0gs=
X-Endpoint-Received: by B4 Relay for yc_hsieh@aspeedtech.com/20260629 with
 auth_id=844
X-Original-From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
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
Reply-To: yc_hsieh@aspeedtech.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

The driver uses a global open count to allow only one userspace client

to open the BT device at a time. This works for a single device, but

also prevents independent BT device instances from being opened

concurrently.

Move the open count into struct bt_bmc so each device instance tracks

its own open state. This preserves the single-open behavior per device

while allowing multiple BT devices to operate independently.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 drivers/char/ipmi/bt-bmc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index f3c67272502f..486ecc0b6815 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -64,10 +64,9 @@ struct bt_bmc {
 	wait_queue_head_t	queue;
 	struct timer_list	poll_timer;
 	struct mutex		mutex;
+	atomic_t		open_count;
 };
 
-static atomic_t open_count = ATOMIC_INIT(0);
-
 static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
 {
 	return readb(bt_bmc->base + reg);
@@ -152,12 +151,12 @@ static int bt_bmc_open(struct inode *inode, struct file *file)
 {
 	struct bt_bmc *bt_bmc = file_bt_bmc(file);
 
-	if (atomic_inc_return(&open_count) == 1) {
+	if (atomic_inc_return(&bt_bmc->open_count) == 1) {
 		clr_b_busy(bt_bmc);
 		return 0;
 	}
 
-	atomic_dec(&open_count);
+	atomic_dec(&bt_bmc->open_count);
 	return -EBUSY;
 }
 
@@ -313,7 +312,7 @@ static int bt_bmc_release(struct inode *inode, struct file *file)
 {
 	struct bt_bmc *bt_bmc = file_bt_bmc(file);
 
-	atomic_dec(&open_count);
+	atomic_dec(&bt_bmc->open_count);
 	set_b_busy(bt_bmc);
 	return 0;
 }
@@ -425,6 +424,8 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	if (IS_ERR(bt_bmc->base))
 		return PTR_ERR(bt_bmc->base);
 
+	atomic_set(&bt_bmc->open_count, 0);
+
 	mutex_init(&bt_bmc->mutex);
 	init_waitqueue_head(&bt_bmc->queue);
 

-- 
2.34.1



