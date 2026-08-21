Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F75C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwKd+TdvIX9ZItYpiwc95hBpIK2+IZI68PvC5hF8oBU=; b=sYaaJ7bifzgGw72y27lQA9oCqe
	MMiovTRt7jVcHfxdP1OlgRWgZZBuXUj7KVDvcgKGuMQK9muDL0i6OWW009RfRODtRf1GwIeA04CLN
	VoZMQA9AnjlO0IciK/RyFrfvXQBM8ASnbve0XVGx290gf0rpBy23V9ttfw0HQ67knlUkLvMGfxn+D
	bun7hsEr4/RzRaa0duaP3ddHCIJJJzkcU1kVt/jtTb4+Y1HWQpeGILvfHyVi59mh/2agETNZd+ptb
	vjFk1XReS+b04Q4NiT2Qx2l35W4+vFuYegv7/w5VQqmjcWuAdkHqc7WlCtPRyq7NQEGIrgPJdvxr0
	bgSuWD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQz-0000000DKpf-2Rel;
	Fri, 21 Aug 2026 12:33:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOQt-0000000DKna-3uC7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:33:16 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cf27856f9cso9422985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315595; x=1787920395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwKd+TdvIX9ZItYpiwc95hBpIK2+IZI68PvC5hF8oBU=;
        b=qL9OeQXLDb4sAwmE4bwnDH0aJYJmkTt5TAHpKc3eK4wYYFAn17Pi8+8xz6rVHK9VVy
         gBE4QiEaqfRbCOJLUPLRpW8KcBnantFwqkB8hFbuRxT9jQV4WWkKWAt9PkxVWQbF/FGB
         KSNHtVLUUXD/DYFFDFA05qKtmdRtU9qMT/ha7NiItwpmC9fHgiRcETykQP3ToCQfyag4
         JSsdb839k9ah5Ee/WWaky8N0Sv2mdoFga44GWnlXQuH8GogO3DyG4AAeBuFUGWxPiHNW
         5kWco6SVizyWfifQClOVsA6sjR5ZGrwp2WhnWROi2voCdLIjeI2LU/ErAuj4H9JMhdet
         dt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315595; x=1787920395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vwKd+TdvIX9ZItYpiwc95hBpIK2+IZI68PvC5hF8oBU=;
        b=YpBA4zImzPOfYSYmekZnl3PjrW0Dk+3uc8GQOAMNnnG32Vjsfr8i9zTIAwnKZM+IhM
         7zUBTAJh/vAvhpt5KxST9SHH/pSZlBofHyJjrJe6rrKGckvc1df86NMR5Rb+7sCg/dl1
         Uw9hBKj8OZd8SsexXAmGT9FjYdcjH5ARlJRrKTc8sjBTuMcP+zHThlBjsMq9HeWFJCLk
         d8D4yxz9BxZUO/M43oOqdTNgLkGQvxh1ageZPlIpfYHGEcE8zGX9oKKrKaZRI+ftGIcf
         GaHEwFzoRw8gLZCOW3LUwrToSe5nv/kZADiXW8yV6tu04WIFsMCW2n6GX1Wo3cFzKQsP
         xOIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6N95ed4p3ru8/6SYYpCRNpd5pb9OPPVoaTRK2n3VAUUrs21N/eF/WpB4dsQ0/U6ZNP2s7jjdD0ye4m3OKxgmJ@lists.infradead.org
X-Gm-Message-State: AFuF++n4Sw6KRAj9CIg3uoR6Cck5dRKXR1wcZ2Glw3FNFIn+vRuXnO60
	UM8Edet+tdiBrmMbNKnj18/7ytrMb9gMnTlt5PJqr4UGyX+pwUEnKOR1
X-Gm-Gg: AR+sD13DIsYH6WRB+jWipO9aQx+oFnqPZZg03reW75p45ZEag20Eu4tHm+H4iUwPdPM
	q6xqdBWIlqumSgUibdGs9vABjQdZrNrqLxhHPKxmP2sDFxr2q1RBKtAg0XQ2Z5mLW3cqu+h8eO+
	wRhEoS7yynof2YUlNrnGEcgdLN6cjeAUneI+loTv0AAVuSraLVkxqYckHxJxGDsG1ueu6MgHxIr
	OZv83ipUolnrApnRriOdOGfYmvNDbMgO5WKk/mqU5ZoBoOj6xRhUQXABJPF4JW3B0tZTSjs+HSb
	q/88WCRORyuxRrckTun+BpuJMY8x/1CB8kqja/O5nfAFoFkRFdYvFU8ghUxYwKZak9P5b96BzZN
	C0gLWsh+vVhVlL/9fUFRMMCM59+cFCyVLVF21u+Gfa5xe9tVndNLm2BrDL+75oK0C7SpNbzPVUA
	DBx6bfP/FiBQQCsmAWTC7YAhubtDay2M9/xiTJgcv/0RPhjjbsZTwrtlAAbkUEeHVKIESnzKEaG
	x2fn1zGqONKHu3QujgGCkrg8GdK747OoNb8aki64qLWWBzRidhgkTmbKOlsmemzjY3Kpqy/1vmJ
	c6yqeLEm3PyRVoI=
X-Received: by 2002:a17:903:3c6c:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d64adc5f3emr120824505ad.5.1787315594849;
        Fri, 21 Aug 2026 05:33:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1d8sm18402285ad.52.2026.08.21.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:33:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net v4 2/3] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Fri, 21 Aug 2026 19:32:48 +0700
Message-ID: <20260821123249.41527-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123249.41527-1-phucduc.bui@gmail.com>
References: <20260821123249.41527-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053315_973622_5DCC1D85 
X-CRM114-Status: GOOD (  14.79  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

lp->eth_irq is assigned from platform_get_irq_optional(), which returns
a non-zero interrupt number on success or a negative error number on
failure. Errors other than -ENXIO are handled before this check,
so -ENXIO is the only error value that can reach this point.

Check for a negative value instead of treating 0 as an undefined IRQ.

Fixes: 522856cefaf0 ("net: axienet: Add optional support for Ethernet core interrupt")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 207aecb5f8b9..3927ababf833 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3052,7 +3052,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0


