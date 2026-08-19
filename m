Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B081C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKdPBJAuwbKNHRSj/o9wx9GTRe/KKjDR+X94RAURNcg=; b=z5ZhYjIa71/RojapE4bqIDwcn6
	e0wAYP7+XQAEs7VvcVks0mb5bb+Wk4ISmw0w9rEXDI/L1PHqBihZSMZHcJ9PHAXBKhwIgZLFpD9tw
	tgJKYVUpM28qmvzTfRP08I/04B5jFZd7cHC/DXmsMTsXFyFsM1yfkf1+tEgmiJhZGrhseXJn794yA
	e7GW0I353n/rF+Uea4GmYz9glETeC7TprBe4xuNY9rV7fBsKgECBTkFE+unjF+w0XaHYZgi8901fc
	HmjbtwnecrgKzahVjxSjK4kIRfEWk3UXaudY4eK1oljE+v2OGemjPq1Rp2FdMR0pptxqHuNNrS2KA
	t8CHIbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwioF-0000000A94E-0aIH;
	Wed, 19 Aug 2026 16:06:35 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwinO-0000000A8w9-0tG2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:06:28 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2cabfb70501so3289105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787155541; x=1787760341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKdPBJAuwbKNHRSj/o9wx9GTRe/KKjDR+X94RAURNcg=;
        b=TzJZ0sE9prbi8IMyK5pAYyh+eApeISnzEf4vQQ5nFLqkcUu7hH/R/2Iqvqv6d3Ge1g
         uOIpeG2J8GLhTGnyrBRRH8aHUJO70TqbvDrwIKvsWHIORlgC2F3niSpzOfl6U0dQb9vq
         PwzlC8gvZ4UZLB/k7Flwax3cgy/74U+SFpneOIGNUHTxaBer8PCGz7xASEPnG2IF/q6Q
         08WfQKyRe1YsGPwr2kK14fsZcB5GFo2XaeLjSjXuIpYZwbwAhPWHDAomnsK3Bupw7FJk
         /emPb+SRV+JDoic4glFr5EcJo3IjsIz9Z0MhKiI2o2VQd/ZM8gKqDSYFV/9juZj6dVdO
         cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155541; x=1787760341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKdPBJAuwbKNHRSj/o9wx9GTRe/KKjDR+X94RAURNcg=;
        b=HfUN/co0xc6umLT87oWlTG5zeDGm1eOmmEECXeNMojJGrB2eML4gJvsjjpoZNoFOCb
         80qUSAExjn7G7jJwnruPJX0qP941ffWuZgg3kdgs/4BqAcPYO1CW0c2lCNVwijsaC1eI
         mfg1HrfrEab5YBapQ2Sh/iRRaFH2SshxGgC5edFoWZmTofsgtZO7hkJsa/rtmlmgDaFw
         FlEg5q4/E1eBM5n019lRqkPNIoryITrGGH8UzNF6eAUM2r1ORsR5LszSVIRf6j30Ipu6
         oIUr8LzOp5bueLgWVV9CPcnm4Ej7aBhn6MUnK8Aj+M44+YWVxlxcCJ0pCdXIpFDGbCgs
         ueOA==
X-Forwarded-Encrypted: i=1; AHgh+RpoMrzhWNDxfE3O7DNphu/uBkCOjiTdDD7nehdgb0ZC2zlAtM8Br0OWCnH4GqrblseTQr3d8DLa1VCmUDPasF2P@lists.infradead.org
X-Gm-Message-State: AFuF++mntnHKBCeLDfn6jmknezSc9h7hfFtc0uaP2WxKDWyaE7XH7dXc
	5ivRvsHpjGsMSUWmkS7PaNFmJCuAOWtIu/e1GmrleLdcQUH8imNiGLtY
X-Gm-Gg: AR+sD13fJLW50MBqYv9EV/0jF5TIcmcIDO3r2gRk2uaCz3ddRyEBJqan4eHGtHu/qEv
	17YSSe7R5zBJvBkZHZBfz8zxHBt/4Kn9SLzh8hbfeh9yxIHNgLNIW3kzO19Jy2lLzc3qn+FRryV
	ZKetuo6ydha301xY49UPzBviGVoYsTINU7tAQmSjGZBo/FfOGfhSBLPIPDbUmB6Ofmj91a3FKDF
	wgYOj15Su1HBP8Z78de7yO/7QxpHnACTsiLxFIwM9f9fiUz4AdOyncsKnkCs3hv4sUrkcibqyo+
	E36m0TP2mf8q1xVzm4OzvCiJ0EdColeTFicCfqIdMLaYnTxy2S2AfwqcO0TRr7B866nyL1kPx52
	4XGtaStJDqPEr2z0lawDFRypMKFCCxNb5NCVMpu9tKNBgm50kVvYgUCiSHdn8xCJOppdFrzqqH2
	n2qHfINqn4RCBcWUnYa4ntwtTIVnCsZkDO0KaRkzUizTS45WHTkgQckZ5wPAwfH7mw
X-Received: by 2002:a17:90b:3fc4:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3958110c755mr10914058a91.12.1787155541199;
        Wed, 19 Aug 2026 09:05:41 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb17eb5sm3740911a91.3.2026.08.19.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:05:40 -0700 (PDT)
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
	guoren@kernel.org,
	dtatulea@nvidia.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-csky@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame handling
Date: Wed, 19 Aug 2026 09:05:35 -0700
Message-ID: <20260819160535.1472459-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819160535.1472459-1-sdf@fomichev.me>
References: <20260819160535.1472459-1-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_090542_258982_B4ED603D 
X-CRM114-Status: GOOD (  11.48  )
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

stmmac drops AF_XDP zero-copy frames that exceed taprio's queueMaxSDU
after xsk_tx_peek_desc() has reserved their completion entries.

Completing a rejected descriptor is unsafe because AF_XDP completions are
ordered: xsk_tx_completed(pool, 1) would complete the oldest outstanding
descriptor, which may still be owned by hardware. Instead, leave the
completion pending so the ring eventually wedges and increment the drop
counter to expose the application error without risking hardware
misbehavior.

Document this intentional ring imbalance at the check.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 62de03e65a90..6a532747c039 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2713,6 +2713,10 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		if (priv->est && priv->est->enable &&
 		    priv->est->max_sdu[queue] &&
 		    xdp_desc.len > priv->est->max_sdu[queue]) {
+			/* Completions are ordered, so this descriptor cannot
+			 * be completed safely. Wedge the ring to expose the
+			 * application error instead.
+			 */
 			priv->xstats.max_sdu_txq_drop[queue]++;
 			continue;
 		}
-- 
2.53.0-Meta


