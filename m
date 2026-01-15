Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A2D3CCB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 05:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AzrY2zyUlFdBwp56KpRsHxbj2guX634diWbsvb3BOuw=; b=gNp48Y8qv/9tDM
	Ejh9PftSyzbycDDWUnN7y+fm3KuivwZSQB0USm3V+BFPt5zWwxzjeYItU9xe8DMB8ujvK2K8lA8kg
	kHtEqs1WauD0Ar9ix1Q0ObLIofvk5nPlFeahup/bq/xpBMZnoOaWVYRZzxqtTQiTSaITIyD5DaWi9
	SxzGhPqEoyXWKUyGB8S9VpLWLXmv7Snsv4sODxlyyeI0W9+KLMtR1vY+8Jl9J5VPsHkS+z3+DS+bF
	5FJyD2pdLX4yiZNIMi3GwzG6bdKAFxpNmaVGDE+uMlk7uceGSqgpE/ygHX5Oeb76VSaNVFFcHeOcB
	fWtJUmuJJxT6qxLD+3fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFxI-0000000Bnz4-3lVf;
	Thu, 15 Jan 2026 05:31:36 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFxF-0000000Bny2-3YsK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 05:31:35 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-79088484065so5350967b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 21:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768455092; x=1769059892; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzrY2zyUlFdBwp56KpRsHxbj2guX634diWbsvb3BOuw=;
        b=QTFA399UrNCb9nve0++2VOOesPzg+3O5+iqp+8Tf8sEs7o5CS3fjCFnHnSrNrVuhqn
         cMTetFhdFF5ph+x9zQ/oRgZIVnPPCA+eFZrIkmu3N6q7bBsQdXTKPpe0sOl9ChQgmOoP
         t+RRpBdrPvOwxypx/4ZOAkk1juotiMghKqDOgb3N/XvKK5A1RZzJzbxkmPPS9MBLGgBe
         q5VKqUD2ITa3YQDTRF3xYHoHU4+krEY9HL9LPPYFaf73Egyy8rVABt3C/iCdPWhuFL6w
         10lyXhvWeFAVfUOQQq90mKHN4D/GMzCifajVS+cBAOURZtQJML9flDiipeRXebBx/30W
         Ajfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768455092; x=1769059892;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzrY2zyUlFdBwp56KpRsHxbj2guX634diWbsvb3BOuw=;
        b=AGS4gzgPQjmCZOvLahclAQw2X8nCBGwTZ5ZnYOfdpSfRm96yMhPfkN0W7xcl5q5CRc
         8AD9LPYt7gPrAfjuwh4jr6lYmJg7rYtdNVyCZiYiH0OmkN7scu40btrDFAobrK2wgW6X
         us7V7n4bC6R34lUQLWGrsjnqAG2qLnbBcGke0c2MZo26+UqBz+2iz7huSKcP+deIOscQ
         pvrWLAokemnAYLMHXNZu3uGFTbcyWRbeTDkvtUbdELDAidI4MRIWt5GrZuJrPaK6gTKI
         c92p6H7vzEZ5D9uI7FtVkbqtY9e6JuILkzVbODA7MfuSDNZDB9BZ5AfJwI4wMJVYi0cl
         tOcg==
X-Forwarded-Encrypted: i=1; AJvYcCXBIwZUrLXkguxvRJeLijLqzr1tRqmP8sCPbWpRqLLfJJyDqWEq8Mm+jNedMkSgz75syHxDaC6aOVh+4Dg7bG4u@lists.infradead.org
X-Gm-Message-State: AOJu0YzGcIuAd6SAbDHTFPbYcyzW7zG+CTQ8T+B0zIsbPgAb6/Up1oid
	iPhaeaGYFylPrNUIlulQKQ9eVodBbkjfoWSSMIMbufAoCWvDr0guz5pmu32T2w==
