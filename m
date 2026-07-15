Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DB8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4HRh2PONW6e6WBYwL+bRJGF3U1xDlt9qqHYqQt/mB8=; b=S3uV8PCmkDF4OB838dBc7SCUh2
	2kUcPjPY1DymARulKWUAMeVO9jMfIFMII3UFIQWjGk/eXK4XV5o47J75nw/4R1zDk6L94W+WcQ0hc
	ylx+uCri8IhW74Rtv+ldOjzp4hdbPB9Mub+M9O5w9FXqeTScYuEypo6RLt+dVc9sHQ/N6kfSn8zGj
	xDdoQzm2mvlhVcmqk4ShX8EgsMyAPwe0xTdF7JB6VD76GC8SuvsaEEiGARUopMVHXX1IMTfwF0Xlm
	6cAcZGV8lwuql4szmoCALUYuuej+HVFYrHMsRkmSkv0s9RmxDbKYf7fpBzorYCViZoZrvb8r20Kef
	qxWAaXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvfC-0000000EHWT-0dAP;
	Wed, 15 Jul 2026 09:12:22 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvey-0000000EHKS-0us2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:10 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 795FC140015E;
	Wed, 15 Jul 2026 05:12:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 05:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106727;
	 x=1784193127; bh=f4HRh2PONW6e6WBYwL+bRJGF3U1xDlt9qqHYqQt/mB8=; b=
	AbUl8UD0NKu0OJyWD2u4Q1XAwtNEdC9yQh7MV8VOWaZb1LYUEDfX+1rAlxOrh4Vb
	j2RNLCfkpcLpzfyxUJwSX686NLAqU7UyJq9c/3dbJwrACF49rNXFCxJl8aBMjWOS
	dxV7std0EMPdlaOCJDXfeikIwjSdg30RZIIinIj9UAEI+D3Rc21dIgAUWH2tYVE3
	tk2uRkjlUHVQ36ro2sGgTYVi/AgJh04zcHHUKpyqV9ggAhNBNL52k1C513E+YqQ8
	Fv1+lkG8NzwBvAReQaJrbgT3epZ1oy8PMBPl/GLQHkwi0Rc87GjRaegxjDQZzpYn
	14PUPNjW4lm21592UCQGAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106727; x=
	1784193127; bh=f4HRh2PONW6e6WBYwL+bRJGF3U1xDlt9qqHYqQt/mB8=; b=O
	LPX7VFGuOC6Sabc6EiWqbwywGNxJAKeQv/iUKJBCHPMDSg9C1bhPYoUzRoNNYHmB
	m+DoecJrZCNbQICdPzNfGJiz31YKE/NuoEww6r8u+WVhmS1dCesUOG6VVQY0jrYp
	B2e/nvZViNfvR+8S+qHum82Rk2sOrDutBaDaniMaBatlSowIuB/HzAjUNwYE2UEd
	VPsr2L4Wnl9H8vKQ+G49jlsRP9DxM4cyQHKdvptOHwajaEMiEknixXDlrpQnLuRa
	QP1gbQ/CVbltj1nRPDzgUZqPZeUdk+h8zrebA6ga/XU1in4QFXMZB5GhqGWxR4AZ
	kV4RbLRrkR8qU2mkPuMfA==
X-ME-Sender: <xms:505Xapgc6L6AVuexQ9Xo2SW4D8WawvKOPMcG_Qwq5YtQONuVmYsjpw>
    <xme:505XauZws8iINoDve1jDrxpyBJKVjWERSREXj2wEn5zaYk-Ktt0BH1N7vwjgpKVN-
    bQ-1o4vQT4L8R2hwsVrsBNZ3zznVXayxjHa5mYvzzIBmPa33ZzT_WE>
