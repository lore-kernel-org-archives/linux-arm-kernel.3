Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FB2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nkPkccxvn+SZFMxFwctOw/AZfYSxK3sB7eBQ6vWZtlg=; b=jz07NGXwc0qYIxNOGrde2ZOCNc
	mO2I8dEusjpQZSSKCff6hrL8dKrViiuEbRkHVQiipLFyuAX3uh2Ms1tN0U+47BScFEVpfZ0cM/39X
	auooD78RU1XX3sYvROTL165DkwJEe0Ja6sdDIhlziacnfCYKlCsIA5zIx2Z6cM/UyjtOCakxnAcfR
	tdYuc0/v1xm1PCnOPfSr7WY05U9Kqe3njL6OVKazM0YjHTPYFiHZyBXqHs1lUh5ES0kPc4v/nQiTu
	M3K3G1mDm0xNflb8ULHkYjx3z9mPJ3HeljgOa55J59WACmeT+fy9a0rZ9XURX4H6jTRq0jxIwRbYA
	u7owcndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5V2-0000000ABJb-3QAw;
	Fri, 12 Sep 2025 15:15:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5V0-0000000ABIX-3MYM;
	Fri, 12 Sep 2025 15:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CAAC4516A;
	Fri, 12 Sep 2025 15:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA67C4CEF4;
	Fri, 12 Sep 2025 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757690142;
	bh=lpXtNXUnkeD2hxRlppy/xJK2BmpxX53cp8KUKDOIVGw=;
	h=From:To:Cc:Subject:Date:From;
	b=J+p7L5OcNJ/gFFxeT3+GwrXmQZpky2LLx7teJP+yC+sZHFDojv3xFkTMVFtVPdBp/
	 bSIytXfPwYQiMX/BtFRFUSv3uT+8fDYic6pVCrb51RLucKitUwlzshqUtayqNIgakS
	 nCgVgCHqfEWYSq2E6xptcc7AjSxDjB5LURPv0WiowLZpr7lNpnsJOIPM0CuRP7J+J2
	 6llMHn8rzKKo9v72t6vcl5OkBc2kycdtNY0udpodlZHAG7G7Jz9ZTssa3OJIVXc+0p
	 cR682EP6sMEmNMSj9KHu2JlJO0dC/v7x7t14+nWhh6nmuffnYcZtwoLLY/v69c6n7P
	 D6XRCnDSQinrg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt7996: Do not use #elifdef directive
Date: Fri, 12 Sep 2025 17:15:34 +0200
Message-ID: <8215423cad3d3a35e016b7d2b84d5036c3a0d092.1757690020.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_081542_857143_CE2D6336 
X-CRM114-Status: UNSURE (   9.35  )
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

Do not use #elifdef directive since it is a C23 extension but rely
on #elif defined() instead.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index be8bf03aeb4b..fae9c4e07ab9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2258,7 +2258,7 @@ const struct ieee80211_ops mt7996_ops = {
 	.net_fill_forward_path = mt7996_net_fill_forward_path,
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
 	.net_setup_tc = mt76_wed_net_setup_tc,
-#elifdef CONFIG_MT7996_NPU
+#elif defined(CONFIG_MT7996_NPU)
 	.net_setup_tc = mt76_npu_net_setup_tc,
 #endif
 	.change_vif_links = mt7996_change_vif_links,
-- 
2.51.0


