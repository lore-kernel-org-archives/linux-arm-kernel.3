Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C354CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAEQuq4z5dW0AnrothciojC8/CjIG+BXfxwJ5kTAGpw=; b=lDRuzpK6yQKIfTxOL1FzIousxx
	ITsmeq8rHq+E/asxNxmAlxupSA7LJtMSPczgGXZIKfY/N9SCr/V6dqYHgASM8iit51R43sRL9hbYr
	nV8HIMhNeG5jrtFqZrmCpUEU45yRPqQoEq/W+f0ICtC0yFYviDXY+KpETOs3LKnVGKMOMfB8py67Y
	seasiEjAWvHrjpRxRIJWCrEbUhDOlzt3Lg8kppw+jficLBEf8Xfg8KszXu+/uwaD2Zl5dqQd02P0H
	lD8SLQfPOflSFDNasWTc4oai6YPs6qlDah/4dLuS8yplwtStQTg+a3jnzCrQ89nOUhiB/JL/IFQmU
	0XVil43Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDS-0000000Bpi2-1JpR;
	Sat, 13 Jun 2026 00:27:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDP-0000000BpgS-29mx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:27:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so949216a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781310430; x=1781915230; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAEQuq4z5dW0AnrothciojC8/CjIG+BXfxwJ5kTAGpw=;
        b=cHUWA9YjLn6pvu6Kau+aAVmY9d16ofK54tFvPlMKwstaYyUoECaQCTOV+qNLPDq40h
         74+F1nNtVRh1G7mRNTNqEUzajC7sxO8nX4nOS/KX9y0QmjAh0Gg6d2ZCiQ4NYSgdCkTx
         +gMBqkXr/FclE89xI5/o3OjkXZ52lrvct/8RFqAv9AblAKL008L52EWLSDhG1vUH45FE
         M1Tus7SsBrd6AE0e9JE+k1MLnzuyouKw3Gf7YhkW/kOzWZimkYagvfgXu0LxXovHPq+u
         pHs21W3eXotdNKwl+QAkUffTA2wpxSjDOC609Z9NeSMe1yNYlk26Ubg4AhHF89t9ooN2
         E9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310430; x=1781915230;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAEQuq4z5dW0AnrothciojC8/CjIG+BXfxwJ5kTAGpw=;
        b=q/XdXXXpyvPXCI0d4OmaQ2qMix3umo2R5XIqaI2pAhRKoaZB4HEaOFxohQFkzw68+n
         DFHq0mzQ+Ct7vaeDFWyOJr8X9zh45K+yXxjkkrB4jq4ez9S8neY7vYxDBiDXkqLcieQQ
         3FD41Er15sGA3BTjjBJgtjmVQHya/uZFN6XxIap16dBQO0tgwgq9hbq0en+/xpDGSN5J
         hr0MBG4RuEd9fNTCFaeW3yKIterIgeDJyGkuyISLIhp7sV6H87XTRV5ICUeLBD2q+sTP
         9GF3Is+ZFkyyzmhJMe89DfPK1i8ReZ6C0ca+fLs61Zq6Yspm7ZCG2sR/wK4U5ey8glUg
         YxzA==
X-Forwarded-Encrypted: i=1; AFNElJ8JkG0hA4pbLr/+kh1Ta1fCrqA2hi+4CYI+DtyctjnHngTZDxls+IRRq4I2UMtexg55xTYWaNK8MXACxLFnVqPR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz77PZZU/aeGqY9XQzyuboeK/k2gxbsjvkQd9V44f18stbZ3SMt
	1OIC6OsBjPx3L8Q1PDyy2KEZnxKcjNevGW8uhPNYgZkkWKHEFHc5k3gp
X-Gm-Gg: Acq92OHc0n8yq59n5wnqxoS3Exgg1k7Zp6nQNBcNccaCUBc+Esrjd8aNoewdJVMTpNQ
	CI6ngSEZqQUgCbIpngYuv1K67Kzbd96HHPf9P3e2kEcaHABrGO5A8G7HnFGsxLDyQkv4lps+HDS
	DHOlBxPx58589nkP+Hh6tSYubZhs6ZJwOOE/9B1dI8J8NIkz1lzGT4Q7aKZNNVP4V9p1HzlmSOB
	+XRk/t96AdqDqaMaLSCOKPt15iYHts+c6KLpn8+dsGno30uQYDOSC1NFjIoEJDMAbB6913oXX1M
	mKHDUUxLXru9cNglVrIe+heRPy/LCuryRxMieEO97RHEy0Qcgn2X+KLhy3PaxedWw0iqda1DKtH
	CDDt3fsTMgJpJjr84WL9w/cUersOgT/7SW07OlACzVH2qUtOb6xooc6U4IWRPk91CVYCCllZ+MP
	YI+IXWy6vxJEVNx/ykkMpz11j8bos=
X-Received: by 2002:a17:90b:1b04:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-379ff644660mr5554949a91.0.1781310430554;
        Fri, 12 Jun 2026 17:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8ea7sm3441412a91.1.2026.06.12.17.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:27:10 -0700 (PDT)
Message-ID: <6a2ca3de.ad59c0a6.147df9.2ac1@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sat, 13 Jun 2026 08:23:12 +0800
Subject: [PATCH] net: airoha: Fix always-true condition in PPE1 queue
 reservation loop
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172711_563884_06C25139 
X-CRM114-Status: GOOD (  11.26  )
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

In airoha_fe_pse_ports_init(), the inner condition for PPE1 queue
reservation is identical to the for-loop bound, making it always true
and the else branch dead code:

  for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
      if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])  /* always true */
          set RSV_PAGES;
      else
          set 0;  /* unreachable */
  }

The intended behavior is to reserve pages only for the first half of
the queues, matching the PPE2 implementation on line 334 which
correctly uses the /2 divisor. Fix the PPE1 condition accordingly.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11..999f517 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -311,7 +311,7 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 					 PSE_QUEUE_RSV_PAGES);
 	/* PPE1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
-		if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])
+		if (q < pse_port_num_queues[FE_PSE_PORT_PPE1] / 2)
 			airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_PPE1, q,
 						 PSE_QUEUE_RSV_PAGES);
 		else
-- 
2.51.0



