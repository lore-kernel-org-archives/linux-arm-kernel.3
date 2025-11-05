Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FE5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Cc:To:From:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDVOMHngxo/GohPBlqIyU/kLcMr2tWhuSQmerdGslAA=; b=cYJjWkEZnrqSb/7ha0pdzQk/F1
	b2XDnY1aY0lyJ1zunktZ61WHP2kSV3FIkHy34BV6cjbUg2h/94/e6sDVc8V7/QW6ZEm3lSEfYhnd0
	jFrdof6km97gPM4KVQQRcPdhRrpDlDUMB/Lv/bnHCeWt7mL0HwMP9dKPk3qZAbWPbcL43QDI+97lG
	zTbr63Q0RmZTlfC3E2QQW+YGj4Jvuj17f85cZKYoospOOcFM7Au+BQzi2xvb1jLyrU+lNsHYLbiVv
	GQtRbL3V3JVHW9CirpRQYlEgHL42QwLm+65SXXt3xbnRNhOPwBqa1vjoeW4uxJ0yMFYHOq9jh0DAh
	LReVfgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIu-0000000EArZ-0LyE;
	Wed, 05 Nov 2025 17:28:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhIq-0000000EAnq-04h0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB375448FF;
	Wed,  5 Nov 2025 17:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3E6C4CEF5;
	Wed,  5 Nov 2025 17:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762363691;
	bh=ERKAY8Ws1C+XCC1klXumtr0c4Gaw9L4lTI2G4NjbIgE=;
	h=Subject:From:To:Cc:Date:From;
	b=FDEqUtVLgOdOiuHgM+SD/ha3/X2vwQhaWMGHaZ7i7AaCGPjKmM7/ydE42o8gBSKr1
	 DvAXMQDkDAlf1iHhLMQR9guSpM7PDp3BH07YEAVv8oKP8CflS/qPs4xDzO98KD9Fzv
	 QG6IWN7kK6OV28+j45w12tCz91MOCBIXXiE1dUZXMLfPBXp/sqPnfJHJr1rnL+l9RI
	 TAjc/WwXoQ+kwG6ZdaDZUZIRSV92y+j3QvRFW5tRoCIPZIkyWgK2B0TzKjLBd/N9r9
	 7IzdYWlL7SvJkuQlrYVLJCArO/LpSUytfOUsxGHI66DJFC1JPYm/6AKo6lVAiQA/co
	 PrKEsNJ8JriBg==
Subject: [PATCH net V3 0/2] veth: Fix TXQ stall race condition and add
 recovery
From: Jesper Dangaard Brouer <hawk@kernel.org>
To: netdev@vger.kernel.org,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ihor.solodrai@linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>, makita.toshiaki@lab.ntt.co.jp,
 toshiaki.makita1@gmail.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-team@cloudflare.com
Date: Wed, 05 Nov 2025 18:28:06 +0100
Message-ID: <176236363962.30034.10275956147958212569.stgit@firesoul>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092812_103076_1277EDAE 
X-CRM114-Status: GOOD (  10.68  )
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

This patchset addresses a race condition introduced in commit dc82a33297fc
("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops"). In
production, this has been observed to cause a permanently stalled transmit
queue (TXQ) on ARM64 (Ampere Altra Max) systems, leading to a "lost wakeup"
scenario where the TXQ remains in the QUEUE_STATE_DRV_XOFF state and traffic
halts.

The root cause, which is fixed in patch 2, is a racy use of the
__ptr_ring_empty() API from the producer side (veth_xmit). The producer
stops the queue and then checks the ptr_ring consumer's head, but this is
not guaranteed to be correct, when observed from the producer side,
when the NAPI consumer on another CPU has just finished consuming.

This series fixes the bug and make the driver more resilient to recover.
The patches are ordered to first add recovery mechanisms, then fix the
underlying race.

V3:
 - Don't keep NAPI running when detecting race, because end of veth_poll will
   see TXQ is stopped anyway and wake queue, making it responsibility of the
   producer veth_xmit to do a "flush" that restarts NAPI.

V2: https://lore.kernel.org/all/176159549627.5396.15971398227283515867.stgit@firesoul/
 - Drop patch that changed up/down NDOs
 - For race fix add a smb_rmb and improve commit message reasoning for race cases

V1: https://lore.kernel.org/all/176123150256.2281302.7000617032469740443.stgit@firesoul/

---

Jesper Dangaard Brouer (2):
      veth: enable dev_watchdog for detecting stalled TXQs
      veth: more robust handing of race to avoid txq getting stuck


 drivers/net/veth.c | 50 +++++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 18 deletions(-)

--


