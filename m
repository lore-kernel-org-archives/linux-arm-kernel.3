Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC8FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+iH0oScX6vUoO3wK//wIGjcdPMvMKHF3g6QanG2LHo=; b=ryZhNckcE2DFSK3pf+XSPDgT2D
	ryblMCYAjV2REsXnBDn/x1RhnGb8n+Rurypb7nJTfmS15c6N+Yurbyg2B/Un4Fcr8gjF9UJntMxqb
	d0I81fTQNb+93x5FwMNw94kQuCVrp2hTCOh5ql8zYt8AwcXvISMO2t1XTMjJt17C7pGum9id82AV7
	2nCaNL21NycN7HGRONHC8Kt6N4nFJs9CqQQx6zmoRoVGEG+gRg5rNHbgSJL7G8XglcFmxB+JCrF0k
	5yzD+CbUBCxEvdWUSm8zapqxZMkDPrrtRa79Ajzg+3z6aYrPs+Z2oOheF9SvGHKC0juJwNKErZBdl
	O6dDGxNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFZ-0000000Bfea-2LIL;
	Mon, 06 Jul 2026 06:56:17 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFT-0000000BfdH-4AEp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:56:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84347ad88edso3782337b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783320971; x=1783925771; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K+iH0oScX6vUoO3wK//wIGjcdPMvMKHF3g6QanG2LHo=;
        b=UMnIHIaw/j0yEqcU7m4EMrXhV3bmjGLtrAUtCpc3tAe79M7PgKt4zE1Al9T+kKh7Dl
         j7i/JXpRsM5v4wbICl51VP9EWddk2+TW+jLQAWCULsItJP8K7y+CqjB1wIbi5XNmGWJg
         DeRR0BmPtvLCmaNpjDQy0NEMIMov8OfQHpIFV3dA6hWIX9HCzCgqEieaCdZBvJ+QRNwu
         PLtDBs57rxhUTyfGJcZjTc+Dn9M/VVyiqwLJ5kw2evlq3cQn5IPc7EzDfqZRM3JIz2xF
         Qi/BRX4k/Y+kA8kYgHjVqMZ89Jakhr97GW685x9ixL2EIInqwVHMrf2atOsBK81jqco6
         c4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320971; x=1783925771;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+iH0oScX6vUoO3wK//wIGjcdPMvMKHF3g6QanG2LHo=;
        b=JiNFPIO7YZjc5TkSKusUHyYguigYD6YACyWS3pWYZ74stSNKyd+VAz/xiq3QBaUPqV
         xQNlt67P99VTcsnF69MXx7uIOIWVeAEXXhggqd9VN2etzDNIZsRBLXDeSPkFVKJhYc3d
         S+qmyeWgNbJY+AlGEOSY5M3z8fYRbIBnExz3xbVcFKEqPeWI3bccUsFXLfXqngzcHC+M
         neZW7pRpAy3rxFWOHvg3tQRuu8QsBPG67sZUEFtvEfa5hdXABCtbESNHI/ow06XkrQ/k
         gFU2BSfJpsnIJ5Maz+8OlTiT157l+CCj44ayiK9Zbt6zWePuomUfQ4yHGVCYCPT4FITX
         JY3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpOYz8rVq/w5l2c0h0kZQwmsgsSjKvhLxQ+tUwvVREJCk2GfYgdPNymfID3PQ4kr96iTF/68QWDzZGjfdXM1g5T@lists.infradead.org
X-Gm-Message-State: AOJu0YyfptMS4ryj64AffpJ9GhNa0Kmj+5Q/JjPYVQvdfqsOFrxfavzH
	lc0hRLoizYe1BoEtr5r882UH2wszgiGF8ucaIazw186SSV8hHJD6MDS8
