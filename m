Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC21C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fcZXMq+Uule1vi5Cv/w6zskD2BmsKJF3dyESs8HYus=; b=pARNDkNRbzzrEKgfPM+zSafauV
	ngQN8PlwU6OMlKbqV96Wl2ThRukQWM1pYCQPqiSyNKu6tJ2qBUrqHNnvyyR8w43c0JZtain1Q24MR
	2DFcBEAchr+ICP6xM8vEz1BsDA4Xeqf7+TswvqOrqSnHYTxw5/uwckpP+g27OxGHqkL304jfZ8HHJ
	XBBDueWPbh7IF87TCDwX5alK1HWTPcMW7QwAgFX8LdGCk+TYB5WYraBhwxXcG4MqQ0La8AjJ4UQ7p
	Y+njH8W5z7xXl5BcE9FxjtT2xNAyVAt7K4a1GPTDwFQtk15S3yZi6fXylCLolyGQl3VtVcA3rhXb9
	OEtEnFqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQiQ-0000000DZaL-1pK5;
	Tue, 06 May 2025 22:24:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLbO-0000000Cln2-3J7x;
	Tue, 06 May 2025 16:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA0435C58F1;
	Tue,  6 May 2025 16:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC8FC4CEE4;
	Tue,  6 May 2025 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746550625;
	bh=ABOzDivVUxun6WUKZw1BVS9aK7ElmNBbTSdCr3O5K3k=;
	h=From:Date:Subject:To:Cc:From;
	b=vIwUl4szxr3mn6Ht3u4ZVPXR/v6wJMjbKlWscQEC/YHKl8rrGfxvpRBLGmzQU+mpS
	 b+VeyEgmauFg4x3+41BUuqEY/Y22IlvN4CO7gj9MPt3hovP6Gxs/8cQIxbRqsrPtdn
	 ziGBkUELy5D5jCyYlKizfzQL8Kd9fv9j204USMYHri5VsnfROEJZxb0PQNSEoSiz6U
	 T4nBK7LaVnDyC82SxksY38gcPYZuhZTzzXQSQfKtqSzm17+25UvkTHOLSZu8h2KfLi
	 0je2lxzb/80PrOiTVkb+gP8BdU+5lnCz4PBzxurBPdXePxJf604iDwjaH78B9PMGAh
	 p1uRSGsPvwugg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 06 May 2025 18:56:47 +0200
Subject: [PATCH net v5] net: airoha: Add missing field to ppe_mbox_data
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-airoha-en7581-fix-ppe_mbox_data-v5-1-29cabed6864d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE4/GmgC/43NTQ7CIBCG4as0rMUAhf648h7GNNSZtkSFBhpS0
 /Tu0q50pct3Mnm+hQT0BgM5ZQvxGE0wzqZQh4zcBm17pAZSE8GEYlIIqo13g6ZoS1Vx2pmZjiM
 2z9bNDehJU1VAxwVI6EpBkjJ6TE/7wuWaejBhcv61D8Z8u/5vx5xyWpUAioGoVYHnO3qLj6PzP
 dnwKD/B+jcoEwhCV23NOGhgX+C6rm/E/BQbIAEAAA==
X-Change-ID: 20250422-airoha-en7581-fix-ppe_mbox_data-56df12d4df72
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_095706_910591_5A854077 
X-CRM114-Status: GOOD (  14.49  )
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

The official Airoha EN7581 firmware requires adding max_packet field in
ppe_mbox_data struct while the unofficial one used to develop the Airoha
EN7581 flowtable support does not require this field.
This patch does not introduce any real backwards compatible issue since
EN7581 fw is not publicly available in linux-firmware or other
repositories (e.g. OpenWrt) yet and the official fw version will use this
new layout. For this reason this change needs to be backported.
Moreover, make explicit the padding added by the compiler introducing
the rsv array in init_info struct.
At the same time use u32 instead of int for init_info and set_info
struct definitions in ppe_mbox_data struct.

Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v5:
- get rid of __packed attribute
- fix typo in the commit subject
- Link to v4: https://lore.kernel.org/r/20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org

Changes in v4:
- use u32 instead of int in ppe_mbox_data struct
- add __packed attribute to struct definitions and make the fw layout
  padding explicit in init_info struct
- Link to v3: https://lore.kernel.org/r/20250422-airoha-en7581-fix-ppe_mbox_data-v3-1-87dd50d2956e@kernel.org

Changes in v3:
- resend targeting net tree
- Link to v2: https://lore.kernel.org/r/20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org

Changes in v2:
- Add more details to commit log
- Link to v1: https://lore.kernel.org/r/20250415-airoha-en7581-fix-ppe_mbox_data-v1-1-4408c60ba964@kernel.org
---
 drivers/net/ethernet/airoha/airoha_npu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..ead0625e781f57cd7c5883b6dd3d441db62292d3 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -104,12 +104,14 @@ struct ppe_mbox_data {
 			u8 xpon_hal_api;
 			u8 wan_xsi;
 			u8 ct_joyme4;
-			int ppe_type;
-			int wan_mode;
-			int wan_sel;
+			u8 max_packet;
+			u8 rsv[3];
+			u32 ppe_type;
+			u32 wan_mode;
+			u32 wan_sel;
 		} init_info;
 		struct {
-			int func_id;
+			u32 func_id;
 			u32 size;
 			u32 data;
 		} set_info;

---
base-commit: e8716b5b0dff1b3d523b4a83fd5e94d57b887c5c
change-id: 20250422-airoha-en7581-fix-ppe_mbox_data-56df12d4df72

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


