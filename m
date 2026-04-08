Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15E710F9966
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GmPl6J4jB17Varcsi4V1UR3hAq89yumamPtr86DJrg=; b=Yuh8kjskwFtv01anrO7sTMeILB
	RSsmXqp7IalNoFjJUpTivAnmqDRnB+F/tiO4Q/dDewTYMmM9gLuTBg0r+YUntP9Ak76X7jeqVpMMM
	AEYNkuPipAyjJnV4I9eXSnJcGm47tZbqzBntK5Z+BoFk7Dxxekrw+DGmQu/YBNtVwZMVQl6DFMllu
	xxcjbbtcgA/zzoXyyTcws+QQONGXhTRJY15d3KwDWqkQCo5AotPyWXvZZ+dCztgqwweLX6uQ1cvsR
	4Sl51tqshIbUVM4WvfHBukg18EP/x/OaTGLUjYjiQJkHbWVfXjQ67/EIchHIEoYxcWP0RaUa17z7e
	60f78B/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAX2k-00000009DXv-1SwC;
	Wed, 08 Apr 2026 17:50:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAX2h-00000009DWq-0510;
	Wed, 08 Apr 2026 17:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775670608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WUgW9QQvsQ/1tplZESsWz7Wep0/Of4QT+1d6Jc3eEbZ3wfMc5jgyEo8zp5VE1QEep1Zth/0rMrwM9pOJdkaie7ng4NCsp/o8EiTjxumEs4Q6Kq/T61UITprLv8o9ob+wpU2dNCviP4is4MS6rEmzQ0LCxcbg/bXCxf4lPfIzXb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775670608; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6GmPl6J4jB17Varcsi4V1UR3hAq89yumamPtr86DJrg=; 
	b=BtMCx5XwIIpm+yCf8kHmGUgnzH3gD6qUhwwUrLHmbv+bUwmiUTF8WAVqwZTciWho87D09RtrYDsWe6mNhYv6Buw+dpuJZlCqhmuj6MbUxJDOnhCx5tiq7ZjJ8DJA4/SFdv+R4fNKQkkxZggbnhOibGjGb97bJMI0aKb2N7SqUJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775670608;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6GmPl6J4jB17Varcsi4V1UR3hAq89yumamPtr86DJrg=;
	b=QOTRw+x8gQQ8MXCYUCas7EVjNMPdXJ7EINh4dYeMz1HRiw4ukKMVZMm12PxDxJrx
	S56fWpiyinOT+A7OFCxvA97npAtED5Gw0jnjLmidNSPdYnwCm1awMd2gYzJfZHSIVkc
	zkfYi0/TZsfLXBYvr57xQJUeeJKmmVXmkfyUqYEc=
Received: by mx.zohomail.com with SMTPS id 1775670607018400.149799866522;
	Wed, 8 Apr 2026 10:50:07 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 08 Apr 2026 19:49:39 +0200
Subject: [PATCH v3 1/4] dt-bindings: input: adc-keys: allow all input
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-rock4d-audio-v3-1-49e43c3c2a68@collabora.com>
References: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
In-Reply-To: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_105019_572651_4D490A95 
X-CRM114-Status: GOOD (  10.94  )
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

adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
property. This makes it impossible to model devices that have ADC inputs
that should generate switch events.

Replace "additionalProperties" with "unevaluatedProperties", so that any
of the properties in the referenced input.yaml schema can be used.
Consequently, throw out the explicit mention of "linux,code" and extend
the example to verify.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/input/adc-keys.yaml | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
index 7aa078dead37..f216bb874f26 100644
--- a/Documentation/devicetree/bindings/input/adc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
@@ -33,15 +33,13 @@ patternProperties:
   '^button-':
     type: object
     $ref: input.yaml#
-    additionalProperties: false
+    unevaluatedProperties: false
     description:
       Each button (key) is represented as a sub-node.
 
     properties:
       label: true
 
-      linux,code: true
-
       press-threshold-microvolt:
         description:
           Voltage above or equal to which this key is considered pressed. No
@@ -65,7 +63,9 @@ examples:
   - |
     #include <dt-bindings/input/input.h>
     // +--------------------------------+------------------------+
-    // | 2.000.000 <= value             | no key pressed         |
+    // | 2.500.000 <= value             | no key pressed         |
+    // +--------------------------------+------------------------+
+    // | 2.000.000 <= value < 2.500.000 | Mic Insert Switch on   |
     // +--------------------------------+------------------------+
     // | 1.500.000 <= value < 2.000.000 | KEY_VOLUMEUP pressed   |
     // +--------------------------------+------------------------+
@@ -80,7 +80,14 @@ examples:
         compatible = "adc-keys";
         io-channels = <&lradc 0>;
         io-channel-names = "buttons";
-        keyup-threshold-microvolt = <2000000>;
+        keyup-threshold-microvolt = <2500000>;
+
+        button-headset-connected {
+          label = "Headset Microphone Connected";
+          linux,code = <SW_MICROPHONE_INSERT>;
+          linux,input-type = <EV_SW>;
+          press-threshold-microvolt = <2000000>;
+        };
 
         button-up {
             label = "Volume Up";

-- 
2.53.0


