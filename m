Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB398C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qa12pQLxpuPnhIr2gx1R5p04XKvqht+MKZhRvRLpwc0=; b=fKkQtVXsx7E9bQSkYHATn41CQ+
	089TJ5iPjbjAJ8R6sbmAUONwbhGk8gVYDg/BYpAk7i7o5TXVndxieA7VbJrX+RiIWX9ymFpgNoMZQ
	yg/Id/GwHm8JElQIGC31yL7/Rj/4E74j3KzBlgog32sfs7DKCJ1qjTe0PYKAIw7drJinGPBgD5uI6
	YCbXxqtuxoHmy2Vz5jvL1hC4iHtJa8KOfXsq4aO8bURqD0tTkdbjUvlXz04twxUhstzSWfKehFWPd
	wQlz7GBETE4aRsZY+GA7Zs6vq5CMdt7umEh5eUFouk+L5MWWTS8v3bfM+fpNkz2D2qVJYwPr57HJt
	RxILYYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR81F-00000004Ca9-3abF;
	Mon, 16 Jun 2025 11:28:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR73e-0000000449u-3zfB;
	Mon, 16 Jun 2025 10:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7579A5189C;
	Mon, 16 Jun 2025 10:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1806CC4CEEA;
	Mon, 16 Jun 2025 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750069637;
	bh=Rse1XPrFQM8gbRQ9n75PNuNKPkjS6jSQ0wCaAW+iRNM=;
	h=From:Date:Subject:To:Cc:From;
	b=KAAd/DRo0OmWZZI5v2URno/X6HitKTcgiKTw4c/LOp3EkMgvk+imqnxTszK/uIS2v
	 6u2e/aCFu+4SALH3jXGh96ihmbWGJuKUTfxTadTd0jeuedL8DaMYWMgQKag34Chypl
	 f6uMO5wGfatE8IW/x3LgSdih76upC3A4eN9VP/PGB2iFLqtdV4pFBLuYG+7vKFSsf6
	 betuBIdV8wEzsQjJ0WqxRDcF7X5Sl1XLGX9AOAiCVmGKDZ/RY1v6P6xiEkCzpo+UWC
	 ONbVcLh0djWkY66657y5F99ygHecPphlLyfLNayPJAE+I+UrAxXigSiiiuQW83n50h
	 WuXg3WNnSuTmQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 16 Jun 2025 12:27:06 +0200
Subject: [PATCH net-next] net: airoha: Always check return value from
 airoha_ppe_foe_get_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-check-ret-from-airoha_ppe_foe_get_entry-v1-1-1acae5d677f7@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHnxT2gC/x3NQQrDIBBA0auEWXdAhZjQq5QiYsY4lKqMUlpC7
 l7J8m3+P6CRMDW4TwcIfbhxyQP6NkFIPu+EvA2DUWZWVlsMicILhTpGKW/0LCV5Vyu5WMjt1B3
 lLj8062yXRSuzRQ+jVoUif6/T43mef+f0SjR5AAAA
X-Change-ID: 20250616-check-ret-from-airoha_ppe_foe_get_entry-285677102dfa
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_032719_061116_FDED424C 
X-CRM114-Status: UNSURE (   9.40  )
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

airoha_ppe_foe_get_entry routine can return NULL, so check the returned
pointer is not NULL in airoha_ppe_foe_flow_l2_entry_update()

Fixes: b81e0f2b58be3 ("net: airoha: Add FLOW_CLS_STATS callback support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 50d816344b1f8c1ed639de357f62e761ede92f05..c354d536bc66e97ab853792e4ab4273283d2fb91 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -819,8 +819,10 @@ airoha_ppe_foe_flow_l2_entry_update(struct airoha_ppe *ppe,
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
base-commit: 8909f5f4ecd551c2299b28e05254b77424c8c7dc
change-id: 20250616-check-ret-from-airoha_ppe_foe_get_entry-285677102dfa

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


