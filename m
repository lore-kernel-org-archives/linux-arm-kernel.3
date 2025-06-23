Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3710C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LNA9piZjlRKT0wGiiHkHTEOKa/CNGuXgOq/W48NNgPc=; b=Up43lSI84B7IoU
	5E/S49RUrpRj6okmXEnNrRCzPYbVvupHZk1jV3ECNdKashFLhKX3SFwZ9VfhVCE+sPcnA5lQdUoy9
	k0HPrB482T5lwSFTm+Th12ZD9HdbGDH34OxHY4fiRIlVrMSqXDfrCsHrirXubWG4iYUP4H9YDNjrz
	CyO+/ozxndfgkUja8m6oQfWCNl0PaRV3zjfBd/4FUlPwf7CBJs6yGATMeFxYxmkEzD8rH5R72DgDg
	qfW/l6gQzrRz0FWDJls9FKuWVgISgK2AUwqKAjBYajW5ds4L4rv7dGqzj6JqO6/ZN9mCZPXHo7GWG
	x8zWDOxC90HpcrE2wgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjop-00000003Ndw-151o;
	Mon, 23 Jun 2025 16:14:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeQi-00000002LlY-1taM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:29:37 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-237311f5a54so38155345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 03:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750674575; x=1751279375; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNA9piZjlRKT0wGiiHkHTEOKa/CNGuXgOq/W48NNgPc=;
        b=dpqsEs7q9/WsU2B4fc/VCxSJ3GqzYZIOcwa8WEQA/zpntgsTh7UX2wpgRO8AsLsYmO
         YAaN+t+XTa0x2VJFeAP3MAdkho7NYBFkyLgHp5xo4h/jy3/q0vxmKCBq18O3o+hXWruq
         yLmNKPJpzEZDflwX4P3CfAPGJoTX4Z/lrw/yAi0OfCRvFJ0EJKn/vtEJamr51rvOthoM
         ufOIMOBC2JzPJDZhzulMg0RBG+czYgb+2AVFD5EZ8j0hMjsz5fPxFzwEK4sj3FvSS+Bv
         lunI/Vwqkq/btDOvu/ZTPwg2yrDvLPnx3cZx7XPk5aE9D7Y0VgHYQxkDAevcvLDVaSAP
         vy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674575; x=1751279375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNA9piZjlRKT0wGiiHkHTEOKa/CNGuXgOq/W48NNgPc=;
        b=dSCgCXzpZlG0YJmt0D4Qb+m2EyS2FQ3v5smXeHnxWmcBG7/ElLh6ia27NRInKLqbd9
         tcsLmUuGjgLNmqwnWs45jNnjY/Tyuf5tRkLZaRxoLCJMNPvFdnCz7sX6epvZ001YTDvl
         SCwPJOyYzdcRTmAny57GpD8ZMRTpUujIqYhSbqfxsAGi+SonL7IKcy1juTS6dMotyfCN
         y6CCwfqb0N6tpvT11cNula1URuihghNT5QnpgvyA8glXWepZjrcwcNqbGWw4C7VrENne
         5Jpscg9ZZS1cDVno1gW5S6eZNkluB7I306anI8vw6/tOabaxijz9MRHLsGS03k8ri9KU
         yW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8hTmIwyFOiBcfkPbj27+Eags0QaDyQ4Lq4MXqY8kkoEzgUE4g615eZz9kXUd2+UdTqNTnP5gkqXB4HZao6V7q@lists.infradead.org
X-Gm-Message-State: AOJu0YznlxSw3VRwVQrAHgFgOEPDeQQujqzlFg3HyzGk63jNGvZkAs9K
	uv3wQO2d1rWSEJ9jtIokK6Kn8iWHewSNO4THLDcUkpMcebI/gyLE4Hqg
X-Gm-Gg: ASbGncuM8yOjXrqzi4Lvf6FZgoDxgNQD1dQjPnh4QqjxnsgN+mRQrq3Gr2zutOYLUP3
	zz8b/NM4NlGz5OFEEg8Jn40q7TmVB/hAxQ5EYJ95FhrV81O+ztbcgDt6IL0PKbTlE1IKJGhNgsK
	lfl0NlWJqyiF+ZT1sgJg29GvIvnplqX4iqc/OXADyz6HwqnYdRtYJC12l3K4kCjPimfv9EVRRN9
	ovkcxOhwQsQgepKE7jaAMWOEfvIM3It8FEz4Sz2KyQ1GxJUbRDWD/h/z+8nxHWJ+zpNg2xyefkv
	ALeGTVzPqwv63SQTLXGYnp3gEcJirRVs17ADZTN02pC9TnU9VLq4AUiwyBQMeJB4Ccq1Bd0Wub5
	vqF/5w7BVpb4G7Mg8tfwZrm1508GTwkI=
X-Google-Smtp-Source: AGHT+IGu/olQd3gCQ9n8b1T0IY/BOseKz/yROaIShRCjegUE1QktPgjGuNH4gxysfO4C6lOdqqk82A==
X-Received: by 2002:a17:902:f642:b0:234:c549:d9f1 with SMTP id d9443c01a7336-237d9bac013mr160443415ad.47.1750674575287;
        Mon, 23 Jun 2025 03:29:35 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237eec29a77sm39901125ad.165.2025.06.23.03.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:29:34 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v3 0/2] ARM: dts: Add support for Meta Clemente BMC
Date: Mon, 23 Jun 2025 18:29:00 +0800
Message-Id: <20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwsWWgC/5XNQQ6CMBCF4auYrh1DC63WlfcwLsowSBNpSVsJh
 nB3CysTN7p8k8n3zyxSsBTZeTezQKON1rs8yv2OYWfcncA2eTNRCFkofgLTNBCfw+BDgtYH6Ck
 ZwAf15BJB3SPoiptK6RqlKFl2hkCtnbbG9ZZ3Z2Py4bUlR75e/9FHDgWQRKOUJqqO9aW1Nv9O6
 J07oO/Z2hjFhyv4L67IrkJJbSE1rzR+u8uyvAG3SOkwMAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750674571; l=1272;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=+GW4fgeA+xKGchuTpQBu6jwVxlJTWxJyFy/i+RiAaek=;
 b=btkegG8seakota/9EBKZL2P1m9hbYQ7NcEdNGd+Iz8G8tbLqCymMYqAzZy0D7nJsbPbeG6fVy
 yF1S00pOaEBAlGU31LLYn+ehfvKPiteZ5u+ZO0/xuwC9i50JSo2Nnnf
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_032936_546251_6D299B49 
X-CRM114-Status: GOOD (  11.10  )
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
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1254 ++++++++++++++++++++
 3 files changed, 1256 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


