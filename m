Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C11CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSnHRDwXXGzCjlMfXEtgp2fdVO6mb3j5iwCHRW2bgUA=; b=N9w1TGd0Sp+HiiPU/x9ROwWz5I
	y8qwOeJkvOms03BN5gJ4A6B0yh2P6n+1zKvLX9HKohYsYnUjRIuzMkMn1QSerajhkjv16Ajug1It+
	oZsT85GLOfP3KjbfFwXkWIjNXwJzX7Sd0qIL6XgCLFQYNNJkOPIBNs8XbV9C+7BoiC2htVHJMIP2i
	buRH6gpabBiWjAwZC9wQaufoQbLBthRz2A3tDwQucRa0zlfPnbCs45YCABm0ZMVChjXNYlTWSb8fB
	Q51kR9YjjMGBho6YnOnfl95VVoUZZnAeq2lqROXuII7WO3ststIBAFMLLIUjqROkmpjOvEiFrRTC9
	6N/roakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Zm-000000096mj-2SWL;
	Fri, 12 Sep 2025 12:08:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Zj-000000096kj-3H46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71A294396F;
	Fri, 12 Sep 2025 12:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14DCC4CEF4;
	Fri, 12 Sep 2025 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678903;
	bh=DY2XJDeEOrzHxg96FTirSDzFFXROFVOwi0JgFBjMnyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8HLletFv8+PYS3mud5TlJ74kQnGGkI9mA0vhirZjyr3LjhNOJqVksvR6M7zyZjdZ
	 SYQvUVzc0Hh67Lc+6p420KQVyrMhYDgF3aiu+vG2CV0CegTMrbr9XRj+Jz54zrbXRf
	 RHoSgpiFD3uiyAiBrh3+ePi+efbbDRe9OjRr9bb6okSpkGvi8g8NacL9KcQdCkveOb
	 klnBk3/YuanWt5sX+aj6UwHmGQxt1JBBp+lcZkbxKishmGXxyR9uaTc6HA6AC8fekS
	 kJIghL3cEnZPpLQQyi5zpBCvQKcrWiYjXPANjUorED64ArvrKxP1lMsPX1fxeDCAp+
	 fzDGhvYDQxbjw==
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
Subject: [PATCH v2 4/7] dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
Date: Fri, 12 Sep 2025 14:07:42 +0200
Message-Id: <20250912120745.2295115-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_050823_839495_2AD5EE00 
X-CRM114-Status: UNSURE (   9.84  )
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

The Kontron SMARC-sAM67 module features an on-board house keeping uC.
It is designed to be compatible with the older sl28cpld implementation,
but has different sensors, like voltage and temperature monitoring. Add
a new compatible for that board.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 5803a1770cad..966b221b6caa 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - kontron,sa67mcu-hwmon
       - kontron,sl28cpld-fan
 
   reg:
-- 
2.39.5


