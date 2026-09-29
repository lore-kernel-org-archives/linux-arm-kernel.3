Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3407CCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZSiAmvfQAhqVDxMPR75laeoP6OqX37u3qJoc8u7TjkU=; b=YmZGRBPoLE2anZ4EcuJYuB7dy5
	39qMryXOVUZ8tzk17gexo3C8r9Lqhjt2U/HVnMzBEtOs5yI8feI12ZwxMLk2mUGbez83hNBrP77K6
	UZBAoXCReu5Zhg2f7HvgUhyljiKJQNjwyRDBQdRpX62zO4t7VRdBxVoExQHp84So+9nUdLiDqdN4y
	lDmaIe3dVy1nQ+EKLmKSEbAK95xAnZ8pOjW2y3c/Q9MzIHYZx0oVagBrtkejfdS5ECrD5c/r5d9bJ
	z24vpuGbF1MPV3Zb4+jZSsf1VfWK7CkPsLvybLXPd2SrKhfhjMzg1bhP1oICEklCokxG2Msi0eisi
	z2O8/k/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBawa-000000045tA-0UHp;
	Tue, 29 Sep 2026 16:44:40 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBawW-000000045qd-3vdg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:44:39 +0000
X-QQ-mid: zesmtpip3t1790700227t56fcb664
X-QQ-Originating-IP: ruwgAguqXXmvgGsRabDLzZIOFYP2ovGEJlAQXfOKK2E=
Received: from kylin-ThinkBook-14-G5-ABP.. ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 30 Sep 2026 00:43:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14446974795521971140
EX-QQ-RecipientCnt: 10
From: Hongjian Dai <daihongjian@kylinsec.com.cn>
To: codrin.ciubotariu@microchip.com,
	andi.shyti@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	me@cherr.cc,
	Hongjian Dai <daihongjian@kylinsec.com.cn>
Subject: [PATCH] i2c: at91: release DMA channels when probe defers
Date: Wed, 30 Sep 2026 00:43:40 +0800
Message-ID: <7D85C6CB6BF0A82E+20260929164340.41628-1-daihongjian@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:kylinsec.com.cn:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MCg5+ArSTX6cnkbLBDuw/XLMOxMvJYQ986eHpEYKeTgNw3VzLOoRpNnc
	QboNz7xor0Zays01hvGKgQchVQxWp2LwUcdsNId3dxWGAVjIIOK8oZxq8UfsixkW9nHjMrz
	7dfJgw7JK8ey49p4bjPZZlLTTtoPC9Ou/LbmgiNqiJPoIN3gSs1QFmQd9DGs4CnEPCxkAmY
	aYiiYGen60VU0IPTVtVM+e7Ot0O2YhL77zX/ulfpvc1heH2BDqrnNpRDh/qwRUxbQqqia6+
	6fGEmcTlWgpV+jUFy9iWdwRWlZ8BTbLWzJYfIFOOJG6IqXLYerfw3wP2zua5C4SAq2OiYGf
	SWlXGSWxdO7SAmj3Fj6qtaO0cxh//41xxzFwa4CA3H/lf5vCnHGVptzfeRzPjqboCEQLu7N
	kpqM1r+e/uI2SrE312P3MgC2EDYETB4iQ/eq+URo3aV+1P6yi5Ye2+OEZLLPtFhpRS/jV0U
	yK3m9CrhTdPVCf7v2MxiMuS6dD3PZbs8rIvThvv52dusrLMWe4DQjDsRrmc9k2XraMS19rS
	397RpSdk4/jGylHY0UMHMzLUBjvQuAbPfXCeRBLlKoozaw4rZKicCWpxJYijTa0mcnYBeqm
	urQo0eUQ6T393q9HEv5+4Jf1uMEl8+/bLAXPkPMvL97BJig6V97hKGzditAVIP/H4wk3q9c
	gUz1A8Fh0EFcNe84AXu5OQ/hPebDKiQLHwLXAQ2TXYvh4V+0TTf3sQnY3+NM3omssszycpQ
	AG7JlR9WWKzwPqYYo8e/gbWy5fQSMj4S6kfczfKVyzognJZIxyVicqqFUh/xxFxsITCKdVO
	cQVE1phBvaXCUw8MDL93LdB7LH5GtDuuf2Ncr+2B632OphCHYzSTl9/Nq7E/6yMGJY89KRN
	DNjkg/sjZF/iO1PblGZTB8/BDdC5avOmdh1lgZsKjIYeVRZY0hIeUXEckJCdOV8jh+WRFbj
	kqoz2XEGtA6TZzrVLDnCnO/XdgVYpd//T52TeoI80Bu0nPg1sQu2PCw7IGqOTlj3CGoFUeQ
	Awk5OklWdYDEFq6INTGTQizxC7RiBtvt4FaU+1QQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_094437_601487_40101D4C 
X-CRM114-Status: UNSURE (   9.57  )
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

at91_twi_probe_master() can return -EPROBE_DEFER from
at91_init_twi_recovery_info() after at91_twi_configure_dma() has already
claimed the tx/rx DMA channels. at91_twi_probe() then returns without
releasing them, and since dma_request_chan() is not devres-managed the
channels leak on every deferred probe attempt.

Release the channels before deferring the probe.

Fixes: f7eeb1af8537 ("i2c: at91: release DMA channels on remove and probe error")
Assisted-by: LLM
Signed-off-by: Hongjian Dai <daihongjian@kylinsec.com.cn>
---
 drivers/i2c/busses/i2c-at91-master.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 68238cc8aee0..e0c3de5e8203 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -921,8 +921,14 @@ int at91_twi_probe_master(struct platform_device *pdev,
 	at91_calc_twi_clock(dev);
 
 	rc = at91_init_twi_recovery_info(pdev, dev);
-	if (rc == -EPROBE_DEFER)
+	if (rc == -EPROBE_DEFER) {
+		/*
+		 * The DMA channels were already set up above, release them
+		 * before deferring the probe so they are not leaked.
+		 */
+		at91_twi_dma_release(dev);
 		return rc;
+	}
 
 	dev->adapter.algo = &at91_twi_algorithm;
 	dev->adapter.quirks = &at91_twi_quirks;
-- 
2.43.0


