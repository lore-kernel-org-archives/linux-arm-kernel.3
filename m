Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08403108B916
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCl0V+SQBcpw8bxOLxB5y2YcMK1hGGMyaZ23lgQY9Sg=; b=aAeO5cF4dn+dRu5TYmse3BCfWU
	4nbDwhHI4BlBqE50xProFEXYtdbV1qkjPr4hV24PWh3IPxVtWxJfbv1ZngdtoDz51ViduGWLx+czo
	H8Wj3NyvHAJ5MxrzXbHSclqX9YXqK0xHVcu024C2tW1HurRn+6U9bGoTF/z3wSqpsiguSbdVMVmZ4
	mHTU7NZMm8DJrkTLEBVjsw15pHcTvrz63gJl7jx060+P3yGkRMb6KWzrClcO0+Qxoz7sXPBXnpPnt
	SnbovZWCYUgw1XApjtYnOtIm7h/UUfzaND95qX2JpmkhSsS3Wofxxee4Y8xujrL+u3t3oKRZ1GB3t
	aQPthdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ytj-0000000ClPt-2Nrq;
	Fri, 20 Mar 2026 12:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtR-0000000ClF8-1jFO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 12:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nCl0V+SQBcpw8bxOLxB5y2YcMK1hGGMyaZ23lgQY9Sg=; b=QZ2mEjr2XvfGvAIca+4Nhs/HPK
	KAt4ZnX67FzfE4hvPoIAm3CCHSgTbYS8nGx34GR5OcWZYql7uFxb1RoaD5AAvuF2NmmrO88eUdbV9
	REUzZdUa57IPlA5gLT2crVGTPZ4eND7FV/86Njfj+SPWb7wXm0lTZGbyKmNuiUsuKPvJxX+KunEq1
	5bad7wBepr/9iWBIL+ld41gw5liQAH2pkNEtQbZnvGPq7w+4r58wizb737tr37JTnnGxgsXfHvkQn
	MCaH0xcxC2yLxXxd9b7L69inCJpxtXWgZjrH8Waxr4hrA1BX7NkAevjnYqArLzgrG9ApzGoJ4Hmn3
	TT9JsvLQ==;
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtO-0000000FVuQ-2FBb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:56 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id 8B3BC13800B0;
	Fri, 20 Mar 2026 08:23:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 20 Mar 2026 08:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009433;
	 x=1774016633; bh=nCl0V+SQBcpw8bxOLxB5y2YcMK1hGGMyaZ23lgQY9Sg=; b=
	dsDomXeti/l96cSgE5IB3L4xFY9rH3uNeCc0QDJh/wHLl2xHjj5ofTxOMe4gaZ5N
	0a2apfx9W4z/yVDlW0fKh1pKARckt7rr5zj5VrSpmqmTen+e8sAEqZRdNbJRH35O
	2e6tGra3jAwH2Nd5bKyryxw+x77pHG90tJuy71ul0XuUbEa/vyK1C2WIHPnbvZqS
	6gLMKRAjtwm8JxD7p20Z+sxsrdP3xb1qGQN5gNnRfMi8pHLoX1WDVo+1LyQI4OrQ
	9fmUBauhP3kOO/+agY/Nyr8Airb2vKZo+uD0FGP9UxshGEX4tFpGxJ62BlKdX/j8
	3SCqIGe4FSasO7C3P8NDZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009433; x=
	1774016633; bh=nCl0V+SQBcpw8bxOLxB5y2YcMK1hGGMyaZ23lgQY9Sg=; b=k
	0Y7z0UyD+x0VM/KcjjUvpNRgZgadwmRmD9nSKxtFpMXtlRaXwNqQJUMaE/Rx/pmH
	AxdK/VupPsApK5K5u31lA41KqVmFVdFw0yVSosg24dzqvVBtmG1VVVrmq+ff45Bt
	YNRWMpwGGbzdFiuj3lMy1p6yGplpAV4swhy4h9AgupeVOl1kO4iKewH84TO8diBk
	ECN0JkL11w6PB7hRqs8UklU1ebt9xr4xJkpHYnhyIjryVhLIE/UGabNehdRo4SH8
	vnvBS27GygtCyN3ufLixGQKWUQ39sKDtQTlmgAZMJsIOR7Cea38dX4Z7Nk5xGxFJ
	fXdpuW1lQ1PdV6dUfHInQ==
X-ME-Sender: <xms:WTy9aeJSUcZGrKpn_cuvoouEW9hSaj3ewFcgiYALxCYmMtA_Xh3aQw>
    <xme:WTy9abBJwOdHAl_xH1tW-3Pz9oo82RgE24lZViN8ngScSdLyXlAJCAOffJhGGnLjC
    8x47ueu932YBxYroPnLlm1de1Fqg1tAEkHR5j01LvRm-u4GZFsepSU>
X-ME-Received: <xmr:WTy9acSQf1W-8xehAin4vi7k7q5MN1efS_6ZFZdkK6DtsciwljBqwIZqhfiEUrzs2idH8EkzU7mL1xQMY6e9H0zQj8k2v9lZSUvHkQ>
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
X-ME-Proxy: <xmx:WTy9aVeLs3zf3MWp-10xJ-XIsJuPj9moS2S3vUb_ep71M5En8dOXdA>
    <xmx:WTy9aUjXHuopH84Ojt4jeIrGExFQyUbH8V11S4suSRs2T1eFvvDx3A>
    <xmx:WTy9aQ-hFhljjtyCWMfi34LnACh_I3Vxqhb-Kb3VTOIlxB2JWDSeYg>
    <xmx:WTy9aUlN58d0yXb8laa7mtyoooQZIiiRxUcOeN_Dg5MoekDiXMOmOg>
    <xmx:WTy9aaW7u0nfdHqbKMISN7dg0pP4zMvkc8XlT7MTL_1ACecG1lN1JeSc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:52 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:26 +0100
Subject: [PATCH 8/9] dt-bindings: arm: apple: Add M3 based devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-8-5842e1e393a8@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=SJxxfLf8m4pPdoRRfrkK/fh1aBM2pnBwzbyh0xmav4E=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nh5sWw70v5u3ef/J0GUrOe4Jr+poNK4x8tkicO6a7
 U3JrSFSHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACby8gUjw5z95jqznuk7T1m6
 yMhHbHteVdlDy9I95xgXNjFy94cf+sLw33Nu565Hx/1kZzhJvlTdkPE6iucpt6SK+OaDFqlq90x
 ZGQE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_122354_777454_8776470D 
X-CRM114-Status: UNSURE (   7.86  )
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

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 5c2629ec3d4cbcee49d3ff6a4db1cc8298e2a2e1..e49403c73f9d2efe7066f7c1dca18fc7987dc885 100644
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
2.53.0


