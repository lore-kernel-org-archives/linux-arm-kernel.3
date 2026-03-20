Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FCD108B917
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiJ39O+gV/vs6WPLCTGiaT+afqvJ67nFrDEVuBuGfvI=; b=YkNDUaBw6m+Wf1/ZjUDdYD9Oib
	RYa0Pg0Q4GDIBFSE1T+wf3PHJHz4/zkTuo+8bw6LXIBPIAFZUmDqPpurwdJJ6B2Rwi+q1JhLLQJXz
	RXz/qHsNfMaM+QdOXTwIwyRFGbKgvSj3YwWe4+3n+Yj53X9TYjd0ogJ7D0Hzq6UDFvttlZUOjPLAb
	6u/hb2zA6YFf5MACTHtrpkHz83Nz1CxK6GqmxI/egck/NoSlY+5csXjCSXH9fpsHGSISTe1xKvoD6
	FjbEt8szlyxj+/GKJAKZxtQyIuaJNCKMEmh+v+ie5B9Znn2gKZ3bsjnd/0csntY+bddAV01Y+MHba
	BWNUDSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtN-0000000ClBP-47a4;
	Fri, 20 Mar 2026 12:23:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtJ-0000000Cl8w-1kgg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 12:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LiJ39O+gV/vs6WPLCTGiaT+afqvJ67nFrDEVuBuGfvI=; b=DHF/8TALTRwM90dw5ZEfkBiM20
	7cd3vSmHffN+yuU97QkjeVUilBLEa3PQsQfA54awEo37Rq92OChjkGnncOmj/7tbIlhZglKAxiBOA
	J0Zv2xRrLq/lNxvqip6Jna791NjYMi8hzPKDisDbI6L8Nupv6df7/5i5aTtkXFvFDLhbYGrwmLgoN
	dBnigKUcF+JaIi0bNx61+Zssa0DAvLIbRpMlXVYbkqR8aTK3qxbllTklEk/NjX5wrl9dFb6Ovohdw
	3c7kkXy16Ru/r3RL3NcXKmb1j46Uw4gUp2sIg1jKwyi6XalIF37pWwNUlRAu1FQEQF5ryD5khY7/D
	kwYLyV1g==;
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtG-0000000FVrB-1gaU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:48 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id D6AF313800DD;
	Fri, 20 Mar 2026 08:23:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 20 Mar 2026 08:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009422;
	 x=1774016622; bh=LiJ39O+gV/vs6WPLCTGiaT+afqvJ67nFrDEVuBuGfvI=; b=
	qZGsRdolvzShcx/PSmpYIchq3vQMQT269Tc1gxS3NJVyL9o/usDCfWtOC9DUXDNs
	27KkpNScWcYib6s1xdYvnMjaNkH85qdmc5G+Yg5GBOAKX7zGDbsUesoEJb6588nc
	pfE00v1MZH6cepifrUDUwzroGqgB5ubbTkG8f7Nm3KJQsdF6C7KCe2e7pqyasPdE
	jPFR0THfqAlGO2w7vwjc5o0lxXjcdtdO8T112Uul2NRluOYrMeFON42tEae+E41a
	gLFD0IsGPqyGi0pIvw+rYvkvg7mTKhQrX/iKx54gzmnLon0z+ULT7V96xXopCYC0
	br0KxTn/rWI2QZmChp0qeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009422; x=
	1774016622; bh=LiJ39O+gV/vs6WPLCTGiaT+afqvJ67nFrDEVuBuGfvI=; b=E
	55nhl5Rbv+6HvuHCcvKIDi0Y4YUKvM9jjQDHz+TexuoZrlGgoUU/6zfGxSWh6jkX
	dPIYm/7npGSFy0zOkPJXKSaGFN008572A1uEbo/hF8F3sjjIl7FPSZF6KmcPp/CY
	3cN0A4qV0r/A45SX+rdtabcYRe/Oh4GbejjhtuxIOkGN7NViqt9xPiLUj8yFDCgY
	aZ5PY33s6onBaBJW3PFhID2NVuM4p5jFb9Py+3q+ZbLpmBzeN2hlTJ9Bj0OAu7fw
	1Z1QsdgWy2E561DFY36nv0mIUVzmc3DJBaIvicymjO2HD8MTeKd3U3qXbzc5N0gc
	O6dxjy8kkRyiKBBzzZgRw==
X-ME-Sender: <xms:Tjy9aUE8cMi-Y837N9JcVB4mcYNbQDk6dpWrA2CoWVFUaSoOz4-fOw>
    <xme:Tjy9aSMBKRo6y2ArHcKg5UU7ASV9Ti0ydhm5-wo-VTdz1aUGlOLPwWGnSSB5-h7nP
    Vj5VQfbVOlnF-VLtKo6UCkFcEQoZqivfz5MsyuwUshj_caGCB0VJxg>
X-ME-Received: <xmr:Tjy9abv-6rhwB0ZYeoaSzCPuLmvfAGs-hOfHZ6Lby-t8KBc3_5Onj6d1rP2NknLIBo16bOQy5pgq36RjE9axEqSIWF242Nk9SHGWTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesgh
    homhhprgdruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-ME-Proxy: <xmx:Tjy9aYJH8ecz5XDjs_VelJ2b4ydtqVyLx32LA6Wp7ohEkX3dOCttFw>
    <xmx:Tjy9aZeXGsxx0nowuyy53TVeyMjxOvRq9-xbXX9sEZY5xlk-COFAIg>
    <xmx:Tjy9abJ84kpBNR-T3CPuRD7AycW_SmjhMDzOVGK2ZdEbrYK_XsmoKA>
    <xmx:Tjy9abBDTPddTRyFEeAYvCxDCB3LLhEpTH7wEToJxTUHNaAkkrHrhw>
    <xmx:Tjy9aRBwv7xQ4yGVgfuc5RARD7k09KQVkAzkkwwbGMDcxh2o-OWbY5wq>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:42 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:20 +0100
Subject: [PATCH 2/9] dt-bindings: arm: apple: apple,pmgr: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-2-5842e1e393a8@jannau.net>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=iptqK0MK2F+9Cab0yWgsD04dQkDPQW6FI8oBI0X4bB8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nu5Xkjm2rVnqrKZcMsNZo0z6ZtlBsWdW1zitZvyJu
 7v8/pf/HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACai18TwP2SnW4Czn7fuoe7w
 ud+32KXNCovYf0PP4pt5VVXF7OWqhowM5xPXGW7lPfbXQlHp1LMg92Q2Lgv9CgcVLdtvnHz7NwZ
 xAgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_122346_720261_A8A85FC6 
X-CRM114-Status: UNSURE (   8.17  )
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

The PMGR blocks on Apple silicon M3 SoCs (t8122) are compatible with the
M1 and M2 predecessors. Add "apple,t8122-pmgr" as M3 specific
compatible.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index b88f41a225a385e68a71de93027b5b62c38d6b63..c67b67ba065afaaccf4436d86dfbac233870d624 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -36,7 +36,9 @@ properties:
           - const: syscon
           - const: simple-mfd
       - items:
-          - const: apple,t6020-pmgr
+          - enum:
+              - apple,t6020-pmgr
+              - apple,t8122-pmgr
           - const: apple,t8103-pmgr
           - const: syscon
           - const: simple-mfd

-- 
2.53.0


