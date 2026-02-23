Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324B0E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnbYg9KONGqix8vHovEWpeYuc5QR0c9FQtwrkm6skuI=; b=2MrKw34OV50gt8H/aF/JAscJcO
	w/cxrEAsOQt8bhw/RGCbqyHl2L9gMzvEAvgc2eJKF6aWqF1IfYobWGB0aLDwshXS4+PX8HFcMqO9b
	huytLD+58KMmSMDdOTr1mjwjm7IC6/4rJELy6gyUO+PqMuTHqUqyRETakLw78lDOgpbBpnP5H0cl1
	/VPOR6F+AY5sbVeoYuRof2XzgEo0ldAhQyhCw0C0prRTWhpqkXUZyPCKN0yOQ4yTEg3LrSUd3yRez
	sHNWr7/l6BmFf6NM0Q2olhpU3wx/rpV2Tbk8B2Yc5JDboKP9wMwbo0pp6dbbFsv4pBL6ZPGOUyVBF
	dZLTlSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSor-000000000RV-3oEl;
	Mon, 23 Feb 2026 10:05:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoo-000000000NW-49ff
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49F9B41726;
	Mon, 23 Feb 2026 10:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43E6C116D0;
	Mon, 23 Feb 2026 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841134;
	bh=4TnyH0MD9FtIkK24YiVbmYeV/1WFJ3Nney2VWTHmbo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvwGWUBrDS+wuqmnAZ1IeewwERcKsYeEi/o46OMyS/Bw8D4cmaiM+Y44L/DTjQsqu
	 jDTM4pgFG+E9apk4Ltoyu9H5sBv6UjHeIfh4cxsGePlbDEdlKhivBFYNhmP+RET189
	 byIvCuxqDti9kY+EZymEImToGxf45dgQBUShtHIzPPoWF36JbNYoaVbkdIniAfWoxU
	 bs+MK8vd5vlYdI/FblXSvO4IYiMINpxQbHisaibl/1TUPCUPwm0QeeWzI1DtNJJWr/
	 ipBYqMiieHG4LkNQqBHVtMSybgbDzv0CroiQof24gvjhjD7swKMDfNoFml+8j3oCPY
	 GH9GZmLbUvFDQ==
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
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 7/8] Revert "dt-bindings: watchdog: Add SMARC-sAM67 support"
Date: Mon, 23 Feb 2026 11:04:52 +0100
Message-ID: <20260223100459.844967-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_020535_113167_47B6A789 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 354f31e9d2a3e4799d3d057a9e1c9f7ae7348bba.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

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


