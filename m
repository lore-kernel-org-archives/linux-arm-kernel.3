Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA4BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlvpC1cI/jxGWRlTIAmfgsWt0cwo0YM7bK/IGnl9rKc=; b=SC1NL6aC57ywtWIHK54R22Th5l
	lQIGDqVJKANyrhpcxrXEodwyJOKPcrTalC7HzR6fk8e2ZS4xdS1SObofY//xujbb6Bk8DR5j2NlcI
	CjGFySc/byZx59EM0jHR+sjoSbMzzOd0cKL5Yi3JXi7LGtmO1hnLq/fqNyo7BhwBfsASuqgWmrFwW
	jIX4VIDew4hA6yXfpD/foMm3F7aIO2HxplgYzGWCX7+cSq4odSKJy6eoxnSUpMzRMxsScv5nWZPqN
	ej2WKVYjQMCgLd93VbNJ3iQ2omcIgWv66gi8x+tcj0wzdESgtDrLyOZcLmXNT/+U/apn+C+heffx7
	XeHAhSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphm1-00000003zDN-361y;
	Sat, 23 Aug 2025 06:30:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRcU-00000002az0-2OSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09FFB6026D;
	Fri, 22 Aug 2025 13:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77463C113CF;
	Fri, 22 Aug 2025 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868549;
	bh=5edwIv2wGdGR2+Ign0FEjaM0t9DIY3ags+xEJ31/G64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omhht5mX9/geLecs1wdPpTwfso24JHFSn8NH5Y1RsNLTEZFrvoinVWsb8XaAgyz/K
	 VoGZGIEocDVi6Ef9vWx8XM9V2jr0V9wc3jJji0ycuUDe3VtnLdFvUaQgLsWuiRCJlk
	 CPsQBnBgzcIQykxQoH5G/L8Vf5HUJbbFFektpSxEAjlnVYoyGl8NIWQAD3fCWt4K3+
	 5Yd+PX9CAQvIuPvJaYC6rDYED1vTCR7+HiW0932tWT/vaaPFiejqFRHs4UnaNozCsk
	 I+4Z5DljalRxr4tBLCT9vB9FCpjlArZjexNMT3sJVNucuJsTmvOU78T1mx/JKbVq+q
	 ubkxprkrhmuJg==
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
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 1/7] dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
Date: Fri, 22 Aug 2025 15:15:25 +0200
Message-Id: <20250822131531.1366437-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131531.1366437-1-mwalle@kernel.org>
References: <20250822131531.1366437-1-mwalle@kernel.org>
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


