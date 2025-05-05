Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75296C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSn9PSWy2SrSLqWDjm6YbrJUcmqXkbwi51MYVoJ6LVI=; b=vtYlkMndUqdQAW0+uZZgohR75R
	Rt8AyQfpF1GKCc52nHgVn0I3GLWGCOug22ttf42VOr1d5QHw4N2lt7rnniTzRH8Qv5E/Kpk0ogN5N
	I0GAwtcjbKPYjnJ4D/+d0BP17OTUmXBypIrUsOE5gRqABH88W12Az0vr809411HzdKLOSwh+3cf4j
	uPpGx4OI1U8+Es4e9dKnKZJ73ReWnm/9zM2wfJ5bhM7twxaPBw9CrRZcSUd4ztYG7G6OrZFZu6/7c
	m//bw9q88jvSGozCF5oKOxAsMapC8A1XA+tuz1yoUY4ngxK1PICcAOi68jQ4pV46iAaokAOICo4ta
	mH3NmrKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4FL-00000008kU0-1xwN;
	Mon, 05 May 2025 22:25:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC46B-00000008hog-2ek1;
	Mon, 05 May 2025 22:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9747843D05;
	Mon,  5 May 2025 22:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45ECC4CEEF;
	Mon,  5 May 2025 22:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483343;
	bh=8Cl/GBsCTdLlv+kKPgDPHaXk+owKpFJLtSRPbqZ7ywI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJxdmRYvSaIFAX+wBRFjJih907Z/b0VONKPjcUyNp54+H4L+7lWv2MLsv/qrRwW4g
	 s06RMwBbv6ZV+RT3MNGz3HORFufjnZ5BDbpl0Y/WobCN5OHXaO99rBgHpPThvUZAiH
	 rrzRBHzxUstUskzxRB+agZU/pYUI7N/D+LAUsjLoUhnuk5Op+vb+2DgTM+D8Oqfv3v
	 LAlWvKPCnApKts6CpVPMpkbqOzOznWOFc1P3OlgqrokBmMGFEAb3Xw5x3soaTkZeLX
	 L9HiCvdUcXEaJjc9nYCytGgtuPZZA/atBH9XKPjcOu/1VYWxHlbAUdpTesjArKSKuE
	 nNQ7cnnfmwBuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hao Qin <hao.qin@mediatek.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 044/642] Bluetooth: btmtk: Remove the resetting step before downloading the fw
Date: Mon,  5 May 2025 18:04:20 -0400
Message-Id: <20250505221419.2672473-44-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151543_704004_14FDEB14 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Hao Qin <hao.qin@mediatek.com>

[ Upstream commit 33634e2ab7c6369391e0ca4b9b97dc861e33d20e ]

Remove the resetting step before downloading the fw, as it may cause
other usb devices to fail to initialise when connected during boot
on kernels 6.11 and newer.

Signed-off-by: Hao Qin <hao.qin@mediatek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btmtk.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 68846c5bd4f79..4390fd571dbd1 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1330,13 +1330,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		break;
 	case 0x7922:
 	case 0x7925:
-		/* Reset the device to ensure it's in the initial state before
-		 * downloading the firmware to ensure.
-		 */
-
-		if (!test_bit(BTMTK_FIRMWARE_LOADED, &btmtk_data->flags))
-			btmtk_usb_subsys_reset(hdev, dev_id);
-		fallthrough;
 	case 0x7961:
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version, fw_flavor);
@@ -1345,12 +1338,9 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 						btmtk_usb_hci_wmt_sync);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
-			clear_bit(BTMTK_FIRMWARE_LOADED, &btmtk_data->flags);
 			return err;
 		}
 
-		set_bit(BTMTK_FIRMWARE_LOADED, &btmtk_data->flags);
-
 		/* It's Device EndPoint Reset Option Register */
 		err = btmtk_usb_uhw_reg_write(hdev, MTK_EP_RST_OPT,
 					      MTK_EP_RST_IN_OUT_OPT);
-- 
2.39.5


