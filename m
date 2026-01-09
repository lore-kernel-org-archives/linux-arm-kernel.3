Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EE8D26D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKby8XEY0gog5d92JfJPvtX+nrRYxzECZ+aWCrF6A+E=; b=xIvUALG+XlWcMvXnPd0g/UXBsl
	uSeFwtyUt4zBAYiVwp+uurmijG/h4lYujPPue3LM0gxUKq8P32pPhIIWd8HmB3j3WrBZBt8+wU/8u
	tDCEN8VPms3fSDYzrR4iI0CVk2st1xRvJiSxw0VDfLoeRQwKC3YpXxLk+46PEW+EKZpbafRe0or81
	MZmOoYh4s9ob0H13DCM/HsxMAl4ED0f4E+q/UiJ75s17CRFNkxBGHQ4EEnHvv7tEVSm9GMmgFQGKR
	rGGXnSD66J9+CHhexQG46TpTsQYDso5501wed7wygcEN3SlAHbtsWUTTrukHBKjoo3wYMVfJXuriy
	xxgf8jVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEND-00000002TYl-1yCw;
	Fri, 09 Jan 2026 15:25:59 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEN8-00000002TWM-20bF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:25:55 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C7E59EC018C;
	Fri,  9 Jan 2026 10:25:53 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 09 Jan 2026 10:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767972353;
	 x=1768058753; bh=BKby8XEY0gog5d92JfJPvtX+nrRYxzECZ+aWCrF6A+E=; b=
	dYg8IdrZTKvBhGl/n6m12RgLeIFO+xYIVdPEqdM5Jp6LbSOTLmGsiNxD83rGDOcK
	PIMtUdlR+9HRa2AtoLkmYr5wdLoivFpY0MLyOo24pRo3MvMstOLHXm4Ifs3yXg/v
	OWzhgYmgQnY0k3ihkK3klYgDf0H8iZu5gWE8lEhaU58fprZUQmQjiNL7XHIf7WwV
	NUihWwU6n5EGaidlFNzzulHGgyEXPyGB7G9/3PhQFdMSueNXxq2+sAJKhGqnRx1h
	Zmda20fNKN9H01jXGg7oo3sy8y8DXb6Cf2k9qD9b12FdTUyjya+3/zKAjGNN5Kua
	2cRaUEfRD5mcmH/ai0MWuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767972353; x=
	1768058753; bh=BKby8XEY0gog5d92JfJPvtX+nrRYxzECZ+aWCrF6A+E=; b=J
	18tgSKFsSMAiPSEG04n68DyaOSz38OLxPkpxragcCEdWy4GIaH13Lf1NLX4zSqSw
	DgmOXB7P10hzFKeEh1cRfEYNeR15TY1UoCq64x/43YO2fqvf59IhLR2fBo0BJdGS
	upAXxNHqb/WS/iltKzIwoO8UNcVWsin8hm5V33uQ34gSgnVqOmACU+cqrVob6idN
	8cYtSQQwGGxyZhf4tauCywf57pnwq9Vpujvv1TtC1olicQ6OvW1m9oPXF90tXEIv
	Hb8XWnO7qNF+VG5zKYDgdHdJT+nhNbqyRSWHrxPwNK0r1LL/qxSw7uNspFUkik28
	4FjVLhF643XGMJO2eGxnA==
X-ME-Sender: <xms:AR5haXrKPOUFEqjyq8RvAJfRFeHudus9MUR1W3aVowpzt-XcE9ksyA>
    <xme:AR5haZ3itW8KuiqpDyLPG2HKB0tE3cpDCfd6J8vxeFm28TlDf5vLRR3Hv6Motu4x3
    lkQ2CMwVAvm05X9pA1f7_zIAsZEDCyMG5hw5q40Shq9g4lhb016_ZM>
X-ME-Received: <xmr:AR5hafxMQZJiq09T5nWK6CnAa-aVd27by7XLf1EPg-4uZfiGmPwx4GXxDHYkyWVM7v9kqVeqQmiLALz4l4u6Y29YeROmfrBF-OZ5kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeludeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruh
    drnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhih
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    vggrlhesghhomhhprgdruggvvhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AR5haVi1wNMRStuCbhl33jIAoAtW1oLSyLAUbIohRMG5ZPPfTOU_gA>
    <xmx:AR5haSqKaMAGOv_yKbwQnFwx9-e9P6BnDfpH406qotZRoTloFWn_EA>
    <xmx:AR5hachiQZrgUQUKwhDGi63V-ItH0wf26l1Q2jCn25alQAaWGAIz3w>
    <xmx:AR5haUPawbxtSyg36smwzX7RkxHrRO0n2PnralXfWtjhhcwvts5H9g>
    <xmx:AR5haUJ-ixxUtNOHYJ9H9_x_GhjytjO3PsOtSUWP2JfLrfsZ_mqqNd7s>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:53 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 16:25:44 +0100
Subject: [PATCH 2/4] arm64: dts: apple: Add chassis-type property for Apple
 desktop devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-chassis-type-v1-2-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=SOK5Eyemmpz03VsX+x7LfeUtfqaOqL/374p1fPhcRpc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2d82Nzjmctf95j167yVD3cfUd2Jh86wXKAqbHw+7v
 vW/nGtzRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIk0pjEyXFB71Le780qm//6T
 jaUTGP7X8lqlBIbnBzXFOrMt2/97OyPDxiM204QcrjIIKt/f80wm6UnWUe1Ldov/MEv+ZGqY79T
 KDwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_072554_703019_0F4C008C 
X-CRM114-Status: GOOD (  10.04  )
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

Apple's Mac mini and Studio are desktop devices. The SMBIOS has chassis
types which might be more accurate like "low profile desktop" or "mini
pc" but without clear definition what those are use plain "desktop" as
chassis-type in the root node.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts  | 1 +
 arch/arm64/boot/dts/apple/t8112-j473.dts  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index c0fb93ae72f4d4fcb254a36dc408d55ab1bca0e9..5bba233b5383f227621bf0a648e9de43597b38ed 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -10,6 +10,8 @@
  */
 
 / {
+	chassis-type = "desktop";
+
 	aliases {
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..b379ca25b1b7011c0e24f0ef97a6b6bd469342f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -15,6 +15,7 @@
 / {
 	compatible = "apple,j274", "apple,t8103", "apple,arm-platform";
 	model = "Apple Mac mini (M1, 2020)";
+	chassis-type = "desktop";
 
 	aliases {
 		ethernet0 = &ethernet0;
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..a05951e91a022c9b08a1b7897832ae9553201340 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -15,6 +15,7 @@
 / {
 	compatible = "apple,j473", "apple,t8112", "apple,arm-platform";
 	model = "Apple Mac mini (M2, 2023)";
+	chassis-type = "desktop";
 
 	aliases {
 		ethernet0 = &ethernet0;

-- 
2.52.0


