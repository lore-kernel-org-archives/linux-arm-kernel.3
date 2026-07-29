Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE6C54F55
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg6ArNtx1AiAv6yPr+prFaZ5QUtx/jRFL3cP/oq9oL4=; b=qkg0f4gs7qEMMzDLSJukncWTPR
	nB6j/HLMqCJLjVf1ZDQeLo4ftkSmgr7dtyNo/xjRxR3UHyGp4VQoP4UFJ2wuMsvpQs/XZU6WS3ilX
	4W6sbrKPqhmRKOAZAsBqAn31/IiwlgeqlyfM+JDEgEDKsaNikLuHhjFIIC65aPJcnIFfq6YBfuYag
	PWevZv8IlwgfW+BnCgDSz++Qh/4OM3FCWP3qFerBfMwDnstFCo9slDyt9FG4o6iJf8wXubsLOdMy1
	xNLTBY2+9sH1SWXnpRyQYhM3ObBHZX287R6tS0h4YHWvGNFBRxezgiv8eu7l5BgxqHKp8tDGrMYm4
	KYOUl9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8D5-00000008id7-3obJ;
	Wed, 29 Jul 2026 17:36:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8D1-00000008iaN-493a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:36:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cacf197759so19430365ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346607; x=1785951407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg6ArNtx1AiAv6yPr+prFaZ5QUtx/jRFL3cP/oq9oL4=;
        b=hZ0dip/E4OYd6+jvFa/wDC6pn8FxuWI4GJDexEA32SXCGX06O0Dfpae2xmVBIPwWN0
         At3gLXSJzDG/9jd/VE+TUtYiiolDYJ31n9G3EXqcm00kEcCRRR1xM/gu69XQ3sDlRemn
         SKEY7FlT/yA0i9znbJRSogq1wKO0nB4809J8MvczYvBLMv9z5IoP01Ha062B/SRgLWut
         BeT6u36Tazo0OXvbFm2UOZRncTw98y2Xy1s/6+LO60sAQY2fZaC7mlaPt9kdSD246sqy
         gQcONo9hW+w8f8jXlLBOCPQAZCHd80wID02HpDFSyXSqiaP9c19L5obMscryKYqe/guB
         mBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346607; x=1785951407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg6ArNtx1AiAv6yPr+prFaZ5QUtx/jRFL3cP/oq9oL4=;
        b=SXlp9jOsNR3fxxQBht2RqRAtsL3xTkPAmy94vCAzaTbTNupLU5SmnEU4/R3pq1t23M
         8lq1QJl8nhGskcG34LQ5B5efhdlnP2lUxXxrL72n3EbCkGjPfsZfE+n4yLs8RUF+yU/y
         V8Kyr9OTO4JIfhcdcMb2sJP70Jerh13IRRzqsdg7oykTWQAIf+JdCu+vbL7uC9B+0xo3
         3AVahIjVI9+0ZJBlE2Jk56GuOOEsyj61dAj0NlbuJm+lX4ahrngl7smer0ra94r9yXHz
         TVJf2ZHlg/gyF4qSknN2ZXScKAaaBCwrtw2lRkAGmby8NjClqqetbzy5a6UL5smZyTNL
         3IYA==
X-Forwarded-Encrypted: i=1; AHgh+RoQ3fxsgapsruLAFRWJKmboC1194tt93SgDuOStm+qLwUFFgVZEsRvcJYl1QHFB4J0NGOozIHSfnTPd1MaslyLL@lists.infradead.org
X-Gm-Message-State: AOJu0YxH80fVjCeCqGttTKWm45fABjeuva4x+0pD3dpsdVi26cSL3z5n
	mm7rMqRJ9M55oXboQ3FL4cn1puF5lkZR73Ej3KYnQ4/3EAxSYxFx/cXC
X-Gm-Gg: AR+sD10uMw5wJxKyc8xkVoPbdCVBeRZMqOzndi8+sPT56Pa4r1iPhoSqWdK86CpK/lX
	IJqnO07/gOxIjq6rFAKL+5kmcV8XXtEzvYct0ztthVfnhBCYp48ZHzKBu7qkeUR3JMxOqsvqxqE
	JKofdb41p652ggUMgMTafMBWXv84lW8OPWbwRnrbu9YLgfLSOTgtOmKc9ouVBifEYmZS2viHSdG
	zq0vCxEsAHY6CHGJz3M9vWQ5Zgb88sPqB5xO9QgpFF+Jay5dtCQmphHXCw7XrtzFaYsA18kkuIF
	sR3ZVA3V4rZX9cYepfQ3/OIZxyrYUS5h91L1zjrwcUIj+2JKXS6wm5lfOkXkgkk4l5e+Cqtrh7d
	IQqlZ26cThFIh7iSzw1bfPK/+lHHgUgHEgMBXILHsZQ1i0x4WSLpVviiJGFIxMYXIJRHdtwc/S2
	qdJQFO27uuxpui9EqGd5lUkqwO3DEtLqsajyIsxlQqIzR2a8bugtuQ4DuTff9NJXpJapmI8Emov
	afzoRNFqU23zgV3LzPmOANMfNY=
X-Received: by 2002:a17:903:11ce:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2d016050393mr86243135ad.39.1785346606916;
        Wed, 29 Jul 2026 10:36:46 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([120.234.91.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm14806045ad.55.2026.07.29.10.36.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 10:36:46 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Chad Monroe <chad@monroe.io>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mt76: mt7915: unlink TWT flow on MCU add failure
Date: Thu, 30 Jul 2026 01:36:31 +0800
Message-ID: <20260729173632.14387-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260729173632.14387-1-enderaoelyther@gmail.com>
References: <20260729173632.14387-1-enderaoelyther@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103648_069287_1E97D7FD 
X-CRM114-Status: GOOD (  13.53  )
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

mt7915_mac_add_twt_setup() links a new flow into dev->twt_list before
asking the MCU to add the agreement, but exits without unlinking the flow
if the request fails. The flow-ID and table masks are only committed
after MCU success, so the still-linked flow is invisible to the
mask-gated teardown paths.

If the station retries the setup, the same slot is cleared and its
embedded list node reinitialized while it is still linked, corrupting
dev->twt_list and potentially preventing a scheduling walk from
terminating. If the station disassociates instead, teardown skips the
flow and station storage can be freed while the node remains linked. A
later scheduling or debugfs twt_stats walk can then dereference the
freed flow, resulting in a use-after-free.

Unlink the flow with list_del_init() on the MCU ADD failure path. This
restores the list to its pre-request state and leaves the node safe for a
retry. Mask and agreement accounting remain untouched because none of
it was committed before the failure.

Fixes: 3782b69d03e7 ("mt76: mt7915: introduce mt7915_mac_add_twt_setup routine")
Assisted-by: Codex:gpt-5.6-sol
Assisted-by: Kimi:K3
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 334c19ab2b22..1ad54a5bb374 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2345,8 +2345,10 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 	}
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
-	if (mt7915_mcu_twt_agrt_update(dev, msta->vif, flow, MCU_TWT_AGRT_ADD))
+	if (mt7915_mcu_twt_agrt_update(dev, msta->vif, flow, MCU_TWT_AGRT_ADD)) {
+		list_del_init(&flow->list);
 		goto unlock;
+	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-- 
2.50.1 (Apple Git-155)


