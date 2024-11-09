Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB877D5E386
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 23:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYmMJjvbdbMxz8rStxEESpsIZqDsIf4GaLtpKhT3xmU=; b=DlCUrZzmW8BB/wBrB0iVrDiPdH
	rcP/Q3Lsjm/Dm6/LjmG8ROtEqbx790dgs1uZIBdJcCrQyUgaNMgD6zjMgilKtDWJZLKFVwqwfyh5g
	OnJGCpFY416a+uiYF1jDOqE47YyWxOPdGQwYrDFMKf5diCAfwg5oK+GZ7Yk5NTYUl/gBT8Vi/n9wQ
	7o6ZMQ0/vQGXVcE8Rcbu2LeUk5zjtwoL3dzLSmQ/SfJt6YRUPCzi1J71FBoRseETE6BOpAn7C3ZfP
	eGkLwR/WlE2JXQUVel550fx4ruVS7MM97AngNMTGWhnTGiJhmd7DiaClfm/RUIF4tJuDfUFR+Uonx
	BVJCy3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uYc-0000000E5lX-46Iv;
	Sat, 09 Nov 2024 23:07:54 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9uVC-0000000E5UF-1n2K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 23:04:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2eb9dde40so2726995a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 Nov 2024 15:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731193461; x=1731798261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYmMJjvbdbMxz8rStxEESpsIZqDsIf4GaLtpKhT3xmU=;
        b=QMjcpcKZnpt9CbDYUglGJwCLVep+WBVx8JEDNa8vo6MmK+MosCxeebRkfl+Bvlm0yJ
         a3tDFW1Uhqu6Eojua39Tgkp1UdAn2dBvTkaWRD4mDSx/qJyaiNESFayFnDUa8trDzVr7
         wK2iHwO+2n+TLveHJRlYoS4hxASj2o9rtdLcup0/BJTXTGwdh5R4Ya2zzjZmeou5Y1wB
         odHupTSofoD5UhCnyNv6O7TdPLmHpHGIcttNMZ0TXX7malDQOe3revLvwDEdm5EfoSEl
         z7AWLdrwBi0f7yqgBBTHeq0Dz5Hc3M78nlR4N1ZDnCuqGaScWFNJqzgiBwRrgFFbujBK
         YEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731193461; x=1731798261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYmMJjvbdbMxz8rStxEESpsIZqDsIf4GaLtpKhT3xmU=;
        b=JtSG56KFl17cnyXdZIleQ5xD8JetMUxF5QshWrRYqUajqCetViq19S4+nnHgSunzXo
         224ZCIz3+bV6cvPk2wFyLGyrvC/e8Z4wOC2O2f8eALP1/DkJcSAqM7PUhluqeV4aL/mS
         yKEgKhqNDsd68ZfxDMSyftqyfSaPum6/GNmTlz3QWDeInztOjYq2VtE8PBKZJVceBlcp
         bJ97nySjfY16vG4rKIaeWh7bqsuScoshAbU7HVlWOZHJj9wC/TeeHx2gFZ2K/UjCs132
         d9JPna8kuUUWs7uhQ/DQ9yXM5Zii4YKzbGZwnTMa3HtS/f8ezIcgba/yNduhgSYNo6+M
         kkdQ==
X-Gm-Message-State: AOJu0Yy3uyfUEao5LkzYHi3Z7Pd+0fQDfngRMRWjqWA8RX7XgcCUwM6m
	sIeHxBror6ySsMgvU0fJPdQeYfP8gFHhWvQoGPcQFBN50LB8Zpzh
X-Google-Smtp-Source: AGHT+IEdhygKeNmzJW8T1zwRO5o8DvBEr2FpAArw4f90hx5sT0afqZ0tNow5Q6uEwXVNKfM+fLpq9g==
X-Received: by 2002:a17:90b:2ec5:b0:2da:802d:1f95 with SMTP id 98e67ed59e1d1-2e9b1655967mr10350563a91.5.1731193461407;
        Sat, 09 Nov 2024 15:04:21 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb50bsm5847991a91.53.2024.11.09.15.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 15:04:21 -0800 (PST)
From: Sota4Ever <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
Date: Sat,  9 Nov 2024 23:04:01 +0000
Message-Id: <20241109230402.831-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241109230402.831-1-wachiturroxd150@gmail.com>
References: <20241109230402.831-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_150422_486781_5275A1B8 
X-CRM114-Status: GOOD (  10.13  )
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

Add binding for the Samsung Galaxy S20 FE (SM-G780F) board, which is
based on the Samsung Exynos990 SoC.

Signed-off-by: Sota4Ever <wachiturroxd150@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index b5ba5ffc3..168e77375 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -240,6 +240,7 @@ properties:
         items:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
+              - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.34.1


