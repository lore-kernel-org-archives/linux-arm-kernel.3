Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A20CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Cc:To:From:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fr7pP3Ku7uQn0hbR0DUpAxmEsNjtFjv/1TzFMV45dr0=; b=b1+XVjZAVhzJ9cv7ht6F3Sc5Ah
	IAd+fHrV1zmno5JIaGNHLm+tJRluQutweXnEFLnYxZ1usN8rd5zeADliLmwdIKzCp+1cukF1iKXGj
	afcSriSVdQwkviym9w69/2iQMoolAA33bCKrho1wktu6n1p94rtn26Dc2wEpV7xXAWRcEguHCFQaV
	WxSzkmsc1nwnddV+OwEuQ9vD3Dj7msFbCyYqQ2uNiSe/DQluDSTq0PKkw4ISUVSswTE5gg+Nl0rNc
	8/RUhFJaCWnVz3Oad0M4DAONdYmvPfy9LfexlnRUt8Z+ziOEfHjY5VBKvpTK6fQFR56MV1eQ4n6nX
	Oc+6dH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTTD-0000000EhkU-1DgE;
	Mon, 27 Oct 2025 20:05:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTTA-0000000Ehk6-1tEt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:05:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F4C1437EA;
	Mon, 27 Oct 2025 20:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC3CC4CEF1;
	Mon, 27 Oct 2025 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761595531;
	bh=1XlzM+jAXF2KkKQm0DOR3UvVjTCMQIwuND6ijwUR7xY=;
	h=Subject:From:To:Cc:Date:From;
	b=EXEvNlGui5KgTr+ppiMJGdRJoLOwgsQlTuA1qHK4sJtKWZ1IotN3MQD7NrWqvRkz7
	 4Lre7J+H82DLsM3RP95GQnA4uChAJ3oEqqkDFMFqs6C7XFzvIuxwVEi5lmqvrTWItU
	 xhOZYUH4Y+6YyIM3mfA7urNlgaU2Ti8pQTxn4cuiVJ72iw2O2gJ3HZml9AdXxkaq+F
	 sdUeV1OwYNIGHdi73T8lC7aLP2fYoSoqng3QRmG1L212L0SU0w4MT/6N83c/oU5p4W
	 W9brh4mTXgzBbyRdxlvnZ2on8xP3H8iunN3r4JT9mDzcu+8dXDyFimPKU49s+DanMM
	 jZr1S+JvDq9gQ==
Subject: [PATCH net V2 0/2] veth: Fix TXQ stall race condition and add
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
Date: Mon, 27 Oct 2025 21:05:25 +0100
Message-ID: <176159549627.5396.15971398227283515867.stgit@firesoul>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_130532_515923_274B787A 
X-CRM114-Status: GOOD (  10.14  )
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

V2:
 - Drop patch that changed up/down NDOs
 - For race fix add a smb_rmb and improve commit message reasoning for race cases

V1: https://lore.kernel.org/all/176123150256.2281302.7000617032469740443.stgit@firesoul/

---

Jesper Dangaard Brouer (2):
      veth: enable dev_watchdog for detecting stalled TXQs
      veth: more robust handing of race to avoid txq getting stuck


 drivers/net/veth.c | 53 +++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 19 deletions(-)

--


