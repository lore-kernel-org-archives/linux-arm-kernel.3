Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5F1108B916
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g7hbu3raybG7hQlze0jpgiIENf9F+/i6CskYtxMfjk=; b=QctxZ4t59264wI31I8hcG/gz18
	za4aVbu0+rtasnxzstCXtKFmG1yBcShswgdiz9xxdJOoEhlCSBgcTBOTMbKGDNBaKE1Fo2uIezTNK
	raII53YW761loBy/hln9+hlUkoiEyKbz9II9Y8qIW2ymgnfHlPuEDkWbfxPE28/rXcPOLtcAYux46
	sbgW8P3d7TkhHOAQRtkj79CwcJcaaHpw3fdjhHmZaIdvEMZSXect6sUv3sBZ7RfdqHblnqfx6kGxg
	H/qrk57AjW9PL1M0HfPVNzNnKnJG//s9G+Ust8hYPPKbT+jxSpAFSCOYT96isRoRRH0ABeMCP4EKt
	QjMPpM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtN-0000000ClAc-1XP8;
	Fri, 20 Mar 2026 12:23:53 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtH-0000000Cl7Z-05D6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:48 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 53BF513800E5;
	Fri, 20 Mar 2026 08:23:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 20 Mar 2026 08:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009426;
	 x=1774016626; bh=3g7hbu3raybG7hQlze0jpgiIENf9F+/i6CskYtxMfjk=; b=
	P/jF6g1i6F6mP9ydrnZkQVxxAY/rjA70izMWCCpC3YWfvj9mfjPSkKlCwiWawpIa
	Alv1iOwhpu8qgKYjJTz3ZNNGzMsA3wstJxt2NEbq2y5twOF5IcxSKIGqypYzVZ/0
	20NkurniG6ee+fadbCpKdnw43SIXJdoftySYlwAWc3qmK463SxgAgAGxTEi4WKzc
	Wo0spH63BFqcbJcVFHiDHPsO/d3LuqoT0VnME88n8A2YyW4c7ZYZof8ZZd/Z7adq
	cPIXZN+ktPPXjNzXCQaRTcPano1fQzphxRjDCB6ycMnEViZ6vd3vYaSWfOHbOT/u
	fnNks6exEFvChxmf+vEw2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009426; x=
	1774016626; bh=3g7hbu3raybG7hQlze0jpgiIENf9F+/i6CskYtxMfjk=; b=e
	0J+xu6wPm2q5c/x42y/DKQBscVE/4gXlq+/8ABznS+yPhidiFrskvN1OzAKKWYAc
	hvbOpUD0vGfDT+R9rDN/qOHfdYnkQKJqbeiKGChRUZb6mZdevNR0byDRvSncwuN0
	SjVxOFTdFdngZjyADldO/lvpxP1Q/6VaVkXvg9gMiU6kQT+XTxJ4etPTQRbQ+tc6
	4Gm6hyivsrwriGxq3Dn2oQ0TrP2vrPM30yxGrRJfTCE/WU3r9UBdCVGvqJOW5dml
	7ZFfRfrv8OGT0M/3VQ6L4z6JPxdo7Uh1Cbvc6OK+3vS9sFnovIxPBRGxP/3iS8Zx
	0Yi8oL/R8FbXB4iQ7qbtQ==
X-ME-Sender: <xms:Ujy9aV_GkPjaZZJ6kGaAgwXc0-jEPNCD1oSJmwFzIScInvC2Fyfv3w>
    <xme:Ujy9aenDwivqaqUMZUlDj4DBSu8nDLCG9fDYsgDplQv-BxA3hPpFRMtLwHkGiwsll
    M54HZFLnrqMP6tm2mea3MSoMO98Ejjs12ooIJUN66b_Zf7fdJIm48I>
X-ME-Received: <xmr:Ujy9aQnR6J4Ayrp8d307keuthEs18s37vaTFlS010alFpmszyJwyaRAQmU8USja-nDaQ6xQSBladbyGq2QAqO6-jS5TtTR8hwpRQEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesgh
    homhhprgdruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-ME-Proxy: <xmx:Ujy9abjm3WPPxN_TppajoODw0_H51IFFiN7tZEw47aDNryNO8w15UA>
    <xmx:Ujy9aZXlrMAayhkAtGdpzxfnKCFcutJGnaU_Aty4fuYwwfEw27-6NA>
    <xmx:Ujy9adjlZwlA3J30QoCcEGtTvOVgsf4IPdkp4D-PNlB_FOrODR4Ojw>
    <xmx:Ujy9ad4smtU6uX_XjOUpPiwhnk45zPKG-2OoNChhQ6jh3aSHhf7Zwg>
    <xmx:Ujy9acYn_DJWf30AAwOE0wJJlVTafcfOeCPZN5rC8JpYYsYyZkJqyaFd>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:45 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:22 +0100
Subject: [PATCH 4/9] dt-bindings: watchdog: apple,wdt: Add t8122 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-4-5842e1e393a8@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=buUyVcCFVjI1/V3twfbMcvHTmryX5ia7raHBMXtClws=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nu6nIp7/W3c9MGHaW/aYLZ1Hm2YusEl2TOzOnHGEy
 3Ipr+H8jlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABP54Mzw3/djBb+dCbupb5Te
 qq0LrvTYisaxNUacYvcNmffvpalpPiPDLtarofpTLv88K6v3v/Jx4q4Hddc853Y92mijZ/Zjdf8
 sLgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_052347_559490_22F7932D 
X-CRM114-Status: UNSURE (   9.32  )
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

The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
"apple,t8103-wdt" used by the driver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
index 05602678c070d764331795f6df91abbc55eb0f2a..845b5e8b5abc33fdf73f71b203c527025d54f693 100644
--- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
@@ -16,7 +16,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-wdt
+          - enum:
+              - apple,t6020-wdt
+              - apple,t8122-wdt
           - const: apple,t8103-wdt
       - items:
           - enum:

-- 
2.53.0


