Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920C606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nDiU+zy9;
	dkim=pass (4096-bit key, unprotected) header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=Q4+ohvyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bbgOkBv14A9d4wO2ZfS0KJRZcE91RuXy5G4jiTp1jO0=; b=nDiU+zy94U2R1YH7UzpdYP6Cz4
	Z/jY9bxqIIHRaFRevxY6Htvhcwkosd7qQ9kFV+P654qKLVF/ftTFXAD4jmIe5XyAfgeNDtmVHvQFa
	oi3NuQcZay1fcxanCghFoTECQa9uK/HWPLzEUaTVea8Z7bKm0Zys/dHGzWhuUIv1cuLB0fEeYMYCg
	b8EWQWGDyzVQli06x0Fg7S/HsoN4UuwIymKSE513v1maETs4keFk/ERn9x7FA2FVVSxfKLnDtdHvt
	kOduPWZM7U+1eKgG5O22gMIQChDI5ZE25F8JFbjg6cTgA5+fK98paV5P5Yn4s3UCcRr9cHcWwVVmk
	eqcndPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2IW-00000000jZa-1vSr;
	Tue, 03 Nov 2026 00:22:44 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2IS-00000000jXt-3xT9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:22:43 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id E49AB610F3
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:22:28 +0100 (CET)
Received: (qmail 10944 invoked by uid 988); 3 Nov 2026 00:22:28 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Tue, 03 Nov 2026 01:22:28 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt7603: avoid deadlock on failed channel config
Date: Tue,  3 Nov 2026 01:22:09 +0100
Message-ID: <20261103002210.166517-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=0IaUd68iA8zNEbntjgxpaciU9eYyrP6IEDHh8U3mBas=;
	b=Q4+ohvynJpU7XX6TsaKD4WHzqc2RVzr9ST4DSpvCWlmNBJ1ayJxeL4sGcg9wtynNR2uJe7NzvF
	PMSHno5Zqj0ZfVUlteK/coz8o3lzll7bo5JTRP30gDrMxi1aCZsHUmil78Z7A6jkfh9iCQRrWw8t
	vXmThNDw6uuc0n7MYsVIQDTASk2gh/9wCagelDvFuGTLw7YZ3B2BQvm1xBuaCy55eloMc3foW3rd
	YMdqtpwiIzD97wOz8x9DXKSuF+vhR46WuKFqIBLW6w8hvqSYDtKqJHPEiWV2Tx7YhLMD7ylvtLCN
	RGrwBNFk/4zls1I4wkHDIjXmXjFQmeSQ4nH9+C9cju4ZcqR7saPx6OvoCrTAY00LmkRBr02mIsdr
	qyht/1QKxNqzW4p9YRrjz1CS/omL0MIV163U3Vct4OcZxmxDhS0IXE27AEs5bGbTuF9hKZTgoQIM
	BHKA9smUcZbmWQVgQvQnO6dVCAp0tYEBg6yVvjYXSCDs/X3ZlvopeVOwden8sj6DTf4FALt2NppH
	MWQ69RxwVIGXQtykaORV4dDYvDLbbLqwVMa4jUCSVvGfoOpGd+qrBXGdPJEtw4PyFu5UETwrjWst
	1aS5aqr3DXb7OfwXLzw/uNB9fIdTeNv9fpOHb20YkpO6dxqXMCfUbcZ4ZgGp9mUF2bQdNJRrA1on
	E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_162241_950675_D5F720E8 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The synchronous call to mt7603_mac_work locks the global
mt76 device mutex. This can create a deadlock situation,
as the lock was already taken in mt76_set_channel.

Instead schedule the next mac_work iteration to happen immediately in
case a reset is necessary and perform the reset asynchronously.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7603/main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 757664e9e1f20..61f2461939872 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -172,9 +172,6 @@ int mt7603_set_channel(struct mt76_phy *mphy)
 	mt7603_mac_set_timing(dev);
 	mt7603_mac_start(dev);
 
-	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
-				     msecs_to_jiffies(MT7603_WATCHDOG_TIME));
-
 	/* reset channel stats */
 	mt76_clear(dev, MT_MIB_CTL, MT_MIB_CTL_READ_CLR_DIS);
 	mt76_set(dev, MT_MIB_CTL,
@@ -191,9 +188,8 @@ int mt7603_set_channel(struct mt76_phy *mphy)
 		mt7603_beacon_set_timer(dev, -1, dev->mt76.beacon_int);
 
 	tasklet_enable(&dev->mt76.pre_tbtt_tasklet);
-
-	if (failed)
-		mt7603_mac_work(&dev->mphy.mac_work.work);
+	ieee80211_queue_delayed_work(mt76_hw(dev), &dev->mphy.mac_work,
+				     failed ? 0 : msecs_to_jiffies(MT7603_WATCHDOG_TIME));
 
 	return ret;
 }
-- 
2.53.0


