Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7FD35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l0q4mDPNZn9d2zngjDTeDMoVQBeBADZn5IY9XJjSkRU=; b=ZAKNc7yjGH6VPpp1UC+6X5wmHm
	nhFjDsGQYKjeMhx437Hw2aNLNz2UN+bJfvDcJnCPUh1hg1gpuZkvnAGlOWx33y0XRGBbLGr0GjpSW
	fSlRfA6n0/SCYQOiCrBZKUSEdurZYMIZSM+BGT1s/yimBpYEPIkWPlSU8GYolxdC47pHups8J0Wx3
	NMudzZrCGA2xgNO9ItZriEcllloVe0kBHp/Lm/0JHOkyWnaOnkGRxhTW4M8atJcwZEK4JMpSHVW51
	KcDlzOUMku+rmgrrbRDabRehvv30hs0mytuKwUWKl9Jfo9k6cJGloOGU/3FbBnVZrMW2yWTxi1yBq
	GFAqcc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7upn-0000000FCeZ-05Ht;
	Wed, 01 Apr 2026 12:38:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ueC-0000000F3pf-1Ajw;
	Wed, 01 Apr 2026 12:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=l0q4mDPNZn9d2zngjDTeDMoVQBeBADZn5IY9XJjSkRU=; b=iEGHgMgeYqPh0A64moQzGLm9TN
	DCzmKsewhjd+Hku2KIjdTMNjrNMFSe3fbF2LxKXyWbjiBIgEOYn/AlNr1NCCjVYxzwGJ66Yn9TECj
	ZDogHalWRZRsS/SxjKCZDnTQLm0crOP1dakikYEj3gckcAeBaq6HqPMWbDHU9/2JjGp/+96EMeetW
	PPfEuLvOxkG2VutOJZiqzcvcZSMF3a1VseRq66w9LFuN+g1FFZ/eN0AeoUZ0D8LFwFVEVJ0y7BGCz
	+btObLj+odMZzo3FayecUmY8IpNK6vcnYOKA+SrAklfVfYfMkp1ohOddHwzg6+eoe0DidMvfkJOBj
	40dttiCw==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ue7-00000000Ktq-1NUp;
	Wed, 01 Apr 2026 12:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=l0q4mDPNZn9d2zngjDTeDMoVQBeBADZn5IY9XJjSkRU=; b=Voah0Piiz36h8FePLR/6Apla9L
	94vZXyylBhu3oMrpPw+a+M6YSjVWi7/ls26IleNSIgkTg0Jt821RJg9voO/mWuj8z5ZEjrKr+WsLp
	/qieh7YXXxuCbBrhWDrAWJM+Wj2mMiCxFC3PzciBOF6iFhzAGjXDkgT9jOFgB+Zwf9tFKv/dAEJLV
	oQ12t9MB6tJZBUMUb6MTlJVxzbayjES0Yx1d/by0nrpU+OUxe+mEEQtbq/4+elbj9nP+H8V/ftVTh
	eUz8zzrGRBgg2/VY5eDFYvUo9sr9+vkXdv6iOpE34p38j/PrTFTAlNQYKQ+ZXvMNYBpL43xmy68cb
	FKmJOEpw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue2-000IQS-1Z;
	Wed, 01 Apr 2026 14:26:02 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7ue1-00089b-38;
	Wed, 01 Apr 2026 14:26:01 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v3 0/5] J722S SGMII support
Date: Wed,  1 Apr 2026 14:25:20 +0200
Message-ID: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_132607_506247_CC0C56B6 
X-CRM114-Status: GOOD (  12.06  )
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

The J722S CPSW and SERDES are very similar to the variants found on the
AM64, but they additionally support SGMII. Introduce new compatible
strings for the J722S to add this support to the drivers.

This is a prerequisite for the Single-Pair Ethernet interface of the
TQ-Systems MBa67xx baseboard for the TQMa67xx SoM, which will be
submitted separately.

For SGMII to actually work on the J722S, the am65-cpsw needs to be extended
as well, which has been submitted for net-next:
https://patchwork.kernel.org/project/netdevbpf/list/?series=1075806

Fallback compatible strings allow for the patches to be applied in any
order and to go through different trees without breaking existing
functionality.

v3:
- Drop am65-cpsw changes from this series, they need to go through net-next
- Fix missing PHY_GMII_SEL_RGMII_ID_MODE and PHY_GMII_SEL_FIXED_TX_DELAY in
  gmii-sel driver for RGMII delay mode configuration

v2:
- Keep support for the AM64 compatible strings as a fallback, adjust commit
  messages
- Drop reference to AM64_CPSW_QUIRK_CUT_THRU flag, which only exists in the
  TI vendor kernel

Nora Schiffer (5):
  dt-bindings: phy: ti: phy-j721e-wiz: Add ti,j722s-wiz-10g compatible
  dt-bindings: phy: ti: phy-gmii-sel: Add ti,j722s-phy-gmii-sel
    compatible
  phy: ti: phy-j721e-wiz: add support for J722S SoC family
  phy: ti: gmii-sel: add support for J722S SoC family
  arm64: dts: ti: k3-j722s-main: use J722S compatibles for WIZ, gmii-sel
    and CPSW3G

 .../bindings/phy/ti,phy-gmii-sel.yaml         | 24 ++++++++++++-------
 .../bindings/phy/ti,phy-j721e-wiz.yaml        | 20 ++++++++++------
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 12 ++++++++--
 drivers/phy/ti/phy-gmii-sel.c                 | 13 ++++++++++
 drivers/phy/ti/phy-j721e-wiz.c                | 24 +++++++++++++++++++
 5 files changed, 75 insertions(+), 18 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

