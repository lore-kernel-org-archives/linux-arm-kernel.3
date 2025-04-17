Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D485C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7cHYrEJjBNkoqMq5ltY1yfata0jjTIBY3/KmQonvUjY=; b=qB/ZoPOJl8gLBgQsdm4swIFk+l
	imAob/a8jrfFK6BVGxOhTJ5kMTgBWoIEvUgPBsHm1e+yKHtAWYiGyxXvL6qYnmh3yThD2xsauzrLo
	1nsZVaZV31cZAi9md4updrIrUKCg/7lFUcSqRYZHe3rsz4YVXyWFouMeB6yNIY+oJNhbMbkqRn3UC
	7mfjrpFuk5GrYnqt33qbeCYhnKqiYy52yhx4bhuC1Ur4oy2EpOcObIFhCRkZWca23YuKEz4/312WK
	YUrfi9z/hxUv0ud6D5XIbl30bKcbDKv0vwpw4Z/LSw0AifmiMKj2dVrG57nVMkWZbx2/TnBtjv6p1
	D0i5tfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LcI-0000000CTZx-13R8;
	Thu, 17 Apr 2025 09:33:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LaR-0000000CTGa-0IUZ;
	Thu, 17 Apr 2025 09:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8E81A4B26C;
	Thu, 17 Apr 2025 09:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFEBC4CEE4;
	Thu, 17 Apr 2025 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744882269;
	bh=F9Y0DmU3wEHCJH5F3T95MiuKcenBBiSBi8gA0omO2Jw=;
	h=From:Date:Subject:To:Cc:From;
	b=hVycZnPzum4yr9YF4zE6ZoE1n4jiB7kwZGrvFjJoajF1H/89TXibD7P5tQp7F692c
	 kmYIs1RFigJ3uAxAtUeaEEjSrwdWb8f00j6CdH17Kq/zBQzrkxRYw8K7SLd+rPtLa4
	 VeVWaugCImE+1VDru/5y1tFAsTIGnQ1XoaGDhhVHQzF7drAEeq4K7sNxGCEZmt2yj0
	 d6X4Mz2jfteqN5esQoC9TrE9IPoZEmphntToDgnM3XNd0IkHswztc2W2bRi9oXoxDu
	 KIIEPuqEg25QybHDIoIH7vhNpbmUzhDthXgVups+MCSxb6Z1uCtzwipUElMg0OWfvi
	 YNgabBdnzSMRA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 17 Apr 2025 11:30:47 +0200
Subject: [PATCH net-next v2] net: airoha: Add missing filed to
 ppe_mbox_data struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEbKAGgC/4WNQQqDMBBFryKz7pQkRE276j2KSNRRh7aJJCIW8
 e5Nha67fJ/PextECkwRrtkGgRaO7F0CdcqgHa0bCLlLDEqoXGip0XLwo0VyZW4k9rziNFH9avx
 ad3a2qHppjOhLbYoWkmUKlE5H4V4lHjnOPryP4CK/68+d/3UvEiVqLUxbiMZeCn17UHD0PPswQ
 LXv+wcWwJXizwAAAA==
X-Change-ID: 20250414-airoha-en7581-fix-ppe_mbox_data-2f1880f7486c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_023111_181308_CBAD2B35 
X-CRM114-Status: GOOD (  10.40  )
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

The official Airoha EN7581 firmware requires adding max_packet filed in
ppe_mbox_data struct while the unofficial one used to develop the Airoha
EN7581 flowtable support does not require this field.
This patch does not introduce any real backwards compatible issue since
EN7581 fw is not publicly available in linux-firmware or other
repositories (e.g. OpenWrt) yet and the official fw version will use this
new layout. For this reason this change needs to be backported.

Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add more details to commit log
- Link to v1: https://lore.kernel.org/r/20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org
---
 drivers/net/ethernet/airoha/airoha_npu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..16201b5ce9f27866896226c3611b4a154d19bc2c 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -104,6 +104,7 @@ struct ppe_mbox_data {
 			u8 xpon_hal_api;
 			u8 wan_xsi;
 			u8 ct_joyme4;
+			u8 max_packet;
 			int ppe_type;
 			int wan_mode;
 			int wan_sel;

---
base-commit: df8398fb7bb7a0e509200af56b79343aa133b7d6
change-id: 20250414-airoha-en7581-fix-ppe_mbox_data-2f1880f7486c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


