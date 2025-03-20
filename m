Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A311C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 09:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9wBG6PUrPgkn0NRsD1wlcu8/Iz0c8bPBJbvfoJll9g=; b=BHNECXRbeMai0knBRAVRUqA5fQ
	byc3LGgyDaaMB0IqYuJi3OnHxXwvP1mTv0vxmkTFdGJ3npGqv9fzlZrH9DhvAbvz2F8eUs4kNDxbD
	5pCsEjaSXpLbj7b3zspUWajoekOErVxgb7Q0pkS4Ur+o2LYsVrCD9LMwOlE8WATZe1h3QlA7aDZ+E
	k/T3ZBcJ/hq9/bd7UMFg3p6XG39Y5U0B1QwCGHjKipTturW2HjPXzeAbaLe84cj/pCggtP7VDTnLm
	mnUeHr6CYQ2Dha7usFReknaGdck8IGqmOcTa9Vd12oYAfG0t+cevvcsxCFpY9Ucycczu3HHwamPDY
	hphFVk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCTZ-0000000BjaQ-2UeE;
	Thu, 20 Mar 2025 09:46:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCQB-0000000Bj8V-2nYR;
	Thu, 20 Mar 2025 09:42:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C27A43AE1;
	Thu, 20 Mar 2025 09:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F61C4CEDD;
	Thu, 20 Mar 2025 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742463758;
	bh=tmmYDcXWXP5v9hOu5c1RzTIofH/+ekVsnoiPWg8PmP4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CJqkP0AWvMSw5PqbZ9NuZfobLKy2y8F9rQ46T2Gec8KN/93VS/N0u7yc9EFoChlNx
	 0ReMWP7vADqQ9Dl8UPnRpAvAdX6DQ5OjYnfRP4qxzeRxEICVC9A+fDUaPhlV+H7LUT
	 EImFScARttvfaR6cKUC4u8DFrhzUPMlZeShOpLPHq+KH8qCssdkrQ+6uQWBlpxckeD
	 DFdIvWW1Xm65T6rWqv7UbIgToHn/wNxtWC04nT5y5wxmDKqnnAPEzPtxiYp4EQ4YAc
	 wKQkiTqXZuPtaBAhqUG42a0+gS65UPZwr8phyf75fFgK34inulLB8lvpEDBsJHhTzk
	 KiT9pq1AJXh/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6632C28B30;
	Thu, 20 Mar 2025 09:42:38 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] Add support for Amlogic A4/A5 Reset
Date: Thu, 20 Mar 2025 17:42:07 +0800
Message-Id: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/i22cC/23OQQqDMBCF4atI1h1JNImxq96juEjjRANqJBFpK
 969Ueii0M3Av5iPt5GIwWEk12wjAVcXnZ9SiEtGTK+nDsG1qUlBC0FLVoLmoAUEjLiAlLVE8WA
 KGSXpYw5o3fPU7k1qG/wISx9Qfw1Oa6ZoxQvGckVlBQzeOPipy9t0bnocfOdMbvx4eL2Liw+vc
 9zKD/X/jpUDhcRKKxVvpbE/ULPv+wcXqykJ6AAAAA==
X-Change-ID: 20250313-a4-a5-reset-6696e5b18e10
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742463756; l=2430;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=tmmYDcXWXP5v9hOu5c1RzTIofH/+ekVsnoiPWg8PmP4=;
 b=2xwp9yaqEA8eQ6er0AAQQeZeArBNXbW+XSNv/QZW5i8mWfeyfCli+/D3cz4kCFJ3TLEKP9WLS
 3BrBtFjkJAFAKDB2eNUkoEKsUCeoTxFD4ZEK0rI1MefV5HiH+gmSYZE
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_024239_750919_2C23AD80 
X-CRM114-Status: GOOD (  10.98  )
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
Reply-To: kelvin.zhang@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.

Imported from f20240918074211.8067-1-zelong.dong@amlogic.com

Changes in v5:
- Rebasing on top of the latest upstream changes.
- Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com

Changes in v4:
- Remove the superfluous 'items' in the dt-binding.
- Rebasing due to recent upstream changes.
- Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/

Changes in v3:
- rebase on 'amlogic,t7-reset' patchset
- Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/

Changes in v2:
- remove 'amlogic,t7-reset'
- move 'amlogic,c3-reset' to the other enum list
- move reset node from amlogic-a4-common.dtsi to
  amlogic-a4.dtsi/amlogic-a5.dtsi
- Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/

---
Zelong Dong (3):
  dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
  arm64: dts: amlogic: Add Amlogic A4 reset controller
  arm64: dts: amlogic: Add Amlogic A5 reset controller

 .../bindings/reset/amlogic,meson-reset.yaml   | 23 +++--
 .../arm64/boot/dts/amlogic/amlogic-a4-reset.h | 93 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi   | 10 ++
 .../arm64/boot/dts/amlogic/amlogic-a5-reset.h | 95 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi   | 10 ++
 5 files changed, 223 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h

--
2.35.1

---
Zelong Dong (3):
      dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      arm64: dts: amlogic: Add A4 Reset Controller
      arm64: dts: amlogic: Add A5 Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
 5 files changed, 218 insertions(+), 8 deletions(-)
---
base-commit: ff7f9b199e3f4cc7d61df5a9a26a7cbb5c1492e6
change-id: 20250313-a4-a5-reset-6696e5b18e10

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



