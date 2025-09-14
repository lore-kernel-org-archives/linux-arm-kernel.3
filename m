Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F75CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzCJFtXYRyJroeLFXYB/us06vnoQums11eW20jk6YCE=; b=GRqU5XbJEy9M+hXOLC7B57Ur+h
	HQ63sEPZfDcpcqyNIHNHhujpvqteoBbm71Z1NTMTGUlg36Xf7WY8BdQTcLSM/rik86t6UBlF9Z1ew
	ZBd1cXny9Z2dMx8J0n8LpMZVpDqVWjIgHgzaaxMKAV9Dqg1Eb7G5mORM8OEUkpkWFGyWU1kzFnHCA
	U3Ib7FH81+3eNpbfPG4+LmhWokzbybj7lxvN/R5boCqOIHWXfEvPyZX04/Jp0ZPvCii+w0q876qY2
	43iCKwzvNUhT3WS1Hgh3Nlq+T06dltrsRvqiLmNOcbFeZD6RAGBR4WdZmonRlez9njZRBLX0RVrf7
	CBsrM7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsYv-000000024Zj-2kw4;
	Sun, 14 Sep 2025 19:39:01 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxsYt-000000024YW-0jiQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 19:39:00 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3DA107A0123;
	Sun, 14 Sep 2025 15:38:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 14 Sep 2025 15:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757878738;
	 x=1757965138; bh=gzCJFtXYRyJroeLFXYB/us06vnoQums11eW20jk6YCE=; b=
	mwkPIpohZEhwqI/IwhfqkGTZsjuM2JNlvIeiphXFrUXYUiU2UMQ8Zl+1N71ETRMp
	mvj4n/WWKuaX6HUA0cwh7EWdiqLsMEmMl0RtxLH3YIqN9NSvlVve6j6p0HfWUYY9
	nbZ0O6kNkwaflL8XqWVlhSVd4S35DN7Ck5wk4yc4mKvPPirzexTqhXt9x0Z/Qeqr
	Ljl7DK55UdouDTDE650JbziP2P7yZ7JsbSVmjO2YyIHJw+8JsQs8oJm+B5Ep3F8Z
	jGlsulkARvxT/2Qs2PNdUOXcPVNa63J9CMzaiCZMhS4SBQAeosEGAHNquGlGzovk
	WZJtrJ7SwsPCQBTzo41mLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757878738; x=
	1757965138; bh=gzCJFtXYRyJroeLFXYB/us06vnoQums11eW20jk6YCE=; b=C
	B0Z69C6bJUj+e288TUML+f83a1KSjhZ8NqlbXBZPhgkE1Ja2aq9WU5q2bw8TYa0W
	AceMMk6KRLyuvfKXudhE4FSR+cdc8w+ioVsThTFg1QaiGJFjCFcH9WQ/BaetqrLw
	bPpTOoTcnGreYbJ5rGyRJVdGZf5nMwgLrEGLLMV6QRklGDjoZdjga+GfY1eNu4cA
	ussW4QoqX+21fZ+5fzOqgD4EqzTEWPWh1Ro3jB2tIJocWeUA3jY/EXbEnaBVb99/
	G5fQmC4y6iJL0dv2JOQj9t+MrXQW7RuBxYGwPy3TiH/gY4IMM7gFI6KG3tHznHuy
	eAmWrgQ6ek/uYrcT1YNSQ==
X-ME-Sender: <xms:0RnHaC2Xljp3iwt1DT_FIw4zAMwm-GFn-HfDTnBvT2ncv5GAKeDteA>
    <xme:0RnHaMUZ5GjcBDlVze7_g6SifHh9biwnOnkvsgDzhPHg52jCcxd6qonI8JRASb9CN
    RYdkze76BLLPqTDBuE>
X-ME-Received: <xmr:0RnHaFw-YmCxdUZ3srnpsX9BWVxk_HFwmGt8JVmTMQQFltsW6Zr5BzY22BtC_wb1oL42wrqfP0iClFgqSx8_tHDjyu-ikoixZnYaAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefheeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefhe
    ehieeludffheetiefhvddtleffuddtleduudeiudetvdefffehkeehgfettdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmph
    grrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghs
    rghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihho
X-ME-Proxy: <xmx:0RnHaDy9FbKT7J-iCQ9IPTsKyBZodP9yoDl91f2ikR6qbBp1CD5z4Q>
    <xmx:0RnHaK25s3Q9eePhupYu0QpHuaR6pngwVa02FchMe2nONa1vSTBiwA>
    <xmx:0RnHaBoQTz2-JBJXlTPQLEeR9KGpBMKPc8QVJ7hLQvRuRav2ohwmUw>
    <xmx:0RnHaAC3-cd5xE797989RGJHJq9ip1d9LNKlnO_L_zYZsE9RU3HRSQ>
    <xmx:0hnHaKnasb0TRCXW2cEp6bv3DTB3CWmJk35Z3UltyrcuA-rVmMeMdOo_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 15:38:57 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sun, 14 Sep 2025 21:38:45 +0200
Subject: [PATCH v2 2/6] arm64: dts: apple: Add ethernet0 alias for J375
 template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-dt-apple-t6020-v2-2-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
In-Reply-To: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=762; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=W0OKDz1j+KjVHP3zG7O8HDQskqjMR1ZP/OoML7KXvAw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhozjkicjsxcYfzJhyixt5OcWjajdME1gxU2nUOkDmddNF
 KvPrMvsKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBHzo4wMT0TLG0ru7ZZSapt6
 7cuEx7NubjwaFfAo5+iOAo5n33Ob5jH8j/VSYHlx72vu47lh9QXLWeZ2KcQrW9/+qP3g4NtE3Vn
 O7AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_123859_275450_E9CA67ED 
X-CRM114-Status: UNSURE (   9.11  )
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

The alias is used by the boot loader to fill the MAC address.

Fixes: aaa1d42a4ce3 ("arm64: dts: apple: Add J375 devicetrees")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index ed38acc0dfc36a1e30b1d44f1a8dcee089e87232..c0fb93ae72f4d4fcb254a36dc408d55ab1bca0e9 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -12,6 +12,7 @@
 / {
 	aliases {
 		bluetooth0 = &bluetooth0;
+		ethernet0 = &ethernet0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
 	};

-- 
2.51.0


