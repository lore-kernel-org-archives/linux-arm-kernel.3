Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B3C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjeV9JcXmMB5XUYPG/BDWWBwnse1nt9xQQ5l1gfrbe8=; b=zqcgWfFoT7QgdAvJcwj9/jAUp3
	oSRv7nDqVMeCXLuIGEMP8PCBklJ8EyFo46i63N9/cG8wgjtGeeWbVlvDzrUhY4Qvu8hf/GDc4RtQM
	lEQiK3+xuWTYbl91IEPmq3fyyyprW1GlkTkb4RdiYZPzXxCtM2TnoaV5gx2EzNejQtFFZ6qf92Yob
	LoSdKJPOaioH+tMb2esu/utgq2qq8E7GuMiVCd1NkXPkz/3naGkk4uwAu5PfREoLYlkJUL+ducPr8
	TL+cTocx0IRos/cl+8/z0X+hki/rzpugPevcxdWh+Fz9kOosdo5sxIjGsBoSzbjE2uCuj8T+dHfSQ
	XKbrkrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamh-00000001QLr-10Dj;
	Thu, 13 Aug 2026 19:08:11 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuamb-00000001QJu-41qO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:08:07 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-38dcd98e5easo115311a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648085; x=1787252885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjeV9JcXmMB5XUYPG/BDWWBwnse1nt9xQQ5l1gfrbe8=;
        b=f40wZOujQUVMRb750GgKNZDCC2KqpfaeI7/KH7bSdGMf2TWExScMEmPG9Yy/eM2GI6
         KeLPCAAS8izPQPnPXOVjW9XBZth/vOQT87FKmcPYVxviZwjQ4WY6oJKj3ncTMuYlJeA6
         HWD0TyNCCsNQmft3+ONmPR4h4kd91634s1z1DEyBprTQT80z/dGGJjZ/oyw7Rw0TmSG1
         mwLmrP1dd/8zbFG2U7YPUlboPv91N1NTO4kxY16lO78NBckahddnJbAs1zjkK71rAVD0
         MBk3HrQi5V7+vqY/G87hMUTXsXNZgwWvkY1hwoYWR5Ecn768t9xKkQFtp1FkXiYxsvpD
         iYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648085; x=1787252885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjeV9JcXmMB5XUYPG/BDWWBwnse1nt9xQQ5l1gfrbe8=;
        b=KJ8f3Dkhb13p5qYFOMp4lY8JWAL88nQM1ahrnQrh5vPqZalCsR2qU4eXmfRAEsB+87
         X3nTydZhNApMzkkHbwdciq2uOHAhSRxrAxuNMCqOkVOIzhQsiBagHhxygqJcMNwnVdcg
         rFnO5A27wiaS5r0mkbjnEob4ij1AsXRPOTThBelcXw0lc2cvN2YpvjvJpNdADhCXNKgb
         0NVHBvq2BDrcRQ0Xggd+FxcvTJnGRyzvCB/B08iDQc76P0ZhFyGj4lWB8WbYEfyvPpeK
         3p6+lcDzySoo87yLmY0yoSjOnif4qr+f7Y0Id7VENfmYk/OIUoiw0aYnOsUysscT9Iz6
         4+Dg==
X-Forwarded-Encrypted: i=1; AHgh+Rpc3nqRlmu2chiCLiVSqC5idvwPyzOGkPa9sZKAOuss89H4nhXWufx+023yLn9H+lYVtnUIoM7/Uf39Gv2grQtT@lists.infradead.org
X-Gm-Message-State: AOJu0YxMiQ/DWdUwXxdxYmy7ECaaIEqEAHiQRFSKR2nrSgOJD2yBI6Sr
	1tXh2jGCfK3BP1gYyC6ZYwA5LJxEziew2ajBE+q2E7sY+O1yK5QxGKtk
X-Gm-Gg: AR+sD13q61f/Z1fl5Y4Wj9+bdKOGmyVuNbTijv6upZ4Q3vHcwBJGxeH8NywFYC0iuqv
	P2YAWPl1JBl1VmyPdjj3/0JitT3zxWV2hfsreQGdicbfqeC78cjz6BfTBB3l5HMU8DmQ+GuhVB2
	X2bDVXIzJT1NIh90VifGbRiz4QTMzmaq2WUe/KnNSG/7xPKctuDeIj3jUemvKa4Yp1LJmsUFGNY
	f72AAQM5x4cr47SQorQCy8n3iErlOUFMheFr7SLqbLXscRBjF9RuedesBHIXNicHJ6Fx37O+YF6
	k4KX305PTM6EfdMVjdqPg5qijlGp41QpKh45FPJKlya5gOPuoIGMbZQ45ZJQb9y0cclgbJS5r0O
	yGQTkntsNriOm0PVQE+eqLnqHEFeHOtnfOXffTBFDDaJhome8+iirMHJPUhwVjFcN9LlR5S6IsQ
	FM1MJYWGVBZWf55zrEu10GBzvJY9jMEEtGQI5QxplDlE3mwksdJzplHw==
X-Received: by 2002:a17:90b:2f0d:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3933ed5e238mr29902a91.20.1786648085014;
        Thu, 13 Aug 2026 12:08:05 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:52::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339fe280fsm485100a91.12.2026.08.13.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:08:04 -0700 (PDT)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v2 3/3] net: stmmac: skip queueMaxSDU check for AF_XDP
Date: Thu, 13 Aug 2026 12:08:00 -0700
Message-ID: <20260813190800.222527-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813190800.222527-1-sdf@fomichev.me>
References: <20260813190800.222527-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_120806_331315_8DC69C7D 
X-CRM114-Status: GOOD (  11.73  )
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

Commit c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
was inspired by commit 92a0dcb8427d ("igc: offload queue max SDU from
tc-taprio"), but the igc change does not apply the check to AF_XDP.

xsk_tx_peek_desc() reserves a completion entry. Continuing without
queuing or completing the descriptor leaves the AF_XDP rings imbalanced,
so remove the check from the zero-copy path.

The assumptions is that AF_XDP zero-copy traffic bypasses the qdisc, so
taprio's queueMaxSDU check does not apply to this path.

Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 62de03e65a90..4a82f4351303 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2710,13 +2710,6 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		if (!xsk_tx_peek_desc(pool, &xdp_desc))
 			break;
 
-		if (priv->est && priv->est->enable &&
-		    priv->est->max_sdu[queue] &&
-		    xdp_desc.len > priv->est->max_sdu[queue]) {
-			priv->xstats.max_sdu_txq_drop[queue]++;
-			continue;
-		}
-
 		tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 		dma_addr = xsk_buff_raw_get_dma(pool, xdp_desc.addr);
 		meta = xsk_buff_get_metadata(pool, xdp_desc.addr,
-- 
2.53.0-Meta


