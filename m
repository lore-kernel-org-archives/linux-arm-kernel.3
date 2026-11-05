Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB4606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QfgLtKw/;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cbGVGSKj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6UOkymQhnfOrj2yAZv17rmW+xuQ+0zZXE06/CQLTSww=; b=QfgLtKw/P7KhLR
	T/JYSTwawNFI0NLKDwSp8Q2t2pq/bd6FEU2Bvd2+NCL6M4GgEjEtGnuBNwhtY/DDdi5VUQ27lOzmc
	72hibKR73cn2vEWDoa8IOBHxCbfKwQvO17nvioW6su2/nEoaeGpLK18wOEqXIPPhufXUb2YLU1lOH
	MhX84as4YqetqlLvd2Jk9K5fE7XDvdh17z6nfb5uo1BJKXiGbpygJru869zKJveOyoEzk0WoTu34J
	Jy7NlVw8FtYwJXA9HbWZPCU4zOJKy1tGrhDf3HZoTqyiZJqAUPNy51DNXxM0grAYq/1rA3PnWvq94
	WRkIRWOkf8eOWGSmrPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtIN-00000008DcK-2isH;
	Thu, 05 Nov 2026 08:58:07 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtII-00000008DZa-1cQb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:58:05 +0000
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793869079;
	bh=AlntEjGZGdpJydOR7xazAe3mieEGTxbT1NLXNTsDkjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbGVGSKjSlLWifvxO0qrhgHm2nn1svRBdsFavoAUjaVD7q5UqCRG4z/V75mVI/6a4
	 jlyqAKYQAY+rZqxFunTLXcylQ3O0rSxOPXT6UrU4GdqoMtzEQNLD+maF5j1tawaB/U
	 fS6LtVJ8jrUDq6UfE6hqnIKuRPY9kmDk1Pm4xZw+wb3yNuNAgJNurn0YDarmiihN8U
	 4Lsz9/dzZp7SLvZs0xDfqueoCDOvVx8H2ZiJ1niRiqSG3ahJ2aTLMDCreGu3OJVC0F
	 1pv1SpPCWUIOiI6gmb4okeTXIRiuY33yZetuU2NZ4C1sPufQBGlC83lsrtKglvf0AK
	 15Fn9UO9skexQ==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH v2 2/2] Bluetooth: set the strict duplicate filter quirk on Apple Broadcom controllers
Date: Thu,  5 Nov 2026 09:57:50 +0100
Message-ID: <20261105085750.120392-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105085750.120392-1-dev@deq.rocks>
References: <20261105085750.120392-1-dev@deq.rocks>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_005803_233801_767DDEBA 
X-CRM114-Status: GOOD (  11.99  )
X-Spam-Score: -2.8 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

btbcm_finalize() sets HCI_QUIRK_STRICT_DUPLICATE_FILTER, but bcm_setup()
returns before it when no patch file was loaded. The MacBookPro15,1 has
none for its BCM4364B0 ("BCM: firmware Patch file not found").
hci_bcm4377 does not use btbcm_finalize() and never sets the quirk. A
service discovery then scans with "Filter duplicates: Enabled", and the
controller reports an address once per discovery cycle of about 10.7 s.
A Mac that changed its advertisement data on the same address was
reported 6 s after the change, at the next cycle.

Set the quirk in hci_bcm on that path and in hci_bcm4377.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm.c     | 5 ++++-
 drivers/bluetooth/hci_bcm4377.c | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index cf4f1455cf9..9eeeaf5d6b0 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -596,8 +596,11 @@ static int bcm_setup(struct hci_uart *hu)
 	if (err)
 		return err;
 
-	if (!fw_load_done)
+	if (!fw_load_done) {
+		/* btbcm_finalize() sets this after loading a patch file */
+		hci_set_quirk(hu->hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
 		return 0;
+	}
 
 	/* Init speed if any */
 	if (bcm->dev && bcm->dev->init_speed)
diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 30fcadfae3f..66cdd896c95 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2391,6 +2391,11 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	hdev->set_bdaddr = bcm4377_hci_set_bdaddr;
 	hdev->setup = bcm4377_hci_setup;
 
+	/* The controller reports an address once per scan with duplicate
+	 * filtering, also after its advertisement data changed.
+	 */
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
+
 	if (bcm4377->hw->broken_mws_transport_config)
 		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG);
 	if (bcm4377->hw->broken_ext_scan)

