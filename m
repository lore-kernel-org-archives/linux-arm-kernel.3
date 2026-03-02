Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E817FE9B375
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX+onBbKIdF8O3dhbdJuPiZKxOkNMup7muZzlzsxkeA=; b=JJeIZPAqj+0EDmD1iMiZaRvnlj
	MWh7wo3j8rc7aGCSn5T8H7epuAblhUP5Wi3+SvdG324vrpydq8LQF+cDFBNFGV8s1Z54gRhsIblZT
	RW0K7vb7E0OoO8BekMOv+3dN49U3y0ywN1OZz8bUIMDWizq3BU3978ABK0fSgcfgAkNxoRweBXlSi
	EhyLFfYgMG3TCbcKNSdMQIhzzaIQsBbxIimivSCz66yoElkG1ZBRRAAkQ41rY1liYuNXzgGtaFRCf
	yLs7Oy7bJZoI1joIP4rGWx7ozMG1j3vd88Kob+VzF6VovHQNrYLEN6MUJ7eOmPSuqOlD3Ks82X77Q
	pZkQ/PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2MC-0000000CxIW-1ziq;
	Mon, 02 Mar 2026 12:26:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Ls-0000000CwhV-1cAJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1C6060018;
	Mon,  2 Mar 2026 12:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E82C2BC86;
	Mon,  2 Mar 2026 12:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454378;
	bh=I4NFZM5AIlzm74pVn+R2WfmjjzGkM1+mEAg/zfHxn/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D27uCz/rNmOgc3Ikmrs4/qTihBfzt4Vjzk3pne8HYPMV8ROwf188qYm3G+OexKRqe
	 8ECloHLUkwaro3rr9+ouoSzo7EtmzGblOGRDXnTUrI7bORtxob7+JI07wKy8c57C/z
	 rjwUDjhkBJRrgm1GW7HwsIXqE9zlCKJyVlWvvQUrt1Bn6sWMmcB8aCsr6lOl1Zq21w
	 xt6CFQlVB5hnrZhy6I2xd0qncdE1JUB+bD+VfwBpm5HOBIcBy3BRpHXGZExw1IpFQV
	 Wnf0jCrsNeZsz5UpK2oklfg+lJYmq1koKNJx8f9ci592w4OU7JLAFaSVKX/0qOQXFE
	 I3XnMQ6RvTo+Q==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/7] dt-bindings: nvmem: sl28cpld: Drop sa67mcu compatible
Date: Mon,  2 Mar 2026 13:24:50 +0100
Message-ID: <20260302122540.1377444-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time and revert commit 4a9b344e90c7 ("dt-bindings: nvmem:
sl28cpld: add sa67mcu compatible").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/nvmem/layouts/kontron,sl28-vpd.yaml           | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
index afd1919c6b1c..c713e23819f1 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
@@ -19,12 +19,7 @@ select: false
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67-vpd
-          - const: kontron,sl28-vpd
-      - const: kontron,sl28-vpd
+    const: kontron,sl28-vpd
 
   serial-number:
     type: object
-- 
2.47.3


