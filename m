Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5B4C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M6m1J9OzwQS0R6GNnPxx2krF1ARq1b3Dj/LSOSlLjZ8=; b=ONEMEHRwcK9eLEw12PwRWnPPMv
	QvhSxNBuYriCrd6grMIyTJMp+eN1LgfSj5RXiBDakMVOcPowTw31relK8SDwffgsRsPJpfvhv4fHY
	R44VWoY3niyJfDbhgmF3TWODxfzkN8mg5wniLELn0ZVWLPzIJC8oJKo1Y08Lz0HoNSafACfkXf385
	b1EhT9WEFiOvGNKZ/rLHy0wh/VHCb8F190J9bfCEKPFUgPf/0opT4F44ynVFIT1trrNGCHkAIL4pG
	PrRMO29q5Fp0/kHA9nRV/JZpS3kjvhn6eoDV/MPSly59RJTtGSM1YC6CzPofN3ddxySlt/FlnQ839
	MZLU9rmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnP2-00000009J9E-1Gx4;
	Wed, 18 Jun 2025 07:40:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnMo-00000009J1Y-36fS;
	Wed, 18 Jun 2025 07:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 654CBA50467;
	Wed, 18 Jun 2025 07:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B0CC4CEEF;
	Wed, 18 Jun 2025 07:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750232273;
	bh=C8cDydoGOBcR8NvM/4b7j8MB33R0OSAtbo+7+9KQiJQ=;
	h=From:Date:Subject:To:Cc:From;
	b=eaDVWtaYiFzXj5XEQY9BiNKvXNH+YTToyJxw4JhPH63t/GXjhQawT4nv2zRYIaZVF
	 ORNk6KIi6cr4b0i72kd/mUYp/k5jUsO4FkmqyaYUmeZD/VO5s/1XdJAYjkO7O1BWSb
	 WiqxJS3BDxasTTcic8X76KtSjw6/FIejlKIR93QkfyYFaSKO8wy9S4UZ16tIV7Recc
	 +uOjiaW06h+6RcEo1CBx558ebpDarJfh/kVxc9jK5vaYxLhsuRCAmq4rPIcDFZ75XJ
	 7T7Dx92upt+1LiawAY8VUXNPM6HuNTseCAbdtxqPSjxuTfpWcMtc/AzLvFKvQ1fUDb
	 XGM/y9VTyYM2Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 18 Jun 2025 09:37:40 +0200
Subject: [PATCH net v2] net: airoha: Always check return value from
 airoha_ppe_foe_get_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-check-ret-from-airoha_ppe_foe_get_entry-v2-1-068dcea3cc66@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMNsUmgC/x3NQQrCMBBA0auUWTuQVC3Bq4iEkM40g5iESRCl9
 O4Gl2/z/w6NVKjBbdpB6S1NSh6YTxPEFPJGKOswzGa+msU6jIniE5U6spYXBtGSgq+VPBfyG3V
 PuesX2bB1Z7dc7MowalWJ5fM/3R/H8QPUH/tUeQAAAA==
X-Change-ID: 20250618-check-ret-from-airoha_ppe_foe_get_entry-f0f1838641df
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_003754_856690_04F5A1AF 
X-CRM114-Status: GOOD (  10.05  )
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

airoha_ppe_foe_get_entry routine can return NULL, so check the returned
pointer is not NULL in airoha_ppe_foe_flow_l2_entry_update()

Fixes: b81e0f2b58be3 ("net: airoha: Add FLOW_CLS_STATS callback support")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Target net tree instead of net-next one.
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 9067d2fc7706ecf489bee9fc9b6425de18acb634..0e217acfc5ef748453b020e5713ace1910abc4a8 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -809,8 +809,10 @@ airoha_ppe_foe_flow_l2_entry_update(struct airoha_ppe *ppe,
 		int idle;
 
 		hwe = airoha_ppe_foe_get_entry(ppe, iter->hash);
-		ib1 = READ_ONCE(hwe->ib1);
+		if (!hwe)
+			continue;
 
+		ib1 = READ_ONCE(hwe->ib1);
 		state = FIELD_GET(AIROHA_FOE_IB1_BIND_STATE, ib1);
 		if (state != AIROHA_FOE_STATE_BIND) {
 			iter->hash = 0xffff;

---
base-commit: 0aff00432cc755ad7713f8a2f305395d443cdd4c
change-id: 20250618-check-ret-from-airoha_ppe_foe_get_entry-f0f1838641df

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


