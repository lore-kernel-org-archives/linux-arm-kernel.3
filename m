Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF1FC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnusHejKpGyh9HbEBCnQmungQzWoz8PMUq/SwTBA+5g=; b=WbvAouhTJmckFqGxPAh+1HiJ78
	8fZwlsZj+8MvohNtdJ+wi4uW2oxWxa0vH+qPE9kW3Se+LQeAVfORrWr5LD5K+eIbEkeSiuckdiuGQ
	SrUciIgig2i0WRn2oUXpjf5h5n+PTQWJSA21BP6f7QTe905DFfCc2s4IQUS5ofYW80KaIGmofBPp7
	f8D5QIQe+J2q/tnI3qxaB3p9MVpwnlXkvOMaREH2nJ5hHiPy4HrZzOIMHJkWT3dp7vlfS075dii6d
	DpsRicyigOkwok4ltXzSNR/R8IsIUdYRLBkBdr4YRaNhB6uLEsFI3oKVPDJ0iHEngR0sSGJZn+pvf
	/zpFTbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SZq-00000001yiL-2bSR;
	Fri, 04 Sep 2026 11:59:26 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SZo-00000001yhK-2eCn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:59:25 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-ca80d708489so690780a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523164; x=1789127964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnusHejKpGyh9HbEBCnQmungQzWoz8PMUq/SwTBA+5g=;
        b=Bdu7CI3c9kl2+xyxc4qu1yhW9fbFZ643voxyLAvXmVXzTa3FAku6QyS8jYftUGvSz3
         PkbOuuy5J0uEPjIGJBNFaFelSCguhJG6O9m09lC0ngbATmL136W3B7Vg2PHwEOisRF/u
         +1xog3hr70nJNLoHKk1LImSbBsFCg1wUnecHtwXg4jUexVPAaPPUi3A09CufJD6wv4HR
         Nh8mfXss4cBcBTA734kyQoHxEsu8fLyVsqT43+/+Z5B1QKyzLSabhkjJQsGaU0lP+Zp0
         KS/lkkF+7QlzsoiD1e2ox1MnFcSC3WQthAP4T7RCrWWMbf/kXVBuTAKAGl63z3kZaHuw
         VC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523164; x=1789127964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnusHejKpGyh9HbEBCnQmungQzWoz8PMUq/SwTBA+5g=;
        b=mSKeJbl7eopdWumeeDRWbeN1d0MugJQ0wmMzTwHhEiK79sB7NYMAyXJWKZnHLeRAbG
         6+LiaV9bZnMWFcNZ7S22qjnU23eamEP7RiiCW65F9Q1zX0tElnUqwzEtoVUEMw578hZp
         Mhm5OrXfjkP0uy9lc1AjMMmlzZQV6KDNL6XV3SmQlQ1bkkpGrMA6bJiN5MpwVndxAcLZ
         NMLq+Jagnw1SDbgBdYPWsPdn8MRlMQsIz86jw5N44zrOY+SjFaCFbQGMs99sO5+zwUmf
         pNiLDmKWHjpYF+wLDRt4QzHu7b33MNhMe86EdGqyZqBCLe3g2M6/EWEL1kZojzfMZqAF
         gqjw==
X-Forwarded-Encrypted: i=1; AKwUvByEF1qEoBh4giznDaomcXWj3Ib6tHJ11nmNiRdihpplEWXOY+zLeL7XfEwjhOyHyestf5NiR73IN8+j4apRev85@lists.infradead.org
X-Gm-Message-State: AFuF++n4rb7yy6wlixFAyqTh1Poh3tvUSMQ7s03T/RQ9ueT4GrfLO5FS
	RWWnRoQ2yyQu6ShKL9Vrwq/X6ug0fflszze6p+ovig62k5G2ixRaFklp
X-Gm-Gg: AYBFou1ortXKa7eNOQGUDBlyuF3rC7eNXjSZSwUz5DvLOiDcPmVMqPqgM0Kq3rahVDM
	snkPafxHTLSo9VCBpxqBDtunAsJgIfAvK3ONP75+YBywjnA/BLBL8ezpH6qf7ThGGw0E71eQREG
	dPjcSCXfXv7RnAFhYpB7sdwLuwB0N8H0tPYgkgznC3cGfm1aiTm1nBHBYIw0C3sdujzA7g7g94g
	+rPVl1+OFnldTPbD0w81ep+Yh6ULvCU0ugH8Lh5XTMrYKCYsYzlxBikmwETkGSxG6+4jcTe3mTh
	3zADKkzJs0KIFo9NNJzuXvZ7P1Hq+dvPMCtK84d9kG3G8pPN+q/dC5qyyM7/yeYK0A6iW4Ctu89
	guXK/QtjwakPCwrGfwMHnXaJS3E+s0MYjvRV31L640E+Rd1Meg1vs7Qt6P/aRLhtOSEyJgF84AS
	hAp8dPeNrrD0NpXCMeIV/s9WW9F5gEHA9QIPBJyXG/FKpAiwaie2pNHmE2N7/lhJldBxdTsPJrQ
	CyGxM7vj2rpF1I=
X-Received: by 2002:a17:90b:3fd0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39b07fed101mr14362000a91.10.1788523163577;
        Fri, 04 Sep 2026 04:59:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339c0ec914sm7034122eec.31.2026.09.04.04.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:59:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH] net: cortina: fix typo "trigged" in comment
Date: Fri,  4 Sep 2026 17:29:16 +0530
Message-ID: <20260904115917.13695-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_045924_668653_D99EFA88 
X-CRM114-Status: GOOD (  11.85  )
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

Correct "trigged" to "triggered", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/cortina/gemini.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cortina/gemini.h b/drivers/net/ethernet/cortina/gemini.h
index 24bb989981f2..d359c633c5de 100644
--- a/drivers/net/ethernet/cortina/gemini.h
+++ b/drivers/net/ethernet/cortina/gemini.h
@@ -726,7 +726,7 @@ union gmac_config0 {
 		unsigned int dis_rx:1;
 		/* 2: transmit data loopback enable */
 		unsigned int loop_back:1;
-		/* 3: flow control also trigged by Rx queues */
+		/* 3: flow control also triggered by Rx queues */
 		unsigned int flow_ctrl:1;
 		/* 4-7: adjust IFG from 96+/-56 */
 		unsigned int adj_ifg:4;
-- 
2.48.1


