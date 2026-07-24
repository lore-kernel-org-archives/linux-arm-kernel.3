Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29082C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfPtBwdr8IfR98eQ9trEccphSZy9HVrDnNdNbRygOTY=; b=x3IfZCm3jdXw0hRprW0ShGZvBh
	FDLODxj7L5DG5frQVOAcRsoT60liEIDH+7VFG2i3T5QjUrWZSOU2HGL8s+ID/9PJRdZyldtnAyoKm
	mwMD1A/ctHd8qLuVXHV+SaS5vXYzTOd1GyWcSbM2Z/smAQwmd2Jans9yqiVFr8X8Mhko0nDTEviks
	aXurcjW+AZNxjs9h3/eiqIHzTJf+EJ+hhvPTqRB2hWBCFBNdzJdztovJAmQW5gby3NFYORq8j+yiT
	UFRUjMX9qK4a1kOLqMjvBsyh/7M/CznjbYCT0SCVmhEAO4OSJXhnurSK7d2pwDuErEaCx1NngYsTn
	HO5fc5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSZ-0000000H37I-29zg;
	Fri, 24 Jul 2026 18:17:23 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKSH-0000000H2xQ-2txK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 18:17:06 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B8FB77A0140;
	Fri, 24 Jul 2026 14:17:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 24 Jul 2026 14:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784917024;
	 x=1785003424; bh=MfPtBwdr8IfR98eQ9trEccphSZy9HVrDnNdNbRygOTY=; b=
	YoaOmurXaqorUpCdKqHWBKPOv45oVI7anexJ8lgypFo6zzjrxpe8EWQlZfGWe+j9
	ZpqmuC/GwcXL+fEQ752oOEai1kJmF72JsALp2fdI22C6lK38+nllwMxtTTy3aMzU
	yAJZpnmiU0B2257HOMEGTmQo3JgpyZQ0z6dpEam/9LuiHlFmuP8ELQkIRXtggUhO
	rB+FyDiWvpO/RY/kJgzuq2tcmx1BWJEWMDAWY1FrlsSw82wYqBcY5nJQ1CI5WGtI
	5OJauYn9KgQufrjIF1740KfSwZSnAXcpMBAvfvMq4PGoXYYqbb0MMEXRC8IZDV4m
	7dGKUrud0ix+es3yDzE4AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784917024; x=
	1785003424; bh=MfPtBwdr8IfR98eQ9trEccphSZy9HVrDnNdNbRygOTY=; b=h
	DPOJCXWf8ptp92Yoh+kTsdeLwoTq2IW2k5YdypBX9WEFktTHOophlfcC72mplQwN
	IB7Q+3qVPHNV1hUTYi0gL1863JxTIp0t6CReA4X61WNmJRT/rVyfbuvNrn1jRQCo
	VXg1gXzqndb2cKtbCXmv7KSHrBzZj9r2iqfunNEkDqmaLlec+NJlMDTJPTMm2VTN
	tsKP/zjOfWQjhRnydCgjIgbXc6nie0a5mdglznjJQ7DHr1T3W262gQIWq/Wbfi1B
	xjVijwBctWbOwDwHXJO4tFMaqO8Z7QK98oxJIvx3e1+MhC2jTpqIAyeOwT67nHcW
	Qc5Pkce10hRUqMiBFR8wA==
X-ME-Sender: <xms:IKxjakATDSj1dxNY44hnwawgqQ6UQuYvzJFCF6xbyPaoIdA8qQUVrQ>
    <xme:IKxjahOLgi4PKJpyYyf9D2ZYOqx-6dZ64LEpJmVJfB7cDJyMM82w6ttbcLU4gM69p
    1d1LrGzdjIoae5NFg723ZMQdV_syzmJCD7EWW4OX5lCuOlpmIXMTA>
