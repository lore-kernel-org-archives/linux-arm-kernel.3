Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91563F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z1G8e6qfG0pLpHF22BztMzalo1UZrGYRjb2508dDwC8=; b=sojlREvhvJ4kej
	ErMQfv97xyEIvNbhXxunj3FXdARanMfc0zV+1iEvNyg8P3WUXHWwBd7BIqU84yPUDfI+j+q8vxpBo
	RX4/CS8tByVytrXjhrpl9Pbrm3lkTHpjwAaiej8yASigdauPeyKMUzliMpC/0Gzmas5B1OXGr0esc
	ewKFea4XuzJq//bst7jpojxh/ulAdc+1r8SlM/E/Z0EAO3qM+Us8XNZMlKsnYA9x1fZGjpwo1d4Xs
	CTbEaQri1Q+nc97nHSqzOkgwFPJEf8aQ7QVpXMtx0oRR/5lIRVBK1qrMh9ptoCRf+kX/MNBVZv6Ca
	Q+bfFcoJ+kekOpz8JhEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeku-00000003ghM-2yLL;
	Fri, 17 Apr 2026 08:40:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDekt-00000003ggl-1Kby;
	Fri, 17 Apr 2026 08:40:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62CA360128;
	Fri, 17 Apr 2026 08:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D93C19425;
	Fri, 17 Apr 2026 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776415250;
	bh=22JN6Dq3EwTB9lMjfnyhyBhVNs0t2Y592P69k7lFa3U=;
	h=From:Subject:Date:To:Cc:From;
	b=uODRvIfnQZxYFgNOy6P2Hhm2jjODYwvVYwkkO5ZHMZvpdcV4xD1UFt415qS0wJOJi
	 1BZdY0jYtISVNzt5OaN/CgCW65VZi5trwUb92Oixt8elvzKU0QMjTcATvfEpZDyr+8
	 OlwghzWhLlRiNipuWcgdSiE0GuAVMdmlPWo+rBWPpdnteBmh3ntYz2AuOT6wKCENJ+
	 yGxuIlHh4T9xkg6wLC8zY/Vilyq/wnyzWxZ5YP0wiB3TQRXUUkaRKPArBpovDi9kTI
	 Xojp3sU89DMv3VwzxdGQzhSkVAbq7y4PRUUlNWoTxOrmvEebxT/DxN4cHGOnKKoUxh
	 4QiXHEUCkuZnA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net 0/2] net: airoha: Fix NULL pointer derefrences in
 airoha_qdma_cleanup()
Date: Fri, 17 Apr 2026 10:40:35 +0200
Message-Id: <20260417-airoha_qdma_init_rx_queue-fix-v1-0-db9fa5e468e5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQ5AMBBA4avIrDVR8ROuItIMHcxCMS2RiLtrL
 L+3eA94EiYPbfKA0MWeNxeh0wTGBd1Mim005FleZYWuFbJsC5rDrmjYcTBym+Okk9TEtxqaYUK
 Lpa5qDfGxC8X8/ztwFKB/3w/ZiJZ8dAAAAA==
X-Change-ID: 20260417-airoha_qdma_init_rx_queue-fix-b9bfada51671
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

Fix two possible NULL pointer derefrences in airoha_qdma_cleanup routine
if airoha_qdma_init() fails.

---
Lorenzo Bianconi (2):
      net: airoha: Move ndesc initialization at end of airoha_qdma_init_rx_queue()
      net: airoha: Add size check for TX NAPIs in airoha_qdma_cleanup()

 drivers/net/ethernet/airoha/airoha_eth.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
---
base-commit: 82c21069028c5db3463f851ae8ac9cc2e38a3827
change-id: 20260417-airoha_qdma_init_rx_queue-fix-b9bfada51671

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


