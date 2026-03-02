Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF0AE9B36D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h+X0K1IOD7P3EELEDAmfMJSSRNV4zM0KQK1M7no1cY=; b=vCbbAosrmTogeGXVb96YR27Muh
	cBh7de6U2xMxRtYvD9MwBVyq3q1PEHecCzFFzPDbRzJ9k+QtM08G4mRjbTkDCEOczsFUlOacj7Ab4
	kyzBa6a+504bx5jRlC5MCNmKnfyRRM99H4fHgtY2ArGBxJng74R8aLzBimUAZTbX1IJ+mHjuJeNGJ
	lw8qa4uK+26RYK95Hf8Roog7+RJSSmIwvQbVOLwxTfPFZvkNsy1HV7RTKx8s2EufNw3nE7GenKia9
	4qfeUvpyvIDPBrQPbxP1Y/nt+vaU/cf0Hj6kLRH2rBt73USLywU1kC/FLjcSn77AMInJkNzsVRffr
	CWqtRjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2MF-0000000CxP5-3h43;
	Mon, 02 Mar 2026 12:26:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2M4-0000000Cx0B-1pWL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 12:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8h+X0K1IOD7P3EELEDAmfMJSSRNV4zM0KQK1M7no1cY=; b=M5/JGjAlBK/MSxZVvf3QlAWEbw
	KsytqWaO7xwNmdfMz8CJ5l00yq3e9OWHkO3EPyblhm7cv58PVxQxunhW55sb7uEpMlc8YbiT24lJV
	bG+5r8JPFqjETI4TATi+/EQVgsjSVNrcQYVMtH/0fRDbx6eMN8zJZc7E2AQ4fup4XvXBGZz8twAqH
	Of6hpY0n/3pQYZwCFLb9EN3fGKLY+6+Lre2VyVO2tafar6sL7og76rUd9dqhvsCN13hCQXj7pBOPz
	uiNjRj4YdOVixNyiTW5Z5oGhgQgD2IUoATjhGCRaOKgmp48hicPWFgGKkZeWhubBJY9ZV4ayyq+hS
	UV3sS86Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Lz-0000000HaCh-1Mdx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 12:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBA5341699;
	Mon,  2 Mar 2026 12:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7A2C19423;
	Mon,  2 Mar 2026 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772454382;
	bh=SHoA2Wn366pwsmdbdTIEzKutBPmNFtYIiz3QL9a36j8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPekgRziDFyvdpTMCdgKH9QZM9OpV1JEXfpbzz/lWwqxlZmGBxpBoN84uN3h+jS+N
	 wWkT/RKKjoBQsdzKWw0JooPz5jSG1XtH+5dxe9usQGKPNhT6VNJ0cmSAjcDSmJawtm
	 8fhX+uirQv3iForEvtlYOw/+tOS5h21t07r1epBRXbnPui54r6Y3/bcTEAcMmvdCjC
	 xSY7V3v5PseaAr0Ukve0jY9a48r/uOpXX0xjZX1LXjrN7i9mqQRJ7F3/viLyATAQie
	 lWQtIZ4MNFAZTxqU5MfySYy6dMfg/5/RT30zEzwYMe4XHdPP6St3oK+STdKpd9vhoH
	 YXPXWNNhjsXEA==
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
Subject: [PATCH v2 6/7] dt-bindings: watchdog: Drop SMARC-sAM67 support
Date: Mon,  2 Mar 2026 13:24:51 +0100
Message-ID: <20260302122540.1377444-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_122627_579012_502EDF9F 
X-CRM114-Status: GOOD (  10.13  )
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
maintainers time and revert commit 354f31e9d2a3 ("dt-bindings: watchdog:
Add SMARC-sAM67 support").

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 0821ba0e84a3..872a8471ef65 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -18,12 +18,7 @@ allOf:
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67mcu-wdt
-          - const: kontron,sl28cpld-wdt
-      - const: kontron,sl28cpld-wdt
+    const: kontron,sl28cpld-wdt
 
   reg:
     maxItems: 1
-- 
2.47.3


