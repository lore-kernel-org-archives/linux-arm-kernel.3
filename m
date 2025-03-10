Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80D9C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 22:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k2J7lXzqrbipa2I9H9dA8Av5fnasRNuvcADmKcn5+2g=; b=YaULMWAIsdMaVCB1t/CV0dST0e
	adAhK24Ttkx+87+x/XLgqsl2hnsY094SjusyQUrTLmIcmMvJ87qthBFAwhtRjLj+uKLTFrigVct36
	IZNNA4bhp08uAvKKpCDfyeVhBpBR434yDc64KoVrfYiJjmzmD0/abwvT6HK5C2aYpv8NNvqs0ku6G
	L3WZss3qrM5dPMTZkfFSUavinEM1xWYIH9sOWp37pP9Hc4MLu9iYtQ1QjSeR40k0ibZ3+bFXYKMao
	8Oq87d9fEpW7/oqgZuIPttfS9JPo4GACo4T9VmJ3FHef3ECJnGp7joe7i5dQqij+I1E2OESNre3mS
	4qv+xDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trlLI-000000045ZV-0heE;
	Mon, 10 Mar 2025 22:11:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trlI2-000000045Dx-2Wd3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 22:08:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B7BD5C0F9D;
	Mon, 10 Mar 2025 22:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DD8BC4CEE5;
	Mon, 10 Mar 2025 22:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741644480;
	bh=4NH90Cs04TqlOhUoz/iIw6tRYGsatu8fWNgt044t36M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JIwkxpXTq/hqnVz9dSP6RI4Jmyb7693CWCXpJM+qFms3Jspu4Y3OrPrxhHae7OYfn
	 UCKXxm5Z3kPaEusKVorAlLhBOuRSuo/Xe9lqhda6CPcgkBG8QAQMq4W8gvnyFJLyXi
	 DsaxCcUTZ75dDYOozAIIXJm7mqxSgJcw9e1HQ4HiLCPJ4O2qCgFlBm3CfqTr4frKtG
	 08c/q5Atp9mjXqPmb9n9jHuIRmt3VJ8Yv9nvlY50+8k8FgzXe7QQ6AkSupz40QGyaM
	 6DtzTRKf0ib9C8T27kfgdn5FELUxarbjBa0k3GAAQ944fg9iHQXSr6D+n2E3TGDgVN
	 /c+VnSGsaVqVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D12EC282DE;
	Mon, 10 Mar 2025 22:08:00 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] Driver for the Apple SPMI controller
Date: Mon, 10 Mar 2025 23:07:57 +0100
Message-Id: <20250310-spmi-v3-0-92a82e7d9f0d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1iz2cC/02MyQrCMBRFf6W8tZEMHUxX/oe4SNKkfWAHEglKy
 b+bVoUuz+Wes0KwHm2AtljB24gB5ymDOBVgBjX1lmCXGTjlFRW0JGEZkdSdMLzUkvJGQb4u3jp
 87ZnbPfOA4Tn7916NbFv/geobiIxQYuTFVTVzSkp37UeFj7OZR9gCkR+l5ifxLFljOk1r5bSUR
 yml9AH68rAFzQAAAA==
X-Change-ID: 20250304-spmi-6d3c24b9027a
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Jean-Francois Bortolotti <jeff@borto.fr>, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741644479; l=1465;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=4NH90Cs04TqlOhUoz/iIw6tRYGsatu8fWNgt044t36M=;
 b=g8CnRI6E0LKqOAOS/T7gnJRQIpwR+RGZtCOByjaUTDPnkY/76IvmqdKFQH66bpW46p5MmnOXm
 cbATFvvfMoqBVkC6MTfJwMvVEb2+tmF81rCQYQLPCjubErPipZ6zuYG
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_150802_752015_2FF9536E 
X-CRM114-Status: GOOD (  10.17  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds support for the SPMI controller persent in most
Apple SoCs. The drivers for the attached PMU and subdevices will be in
further patch series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v3:
- Inlined helpers, dropped unneccesary error prefixes
- Link to v2: https://lore.kernel.org/r/20250307-spmi-v2-0-eccdb06afb99@gmail.com

Changes in v2:
- Removed redundant error prints
- Various style fixes
- Better explanation of why the driver is needed
- Link to v1: https://lore.kernel.org/r/20250305-spmi-v1-0-c98f561fa99f@gmail.com

---
Jean-Francois Bortolotti (1):
      spmi: add a spmi driver for Apple SoC

Sasha Finkelstein (2):
      dt-bindings: spmi: Add Apple SPMI controller
      arm64: dts: apple: Add SPMI controller nodes

 .../devicetree/bindings/spmi/apple,spmi.yaml       |  49 ++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   7 +
 drivers/spmi/Kconfig                               |   8 +
 drivers/spmi/Makefile                              |   1 +
 drivers/spmi/spmi-apple-controller.c               | 168 +++++++++++++++++++++
 8 files changed, 250 insertions(+)
---
base-commit: 48a5eed9ad584315c30ed35204510536235ce402
change-id: 20250304-spmi-6d3c24b9027a



