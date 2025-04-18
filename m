Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C334C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 11:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W//o/Ys/rBW7MLdSpGEG/ep49Nq5wGldQX5Bh4Q01DA=; b=De1cwR+VCH051LKYzed+XArNPH
	rkVN7qBjvkHvOHVRtapS/LmTA9nmU603cnpK5pAAPyDq3657Y6kfPeTTKGbgRaXAM7q8OfSG+ySQ4
	nY0ESDuFgbJCxdD8mxkNbf3zQpzx30lalgQuZo9UGzphdaQYO7+huSakJiRAWzQQTTxb9w/kJaeuq
	jxIWNXXb7HSyBqNm82MlmNx2AlFPzeazMGcwla/PXAziwoSBNFxd4u21ReZm06H5piirHQ2SuaCge
	04GMkCIwfqLdlsrBxTPhUDjKoXDvRqhnbbh/3TKu1fRhWFDZLPa14sGU5Nyk0X3Q7+yTDIDE4Bp3n
	x91tDWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jrv-0000000FyI4-3gVV;
	Fri, 18 Apr 2025 11:26:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5jq4-0000000Fy2b-05Uc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 11:24:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso15058865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 04:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975494; x=1745580294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W//o/Ys/rBW7MLdSpGEG/ep49Nq5wGldQX5Bh4Q01DA=;
        b=UkAatOfXRWoBvxJhKVBl47gFxFbuS/tFiWI3PEfRQ5YsRoiUKRpO7n+t9gpW7M0q52
         gASIvxDRbXkZMcuu60ZBeFXohxCUB40MtDGFOQHEts+lan23Mc8/olpiKPUY5huw1d4b
         YNy5g38By0HtbePFT0Vxw+1qert1vbB25Kv364VJJ1U3m32ik2pv9js0OwuxaMqDf91p
         zSDbqj6e3camVp7tmbtlUtO1TFudX9sQV7iMcRizs5hqFRNUIvsISMgDwjOt18hSYw8V
         Mw5183zYjYTC7FrFGwIOJ23tYNH5YdzILOa9PT+tTEbtitUFpdWcCXNG1WQZ/S+x2UW2
         EXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975494; x=1745580294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W//o/Ys/rBW7MLdSpGEG/ep49Nq5wGldQX5Bh4Q01DA=;
        b=EAPnWSogO7mY+ZtgQ9+mvUK0YHsCIRHeC5O9Ixcvu0R5LKAii4A29QFCq+fb5q1BH9
         TWtuc4Kga7Sni650g+ES6d7hba8DiaXgGHXqs+9m34XYEMi9Arpak0LDno/181vZJE7r
         d05mZxnDwge/N03+tuO+ckyH/ngEglH47cEgS6xtQhJ+aQCcLhOD6+OS4GmI7hs0BmoR
         OFK7ZvuDcZYcP7UNBXrqzBafX9fUszDtdA/jQkb72gxqw/4qm/pVOdd70OulEGnuJz33
         XP1Z0vXxg6cc0BlFgBJgJ2cQzMtINdxlwg9KNL1uFIBKS06QHMDAag7faf+otfqDET09
         orgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIPRMGAFT5X3Rnsi4YVpuLOZqa3IJvBLW3zmrC/tGb4onNEjB6ilGVImwn0JMg/kkzd0kxry+OIi9g8+EpvMTW@lists.infradead.org
X-Gm-Message-State: AOJu0YxeTGWYsA9GRhmPHjF1e6+eiDwzHY0u+t9URp0dvOufs4APZDTu
	y9hT/7Ld0K37sqBql+sLil5i9zjQcjifbRDvQSRxdcB0g2aWwxTv
X-Gm-Gg: ASbGncuO3qJcG6R07bbobReLf8vc+ymqPPJRCqf8TF9dvoko4s5SgY/DVkIHJTTZ5Ms
	IUiaD9DYsBY019njTCH8gLzt5zUOVtWlPFbG0f0AAGUazo1saj5GN4awlLfq1XQi/gAsS8jebe4
	X9E4HndlPMq15/CPW4GbmHdAvX0F9lu92TthHCWRz2S0kzEdP9DWgiai914iO3RYE0u6rfjrpci
	nXGdAH9/49uZlfEzlEwsgaoIRauyGtNh0FDi44gDLjH6A9bdAz5yRfQ2aeJJH6zpmhuV+IsigsK
	cAKcngIm/QuJmwqEhC+QKs1P63EgRgk9bV/3fnwbqg==
X-Google-Smtp-Source: AGHT+IG30iTqc/o70q9K2Hbdi1h5RZUfJobP4PRf5VUTOWgsiua+PVOrKWb3LlV6dsQiTSdoLK3P/g==
X-Received: by 2002:a05:600c:c0f:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-4406ab93badmr21238555e9.12.1744975493673;
        Fri, 18 Apr 2025 04:24:53 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5a9e0esm19272115e9.5.2025.04.18.04.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:24:53 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] net: axienet: Fix spelling mistake "archecture" -> "architecture"
Date: Fri, 18 Apr 2025 12:24:47 +0100
Message-ID: <20250418112447.533746-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_042456_064282_1BD26C41 
X-CRM114-Status: GOOD (  12.21  )
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

There is a spelling mistake in a dev_error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 054abf283ab3..1b7a653c1f4e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2980,7 +2980,7 @@ static int axienet_probe(struct platform_device *pdev)
 			}
 		}
 		if (!IS_ENABLED(CONFIG_64BIT) && lp->features & XAE_FEATURE_DMA_64BIT) {
-			dev_err(&pdev->dev, "64-bit addressable DMA is not compatible with 32-bit archecture\n");
+			dev_err(&pdev->dev, "64-bit addressable DMA is not compatible with 32-bit architecture\n");
 			ret = -EINVAL;
 			goto cleanup_clk;
 		}
-- 
2.49.0


