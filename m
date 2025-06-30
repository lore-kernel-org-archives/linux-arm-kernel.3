Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3F3C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PpIVd/iyvJzOX8nF42c2ZQhA/JbIIXEjxLRd183mMY=; b=S6NlN/gx9SWCc7QJy2oDrV4HcE
	kUZ40kjv1Xv/kSOy4VNq59UeQjxSe/GZ3uMnGc4GttmHphPbYQ7ubC7sqkwg5F3NmoIt8WyPblIvi
	xbqLRvTk+tAidIRfoIo63SJ9xPEO9r5yoVate67+srOs3XrRhugiKIuPv+GXu3YaldU//X081Wl+x
	gCX+I5aPnk/Jpu7wbsc66rmHOnOhxXIuJGVbRZsNGtUvdY7U7FV1N7l3H2AiniBZrffxL14pvtPfi
	/eY2dbIcJfRKIpj16RiLC5Ltyrh5Y67hElrtf1B3xplL1SORuhlC9Dea0nh/1AEplWHPU8pD/n4QE
	GiqYUxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBu6-00000001uUr-2mwK;
	Mon, 30 Jun 2025 10:38:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBc5-00000001rrb-4BD8;
	Mon, 30 Jun 2025 10:19:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751278776; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UenH2PSwuBcCB0VSc0tN7EZqkcRncrF0BlEgwCF+98x3a2QZvtPfHafdjPmS0npBh0rdxF2slFXtsonSe3J+xjU/ES0LuJtnViVuiU+ZraEeQQc4yfy8T1bavVqwtPyYCDsrajgLf/TjBUO0HEJBZ/KJNMaF/pCKc6O7WPJKicE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751278776; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6PpIVd/iyvJzOX8nF42c2ZQhA/JbIIXEjxLRd183mMY=; 
	b=T1ET82UWFUv5RWR6gcdxiXnuqnbJXS0i7ydKBYv4u2Yr8iPH1VYOd8CZwX4uzD2DXZzKFrnRckm6V1kjhk/eghCWfnhfN6RrQesArjh4O3uMcXMZJNGS7PFBjr2fD2rv05W6dUck4dZz1Z6ooSENh1YBR0NUyenfHzp/88rZbUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751278776;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=6PpIVd/iyvJzOX8nF42c2ZQhA/JbIIXEjxLRd183mMY=;
	b=f5CowVq/qV4oeWU9rr+BLMx+h7M6sWL+uKZOpIB+9YjpaaLW8Ye/kNtQn/YHEYSB
	AiiNmHxJHZ+VQgyqqJo6rn8SbQLwLn3LOAwcpo94KVcSruABG2tP9PIIsYdbAcTW1iK
	4yWnAoFepGgA7zFkOlfSfXiek/wMfzQseQR/L+wA=
Received: by mx.zohomail.com with SMTPS id 1751278774601621.415894842219;
	Mon, 30 Jun 2025 03:19:34 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 30 Jun 2025 12:19:24 +0200
Subject: [PATCH 1/4] dt-bindings: input: adc-keys: allow linux,input-type
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-rock4d-audio-v1-1-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_031950_099903_3C506D67 
X-CRM114-Status: UNSURE (   9.61  )
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

adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
property. This makes it impossible to model devices that have ADC inputs
that should generate switch events.

Add the property to the binding with the same default as gpio-keys.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Documentation/devicetree/bindings/input/adc-keys.yaml
index 7aa078dead37816294732501e1983ab869f38311..e372ebc23d1651d73ef3749a56d54872067037b5 100644
--- a/Documentation/devicetree/bindings/input/adc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
@@ -42,6 +42,9 @@ patternProperties:
 
       linux,code: true
 
+      linux,input-type:
+        default: 1  # EV_KEY
+
       press-threshold-microvolt:
         description:
           Voltage above or equal to which this key is considered pressed. No

-- 
2.50.0


