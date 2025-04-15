Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94835C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 02:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EDspeSRpA0Eao98uwuua3AmOcD4l/y3brnzymW0EkSI=; b=X9VrKJi+oiJaxvxmgvctonSWDG
	b3HsnYHmejaJBxhRdVAC1fhGAN4ibkgVkPQYfhiir5JRpxG+GXPT20WfMMOlPBH2+TUhWn35OSiSw
	h3Hgnc/YgQKuyuK3h+J5lXR4Jm6ZY4nTaupwV/TitlFPfCjYRO6aTzCL75WmI0tHz3qxJnosWDj+R
	1HIyl70kwEGwIK/LgN15a5UTE80gGYt5KhqYKxAw+ITwDFyvIytbrx6O9fuSRPPSQRHKBwSyqhJzZ
	FJY0W3sCvmQDJsg2jO302+oPQ9LeCKGTGRbFTLBhIYUJYdnAEcWDJJmgaNp0Fwj5xrLRwvun+QIc0
	PLV6QsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WL2-00000004E36-2ziB;
	Tue, 15 Apr 2025 02:47:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4WJC-00000004DRG-3Lrk;
	Tue, 15 Apr 2025 02:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 184515C48CE;
	Tue, 15 Apr 2025 02:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A92C4CEEA;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685157;
	bh=oEyawwJ67t4F2O0m4uUa8lz1QQdbkKkB8kGfM2EgBQw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JeSYPZSvuUz2kVFu+Nt8tVZjEwB1lkOlnAyqgDHf7OuEGkrCyJZxXvzl+vg6JFLKn
	 7Btcx0LpplxhYmGyETdt6uYy9wGPP/MVzWOxA2uOSUypgaruNw4JmUHrvFPVNRopMR
	 ZFt6BPOPrhiePHg3QfrOUEx7bz5PaCy2wB1jl0E7tWttAcCSBSnQss0wRpW44xCm1C
	 0bN0UNXX3HxCDrF1nTxigXKgs+NNlw5WKJ6Q3O5185r+HWw5iyQ6Q/jWaLpn2/Tuu1
	 wP2+dcdqg55guaizXek9YGeAjIJi7Orkyk97pgl/HgeOPxN8YM1ltZ63KOfKGAzwuy
	 y5UIvpuKM8WcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F917C369B2;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/7] soc: amlogic: clk-measure: Add clk-measure support
 for C3 and S4
Date: Tue, 15 Apr 2025 10:45:23 +0800
Message-Id: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPI/WcC/23MQQ7CIBCF4as0rMUMUKh15T2MC0rHdqItBpRom
 t5d2pUal+8l3z+xiIEwsn0xsYCJIvkxD7UpmOvt2CGnNm8mQWooheDueuED2vgIyFulnLaNkcb
 ULItbwDM919rxlHdP8e7Da40nsbz/O0lw4K4pja12LYjaHuxw9R25rfMDW0pJfuryW8usjYaqM
 jWAVj96nuc3PBEy3eYAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=1405;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=oEyawwJ67t4F2O0m4uUa8lz1QQdbkKkB8kGfM2EgBQw=;
 b=IoVhOIKXt2iTmxOh8pMHEPW25r6XKeC7qPnpkj89JQVoY9Iv7zua6Kz2dvzktcyZba3m4ohNl
 wK1EXJZO4nRAfTbS+nbRG3/xqfa4dLrjR3BB29J2HPj+eDgcliXGYGY
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_194558_926414_4B18B00B 
X-CRM114-Status: UNSURE (   7.04  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add clk-measure support for C3/S4 SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v3:
- Change struct msr_reg_offset to const.
- Link to v2: https://lore.kernel.org/r/20250414-clk-measure-v2-0-65077690053a@amlogic.com

Changes in v2:
- 1 Rename the clk-measure register.
- 2 Remove unused registers.
- 3 Share reg_offset across multiple chips.
- Link to v1: https://lore.kernel.org/r/20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com

---
Chuan Liu (7):
      soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      dt-bindings: soc: amlogic: C3 supports clk-measure
      dt-bindings: soc: amlogic: S4 supports clk-measure
      soc: amlogic: clk-measure: Add support for C3
      soc: amlogic: clk-measure: Add support for S4
      arm64: dts: amlogic: C3: Add clk-measure controller node
      arm64: dts: amlogic: S4: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 375 ++++++++++++++++++++-
 4 files changed, 372 insertions(+), 15 deletions(-)
---
base-commit: 37021be47d02d2913d6767795a6f4c72b4e63a4f
change-id: 20250411-clk-measure-d33c5ab62669

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



