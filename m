Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6712BCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=; b=PDjr+KmZ6ONyVO0mf2gK170xXa
	udtyDpa5kbLMLknT3uh4Z0scWgXbIpQMuxJmTcb4jP3JraaDBQ7xISh4CuWdcJim1c8+5ae48C4UL
	tGdIhZAJIESYaDOheBRDAaa/8oTChSh5Y0ZA4rx5CorTgT80dY7xCsObTQo10DF7BCgN818MYdVfs
	WLm6hFiQdLJxYPMvkgr+2ieJKwL0Z4Z87qpeg+ygUPRiEvO1UEY4sEFtRj0cnBRoPra2UnsWNssUo
	1CqQ4o3e/sSPL+SfXX+8T37qpy/yVG0DCRnUkDHTd+1LK4hl8kK+D4rQuLv1Mybi4I0uqkhBmDJKh
	fnAIRz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGN-00000007QIp-1nUH;
	Wed, 24 Jun 2026 08:47:15 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGJ-00000007QFw-45I5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:47:13 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-37cae11ba85so591175a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290831; x=1782895631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=;
        b=gOdGCol9bk7qJr38+q2wFgker99RexbRl8MfrDdyLVoNoELMdYLSr/e0MD5fk3I81r
         sjLQfGpTv8nRiHT3Y/s+cADUiFI7N2yMl5GRkUrGkNbv5Hedfa9jPV3MUo8Vv0ZwKrqc
         JpBBuqeji0uIAgQQd2qdaXbmhpO6nrVExwTxJ7qm/Ii5+dKNzcfOXIjzkJXZsY3EMkI3
         D0ecD97sKRz5+DRK9CV0ra0wzjFvkE+cOqI8B2C7McxiT71UqCrL0LBYYcFMZowTSkmC
         Y3aKqbdXwyscQGsATZyxiRCsuDulX5EGdWK2dR8O/plzxqf9pygkMgSR/kbEqUjL2i7s
         Xeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290831; x=1782895631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LLcfgRgcRG6+Y1GgVHrol+2NxklkD2AbD5mhAFMMnog=;
        b=sTy2IimVDli0fAekKP7OAPSnRWZODvgshdD5rxClIdybW0vZNphg3R7tOF2NoN3o/Q
         QvGz0iOqXX7iQdqpiVPDoVShvVSPZYzEeI2yjQ1J9bE4a6Fk1E6zkOCiaG70AsnYLO7K
         CphgWigISOHQYzSyPv4T4CzrJ0+btuE/36bMmXBjklSdcdNgSswDsRBVGSJEkt5igVl9
         22BMncIcwduaxnUSAmlDQXX6tWI7wCdj1oLss4q/EQKpfULCWCtoG+RdgAbovFZmK5Iq
         jtH7pjgsqzscbgYZ85pRk4OtSKwI3Bp2bIRfqyDK5fyW/O7yIOLop/vOwzT1sN8KqSFm
         RO9w==
X-Forwarded-Encrypted: i=1; AHgh+Rrgs8PEg8kVjc04Dvv57tLcvdJUYqFvsUiHeBkM8rR7G0MRRcHpR7pixFR549RWlB/ozdmy3OXElw14NgW70m3F@lists.infradead.org
X-Gm-Message-State: AOJu0YxrgqkpwADX8ma5g6GMbYbqpaykWyyGtZIcyf+wkpUnkWtC19T1
	WsM9582tVfGIfz4JIWVF30vKCqPZMyNrmTCjhvoIYi6MZjOXQJI4Vd86
X-Gm-Gg: AfdE7ckgFrSm+3zffxhdK+S9vOEI5YGmyPx/htuzmbxHjWI2854DLsesUSyuAOuka6s
	DooEUm/2iPh4rPW9GnGQUDJYvFx2HOK+uoSzc9WQIfh/xFFpMve5D9tnlLh61ohdWVH9Ya25nyn
	3R6I/AgKAsY1ajDsSohg/NoZEX39WceZBPnIbJPAnvg5kKIKZNzUF6EpyiBpu0T0v2uad6FdAfk
	kK85ke9tDhT/NyEATnF2OcL5L8WnB0ffUft/7Se92nEgxYsC8Q5i7HY119zPpq1S/nYIjQI9UEE
	w9niSphKMj0xDUOuoUfuEOSVPUQnk7s+BqhQkiCnKxMNtpeJQJ/tBSf4l2qzYkrqj8Qmr15I+Sw
	au/J4SKvdl58B6qtwf8vAh5lpXsqMgHMdAXYFPg1UjXMkqyRTtGeHxEHwwH/uB0NVzPvqpTq697
	oICSjMzcO1SHAtUm05syNiRxlH
X-Received: by 2002:a17:90b:48d1:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37de428c345mr2433707a91.20.1782290831423;
        Wed, 24 Jun 2026 01:47:11 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:47:10 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:42 +0800
Subject: [PATCH 5/7] ARM: dts: rockchip: Add RV1126 GMAC refout clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-5-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1157;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=8EosIzzR7UzOFP/v55N37uL3TxX8W4lq/3WtMuwfnjU=;
 b=r1c6yrCwcpidwG3sbm7w7O+CAbkpEjmxfvytGLFSVdZDGbuxcpNNDG74XoG4SVu6zMjqBnqL6
 vaYbrNImRDfBTvTqOkFFkTzjjQ6aTtP18tsj4zv/DrAte13JPeV4nRW
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014712_024537_729D33E2 
X-CRM114-Status: GOOD (  12.14  )
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

This clock can be routed to an external Ethernet PHY as its reference
clock. Boards using this clock need the clock to be described so the
dwmac-rk driver can acquire and keep it enabled.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 arch/arm/boot/dts/rockchip/rv1126.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rv1126.dtsi b/arch/arm/boot/dts/rockchip/rv1126.dtsi
index d6e8b63daa42..5b1ee06dc035 100644
--- a/arch/arm/boot/dts/rockchip/rv1126.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1126.dtsi
@@ -624,10 +624,11 @@ gmac: ethernet@ffc40000 {
 		rockchip,grf = <&grf>;
 		clocks = <&cru CLK_GMAC_SRC>, <&cru CLK_GMAC_TX_RX>,
 			 <&cru CLK_GMAC_TX_RX>, <&cru CLK_GMAC_REF>,
+			 <&cru CLK_GMAC_ETHERNET_OUT>,
 			 <&cru ACLK_GMAC>, <&cru PCLK_GMAC>,
 			 <&cru CLK_GMAC_TX_RX>, <&cru CLK_GMAC_PTPREF>;
 		clock-names = "stmmaceth", "mac_clk_rx",
-			      "mac_clk_tx", "clk_mac_ref",
+			      "mac_clk_tx", "clk_mac_ref", "clk_mac_refout",
 			      "aclk_mac", "pclk_mac",
 			      "clk_mac_speed", "ptp_ref";
 		resets = <&cru SRST_GMAC_A>;

-- 
2.54.0


