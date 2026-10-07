Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762B6CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYT6z4kqEdWjCVRSKtWWPizQ5NjnliE8xD78sKcEiks=; b=Rq5W9tRuWxLIKVnlhUe3W02wzJ
	0f6J5qnLcLlmAg7v0xMLkHyyTPu0bjI1svZmM2O/5/NfX6YPZhsS862El712mOUTTSzdCIR8D9D1x
	76UpI9J0N2WfoMjf1vWLERCJlHE+8eceHBvxWLGXsDaiF1GDWTo8ix/o+PCvFWwfex7h0dFTFeIut
	w5VNhJkTbknanQsiDYWzjqTBObkYhNQl3vNW7PndJJAFIPb7skyR4yRj/R+r5xYweuKyP6Q5AIgR4
	mhUu2dvP8aGaGOYvarIU33e1YQkRZOZGdEwA6C5Vdxjd//+HyxbOSkQ9mvHKdauE9GQ+T1DcG0evb
	QZ0YSQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELx1-00000001pYa-0W9Z;
	Wed, 07 Oct 2026 07:20:31 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELwv-00000001pWl-06OH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xYT6z4kqEdWjCVRSKtWWPizQ5NjnliE8xD78sKcEiks=; b=KhB/AxUnp3oXaNrUfDQyUX2N2U
	HdkN+Zeroo9snaveNrbm+1pd0ZVqcgMMfUaP9tsQpYcWzxWVk9kz0GUEEGBq9T7WQ5f6gTkSiciRn
	RjIP7CQMRHQSEVg+Nmn7pUEEVgQLjiTinAu6Mf67OERV1oSpMWbEcK9KBErIKodBRLzm7O25hmU/0
	QEMgDsQjGv3p73mwmlDCyDnIFOb63axlHhVKcU5mNV51Dd/jZAuVzxIpanhQTgo0f6thdmCSkfl1P
	4/XSdLdDEOzzxNOfs3Tkl0aeSiAA7BmBf4c0DOUM5voxBVd6CEFwAxSiP9nLYT7C86AESEtXfzd7m
	wu/beydA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELws-000GIl-2F;
	Wed, 07 Oct 2026 09:20:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xELws-0001AH-0L;
	Wed, 07 Oct 2026 09:20:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v2 3/3] arm64: dts: imx8mp-tqma8mpql: restrict clock for SPI-NOR flash
Date: Wed,  7 Oct 2026 09:20:15 +0200
Message-ID: <20261007072017.2311818-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
References: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_002025_063904_A35F8E3A 
X-CRM114-Status: GOOD (  10.83  )
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

The FlexSPI controller uses quad SPI with internal clock recovery.
The i.MX 8M Plus Applications Processor Datasheet for Industrial Products,
Rev. 2.2, 09/2024 lists a maximum FlexSPI frequency of 66.666666 MHz for
that mode.

Fixes: 418d1d840e42 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Clarify which datasheet is referred to
* Add Fixes tag

 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 9716f24f7c6ed..0593bcb450a57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -47,7 +47,7 @@ &flexspi {
 	flash0: flash@0 {
 		reg = <0>;
 		compatible = "jedec,spi-nor";
-		spi-max-frequency = <80000000>;
+		spi-max-frequency = <66666666>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
 		vcc-supply = <&buck5_reg>;
-- 
2.55.0


