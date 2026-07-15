Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D54DC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bv/arUod9l00opGcXfe/lRDuK5gV6GDy1OMTK4lRcbQ=; b=SubkClltUBoIR9QvyKZ+X8yenK
	GlA5+xULy7APWvjCGt1m2Ueb6TKqX+L8gMoG7NKW0QsQv+kc0gCChqFdVUFklz1L5DjQr8qeynjUb
	HiO/cW8R+lNniUpwILnds4O6fuYchvWEx0t6/ZKnawYbTMEVkkex6A0bgCBrvLhanDb5M51gN5ka2
	YUymWy+yMp2PKthShoPI0guvlXN/RfdH6FSDAsAstVjms2FlFnLcBIIPST58Bu7OgIXlkfYDgfLU+
	Bv2YJayAFu5ZS6B0YbsBV6GivNc5V0BZOAuC+ePT4oxvO58PV+J4/q5y46yoB9WkB2sQe4Rob5I7/
	MJSikp/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvf0-0000000EHNK-2WVj;
	Wed, 15 Jul 2026 09:12:10 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvew-0000000EHJE-2JJJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CE8781400124;
	Wed, 15 Jul 2026 05:12:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 05:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106725;
	 x=1784193125; bh=Bv/arUod9l00opGcXfe/lRDuK5gV6GDy1OMTK4lRcbQ=; b=
	Ej6NH5iIG4Lxfaj/Pr4MzeqVoogzzr2NcmDzrsc1bMnhd/QwbWeiYxWluRxRMMBK
	rdBxzCUxk6kVdqhBBjBHaEiTnRUr1BlnSWEkh098F6rrhiDw/1rakoRWMBdqCHgq
	K6bpiTw0bm+xr71qarr0OJOoevpYEKhC12BzQAKhaZGtIUpQjuapK86JqGf+fw44
	4WvJtFv4KLGZ4QjWSsv6RyCpyZX49v1oLtlRwoTqnKgdql8AeOstLJWGK9xJ2JCD
	rGFXTLXbaLaNCm+QHZoEw7tzoPvnAn8CEz05yAd9A/GSrpvLIOifZECyPDGSoRKq
	flz76xUPQ3/2mICEBowAKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106725; x=
	1784193125; bh=Bv/arUod9l00opGcXfe/lRDuK5gV6GDy1OMTK4lRcbQ=; b=n
	ih0J9/AzPc+0niAbNdVOLt6hN7vQOVz72RvnwA40OLJ7lzBcWFTJSUya2tNGNVyk
	HEfwzSu3R/Ec2o0JWAcpU0en9O8ezoSRxYI2jjEo9cE680o6hBNqpBkVykUklYbI
	Cmo8HFktr9ryUpSypkIRAg1TqIYtlQPj8/WDLWWtyddPbpkzKtmMD+FgksBp82mI
	ZMaaZhWoie/7csUKXTYk3zrTnBbp/Dyzwk5AdV2kLHICv14BgHmX+3YpFGu4T4z5
	2Rb1qQ9nC4Ove3N8r0kDAaWp14D3LGjQd/kJBmN/EVZus3cOYCdfXXIUn8CgatHO
	6SRWW/ptJZma6lzP1uobA==
X-ME-Sender: <xms:5U5Xailu4Y2ETxZtr4UmzZJE28kKsxd6Fxd3AjjgdyJXl2u-FI_XjQ>
    <xme:5U5XaqNxz9diQHoXa3XY7lM3x1fGXJhK00NtnwyuXEHkauEYk992n0HPooSVrxoer
    25mOVF0Po_RbpgGQ1ehWStcxRuGMFisrIprhXjTiNeZ4S61-S8zaj6M>
