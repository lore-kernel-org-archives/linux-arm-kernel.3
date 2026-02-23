Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171EAE98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w98+ZqKa1DAjRLxKGgFWM+82hjydq4N7IvsC66IBu4s=; b=PRreuKIwQQYA2bi4vwveDw2CZc
	Jv7PjxDHyNfoONDNSx3Y4O1l6rIdwFpqPobt6VxsnLVnEt3+hePLiKWQ58MmG3z7IuQLn/Ub2ee5+
	V2++9xABpi/mzFt6WdxxX0RbdZckC9qqrK3AP0uQR0/LTwnLSj6z6YCSrIDpH1YlbnBkpeV6RnKv6
	CNmGCKaT4D2wx2skJObL7rEfRV9GM9hfAHlGfSDSx9ccEGE8Xy77/fTgawpC6JdXU8vZSSYooL70l
	ztXf7ohjArY/uBtKseYiK5U0EciP9i1oaZSZa2NWpJVwnEo0hbHkY7q68PO55lXznsh5MBzwjLlTk
	cWxdwCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSog-000000000Ga-2DTm;
	Mon, 23 Feb 2026 10:05:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSod-000000000EE-0mqk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C61F60053;
	Mon, 23 Feb 2026 10:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE3EC2BCB0;
	Mon, 23 Feb 2026 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841122;
	bh=OfeTJCBWgvRM/swVA6HkACwwUZ1drAGlMZjeKlncfTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlyeFPGLNjwP0u2KWarn42D4gDcmveoSUj2po/QwdN1y7n1MZ7Io6DxEMhpo3I5Ao
	 wf64sMkUUGy/51pJ6i31CXR1mEngxkqUW7iQYGOeybJ4Tr/SxneGR/GSbG6rPpgn2C
	 FCgfDNgTWYRQeqv6FtuSa+v+0lje4kmB97jCN9NtCYBgDVlKkgltCdnf0iHpowmmJ7
	 5qcOEuB49P/VCHepDQENdtgl4VmcoIycI6XEDj+LEd7roTvV+TfMTWLtL9Yp+dOFj7
	 +GdcymAttGssRTCWhWQIpBFZ7jL52RVlrOhW0dU9Bc6pfz2UibCs/0Dau65N0/ysDG
	 HI+Aj/6amH4Aw==
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
Subject: [PATCH 4/8] Revert "dt-bindings: mfd: sl28cpld: Add sa67mcu compatible"
Date: Mon, 23 Feb 2026 11:04:49 +0100
Message-ID: <20260223100459.844967-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
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

This reverts commit a598ae45f48d7d5a17f8290f2f5bd46046fd0b9b.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../bindings/embedded-controller/kontron,sl28cpld.yaml     | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
index a77e67f6cb82..0b752f3baaa9 100644
--- a/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/kontron,sl28cpld.yaml
@@ -16,12 +16,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - enum:
-              - kontron,sa67mcu
-          - const: kontron,sl28cpld
-      - const: kontron,sl28cpld
+    const: kontron,sl28cpld
 
   reg:
     description:
-- 
2.47.3


