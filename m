Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E49CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0++VK/2SwUXWh7Uo8MufIIzsEnFuUHIzZsoTIoBQUtA=; b=dZ2I24yZGZX46+27ppbQRcBIS/
	xdyJMYMf9brXtGtXuCEQPGiSGQmoDc7ZxqqGJxcU2xwYHOvB/OpOseLJhop3ewQF4iccFpV0PUd1O
	V9P35nvDCIz0Ngh3AdebqqGeAzs1bJpKan8+2Vy/FXcGI/LJz1juU+oGKLnbsoWTVw93EfrsGXXWk
	/a2GQrJC++1eCn/nzw6vHwuGgwYkaCtI6/aX0T+9r4PnVw1S+EZsbuqJDzqUzPjZmAVgzY67IACnl
	lH20ifFUBNMZ3CU3MH0jhYMane9xd1VogfXwLARY14y3qO6A/ZolxFA9sW4+MNITgbBSFq0h+bPZO
	1RFEeQeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ZZ-000000096db-3uzC;
	Fri, 12 Sep 2025 12:08:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ZX-000000096cP-2Bzz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAAF460247;
	Fri, 12 Sep 2025 12:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEC0C4CEF7;
	Fri, 12 Sep 2025 12:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678890;
	bh=RUMJQPe0AYRmGCrjxRqp1GqAC9UdgedOdf0x5X2StKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EZXtch7DbphlH/t0FUjTLyGq9EMaAxNe+J1sx3DWDGZ9ubttXK5+YMTdgkyOI7KHH
	 lvalM7RY65xJH05mFl0oD0St2juX5M0DJ1lutJmodklbXwvrpXjuz7YxZ+v+xTS5it
	 D3v9y/TmzvsSSEujL8jedaXh23v2ojSxE/8BFASKOVwgUqcUxf8XgKWbvz2hLTisn5
	 inttQTmQLflz7CtiW1+H6lvBP91E3h5EinHJjtz9y05pMWhS2wVFfBdujugQoSLyu0
	 YSZA5DyXT/xfGxK3nh0uCHbVUpbVZkvlygc++lnmHC4SW8sG6hoidj00gVXtmL9IzV
	 wwcY+ynyhvoIg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/7] dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
Date: Fri, 12 Sep 2025 14:07:39 +0200
Message-Id: <20250912120745.2295115-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
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

Add devicetree bindings for the AM67 based Kontron SMARC-sAM67
module.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa438..af41f1541850 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -181,6 +181,7 @@ properties:
         items:
           - enum:
               - beagle,am67a-beagley-ai
+              - kontron,sa67             # Kontron SMARC-sAM67 board
               - ti,j722s-evm
           - const: ti,j722s
 
-- 
2.39.5


