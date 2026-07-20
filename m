Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5389C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E65nlaruGhJuqNuF8KB2HEMfPViqQyGyJYzghl3Alh4=; b=M+KEaIYK+c7BOIh/CBzTKWT6Eb
	1DyRHe8Yg7z1jNxxAKfkjmM6eID45LBLAW6P4HGgEglKQAC0L3lINzu91bjZ8TA1ZrAdvE+dXjg8L
	vqIEcirFjZpIkAbHTerKH9eZiRtxLAg0vNKyS7zqtm/nqIrXCs4xTRHdDKC1BqJZCwkvZSMY+6Nsz
	GkIA0mqc29SNhCT/nTy5aCTjazF7C0SeRTb33ls1gQgzGMKKiGrjAT6NuwGYweKfBxkSyZVG3GOa5
	e27lMQyFZnbjZMVNUva7xFuCBUI693M/9EGvFPfyPvuyaoa7gzt/Syf2R3rYhnBMnRWT7OrLunyFK
	V37RTTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlm5H-00000006au5-3LzP;
	Mon, 20 Jul 2026 11:22:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlm5G-00000006ati-0t0j;
	Mon, 20 Jul 2026 11:22:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6503A60A77;
	Mon, 20 Jul 2026 11:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911EB1F00A3A;
	Mon, 20 Jul 2026 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784546573;
	bh=E65nlaruGhJuqNuF8KB2HEMfPViqQyGyJYzghl3Alh4=;
	h=From:Date:Subject:To:Cc;
	b=P5BvaQT32kFKI2rNddOKq6FaDU16ICBtP4dbj+9EB5kQgKbUs0hLZ9WgGPlFStcHU
	 kOu7vSfXhzUQCxQdEt+izfksAeq8fdiuivFgkCjIAkiE94kFupDqQyrhFS/eL/A5yg
	 9HrYMLTbMYIKuAW5wn+RKzNS00EuuANqCCBOP9vV0om3A0vBN6HwlSPsesGXWKeMnK
	 F57HCVYJLLM7s+FBXQuK84MMeeCky+W5X2bkWsMteYXg/n4FKkfR1BAAID9d5ndEk1
	 i8zU4RvxwLySbBmvQvUhfPQdAKhZCexTcTI6E3c5XnwnrZoAP4gOAX5B0ITPnbqVlb
	 olLI3IH6JkUzQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 20 Jul 2026 13:22:28 +0200
Subject: [PATCH net v2] net: airoha: fix ETS channel derivation in
 airoha_tc_setup_qdisc_ets()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-airoha-ets-handle-fix-v2-1-6f7129ddc06f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBCFr0Jm7Rj6Qw2uvIdhUekIE0lrpoRoC
 He36QVcfu/lfW+HTMKU4drsILRx5hQL6FMD4+zjRMihMOhWu/bSWvQsafZIa8bSh4XwyR90o3I
 ukAmmd1C2b6ESV+8dIq0wlHDmvCb51q9N1eqPdlOo0OpOuYfpbO/V7UUSaTknmWA4juMHzs49t
 cAAAAA=
X-Change-ID: 20260704-airoha-ets-handle-fix-6c166de3d396
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>
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

Derive the hardware QoS channel from opt->parent instead of opt->handle
in airoha_tc_setup_qdisc_ets(). The ETS qdisc handle is either
user-specified or auto-allocated by qdisc_alloc_handle() and bears no
relation to the HTB leaf classid that identifies the hardware channel.
HTB derives the channel from TC_H_MIN(opt->classid), and ETS is always
attached as a child of an HTB leaf, so its opt->parent matches that
classid. Using opt->handle instead can cause two ETS qdiscs on different
HTB leaves to collide on the same hardware channel, corrupting scheduler
configuration and stats.

Fixes: 20bf7d07c956 ("net: airoha: Add sched ETS offload support")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Rebase on top of net main branch
- Link to v1: https://lore.kernel.org/r/20260704-airoha-ets-handle-fix-v1-1-42516b3549a1@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..fac2aaefffff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2504,8 +2504,7 @@ static int airoha_tc_setup_qdisc_ets(struct net_device *dev,
 	if (opt->parent == TC_H_ROOT)
 		return -EINVAL;
 
-	channel = TC_H_MAJ(opt->handle) >> 16;
-	channel = channel % AIROHA_NUM_QOS_CHANNELS;
+	channel = TC_H_MIN(opt->parent) % AIROHA_NUM_QOS_CHANNELS;
 
 	switch (opt->command) {
 	case TC_ETS_REPLACE:

---
base-commit: e13caf1c26587434f0b768193100440939c0fb91
change-id: 20260704-airoha-ets-handle-fix-6c166de3d396

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


