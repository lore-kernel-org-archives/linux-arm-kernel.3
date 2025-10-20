Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8716CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh4C9N1Ju5JAAtnjcdgue8CazsWnd2rnlhBAUlc6beo=; b=Vr5colKwyRcukVDkViW4KBBRu6
	WiR6FlLRC55plZ14OdG62zB5hy5vPv+KWyo5TZ7YD08i6fZbHvlxO4M9iV11PCIgN0CBH5KdgOKHi
	1T2bVMqX8pZ3N5awbHeX17XD9XYKtBiKPSrX4HXuxkEaI0Ojfat81d1ntLIJQtOsyUlwCcx1fp/Yo
	lKuHhxBxHUkMVmfnt1vUqzVO5W+yyQATthi+Ag+HGTr7/pV7sb3M++UvJmqzypOm4AQZ8wdOwjBSo
	cCTbFIixYwcFvAUAo8OQ3p9+WYS6Y0U7g7skylfVGGc/4DCAwX6piatWD7v2PZOQlrrrrWB3g13ze
	BpJicqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnns-0000000D172-2NGf;
	Mon, 20 Oct 2025 11:11:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnnl-0000000D0zH-45EM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:11:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso31510015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 04:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760958704; x=1761563504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mh4C9N1Ju5JAAtnjcdgue8CazsWnd2rnlhBAUlc6beo=;
        b=aS0p5qBsKnHkZAGTldnau4Q+ADs7y9wWBPfB1QKWoGdzxIn+P8KeqA8t1Kd7ZDnGmE
         TrYXz0oGNHJk4hjA0hOF53fFL9jgS2g5ulaveSF7HXen3GEvGimHrE299vNpZyTWBWHp
         WRKkyLWGKPURYDCnBPOdyNGmTeezS5kGlonSDK4COk5zWce68q9bBR2yqDwgDI3pwZN/
         Elk4ip4I81w0IVHbbInz1BvGA8SdfIj165mL/RLV2U8/3HDbOO+bnDpIZ2VJhJdUYyv3
         fTQqi+6QTd3Dwys5cRRu4Ul8xcF5LlYHSLbjQIfXyNVB3FJr3i46mND0IqKiqwR5yleD
         jRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760958704; x=1761563504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mh4C9N1Ju5JAAtnjcdgue8CazsWnd2rnlhBAUlc6beo=;
        b=LxO5qfq58M0ooVk/AvGlqlP6tu/B+n15B2sAANUXgBVuvl3MKhT0pZ1j3zCnhbUMnM
         Fju5qVmyZbJKVemXejinh9TxrgAItwsVUwEnhfI+WSbmn/oOO8bHIGua+z2Di79Ep1u7
         7ocXy+NMtJgNgjx4yP1aN76aqIaC2fXvtfYzxo9eFIhVHOvrqboUCqjL9YHQ6AzEWykS
         a12y481Tz1Lzfuo73sbI2S9SlPF7V4eecPm3pA0dAGLaGsSxFLOSXoLTGjMOfE6MdGzg
         cIMMjnS3DME4veeXL5IiFMLyae/fgMz+XkSFpCwa5CRfAQtsAAPNSOfnVjEBQM7hNvBT
         /qCw==
X-Forwarded-Encrypted: i=1; AJvYcCVfFglBR2ctIYqA5JBMaqnDE8awo+Ivf3uBdyGroosFX3TMOWJpDEt3/p1fbTqypoIoGmm55+8jNsFBrZwC4xy6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgmwo/QxTRUzmhYq+G/e61TtcveTdqFMP6GgJL+9kIi0afeEnU
	GEVSR8auHL8+eeniyRk+1uYpARC9mfodrpJyHq31aHmp7a0WEhfPobQK
X-Gm-Gg: ASbGnctlDnsWrgVyYGla+sXDe1qmcZ7jvtHFIGZI5eL+tm0YawHUekruyfxJQWOn1T6
	iOjKYsIxZaeMm2/wb6ksyXim8FD34Nb0uLOqyHWUNx2jI+rWF/5kGc7LTcAVLQTIcqGWnN2FAox
	bHHrxnoTeA6Pc+kBMNvBNoLE9UXkwYodaVyYFdWAeK4PdJLX1hIheXZ/roU+pTTzWsP3rEmS6jg
	UNr46o67FViCDvuG6Kjffw7MWjDIILGRAvOsD2/E776J7OPRQdbgKBk7m0oBRkTimZpUZG5xTU2
	b5zo9ZbzEhQiXsOSpQIT+ocliRN6cNnCUwE2/P5MPti0x6E19Uemcpwodn36x+BZj+VY9CU/IW2
	nc7sss6tVODUj9z/Y0OvuQS0mvwhxO+2KfXDkjrj94a3S4wfD6EcOPDMyLljjnQ6XgyZ1P87jCn
	rHhblIXIyXtEJ/MwKha4Qiadcl6ieKVvD5jIfhPhFMbJc=
X-Google-Smtp-Source: AGHT+IEC/EgoEzWLSutjjbvP1mXzMKOilW3J4zLO71+sEvQNi3rD9SLIUZ1bssHJ/V0ea3felgXDhA==
X-Received: by 2002:a05:600c:1e06:b0:46f:b43a:aeee with SMTP id 5b1f17b1804b1-4711792089emr93643585e9.39.1760958704255;
        Mon, 20 Oct 2025 04:11:44 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4283e7804f4sm12692219f8f.10.2025.10.20.04.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 04:11:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v6 4/5] PCI: mediatek: Use generic MACRO for TPVPERL delay
Date: Mon, 20 Oct 2025 13:11:08 +0200
Message-ID: <20251020111121.31779-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020111121.31779-1-ansuelsmth@gmail.com>
References: <20251020111121.31779-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_041146_052008_BBF37EC9 
X-CRM114-Status: GOOD (  12.93  )
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

Use the generic PCIe MACRO for TPVPERL delay to wait for clock and power
stabilization after PERST# Signal instead of the raw value of 100 ms.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index cbffa3156da1..313da61a0b8a 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -697,12 +697,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	 */
 	writel(PCIE_LINKDOWN_RST_EN, port->base + PCIE_RST_CTRL);
 
-	/*
-	 * Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
-	 * 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
-	 * be delayed 100ms (TPVPERL) for the power and clock to become stable.
-	 */
-	msleep(100);
+	msleep(PCIE_T_PVPERL_MS);
 
 	/* De-assert PHY, PE, PIPE, MAC and configuration reset	*/
 	val = readl(port->base + PCIE_RST_CTRL);
-- 
2.51.0


