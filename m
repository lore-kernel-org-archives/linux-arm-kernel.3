Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0FD108B918
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqID2YyqE72b5OAwRBciwOdkk06DGeqd/D/N5LXJySI=; b=yAEiWiFaupklAt0xCkgyB6uEyy
	tk2raJXzSfTVS78VDt3nE+CVV6wrM8Z4roh4A2VeAhADuKikRMtF0VDdpTCFXG3mxpVtMTcMkw5YB
	xHEWwML5J1s8oE9Nm04QG0oNPDpI4PPdnqTyDiWAfe0zLPzkP4ZNHyX/VIMcQNv8qzUH+o1VWG/j5
	pjKs4cmG/1YXpe15j5CsVBU1cxDV1WWst2wck7Csbthox5npE8aC1PFao9HbwwBFFRU3s6k1whXLy
	6L7Pq7u/s1qTKpWdlMN+SM6mNOfLRgPHNi0WlhYBNhEGphUOT3o7s3qn4QPD0GZwRmqUVL/wMsT9A
	cYHk4JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtN-0000000ClB1-2nDR;
	Fri, 20 Mar 2026 12:23:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtJ-0000000Cl8q-0Wer
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 12:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EqID2YyqE72b5OAwRBciwOdkk06DGeqd/D/N5LXJySI=; b=QyjI4C8u+I6Bq+N09JUiShsALB
	gVH0+kIYCQ5r8R8a6ny8G6koqh4ja1JCED5xuGCzUGm4ZT76O8DIUSvZ8AjomobnUf30N6eHhTyk2
	E/WrmeFDTl4Kx1FdX1cpD8pUl2AGI6RywTI6/yBNyvWJeEj2hjiBEqTo1wYLBrHFlXnPcmQ36tdvR
	LZQv1t7Vc4kxnl2ypgitAAFg24FHvtl4sUjcWiPEoVIthP0cVyLIbSE+wU/jKpuF6/wfI5d5hHAdn
	/m8JDJDrelHmxoGcNptG0j663xCwX5xxYq6HQ9VzwlcrjEkkkKjmjmj8IJyRuY2vHiyUQywTOvqWU
	auG12Xkw==;
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtF-0000000FVr5-3Bx7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:47 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id D999013800B0;
	Fri, 20 Mar 2026 08:23:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 20 Mar 2026 08:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009420;
	 x=1774016620; bh=EqID2YyqE72b5OAwRBciwOdkk06DGeqd/D/N5LXJySI=; b=
	JYn3mUVbL1uqGpp416tfsqTgtGzVDWDbrYauKszI91LhU465VSD0p6CGLKgFN1AC
	6cuOOiSooYGXpwcAjE5oak7uzCe4f66XtK3KrLe2liCIOUgrLpVkfGTnPIJkItaG
	igP5O/IEOi5vfpGaYTXSFkqHeUyOgVdKi2jFUippWjpA7sQUvHNLEfdKuscq0sQS
	TNA+H86ZDZdC8eToVcSchQvje70BqFC6tkxLY5mwZmpTFUIR6Y9sN6YlyB25MJ74
	2Citr8TFghb5IpddT1il+S8Hf7hcg4wZtsVz0suCN2ByWFZBZn6ZnXMxPPmpUBZa
	JdsGONdtk0+/p/LAe5RpIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009420; x=
	1774016620; bh=EqID2YyqE72b5OAwRBciwOdkk06DGeqd/D/N5LXJySI=; b=I
	4X4wW+U8x/RdyF9t8OL8GvCtUNCrdr5uZ57MbnDtr/Fs+FAP1E/YyDRG5OXunIan
	58Dn+DL0sCOBBuEnEGrGgv22wESIwj4fTcSFgL573wu5spxnAfE4btlIvaYWoiib
	CuxaZ8wKy4stmv1GmIeYl+3FJyH8NzasQrjQfJXZHSoY9KI6Fy7+oOHysshd+EUc
	YngOtrHhBsoXbfxKC9JxaBObRR/yQhJNZkRFvoff/dzzRqXxkSVpuch75D9oF/3W
	UJSeykiOGhqUI2XHFBSLaSNrmNgMK7OJflt24TcjDlNoMiyTuLg+wr8RXvF0AxNX
	N9GUZ7zCx5FV/dNTxTdqg==
X-ME-Sender: <xms:TDy9aX5sPc2_uOc2p5a2qwUhAqUPr2SD_qhVMjSovuypv7DtBLHAZQ>
    <xme:TDy9aXp29DK2qdm8ZXsI8tAK5maMj5ftDbiOpiGiFDaj_TDdndLElISS0StDij5QK
    CsB8fi8JaRUjh-R5YMoXLYPQ9MDbf8bQHimXPJa7-tFc5_RM6PuGs7O>
X-ME-Received: <xmr:TDy9adXdomVWeMEq0R7lFJg74kVu7Fiy5gno5bkweHQyfuHhCwxcpU-y1c9H9MOk_8KDNslfEXn66x7X2ruU93EfENJEbxyXxfbz-Q>
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
X-ME-Proxy: <xmx:TDy9ae4qSmwYjhucPubgpLeOrIZZi59ogBuzqkkP29xVWQKkSd8bJQ>
    <xmx:TDy9ab1iuIMnCZVj_gKnIqFcfHxT8CgLh5Z4v47JlmPehiEv90j1WQ>
    <xmx:TDy9aV8YMfP7I0-IM2kKwatCmBSmyyYNBTn25bsUBgk1jUArPaB3Vg>
    <xmx:TDy9aUvLPPMv-Bs53O7haGLTLyNKNvR1dCSIIzA3Yo4xq-z7jNx-nQ>
    <xmx:TDy9acsoAKMl5yQVKrCdaOs0I6GyVSpQHeQy7PDTCvpSOJ6-AGAVOi6d>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:40 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:19 +0100
Subject: [PATCH 1/9] dt-bindings: arm: cpus: Add Apple M3 CPU core
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-1-5842e1e393a8@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1030; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=wnJGrb1D5sklE9ktZIBz/FIliktYpSP1dImVPMP5p/4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nu7nfVkahaLeu70qZu9J5p+RcfGI8FRD1pV+s6qcH
 Xeab1XpKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJEv4gz/7PhTDy5880zVcvOc
 /oL7tmwOdyPmG701/3M0In69oPHf0wx/xa+YvVFgzzkVLG7xtaPEsd/30fzirYzax7Of/QnKkVv
 KBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_122346_041350_A183EBEF 
X-CRM114-Status: UNSURE (   7.72  )
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

Add "apple,everest" compatible for the M3 performance core and
"apple,sawtooth" for the M3 efficiency CPU core. These CPU cores are
found on Apple Silicon SoCs M3 and M3 Pro, Max and Ultra.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 736b7ab1bd0a0235527de8e63248f8e070e15431..e1fd73281657df25316449dd8c5c837aa9b4b27f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -85,11 +85,13 @@ properties:
       - apple,avalanche
       - apple,blizzard
       - apple,cyclone
+      - apple,everest
       - apple,firestorm
       - apple,hurricane-zephyr
       - apple,icestorm
       - apple,mistral
       - apple,monsoon
+      - apple,sawtooth
       - apple,twister
       - apple,typhoon
       - arm,arm710t

-- 
2.53.0


