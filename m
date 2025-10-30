Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD13CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEZFS4oLzG/srptDoN54vEJHXHS1Iew+xlKYXMZp3q0=; b=iHHWfOU3piltcebQYaiZs1LpgO
	LmL/Ra884peL4Dofx+yS/y4LebWGY/w4xWxVxPbl3S4rIL6KC+PNSICMzWKRH+2ZVI2NR5tM7dYYT
	EQ0+5xUKZUEDHHSQiafABZf98zZt45Zc2DjONqMZOCjwly4jLpfRafsZN0bUZwSjk4NZThx9YLB59
	zuUER52c17D0zNdUF1nSVYigsmJksd+QpEIluN+rdbNOuhH4HA6HiINEUWQYpla7b0kc/PUETz56M
	nvnT7XJ3SMz7StH9uV91NNTkPAogdjinlmC1ooGmFzEgrvUAUxrdWnbRS+oCT3f7RS8M2MtXfYC6U
	mJ5L8FtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6a-00000004FUc-1p8A;
	Thu, 30 Oct 2025 13:54:20 +0000
Received: from mx-relay100-hz2.antispameurope.com ([94.100.136.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6E-00000004FGb-0zDl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:59 +0000
ARC-Authentication-Results: i=1; mx-gate100-hz2.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KEZFS4oLzG/srptDoN54vEJHXHS1Iew+xlKYXMZp3q0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832426;
 b=W69+/q1ONlmEJL3KQ7Ec5eH64Qx6ctPVw+X9AawQNaMtSH2kNgeyCLIKyPosmwADfpe41QWi
 +d0dSb8xkzNs9v6LELHl84QrS4+tyyJXio4pHSB4CGbRA3Ada3zwK5ttFtm8xAe04EVOMIfCQyh
 WztxKErV3f9S4GU1cmhlqv6aiJ0Sv3SVYu4dtpC7Vvl5nbZnaGZXdENA6HyWb7yrHplWhbj7Eh8
 yXnsXzhThkX88XP2dujwrbqV7P1mgvcxKK1rv2X6bOXriHZgFZmkb5C3LI7HVE846jWqGF+ehFZ
 IF4RlN4W+SqNjNsNWy8yqBJHdkNLRDgR+vW57765NS9XA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832426;
 b=Wkesm/KVtbYtBgxlp/GiLspCn6P68P7nLyii2vFS6jXn9Jg1wxD1pcKUfP2pmK3JwdqfW5uM
 GBHakIFndxgnIKUGdB16H5mZScuip+WnbdGFik3TOxVUCkgat0W+iCyzPvNgMPV/VL+QLF6+kf3
 QkTkegJJmx/Q8HaklOls9SXRqB3aGWRppnVcXTbg3HRau2Zi2fjj1Y2Cv7lJzDjmSZryc5c0+L6
 UseHtbPldwhi7RVQwtw7sfFOg4MJdBzWWsHGy77p8acy1E3jsOtHIOjQuN8IuE6iPFSZY7ttWGn
 pKEir9nevAvPmhlf3PukEAecMBWwJwJwLW4NKpt3hcE5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay100-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:46 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5CA0B5A0E73;
	Thu, 30 Oct 2025 14:53:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI
Date: Thu, 30 Oct 2025 14:53:01 +0100
Message-ID: <20251030135306.1421154-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
 <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with 4cy5DW3sFkz3PJ21
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: a7bf318555c57f949278cf3d40d2a7cb
X-cloud-security: scantime:2.336
DKIM-Signature: a=rsa-sha256;
 bh=KEZFS4oLzG/srptDoN54vEJHXHS1Iew+xlKYXMZp3q0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832425; v=1;
 b=ZzHG8vr3U+Ed2MJPkqW/Jp52UntTXVRNVew3HEIvSn9mrmcbzULMpeCGxGPjYyaWmk2Q9PJo
 y+GUw19F/zT0xEVio2V8rCo/A9fLR3LpRwtiQ9ftQf3DTArimGf1yQTgsay0uGwRiUq2cdOaSTx
 VBD6Qgt8B0wxgMGLfkm3Kl7Vcx/l7r5yg+t3vUqsuLVkcFWAA6T4fuUvT29P2b2Z8wFA40rcKtG
 OcbCOlgxI8FX0MFLqgKbscauwHBw/BerwICbIw+zeNLVifpca50dDWVGbSSugXOQFKmzoQFfe9f
 SD+YgSScFMguRlydsVmDY7VT/0v8D/T/di93rgmqDAkFQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065358_446053_91333613 
X-CRM114-Status: GOOD (  11.37  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add missing alias for SPI controllers.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index d3a9360b8c548..97726eded0f86 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -39,6 +39,8 @@ aliases {
 		serial5 = &lpuart6;
 		serial6 = &lpuart7;
 		serial7 = &lpuart8;
+		spi0 = &flexspi1;
+		spi1 = &lpspi3;
 	};
 
 	chosen {
-- 
2.43.0


