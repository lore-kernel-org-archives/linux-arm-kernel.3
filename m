Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E096CCF9FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/J0eJNHpyNTzgYF4P4yNw/ejnkLZX/hDBoKw5OjID4=; b=V16Aqhg82jKtNw3V/q5jHmY4k+
	jARb16TMz4WgY93zJgFuyx4PjU+XlMGaeOnUpin1I2PuByHoJ9k45jEf2A/gET5s2/FZ3BaIyyAGQ
	MslKTHp7bFhzE1E1YyJ6uasb/pT5f3iSvdDch4KGTUReuTU6f5u6hXlEY0YE+vtWi/X8BT/iWW2WQ
	c3Kmw3WBpJtDjtUP++wfmNom8OAA0Hc428XPFdEPJgxZIp85YzxxFyK8p32/ZEtx2wbSSs5vgj4zj
	bQhUfHYcO694pxBpiEneZ+Ko6YHxMVq9584K5IQD24aKU2JTX69AL2J2BhwlTrMzLOAeNSlBDscR/
	yx41sRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6a-00000004FUN-0b0q;
	Thu, 30 Oct 2025 13:54:20 +0000
Received: from mx-relay13-hz2.antispameurope.com ([83.246.65.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET6C-00000004FFt-2Qk7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:53:57 +0000
ARC-Authentication-Results: i=1; mx-gate13-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Q/J0eJNHpyNTzgYF4P4yNw/ejnkLZX/hDBoKw5OjID4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832425;
 b=jXUEMYxW3uhBj+dt9j47OKPcVUf/HvZYC5C75EOeGnOElQWkaiGhmSvhn74/tbuKcZjNzEiY
 tmvtynOyFdG8ESEH+8q5m7FSoJZ/yeuY5JOixYVrGXSFNRce48WeuWwkb0Y1T+KMIMEb4A0fFXy
 G6kZT4bx+jGrYdPgIO7tYbub3t6IcHcjfMJ7vFnd66jVZQ7homzqE+3NVKVB+kzRcb03gVN8TZM
 lVWP0crKlRaHP8mXWwKTSDCcbmdTlPKYHtzSHY8Qm7JkT+ZI5eIgS2PjShFwnbtoyGkDn75edKU
 di8L/7Dw0+4PvWJFu922xsv9MJSwPXziMfqVvtTCfzLTA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832425;
 b=IUIWPLMNhPUYIHXWQFAZG1gy10OTQmgDSEuTiGK3AXs2a2YVL2CELTXy2XXwvORbuapdNnf+
 +eD5WhUkfwR1pZvUV2RhOk5fbYfG9mwX4b92L7gwHq8j/5V0EfR2qjbjR88imo3dYVDW3EbUGkh
 EiXKYDQ9AbuigVFxfUkZRWFUkc7v07TDg46NNo5nAd3R24pdsBAVj2BXRqUi9jqmOV4nJf1cxCW
 yVUn2N0ZJacyNU5Tc35dPaKYfJZ4Gy7OvF7s2sPd0UAnqbEyYXGwB+uTjROhpwS3NVtgLxtAuKT
 kQVo5V/cGFO3FtQDAbH70LApQ92nlHa28VCtFI457qB7Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay13-hz2.antispameurope.com;
 Thu, 30 Oct 2025 14:53:45 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 108875A0B13;
	Thu, 30 Oct 2025 14:53:19 +0100 (CET)
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
Subject: [PATCH 18/19] arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
Date: Thu, 30 Oct 2025 14:53:00 +0100
Message-ID: <20251030135306.1421154-8-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay13-hz2.antispameurope.com with 4cy5DV6fJtz3svlF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 813d6957f8f6d1a248c870b46880b697
X-cloud-security: scantime:1.840
DKIM-Signature: a=rsa-sha256;
 bh=Q/J0eJNHpyNTzgYF4P4yNw/ejnkLZX/hDBoKw5OjID4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832424; v=1;
 b=YcNdSGHpZjni1LTBAstypLzfUNqSeDaMYfYV7hLCjoE+Xsz2Bs0b+fXOd1zXkMQAKRZxWGSk
 huLzuR4YNSwmNuQtAoACloqx33XYicnBQF4ECa3V87efIYo+JnsEN9WreasdBLq+OhrxyWJRe8x
 urrXe3YB1C9sP6+EZQ86ttSHMCp5sqHq7a4pUk90qwk1M/aSS9cH+uOglGFY5dQBT0W40ZwHp3J
 W/SjXdwFdWbPlB0/i4Q1R3zSmwetnISNEYxuQahXWu6G9/3OId2rgMd8X6Ne/OBu6qUQvAdR1XN
 foMY64AT2tMw+7WQrzCy/Nwj0Uh5BV87UYz2C5zlexJsw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065356_764178_52ACAE17 
X-CRM114-Status: GOOD (  11.20  )
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

Remove empty line, no functional changes.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 15d117d785445..d3a9360b8c548 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -259,7 +259,6 @@ &usb2 {
 	status = "okay";
 };
 
-
 /* X16 */
 &usdhc2 {
 	no-mmc;
-- 
2.43.0


