Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEC7CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oWMn64nYBWSIvUnLnrokvGf+sjSPmoshxyBWnGTXZ/E=; b=E2w3Exc8Ebfm32tUb+qOB8rF+K
	I8pA7efzMUih4TbmbYZ7bcpoBdiBa/68EvxVfmkVzNfzfudueoaXOJAtyOlHe2ivXYwhIfe037ZXb
	BImPin3VRenJ9B4lMrhsW6JBly/cdQ+2PC4MzV5jASwp/+W+8R6W1zKbfURwRaClfoPxx0JFjcDxm
	edneCAQk6Jp+92udmAIWvMrV2jJvRgiKFqwqFPHP2OPDcxW6Fv7asn4+kulSVjjzbdTay6OesOE7y
	70TpdqeEjveZI4Lkovjag6gBEFMwLVmvuDUXwWRbWL+5U5jivpRiW91mnXDb5mv+nyxbb2iZh0a6J
	GsyAB3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6dg-0000000Gfge-3rAk;
	Thu, 04 Jun 2026 11:53:32 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6dd-0000000GffJ-1syQ;
	Thu, 04 Jun 2026 11:53:30 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=oWMn64nYBWSIvUnLnrokvGf+sjSPmoshxyBWnGTXZ/E=;
	b=EM/tXpU1wlQHYFGsc/bUXmHgoo59oVfIKpgMEhB4dC3NlM3mPBkClH2fl95cIFZItsMAMGoZKnacPbFGf73FHd2Np1JvjyOHu3qraYCA+4GCPpXhfNYXc1YCW/ckbq9DhzJucu1OI3m+oJHfUqgejF//Z7oWi3SEHVnV5hLVGVw=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Thu, 4 Jun 2026 13:53:06 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/3] Add support for NetCube Systems OpenNMC (dobermann)
Date: Thu,  4 Jun 2026 13:52:31 +0200
Message-ID: <20260604115241.1358528-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_045329_798195_B2DDB9E5 
X-CRM114-Status: UNSURE (   8.63  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds support for the NetCube Systems OpenNMC

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (3):
  dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
  riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCube
    Systems OpenNMC
  ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)

 .../devicetree/bindings/arm/sunxi.yaml        |   1 +
 .../sun8i-t113s-netcube-dobermann.dts         | 149 ++++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |   6 +
 3 files changed, 156 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

-- 
2.47.3



