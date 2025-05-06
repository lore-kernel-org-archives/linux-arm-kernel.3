Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3A3C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CdKhF1dz8le1BxUGeNhnXLgthKYZanVP+D2h7mGr3gs=; b=nYTj1zDKI3kKPNkHUVstFcNL6B
	qm87OKpqQA+eLrLDJFlAJrWob1TUjJ6a6YyIBvY9hCwCMY+w04VoD0wWt/lOFbE4VWOh5aQ3vGmWo
	lvObGm+OBEK8v8FzrXdydLo7YyxgE4WHn/JqPi4pXQ/wXJ73DCKgW8IFl5AyLFrp2zTFgcJohISgZ
	g+70n/JWL+IWxJvAHJecjMJjkqhKEDJ0AVJ4euTr41Rrc/8NL1SioJFrCCMpy+GjKavxFahqQzGzA
	PEDA2caYaDT0sC+0O/vawhPY0hg+3pr+/aMWgxIwL+1+MqOeuh6grjpjmxtu9XnUgy+ZeZnDqiytD
	LrCLYFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJhD-0000000CP8z-13yT;
	Tue, 06 May 2025 14:54:59 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGuk-0000000Bosy-3lNB;
	Tue, 06 May 2025 11:56:48 +0000
Received: from fedora.intra.ispras.ru (unknown [10.10.165.23])
	by mail.ispras.ru (Postfix) with ESMTPSA id 78F8A4076186;
	Tue,  6 May 2025 11:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 78F8A4076186
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1746532600;
	bh=CdKhF1dz8le1BxUGeNhnXLgthKYZanVP+D2h7mGr3gs=;
	h=From:To:Cc:Subject:Date:From;
	b=eTCfCT8fjeYYEb7Sg7xO68w3ygdO+aRNtTSnkV8u9DFbD1ndgqqpYgp7Nhtln5+bS
	 fNJo+TT+RocYX+O+0X4eUWok1gHeDxcrLGo7g9v/IKbS1q2Oz5hJBKvqgWLTOXETiE
	 3jjysTAqCXftL/AA08mnxqgvdICd52qpvp5JdenM=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: disable napi on driver removal
Date: Tue,  6 May 2025 14:55:39 +0300
Message-ID: <20250506115540.19045-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_045647_436144_2AFF7D6C 
X-CRM114-Status: UNSURE (   9.79  )
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

A warning on driver removal started occurring after commit 9dd05df8403b
("net: warn if NAPI instance wasn't shut down"). Disable tx napi before
deleting it in mt76_dma_cleanup().

 WARNING: CPU: 4 PID: 18828 at net/core/dev.c:7288 __netif_napi_del_locked+0xf0/0x100
 CPU: 4 UID: 0 PID: 18828 Comm: modprobe Not tainted 6.15.0-rc4 #4 PREEMPT(lazy)
 Hardware name: ASUS System Product Name/PRIME X670E-PRO WIFI, BIOS 3035 09/05/2024
 RIP: 0010:__netif_napi_del_locked+0xf0/0x100
 Call Trace:
 <TASK>
 mt76_dma_cleanup+0x54/0x2f0 [mt76]
 mt7921_pci_remove+0xd5/0x190 [mt7921e]
 pci_device_remove+0x47/0xc0
 device_release_driver_internal+0x19e/0x200
 driver_detach+0x48/0x90
 bus_remove_driver+0x6d/0xf0
 pci_unregister_driver+0x2e/0xb0
 __do_sys_delete_module.isra.0+0x197/0x2e0
 do_syscall_64+0x7b/0x160
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Tested with mt7921e but the same pattern can be actually applied to other
mt76 drivers calling mt76_dma_cleanup() during removal. Tx napi is enabled
in their *_dma_init() functions and only toggled off and on again inside
their suspend/resume/reset paths. So it should be okay to disable tx
napi in such a generic way.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 2ac515a5d74f ("mt76: mt76x02: use napi polling for tx cleanup")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 844af16ee551..35b4ec91979e 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -1011,6 +1011,7 @@ void mt76_dma_cleanup(struct mt76_dev *dev)
 	int i;
 
 	mt76_worker_disable(&dev->tx_worker);
+	napi_disable(&dev->tx_napi);
 	netif_napi_del(&dev->tx_napi);
 
 	for (i = 0; i < ARRAY_SIZE(dev->phys); i++) {
-- 
2.49.0


