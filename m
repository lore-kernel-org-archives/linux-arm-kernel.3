Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FEAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5iJGCuDJqu0rB7KJB0ciLbI85LaXK0Thagu9DQ0mzk=; b=zjc6Hwwb4CuxdQbPCdUeQpOdEv
	QwyG+VyzFHe1GtJrsI+6uiaZWqtWdNv7Z7rRc1oQFmW4WI6zdqQoeVYcillYrw51AxI4x3dCrtNsf
	cjgSIPZuuVMn86AG3afh2vV4nPRSwQzGXMQvdTLbQYfqd87e7gDxr5ImSEUWrrua4aLeG5t1S1n7O
	GjwpMXFW2OFX18IsASSGjXL6r+2Eg8SBIq7tZHqJT3TCNfAsnQC7Mo3lO0ZiHMi1ROqqTehDDSqq2
	YwH7FbKTL4Vdq7gDPUUQDj5lFLK8qQsdo5W3HlnsNKEwGfMvX8fkM5fbGviRunKQKC0j+Bms5MrkU
	zGxpdfBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvfF-0000000EHZb-06nn;
	Wed, 15 Jul 2026 09:12:25 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvf5-0000000EHR0-1lDi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:16 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A53A4EC01EA;
	Wed, 15 Jul 2026 05:12:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 15 Jul 2026 05:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106734;
	 x=1784193134; bh=l5iJGCuDJqu0rB7KJB0ciLbI85LaXK0Thagu9DQ0mzk=; b=
	KpIr//Fc2K3H3eAFCjT/QhGb4umCLbu2k1G4vyU+1STAH+3JsFlOmBBfMc23xyCH
	WwYz4N9VEmM/A350SFp3qfrR+Wa4+k2aCmE6f5BmvHb5AJR1aKrd+yU4iyWEkNha
	xPeafVyP625XhX7x8gMcSb9R69eiyHWF2uP9LBKbT1N0sJuGuPo5MzOb+9jtIdxr
	C4rCGR7r1iGNwkghOR4MT5233+m9g4Rb7DulgM55SsCU+x4Qsyo/ZtFr5Bl0k7o+
	7hZI5jBFwy6JtxmLgzQ6BrdjGj5pnstpAZhhxx0wUPnPfBJt4n0hPpPsxMHd5ox/
	YdITKNCiQe+mt/e4/Sq9kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106734; x=
	1784193134; bh=l5iJGCuDJqu0rB7KJB0ciLbI85LaXK0Thagu9DQ0mzk=; b=B
	bAnhkqq4SM/LwrXIfdoAAY7ZlrO1J00NHY7iHA92WxNphWNsCl2MpJ1+AEFsEXML
	RM6BcbMwzRlUU1KSzXj8kkf7HmvoYmX23Od9/Y5tW9ny90JMxP3/3U52I319LNzk
	dsC7P9KqMvw5TZPkMqM5ia3qC0SY1ijBteel8TxzRTd+570XwVZqCxSU7WwOCIaJ
	BxAIR791R97/jz5AofyyV3ZCQnocqLco3/r4SxtE1z9A5h+CvPoyapKAZV4vpfAB
	G48kIijolARzM+pzZ2dz0gSrN9bSrCrnmD/Ozy17iUjoRYiT1yl6BTpDcq3vZniA
	fDTHlDGxsp+ILnhNeI1uw==
X-ME-Sender: <xms:7k5Xau1ibRmYj5k7X-6Of7FsoVxzpGKbE2CvUGBQ48rt3QeQQUuRyg>
    <xme:7k5XahfB_pwr-AEzYdFTjysoJg0fDr4j4Cl0JeZaxxxu_bajqHl870CSXIFUMAsbM
    xnmgd-Qhmu0wQMxHBDe2qTLLlN8ZUDkm16iml8QdLn0VoLlHg4lEqs>
