Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AACC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hROTv1MESU0wRbBCVmMCNh5kpYIBCNcs0XYVMcDeAfs=; b=jHj+SqImRWvh2gZ/lYz6LRnOy2
	3cib8hSIvXoPaRQfk3LlBZ8tIPg7oqsD8UfrIO6q5nJkrjQsBokHX8tSRs4VMzFszf4hYWpEM1uX6
	kJldJasHR49vZQJTFdlKwzOqsjPIAwp6ADSuqCDXl0oV8y493RwARO/2Tbpx+v5qmegOU7hgbXY/R
	peJnKcXiAnCd8CSW/LqlZFL3h0tVKPWTER6IFBGllS0vbmfnJQxAN3tBgwypwvRm7mGWX5nBPHA6E
	6WKYl6yTSvD2kE5M3rux0JgzrMSgQL+Cp55qh/HbjhK75f1V2E6AsPGqjmzT7zrP+3c1sTJAwkAWl
	GknNVsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxMq-0000000EWQt-1DAA;
	Wed, 15 Jul 2026 11:01:32 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxMj-0000000EWMD-3wiN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:01:27 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-81e9f7491ffso57890937b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113285; x=1784718085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hROTv1MESU0wRbBCVmMCNh5kpYIBCNcs0XYVMcDeAfs=;
        b=lkp44RMGKCqqUl0hvySVFWrh8sJxoIa3zUBJkU3CpitgGTloKN7lpnDNosyRTNTFq4
         EkxZ+2PnDxrmg1fisui/XSiXqSpEIaZMBlXrawqn6IBen78hXGsrwydaDzlxyGgGFqfF
         M0X0tyrsN5yVEQQDR3Fk5N2abAvODSM120okvfUf5wVd2Qgo6W4ss2cjA3GO7K/2Nfec
         j6nOZvU3FZd6wCcJjx5ThQBIFRKhk4nGdY2rZmbb92OaW4e0P1lHWSp8HcWXYLJ5Y0vh
         HzhfISrW8HH73ohvDAj/14lTHVLDcAjoXVZR4Ce2+AL1+OLbKsonsCz1iDmvCWiGDjuL
         narQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113285; x=1784718085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hROTv1MESU0wRbBCVmMCNh5kpYIBCNcs0XYVMcDeAfs=;
        b=Q2wppqrzD+YCEs1jV6BKUll8JwscVDPQ6TpNgMihdUTBzWS9nFPyeUP9kZQyLF/uC3
         cgtqwG0srn2rRSC3a9fbYjVJB4+CCI3wN1iFkmYiO5NyfIzmG+v95xcDYDupAdhh+TDK
         NM9bx33tCx3kMw3MXXSXmWIBy4QBgkGcJ2f0gog/I2qHUD0KMFSMDhtwfZX8gPNRDF4D
         N1ZN54gjaoXC4y7LVej9L/h9fbsarMI2QFYArkcvidrWYcNYUyZw1UcrjdEgVRIx40xK
         62cMRrroHJVqR/kF5XOxB97hkcIv9pmW9XWT0+gnhpdR6cvGRQykPh1b8bIPWksdbgtX
         sjvg==
X-Forwarded-Encrypted: i=1; AHgh+RqGnazKsVKvXiWlnfmH2LqO1tC8J3fV0w+GxYdyRKHzQNR8RbbZGqawQRb7gqo/xaNvRA7iBRjJMLlccgNL0CFZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwXrZvmSwjvzC4aJDsfocFwqIVQA55XboEUad29puRpHiNHqqHh
	Tzi5uOGh+n9vlz1Q7oOZMjO6aJYR20KeZB2RQU85vihS07uJ8UjH8ybw
X-Gm-Gg: AfdE7cnIsjuZMQIc0rLMGEtgQ1LfmY+gK7mbS4zRKZZbGdhZxqcQEMoV20jWjJJCVNb
	BKbmlbAMpDIul8rQ150bfFTK6GQrg8SqLj0moNlcSm+OI9UHpT8rf8D2v0bjEQedWyMOsWhWDsc
	2xXm0K0dzhiY5iEjGK47BLdxuH+Rl6HaTsEZ038B4hZoabhF6v2tebDmOYKd+tIeMuZHzRLvSD5
	jpuP4bGgKtONss2dzTkU5o79xIReKZPk/xyTXH4Gp/7GXGZ61J/T5A8FgwBvWS8qrykH3AA01dA
	Rv9OFnjN7uRDZyRIBzb5vwzspIcA+V/Y+WcPnnObwPMNTRpYlKEOy9jigHnY8XvCYMCr3/8X5xg
	RC6ZMZv4Kk6+2L64Vsa19m34mjhf6RSYqssD+H+OFU5DzOL06K/dFwbsX4GgA4BiHjXRyX3+4hy
	uK4/KwSA8RbE13EnEgxDlx
X-Received: by 2002:a05:690e:1c07:b0:664:ebb9:60bb with SMTP id 956f58d0204a3-6680774b5ffmr3712168d50.40.1784113284751;
        Wed, 15 Jul 2026 04:01:24 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6681fbd8c5esm59066d50.3.2026.07.15.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:01:23 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH 1/2] dt-bindings: nvmem: rockchip-efuse: add rockchip,efuse-write-enable property
Date: Wed, 15 Jul 2026 16:31:06 +0530
Message-ID: <20260715110107.409204-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715110107.409204-1-hrushirajg23@gmail.com>
References: <20260715110107.409204-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_040125_993165_80A161B4 
X-CRM114-Status: GOOD (  10.11  )
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

Add an optional boolean property to explicitly opt in to write (OTP
programming) support. eFuse bits are one-time-programmable and
permanently set once written; write support must therefore not be
enabled by default on arbitrary boards.

Boards that intend to use software-initiated eFuse programming (e.g.
factory key provisioning) must declare this property and must ensure
the required VQPS programming supply (1.8V to 1.98V per RK3399 TRM)
is present and correctly sequenced during writes.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 .../devicetree/bindings/nvmem/rockchip-efuse.yaml     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
index b80fd8d1ae5b..8a7195245c84 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml
@@ -46,6 +46,17 @@ properties:
       this property is defined.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  rockchip,efuse-write-enable:
+    type: boolean
+    description:
+      Enable write (programming) support for this eFuse block. eFuse bits
+      are one-time-programmable; setting a bit is permanent and cannot be
+      undone. This property must only be set on boards where irreversible
+      OTP programming from software is an intended use case (e.g. factory
+      provisioning), and where the required VQPS programming voltage
+      (1.8V to 1.98V per RK3399 TRM) is guaranteed to be present and
+      correctly sequenced by the board's power design during writes.
+
 required:
   - compatible
   - reg
-- 
2.47.3


