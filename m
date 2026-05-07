Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D14CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=3JP1wMKpeTbubODzy4zk8K5esE
	GejujQ0UOacEyKfWZT+M4mzMMZ9QPFwF2zZOKcI9APWsSjUYDw2uUfdfc5sV52s0DcMpPAxhgLTzT
	Fsd1h2nKKGxuZjyM+2lLgrYx+n+MTmPe5rxKp6mvcZRVuxyczTuORYYlhV16rmCZDYDMq6hWOiMWe
	Bv5RmZMJxyDeDEpAN2vzVeMujxnGWYexJyIpIdE0fKLAkwnPryswhVKRvMSKngFCH4lvKjBXVWhXR
	ExUqiPfz6/1ZmqiOlhae8qrNu6BZLxHAI7+tAF3LXaDHEA7exrxDtX1J8W9DnbsSWg/HnalDCI2TA
	YZGRIXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtEh-000000032Dk-3ZGe;
	Thu, 07 May 2026 07:33:31 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtEg-000000032Cc-2tRK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 07:33:30 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 08FB514000AD;
	Thu,  7 May 2026 03:33:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 07 May 2026 03:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778139210;
	 x=1778225610; bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=
	jw+mAB3nfrVj+oCvb6PYqUKt3zlfOy2oc3tCxbAYuLb8CjwOHgcrAbpR+qyTnxuL
	HctGMd/U3rPK+Jm0oGE1yfsTlAHUXSiCMgrfMAKSKzcJOqHEBhajD48c7kjWpYxG
	dvHRc5+uQEsR51DAKlRyeZqyMHTC1e8a2GVQsc0H/OU94sSqJuUkX744XEAWMUMH
	wAdAer36SVV0KQ90R25j3Oigh79+sT6M2Ny10pePH6+PrbhyESPbckWZ5w0YAfp5
	4iaUw0JPVFmySSn+aDV5NxvAaU/MF3dPwqoaxnz7lKx7bqBDyR2NzNqFuc+Bco0N
	BtvrGgHXYH5Lxq0e0KzPnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778139210; x=
	1778225610; bh=3u0oJwcvekIHFlIhYowyYD57pRQNHflAh6NHQg3cFkk=; b=Y
	4IhRj9cS7Z8BtNyW4cqMv1fZtxK+FJbrgmCY8vM0sDFsKM0lUtrmyAzkIISRhhXm
	T3oIvEJDrm7f2idNNG0dpOMcIfW2peOuDATltOz2wlOVwRYgbQa3K+r6U+MDw4vZ
	sSIhJfuTtsd5XmZOgPWwmmKSW4QoOd0919d1KriyZTPbdH+GDdTnaCU638d3dRht
	j1uMyakfNuR63K3Q/HGGSiZZEOuSzgdjVVsS/5OROpSK2DGC3jWoKEIX68fAndUx
	2Dbd56bcdiGikhSki2LzzSoaW5f+4BJgiJND0n+SfMNieyDAQeS6pmowpNuZBzo2
	gPSyAUk0YM5DyXJC5xvoA==
X-ME-Sender: <xms:SUD8aXbNpq35lvoIx9NfZQvtj_GFNgSOig5KuupQ2Nd0_QmdwHa-vg>
    <xme:SUD8abRWNwZeOhbUqx2NCTxVASd_pe-Qwd-NnLxpwJX6KCjcu079SJKuAiUVvU_3d
    RGyjnrEYZM7qSVMkBvhfVRJCdy_HkrbdqjKDbLMdo7S16tSe_gIvxQ>
X-ME-Received: <xmr:SUD8aSjrsZaqXC4E3vNIkFB-1N5kaqfjaJ_WHqumh-GtwLNSXStRJ2hrnSbap19UjGh3BdfJqMImDPhJwhcY_yInmSis5yYEb7MX8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdeikeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhv
    vghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepuhhklhgv
    ihhnvghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrd
    hlihhnuhigrdguvghv
X-ME-Proxy: <xmx:SUD8ae5e6lecumkZoTh_AzJB3F9qdRqPN8WuT1dQ7EBjzvPXkIjmvw>
    <xmx:SUD8aVkmkPA0uGGeG8BFgarLIJtGXK0a8VY061x-Zq_0s4-mOPuVrw>
    <xmx:SUD8afMzU8vEh_BDrWlAzvQo1qCDrs2hWJt000eKBNehF95O4-3H2w>
    <xmx:SUD8aXopiWz_PyByJtFXl1bT7toe_Tn7qj39K7sga2vwvey3-u422g>
    <xmx:SkD8adbwE2FY7ZnTiM-f-UJG3p-yPT-Wzj7MGTCDECj9GHqwU1Dp4_fb>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 May 2026 03:33:29 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 07 May 2026 09:33:10 +0200
Subject: [PATCH v3 4/5] dt-bindings: arm: apple: Add M3 based devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-apple-m3-initial-devicetrees-v3-4-ca07c81b5dc7@jannau.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
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
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw/DvYNB+YcY7rL03R7TW1F5feZFw+cX/04rEqlZ+Z+A
 e3ULM7nHSUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZy24nhn338VBmN3WuroqW+
 /Te0cjuaxW7gMcOb4V3byVeKRWxF2xg+MmoLO05cMneL4BORU19XnLznu0Nna+JkZ/c3yo8Wevd
 wAAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_003330_821025_7E9D97E5 
X-CRM114-Status: UNSURE (   7.64  )
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


