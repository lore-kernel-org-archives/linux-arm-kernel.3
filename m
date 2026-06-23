Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF4FCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JyqaO8kPsSCsSS6QqHxsmEpq9UNz19yAQVVRi9X8TRg=; b=lXG9RLnyJ10TABccYSj+c2+5A5
	2F1LJdby0XYsY9D2NAesVJi7F2CZ7aocUBLCkM4UYw86z4TEXj4sOKb8WBpcupeYCF2fcLL6CBjen
	BLN+opi4cWeAsEDWc27xEe5xF2MHFh4DB4bTM7coTRmJzneF55cVPi766U68+1qTJG/wTR5YUqaP8
	sH/W2ZO0KPPsWSWCHyYFbkLzO+L/byDojwVXAA1r5JfQVMtMzQJHOWKXBWRO0YUKjjLYeTOSTkQiJ
	ZNsrjepUvmoInGzn/E02T8fOLBwxKCHnOSumhtlo5x4TW8cUNhuELVi+snf5k0VFb2KgGQNkM6s5l
	NqGOMUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzlD-00000006Dyk-1XPS;
	Tue, 23 Jun 2026 11:57:47 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzlB-00000006Dxt-0Zoe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Jy
	qaO8kPsSCsSS6QqHxsmEpq9UNz19yAQVVRi9X8TRg=; b=P6OoiXkLr9gihEQiB4
	tUtBNanoJzvJcaXZ0p8MyTjMR94VKYZLHu/xfWkkqHLr4MkweRWwkp9ZkLbE07rL
	jyfCG5SZXhoLoW7XO3iqbqVvSM5A+MLbjPYQnsL26rhkXrnDmRwp4h25TZpfr22T
	W6BTsvZ4ehEcJsrh6Zpa3SBLI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDXvxObdDpqHqw_FQ--.64734S2;
	Tue, 23 Jun 2026 19:57:17 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	kees@kernel.org,
	horms@kernel.org,
	bjarni.jonasson@microchip.com,
	lars.povlsen@microchip.com
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: sparx5: unregister blocking notifier on init failure
Date: Tue, 23 Jun 2026 19:57:14 +0800
Message-Id: <20260623115714.2192074-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXvxObdDpqHqw_FQ--.64734S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wry3Gr4rZr13GF13AFWxCrg_yoW8XF43pa
	y5uFykCr18Kr45u3Wjkw18AFyDWw17KrWUur1ft3s0ga45KFZ3Ca4UtFyYqr10k3sruasI
	qayDZa48u3yDC3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zibdbUUUUUU=
X-Originating-IP: [240e:604:311:e68d:298a:1bbc:177b:53c8]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxR1t22o6dJ2TwAAA3E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_045745_595089_9FCBC11B 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

sparx5_register_notifier_blocks() registers the switchdev blocking
notifier before allocating the ordered workqueue. If the workqueue
allocation fails, the error path unregisters the switchdev and netdevice
notifiers, but leaves the blocking notifier registered.

Add a separate error label for the workqueue allocation failure path and
unregister the switchdev blocking notifier there.

Fixes: d6fce5141929 ("net: sparx5: add switching support")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
index 644458108dd2..dac4dd833127 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
@@ -765,11 +765,13 @@ int sparx5_register_notifier_blocks(struct sparx5 *s5)
 	sparx5_owq = alloc_ordered_workqueue("sparx5_order", 0);
 	if (!sparx5_owq) {
 		err = -ENOMEM;
-		goto err_switchdev_blocking_nb;
+		goto err_alloc_workqueue;
 	}
 
 	return 0;
 
+err_alloc_workqueue:
+	unregister_switchdev_blocking_notifier(&s5->switchdev_blocking_nb);
 err_switchdev_blocking_nb:
 	unregister_switchdev_notifier(&s5->switchdev_nb);
 err_switchdev_nb:
-- 
2.25.1


