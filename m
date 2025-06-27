Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5ADC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 03:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UM8inYvwxYcJMQtjXe+UEuLSqBg2GM1eujKN8koXR4c=; b=RHyOxWG7KKg8ry
	cDiHNMCyKQFssZ7bI+S/Bp0L9EYh/Ws9BK5bwK039wTLcuhGb3zUJpr36cnSYCw7kO14UC5S38OmO
	KYxGKB6HyEmnwRjh2jc9mrJkFzOfidcBA0F3dz3HKcPqby3M7jezpb5JnLnQCWXbulaoNJPJQnfLQ
	NXHTtkL1vH+cJTbnONZZBXwoNrfmyzC+VZEYl9qcNr6XiAL+oYf/EJFX4PywF0UMIEq33xPNEJxi5
	RSRkvr3wPTmH7323sK7NxPT75mpsYzBL3z6YZmYIY8y2YQ+22U7wmq9Xi7WVd+K2nSpop2SaT3A0W
	7iOpJ7yD2Mu1uc9O6/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzLw-0000000DPOe-0qUo;
	Fri, 27 Jun 2025 03:02:12 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzJc-0000000DP8l-1Ya6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 02:59:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so1301032a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 19:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750993187; x=1751597987; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UM8inYvwxYcJMQtjXe+UEuLSqBg2GM1eujKN8koXR4c=;
        b=NHx5P+iyvFFGPGrf7YUWKu3id2PGnMX1aw+jvtsq8RVtdPNIyvZgjb6FShV8WwHCyv
         R5GyUp27C+xh0C4y2tK+vLqN/I11sgLfDXDCUD/VXskWLEzdUHV8G1puwefXS6s8BkKB
         64C7SuIP7rEvCyw5hQOB/VjIdoz6+v/TgIFRZobVuqawOPx4t9GxnFXze2PVuX1ejgYk
         44o3mULqUKUujjLkdbPw+ItGW3H/dVoXYORq1oAEoI2pN+XkpTG3Fm5zsExDUMpZ6u40
         gZndptM+jIoELRtd9+sGuZBvpQtb3l7Jf8CqHLoDjhDCLYyGiz39/gv/nAHy/Dz3BtBY
         W6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750993187; x=1751597987;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM8inYvwxYcJMQtjXe+UEuLSqBg2GM1eujKN8koXR4c=;
        b=VLLe3NRUcBHyo432W9ZwIiZb/u97wlJmS4r0H76aKTl7cq5thfsllMIaaGKJYto783
         o80rAldXof63dIBH/2XVTG7kIXbSIJSPYmIYHtTODCkQuKGsUhWlaZVHyy8Gj1PP5EzC
         6QKMKowgEYvUc+XkvW4rIhCXgXVORzrGs7qDLb0MFynSycNi26VS2g0pOxAgrtkxSM5P
         4StO2sDmqgumuUPQi67UeCJ/KD4ZSsG+0s1FlU8YZx8RDwfd8gBhxh7uszdRa1yjHbPo
         g/X3X0NMd5pHtnjhYhjcDokLiUJRM9BzJdGu1S9joHsoAyI8/mwoG+jtQc2YI3Mi5Egg
         80ag==
X-Forwarded-Encrypted: i=1; AJvYcCUUAoExNO/E8EtCR9FsMHvFgh4BOqtTumrFXZq62G223CKnVxoNwnMThVeSk4HJOKXJNtOtBDoWN5B9NDC6OVv7@lists.infradead.org
X-Gm-Message-State: AOJu0YzUfgwd1TAjNUIfVZFNwkMM7hJloqlWNdDnw5zQu2TNh0VtM2Vs
	snE9A/Zswd+SEqUVybvwRxAbZQcsMt34oqUtD7rKA7uFAI4u6WpSt3qi
X-Gm-Gg: ASbGncsjtXz33C+gX2rcf5uejSipABmky5AgzvY9h1GvQ5vivOSHvEIhrQxsrcXN0hT
	INn1yPA05kLmSZVBIlsnukaFUbsbZKi8n4X3i/EdXFBQM+BIGp/U3MhQqtj9yz6zkCW4W1lAMnE
	EOrPWlRmUek0gf5CWW7W3nxy+PZOgy1z9AGOYUUXy75XZOqFiyxZxbzQoiwBUVLvxbbxOAgdodU
	fq/3C240/AsmtbB8z9KE4M/t4InqaXXV7NF8MTaiYA4PS2qnLJmb8K96O2S3qKQHh9H9jnGl26z
	6mFRAQhv1FlW3Jp0SdICH77SjuZ0AH0U5O7pbPpF8KtM7YMTeGAimTMKBjuhhB6djaKM/jmrQdL
	Cm/xP1aFmL7AjPiJwivV69ep+7wQkQluyU/0nWXWz8A==
X-Google-Smtp-Source: AGHT+IFoDN8qLfLeTBIPOwa7sPJd2PCjUeJWH1WcwtLhHFRMtIYH77B3tlxBJ9aajx0wAOSTXR2YVg==
X-Received: by 2002:a17:90b:58ed:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-318c8eb9aa8mr2246427a91.2.1750993187197;
        Thu, 26 Jun 2025 19:59:47 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5426bd9sm5358186a91.27.2025.06.26.19.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 19:59:46 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v4 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Fri, 27 Jun 2025 10:59:01 +0800
Message-Id: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUIXmgC/5XNTQrCMBCG4atI1o40vxpX3kNcpNOJBmxSkloU6
 d2NrgRd6PIbhue9s0I5UGHbxZ1lmkIJKdahlguGJxePBKGrm4lG6MbwDbiug3IZhpRH8ClDT6M
 DPFNPcSRoewSruFPGtqiFZNUZMvlwfTX2h7pPoYwp317JiT+v/+gThwZIozPGEql1u/Mh1N8rp
 hhXmHr2bEzizRX8F1dU16Am32jLlcXvrnx35S+urC4KIb1Hrwz6T3ee5wcuQsH3iAEAAA==
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 Leo Wang <leo.jt.wang@fii-foxconn.com>, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750993183; l=1697;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=iElNKH47dFr7cEuSYr/PXBozji92kqyZzzl41GE5XUw=;
 b=PxQX6epia39JyezSIwOl8kvO2UxGdecuVsTKr4L1dZkZzWZeGL1DCZ7IW5u4C0IWWbswU/k6N
 GYEeJIqGln7ClrW3occr47U7J5jPhyR2KsFaWdL/lSbiymy2AXmpYGn
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_195948_420353_B607A964 
X-CRM114-Status: GOOD (  12.61  )
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

This series adds initial support for the Meta Clemente BMC based on the ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
Changes in v4:
- Move properties of nodes defined in the same file from label ref back to where they belong.
- Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
- Add properties to i2c10 and i2c15 to enable MCTP.
- Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com

Changes in v3:
- Modify leakage sensor to reflect current design.
- Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com

Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (2):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1291 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   11 +
 4 files changed, 1304 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


