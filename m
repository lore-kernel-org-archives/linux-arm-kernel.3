Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85237C4450C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ5pRocpsgstKptuIu98uX/SfHwckyMF0rK2V0V4Ggs=; b=KLhP5GH+O1sIkUvYhpUKiNC5hB
	VdPky8biR+j75xPAkTf1kR0XlSVhlgKsJdNT+P0Zc/cPXU/qzOzg6ZYEeU1CH0ChghL4TI1oiRHRz
	XGmtnva3iyw+ZWHatDnihzKnRNFOVsTSrzTta8AdN7N+m1aH7uer7oycRlW7h0g52UNzZdhiiREE8
	u0de70XfDYEsh4irZypN//upACxVBGyBOy+xnDox2fBLdFPk8jcwHrP3vl2ZIT033qfcE52gq4wn5
	RD/9otD/HKhle/qb4fbIRpT1Q95UHdbA2Wl6HdxAYioQZ48GN0iMz7zKHSpKJMXlbeZiD3EUY/FE9
	nd3xsp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvfD-0000000EHYG-4Aib;
	Wed, 15 Jul 2026 09:12:24 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvf1-0000000EHO6-3DpM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:13 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id EF2BBEC01E9;
	Wed, 15 Jul 2026 05:12:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 15 Jul 2026 05:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106730;
	 x=1784193130; bh=XZ5pRocpsgstKptuIu98uX/SfHwckyMF0rK2V0V4Ggs=; b=
	KgSZLgQ4ryPyyKvJS/DpwTAt8FfY3z3qpDeNlQ86/fbN5LWO0LdDNc5zHwfc/Bql
	m9WDZOEn4GI87fBAk4K07FJsjC8Z2oLYbeH/Q46tfOQECEfagioudtTnVW/UDORb
	Mji5WzFGX/tyb6sRC4NeIkIF9XdEnaN4H6XE/r1r8g/bB15COSVKXSFUX9mJU2MT
	UBdvlEJri6de67rc7QIVK19rWCx8RLQY/cTeJC1iDHlKSNwkaO7gudSYXKXO4Iyj
	tfYALFhUuXknhRIoBistt8JzUqmulCemoEy1lTlWwAPTy6hiUp5LjhWELO46EkZa
	QYbyyxJ1lSRzf9Eqe4ICVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106730; x=
	1784193130; bh=XZ5pRocpsgstKptuIu98uX/SfHwckyMF0rK2V0V4Ggs=; b=Z
	UlFh2+TVLfTyMJLXfOfIPYqWhL9EiN6a8mNNiLS5BgEepas7efXqTB/uQZ4MojHv
	GEzeCBjO17dA/kp7HGKhhWthe5Ay+cujOmY2iSpJanfnib7QhX9eHuHCABzjep82
	VhAOdO2QEPI5ZPKj8FSONrshqEPgWNOD6q5t5Rb3gfpGsaGK0dv6tM+uNqjNKcV4
	aOsjS3uM9Ab69m1xEFuhKmhvFSuaBFxr/UarLun+rucMqnif1uLqnsNiCM4eCaas
	jgE+AGaQfQ2Vm6TAEU0Hc+phMzqXLbH7WF33dbDKWYfMQ+PNGNEY8rxq3Yz5n4WE
	Wep0FWoLX+LmL26SO/JOQ==
X-ME-Sender: <xms:6k5XalZ93oOOT5qaQTvvK7uWW4sREKAMCnbRy1DVh-eeUaqCYgGHzg>
    <xme:6k5XasxVrfPsszOUZjaS0rFcDgzxF-T9bETc768ZWycmEY_RZukO98YPV2GhgWykA
    4MD5CaXJLRwE8-cKrQ9_no8dW4USoF4tBuDxBeE0LKfmzSK8-BI4ZA>
X-ME-Received: <xmr:6k5XapHdrPpdxZ2-9f-l0SmOKu7mKHqF_W6XXUT0t95qG9c8sti_3cAyoNiQO320KjXsaLDiMLk2Dq9VmS4iNeYQK3b7a6YWnGWN7w>
X-ME-Proxy-Cause: dmFkZTE2gDmfm1f6JjZkdn8uZ/rUQZlkWDZUpUKyAVOd2MB7mZhO+ei+CjakzAhEidYyF9
    sKbn8PGdq7v3gVNOAFzU7/WDZWt7tlbE876eNZ32SeWzbxFEIvL2gJxeQJl9pKwboBz3Ke
    Qugf2EMcZZlhegCxqaqjkexOH2Gt3Ie89hnBCSZa/9Tjwqlsy4JfLoQK6N93BBlsgvYG08
    7yIq2nMuPqZMpdMJtN6GbqcV/Mv4qMXYSX6pQ1bnUYrqDaDpjI1rNTNMAeVqkiUbfWJa0T
    mGfpuNdz9wsESMTL1AY4qJYTG3ikjrFEuoPXuyfgYFxG+Yszs3snNBLQ8fyiLcakyJ7KTP
    Ko9J3O713exSORAhA6SYGXYUZYq/80ukvaMG+vWo2zykQ2hpjKXUoUoJOj5IpACDUeH9Xl
    K/jPXoN6ftiZmu/FMXxC5LmP2bpraio41HBg5GQLoz4msdtqzu9LlrKxx50ur0FdwTqrFu
    bXd5FCy5f7TLr0atSaQl/EDX1XcG2vH+Y3aM1Hz2kMVIzs7cdqK3eUwa6JEEtVbTgG7rJM
    za84z8qnZ00Fv+IL6gLZwcusWS5RFPX+tUT6R0pQTa7bQYQbvFGq3d1rUJTKsMQCf5ZXLL
    P/tS48Q8cSD4+XEDOcWtYF6o4QKFHAAvM1AzT40XqO8Qm3TxuceD5FYS3akQ
X-ME-Proxy: <xmx:6k5XavpNKKj7UUiX-wB26dREVJ6PQFGn2p6I5pJZnCEzyojolax3Rw>
    <xmx:6k5XavzT3hiXWKhkXyKjZKac7zhiOariV2Ir44k8Pyk1w3w2hBrmDw>
    <xmx:6k5XahxSYGjXA7zp4rplDQaKwpVdCSc43ljJTJ5FJquOSc7MSqFWJw>
    <xmx:6k5XamS7vTqm1tyYv7chSfatdvR_4xZF9BAvssjboXD1PpQY_hVelw>
    <xmx:6k5XauqSX2zFVr4Ai8dWU5dFde_pJpNqkGedjv1Jpqmo2G2SLR_-Qu2M>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:10 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:53 +0200
Subject: [PATCH v2 06/10] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-6-df65b2485710@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=j@jannau.net;
 h=from:subject:message-id; bh=POzZ04ii3oXGYWWZpjbkyxhYQFzbHUY/uXqN7MGTeek=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwvxu3WH79Tp46yb31h0NEjo7R31jeh7aH62+vtBU8d
 dbYv86pYyILgxgXg6WYIkuS9ssOhtU1ijG1D8Jg5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOpIe0aGa1uy9bsSX0zzN3XXmHNBYuf+845C+721l7ayTLq2pLfgGMN/r5m7te+
 z+B+o3nro94pa+RLBvd+eXKkoWvWXS8duKfNSXgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021211_957379_17415315 
X-CRM114-Status: UNSURE (   8.38  )
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

The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
"apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 845b5e8b5abc..bef8255022fa 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -18,6 +18,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-wdt
+              - apple,t6030-wdt
+              - apple,t6031-wdt
               - apple,t8122-wdt
           - const: apple,t8103-wdt
       - items:

-- 
2.54.0


