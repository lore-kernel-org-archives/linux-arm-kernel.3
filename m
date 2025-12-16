Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DBED5E154
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZD7EdcJ5e7dAsrhJ0U5LSV+PqEdKUrqQJz6YmQiuB8U=; b=nRDsVLh1rXd6TyYXFne3lC6ULz
	jEYa4KJObafaLiwot7yTd48Q9MD5gHwJ1yx53Pvlf6sx8wxEHPEBefilVsU7X+FkOqKq7IpoSeSOu
	Zb4P8ix6v47/Ck3HiBSPUnKJCDGOeTuknMHeAc9K/Vzd2NBpZNQG/BDYNuyKohnw81H+i9Q8RNNbv
	3wWJDA285YhgoMWx9tEsfLinFFfjNsgnkRfAHoweKZPxigGhi0n+Uu1R59/EVjEQrLTW8IWWTN0Ii
	P+llz2BienkfTiLaH8YPkdZ+cgIFrChLlZHEC9rWF6DbCruV8GuSeGQTIfKYaMYw8RtWdGRjIhntT
	R/G4/8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9W-00000005GBf-2TTe;
	Tue, 16 Dec 2025 13:31:46 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVV9S-00000005G9b-2x6j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 13:31:45 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ZD7EdcJ5e7dAsrhJ0U5LSV+PqEdKUrqQJz6YmQiuB8U=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765891889;
 b=MOv5PXog/lLs/1BTxBApjGk2uMRfAkPUxkAt/hlpVqMPp6ArHTVHBwGVNfhEOZAfore3QdUO
 Hgqk8faZOHuESCKMEmRQWo2O0TBoukGFIksblKStxWdJ2w6dBYNaCXwWOmWRZ4YTtlOjN4mU94x
 uQqQUszcXPnaPu/5opw5AExRUzpQaufg6nGocpt831eJYnH63+H3YAg9VYmoKo3E6WedWmXV9go
 eauuAHotFC6Lvys8B8p1hdls0pcDy/otjd2Kl+eQKKvX1YEhxSsiy34FAE2LVL1F7LldrJ9SNht
 pj5dUK3RoWy8aXu5sjY+KnCUt0RGEBcVf3nRM2NZHqKbQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765891889;
 b=jYih3+NqY5pG2y38y7YiIzFoY3gxehMZTVQ5Ls3hEo+czCm1ZNQUZp+zpD+uC+w9ZKDNF/Mm
 VBhEHfBHds03zQQhoTWEyN1SoQR1Oj02b1FmNC1NMWsEH5cgHTvoi5EUALd9IqNJ8mbS9gS2r5B
 mRtcM7fHhr99Y6/idSwllc2u0LJdrmgUFsMrnZWy94cYC8Vs3hVEbPhB0SyW0HTDd7KvQygygGF
 Uqnqb+9u2d4R9VNex4cQXhqF+IHdnTXaAseTk6ISfL4Zp7U863k0OsBLWrO0bYc9aLzgVWsFad4
 SoG2KCrk0DPnLpQMMKivYZWMNCIHmydTuK4I8BBs+SVkA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 16 Dec 2025 14:31:29 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 7785A5A0757;
	Tue, 16 Dec 2025 14:31:13 +0100 (CET)
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
Subject: [PATCH 2/4] arm64: dts: imx8mm-tqma8mqml: remove virtual 1.8V regulator
Date: Tue, 16 Dec 2025 14:31:05 +0100
Message-ID: <20251216133110.905950-2-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dVyW62g3Qz3yZDb
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3ac751a4171fb0e3b80f44cb1af22f3d
X-cloud-security: scantime:2.207
DKIM-Signature: a=rsa-sha256;
 bh=ZD7EdcJ5e7dAsrhJ0U5LSV+PqEdKUrqQJz6YmQiuB8U=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765891888; v=1;
 b=rct2UovfzTdpD5102cCdnPPEYgNvlODf/tCaC1V6A4tgSUWjuWgaq4VLOn30va8KRN2T14RZ
 GWeh2pJUht+a7hdPaWH/qxo1lrLVrwhpn7dHMV+99PkxjgL5BjTq3fr4AMHW6ITx93dwpQ1U4H3
 WOYl7nC0vz8oAfl3w34V618Hpg7DK2RcyAoH0gjtlZTCqGb5X0XbZwi/zEFW+BPvwMTpl3vGdn4
 xaod2bggYGvHMLRHsgmFPUsVhUwd0p3qVbg9NXuHA/7NpmUw1QrODnV2f0UhKkudNs4Ru/V4hDt
 HpQthv5ROFK3FV/Azr/Tp/oa+MUdBwzxJzWtntw2ZRC/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053143_894663_4687E6CA 
X-CRM114-Status: GOOD (  11.61  )
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

BUCK5 regulator supplies the 1.8V rail. Use the actual regulator
instead of a virtual fixed regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
index 16ed8ce5b5c49..6e63cf8beadcd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
@@ -16,14 +16,6 @@ memory@40000000 {
 		reg = <0x00000000 0x40000000 0 0x40000000>;
 	};
 
-	/* e-MMC IO, needed for HS modes */
-	reg_vcc1v8: regulator-vcc1v8 {
-		compatible = "regulator-fixed";
-		regulator-name = "TQMA8MXML_VCC1V8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -246,7 +238,7 @@ &usdhc3 {
 	no-sd;
 	no-sdio;
 	vmmc-supply = <&buck4_reg>;
-	vqmmc-supply = <&reg_vcc1v8>;
+	vqmmc-supply = <&buck5_reg>;
 	status = "okay";
 };
 
-- 
2.43.0


