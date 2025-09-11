Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9424ECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 20:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPrJjD1ZVwQcKdquAwl0oAxzDEOQGU8BquDOfOiZIJo=; b=XjO/BXfA2glS1CtarTWdZGpJ2b
	R2Dojude07jwLLGcPNw6sWGkx62E0wRxw7MCPkcYmdXrjMqW+dPhOGbNR+JSgK8IL4KXVWKzwrKOe
	FsDsyNwp94MuNki4JWRI93GspWkJklCdqFp+wBJ4IUOQKhrjclG2BGlOgaXfZJlanKbwmnaIuNLF3
	adUIVr1Ub+9tdDm9O6Zeu6st6OWezx9r8wubU2pxHrCKY5GTOgoPFTue109v7KEuJLUXn0zsYif/K
	geXOgEArpi82ft403C+FCTnBWhd6UqLDn42pQWGGmeN0Ozs3rLMxj+30U/HwGDlQ1y6z/5UQvmb2x
	vfhoG7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnpq-00000005CsJ-2xwG;
	Thu, 11 Sep 2025 20:24:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnpl-00000005CnH-1j8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 20:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CCA244AEC;
	Thu, 11 Sep 2025 20:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25865C4CEF0;
	Thu, 11 Sep 2025 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757622236;
	bh=EbMD20lOlZxBydAK7zCQataQpHJmiIQr5rbqpG7Zzpc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DpjYmvhVHH2069jY8Xk+ovmziVk63trTPnxw8lWwh//40wIZFF7azO8G3FOVbmNDU
	 YV7wb/ATHm5u60ySQGT9TIqxg6S3vLMPDPI4z7H/ibGwMC/HVU8NWsvDe5Oqyh/Bit
	 5YV/pdA26H4veimr2BEaCKET2DAP9RkzNPh3qsaq/HkuWBba08d+RDr/IIlNe7jCEd
	 w+mjgtz+ggbQgdfPpYqIiO0JiJHyBskWnuOCDoAyoCk/ZemsliCKUAa6twB8oMHUcX
	 3cSeKMTDQBZaT+gVaPU3CZ9iGX8utS+AWn7EPZ6SShv+wHA7JIAzBto/wGXDPBumDn
	 JN5yUxIH0+eNQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EF3CAC58F;
	Thu, 11 Sep 2025 20:23:56 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v3 0/3] Audio and other peripherals on Orange Pi Zero
Date: Thu, 11 Sep 2025 22:23:54 +0200
Message-Id: <20250911-opz-audio-v3-0-9dfd317a8163@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANovw2gC/1WMwQ6CMBAFf4X07Jq2tLJ48j+MBwqL9EJJWxuV8
 O8WEiMe5+XNzCyQtxTYuZiZp2SDdWOG8lCwdmjGO4HtMjPJpeZKVOCmNzSPzjrAmqOqWzRGEsv
 /yVNvn1vress82BCdf23pJNb1W8FdJQkQoAhPxmjTVqW6TC5EcseRIlszSf5U5PVelcChV30nt
 NayQfmnLsvyAewWE7DeAAAA
X-Change-ID: 20250417-opz-audio-890849c8bb2e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757622235; l=1167;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=EbMD20lOlZxBydAK7zCQataQpHJmiIQr5rbqpG7Zzpc=;
 b=wrDUZIaMhF3qOeFIsCo2Hiqq6KZy/a7n1QcgKTmhRJX9sBv2YeeyfbFOsg1KkbXU4p7XXCuuU
 /H5tiRvvRcXB2dd2l6Syk5t8My1EdZRf2a9hUdq3dBNHUuRh8m4r6LV
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_132357_480784_9DDF4BA9 
X-CRM114-Status: UNSURE (   7.30  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v3:
- Fix name of orangepi-zero-plus2 in patch title
- Link to v2: https://lore.kernel.org/r/20250809-opz-audio-v2-0-f4fd15552a82@posteo.net

Changes in v2:
- Rebase on (almost) 6.17-rc1
- Disable audio pins by default
- Provide separate DT overlay for the Orange Pi Zero Interface Board
- Link to v1: https://lore.kernel.org/r/20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net

---
J. Neuschäfer (3):
      ARM: dts: allwinner: orangepi-zero: Add default audio routing
      ARM: dts: allwinner: orangepi-zero-plus2: Add default audio routing
      ARM: dts: allwinner: Add Orange Pi Zero Interface Board overlay

 arch/arm/boot/dts/allwinner/Makefile               |  7 ++++
 .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts  | 14 +++++++
 .../dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts | 14 +++++++
 .../sun8i-orangepi-zero-interface-board.dtso       | 46 ++++++++++++++++++++++
 4 files changed, 81 insertions(+)
---
base-commit: 29fdda97f8d5797b160aa8ad1c7248710bb8ffda
change-id: 20250417-opz-audio-890849c8bb2e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



