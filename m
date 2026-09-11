Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81066C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 21:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=; b=J7+igNF2FUcwkScDiiWNuPmPn2
	r5kJNYe3BweH+sLuerS+8H67PwOWZpH1hGSwYqV9y5GY+nmAfaOVNyw1ycDvJyP4O1Frfjf0Q/d63
	gwS6xoQHq4ZrJHG69oPvlpsNAuBPdFIHtdZN2I0OgqiQrnNzh8hQxqLr8jfRQTWonrI07btIcAaKg
	ASdwTqzz+Zsen8aumjsUyXN25XWnm8LaXnpehbTAsJ9IfLohKG6lDvxO/t9CFZx+o0b4sOW0XnRBJ
	pRn7U/7Esl0ABGhLWQ38cGd/ZtFU4mZgPsbdFlz5H6jYOUwiD7S/jfj7s/wTP+b8rrc+Jj59V3mbX
	eFRUFeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59HH-00000000DNU-132k;
	Fri, 11 Sep 2026 21:59:23 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59HE-00000000DN6-1zFd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 21:59:21 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-5309ce58730so572671cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789163959; x=1789768759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=;
        b=lun+TOHBSrnz7vYmZMt9uNtyjJEBfwA6+hBFWfrca6JRcRVRyQ5J5RXPfL2Xr9lbQO
         sE1gz9knD/JPxxi4i3WzsXaiMwbvqbYBUKSmowAb1mWzuWanlHwNjF8FpJM7rhu8l1qs
         7H3JpLwAUnp6jCJ6Zgurt1AJZQz0/txmCvW1zA9KsdYDBnaqyC2eQE8XGb5WPiOykono
         mFeXaqeG+lvp6QTioPyvML1MiCWtg9NqYBuot3PshU6QAgpf5kTXVPVuCgYuBEYOFi8q
         q5oBR9rJflfuYvNwlxdkd85rapbEwTEY6KDreohhVb7OQByUExJHjvmI2wEM0AqogWn3
         ZYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163959; x=1789768759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LPrONMbj0bwp/GdYN4yOukwx8bvXQe9ntAGUumY47s=;
        b=aJcbsFVbAla0NuRzKZX655ZCrY1NwwQc1kDL+Dz8VZKaJqmzRarKJk3ZXZb9qROF1Q
         ngRTP88o+y/+vRTFKTH2fg4GLh0SxHbOg5BRSofhfiVlfq/zRIYSeuXcYexBy2pYE73d
         xazrt8osE83tL66RGt3yi0lhaoslH7i7gpawV2CM0RVH8sYpzI6BUGBCH6B4jQFGYoj5
         ftbhKJwRHzyYLu6hJx9qU6uYmP+s1ZY0coavUYJuloNuqf1PFMnsrPKFhgww/a5iPD02
         EHDIBM1n33SxgSmDPiF76ujomY4W0+MGRiZ1S4xxHXLB0TEQtICYtj92lrOKUZ1jzBz0
         qYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLciM4w7uUaKOQkRSewHS3oLruxrN2lpwIiH3e07H8FGUKygvLBqI7O5ZcRsEbUS/TnpLAabksv4SP1gmR28/F@lists.infradead.org
X-Gm-Message-State: AFuF++myQTxLZE6X84yCKkpntDNFS5AUjP7JSP4L1g2gdMyV2k46cNQr
	EWaZKBbqFlAyIiqBbrYcPYeI9cXpOGyjJvbGep0YwsqeZ5g3HB/PF7K+
X-Gm-Gg: AYBFou2thog4y4OSlFR7cvFVbBKZ7a81YQdnzWkcAqJvCjezQ06iz7XDwUi5N4pcnRK
	u8aUai3zFcb+bvdshEPBYV8AsJ8gxRWEo24TnFlUfZyhOA5rFA+gdFrl5ZZOAYAxSwO6Qr3jcbo
	e4WnWMtt7I9ciUrk8SyuiizH/iU7tGRjRiaajGJuDsGqvOj5H0DgruJOWHGhsAmNra1fxmpUjA/
	je8aIesmNNm+cq+shsk2aEEGmJ5iI6557Z/HIekDSsbZwDoAmz4P1kQ1Cp8XbcfOB35akAwq3QZ
	rJLqRfyoSYFs/4w6l1kuej7VSnShj86uXYxL4cUHPzGTJkLG/EZus3boNXjJiZkX2EPDb9Yk8zb
	Rc+jQRvzUETjVwZF3i9S8ouJuunQxS6uqohAmF0eOz9dDjAR38e4GFt4ulmGMRY5ZrIwqF7Cdh7
	s8KXNWasj0ztK9qEW5d2OsNR+17UQcBgpS4y8HUmszpe7ugsZwD7Xj21z+3FbL8UGSiGGDCSqYA
	ef1qjTZExvoXLBWb3ZKnBMczn3wi88ZzMCWe/dGyX8SA9WMpnZbQRpP4lo91PFooQ3O6qivdeCj
	EdFOuixMhpt/vGbX91Vq85Z8obWS1LbahcUSCOJMosMwkvpYtw3U634Cleg=
X-Received: by 2002:a05:622a:4814:b0:52c:dde9:5cd5 with SMTP id d75a77b69052e-530e7edb01emr1223561cf.21.1789163959026;
        Fri, 11 Sep 2026 14:59:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530e64da059sm2568531cf.24.2026.09.11.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:59:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: make gen_bd init helpers static
Date: Fri, 11 Sep 2026 14:59:14 -0700
Message-ID: <20260911215914.175851-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_145920_521644_B3301979 
X-CRM114-Status: GOOD (  12.25  )
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

bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
the PSC wrapper functions in gen_bd.c, so make them static, drop
their now-unneeded exports, and remove the corresponding header
declarations.  The reset and release variants stay exported because
sound/soc/fsl/mpc5200_dma.c calls them from a separate module.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/gen_bd.c       | 6 ++----
 include/linux/fsl/bestcomm/gen_bd.h | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..b5093f7445cb 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
 /* Task support code                                                        */
 /* ======================================================================== */
 
-struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr, int maxbufsize)
 {
@@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
 
 int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk)
@@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
 EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
 
 
-extern struct bcom_task *
+static struct bcom_task *
 bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 			int initiator, int ipr)
 {
@@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
 
 	return tsk;
 }
-EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
 
 int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk)
diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
index aeb312a1cd00..7253d308d77a 100644
--- a/include/linux/fsl/bestcomm/gen_bd.h
+++ b/include/linux/fsl/bestcomm/gen_bd.h
@@ -16,10 +16,6 @@ struct bcom_gen_bd {
 };
 
 
-extern struct bcom_task *
-bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr, int maxbufsize);
-
 extern int
 bcom_gen_bd_rx_reset(struct bcom_task *tsk);
 
@@ -27,10 +23,6 @@ extern void
 bcom_gen_bd_rx_release(struct bcom_task *tsk);
 
 
-extern struct bcom_task *
-bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
-			int initiator, int ipr);
-
 extern int
 bcom_gen_bd_tx_reset(struct bcom_task *tsk);
 
-- 
2.55.0


