Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BD8C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dLtaJj3z2oPY1ShSlkHP1j/IqOzaduHiAyYzCbRo9Ls=; b=DFDMyra33OT6zR
	R2uSiEr9WQhEA9WNOtoA1DgDui9fGXMGCNJpu4wQilLASxRi90axfC3gEWLc+OvNVI3r1rLwOMLu0
	C4wp1Mc8+Y+KZCs5jyka7oVGkQ0Sp0IIB3tPAI8lmK1rzLZwZE/oSE1xp9LNEPg8MTXEKOWDSyRKH
	w7Pk2bfJjAluClHvsVQMPMePD2yvmN4SaMnAuSwP2Rx7uNukOJysyCrx9gX5E043Zocdq4NrsiFo/
	OSKgXM/SyrD02NdIFHCpfwaDxymQ5mmvIdr0X3ydyTIfjNSNEb7NsB4MCzUV8ygzPQzLy0uy+MXtg
	drkv4+Z1Zy/6lVUAPe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5h9-000000055Gu-2RoS;
	Tue, 08 Jul 2025 10:37:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5P4-000000052mY-01PS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:18:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-748d982e97cso3721730b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969901; x=1752574701; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLtaJj3z2oPY1ShSlkHP1j/IqOzaduHiAyYzCbRo9Ls=;
        b=B0s914ZioWCbLfiORN12ocSvwOV/t68AOCYDfu33zU4kpL3FD+kKJnrxGH8PCk0/MU
         XNij2m4Yp8VB0qIr7KvG9TvjAXbGkuEnTS/ImYNfVwlxkXSEebgBFI6mu6XH9mF86RHx
         JlFBti6nbgPA1Ue2o5KazLQcQBcI4idbBOf66+nn7g6yeHRh/qmdBDLA7I/8mAhu4qSt
         bQrgoY3UWMIbwOAE15i7yTE78UBwZWK7yVeO12xc2PkSKbJxxUFrinBXI1Md0422hd21
         li7lx+QvpwwwlNPJGTNT3Tzn590pVb1eah1H78W9lfksyAwhyROCbbwUnWjS7c4zjzeX
         uCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969901; x=1752574701;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLtaJj3z2oPY1ShSlkHP1j/IqOzaduHiAyYzCbRo9Ls=;
        b=FMixj6GYIgiPiTQEKHZvwEgAIx2gqlIU1FS8wEcinpnulFLXE2DFubS4VcnX0DuwbF
         eySuDXBt+X41V1Y38OcsI18DVo8fv0d6VuwBZMrkwnEDEAPry1LXLbYa2LLyv0Rozobv
         Dm1C3cLxFW9wcBZzL89osPShjzJdzXyg1AB0P50NwjkdxZVvZhN9yrEH9FRCy77vlQjP
         TzkSKe8flugP2v0NGTHT+33WhY53RTrtec5Cx0ONmS3x3yXlC6Jy/wiZL5dw3pyt+QpA
         Nltg9LxY2Lf7+M1gluicezTA+Z1g8M/j4hpxLDVbr1skHpi6hxW8jDtaJTvYPSDT6/VJ
         1odA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ15VGBv0MofrjMdQGA03PrrGbWSFZOxLMSrxSgGWdKMExC6XawhrxxCYJdBEnFZszHCxTHXUPoTtiVlplxJiP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1QSD+RJuwV7AOTfgoYAjPQlGUUwrnSjr/nKXmGrNV4o3CDEON
	oqXmjuqWUgV5d/JHt8YCusn9OoNwCpqRghpW+0Yw8YhJVdIi4WuwlW9C
X-Gm-Gg: ASbGncvSgBmf2yjlWZtwT7M4T4XejkdhWhPvjSuvOw0PpNRtm4aJeRYn0AIkVfnrtNn
	hCXT+qK+KoYd2QAgYKVcoA+dvAQ5MtmUN7rBcy/ekglJTLKbbQRKY6BCUwjg8VmZBJarU3BBzkA
	xJZ2OTPfKERK+tCiLRaYR85YzC7hphBJWuzW/xHTzG8QjXnd00mOLYdyTtoBg897lgqgpGpRmDx
	pMlUZ3kP/kV7MUSbC7fEmgJu3Io/32155pxt+9jYDsFYpDi5j6nIbpm4ccGmBLCYKGSgyJ7xmt4
	UmQngJRB+Mm/B65i7OafUCgu/mcmq3+uu/ITs8QgtgcsIMlbFel+MOwInwaYLLnb9EtudRHscZi
	OcA7YtbaYvr9NsXXJIfyt4xcPOZSTQAk=
X-Google-Smtp-Source: AGHT+IHFTbQU/uYOoMrihd+GoWidRAGLXPHYkD16HziD5MyIKSHN6gIaJzOtsuNhgeCshtOg1HOW5A==
X-Received: by 2002:a05:6a21:a44:b0:1f5:9024:3254 with SMTP id adf61e73a8af0-225b7f19724mr25324211637.6.1751969900609;
        Tue, 08 Jul 2025 03:18:20 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40e3sm11114709a12.34.2025.07.08.03.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:18:19 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v6 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Tue, 08 Jul 2025 18:17:59 +0800
Message-Id: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfwbGgC/5XOTW6DMBAF4KtEXteV/4mz6j2iLMww01gqGNkUp
 Yq4e01WLFiQ5XsafW+erGCOWNjl9GQZ51hiGmpwHycG9zB8I49dzUwJZYWTZx66jpffcUx54pQ
 y73EKHH6wx2FC3vbAvZHBON+CVZpVZ8xI8fHauN5qvscypfz3mpzl2r6jz5ILjhaCcx7RNO0Xx
 VhvH5CG4RNSz9aNWW1cJY+4qroOLJKwXhoP+67euvqIq6sLSmkiIOOA9l2zdZsjrlldbIiUNk6
 A2Xft266trtBn7BxJaP3Ov8uy/AOXrcBoOAIAAA==
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
 Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969896; l=2063;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=lQzrd3v8IVLh9gCaLq7WUnZF8AHGYqftBF79jT2Lra4=;
 b=KlqQpQVMjrnLsTyzdw9K7byzDuSgHRV9Z3mimvYYtAWncmVd2YRbbCEniIfrILAVU2LEhX156
 mgdNooJdzBbDK0eYj+sxgUbJ1UwgKhLdxEcF+FpXccjYalJHvhtPZBC
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_031822_056428_9D385F70 
X-CRM114-Status: GOOD (  13.39  )
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

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v6:
- Correct Author email to match Signed-off-by email address.
- Link to v5: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com

Changes in v5:
- Remove accidentally pasted texts.
- Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com

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


