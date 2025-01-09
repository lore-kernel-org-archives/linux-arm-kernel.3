Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D76E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+OViREEuGAiMfB4rZqhC91yfl47kcGwQZ64TnKipNok=; b=jYvvAEy1Cku1LMy0ONeQeKXMzC
	1FnLbGoCc4qD4Aq6v4Atwf+Jkmw+IoWTKAwCD08sKfE6p6aLm++3xViNG3dt6wx9eT+F4B7XvMqVz
	Si42xnwfdtPuMjfcBWSenmrhGC8nvecnfmaMPZAIUTC6HalS1MljOuVcnPzd3ar2z0n9ISDRwP1ig
	ya+qTt2C7ZLBDo1HTZ2H/pz3TcyTLhRkszreikuXzqkERK/NH6YWD2NIs5dyGGR1sgWI89+9hOSQ3
	U5u/nYmImxxsmOca+XIkQ0152uwSNEqTBg+IBXYcQYhRVP8ozT5Fhj0ZZeuVJuDEl5jL5ZJyHVaox
	3KXkvcLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVplV-0000000BWpZ-2dCw;
	Thu, 09 Jan 2025 10:27:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpkH-0000000BWSX-0Mkb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:26:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385de59c1a0so413787f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736418392; x=1737023192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OViREEuGAiMfB4rZqhC91yfl47kcGwQZ64TnKipNok=;
        b=RmPAkDIkD+jhxSbCPM8XhiicEtaV+jjh5YSp5QKdCGK0T9SRbw+ReELaksWZb16BnV
         /4mpA/hsS4HkjuFCwM1wT/DnLVADftJ8qk0tLXBFAxZMZsQUHh6XMk9SiYb/sbluH8ib
         vANStrbwY/wGrdJPdPmuW/D2qBhrsbQKdf+TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418392; x=1737023192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OViREEuGAiMfB4rZqhC91yfl47kcGwQZ64TnKipNok=;
        b=m7L3herMJnoFOmljZmPRwQhDdTo7fiLm8GYx0tes2QE9KxYeGyo9mkmV7MYo/sxUMt
         ocIHRHX6AysmJKHBkC2fziTi5UR6AtBgrQ4VBC5Jqb9bCM1kwSLslGwdIgtFvhrVPlCP
         Uhuim0YATLF/M8B47LBTJGVfogUZ0/9suXflHZH/F6NwGwNpY1VIxf0VFYl4zGw9wTJv
         kB2GiqUEZLmnPgvB0SxNtBB+hrqT4HMDeU+aNqiEhv46BCnsgJSu4F7BTQ0TM1G2b5pP
         riZ5F5NFHQMOnqdqpyg1Y7Dds/DHoRhwrHNJIGfjWHY9fTsKb3lTRcMQJn9PEChsjHAa
         tqig==
X-Gm-Message-State: AOJu0Yxn9NLOyOQXPetrD0yJA7rr9Iny5NpEwfpa2XQ4b3KhfIwdEocl
	e/8K/YmNmnFfqfdaKg9o4DgfnGBAbn1IABDbWxzVLqAUVL+J8fm6FeB7cl7WpXY=
X-Gm-Gg: ASbGncu4PhSTuLsF6Q3W7AuGgkmFUrcVxx4TF0gbHIipS8GasRRzYf9y0IJV4un3ynQ
	WWGR05dNsQ2idy6Qd15lGw2jLc5pFtH2j0aOUhf2m+X36RmaHaim1p2T43NGwtJMReHdms1ahrV
	mF4nWppLezPyjQGHLiXrympgCGe6jeUjG7PFcat3oVUX3oNBDupg640+nXp26md5OEszZwr8f5a
	JO2RL4uSpQTUtiOicm6AfSisR05J6Ut3K3QQNIGdyw32JqfhRWkrHsRBMJj2F+URlKUPNsGqMO5
	nrmWnMgGvnXMLTEKSU2pqU7nyijswMDr8DkapSivSdtSOrv6mLKsxQ==
X-Google-Smtp-Source: AGHT+IGaEL7/48iU7IgiC7jE7AFgeQlcCSooxUQXpvnoV1/pZwI5FcyPuiKT2LVnasDagT56K+Pa0w==
X-Received: by 2002:a5d:5f82:0:b0:385:e1a8:e28e with SMTP id ffacd0b85a97d-38a872faed5mr5844671f8f.10.1736418391609;
        Thu, 09 Jan 2025 02:26:31 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38d013sm1435595f8f.58.2025.01.09.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:26:31 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	afd@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH v4 1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
Date: Thu,  9 Jan 2025 11:26:26 +0100
Message-ID: <20250109102627.1366753-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_022633_128533_4302969A 
X-CRM114-Status: GOOD (  10.44  )
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

From: Romain Naour <romain.naour@skf.com>

The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
SoC are used to drive the reference clock to the PCIe Endpoint device via
the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
obtain the regmap for the ACSPCIE_CTRL register within the System
Controller device-tree node in order to enable the PAD IO Buffers.

The Technical Reference Manual for J721e SoC with details of the
ASCPCIE_CTRL registers is available at:
https://www.ti.com/lit/zip/spruil1

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v4: Add missing change in the second list (From Andrew Davis) [1]
  Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
  [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
  [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/

v3: new commit
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0e68c69e7bc9..1f3e67f432e7 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
@@ -213,6 +214,7 @@ properties:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
-- 
2.47.1


