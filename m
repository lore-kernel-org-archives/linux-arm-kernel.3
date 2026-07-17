Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A4C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Content-Transfer-Encoding:Message-ID:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByvrWCOoDCuW2xShmWncu3Ao4WbmrmEikOWXs5gyHJU=; b=KWfiHwErTFD7EDomu+rvt+7R9q
	wi/DWs3fzpUj5g/ohbD+n5whS6b9uVROQYXiyODL7rNMFLPpAaEKf8fGI6I38VHMXaTpFWtUDhUyc
	NCgD6MbspbyV+IWiS2NfXGg7bK/pcTS5nlPfJLYPhARRz1E0BpqmNe7ktMeli6iEbtrxTGY9hsnvP
	xouPkJaCY4inOIbDoHTJzF9cUHpq4woLRAJbq8BikGsitFyCl79nyFN1V1gBlWRMzxrqQ7dcunNw9
	kFn3HivDqT2UNznGWr3Z+2gOpAXR39n+cIpR/+TGms80FMUZa+qbXR+3VI+7x3OkQvbKZXikNbAyc
	UgFSly5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgIw-000000025Ql-2SG6;
	Fri, 17 Jul 2026 11:00:30 +0000
Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com ([23.251.234.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgIl-000000025Ji-1xlb;
	Fri, 17 Jul 2026 11:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=clipsneko.cc; t=1784286012;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=Q1FN4qnshm5xeIy75yKaGL9RQWH6W+NxPoppYKpNsKg=;
	b=T+wrfrQb5jFNFoJ/y/FNt2E0l6mDiEsfUNvsCxHKkfrxvPST86TOmDANJPMPL03W
	IkEA9GKJ+y1IOV20n8vc5AHkPaUL6XjLJ3NFCXoqRIb6Zahm2Yo+KwLVCfzZAnJWjRh
	PRDrLze8dV+wibMbDWH1rQc62qShwh6JVJm8Blp4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1784286012;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=Q1FN4qnshm5xeIy75yKaGL9RQWH6W+NxPoppYKpNsKg=;
	b=Rmq9WJ+dijdpmG4PdMdlNzw9I86Zr/ZkJHftl+H+exEC4tMZZrqSHSSj3tKrYD0g
	L/s77NJ6S5syBOfngDnmk297hqIt2pJpb/AwcYQxW0NZ/Drf3o91zLFHGQCImard4YP
	mQH3WeK9v9uZwTyZrZmUjMcNg9GaNbqXDfUDOhdg=
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717105748.1194693-1-goliath.zhu@clipsneko.cc>
References: <20260717105748.1194693-1-goliath.zhu@clipsneko.cc>
From: Goliath Zhu <goliath.zhu@clipsneko.cc>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, goliath.zhu@clipsneko.cc, 
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mt76: mt7996: disable RX NAPI on driver removal
Message-ID: <0106019f6fbbe2e1-f7f219fb-cd73-428b-922b-a73849e36569-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:00:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.T/9jWCDXa31y4gauYStyPOpWTrkJmzALuy1iq6HUX1VjlgPUmzq7ZFI3EvLLZ39jJzv+2I2PP/uhCYcS7tWi4X9gcnDJGZZVVULSu7C54EK8m7rG19VNcAtmWQSUeF+Ydw79jCgmJ2QuxiKzKA17O4fInWrH2kml2UpMwmQGC6+Ow2RWdTIMP19sAecDaYp3:1.ap-northeast-1.tL27A1JIpKR2Y51a8BkHZBekDcSR82jwOhKrSwgRw2U=:AmazonSES
X-SES-Outgoing: 2026.07.17-23.251.234.50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040019_618682_E506CE38 
X-CRM114-Status: UNSURE (   7.52  )
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

Commit 9dd05df8403b ("net: warn if NAPI instance wasn't shut down")
made the NAPI teardown ordering explicit. An instance must be disabled
first, then netif_napi_del() removes it.

mt7996_unregister_device() leaves=
 the RX NAPI instances enabled and
eventually calls mt76_dma_cleanup(), =
which deletes them. This triggers
the warning in __netif_napi_del_locked() =
during device removal.

Disable every RX NAPI instance owned by mt76 after =
unregistering the
device and before releasing the DMA resources. Skip WED =
RRO queues
because WED owns them and mt76 never registers NAPI for those =
queues.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek =
Wi-Fi 7 (802.11be) devices")
Cc: stable@vger.kernel.org
Signed-off-by: Goliath Zhu <goliath.zhu@clipsneko.cc>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediat=
ek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index d6f9aa1ab..73559c60f 100644
--- a/drivers/net/wireless/mediatek/mt76/=
mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -1797,6 +1797,8 @@ error:
=20
 void mt7996_unregister_device(struct =
mt7996_dev *dev)
 {
+	int i;
+
 	cancel_work_sync(&dev->dump_work);
 	cancel_work_sync(&dev->wed_rro.work);
 	mt7996_unregister_phy(mt7996_phy3=
(dev));
@@ -1804,6 +1806,15 @@ void mt7996_unregister_device(struct =
mt7996_dev *dev)
 	mt7996_unregister_thermal(&dev->phy);
 	mt7996_coredump_unregister(dev);
 	mt76_unregister_device(&dev->mt76);
+	mt76_for_each_q_rx(&dev->mt76, i) {
+		struct mt76_queue *q =3D =
&dev->mt76.q_rx[i];
+
+		if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
+		    mt76_queue_is_wed_rro(q))
+			continue;
+
+		napi_disable(&dev->mt76=
.napi[i]);
+	}
 	mt7996_wed_rro_free(dev);
 	mt7996_mcu_exit(dev);
 	mt7996_tx_token_put(dev);
--=20
2.55.0


