Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB66CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Cc:To:From:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9Uf41LeLD7nyh6n5o3D+/370fbrBOVr5AQVaaJMLpw=; b=MWK3J8ygxBOEZMiQjwJwLQGDI1
	dcGOIotk+CAofrtKwd3In/n3GP7NzxYJXLfdBM0nAPSMSpR+lQigrZQ234KK81bplaeNq9iCpYj53
	6m4J5XomnxMWSP6WLupjrPPw/KVnp5juU4xFp8MgB5Rf8yhWjasQAqfuAiOGXJ434KT0KUosK43g7
	ShKOnYFiIBVQZjVXg7arTawpiVmC7/i5BrRSDkU35UaqjnDMId4wIJ4E8+TZzg4TM0I/+YPs3xNcw
	QCG9gYclg/0a4xB2ebQkVw5a4Qz0uEZncY0UTB4+T1aFV8NFkpBSr9A4EfFFkpi2kbCwWW6sXiB/l
	peL8+xnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAfa-00000008pI8-0bsb;
	Wed, 12 Nov 2025 13:13:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAfY-00000008pHs-2Uz1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2D246021C;
	Wed, 12 Nov 2025 13:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47389C4CEF8;
	Wed, 12 Nov 2025 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762953231;
	bh=dvz7hRmiuiAhbxgowOiFwTCdoSQOqn4Z/6EIk6czuZs=;
	h=Subject:From:To:Cc:Date:From;
	b=LHZN+FnV1ZxAOGspdw1QFuAH/vbK0L2ttX08AKV1nQ5VBW4DLCFpDgSj7S/smKYI5
	 b1bece4HG6ckAzOjBQAq0m2f/J23jNVKcLFufbnUB+3JKVrrTKVI3eYVtM2UDYZO+/
	 IRL6D1U03rkIoRlgb3hSJ5jXB3gW+i3FpO0V4LP850Bhr+xiVkc+RfBxFf6gM+lx5N
	 K7V4v4OCnZ97azw/uA0XwEzoxhRH73+7KealfQ2yXQ9c17wKPw/Aw0TiOue5yX8AIy
	 bKPYs2kNeZX+bKME+LgA/xFrUP2pSiryuRRtCyJF8FFA9hOjzXUfGLbog4yuxJrxQl
	 qngVtDQrz05vg==
Subject: [PATCH net V4] veth: Fix TXQ stall race condition
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
Date: Wed, 12 Nov 2025 14:13:46 +0100
Message-ID: <176295319819.307447.6162285688886096284.stgit@firesoul>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

The root cause is a racy use of the__ptr_ring_empty() API from the producer
side (veth_xmit). The producer stops the queue and then checks the ptr_ring
consumer's head, but this is not guaranteed to be correct, when observed from
the producer side, when the NAPI consumer on another CPU has just finished
consuming.

This series fixes the race bug, making the driver more resilient to recover is
postponed to net-next as maintainers don't see this as an actual fix.

V4:
 - Focus on race fix for stable net-tree
 - Watchdog recovery patch is postponed to net-next tree

V3: https://lore.kernel.org/all/176236363962.30034.10275956147958212569.stgit@firesoul/
 - Don't keep NAPI running when detecting race, because end of veth_poll will
   see TXQ is stopped anyway and wake queue, making it responsibility of the
   producer veth_xmit to do a "flush" that restarts NAPI.

V2: https://lore.kernel.org/all/176159549627.5396.15971398227283515867.stgit@firesoul/
 - Drop patch that changed up/down NDOs
 - For race fix add a smb_rmb and improve commit message reasoning for race cases

V1: https://lore.kernel.org/all/176123150256.2281302.7000617032469740443.stgit@firesoul/

---

Jesper Dangaard Brouer (1):
      veth: more robust handing of race to avoid txq getting stuck


 drivers/net/veth.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

--


