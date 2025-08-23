Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7929CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sg2H0/CDGwZbCFTHKA+pV/36BNwfVXvB3vZX7Q6GLRk=; b=OA1LiKzjRyndRzc6xgdtxCswa3
	rmvE9UKT4y3d/S1tDno545cv2nleyCwSDtM+lHrEJHXa+S+g7KuC0sPg2A0lgfUVtUpq2W4teJPoD
	Z8iOsTZApxZDmEpidJ2kxgHTUxVjE8kuAv6xI/BxzhgtxjG1oDiLaHCH3zb6WbJ6c/lJiwR2ll1LH
	wI/553vQIwrBv8et1UxcETCJJlL9w6YEH3lsXkvTTWUo0cmgaXmrfR6N4GR+KmZxcrr+6BLvLJN1N
	RKhh0ssx0Ao1vWS+1q/2bkx12lVH/c2ocI3LrP3Wg/d26ff9l00tUw6k9i3d4B4GpV7XNzO6b2rc7
	xqQiU2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplBN-00000004b9y-2qsU;
	Sat, 23 Aug 2025 10:09:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksu-00000004Zq2-3Qdl
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 09:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sg2H0/CDGwZbCFTHKA+pV/36BNwfVXvB3vZX7Q6GLRk=; b=PrtgDTajMW5uAX6P4mlZC6EGdf
	K9H6mSihH5xKrTa7sUgizH3lCgCg6UWaBP+Hrbz+eQ6OR8J2FcRbqo1e7b5NvqzUU4/+bBR5LYPMw
	2dJHrtoZbQFOBvIbt6D82ax0WKLUdOEShrHE654Np4sH0CG/3dR6TnFHrDUD/3zmhnKXIg73xrq0R
	Pcuxw4KJ8kvLIJ4lDvtSbIVPcpSDDdV9XTLyaIaMfOzEiTp3S3aXuyEI9jWOn92lTssxgj7/OB09w
	kkhPEv+LUHsDkMkFg+z2iK8TuAPw7etYrZKBpp1x9Ze1qFTcobXGO8VtNjCXm6M2LzKFqEERXl04g
	TuIf2Z2g==;
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upksr-00000001PTH-3oHy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 09:50:03 +0000
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D9121D00091;
	Sat, 23 Aug 2025 05:49:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 23 Aug 2025 05:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755942599;
	 x=1756028999; bh=Sg2H0/CDGwZbCFTHKA+pV/36BNwfVXvB3vZX7Q6GLRk=; b=
	X1fcDyLbr/uuGFjQQef8f8KhOZFi8++H9W7qJUdrjr87CJlXR9HU9QPo+ALnDXVy
	PQgClxMj9dTCctkhAX1gst5JCbN2uXyoUc+xWam07mQ0QVt9MlzWAYl8VyIj1hBM
	ecrHODKOlT57l4YnVMudB1Ks3NMwa0KYayImIlNp3MqxJauSNnDeC3pRyvzAc5JG
	oH64AeHpI4s5SZVR+p5ugO2vTFWlhMlP+G33Uhpbqu7j/n17pRncVJTjovNx3U3Z
	ZlA2nPlbfp+DZnl9HuvKOzVODWYBN6GK8HJGWD9eVGbiiGtcVZwvKGfxwukx/8lc
	i98nFzT7dNTC18Tfir4j5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755942599; x=
	1756028999; bh=Sg2H0/CDGwZbCFTHKA+pV/36BNwfVXvB3vZX7Q6GLRk=; b=l
	KgD5qCkqFIm59cPm1sG/J0RmBEf7YHy1iovxZSuRcfWwCrdgndsM2Tkfzm+kFT2o
	BRidt+oFMyUuZU+a093ob0sOxo1OnZWOJCNrcNJRFvI13GYV50CaeDK3SuMJQV9c
	pLRjCmRZ42DI6Bdh6Aes6K4UKNbjox2PIFFANjA95PUk3ufHZG3PtlVP30U2+NSs
	GMtivviF5XXXy19bq5f+Y0QL0JUG3Fkl/2YNCVzLfgSelxboItEHbs64p7fhOOA3
	4tzjsfHEPkFE+0Dsg5UfPvmSmvIwV97u8QxymysF/b+5Fnh5hpNhEH653IbK6pQv
	mAO1eUWhdAulwTitAlezA==
X-ME-Sender: <xms:x46paEyehw_pv21VXJisxP8f8joerckEz3b1ijVz_JR6IRh0v8DgdQ>
    <xme:x46paPj7fRL161Vsn7QoTqDu_EcFtl4ty3bIyW57Pm7WCBqFdaSwDCk8R_D-u5pi7
    5XKwn7W7dsaE0kEcJY>
X-ME-Received: <xmr:x46paBNgJZmw402ur0l8t6FM1p1z8RVMG1OBoDsAZWqdnSewLSzmfpmYyWUjC3xUrbzceAgODJQwR9nxZ1sh00w5J5oAKqUpEmRLyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeifedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtoheprhhosghh
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsth
X-ME-Proxy: <xmx:x46paCeCKfQVzzlnSTDwVIz0htNHITAVGtLXgG5aFF-X95dwycHK7w>
    <xmx:x46paLyzray2_mclKbxasM7DpWyZz0_F87xSlBoXLoUjyMcY0dqRDA>
    <xmx:x46paH0CPDEhi0rxRwJIxiVa0vXc5q0p-wa8cSmNkS2_tlWzJLPkgw>
    <xmx:x46paCfd5dKzdKGfYtEzkE_91gIDWxV8rbvuRvDi7_AIfCBFZDgk2w>
    <xmx:x46paCePxHc4v3wPqd2loYXfkNggL-i5TZpOr4-fKQRQT0devPo6lb77>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Aug 2025 05:49:58 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 23 Aug 2025 11:49:47 +0200
Subject: [PATCH v2 4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-apple-dt-sync-6-17-v2-4-6dc0daeb4786@jannau.net>
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=KqD57XbCx6MjJZlvzND9s0jLRp0WUsHsftD4Q7jE3Ug=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoyVfTvvCem4XeYS0H7+juN9mqH30sit81P2qVT/6y37O
 +8xd/fPjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABNRus/I8CF8zVtGs6+eAl5b
 VHralm+7ebSM37HuTVtFplTpY1dPF4a/Uqevxn45Ii1edNDeesaHeVsYHz155Tf5RJ3zgVZV5fM
 TuAE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_105002_157408_F7942078 
X-CRM114-Status: UNSURE (   6.94  )
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

This adds the "apple,j415" (MacBook Air (15-inch, M2, 2023) to the
apple,t8112 platform.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index da60e9de1cfbd0151e973c3aafba6d0880fc21aa..7073535b7c5b5ce885391699af56751241ddacb5 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -92,6 +92,7 @@ description: |
   Devices based on the "M2" SoC:
 
   - MacBook Air (M2, 2022)
+  - MacBook Air (15-inch, M2, 2023)
   - MacBook Pro (13-inch, M2, 2022)
   - Mac mini (M2, 2023)
 
@@ -279,6 +280,7 @@ properties:
         items:
           - enum:
               - apple,j413 # MacBook Air (M2, 2022)
+              - apple,j415 # MacBook Air (15-inch, M2, 2023)
               - apple,j473 # Mac mini (M2, 2023)
               - apple,j493 # MacBook Pro (13-inch, M2, 2022)
           - const: apple,t8112

-- 
2.50.1


