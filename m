Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84258CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bl4uXSY7Bc7Xmngak6P6JQMIdZXLD0O9sCdT/kuECH8=; b=mzj1IjPZ5366U1/sWol24nr88k
	IjoN4UddiL7+GU87xgzpemA5T5T8f8lX72g77RfqAZxNAHQbyd00hy3Tf4LhJMTQzKlXKg5ki9xzW
	8fC1fZs6BPYrR0DkcP+C0ORJtxuIHtf5t2ZZdhpD50lnMKJRk76hMx8HqtV1h+uD14ac7CVg1W4+U
	GrVz/pl6yJTAuRlGg+ZZW3cpnORacCIrx3W+mZMGz4p70U9TvRK51vfMb71JJqbi0T4yAxvUpiEsP
	2c8ab+jkArvWBN5MicAFX9BwsJvwj8hUzyLI/I4g49HYnERpXsQLxR22QbkkTeSlbb7DGGpY1tXfv
	vd05qhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00ON-00000005bfR-254y;
	Sat, 20 Sep 2025 16:24:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OL-00000005bdc-3vml;
	Sat, 20 Sep 2025 16:24:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 500BF449CB;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B18EC4CEEB;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=u840vuSdNA238eaEpBUXCICkOP9msH1ZivtGlgxyhXY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ErmjTj1foKcF6UARGZ7AW6uu0wLM47I32cf9nhIsCczl91jF2Y4j23rU5+Tjm+GEg
	 o9JQUxeC/hDe9CqDAXQi458yOguDzop/ETBLbqBjp9zy6JYAAHeu4W4gBMAMw7A80Q
	 P2a2uu9G+yaWF0z98iS10aPFLA8/5L0/k3eKUPH71cRWFrn58GWAySNA3SG0wsndUa
	 zua3NWit+RK+vWKT9bC+NPrWXyQi/QQgNfNYCFk1jvF0+JATpuBl/T/jvdq9SIw2s5
	 5SJxhaMdNxhwHMNAq5edahRzAT1OGVyPdnlhBIj/+DDG4kV/N3vtUIMCYrJnc3M91f
	 RYNeqzhSaKGTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A418CAC5A0;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Subject: [PATCH 00/10] ARM: Add support for yarisxl mt6582 board
Date: Sat, 20 Sep 2025 20:23:25 +0200
Message-Id: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7xzmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMD3dwSM1MLI11LY2PLFPO05NQkYxMloOKCotS0zAqwQdGxtbUAIVX
 EO1gAAAA=
X-Change-ID: 20250920-mt6582-9339d7fceb34
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=1921;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=u840vuSdNA238eaEpBUXCICkOP9msH1ZivtGlgxyhXY=;
 b=f4PxI5rxzmphfC3mJqHuJLLtu74mC8xdE0jGsQiiZDg3Bhahc+aOijqzXFUCItKAZYB1hMVMj
 lXU7DXzkgbVBmoqDQ6RZfAdU6e6CAmTqrrYb1ssoPVQofruMMy5o98c
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092454_019484_C382895D 
X-CRM114-Status: GOOD (  10.99  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
board, named yarisxl, based on MT6582 SoC. It also includes some
preliminary patches. More in detail:
- patches 1 and 2 add support for mt6582 to platform code 
  (verified by looking at generic mt6582 downstream source code)
- patches 3-6 do some maintenance work to mt6582.dtsi 
  (I was unsure if squashing timer node patches into one)
- patches 7 and 8 add devicetree and dt-bindings support for yarisxl

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
Cristian Cozzolino (10):
      ARM: mediatek: add board_dt_compat entry for the MT6582 SoC
      ARM: mediatek: add MT6582 smp bring up code
      ARM: dts: mediatek: mt6582: move MMIO devices under soc node
      ARM: dts: mediatek: mt6582: sort nodes and properties
      ARM: dts: mediatek: mt6582: remove compatible property from root node
      ARM: dts: mediatek: mt6582: add mt6582 compatible to timer
      ARM: dts: mediatek: mt6582: add clock-names property to uart nodes
      ARM: dts: mediatek: mt6582: add enable-method property to cpus
      dt-bindings: arm: mediatek: Add MT6582 yarisxl
      ARM: dts: mediatek: add basic support for Alcatel yarisxl board

 .../devicetree/bindings/arm/mediatek.yaml          |   1 +
 arch/arm/boot/dts/mediatek/Makefile                |   1 +
 .../boot/dts/mediatek/mt6582-alcatel-yarisxl.dts   |  61 +++++++++
 arch/arm/boot/dts/mediatek/mt6582.dtsi             | 142 +++++++++++----------
 arch/arm/mach-mediatek/Kconfig                     |   4 +
 arch/arm/mach-mediatek/mediatek.c                  |   1 +
 arch/arm/mach-mediatek/platsmp.c                   |   1 +
 7 files changed, 142 insertions(+), 69 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250920-mt6582-9339d7fceb34

Best regards,
-- 
Cristian Cozzolino <cristian_ci@protonmail.com>



