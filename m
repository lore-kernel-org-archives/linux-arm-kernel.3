Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A404CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nLejDTCOcMkRPsxQm6RvL7N4wsY+oJtksd9yx89mHIE=; b=foU7gHGF2QSksC
	nQ6um+pMtVzCd3RXZZeY6m6Xv27hLG2L9Hn9gUodhsJg8OpMLKJeqURsNW0qIatsUMo2QZSb1NSJ4
	R5XSlB4AVMKvzvshdz9JPlV7eSerzA3RsEznin937jKhxZZuGnumnc7qZhh5CLhgHecqNcbB2VVrS
	UFTh0UD52tDLNV4UeckUmHl99359S3Vyw9CPFJTNIXA8vx7uThTTSQoScuS9FqtDpwlqdnoUUJrUz
	i1RqKD6WWlndC2jvEMT4JdCPUoNdeGbf8LdZGhfbrw2QGVWMUXp6G6U1MyhzHyHj2infjcQ+Xf6VC
	WWH6cMFnWhYqxf5YMqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULJR-0000000Cdl2-2JmO;
	Tue, 02 Jun 2026 09:21:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULJP-0000000Cdkf-28J7;
	Tue, 02 Jun 2026 09:21:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D39B9442BA;
	Tue,  2 Jun 2026 09:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54841F00893;
	Tue,  2 Jun 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780392086;
	bh=nLejDTCOcMkRPsxQm6RvL7N4wsY+oJtksd9yx89mHIE=;
	h=From:Subject:Date:To:Cc;
	b=HwaT2Zak7T3OM56w8Fb8w6vuygKxoxQx7JNJLQW7hL7BB5NO7CG4Y3FRotDKIs+/P
	 zf6VJXCeTBmsvK9wmocDCBWVxo1s2o/yV0CxlfCpUgjcn9kbbl4KDnvZ1LU9LIkMD+
	 hGll6FmHgtBuD4feOT2jGxbE5S5VwwAcIb73bOA5GnFybbX29ondIUi7aHXhOaJ5VZ
	 P7Gnv0RSYoJKMxblpXeieNLCJnlLxiH/9yB9xMI3+nxm5QGN0DoaSHNoctEznsZVG7
	 1l0tu40HghTv5Ze60bYpicQI3SX3rDhtF13lsHIYfu9dQJem93w7HAKl7yTYERO5bO
	 c/zeri8lSTU3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net 0/2] Fix use-after-free in metadata dst teardown in
 airoha_eth and mtk_eth_soc drivers
Date: Tue, 02 Jun 2026 11:21:03 +0200
Message-Id: <20260602-airoha-mtk-metadata-uaf-fix-v1-0-3aaa99d83351@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MywqDMBBG4VcJs+5AkorQvop08ceMdSheSKII4
 rs3uPzO4pyUJalkepuTkuyadZkr3MNQP2L+CmusJm99a1vrGZqWETyVH09SEFHAGwYe9GAJ9hk
 Qg8OroXpYk9R837vPdf0Bfu9zJ20AAAA=
X-Change-ID: 20260602-airoha-mtk-metadata-uaf-fix-eb03badb1a94
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Florian Westphal <fw@strlen.de>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022127_598911_189E3E1F 
X-CRM114-Status: UNSURE (   7.38  )
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

airoha_metadata_dst_free() and mtk_free_dev() call metadata_dst_free()
which frees the metadata_dst with kfree() immediately, bypassing the RCU
grace period.
Replace metadata_dst_free() with dst_release() which properly goes
through the refcount path and runs call_rcu_hurry() if refcount goes to
zero.

---
Lorenzo Bianconi (2):
      net: airoha: Fix use-after-free in metadata dst teardown
      net: ethernet: mtk_eth_soc: Fix use-after-free in metadata dst teardown

 drivers/net/ethernet/airoha/airoha_eth.c    | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 3522b21fd7e1863d0734537737bd59f1b90d0190
change-id: 20260602-airoha-mtk-metadata-uaf-fix-eb03badb1a94

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


