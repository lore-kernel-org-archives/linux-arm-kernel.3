Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10161C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 03:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=; b=H7MHHEdRBS7JIu186HKN3Vssrs
	SQl503bYpqjf4jkEA7Xo4LwCOHbt/IPn1dnoNyQM/utwFYFwuV0K3PKpVCUdMFOIpu4G93RzAVMSn
	bBa0+7raz4K4HeJYpIjBQnl1MptSQ0lpIpPbUGnqWIj+9I7wpPKIxPjQg+uBlc3k3q968LJAu97UF
	TehtWZERq1EDeX30OFAAlodCiYoTs3pjMO65aBh829HmOKxWGXi6uNibyCl1Q5cqkzFXSjV8wEg01
	neenOTtTurnzHr5JpVfNJRez2NDp3IkaPDHDBZXzlpuK1Sacu9ZfyWP1X8oDEoz4ECp0iASYLFU8T
	Iq/gSB6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEg4a-0000000BE0D-1loo;
	Tue, 13 May 2025 03:12:52 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEg2T-0000000BDm3-2Qgk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 03:10:42 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so4823924a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747105841; x=1747710641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=UN1KPVICZ0nJ7SL6HC73hDZcJsJ3YCx+wAvnIrgQJcPnyZk4sDwXWL8z1of1jcitZu
         qEVBLp81DJxvynmUn6A0aQjut/7PCTjcaKDeg4CPklfDFebbxwgDtBShjhHb+erwaZUz
         E1emMMIXGkmgX0B0OzclTIubYVJXoX5baLynfk9o5CknEtkH0ptN7Y1/8lTQyKbZFCww
         q87NMhhviDurWZY8IwUkUP49liyZS+sqZcIG1Y2icesJRxjTBlo0abY8UGa5QwWdaSPb
         X3K1zm06PkOAAWZFFjcy9x4eYHsFRvPBS8HKtBRAIdxAd+Xc37WzQJZWG7VV0BVU6vgx
         eE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747105841; x=1747710641;
        h=content-transfer-encoding:mime-version:date:subject:cc:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcuJtm+iInMJ4xEpzdwpahbYr7IroCfNfGVeO9DKr0A=;
        b=uUfXfvqhf6Sz5zzgXS2LI/DvWZ61WqVd2H5VPm5NllJ9eNpkWWX21yKmTuYQx1q51P
         yXXQMkFESsBJPryqgaFwAt0Wf57lug7J9x5Obgblj2A+zcLE3Kt7q5ruqonBuvBYP14A
         Eaht8PFx+Mo+siEq/dQKhyfhkdYWxD/JHHm6OZnyMQnbEq4/9ZYQ9gCAQX26oIcjxYWZ
         SbGbnckUknw5B8yO5vQ/nIQnEFmt/qTWg8zGQqZACQM0gzT8v409llwdykSWriZVIIeJ
         2jiTpL6/ZjUu1mDvbFHBPWbWoVQKQJANW+WPZu6wf/MN4iqFWZXDW+oN5Fmv0gYSSkfd
         /16A==
X-Forwarded-Encrypted: i=1; AJvYcCVA1l1w7L+dlNC5/BW5TMjnJy90Yte+tvNIGxHbyqO+tgdT2GcUqK3iqVK4WecPYVa3lBa8XKYnFjSwzXemX8zB@lists.infradead.org
X-Gm-Message-State: AOJu0YzqA++zosY0jgw8F3tVkS4Eqqg4GYQWv1h5zoB/ha46Qyf6CQ3b
	Q/MeZ3cnEqza13A0vhft+Y9macLNd9IiZbBRYeksCTxXovTqrx5i
X-Gm-Gg: ASbGncsPb1uHhhyDo9e79jsvVTbu9O08+CXOa8MkkhreoCQ8MBi9JHR1Oxdc4OB7FRD
	j1H0UBd0KHh+cP45G23pHjsTs4c/DNsouDBxje1tn1Y3cg2n35xRI3xWXjtMHtOypqszuKhYWLV
	/oPugYSuByHnbhR3NRNyweoRT+ZXVDBgPP4mFG8MIdUbMIunZgxarqw9kAEFYMBaZg3nsUOuspk
	PiqsQsiTMpzgXgtgM4jPOG0Yc+JncblIa4Qjc5KW3pSA6dVgzjRy63bl5QUcf/iZ1tFQY7tg9zT
	LpIWOzCkNNPWkIzeFikOCiJeBPfUFGNBmaOwroeEVuc8uTOHewaUgF2bNLD4+tqCtPY+h4ck
X-Google-Smtp-Source: AGHT+IG1fT6TiYe3pTrZKUSJyBs6nE+x+ZjDtyWth+bx63s94p++vD/MoGUkW74HUXfleYGKFUeLcw==
X-Received: by 2002:a17:90b:240c:b0:2ff:556f:bf9 with SMTP id 98e67ed59e1d1-30e0daf825bmr1697698a91.4.1747105840515;
        Mon, 12 May 2025 20:10:40 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2453f50b67sm5082852a12.55.2025.05.12.20.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:10:40 -0700 (PDT)
Message-ID: <6822b830.050a0220.27a24d.d064@mx.google.com>
X-Google-Original-Message-ID: <20250513031010.267994-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Tue, 13 May 2025 11:10:09 +0800
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_201041_611655_33CA3709 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0


