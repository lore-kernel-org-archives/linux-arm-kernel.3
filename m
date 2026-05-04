Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2D5FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrfOFVYtqSA4RPeMk5t0kgZgaYsp66JgGoi+frkDnGY=; b=0r9CsfRWrVQUveViQgsLZ4BPwk
	PQKOhJcUhivVySxbzJTri6JB4BYTs0rsJhXx10O7QtZUjNpNvOgY5MP/MAOZDLjlRKvjsP22wO6bU
	Rs07+w1K/YCO/BEDF5dObgaDEc0crg568C1OAu4a3DCtoBdH2dVdwiGkfmqY1Oc/oCm39KO24ywog
	1OlC+CI0Yn3hzQdSY6pIDPs30usG0MyljsGZShyA5OtuZUO1OMC6pumk49949YSfezm4fWx3EOH8u
	mpEuwGmcxaiuvwsY96uktmnHeO663Om/kZtu8R9uCtz+q89f5f2yjBH2XOf/2eBJDfSNuGDLKeJc7
	bs5ppvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuDf-0000000DREr-2vl6;
	Mon, 04 May 2026 14:24:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuDd-0000000DRBj-3jcX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777904662; x=1809440662;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pLLUnpsQHk0XLLoB+wBplrU8A7WIjOzUca/wCfOw6mw=;
  b=qHFTnYeVaIGuAqoQ3CVqhcwu/J886V3R5/cP8YjM6l9PNETMsLYAPu7W
   JnpjBPdg8OQ3Qn61Hzwb55hm7uo3WbJDrK2t6/P5ddqVkzALPdIgSUtHm
   KHVHPwSmah/BXGPfJuXxDDTHh4aW5/q/6mzsTimGtikW8M4GjaC7PNxmm
   vZMb1ZA6ObFvFBpSlSVeTrJq+WWFFvANx4h25uTGvYf5uqMFVW9vB2KU+
   DheAmXtPw6Kx5dhXOIS5zzfZVIt+Q/tvc13V6F9NAu8oJh0KbjHbnE5dQ
   vmlMuOxPlK/9skOicP3yJeK2ZZG8/8zX9SiF9Tt0v94Z7xXiBsnSND+vV
   w==;
X-CSE-ConnectionGUID: XLVlPWwuROO42O1GHZXvZA==
X-CSE-MsgGUID: QYF/9F5KSwOcNVPsd9exow==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="57408637"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:24:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 4 May 2026 07:24:20 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:24:17 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 4 May 2026 16:23:25 +0200
Subject: [PATCH net-next v3 12/13] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260504-lan966x-pci-fdma-v3-12-a56f5740d870@microchip.com>
References: <20260504-lan966x-pci-fdma-v3-0-a56f5740d870@microchip.com>
In-Reply-To: <20260504-lan966x-pci-fdma-v3-0-a56f5740d870@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_072422_036968_5C69FF32 
X-CRM114-Status: GOOD (  11.66  )
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

The ATU outbound windows used by the FDMA engine are programmed through
registers at offset 0x400000+, which falls outside the current cpu reg
mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
to cover the full PCIE DBI and iATU register space.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/misc/lan966x_pci.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7b196b0a0eb6..7bb726550caf 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
 
 				switch: switch@e0000000 {
 					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
+					reg = <0xe0000000 0x0800000>,
 					      <0xe2000000 0x0800000>;
 					reg-names = "cpu", "gcb";
 

-- 
2.34.1


