Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FBF30939
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9XnppO8FMkdczsYyKMwQiqpcLf9DtxGsFU5Qaw3s9w=; b=D18h/FEJLfOLlZ3GOQmcRVojMM
	HHc01YrixJdVZY/2I7c0h9go5hzlCGT9bu5MiRelz+3dRz48k5uBbowI8snG+hdkRaYaumpUxmMad
	syGmvzLohKAkZmgaNYyWaMjAuqkUl/BK4ny3k4enTJJwRnnXVYMp+8BwlhMczslYTzUbLymhtG9OS
	fGF/WYq8sN6Nrm5+5gIrxa/et4sTyQ+SuIE9UnyAMINeFwI4MmMvDuRTPVOQHCB7AMQcy3uyXtBUu
	O5G1ELgMmQRDCwKImGCdEMNgJf397GHPaB4U3lFhk9vMN9NdWblH338Qlz7YnftWtnfD8lkIxmxZh
	+jScPMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6bj-00000001eyZ-1Tjp;
	Thu, 05 Mar 2026 11:11:07 +0000
Received: from mx-relay49-hz1.antispameurope.com ([94.100.132.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy6be-00000001exK-3neO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 11:11:05 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=N9XnppO8FMkdczsYyKMwQiqpcLf9DtxGsFU5Qaw3s9w=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772709056;
 b=iSBS7Ia6ZIumXgrdSQqqK7dFhLDfCPCsFJ/Bj8XF+toa80NIiM4YQ6mLNmO/tS0JfhnDdiTF
 JWlHLXLzWdRlgNbGKZJTtQQFTerW9gONSQ8xxSANETtnPLyJZAWpk6FrIIAtl0H3AfZcq16Fr9A
 AoNSL71dOTB3Oea5B00DJE3OXwe9emweiH7fnj0oO96XbC+4Tlz0yHmKTk0vSljPX3RsvVK1vMO
 9kek4KlmJChtMlCGkmXerS+ENPwfNZB000R8MzUoYmC3vCr3y/hkBopUFeycTLtS2eb1vfKGDKh
 0HmqpxsHmw4i/2V61oQgVuYGqQgXi0GmbB6QTUVDBrCNw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772709056;
 b=pBH6XqxxCgXNnbLoS4QrW9ewVrpgWv/02z5RQW8Dy3p3OX0BUoa6HZWUFpocSGKK6sdpGCMa
 eFVdZXhpLRY4QL0oQ1eGPq28bKZWjPPnPsgAwjFjTUzVhHctXskMMQ6v8Yvlv8PqfdWYp1AZBjm
 AyZ7xCaFpr5cDomW7d3rqnQYb/BYrcRkqaQH02uAoOH6oZbiQcyc72vhE6Tqlln+BnOcc1fOyxs
 MKHTfBFXkPy/85m4REm6A5De07nh31JcRRVwaHpoNedT+JvcrHo91kswlZnNxCglodAm8rAwxe4
 zYIx8NeE7NfmTeIpgTPIC5ajpt3k9q53/jJSZeXtFX23Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz1.antispameurope.com;
 Thu, 05 Mar 2026 12:10:56 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0EAABA40906;
	Thu,  5 Mar 2026 12:10:44 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: tqma9352-mba91xxca: Fix Ethernet PHY IRQ support
Date: Thu,  5 Mar 2026 12:10:37 +0100
Message-ID: <20260305111040.1899965-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
References: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz1.antispameurope.com with 4fRRfX5Cr3z28hdF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: d2d564208654f80f3876e3d2097a5623
X-cloud-security: scantime:1.415
DKIM-Signature: a=rsa-sha256;
 bh=N9XnppO8FMkdczsYyKMwQiqpcLf9DtxGsFU5Qaw3s9w=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772709055; v=1;
 b=TW2hkwldvQecXO6B2h+CDWyT0aTqOTq9dykbevIvH3xgRNKc05vM9wfmwIBY6m5tf8tx3L+o
 vUMpxhhzQTSAGoy2QuTw0jfzWaMv5DOPaw/xn/gWMcrC8hJ42+QhDRVbEGjdwNsEu8FAQCBJCMi
 TD15vsuqE0UZEuYTd0QLXGDohc4Y09P+inmy5A0kyipheyKz5n7P6bidk+ZmKh9OVUjhZgCh7b9
 ESNvd7jvpA79O2UCb5b3DMaJquhtXnlCNQiVdHktI0iolbkvJRmZzo9u8BXac4PTH8EjEMvnomu
 fkzCB6J2//dfKQJN+2VFDelDRAMF8dJcFGaRgA1X+rS6Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_031103_082325_74792057 
X-CRM114-Status: GOOD (  12.69  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
index 2673d9dccbf4b..737326ba1b2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
@@ -232,7 +232,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -265,7 +265,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
-- 
2.43.0


