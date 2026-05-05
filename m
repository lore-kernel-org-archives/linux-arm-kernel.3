Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7684FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=MfxoCEElyUW5zSZQ0DHP9ROObr
	wRE3sR+e8nI7Sax2GArfJJJIuAlvCPvcIxPt/HBN3NRqRhYRWlDk8nITw8Y6SnMas3BLMXd7nqHzt
	2C8T8GBoNCK4Bp0Z5g8nlJPASaaq1bJ+vVp+9HNS8ZqDdpir2rsuCSqwknSkXDBx8y6xyWSXLweRU
	LSPT/dHYxOWdBYq+pOuG3GUBWOE3rjHZw9pMxMZdxCJjDb493V1wNGosed2ipRo609BVhnXqXkmNC
	BGSsSWK8Kx/66ykt1Oh9d6DFNIuUwbYVsu9rKxRmU421AMvmiZIgL0Zht94MWawP0kNz7cAj2FI2D
	aCpuSYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYm-0000000Fyj4-1X8B;
	Tue, 05 May 2026 11:03:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYj-0000000FygA-3xg3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=ng7nXp65hbX4GjDWAqrd3IbED2
	GmCDVyF1DTUHQepFu7YxGoMlsk9EkymUBDp4HW3U8AiohOBoQUmwUkruQKvUWqgF0AtHDFOJ2CVD7
	ekwblEo3h1FmDzcYFiTFAMLUuJp9Mbvjy4dzAXjWG7pXDn4F6kIcNmypqGw1dJbnv9XbuGdM1VKHq
	uQpMxzx621n4wdVbcVg7Q5AF+0gusz4ZB38cI4LejAvuS9ok1q62FeOHBpvymgR1aZS+MikPkclDf
	rMaK40xFID1PhfZ2fPdVz/X3oW5Ptq3uqqDZ0fQjwgcveVBZuT/rnzpi/ZjCnI1849+BOfstPbsOR
	P2SD22qA==;
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYf-0000000DIZO-3e6D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:03:24 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 612EC7A0142;
	Tue,  5 May 2026 07:03:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 05 May 2026 07:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1777978994;
	 x=1778065394; bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=
	U4h+Z9Madj6D1TqXCZfFFbf+aPXBbYflIS2PE5sD9F/qHkqDATmo6KZcLF2jDtOS
	kiCESgNh1s10tFJBoNquUDEghvY6jsDWr2kPeSPXYHzAE3pYD2dUVZP4804aJdr/
	m0mND65iWlZyIfGvelxOUs9/SzS5exbGMg0jHus1A4CXwpPJ6ckiUhwrahDDhWBk
	DR3nRcRi1UjMHnjM0Fgx8eq580yfZitvp3LOAZH1Mi2b8PIx+ryfxY83g9CwwvbP
	Y+BlI9x2AnhJ089mC2MiyAB4x1KzZgkmheSmEn4SQg5YYuGaWJjxfSDJUYgCLxY+
	S+M+FKhJckphnceKX5qsPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777978994; x=
	1778065394; bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=g
	wogU4VRvttSkVHu9teqJJRJdjxEOmE0RPqj5L4IrlifaeQOeoIidP8MJR762lTAq
	JE9jYur8b82xneyK0RSp1T7qLiv0R/+meGIdHfbUsmnZpcomOuVyTtVKIn3o7AHc
	C9iLnJEvg0kYQ79076VdLT+yeIBR9UgOLZVX3UiOjFrEaMMSf2Nxo4NifxryffJz
	zJsGn9jzWyIQ+phUsOpAKArOsk7BDZq7MvKD16rG6HwqDUberFWTaWvrQqoto/V5
	XSZIOA0IjKpU+YaBiw3i/mCH89Nyr8vZTHpE310akNOOwM6b+o7VcfJzDtJB8Q8v
	aOA9im56baQi+WzBvXxfg==
