Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA318C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=hCh5S0pUgJyw0OaSrJ14zXvSFV
	FmrtgXnUe2uyVEK0UbG9U+iVdPxsaDvQKL1UP95AGwVDPvewONSMJIZHLf43nEk9jRVg97CvhNt+N
	mb8c9GRZA1Np2HK/L0L66qXIdenjuob00VXYqHJHSoNzH/10H8pS5NckFl3QuJ2rbLSEMJrUEqbtO
	d9QsIU5QkqGUDcOpyjhkLB55QA2/4+UYRrqkfhi4/0IzQxeI5hA8PQxWYuL3qfrXH5UL1WCIlEZ2T
	r2QWSDl7+ahK+URm3tn86vbGmFphXssOyrklCSG8hCof2GtsD+Ga7frP1hCuZVeVqRKmjlUOAJeuC
	ML2GXrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcYV-00000001iwD-3Pc3;
	Mon, 10 Feb 2025 22:47:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKg-00000001fOl-1EPf;
	Mon, 10 Feb 2025 22:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=EHLRYq9E9U0ANs60KSFlyIT8iu
	GxtsEx77NL7g6eV/yTmupKLov7N0Prr0LV59pdtHiKGDsvV4pVn+DAnajKgYq4eXtaqNjJ802EEMo
	vBrEhlddGxS+XY0IeI7cIZbQ9sKA9icqIOLSHjS9c+TWfgAW3GwhKv6yYs/b1xlio/h+6WrJK+TDt
	pkuTCpZiSCMpyx6ZYBCbIsRjKFwx63NW+eqxHj26u4RliNRnZ8ZId3bpkEXcLyB1ocaPQym25O+gb
	1AYcm7wKmoqU9wrxe9E6tVlBhLf7GwywKk0kcTwSYanMXlW+qKWe4B30GWoMpuB8RisDGHinHVQLI
	7GM23SXg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKb-00000000K6S-1HP9;
	Mon, 10 Feb 2025 22:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=CNVDhRiuVFz4HaYiB42Rf9J1Tb
	PapWjRIMClwgYxNo5dcOZ1vx+SqIFLiNCE7dNHbb49VIfjH7w390FEKt6Vd/AgtH0ujBtxydPNhBl
	vdgi91fphzxk1pxXt0e0Nf2b1o2ojjP4pntFBz8QCvqWpw/OL4ApZOZcbuWKzcf2FIqWmLAFXqTtJ
	8dNnfoJgCWzedSmOUfWh4Hv+laNQubzMqa34+ebXiGuyPF/0ZOIpQzpHjOgKrD37OHBeoboYqQVpD
	Vrb8qvEfTsexlXA/Zo0AvgDeCtdGaaUGXhbUsFWhv3vFmAogHo8VwpHNeXzhNutuLAaYAtcWGMlKX
	OwR3TUDA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKZ-0008Cw-SL; Mon, 10 Feb 2025 23:32:43 +0100
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
Subject: [PATCH v2 4/6] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
Date: Mon, 10 Feb 2025 23:32:10 +0100
Message-ID: <20250210223219.1193346-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223245_545239_4FD63473 
X-CRM114-Status: GOOD (  10.72  )
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