X-Gm-Gg: AY/fxX7D+l/QxzFf6I5eVWEdUR0HBo7NwfpDFnu+lB1L98HDwbSybZ0v1GovTXsnT3r
	MJb7xSHrxVqbq77X8UeGIgxwwKS5l5Jkjojccr+8H2d4h3ArXtmX5PHSgdtMOgVQ5EXG362R3Ak
	u1NEHlyPeAGYkb2fzXyJ//Cv4GdVGEsHLIjEm07NMP7+ytQmb+KAuQ9tIoHgBrobIp7+cLgN4MI
	LMYt9Q9CO5Pfw7edX55XI8T/wxkVvw2k6zCqc7siypvR2jnjLb8bdw6guZ806fKPgzLDQ3t7wxA
	g2hFmC3fGfUEYuXvlj2Iv2cDurErceyAWjRiiGjY4Aot+HQFBx52fGUjDS7+4cJ/WaKFq+rfrOa
	+35dQ9eP3GU6Rs1VfEbDRyKRp17nXpEl2JCg1DGpZdae250s2/F6U7kSny7X1fwiZWu8pDr8gxf
	iS8NX9
X-Received: by 2002:a05:690c:6a06:b0:789:3f0f:ac6a with SMTP id 00721157ae682-793a19ba6e5mr95950467b3.16.1768455092178;
        Wed, 14 Jan 2026 21:31:32 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-790aa553172sm99259437b3.11.2026.01.14.21.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 21:31:31 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Subject: [PATCH v2 0/2] Add device tree for Asus Kommando IPMI Card
Date: Wed, 14 Jan 2026 23:31:06 -0600
Message-Id: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJp7aGkC/5XOQQqDMBCF4atI1h1J0iK2q95DXExNNANNIhMVi
 3j3RndddvnDm4/ZRLJMNolHsQm2CyWKIYe+FKJzGAYLZHILLXUllVKAaU5Aoyew64jh2EOHbOC
 FxiBeq7uujcjnI9ue1pNu2tw9Rw+TY4s/oJZK3mSpKl3XErIfiGfjElOg5Tl4pHfZRX+IjtIU+
 XP+uqjD/Vtp933/AraGxV30AAAA
X-Change-ID: 20260111-asus-ipmi-expansion-card-baddaa36928d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_213133_902585_E8E7AF9F 
X-CRM114-Status: GOOD (  14.09  )
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

Adds support for Asus Kommando IPMI Card [1] [2], which is a PCIe card
with an AST2600 on it that provides BMC functionality to any host
without an onboard BMC as long as it has a PCIe slot. The model name
Kommando is based off the model description in the vendor fw.

Currently supported functionality includes UART, booting from SPI,
KVM functionality(usb gadget for host, reading VGA framebuffer from
host) and LED/Power Control via GPIOs. NIC support is not included,
requiring additional patches which will be sent later on [3]. The
entire BMC functionality has been tested on an OpenBMC build 
available here [4] (which uses a modified u-boot device tree [5]).

The card supports some additional functionality in it's vendor firmware
like fan headers with fan speed control, host bios flashing via SPI, PSU
monitoring via an SMBUS connector, a custom ASUS SMBUS connector to talk
to select ASUS motherboards that support it and exposing a IPMI device
via PCIe to the host. These are unsupported at the moment.

[1] https://www.asus.com/ie/business/resources/news/asus-ipmi-expansion-card-gaming-pc-to-workstation/
[2] https://www.asus.com/supportonly/ipmi%20expansion%20card/helpdesk_manual/
[3] https://github.com/openbmc/linux/compare/dev-6.18...Genius1237:linux:asus-ipmi-card-6.18
[4] https://github.com/openbmc/openbmc/compare/master...Genius1237:openbmc:asus-ipmi-card
[5] https://github.com/Genius1237/u-boot/commit/1b1b7daa85f6c998e5f404296b3da43077a2758e

---
Changes in v2:
- Changed board name/compatible/dtb to be consistent with product name
- Added ast2600 to the compatible string to bindings
- Removed ethernet mac and phy, and extra blank lines from DT
- Reordered phandle references in alpabetic order in DT
- Added a label for LED nodes in DT
- Link to v1: https://lore.kernel.org/r/20260111201040.162880-1-anirudhsriniv@gmail.com

---
Anirudh Srinivasan (2):
      dt-bindings: arm: aspeed: Add Asus Kommando IPMI card
      ARM: dts: aspeed: Add Asus Kommando IPMI card

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 117 +++++++++++++++++++++
 3 files changed, 119 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260111-asus-ipmi-expansion-card-baddaa36928d

Best regards,
-- 
Anirudh Srinivasan <anirudhsriniv@gmail.com>


