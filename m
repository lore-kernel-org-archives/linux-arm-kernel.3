Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E848C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZHQM5nbhbJNlP1js89/REC9STfmQ5XsLFUJcFanIvMs=; b=NiaioaxZcp8gg/kUwOCeOpNtFl
	PeqVy70MACJrIuKiX0th0GChVDvaqFfZjJErlBoUKd3KC9miWnk0nlNeeFJDl5lTWZtbj8huOkklu
	vbCIza+hqd4d43EM+lsi1Pwoys8S68PL/YKJT6cG4SGj1JZ6EBxoXBcvEQhagXNhP9Cdey/Zhbfw8
	rabaFPLU9PEVayTK8xIggxXb4FU8OYC2TiEXkZ+jBgMUfrOkX3PLD/daJfKnpe7UfXzcpUX8g3Bta
	IJ2HLaFDzaQYMmBDZ8JT+0A+e8EOqU/+gKQIy1/jFkmy/09xh8HCxxFuAs50DdxqwD/ARj/iq+ljb
	P3BLb0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmv6J-0000000HOV4-16YG;
	Tue, 25 Feb 2025 13:35:55 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmueP-0000000HJ1l-3TYU;
	Tue, 25 Feb 2025 13:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7856B61248;
	Tue, 25 Feb 2025 13:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C95AC4CEDD;
	Tue, 25 Feb 2025 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740488824;
	bh=NmQ9nWH8XrnjebLyNSQHDNt1Aovq1Uzq7YSBPo1HXwI=;
	h=From:Date:Subject:To:Cc:From;
	b=coLausKWPcqpdqi5p+N8gT30FJzaSSwnHbZYR4g9yuD6kv/R9KzzYPnhEAywIeOEx
	 OVwj3sYc3G2tJqz+M91M1WPUlbQ5C8XnIYuDStxULNZUqoddEoD7DW2J7Ag49oMDZe
	 mzz6ugjplEw2VFiF08Q5Ll5mh44uhOkmFnlhBm0hjaiqxUd9rTi6dO3jXGWywo6OSn
	 FwVlcTTxLop9BqYI7ir+ajgVOUN/KA5XaS5mzuLHlVgVz0DDumiXjkB53DgBVpPLjy
	 0n1bI1hbwShguvYrt0uyXXSpOCgvyNQTuw6rFDcwhSo869HrX2lnK5bvqovZSg5X2N
	 q3PGJ31F7ajmQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 25 Feb 2025 14:07:02 +0100
Subject: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHXAvWcC/4WNQQ6CMBBFr0K6dgyt1Aor72FYCP3ARNOSqSEaw
 t2tXMDle8l/f1UJwkiqKVYlWDhxDBnMoVD9dA8jiH1mZUpjS2MsITh70ZTCwDRL7EADv6k/Gdv
 Be/gaKm9nQdZ799Zmnji9onz2m0X/7L/iokmTc6jcubauQnV9QAKexyijardt+wLJ1yKGuwAAA
 A==
X-Change-ID: 20250225-en7581-snfi-probe-fix-c325bedded9e
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Clarify the commit title
- Link to v1: https://lore.kernel.org/r/20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..cc69f698c27b804953b1bb671e128d4401744bf5 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 26b13694091735da7af977e42f8f546d7d5cb078..49c061d38d7860b3b416610723791a7a91edcb69 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;

---
base-commit: 0092294492fafe79a537915e486576a3d69c9a7c
change-id: 20250225-en7581-snfi-probe-fix-c325bedded9e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


