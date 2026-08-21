Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FFC5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 05:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p4zubKJfP4d5jonGYtKrpPAyp+ZFeoBJ9/vh3Z7kgRY=; b=bLGCyG/YSAlV+ivAuIeXFs0rFG
	DA+fPjzaPH9w/drUe5iqwSDuyATRnCH9wRXfDG7e2h/mjCpxvYkw5edRYJliFOwqBDwlgxeTyMWJE
	+KsAHwQ2eWDb4+XiwGoWfOG/LhG4s4Q/LOw4IZUEzfFtZZ7+XQ8AbZgB2QHxArgh4PuLzc0JRBnHg
	nHEYYVYnHboRawOooHQVeEVcmSg/7cw0a58/mAQlTAiUzFPMXr6GztELfzVS6VRNzn13zGBUIpbvW
	CTuqP0oBdQyaP0Ov5SXFfXa24I9wIfOHr1kmrM6N0Pyr7l9vyZ8PruA7iZ1wMnQQIbtTcey8GXACB
	syMROujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIGD-0000000CaH9-3zwh;
	Fri, 21 Aug 2026 05:57:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxIGC-0000000CaGU-0475
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 05:57:49 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e041ea211so584031a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 22:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787291867; x=1787896667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4zubKJfP4d5jonGYtKrpPAyp+ZFeoBJ9/vh3Z7kgRY=;
        b=Y2muQlJnuPhVJ745qAF93dcE9Ab9tS62vgN0Oo+eg/hQxPZKVxYhRW2457LwYK2NWS
         2ZRHPNXrhyAzjk4FMCRb4hZdv9Ea5002o3x41EhtNLCxxUsVfqZkIWSZBvBNXk5mDBI5
         3iZroVWySC1AzvvUvCPmlvx9kt64/UEbUls88J+OgOUM1UaV/GZY+jOr/sV66AVj5BhI
         Rv4jNKiSlM2ykm6RuC8EVVz7n5bPD0A/swjb1u+aUJGqxckj//eSML8tj2iDycPgUZoi
         cr2LPfJQ5oB8EfYJjAflEDuKhtIaAXW3sdHuKcW1xZ+XFoQRkcfX+LaQP026wGxCDVVT
         ai7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787291867; x=1787896667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4zubKJfP4d5jonGYtKrpPAyp+ZFeoBJ9/vh3Z7kgRY=;
        b=P2C9XieCIA4oJiMCQcOUcRx4LDuhPs7a0/wc6LJ36J8P1sZgC3emlby1PmJjEzDtAB
         T5acG6FmyRDp89pT+weMD3/4jQuKqeOyvCjNJ0pXiPBQdq8OeSZtQ1SgygB9THOEQzNh
         /elnaxzrf6DxyGlVmMGJOc3KrxjtMYcc6CZrmN7xxUB2OvFyGv9agJjv7S7zyQkmFCR7
         kTiTskiNox/z4xceO7BtapCic33S9/Jf7ZujQIaj2khB457W3WbnfJjdiHltTry7HhHl
         diL21NeAGPHGgvEnUH8FPDLO90N9ffQaHs/u1gg9IeS8FI+DFFH8s2VTj3UV0nmhZNN/
         aV9w==
X-Forwarded-Encrypted: i=1; AHgh+Rriqs49rPt+LAXmtXwGTI8MwLPYKatFMbrPaBs0RVHw8k/D8LQYIFlPaOuRi2ONWYiWGTUDjVWshUTksCm8gWW9@lists.infradead.org
X-Gm-Message-State: AFuF++kUymxwLECbP2Hc3we5r9YCmz583J6kIE2ifDhqDh/dY4A+iOBg
	m6J0OQ1AtatPEOfmQ5QEbTtvgJMb94xjCF3Rz3TwYeN+HDWUUpiwmjKg
