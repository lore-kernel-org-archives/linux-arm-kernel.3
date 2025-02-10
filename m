Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F303C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=Y2AbtzKaj4JTgF4mUdvgtfQLRv
	MkO1jA1EHotRkz3lrl7D53nc3aYlXnbCsER71ZgkUK2FvUDhqnH1/fim4XE88PCg695a5rn52KhQM
	qRneYt9n6d5p81U6Hxmfm14of5cpltQA62RMHy4iFePlOYp1mog143dWdNjL9mPcKk4BWGCP8kHX5
	nZdUpwgdcCEWD0ezewPOSbuJgpp3ZE2c4I7DcCstxkisVKp6xeCB/P7+/NTt84DopMB2635xcVfVS
	U0QkGoJTO/YLlKqLZGJtKR7ld7JrtQhZB33rg4RN9D6qVAD1uSxDs6Z9C+sYWt0U5zrugrBc/0P4c
	43VzggmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrc-00000001w6L-1sqg;
	Tue, 11 Feb 2025 00:10:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcRp-00000001h2g-2OT4;
	Mon, 10 Feb 2025 22:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=pXNuQ2mH5ZTeXQVUYmV8fgRaGR
	hAeX68hTAlZVNDIFstSfEQj00w8f0Pzf6vG0uETXevHmwXXMkLE7V6tG0Kv3vLp4wmIlnYKPlzl9n
	O+m74wUcotVTRBmlTdSyCfNJ07zIPBvGMaAq2wxjKfl0NsoZ00L1olQD/A7PQvrcCu+Ps1RAJLTYE
	QBYIrg1neI+eDnS6VNU689j6vbq6HFgJINw98cOMTL1j2hvLiU1CDjh+xUDOEThLOYkgpK8KNm8d5
	/a58lcr2RHn73cj/9sGIYN9Nb4iWjVDkfsCou/eR8IxjaOhkpNSK48QXlGRRQk0ZlLdGLYrJ0lipX
	ne7XU+tQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcRm-00000000KdD-2Inc;
	Mon, 10 Feb 2025 22:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GpXTu8Jl9+ElR55rXNmhyGQY8Q6lpRd3ddRiifaA3MA=; b=Htb5jra7ZsdIj8nIZmV2PC+fE1
	HCirlHlFkvINA8WIUOf1ND0SeCxuf4VbDL0twewGOsZ11Nbbsfq1KMB5nMlU6WI06t7PAamHCrU0a
	j7fVPc49pHrPRAErm9T2G8O19h7YTBjK0Oo6RhuVrl+eHufwA6WC2co33R4Sw67nDXyxosKehiT5O
	BPAKPgqcxAYzkW9hx38aL7KN5cSUQO/4iWJ4alQp2pFJscZ+0MKFOQ0TyqikeHI70pS3RhPTlh+NO
	WpnKGeqi025SGe+fRzLHLEdXkxfVABfjC+KqZHDWANDKPGScS9nSncA8ugWB1VnnDb22NknjSUTP7
	ESuDQWmQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKd-0008Cw-EU; Mon, 10 Feb 2025 23:32:47 +0100
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
Date: Mon, 10 Feb 2025 23:32:17 +0100
Message-ID: <20250210223219.1193346-12-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_224010_812498_91EAD279 
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