X-ME-Received: <xmr:7k5XaoDu4CtfJRoGcvqj_AsXxngAk3--vpouHC_tDSOeOSfQhVLmok77TMIuURMJ41EwIiIZ7RJqJUOnKUcib50OPUiDtvAlzALnmA>
X-ME-Proxy-Cause: dmFkZTFQ30NmwFVOxD18GR49RMUGPlt4wtzp6qHU+/Q42pWknwtU9lmQUE9J/cZRNpkV4h
    Oa1sghCZMC/sT0Wp9Ps62Q3CEBBPH+fXeRM2jIv/pxCbnWxTmCfjYxhLs6gUyptFQtahQg
    67IeBYoRdxli1SD565JS4xBQPDun3OvepuQ5bB9X1WasfmG2hVK8nPeLrIdzdnOOmmmA9f
    PIazLxjdR/wAjDHKdm/2ofcNrC3j+9neQwuzsXzGBE0ZobeFRdNyisZom1ah6GKNJU8Tv/
    W+zvxCnOsqb2dIlbPyff1onGFSTeckyn/bHUkdGMUwrZf5N2N3YlRAKwfrGfkUDwXQelEM
    oSZQzRU07pvbkiYJlvLTuHuY7IRM2Uy0xp1wBYaI3Wh7Y/LHZPn2k1GWlUiAlwvA4Vi7h/
    ADoL52IS/1t6KwL5LVrWQFNInGgDKM5VERyVuuL3p5ccaTY+43jzTZn8RXlG/u63MDeKXE
    miXNS9gD+f25mj6tN5qeZQa+Zb5LXC1mWGLyPf1IRlay/6PB0rmajPqhJ28Tzop7k5DtbC
    LesPr/zkqfB5VUcA8z8ecIN3oyaOvKB4oEb/W0m6YFn2n9V+MyEKqBHy3opP2YG5LUjPjv
    y0jCimxTB5kU61RAYx0LpeAbRkdROQ/gD0jFt8eMT20JJkzlZWP2gY5O3iVQ
X-ME-Proxy: <xmx:7k5Xar093kBpPJGnP7rxC2BTqz7HCO_vTAd7s1mVM2dja8q8XpH9wA>
    <xmx:7k5XagMcg7V1xU5R5J7q4856_NOAYiL1XWvzbA_Mkh9EwRsb3Hjh4Q>
    <xmx:7k5XahdHfSuJH_FxW6jt9kOJEqWGdzvRhOwgzDkRK1rI4HgA4v_kKg>
    <xmx:7k5XakOMj9P5INtix6OlXjZ0juf2aVesKQJA-HDLPezbp6U1iflsoQ>
    <xmx:7k5XarEo7l4uMxgQb1X4G7LPPZwjVYaguBvRu5xBPYHnnxFHpr1jjYKQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:14 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:55 +0200
Subject: [PATCH v2 08/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-8-df65b2485710@jannau.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=j@jannau.net;
 h=from:subject:message-id; bh=w+oFqPQZyO4mUC8Cq1D05yyJUaa6OXRaWufm8OBJuxI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwv5tSUzpeaXmzxqbP0dmoJ/zZhSfb+dXMX4kRK8wud
 V04GXOwYyILgxgXg6WYIkuS9ssOhtU1ijG1D8Jg5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOrJMYwMy2RYGs9Ozwg8M5/FWu1kcb+J5mLrQ7eKKm+uDhW3KNp4kuF/ri2H7dv
 Hn1+c91ies3bz1Br5R3/VitODvzcttpTVf+XFAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021215_562209_355313FC 
X-CRM114-Status: UNSURE (   8.91  )
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

The PWM controller on Apple silicon M3 Pro, Max and Ultra SoCs is
compatible with the t8103 (M1) one. Add "apple,t6030-fpwm" for M3 Pro
and "apple,t6031-fpwm" for M3 Max and Ultra as per-SoC compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index 25ef04b60ca1..dd95037ea5ee 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -21,6 +21,8 @@ properties:
           - apple,t8122-fpwm
           - apple,t6000-fpwm
           - apple,t6020-fpwm
+          - apple,t6030-fpwm
+          - apple,t6031-fpwm
       - const: apple,s5l-fpwm
 
   reg:

-- 
2.54.0


