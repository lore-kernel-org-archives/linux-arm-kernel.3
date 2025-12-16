Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B660ED5E154
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzb3UHTZF0/ujf3fl4j4CQVM2Zy+EWDlaYGx3MSb/lw=; b=spU+kFgTBjpECBC3emuQZAjQ7R
	g2f/WkjjZ7iIIq3u6VPRhFCcxrywK2jD4s08Qfd/4YW/qO18E66wdFAbMrjH/XDdtnlJYEiDoEG3b
	QIwJRstERfg1ldbSbUEw9RO59ZLjY/jEIs9BANW2mTRSWTi/r86qlZn1dcNIcNriOoo5Lf9pfIPzs
	XXmEAWXG/i8Nu8/c2NFm2KIX7eyUXLvEZgYprmml4fXdlTFSIIQ6csEG0ldjt2fF95763lrxH3/HW
	I5XBpskLAG8/iu/GH8KT2/vHWdlMURxKqlBMtxAYNnbSTLik+Num67tB1HMGF7nt8TWajcTrSZdOu
	qCf/1OhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9e-00000005GDx-3RkR;
	Tue, 16 Dec 2025 13:31:54 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9R-00000005G9W-3LBu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:31:46 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=qzb3UHTZF0/ujf3fl4j4CQVM2Zy+EWDlaYGx3MSb/lw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891889;
 b=Pqh6g9OmNweprCD/0blXyJQ2BNypErmT68HDUQ0EbJ1goeRJ0OisndROpctmsh/+BWIFkfUT
 3smw1q5BHGBukYO/reLNRJDIj+xdGCKpl2oEMBPV7fCNRs0ScW0fKE2hY9CJrgk1grNHaSCGLSU
 dXyW8KZdZt5h3/OqoL2f9ZCBUikE5yxT6bx1j4/uNhKiXAI5ijw+8biISEJcPHen6DWLVhabxVx
 3NVh0vUnqALBEiSA1+epni6pR/Bf4zbEZ3Do0rfZqHJFwUssfFqPNdjd73tq3njW/h6ZZFurDkE
 zY6h8l4EgIw1UauMAvRaXgllZyou5oIXpvL1j4PgBe3og==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891889;
 b=rvHuGW8rM33KqgO34U+zKrh969m3m7qREdhEiaY0cbsADmXAJhT20UkMTw8HGoAsr2dYNRYG
 h3tXQ7G1UVaxLRLSH152toKWi/TDzYChERQNDt655nANvUugapl5PxdD/v/KAzKVyrDYRZKUH21
 ji9J8UZk+kO75WGugmrAP4q0z/ioaS8mt/U/Iia/EL1u3M/b1hjvAIMQRSJBvtFd4M2ixnuyMp2
 udBF83rCVGgkcRUTCSgTosZuU1wl17U2OKb0DYPK2tCeo13RUgUy+0V30/dBsv0Cjswopa0EK2S
 K7vuJcrqM+CYSW4j5giEUC6lcGR4QtLHNMvOS/z9RBAvQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:31:29 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC5495A0C27;
	Tue, 16 Dec 2025 14:31:14 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/4] arm64: dts: imx8mm-tqma8mqml: remove superfluous line
Date: Tue, 16 Dec 2025 14:31:06 +0100
Message-ID: <20251216133110.905950-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dVyW75Qsrz1kNh4p
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 69d42c27ce551e48e93b8a3b97d7664d
X-cloud-security: scantime:1.976
DKIM-Signature: a=rsa-sha256;
 bh=qzb3UHTZF0/ujf3fl4j4CQVM2Zy+EWDlaYGx3MSb/lw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891889; v=1;
 b=cHXTm1MNsv/NdPEOtHmC6aImYvK+JYZhH9OVHyRn4T6yp8ze1BVyvICq7HVNG/tRuou996QL
 Orr0IwnTH6SxHgGnYsTgRHjqS96DtO0Q1k5+w8EUplSCG537gBvqcBEKTDg33MpEraAGxT/BA5e
 tmXg7pFOENP1iS1WsYU5lslITBrW0Sv5QBMP0EFJBFAKve0D/j9X6N3zpaWv8K/WNlejhGsTHSR
 WsS8Csa+RBzZafK9zN1dhHw+sAOGFFt991KnZ0IdkW9WJWBg8Pk9MqOg4vQcfw6PFqFdtSqO9mG
 4jQGRb8YKM2l2mMlPm7XkQGQ4t1yxDONSukclbzBRMV/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053143_902863_9DAD4171 
X-CRM114-Status: GOOD (  10.26  )
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

Remove one empty line that is not needed.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 6e63cf8beadcd..2e3860a5f4fd2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -195,7 +195,6 @@ ldo5_reg: LDO5 {
 		};
 	};
 
-
 	pcf85063: rtc@51 {
 		compatible = "nxp,pcf85063a";
 		reg = <0x51>;
-- 
2.43.0


