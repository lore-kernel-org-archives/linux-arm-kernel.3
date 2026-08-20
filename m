Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E5FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fozce2PiD8DgVzppXidr9Ihe7kZ4AQDOGf/RZkIXe4=; b=ZmmHykwvC2NQ726HZR3Vpe6IAs
	Y+qToHGNDynx+PGHNQG8AzLsrWVLu4TBrsiFqzlJsoGV96fLEdmm5z93miUwzmVZo1UYiUn/NAUYO
	LspeFumiZvToIgg5hsWcnSMlk3deTmJELERvn2EG7SJ8uTBsoGaB444PH7SayNdI3qajJIln75Muv
	0yFH10/OUn7SI6eo4BtvHLuAgOvoslkmJ3DQCdBVwu2YTkeNSeV1XEPJ9RVZwX6qYXVsFPnSEX4qf
	3YGhTenCmIDYaft2sPCRgVJhys1jxXhU8hPQVnHZAX+PglA1xTGZ6/3Rx1mei4nJrRamkukmZ5jj2
	9KQVhYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2PO-0000000BaqD-3nG3;
	Thu, 20 Aug 2026 13:02:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2PM-0000000Baps-1aOH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:02:13 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1905017f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1787230930; x=1787835730; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fozce2PiD8DgVzppXidr9Ihe7kZ4AQDOGf/RZkIXe4=;
        b=ct/I84rVBMU7pugMQfWdRNL4WQ0juvanuMspYH/zMqY9vWBA7pRAStrmkXcS70f9ZB
         B2AcfF8jRLeD0kJJNZrYWIZIjlc8gG1qGNhcarSGIqKV5CKOq5D1wCJ/aEojU3AfDpFy
         m48zFYX8KUHwAD9/HCBggccjNTXNcnZZMVCA9omP42AnRJAOfKb1cVtZwMc1f1BnMpLD
         Us1p7Wo52v4pw2S2GdIzrV4rt+SHr/eUZL+xnJiP0BDmdyneNV7YxHjoQE+EqbgTCExr
         63zP9clK7ILkc3e9xNwMeJQMLLax4IFCuVhLIKy+5zVEzUwVDen0H0wtKC1heW0nlDch
         FtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230930; x=1787835730;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8fozce2PiD8DgVzppXidr9Ihe7kZ4AQDOGf/RZkIXe4=;
        b=gXV884Vp+dIrS3zxse6Vc6eph44uQuCnpTVP0U7ttZ/nsoj6o3wpU3sGPN7YV0YxTx
         kqVnVh4t0Qb+VjnmKcjswijE9wgQs0tXVmZqR+DvzE4YLe55wChhlreBnObnGFlRL99d
         OgNO7c5Zfd2Zvv1mnehUZEzCcPAVx3wq0S+h+QUn1vRPEZvcLFA9aZjSPUIGwRWXfYyW
         FjlMPyQMSN3lf9aS7uOafcKqKzevW6fknOTvtOyDUmAoP0dnftt+CKtAsyabs7YRq7q1
         FtXfzwR2jASEjQru9NShDrklX030/j9wOr5XTNL/n+GnekzdGr7qhy2QD/AyIhqDDbkH
         wrYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0xHdtnCxiVAHN30XBZ3OXB51afcN6PEv0oifP6ZtB0r91BarDg4FsweltnnfMdOl8Ox6a8uceE+kq7FS3WKyx@lists.infradead.org
X-Gm-Message-State: AFuF++l2rQEUGHTw3T8CdBbXVHhKClYwhWVkY0xfblF8WiU9pTZ8/ufC
	KwvM8fEJj1LTrcvsZai+oXo11G5h6TGWvN3JYUkS3u/ZCWIhR6TqwLS38tNahW66bjE=
X-Gm-Gg: AR+sD12fUGU1JhFinq6Xv+dPLBO/xpe5JHGCapMuJAE3vuj6zePmXDjAIxuKNUBUy0G
	wLvRROXm9bXJggLsbUOs6VG4zo0zSbIOcxkOkc4bmJ/vWUETcvCcvWEzgyuMLO4wWoPbXhGsIsU
	II0X/Dh2R6dUJfPTEFgNIHtzUtE2O4wRxotcAXZAwo2pHGTvSlAO7AFngq1an2ag9VpgnD+j8UJ
	YzHv+KL4in5lAzo7JkZ3CN6+KhLyUBLVLM4vQXu9zLgyUOXr5C+jLx4lqz2Dc4SVP1u8jTIiaO8
	ZlomK0+tan+yi3NAlRzrBptpazef/KSNNgmL566mOQO8Unt5h0d8kAlCVTg9vTwk0Kg9iLhGlcl
	HC08boE5+jJ4BkVNlXxgo0u7uJBSpAc5/1rdc3B8nadXQ/HKZVCyZZXAPsRfOr8XfDvJYQlrtH2
	iC8cYylB0x6oRPq7IdtS5U/9lRHv8iGq9RQIrbyw724A6Y9puFr2RMI7B7vDfHX/wRmsASisGrV
	Xuns17fwJBQCkyRszXsejq3
X-Received: by 2002:a5d:5c83:0:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-482b1fd4d2amr23049090f8f.15.1787230930091;
        Thu, 20 Aug 2026 06:02:10 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145153fsm13106433f8f.12.2026.08.20.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:02:08 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: netdev@vger.kernel.org
Cc: wellslutw@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH] net: sunplus: fix tx_poll spin_lock missing irqsave in NAPI context
Date: Thu, 20 Aug 2026 15:01:59 +0200
Message-ID: <20260820130159.1584806-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_060212_427862_31FB82ED 
X-CRM114-Status: GOOD (  11.77  )
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

spl2sw_tx_poll() runs in NAPI (softirq) context and acquires
comm->tx_lock with plain spin_lock(). The hardirq handler
spl2sw_ethernet_interrupt() acquires the same lock, so a hardirq on
the same CPU while the NAPI poll holds the lock would deadlock with
IRQs disabled. Use spin_lock_irqsave/spin_unlock_irqrestore.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/net/ethernet/sunplus/spl2sw_int.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sunplus/spl2sw_int.c b/drivers/net/ethernet/sunplus/spl2sw_int.c
index a37c9a4c281f..7e07cd941434 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_int.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_int.c
@@ -147,7 +147,7 @@ int spl2sw_tx_poll(struct napi_struct *napi, int budget)
 	u32 cmd;
 	int i;
 
-	spin_lock(&comm->tx_lock);
+	spin_lock_irqsave(&comm->tx_lock, flags);
 
 	tx_done_pos = comm->tx_done_pos;
 	while (((tx_done_pos != comm->tx_pos) || (comm->tx_desc_full == 1)) && budget_left) {
@@ -196,7 +196,7 @@ int spl2sw_tx_poll(struct napi_struct *napi, int budget)
 				if (netif_queue_stopped(comm->ndev[i]))
 					netif_wake_queue(comm->ndev[i]);
 
-	spin_unlock(&comm->tx_lock);
+	spin_unlock_irqrestore(&comm->tx_lock, flags);
 
 	spin_lock_irqsave(&comm->int_mask_lock, flags);
 	mask = readl(comm->l2sw_reg_base + L2SW_SW_INT_MASK_0);
-- 
2.53.0