X-Gm-Gg: AR+sD11KpL9GYIAiyr0PF1w6T+IaSHE3cuN38vHvAgiETsRRFy5tnHBBCVw3QpMiFfT
	6K6AsyfN1mBoK5lyAq2bCBvFJCux53jC8Nv5f9Q/HfQjgdDsp0i55LP5kJNAhRi5BYv+gj/dXMV
	AEceIovkr/YjFG3CIECaAkgqjoxYjIepn0+2mFm5o6Sm+XB7MLx1cZ2y479YktbAd3BaAATNK8R
	MBKKpvHcjjHEEIQ91GZjoBWdYIDxfPJnSHEdqo8uMj1Ofpb9OUy3AmmPS/xGcwgbRAO/s4xyMLt
	Xn0xqcpenQFQHCsC4um3bGpPYp1Mj5MfHyTEuHMmT/5NuvGUuheN7sK29ZEZTF6njCxSdyoPXEG
	AckW0yXM/5MWqI9pwCE1Li33hc3htXcokhXmb8ytwsrEbM3H584LXqKEnWwiCL1I+vehlens9UH
	TM+Gy2mPsoa8hbIwbDu4fjLrYkV9ySL3KdpnTjC6iMJDGqbngDcu/IPJzWhmyCzMec/UAvY+Fqv
	fAhQpeaCbR5XbIzEUVsXRw7A4eyzMeYIjpjAUm1Q62+4No=
X-Received: by 2002:a17:90b:6cb:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-395c2f13243mr8189537a91.0.1787291867058;
        Thu, 20 Aug 2026 22:57:47 -0700 (PDT)
Received: from DESKTOP-8BCFI4I ([202.12.123.126])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3dd15sm20391581c88.2.2026.08.20.22.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:57:46 -0700 (PDT)
From: Md Rabbani <rabbanyhmm@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Md Rabbani <rabbanyhmm@gmail.com>
Subject: [PATCH] net: stmmac: fix device node reference leaks in stmmac_mtl_setup()
Date: Fri, 21 Aug 2026 11:57:18 +0600
Message-ID: <20260821055718.57-1-rabbanyhmm@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_225748_239983_587C33AD 
X-CRM114-Status: GOOD (  13.07  )
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

In stmmac_mtl_setup(), q_node is shared across the RX and TX queue
parsing loops. When the RX queue loop breaks early because the number
of parsed queues reaches plat->rx_queues_to_use, q_node retains an
acquired reference count. If the error check passes
(queue == plat->rx_queues_to_use), execution proceeds directly to the
TX queue loop, where of_get_next_child() immediately overwrites q_node
with the first TX child, permanently leaking the retained RX child
device node reference.

Switch both loops to for_each_child_of_node_scoped() so child node
references are automatically dropped upon loop exit or early break,
and remove the now-unnecessary function-scoped q_node variable and
its manual of_node_put() at the exit label.

Signed-off-by: Md Rabbani <rabbanyhmm@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index dc5f951a31..6128ed1bd5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -130,7 +130,6 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 static int stmmac_mtl_setup(struct platform_device *pdev,
 			    struct plat_stmmacenet_data *plat)
 {
-	struct device_node *q_node;
 	struct device_node *rx_node;
 	struct device_node *tx_node;
 	u8 queue = 0;
@@ -169,7 +168,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 		plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
 
 	/* Processing individual RX queue config */
-	for_each_child_of_node(rx_node, q_node) {
+	for_each_child_of_node_scoped(rx_node, q_node) {
 		if (queue >= plat->rx_queues_to_use)
 			break;
 
@@ -227,7 +226,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	queue = 0;
 
 	/* Processing individual TX queue config */
-	for_each_child_of_node(tx_node, q_node) {
+	for_each_child_of_node_scoped(tx_node, q_node) {
 		if (queue >= plat->tx_queues_to_use)
 			break;
 
@@ -276,7 +275,6 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 out:
 	of_node_put(rx_node);
 	of_node_put(tx_node);
-	of_node_put(q_node);
 
 	return ret;
 }
-- 
2.55.0.windows.3


