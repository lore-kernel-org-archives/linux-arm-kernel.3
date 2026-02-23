Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAE3E98E13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmBrF6vxkpldwWJ1xHm0ntg0CUP15Rh2k0uHhJgn2QU=; b=HkFAbM3qc0ThXdhitau0xCFiqe
	EuVO/ENwlq9j0mOEcyr/VcQQxXFCZSZz9DmFLvspUiWZaeGK/w0tNKhGmnAGMxWluuIL/kiizgKQL
	46CkpXFKhUbsAN1h32NAp0883ohX6ug9FaEHxoj4itAPTNrUaEUUP34tf2MOFLleKcXbNSM5nZtte
	Y4qUU5KNgOgR2NgpdEZ5OEsxJB7M7A6v2iybvvFahMifj3+KqxcayDRj8lskwlXOFr+VuKAc2om8h
	gRAbPRmdq6z7BHkYLNgraBBm+VHo8Igq07c9t+qQsG/Lg1np/4bWxURpeZWITYaD3o33XvWJu7uU3
	klUiFyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSov-000000000Uz-25CK;
	Mon, 23 Feb 2026 10:05:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSot-000000000S3-0w0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E43240A23;
	Mon, 23 Feb 2026 10:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9752AC116C6;
	Mon, 23 Feb 2026 10:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841138;
	bh=h4Fmnm9DvFB3jjLMnVgmIRJrmS+gvXG7HnQy50p7Cpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mk2Wwfz2FCtMm7F+LirBqE0NRbtFtvMCWndhwc39OSeMgt3Hv1MnkHOfMVPAEc5m4
	 vsxqDd2kkiJhRZDr6TJd0nbwWnaX5qoEyiiVd5ZHSYutcAiWGBTTo4AB5xD/HTI665
	 ndKBJNYr30dt2+Y5l0TzB9oAm9ZUAaEsoAeCvTfmt36oFffDgtCabaOEugwyrN95+3
	 IS4nR+3pqnbuP48TTcNRgHP28Un1IU8b6xMkX4hVQvcIweWHf+E3o+VC9Pl8dHqV5k
	 axgwwqptV+31zb3HwEth//CmW0lvTUJFGpCkcXerlQopUgqZmvoeYTizdnMcT8r3om
	 RUgZor/b4RwTQ==
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
Subject: [PATCH 8/8] Revert "dt-bindings: hwmon: sl28cpld: add sa67mcu compatible"
Date: Mon, 23 Feb 2026 11:04:53 +0100
Message-ID: <20260223100459.844967-9-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223100459.844967-1-mwalle@kernel.org>
References: <20260223100459.844967-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_020539_375248_44201F2C 
X-CRM114-Status: UNSURE (   9.21  )
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

This reverts commit 0f6eae86e626e0561d2f545a3183be2e12108410.

I was just informed that this product is discontinued (without being
ever released to the market). Pull the plug and let's not waste any more
maintainers time.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
index 966b221b6caa..5803a1770cad 100644
--- a/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
+++ b/Documentation/devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml
@@ -16,7 +16,6 @@ description: |
 properties:
   compatible:
     enum:
-      - kontron,sa67mcu-hwmon
       - kontron,sl28cpld-fan
 
   reg:
-- 
2.47.3


