Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84745CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Hfd7o4l5KeyggBUdRXVUs9FUkJAGIoK0YPViSvNbm4=; b=wpz8A54vTMOoP1HzEW1wbGybMs
	j0+luiWOHJZojZ+eSygN+0kmVNIMvskmeod49uAIvZffUIwcNTvDdG+/oTv88NnLlts2TaeUemGP/
	Q10LtnCMKc00CN5xk82r0sfu9zBTbEOWOtpxJyGmBtHM3GDg5Fn7cUExxJq/ahh9vDs4cQI7MYbgE
	1dcxIST88ebX87P443AJ8LqZwjtvefEpEOOBZEMKVVqTaGV/RWnIFRRfHgkWEnfjrMlyh4DlNVIZy
	k5bSP7RiVloZB3FA5R2pFNQPEq7XHGxO3qJwsWkIvLuFm0BNFjzPiRhJfOHidSQXEjSZ4mzRsdKUI
	LVaRMddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSSX-0000000FjA0-3z7f;
	Tue, 16 Jun 2026 12:00:02 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSSV-0000000Fj8j-3Gxk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:00:01 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso1967838a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611199; x=1782215999; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Hfd7o4l5KeyggBUdRXVUs9FUkJAGIoK0YPViSvNbm4=;
        b=UOd0CiNNATxLiHn4aWC/woQi1sQu3yJuK6XiSEHshHTN12vkRpcfywGvv4v+LB+JCq
         CkQ6h1I+uxtwzMMY48TpOCNOollSlCrs2TVigLamCvx8/zGh3wWWWjy5ZgJ4QQncbD8b
         ccxg4wYZ2Kb8emsRNi99AG/HGrsGqj3I/PbF9FUD6Rr0ou+QoqlE3h2zE1orA/TvrVWJ
         bFR+pAE0OOA+TQmukdzJna8DdJ7BB3SNjsCjV8UJbQBnBj7zrZFtfHl7mGcV2SoB+q/e
         IxDqmnLND0evXx6d3nW6BVtJJXGrMum7ruwKdMmhTX3PfGJ4l9M7r4bcWFrIdAWoeIF0
         cyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611199; x=1782215999;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hfd7o4l5KeyggBUdRXVUs9FUkJAGIoK0YPViSvNbm4=;
        b=rdMzgE54AeHwQ0RGVGyUogvAiFgH32zgZ25Jj2qO/mjWw37rAu74LRDfEOHsiscxZ9
         HZVgvpOp4F/uqyItCDRcJkXW0tnlSHKq8CkDOFono2KbGbLt+kUgMsXr3sdPk+6abT76
         d69MecbDb9Bso2cHNtcmWLv/FfGw6zrqIy5dGKTEJlwqVIplxiE3yRd242thMO3Tx0yt
         J8DeKqLBwc2p4whXmkBSYNUwwI0obZA89crBUDKBuoUYWjiPIyE7nLOLS1g3ueftuTxz
         goKGMaEYec6ztKPFRDN5Op+1XWJOzw82YQZXjs+anUQVkYl/AOiNaM1zkPgMz0CvIEhT
         zXTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kLTLx9G1hH/+BgEExoUoNGG9m/NZGmEjct2ZysUV3mpoXK3YAaACbsnOfcFNEV5H+xNTHFin/YIwQVccNROs2@lists.infradead.org
X-Gm-Message-State: AOJu0YwEV5bjSkMqKaMNriDgOR+fAmS/MaKGR+VA3TePbFiiED+3sLWV
	X7HZtoRo0IyAhi3X7lNZNSRIoQrU7vu93tO/b7W1swoS+2ULSG0+O0Hp
X-Gm-Gg: Acq92OFDeuc2dylY7A7JUg++cG3Kw9dP4aJwDXRGByKo8oSo9V12hvaUI+X6S8bNFih
	WbUlXy92HR3DBVQ7IhA3DXzbunM1r3JkfAbS/ToqyjM06/8yyYsYaVSOZosfsIpZgb4/IokPpnB
	z6anSRHFV4d0CDBnRFkGbILSpUcnchYseeWgQNGHwr+ph99PamCMV7j0VDWkYTGpB0ABZ8yFTK+
	zU1dSdkAud4MfV2XMmD+4XkQrYNTYxFnf0v7iHU+eZTqf++aimLtENXWSNN6LBGqMnuA59fFJ7X
	mz+X9F+uzRtk8z4rcsczUP2rVAYwLrgulC6/WCVc5ApBpkTnUsaIxd4I4A5T2X6w5p79umXzyms
	KQ5Wlc7B6xCZgyN1mL/O7UAhO9k7RJ7ZFz06eMtSeRBHQ/pclEkJ5+ilNmkUEhszswnG5OiAavX
	msPdiPdo/Uqx6hTljE
X-Received: by 2002:a17:903:1b6c:b0:2bf:13af:b077 with SMTP id d9443c01a7336-2c699b03448mr27431115ad.14.1781611198834;
        Tue, 16 Jun 2026 04:59:58 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm133468595ad.73.2026.06.16.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:59:58 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: fix foe_check_time allocation size
Date: Tue, 16 Jun 2026 19:52:36 +0800
Message-ID: <178161119471.2163752.14373384830691569758@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045959_893661_58E8D953 
X-CRM114-Status: UNSURE (   9.02  )
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

foe_check_time is declared as u16 pointer but was allocated with
only ppe_num_entries bytes instead of ppe_num_entries * sizeof(u16).

When airoha_ppe_foe_verify_entry() is called with hash >= ppe_num_entries/2,
it writes beyond the allocated buffer, causing heap buffer overflow and
potential kernel crash.

Fixes: 6d5b601d52a2 ("net: airoha: ppe: Dynamically allocate foe_check_time array in airoha_ppe struct")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6bcc..8fb8ecf909 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1578,7 +1578,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 			return -ENOMEM;
 	}
 
-	ppe->foe_check_time = devm_kzalloc(eth->dev, ppe_num_entries,
+	ppe->foe_check_time = devm_kzalloc(eth->dev,
+					   ppe_num_entries * sizeof(*ppe->foe_check_time),
 					   GFP_KERNEL);
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
-- 
2.51.0



