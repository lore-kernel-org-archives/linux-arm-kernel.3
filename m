Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69BC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=iGlUTDvPZv0p26A9UXzqUvrJ1m
	ZEsU3U2PHdKVPDqaVR/zWaOWwzmRULRRmf2vF2S1thNsxmrLbuA2QwXnIQAP3vkkYWLsbFCcudhF4
	itGf5SfdpTQC0sRYn6g9hi5vFUmGvrV9ZWEW5FplTFKU6HavLFSxfxHp1VqeQjidFy9AMXlsMAdrn
	uj4wArQWQmqC3v9y1IafOICAl8VRD6kKskNIfh0KzI8TSve83n2qfn1TgZA8kwUENmcYMXHFHknSJ
	5qgKMK2CTJXKz8qoTsB+2Zwjw4ATPHCeHbTQYIUMiV2Vzj3clcV4DiaynhPYkC6qWHIuBilEBrWhC
	rYpZSYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thct4-00000001n7d-1gUd;
	Mon, 10 Feb 2025 23:08:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWy-00000001iXM-2HbQ;
	Mon, 10 Feb 2025 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=X0s9p2S1TxtN0tSgOR0jGSZSqI
	gX8CvLeuPuogV1NWTps+nAmgqyBlSGOj7xeY9JPIP8ip//KpNBfLwDpEdmNcpxEVkmje5Av1tvCpQ
	pZlXguRMvj7WyU64stEwVgMs/Ev+VrVANR/YeIsW0UiP/s1hOvnBU53WlRQ0+zifDps+3MJWwaO2J
	XHt+chORMf0u/+0Te3MyluizPu5orXJyDEwXwRTAt8YPll8a4qmCmjmMDJ/FsUCrZVufh4YvUqaRn
	IA8UkyUChZX/vlppV+JfQC/kI54+B5zve3NgEmb058LUvATPKtjkYSLEiURa5HoozHg3P2ixG93/j
	oAvtB1bQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcWr-00000000L4K-1And;
	Mon, 10 Feb 2025 22:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=MnqsuejhUiY2v0YatPHLxFAs7a
	iEIOs2TLSk48gPAV4TZ+b2j8GdKgbbeksTaf3iRHeSYKBvduqJJOvY190llWjqReGeH0D4hYQFkT3
	fRfbDF47bP5xPDtJECht8XTEfugG3r7cM/4VQX2X09Q9aPLdNqRM2RcVe2o1OJc/whGEsNIAU5Q61
	s69KoSKP6j6KIPyqRtWFIJEXmr/dLBfX5O+NuUEwzAcIUO8QqTx6O0t+3TztdzedazA8jctxXpWl1
	Di2Lig9tV3dCl1tp21/J9OhXgLYDAtd307izVciWdMfFkHdKXNcTi61OjPQJcpeAdJCbdY5pHZZPa
	FeNfgNJQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcWq-0008Re-Cg; Mon, 10 Feb 2025 23:45:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH RESEND v2 4/6] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
Date: Mon, 10 Feb 2025 23:45:08 +0100
Message-ID: <20250210224510.1194963-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210224510.1194963-1-heiko@sntech.de>
References: <20250210224510.1194963-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224526_929502_E79F7455 
X-CRM114-Status: GOOD (  10.61  )
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

Document the OTP memory found on Rockchip RK3576 SoC.

The RK3576 uses the same set of clocks as the px30/rk3308
but has one reset more, so adapt the binding to handle this
variant as well.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/nvmem/rockchip,otp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
index 3201ff8f9334..dc89020b0950 100644
--- a/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rockchip,otp.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,px30-otp
       - rockchip,rk3308-otp
+      - rockchip,rk3576-otp
       - rockchip,rk3588-otp
 
   reg:
@@ -70,6 +71,26 @@ allOf:
           items:
             - const: phy
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-otp
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          minItems: 2
+          maxItems: 2
+        reset-names:
+          items:
+            - const: otp
+            - const: apb
+
   - if:
       properties:
         compatible:
-- 
2.47.2


