Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF71FCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=; b=O9/xzJ0IvMUAqRB2h+B1a/wd9m
	JKm16IfKaT5fkAEEzztgEOl+FYxh4plzptnMOeLUjczWG+ywv0VLOrCQxgY9cRoScUulENHJ/irz5
	2fpEMJv0QNmiE49j9v/gnTRs0rWcpBHkHsfXHspQck75EnDkOwavcVUyTqh2u1ivznNO9VONd7LdQ
	3TkrkmnkM9cQtn19tmSk8s1mQI39CFaSs6zY/I1AfcVDim+7/+wXLHYj2HOTTGvyQebcMuI5sz7eu
	fH2tCFWZ+bBKUCOrMU5fj3fCC/+YQxArHwu1qn9FtNUGqfmRPuk+/JfD4ucZb0Pfc2MJXW8b9S6hb
	4t0thHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6w-00000000V1P-3LzH;
	Tue, 21 Oct 2025 19:33:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI6q-00000000Uxu-405f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:33:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4711b95226dso48735405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761075207; x=1761680007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=REuR8xuRA/chjGHgOj8SLGfOFftXwF1f4R7gdWwoXEGwlSc0AO/63DWMCeLf0TT82Z
         VQbhdujIvZHodk9UCH/La8Ph2s8f4daoRQpjuHWw/c8VtzaJOUTvn1ROfchePk3TgzqH
         nvtfjkl4sqKJ+1vQMQyeRv+w3P7Ab4tl0NWyUStG0siwi9j0iozp3aHOhDZRhm93Koyg
         OKEYpoJdw/aSbN3rUEAtX+F5Q4Y3NckJ/JJGyht7UNMIp23cMQKeEGqPq+I4vqtIVJnC
         CJ71JOJEqS3v61EG0763C7JwbHC6bSvz8fukcw/cjMkdlK00xbd4DZkI1pd9ljZLtZdX
         g2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761075207; x=1761680007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFUK3/M2/OMRE/7w/JqieZkjZV+2HO5R7PJSBTyxlH0=;
        b=fDbRVYCDHmZfYt3+UfC6Ox5wkxQqlEpNkgGor8kaP290PB17zhb0saAAn5C7I2/2/W
         rN4rdoIruEPvbclieE/b387Wh55haNuFenpXMCl6fJuYNCKf4vi7CYGrJ8MyUCl0lCZb
         hBtho8Jv3bLU2RzWMI818JYCpTCIyylpF3VVXDVMkZfH6+x5tmbkdR341m4RebdXvyPI
         sQ2+QVa95meGpSSP1ARk7/PdfX18DiqeOKi8aX51oK74TqyzQjxFyLgjQC/uQQtG4ixs
         8HskbQkIZPlqGMj7wikvV2TAbnf7rXzdPqFYhdtQv/p1nWCDDVvpgyXxjvFIRpoyWuYB
         UgWw==
X-Forwarded-Encrypted: i=1; AJvYcCX7JN94FO/mgk1XmjpGEP7adszpL3xiqZHBDoWRC4tReQRG33G0rKyy74iOExQoPend0/ooRySCacZQ+9OGneaI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4W6T0QhQPYxG/Vdl/T1cObN1wICD7rw2DL4nCAbg3qM3jTBvU
	tdyTuxtiWGis8qo/vASMjdWhJ4KA8MyUyBsctYLlnvwu+GE0gQDNc6qB
X-Gm-Gg: ASbGncv8phk0VoCqspooygqcDueGe0Ic9LgoWRiKLYUMU/29LfEv6qCAhxVRQmTW6ur
	dWu3j63OmIdZJksp6aKOpZgP1iH4+iTJ7YAnVI0wdn8S0dltKZdHK9bwEEe+/6XNhC7D+HkmhS+
	h5DlQOVbwmgxusrZP2/5zsbwOJrpNCXHzFgcUs+S4wIJ4n+McEQ/lyDVDf7e6Iv8gf2LEXQ+YB3
	LBlx2COauK2NR4mcoE5cS4tXX8ZuvnDzmMnnXG870er+EvP6ya77qIfgYpkuakWzrtohJLkW7aj
	GBHuKG401DQk5tL4ZHJkJcL4Gi+msPH+ShQTYdJhMCTTM5YyW+7Z7NOm1rk416InG6hj3lc69fK
	nn79cZN8/BKrBodfQ3KdCH6kc83hwT0bnhg6G5Hsev14bWrAhMBNXBz7tCgR0kcSYfWRQ4Mrer1
	+cEQ02qnbVP+jdLL20VyVUvhZ+PxaXDf1S
X-Google-Smtp-Source: AGHT+IH2bGg1MypnCbkNL1KvMQcoGo9pVkFOJRpGUB8Vak6PvFEbE3s2pNvi9PmCY/UqdtGimE4Phg==
X-Received: by 2002:a05:600c:3f08:b0:470:ffd1:782d with SMTP id 5b1f17b1804b1-47117876a19mr152001025e9.6.1761075206980;
        Tue, 21 Oct 2025 12:33:26 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm21327187f8f.36.2025.10.21.12.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:33:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 1/2] net: airoha: use device_set_node helper to setup GDM node
Date: Tue, 21 Oct 2025 21:33:11 +0200
Message-ID: <20251021193315.2192359-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021193315.2192359-1-ansuelsmth@gmail.com>
References: <20251021193315.2192359-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_123329_017957_19E92651 
X-CRM114-Status: GOOD (  13.47  )
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

Use device_set_node helper to setup GDM node instead of manually setting
the dev.of_node to also fill the fwnode entry.

This is to address some API that use fwnode instead of of_node (for
example phylink_create)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8483ea02603e..ce6d13b10e27 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2904,7 +2904,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 			   NETIF_F_HW_TC;
 	dev->features |= dev->hw_features;
 	dev->vlan_features = dev->hw_features;
-	dev->dev.of_node = np;
+	device_set_node(&dev->dev, of_fwnode_handle(np));
 	dev->irq = qdma->irq_banks[0].irq;
 	SET_NETDEV_DEV(dev, eth->dev);
 
-- 
2.51.0


