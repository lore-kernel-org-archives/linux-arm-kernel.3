Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E83C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLmvhVsYi/hUxkVAp71X3Vr2oyEwyALISMrt/VKVK3g=; b=d2IHSneBTHIc1eYT0ML83KYCul
	qRET2FgFH05yvTZ0ZB4T2UP3UfrfSn90+nlvsFNj7Oevs351AJfWb4eEhx37Vm3PZ10D5T04qaVLf
	RafWT2AyzKUrSQzg/mHa8ZmwRrzfTFWOn8vffRXCyuCZK80bh0Gs+0YgDMjmuZEVxSxlbnrtICBB9
	o+Btez92HGWebgDRR4JfRiyEhpYW26A3yDQbbZWJHkSYzaTrhvJoN7ikBWRQZr+gpg7XFX+bImYsU
	oh00cEGTCNfpVVDNNd8tdg0txcQeyuZrM7Jlc8tHviTr58kUr15mkmlEKpUgIDxoInf7SRcRPdCOe
	kNDumEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I9w-000000087zw-36pV;
	Tue, 22 Apr 2025 18:15:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7G2D-00000007oyr-1MXu;
	Tue, 22 Apr 2025 15:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6758AA4B58C;
	Tue, 22 Apr 2025 15:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A764CC4CEE9;
	Tue, 22 Apr 2025 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745337584;
	bh=qmjXZDeehc6+VqaGfMuHTX89SmLxYMBp7YUw/6wlzic=;
	h=From:Date:Subject:To:Cc:From;
	b=b9OhbOCG5ZmDmCO1zAPiAhwgT+WRh9dK7dfjUclNkMddBCThfZw1+B5pSzVjxi8s5
	 Jtq7VpINWOncN402VRE/azZWY9Sh1BrVKXVTa56jU/VBGDzbJhY7bCavIfIQZgh1tO
	 Ot7S7gbyt7GFFTaiJbxvbbnDV0BgI8sUvp7OMYSqIylYjw1SdDZMzKfa9vzn9RYGBr
	 ewo6Uy7D2aOnwTb6NoK4ITav2PIQ9BbAlEbti1mPQfnYeX1urMgLoQeM9UgV3HbzIK
	 8EvTXwEPrYimE3QjEdfWsNgxWjA0QwyWfGEhkY5ylt7d1WlB6t4hH1ZOI/IPlxjJLQ
	 jQ8fBQLTfwo6A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 22 Apr 2025 17:59:23 +0200
Subject: [PATCH net v3] net: airoha: Add missing filed to ppe_mbox_data
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-airoha-en7581-fix-ppe_mbox_data-v3-1-87dd50d2956e@kernel.org>
X-B4-Tracking: v=1; b=H4sIANq8B2gC/x2N0QqDMAwAf0XyvIBmdo79yhDJllTzYFtaEUH89
 5U9Hhx3JxTNpgVezQlZdysWQ4X7rYHvwmFWNKkM1JJreyJky3Fh1DC4Z4feDkxJp/UTj0l4Y3Q
 P8R1JL34gqJWUtUr/w3u8rh+h5HTucQAAAA==
X-Change-ID: 20250422-airoha-en7581-fix-ppe_mbox_data-56df12d4df72
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_085945_429327_99B2B761 
X-CRM114-Status: GOOD (  11.12  )
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
Changes in v3:
- resend targeting net tree
- Link to v2: https://lore.kernel.org/r/20250417-airoha-en7581-fix-ppe_mbox_data-v2-1-43433cfbe874@kernel.org

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
base-commit: c03a49f3093a4903c8a93c8b5c9a297b5343b169
change-id: 20250422-airoha-en7581-fix-ppe_mbox_data-56df12d4df72

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