X-Gm-Gg: AfdE7clKOd/4V7XJ5PGKd/8wuJTLMuTmBdT6KrFptV/SRb1eJ2oxX671tR/pAOvDm1M
	JYXvGeIAy/KfjC930gROjgd5Nkd1mWXPxVWqaWQXENStAEKz2PU5aag0eGG7oKVee/ZChxDIEyC
	QrJPnCG0acJipPWAEhDEjD8wCoXYdCATitOj/hc3gzve7PH83lzjj9pEKMQQCZmxMxp2LJsdDlp
	AddkXh/bfs1Ipj4DHF+d+2EnbKUerIWHjqTkPecAcRIgTCJWf6fm9KYtwqmmtZS+0YPcswtcoGI
	RgKmhU7aR/+DCs+UpyeGhvGCA9NDNvenon71xpoP2CCdAyaNA8rPGM7x0A/WZ7pfTX0IlFx3Gkc
	XzI/Cy5mkSmzqKV4owRuyJ6BedVmuKEUbu9A49WsuclFI0SFGwdKb8aAjqGMBYk69M3P/LaWvj4
	NI3OK/bw==
X-Received: by 2002:a05:6a00:4612:b0:847:84a2:cda7 with SMTP id d2e1a72fcca58-847f6d5a847mr9033848b3a.12.1783320970734;
        Sun, 05 Jul 2026 23:56:10 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a915sm3181753b3a.44.2026.07.05.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:56:10 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: fix HTB class modification offload
Date: Mon, 6 Jul 2026 14:18:58 +0800
Message-ID: <178332096675.2250671.599544331813347302@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_235612_032069_97103662 
X-CRM114-Status: GOOD (  12.91  )
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

HTB core does not populate parent_classid for TC_HTB_NODE_MODIFY.
Airoha currently checks parent_classid against TC_HTB_CLASSID_ROOT
in a helper shared by both TC_HTB_LEAF_ALLOC_QUEUE and
TC_HTB_NODE_MODIFY. Since the modify path leaves parent_classid as
zero, the check always fails and changing parameters of an already
offloaded HTB class is rejected with -EINVAL.

Move the root-parent check into the allocation path and validate
modify requests using the per-netdev QoS channel bitmap, consistent
with the delete and query paths.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..8e4e79c1e4c2 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2766,18 +2766,13 @@ static int airoha_qdma_set_tx_rate_limit(struct net_device *netdev,
 	return 0;
 }
 
-static int airoha_tc_htb_modify_queue(struct net_device *dev,
-				      struct tc_htb_qopt_offload *opt)
+static int airoha_tc_htb_set_rate(struct net_device *dev,
+				  struct tc_htb_qopt_offload *opt,
+				  u32 channel)
 {
-	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	u32 rate = div_u64(opt->rate, 1000) << 3; /* kbps */
 	int err;
 
-	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
-		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
-		return -EINVAL;
-	}
-
 	err = airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
 	if (err)
 		NL_SET_ERR_MSG_MOD(opt->extack,
@@ -2786,6 +2781,20 @@ static int airoha_tc_htb_modify_queue(struct net_device *dev,
 	return err;
 }
 
+static int airoha_tc_htb_modify_queue(struct net_device *netdev,
+				      struct tc_htb_qopt_offload *opt)
+{
+	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	if (!test_bit(channel, dev->qos_sq_bmap)) {
+		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
+		return -EINVAL;
+	}
+
+	return airoha_tc_htb_set_rate(netdev, opt, channel);
+}
+
 static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 					  struct tc_htb_qopt_offload *opt)
 {
@@ -2794,6 +2803,11 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_qdma *qdma = dev->qdma;
 
+	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
+		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
+		return -EINVAL;
+	}
+
 	/* Here we need to check the requested QDMA channel is not already
 	 * in use by another net_device running on the same QDMA block.
 	 */
@@ -2803,7 +2817,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 		return -EBUSY;
 	}
 
-	err = airoha_tc_htb_modify_queue(netdev, opt);
+	err = airoha_tc_htb_set_rate(netdev, opt, channel);
 	if (err)
 		goto error;
 
-- 
2.51.0