X-ME-Received: <xmr:505XaqPDl7KCRYwQ7iz3AVMZdWEZXzR-iEaVk2vwnkDPdRvvuVI5VG9YijIGYVLfPZ_L2li3mgofhKuNPeGi005ihPY1hH3HfcXM0Q>
X-ME-Proxy-Cause: dmFkZTEW04HtTf+zNef7m5r/Wybx1ydSPmxeGPzAYI5SWVBIt9NF+gliEmmzRtNMmeyncy
    0yH12g4gcKN4bwgQ9/fxkVDLkA/oJQKBqhvmVPbO8YzIkt35ekG+/k0lN1XR1RUOe2vlYy
    9oh0a9s2MeN7rHW5UMydYFPb+rmR89Xmz+kCkWxhD+fm56RfXxSYKM4k+nBq3+TLUtm39d
    wb/YON6eLtDPA751fCTGB9EwOodztE2RbFbzkkek/KiqmBaiq89taQ8SgYyX4XMGIxWBrs
    FEpjBwG/7g2vXO1BGnw4zPV7vNeivmHu8Q5ocRpo3auKeu4wiZy38k1ASmncIsKxkpduQg
    Sxbztx1UCoyZBkFI5KZinpRhQoaodwh5fddm255XUArpeSXsIP7tbP9guhW4USnO88izTC
    hBtl/WqWYmCrHUY0LzIt3tGKSuHG/JCP3jSVr3tpxcd5kzJlzqy7oo4zd0A/KdkK1osBFi
    tOSKvVNQN7i1khBs9f9/8tHJGPKD7E0/b93LcyimE2XDY4clHatfp8coTbKCJAtZhMXyNN
    O8/jhYE/G0xSEcHLxN65l7l1Hvz4hY41/BTHsXN+4EovuiPLQj3frD029ldR5ESC2QG5O+
    kyTEQQZlBcsJgxZ0bZaggS5GbKz62RnR5uQZDp2FbSLokfGtKEVtJrzsBlAQ
X-ME-Proxy: <xmx:505XaqRveLZUpdwDlx_srif-A3NIqcQx9FF2kQPuZQ44WfMEFg3WnA>
    <xmx:505Xal7l86Pg5lOlvqXHPIOranzbJEwk-aXWpIqE6s0grKbR9fqvGg>
    <xmx:505XatbETpDBHAyYb2Y_J5jjn-TuqInkNb2vnRSb0cjpazV2qpr1QA>
    <xmx:505Xapawz4WJs96E2vgvFK1yPiTvNGTOkp_wf6tcA7SAMZ245ZT-Qg>
    <xmx:505XaswkYUnW3RLEkRNPen80RHtDthDk9UlHDP8zJ2P51adlGHX35VNE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:06 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:51 +0200
Subject: [PATCH v2 04/10] dt-bindings: arm: apple: apple,pmgr: Add t6030
 and t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-4-df65b2485710@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=j@jannau.net;
 h=from:subject:message-id; bh=S26aWssmrcL04fggmWOi1VbjBZkaSi2GWBxk3WpTUnQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwvxsKZ7apZAV+ZFrXcq25mfn+0v1nt+Wnpzq9/lLI+
 bf3fuTCjoksDGJcDJZiiixJ2i87GFbXKMbUPgiDmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKp33mf4p2jj8P7sH5+0eBXLM49mzPm5/aBDM8OK8wlTs/655vptCGRkaNtjd8S
 3JG+Zj+nP3LDt7Y0vXh/7sOF+RE/FxKCcmsPZDAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021208_418237_1C6EE8D7 
X-CRM114-Status: UNSURE (   8.25  )
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

The block on Apple M3 Pro, Max and Ultra SoCs is compatible with
"apple,t8103-pmgr". Add "apple,t6030-pmgr" and "apple,t6031-pmgr" as
per-SoC compatibles for M3 Pro and M3 Max and Ultra.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index c67b67ba065a..1d2001836eb4 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -38,6 +38,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-pmgr
+              - apple,t6030-pmgr
+              - apple,t6031-pmgr
               - apple,t8122-pmgr
           - const: apple,t8103-pmgr
           - const: syscon

-- 
2.54.0


