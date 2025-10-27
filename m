Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B090DCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=87X5R6vjtDdJY60KYPFY+Q7PYLNtQIh/pXfTLhBqd68=; b=dE6BC7baTKLrDVJeAJ1kN4porR
	ttNQ1qs2U75Rlu4ovme+IxZzDJ7uIPQZB9uoOTKCbGwpHGOUsYxt8vRc/e37CBmJA73sIkbvyba52
	L2tbqotmf/C8ivQ/Ef/ahhnqptw5conBhBtfBUigEuc4s7jJCbyRm2qnuAmh9iluTU2nopFaqtLHi
	xv9yAYOsZv+wmo4w46G/8+IcI5PrVZXGPZTGFXHyFSYJhIqpTL3JTaejrU+s+gLrNysItb+k9EECR
	T+Eb0+EcDyY4aO+9kq2ZcE4GD1qo8U8ie6U/2Hm5KLQJAgyYhr06JyELAHGiSjLcL1mWZ9w1ueXTb
	Pdvmdo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL34-0000000DiHk-1oRy;
	Mon, 27 Oct 2025 11:06:02 +0000
Received: from mx-relay170-hz1.antispameurope.com ([94.100.132.162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL2m-0000000Dhu3-3je8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:05:48 +0000
ARC-Authentication-Results: i=1; mx-gate170-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=87X5R6vjtDdJY60KYPFY+Q7PYLNtQIh/pXfTLhBqd68=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761563130;
 b=Ia1EgwqFYmg+DcfeVIwWI8WSFh2CfM4WpTrwFCE+4pcA2a4zFerfMLCdjrH3rLCcAbhuQthY
 LiX8cFTSC7ngoN98KfPcF1WKnnjCm6Ss8vHVx9AIfkz0D0i0RrDREJ6Dd7+Zj6tvCV/8To942q5
 HNLctYFl2UnOhRcLeRxJ8Hy93ZXxJeJDlUL9Pqbwzj5FydscJw9WGYwQN3jVYybL/djVsfeQ/+s
 9tkS6eiwWfB0xgjeLY3NzNE4ivomlz6zJyoYsSCAT7qnrl3k5eUz+D7DtE2c2hXqRx9bC0dWE2K
 VT2rmJqxKAaDjtBHgefqFXzwxWXXCvXcjrawn4hj2RKjA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761563130;
 b=OJYOJmjjpxjE1cx92FtVvSxp+nQlHDHkNozhYc6vJIpd1E+4k3o3uTWUavCe7nNNWNYvipN2
 C0+n2yfgYLWJR/rRMHvTityy0XJhHqcGuOm4dktP5Hs1XwklAY/Y3bmKWpdgc/2G64Wnx75M5HN
 jkOGwzjuGQTpfiyVlYWGoo99l6ulUNdo443P6TUQMe2DhWIf7brYNMexGHaiwVHtMxgCkc5kHR7
 l3Xr4V8v4sg6u2KdE+XEGXzrzmDdBnibfd+jpNH5DPgw4TGRDATHdV40aeCrwwlP83MSI9+6rfd
 bXPC39DpLE6zRV29VaHZuPpgHU9uyAfSjNUnRViGy5ycg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay170-hz1.antispameurope.com;
 Mon, 27 Oct 2025 12:05:29 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5FCB6A4127F;
	Mon, 27 Oct 2025 12:05:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Mon, 27 Oct 2025 12:04:55 +0100
Message-ID: <20251027110459.420857-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay170-hz1.antispameurope.com with 4cw9dg19t5z3WpYc
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f3fe413255b5fec6c4a2399235bbca65
X-cloud-security: scantime:2.082
DKIM-Signature: a=rsa-sha256;
 bh=87X5R6vjtDdJY60KYPFY+Q7PYLNtQIh/pXfTLhBqd68=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761563129; v=1;
 b=TPJnBNcsn6Jc3G5c8ARlI1QLuY54zdLF3H1qmSyVrz1YEzDokrTiL9bXSc2w4DraBMia5dNo
 pWTUjqhsTWyRhNYdRHZzC1UlpRdECMffIQAQyRCENManhmjZHnCCJT56HNInhq0xElMwERVFifR
 gxU2XKNjI7Z+HbIzACCeKmd34Qz0tJ78OmaUnbbA06Ks+ARJNUUtf3FZ1wmEKaMc/nud2ni/zrH
 qGpiwnqTeCBCrp6Y69lV/BX9G3zWc9gHWOxpnwGtdbzmWklneizaliHrZL9T6JWeb8p02R5fpdu
 i3HA4tx2TBTGj8uZvFFr2lTqoGumUp5b4NKDmmSRboWYQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_040545_399516_B60E47F9 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Add Frank's R-b

Changes in v2:
* Fix indentation

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c5d81e3f8bd17..fbffb1a536ba3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1656,6 +1656,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+              - tq,ls1028a-tqmls1028a-mbls1028a
+              - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0


