Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAA0D1D492
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QteEnV4Lmmr4kXq6459mdyhN7lvg8bT64d/57W2Zy3w=; b=nbTdEWZupCZg0r5C2mVkSixedI
	3pQIK1HCKItwqu+YD2vHQzH0VVFLLDXWjXdQsiG9GCsV6b+OS9tP3voRhs9F40ZynEgM1FPVvIK+5
	QDPCXFT0DgyvMCFzeHX/z8X/6U+NvGx8UiccEcnFchLW1O0PPlgLsOlzC8OOJkjCnezelcYd3p2kO
	JlcNcZ4snKZAVWL2Ct6m/fvm93dcwQCPkDzq+4GTyhQkTRF6XgGo7go7P8myojfOrcQkcaapobjKd
	B9ta3v58OLAPVQqxrNifWi322LVIFdDWg2XNeZa8FEhX8YFPclAOBKFQwvN6YVuZpa1DccKGX2jhk
	GIpHMJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxBW-00000000rVc-1IpP;
	Thu, 08 Jan 2026 21:04:46 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxBS-00000000rTt-3BUa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:04:44 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7FBD07A0075;
	Thu,  8 Jan 2026 16:04:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 08 Jan 2026 16:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767906280;
	 x=1767992680; bh=QteEnV4Lmmr4kXq6459mdyhN7lvg8bT64d/57W2Zy3w=; b=
	ZDQLCXaLlZ3ASL1Bdf/c1FUx2x8sfUejM+vTyCe3+K6+hgb7kkisKsNmZ9iT0z8f
	92WUaYQ+XrqYgv7ZhXTxCpBCoxZW3LLwHhaQOllx3NX+Fqh96ZtE/HK5ve4dLujC
	+CeLtkp41A8VwxpH2d8xdInu7gS1678EG2bnDw66AjZx4y7L9KT6K5mFveUf5cg/
	NlIXQN1V8EU3WGsFW3dwjZl2vtlY71J6YvNKYA1MT/JOeHA/jVwyeNc+s8RZmuUJ
	VkHi/HvHinvn/uQL1yq3duz7o87ZTuXV5OXtJqfp3/EhzVlxi1MRiq339G93/RzF
	HARQqiqBG73799NpZL1Pyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767906280; x=
	1767992680; bh=QteEnV4Lmmr4kXq6459mdyhN7lvg8bT64d/57W2Zy3w=; b=N
	0yc+26lJBzFKE5oXelHZepPAT4qQKyuftKqr4i6d5qggDjv21ls4JdeLII7AVnk8
	HFtIx5UXoCtQFRj67Lif+3/amMFcrzXBBP9JSZQW+QwaNWozygitwRaKz/ZVceiJ
	oHb7F6/M7kPgrHBmx629lYx0KTKuWEWR+VrMK0NNJAdUdQQGwyxYhnuda3Pjiwi0
	kISL0kPEIfbCRpwGSsy7P0wdaVrpL25Rj9PrpKDbiEbgdlj6Qh5uon8NfgH23GIT
	HM764Kt0rzscKJWO8/O0N7SWiOE/0rZ9EskJD3piNCHIV4tBNdE46oyEArhl593/
	JEphaayJ2+K34pMsxbzyw==
X-ME-Sender: <xms:6Btgaex_cz8x_uSbYkTsKK6fBEEJatckrCIX-m2gG3otCaqw0MV8-A>
    <xme:6Btgaeq4_Cba4sfwx_3zqL8-vpu1tZY-Qs-LoCwJGrxIVgghO3Rz2MO6wrg3fANu4
    9yhdq0ZNjweIAClUFHehuY4VG-U_WRsGOZ2fZo6YrM97F50k3H871Y>
X-ME-Received: <xmr:6BtgaeM0Iz5W0RJmopvKgbEJFYcv_v-ghhYxAqo-uMohhWlYCdW4jaSZhDiJNUqIW4JG59uDdymIj6HjD1mXBw1vT-cQ0x6QGXhebw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeileekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhih
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgt
    rghnrdhsthdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgv
    rhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonh
    horhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:6BtgaScNUPjt762OBbrT5FLV9XLqsdgpZFg_-emiIC1buXQAoQV_5Q>
    <xmx:6BtgaUV12cJ7BskigDtycOKa3Hv_0Gi9dzqFWWS1V-22FrutFRnbxA>
    <xmx:6BtgaTD6JxGDHrFY9V4ObUZACW9-NAAcUuxdALb6_goa4YLl4FpLoA>
    <xmx:6Btgaf4kd8-ctf3SdFpsbfy47rDB6S-vJ5SMrITINtcg2Epg1DTq5A>
    <xmx:6Btgafs46Jp6awtYEBOaFq2gfdk5kd8c3y8sYb5dTEbh6XfSmamboY0_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 16:04:39 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 08 Jan 2026 22:04:02 +0100
Subject: [PATCH 2/3] arm64: dts: apple: t8103: Mark ATC USB AON domains as
 always-on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-apple-dt-pmgr-fixes-v1-2-cfdce629c0a8@jannau.net>
References: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
In-Reply-To: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Tv265ezbKIPR4yKCBPnSeHHBwfskxmuu1jk3lNIHRZw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswE6btMrLF3EuXmZ12WK1aq2xm97mk8b5X3XX3JB/ek7
 RX8Sxw6SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATGSVMyPD3YdiLZvci59U+kQf
 KAmYc+CvxHJ1jenXV+xt4P1/wufydEaGnXsW3Cg0OKLa0dt2LSxvzh6RqZv9lz2dLLGmZcXykxN
 i+QE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_130442_846827_50DC83B4 
X-CRM114-Status: GOOD (  10.52  )
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

From: Hector Martin <marcan@marcan.st>

Shutting these down breaks dwc3 init done by the firmware. We probably
never want to do this anyway. It might be possible remove this once
a PHY driver is in place to do the init properly, but it may not be
worth it. "always-on" is a plausible interpretation of the "aon" suffix.
The t8112, t600x and t602x "ps_atc?_usb_aon" power-controller nodes are
have already "apple,always-on" properties.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index c41c57d63997a59a9fe3c88de31fddb31781398e..4bfe0d2de30ad6f975b31d443b62ef0e74b14324 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -1103,6 +1103,7 @@ ps_atc0_usb_aon: power-controller@88 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "atc0_usb_aon";
+		apple,always-on; /* Needs to stay on for dwc3 to work */
 	};
 
 	ps_atc1_usb_aon: power-controller@90 {
@@ -1111,6 +1112,7 @@ ps_atc1_usb_aon: power-controller@90 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "atc1_usb_aon";
+		apple,always-on; /* Needs to stay on for dwc3 to work */
 	};
 
 	ps_atc0_usb: power-controller@98 {

-- 
2.52.0