X-ME-Received: <xmr:5U5Xahziad5BoSsGyEdQcXSNr1Htai4gu2SxQYTnBrUcyprafXol_lr6QNfS4gKQ8FuHOnG5c4AifHDzburydxFhLNdDhQZ30gffUw>
X-ME-Proxy-Cause: dmFkZTEW04HtTf+zNef7m5r/Wybx1ydSPmxeGPzAYI5SWVBIt9NF+gliEmmzRtNMmeyncy
    0yH12g4gcKN4bwgQ9/fxkVDLkA/oJQKBqhvmVPbO8YzIkt35ekG+/k0lN1XR1RUOe2vlYy
    9oh0a9s2MeN7rHW5UMydYFPb+rmR89Xmz+kCkWxhD+fm56RfXxSYKM4k+nBq3+TLUtm39d
    wb/YON6eLtDPA751fCTGB9EwOodztE2RbFbzkkek/KiqmBaiq89taQ8SgYyX4XMGIxWBrs
    FEpjBwG/7g2vXO1BGnw4zPV7vNeivmHu8Q5ocRpo3auKeu4wiZy38k1ASmncIsKxkpdusl
    R7ga0pukykfz49LSv8iX/rJWFQ71xIEuQD2gAj16ro2QukL4brZMidz5uCSBrJQBiClD3P
    8Pcb8fGruRJmkNh4j1JZTjbbgQo6LEbsuYo0jC8FQhC0+XwZxG1M6xJZvVJTFenacbvO6I
    RoGx6DMmSEsNMMLtoewQi/yibBzvoEUjjezHl2CU+qwLE6i38OYsbwv4SOi7z86oRg5c/a
    R6B9hzQaZ9k0aStw709VzETCyI1DENWEAp7JCSHij/UvJ2bIorBG0DoIksPahIE4kNPVNP
    rlkdJ3/uTAvxEg0Xap4JHNRS18hl3v9qU5QpF82bN5EeDnE7DixlR6zsjKcg
X-ME-Proxy: <xmx:5U5Xaikf3Cvqe4uuuEkVjE3-w3TrllXdLOGxexLVXHEHbrmdEX7I3A>
    <xmx:5U5Xav8es1OBRBDwzCusg4nURE1-rLoWstw7VpurFER43Mt16ecnyA>
    <xmx:5U5XamP07PDe_CHmZtC_4-ciCc2UMJjOQiSS6k3AKUzc2XjAYt1PXg>
    <xmx:5U5Xap-d3uMf_TBtmop-8G01C7WPft8BPL8TsM6VX96wiGBshwXeJQ>
    <xmx:5U5Xaq2asfmWoRE08qhKcBRl26y17spTdL8y88oiJab4uC-KvbT9vUc4>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:05 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:50 +0200
Subject: [PATCH v2 03/10] dt-bindings: interrupt-controller: apple,aic2:
 Add apple,t6031-aic3 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-3-df65b2485710@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=j@jannau.net;
 h=from:subject:message-id; bh=L0b7qOk4f9cIVTO4+6vKfh1rtbZML3fU+/KBOYxvoLA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwv+tzD0fu1rnRsWF27lmtAtlOrokubDKN3Nqpxt5MU
 xuPlG7smMjCIMbFYCmmyJKk/bKDYXWNYkztgzCYOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApnrOf4b/meYLDGZsubSzzn3CfZ+SDe2MO320zslaXAy+EZrB+HJbF8NfQY6fB+2
 WMVhqbMrNtzmynMd7QX7XQ66rU3XmHOd5LvuKFQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021206_700253_15F526BA 
X-CRM114-Status: UNSURE (   9.27  )
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

The Apple M3 Max and Ultra SoCs use AICv3 as interrupt controller. It is
compatible to the base M3 AICv3. Add "apple,t6031-aic3" as compatible
and add it to the list for 4 #interrupt-cells used for multi-die SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index a94787939d34..726a6720e05f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - apple,t6030-aic3
+              - apple,t6031-aic3
           - const: apple,t8122-aic3
       - const: apple,t8122-aic3
 
@@ -130,6 +131,7 @@ allOf:
             enum:
               - apple,t6000-aic
               - apple,t6020-aic
+              - apple,t6031-aic3
     then:
       properties:
         '#interrupt-cells':

-- 
2.54.0


