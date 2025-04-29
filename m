Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A216C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8RFqKNAaAANf36DZ+QmypkHiiueccecSj9PhWODZLjo=; b=YO5tFge4ybkjHsX7P6U8pfKLHa
	IS8irQe0HtKA6K3p+dPuQqC9Rx22IqHCA5R/lHkNF/f6Wfct+Ud2okUz1ne3CFMCjN4/t90NK70cY
	Ul08l5ewav55UqkuVaKKiNY1UCr+y4DSjB+bKdrgq0nyvS9tGnM+Jdh34CwLbDUgkM4tyRtly5gLa
	2+x7bCYvUojFI/mnGSaFXDBnD9SFzXEAe5Duz9kxXTAamb+zUA7fuKQ0rpI7qSLzs6UtMH+b8/aca
	Ou1p9R1nKpAq4UipRt6kW4ljiqPhc9qCJ7y+9qDn4JLeZ7A76FpC1UAp31cc1ZWUwCxwfMUNHrJUT
	FyNsRoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o63-0000000AIX0-1kXg;
	Tue, 29 Apr 2025 16:46:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lmO-00000009w41-0Bm6;
	Tue, 29 Apr 2025 14:17:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62F544A8AA;
	Tue, 29 Apr 2025 14:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB69C4AF0D;
	Tue, 29 Apr 2025 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936267;
	bh=/BXoGZJ5icxIf4fvbX8yXHFsbB3xN9Dr6k/WLaLOqkc=;
	h=From:Date:Subject:To:Cc:From;
	b=dMoRaJlLwsODhJQEKwlHMT8OZ1/x0gOgHYC5rEa6dDmD6aKhf4i0YZEe+fQ54jjsW
	 6u+b8ObfzBHoBoAirSi5BBYdsJ+4HKe9vHxfi0SzblihaL9BeGu1zuxAZJ4TVwyB6x
	 K3KGD5yNXV6myj3tPkfG1BsBujzSGnFi+MJQdb2jCjECS+pJ3FUiMKU1dLRQtjnuwq
	 4dyMXl54Ck/GO7tFAzHJquO6QQ28cXOP1km6NBq9DtDaQtfNDsnkzyi5+23PXG9sVc
	 iyUcEbOpGQyi65N0vFk0LZfkOX6RD7NLnXMC9lySFe4LQYZM5IzcJ5YJyja7ZSUmZa
	 QPzs0mIXk4/0A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 29 Apr 2025 16:17:41 +0200
Subject: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAITfEGgC/42NQQ6CMBBFr0Jm7RgoFNCV9zCEVGeAidKSlhAM4
 e5WTuDy/fy8t0FgLxzgmmzgeZEgzkYoTgk8B2N7RqHIoFKl00IpNOLdYJBtpesMO1lxmrgdH25
 tycwGdUldpqigrlIQLZPneDoK9ybyIGF2/nMEl/y3/u9ecsywroh0SuqiS7692Ft+n53vodn3/
 QtYKHlszwAAAA==
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
X-CRM114-CacheID: sfid-20250429_071748_130521_F23C84C0 
X-CRM114-Status: GOOD (  12.48  )
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
Moreover, add __packed attribute to ppe_mbox_data struct definition and
make the fw layout padding explicit in init_info struct.
At the same time use u32 instead of int for init_info and set_info
struct definitions in ppe_mbox_data struct.

Fixes: 23290c7bc190d ("net: airoha: Introduce Airoha NPU support")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
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
 drivers/net/ethernet/airoha/airoha_npu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 7a5710f9ccf6a4a4f555ab63d67cb6b318de9b52..c81e25139d5ff4b6c52ce8802dd9c9b9b6c8c721 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -104,17 +104,19 @@ struct ppe_mbox_data {
 			u8 xpon_hal_api;
 			u8 wan_xsi;
 			u8 ct_joyme4;
-			int ppe_type;
-			int wan_mode;
-			int wan_sel;
-		} init_info;
+			u8 max_packet;
+			u8 rsv[3]; /* align to fw layout */
+			u32 ppe_type;
+			u32 wan_mode;
+			u32 wan_sel;
+		} __packed init_info;
 		struct {
-			int func_id;
+			u32 func_id;
 			u32 size;
 			u32 data;
-		} set_info;
+		} __packed set_info;
 	};
-};
+} __packed;
 
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)

---
base-commit: d4cb1ecc22908ef46f2885ee2978a4f22e90f365
change-id: 20250422-airoha-en7581-fix-ppe_mbox_data-56df12d4df72

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


