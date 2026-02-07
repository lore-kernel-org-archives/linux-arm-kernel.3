Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8D2EE0AEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Feb 2026 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGbAXMH3pEHrAeasqKpMCINB/rzrMFrYvbmEBtzsJ6g=; b=qg0+BjdYBcujPtYCaTUUcBf6MH
	urSMZ9cBfImVY+jC3y087AXsSw5inwzOLPbmFW3f4rhnn6K3nJwVpNc4gDuZpEtKgHsAe7I4xMWdL
	HHOyw1l8d5tJMdPHsvnN5ss5bvPOp0/8g6vlirwsskGZzn3dozQhAnBdmhkvJ9Xa1KteshbWNZwf5
	tDrIBCkeQJ1KvIOcOKkl/oQxWRxhB8J8Apzg0X+QZBrKOccgnp3sudsgv93YxtgHhtaYqi3iE33jR
	0JJkYHjvQeLAaZ6mILeBhf8TXfDv3SoalvvfCNOq3NdW/SdGDabOf+3+D9kB9/CO/HISths4+R3/g
	1VwR/p2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiCd-0000000CTDh-10Dl;
	Sat, 07 Feb 2026 13:18:23 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voiCa-0000000CTAY-2TUx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Feb 2026 13:18:21 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b81ebac5d6so3646705eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 05:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770470300; x=1771075100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGbAXMH3pEHrAeasqKpMCINB/rzrMFrYvbmEBtzsJ6g=;
        b=drid9XNe1ZiD786Ye4ljTwe6STEe+bJY+opy5cdue72u2B4zNX4ALPAw9BK52IFgQc
         Serxcdug+qdSMb9xMKXc4kL7+eqr1RDvqomswM4AVwIE595UeB1V88HIPHX8OdiU4zoO
         cuFTDm5oiVtWI8tDiYck7pfi2LtLtD4u4SsfeQf2aMScd8AkzlOtA9FMOpH7eFvKcAsd
         t8OntQ2xnCSbejc1w79qVATxOupCleRb0Q2cCXLVXzayI8lrUgLRdLACuZ64gAtuD08M
         prpgAu608frErNwLbtmeXYsVBdZ7R6D+hyEOoIsIEMasIMOIrJSTZfIiApoUCYuBENlo
         S3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770470300; x=1771075100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PGbAXMH3pEHrAeasqKpMCINB/rzrMFrYvbmEBtzsJ6g=;
        b=BvXPl3lbtQc+MNvIXv5q82Ebce/2Hibf6FANSi4VNc/x6y4/CJEvnZ8qTXNGv8xHh1
         +CbFuiJZ3ROyMOGVEpszGmKOTC82KivvROgaQPHZbHBTsokjrG4i2aobNgx2YuvgJs59
         BGgNVR/j4cN043Afabo6VH2LuGlsQlg4LAboMPdl13sWoe7ab/4eUyhoV2IeVjIE4fRx
         ggZ7YRPCjOfcPA0bxx/KKrXi3nWvG7pyU8oOREQWvkyrGo0YTzJCD5hi8oAiGRYpZhk1
         Litet6pLV+wKXoe/Pk5Ow3lEzDA+iK0Kj87aegLJTL0EfXi2oYOO2mgRegBWD0hvji9H
         iN+g==
X-Forwarded-Encrypted: i=1; AJvYcCV2qJzTZ5zjnxNBbP3VhjgogC4CL/Lx89l0TF2gZEgbrBo2M3PMRqtjBKDm8qUaMA53BN4+5vybJW39rgrytb8i@lists.infradead.org
X-Gm-Message-State: AOJu0YzHMpldPgBLch5RdVx4kqd/vM3AUgA3voyGpzkyxQJuq/mLWazh
	DYJEH14qDa/jbIB5W+76fHzS1CA6xhji/5i32rKo67Hr6Ol/LvYGh2nv
X-Gm-Gg: AZuq6aIydSf8fRopcEGYZPXYIIzcJR+3m8nZAFtYtL8cPobazhdrP29b6XixpCup4f8
	Lj0Sum3y0c1I2v2tm6xoXSNccmYHSvlq4ukO8bvUSuE+kMFTANXvWy4M/mBv9YTMR4D7EkH8z7S
	/M9WPERQXDCxNhLgCM3TWjPNCXVYWRC1ZZk+K0AJaP/MT4BnYSitKaIiem6KzKznVlJbhrlmX1F
	DNPs8Pbiey1rad0KQHFZOjpAaJPrRQIQNuZHKjtL2r7FmPdIQ+LERQfVlTM1kPjT6nAQNjI3JVI
	aS05q+zW5iA+Wy/Y7nk5Rl2Ps9Uxh3ONxRoQfuv6ca2682ZeOJ2jZG1HYsFU72Q8r17g5SQIJ2R
	GCR9Dm7WWwTK8sQs0yq+haxnoXj6FIFqlylrlJ2rKWu6+h9zVaFgi6Z8pYrkXYqAE1VnQSC+YCn
	o+rLe92co93TQat0LtbagXbnjC
X-Received: by 2002:a05:7301:1293:b0:2b4:7c92:3f7c with SMTP id 5a478bee46e88-2b85645ef66mr3452021eec.6.1770470299657;
        Sat, 07 Feb 2026 05:18:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b1ab:5cb0:a2f8:764b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c7f5fcsm3688627eec.29.2026.02.07.05.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 05:18:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 3/4] dt-bindings: arm: rockchip: Add Onion RV1103B Omega4
Date: Sat,  7 Feb 2026 10:18:02 -0300
Message-Id: <20260207131803.2834749-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260207131803.2834749-1-festevam@gmail.com>
References: <20260207131803.2834749-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_051820_631236_4ADFEB57 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Fabio Estevam <festevam@nabladev.com>

Onion Omega4 board is a board based on the RV1103B SoC.

Document its compatible.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Fixed sorting.

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d496421dbd87..2d90df71475b 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -802,6 +802,11 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: Onion RV1103B Omega4 board
+        items:
+          - const: onion,rv1103b-omega4
+          - const: rockchip,rv1103b
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.34.1


