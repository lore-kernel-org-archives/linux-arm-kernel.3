Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A47DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ubB7siXj+yGdX4xCeKMf4Md2ck8+o3fK/J82vesH3s=; b=hxqip+AxY6i7O3vDQ9mOMXKv3o
	cRtIM/34u7triQz7mUtflCKxjW6iklo7C/8my5+RJnzfgy189rJ7dkA3oHDAsaGYdLwHB5rC3aLSw
	9U6+4sVMEmQykqjPSmhcJXeZJRlv/WvIPvkltxLSfeloa/X5BjESB6cgHz1Remm4u8aCJhsnBq5DS
	ScT4vzHfmMMCGy2ncROsJyFiCaVBsy6/sOlu1/SKu/3ouMyn3Si6LW8COOUrO+mEqO9bgaL+5z7su
	QecK+kDhW6DMNNjcRO9G6uf/DmoXMF902mIsUpa6jEuKFm1Sp7Z9eUgoi/ln9D7Ihw1bKdSRkvF5U
	wye0gvCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuDN-0000000DQtg-3XE4;
	Mon, 04 May 2026 14:24:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuDK-0000000DQqc-3d1y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777904642; x=1809440642;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=aEVxBzQijPj9PRsFyC76Lsq/Pj8h04R9UN1sWdxuvLM=;
  b=BQ2VxAPgKkbzQ8qSiGqiBIJ6MpS4tC3NiiAF1hq2o+GgzynuT+OjE7YK
   b8ECdNBT4CUah7PPln0o61uhgHajoN6U7brsWcCry5+AeCB98kHjr3YHw
   /Z54mqyBjFrT9jC5HcQM7IJ8XOlyzIcFvqPr9WZTLKmy84gCx2zu9Su6y
   jlbTDvdvvYQi8THZ2DEN3kXxzdy59iiL3dr+vtDoD0dnCGhruosd5LreV
   zI+3tyVk4IfbeBkbfxOm0DlospVB3j8oqpYxtXIXf306LDNQMOergZZNS
   hj33cSnRjfzzWboGKI23AjxPdl4/3fcQOd3SH2v127owJYhaaBMk5xVf3
   A==;
X-CSE-ConnectionGUID: hACnvN32QBaW+0zejO9F1Q==
X-CSE-MsgGUID: euxtG5IaTue3umCyfPHN0w==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="57408616"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 May 2026 07:24:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 4 May 2026 07:24:01 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:23:58 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 4 May 2026 16:23:20 +0200
Subject: [PATCH net-next v3 07/13] net: lan966x: clear FDMA interrupt
 stickies after switch reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260504-lan966x-pci-fdma-v3-7-a56f5740d870@microchip.com>
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
X-CRM114-CacheID: sfid-20260504_072402_970505_38EE0B87 
X-CRM114-Status: GOOD (  14.34  )
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

When in PCI mode, the GCB soft reset issued by the reset controller
can latch spurious bits in the FDMA error stickies. The latched bits
sit in FDMA_INTR_ERR until the FDMA IRQ is requested later in probe,
at which point the handler fires immediately and WARNs.

Clear FDMA_ERRORS, FDMA_INTR_ERR and FDMA_INTR_DB right after the
switch reset so the FDMA comes out clean and the IRQ handler does not
see ghost errors on probe.

The clear runs on both the PCI and platform paths. On the platform
path it has no effect — there are no spurious stickies to clear — but
keeping it unconditional avoids a PCI-specific code path here.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index 9f69634ebb0a..b3701953b090 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -1064,6 +1064,15 @@ static int lan966x_reset_switch(struct lan966x *lan966x)
 
 	reset_control_reset(switch_reset);
 
+	/* When in PCI mode, the GCB soft reset issued by the reset
+	 * controller can latch spurious bits in the FDMA error stickies.
+	 * Clear them before request_irq hooks up the FDMA IRQ line,
+	 * otherwise the handler fires immediately on probe.
+	 */
+	lan_wr(lan_rd(lan966x, FDMA_ERRORS),   lan966x, FDMA_ERRORS);
+	lan_wr(lan_rd(lan966x, FDMA_INTR_ERR), lan966x, FDMA_INTR_ERR);
+	lan_wr(lan_rd(lan966x, FDMA_INTR_DB),  lan966x, FDMA_INTR_DB);
+
 	/* Don't reinitialize the switch core, if it is already initialized. In
 	 * case it is initialized twice, some pointers inside the queue system
 	 * in HW will get corrupted and then after a while the queue system gets

-- 
2.34.1