X-ME-Sender: <xms:cc75aV_486Br-aoMtLEsCSpbq7-cNdSU1VB9rO8cDUYJujv7bMoZWw>
    <xme:cc75aenxa49ukZrX5Ps_Y6acJsj2ffv5pNoVKXPbHBqwnV5EnPWRe-w-0h91WV7on
    PfkV4__7aH6JQdJ0sMx0i3UeSciiKFY9ElDivbZwXdpoGxlFhJ3P6c>
X-ME-Received: <xmr:cc75abmeZVApvKTMzPHnZtBnlOUlZ-IsFpMiY-tMu-K_ZGNnAUwIRHaFMG-WzL-h_I79De39qGomYsTm4yxXgBlVtLVqIyjmt2wJFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeif
    ihhmsehlihhnuhigqdifrghttghhughoghdrohhrghdprhgtphhtthhopehukhhlvghinh
    gvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhg
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhpvghishgrtghhsehusg
    hunhhtuhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtohepkh
    hriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cc75aasZbiRHVm0R9gaCf7o67hbV23LnnvBckMKo9_9Bh9336IlOmA>
    <xmx:cc75adJ2qGpG1ZqnMVS3df8_j1TMGHb-1jYo-P99iK7AQi35_N9J3A>
    <xmx:cc75aXgthr1ONB4TJSIuXtLZqecIXk357sDzDzL8fxFxkhA8jHh2Kw>
    <xmx:cc75aRvlBrW04DfkcVfPjOBXAdN7CZlaVcgynEGJ4Y8DsA2cD0rkPg>
    <xmx:cs75afsPcnrptvLwZHNVd9qePyMO-r4EKxycekgdzichcXEHBtcHr8iK>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 07:03:13 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Tue, 05 May 2026 13:02:43 +0200
Subject: [PATCH v2 5/6] dt-bindings: arm: apple: Add M3 based devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-apple-m3-initial-devicetrees-v2-5-b0c2f3519e0e@jannau.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1938; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=1IVQx6AIB/vfknI1NzcqynJhB4K52mpqTMLBWl1yw0s=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyf5+LjiiLzV//gqKz8dLE1RkHt8RKZWx8XbKnJTl7+g
 el1XnhARykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkkGjD8U76hVXr89Fa+yE+b
 bz2N3HDBceNEtpyvZed3hCm8WjFB/AjDH47HYt8Y4s2V56m4Gr16PqWbY+exL/GMmX4rF807+rf
 SiQ0A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_120322_759493_C3FDE852 
X-CRM114-Status: UNSURE (   7.97  )
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

The Apple devices with the t8122 SoC (M3) are very similar to their M1
and M2 predecessors.
Only the 13-inch Macbook Pro is replaced by a 14-inch version based on
the design of the 14-inch Macbook Pro with (M1/M2 Pro/Max). The Mac mini
was not offered with M3.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 5c2629ec3d4c..e49403c73f9d 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -96,6 +96,13 @@ description: |
   - MacBook Pro (13-inch, M2, 2022)
   - Mac mini (M2, 2023)
 
+  Devices based on the "M3" SoC:
+
+  - MacBook Air (13-inch, M3, 2024)
+  - MacBook Air (15-inch, M3, 2024)
+  - MacBook Pro (14-inch, M3, 2023)
+  - iMac (24-inch, M3, 2023)
+
   Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
@@ -297,6 +304,17 @@ properties:
           - const: apple,t8112
           - const: apple,arm-platform
 
+      - description: Apple M3 SoC based platforms
+        items:
+          - enum:
+              - apple,j433 # iMac (24-inch, 2x USB-C, M3, 2023)
+              - apple,j434 # iMac (24-inch, 4x USB-C, M3, 2023)
+              - apple,j504 # MacBook Pro (14-inch, M3, 2023)
+              - apple,j613 # MacBook Air (13-inch, M3, 2024)
+              - apple,j615 # MacBook Air (15-inch, M3, 2024)
+          - const: apple,t8122
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:

-- 
2.54.0