X-ME-Received: <xmr:IKxjauP7y9J0yCkIBlIecIyOGrnW8yN1wN0zb40Oh_Djogq0siWUkmdF9iq8oM_uL7gZZhShJrhpt7SfoGLTuQPk2O6VwCjpqdk>
X-ME-Proxy-Cause: dmFkZTF1FX2rMAzDkHprU+9SOL/dAhdcZMnSKVMN5sSZpEXUKt0tpgGTqps5g9gzvwIbS9
    s+sfCmoO948cbdaFVKnKsFQZWlQG5l94gQ3OMj/lpmOBEFweLBWIwVRLX2N9lNc3poNr7O
    L977RANIhWLezmIkgwNFbh0KndpYGeRMYxoZTX0qtVRW146Bj7liiLUvZi0nEietp5Cetj
    sJsRGwTLW9VSWvYD3J5JA907Ht+C8uVy8a9gtIre/v7Ls/lg7fJiukWLBXmui4C8aVyG7o
    /Kp+oo5oKDhOQFee530ewC3yY4DxTEPsylZrAsmd6ePp8Q01nTX08+81q9r13bu3UjqCHm
    HS5MC+YEgtyvMrXG+Z//TbC5mAC75zk2D4n4c+9hpfpMrEyrSl6pJlUXZeI9PERAPZKrJ+
    btgLjN//eYP1xeviAZv00OSRv6CFSdiqCuCEa2SMjTt8IrVVY+pUYYPWlHiiWbpsWo+JEd
    8/ADUHSy027EzxZ0tOMrGubp0c6jqQrCXElaExv+e+n4RI30fXTQO1YyQeNYxy9E/20GqU
    LFZUMUWKX17Wk2yAfd2HmPPpkSJzTyxje2yeEoJyuFxsef9U25AN4TG22IqwHbBkQzMTOv
    3NJHWyIgXkjFjalp+xb5yjYkSh/MNafUNWL+46wuN0NF41GX2NvnPy7sf8YQ
X-ME-Proxy: <xmx:IKxjalvNlLFeHUBOX55-qOyc6pvKlccBWt6DORc-XvTv2k3xvISIKw>
    <xmx:IKxjaj9RXtFPY44SwVa_oO9JH8KS1kGlE2e03-nHWvupJmPzU4Bslg>
    <xmx:IKxjahHJVcxLeNPeeCgNK70MDHGCYLsjohlABcGrpbJgFZ5iI34rcg>
    <xmx:IKxjaqShjsigbumh3U27tDv_ExoVBEa-Lafkd_rGPKxz2CpfnVbeVg>
    <xmx:IKxjajm9mE8rhARhtDmXNotV6cjshRroA2Qw6HMoT_XGogNVAxhZ9FGA>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Jul 2026 14:17:04 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 24 Jul 2026 20:16:45 +0200
Subject: [PATCH v3 5/9] dt-bindings: power: apple,pmgr-pwrstate: Add t6030
 and t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-apple-t603x-initial-devices-v3-5-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=j@jannau.net;
 h=from:subject:message-id; bh=EOha7mQGj6gCEN3iU4Vtes8noxMlN2Ugngc5Pw+LtX8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzkNXybFX/O7o7TyNt1utMkaeZMy6QXu0q3H8g76LCKe
 zLfdF+ljoksDGJcDJZiiixJ2i87GFbXKMbUPgiDmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrVfBn+hxwKkCmYLPou3fxNm+rS36dCHSrnbJGW19hruP5U2Lv6lQz/NI71G0e
 ccW6Y9M3p5yUNxgcng18Yxj8sbn850yT3EOdvRgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_111705_777503_CB1B963E 
X-CRM114-Status: UNSURE (   7.76  )
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

The pmgr-powerstate registers on Apple M3 Pro, Max and Ultra SoCs are
compatible with "apple,t8103-pmgr-pwrstate". Add
"apple,t6030-pmgr-pwrstate" for M3 Pro and "apple,t6031-pmgr-pwrstate"
for M3 Max and Ultra as per-SoC compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index c9be097cfba0..e269f433524e 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -45,6 +45,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-pmgr-pwrstate
+              - apple,t6030-pmgr-pwrstate
+              - apple,t6031-pmgr-pwrstate
               - apple,t8122-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 

-- 
2.55.0


