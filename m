Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867B71090238
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mnTyAhpYWz2zaDPLvJ2kJeO/ztsRtlNN1dUSgeAJpw=; b=3ylWtGI+gfrWfzOJuRM6+c7Ro0
	iP8VHjpxoErLJQJqSyIRUPdypCWI0KyCtMW1Q6tKbrsrQGoz0elILxS8px0oNCoU3Isu62AcLW1ZU
	R+qiZgIg1FHhoN7Wuo8dxJmLrLh94Nr+eK4u1GVcHzj+YHjYaNm2WAdPGIyW4ErQD6uFzDNOog5s3
	zE9SpiwlCdJFlRZE4P/yebR4vDYgsVaHh8BIlBYOLOm38wYjiDPs5TPg/LidIxtvltf7NPjrsdDRC
	tbVuvkDXyseY0AxGeh99t7MU92VRFFgtcgHYOwzUa27eT94zxJKqxJJtrhbT9nTYpXQmngMX5AVov
	kRiJj/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ep9-0000000Aqfi-05JB;
	Thu, 19 Mar 2026 14:58:11 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Ep5-0000000Aqev-3kSL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 14:58:09 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 27D9DEC00FD;
	Thu, 19 Mar 2026 10:58:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 19 Mar 2026 10:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773932284; x=1774018684; bh=3m
	nTyAhpYWz2zaDPLvJ2kJeO/ztsRtlNN1dUSgeAJpw=; b=DjPKuzP8SUF8zr9Zs4
	tpLPVQnLeQ9Il+n7GTO111AOmoZHSV5Xk5ZLzAWYlBJSCJE6LsNTG27G0p5U2Vd8
	MddQJOkWuAEo6s4tioBvc2jmNtwpFSGViTZ2aAjOs1mX6slIB4HGnrEw3myoglLy
	bn3pPWAuNSUeLuQTWSMeVpoeJkk0fKwK3ahH/N7PhWY7V3bVRUKgXyjPjLDsgPfV
	ML0dhJcKNKbvzYQ83y99sJ7n5Gm+kD4csG9rtr9+sZDysNUcLXMw0nuLww1vRB29
	WVZvUfBmq9++q9zGZgi4/LoXasSVQG5WnzxUogubCWQTbNUYFDkH3jGT5POUDBx7
	x4yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773932284; x=1774018684; bh=3mnTyAhpYWz2zaDPLvJ2kJeO/zts
	RtlNN1dUSgeAJpw=; b=rPKRDR6a96r2lY/dGZZXcA/lhDv1A7Z0Smvi/HGcnIf6
	1St04c77cxzWulpsScPAP6S5F8zi3xsmpqFFBxUtxHXMqYX2d/LF2o1rv6X7yOrA
	whBCXcQd23aE+A+yz72Tn2NnkIBv4IB1RLhFthl0JlwKl6cAoJe8CArpAN938myG
	z4XVl/AXGVbgZLBNdSvpCkbklK+yoRW93mYd1HkzSfs4rWpBsOX6CZzqUpqmC2xd
	8iwTWrvDOfu2M1qDDymWP2GoDJLkzrOoo/B2No8jXsULom/JyoYSIS2/qAdcdVON
	HIp/v4R2Hh008GnZi1rps98C45RvVVK8EupDnOxMvw==
X-ME-Sender: <xms:-w68ab77C32kNdd-CowSo6Mw3vzXRwZ1SoxppdkffthdJDPg6hiXsQ>
    <xme:-w68aZH04Jv7dm4aejy0xAh_U9IcfNpl19cfN0tXXXWPFJ70JiCcQfxHbBME4OkaV
    m_OK-P7aG9idoOjU8h8AL-JXkFnflMDhAMrsms7eQQJh51yxhJl_-4>
X-ME-Received: <xmr:-w68aeApqTetZrojFw1I-TVb2NmBaG6kKah-eelCJoT8uJ_NZdkb8I5h04OECnJVKkDFnhjN1zTjbNQ4SfHPzcGJ6PgfLhR_ka-TBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfffie
    ffteeuffetuefggefhgfehtdfhkefgtdejueeuvdevkeetveevvdffkeehnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhho
    rhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-w68aWyanuuoSzEXCOILLw5Xauao5bdie_X8jadmvin2U1goGfCtgw>
    <xmx:-w68aa4LI8x0tAr8qZO8AYebamf782YayI6yyFhqGqtD8CiYgl98mQ>
    <xmx:-w68afwftwbNruos5KToLy6ScGOd314v4q09wep5cN9H8nVqKLt7Vw>
    <xmx:-w68aWch0DYfK8TgB_pNkiTbkmS_LnAEJcOA5FvovPvF0EDYfr9TCA>
    <xmx:_A68aaYZLyYCUw22XfOmOHt_6tZgQoJdWRqefD4NWWQN8ds6fN4jLNok>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 10:58:03 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 19 Mar 2026 15:57:52 +0100
Subject: [PATCH] dt-bindings: arm: apple: Add M3 (t8112 and t603x) devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-apple-m3-devices-dt-binding-v1-1-12052e195d6f@jannau.net>
X-B4-Tracking: v=1; b=H4sIAO8OvGkC/x3M0QqEIBBA0V+Jed6B0gjbX4l9MGesgdZEIwLp3
 5MeD1xugcxJOMO3KZD4lCx7qOg+DbjVhoVRqBpUq4ZWdxptjBvjXyPV2nFGOnCWQBIWNMZ5Ywd
 PvRqhHmJiL9d7n373/QDNx0uZbQAAAA==
X-Change-ID: 20260313-apple-m3-devices-dt-binding-88cf8a6fd429
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=pgxNV0NukCTQwDip0+2Xj8IDia+pUtXJoQL4YDXa/cU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw9fD9X3pjJtI3JS0P2SPXd4lBN1cYjD3OvrVv8e3FMI
 b9DQvLzjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABM5/ojhr4jK72J7/wt21y5w
 ZBatY0yZxju9atKaqxt/RzF7eW5238TIMPvG7qxde5Z3/9vWvumt0kWR6HrV/89vtyYxa+26z35
 kJj8A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_075808_163292_80F3F838 
X-CRM114-Status: UNSURE (   6.83  )
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

The Apple M3 based devices follow the pattern of their M1 and M2
predecessors. One notable difference is that the M3 Max SoC has two
variants: t6031 and t6034.
t6034 has 14 CPU cores, 30 GPU cores and a combined 384-bit LPPDR5
memory bus while t6031 comes with 16 CPU cores, 40 GPU cores and a
512-bit wide LPPDR5 interface. These are the only apparent
differences between those two SoCs.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 5c2629ec3d4cbcee49d3ff6a4db1cc8298e2a2e1..acfe9824921280458d0911ae9cbf609101f37380 100644
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
@@ -116,6 +123,14 @@ description: |
   - Mac Studio (M2 Ultra, 2023)
   - Mac Pro (M2 Ultra, 2023)
 
+  Devices based on the "M3 Pro", "M3 Max" and "M3 Ultra" SoCs:
+
+  - MacBook Pro (14-inch, M3 Pro, 2023)
+  - MacBook Pro (14-inch, M3 Max, 2023)
+  - MacBook Pro (16-inch, M3 Pro, 2023)
+  - MacBook Pro (16-inch, M3 Max, 2023)
+  - Mac Studio (M3 Ultra, 2025)
+
   The compatible property should follow this format:
 
   compatible = "apple,<targettype>", "apple,<socid>", "apple,arm-platform";
@@ -297,6 +312,17 @@ properties:
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
@@ -347,6 +373,35 @@ properties:
           - const: apple,t6022
           - const: apple,arm-platform
 
+      - description: Apple M3 Pro SoC based platforms
+        items:
+          - enum:
+              - apple,j514s # MacBook Pro (14-inch, M3 Pro, 2023)
+              - apple,j516s # MacBook Pro (16-inch, M3 Pro, 2023)
+          - const: apple,t6030
+          - const: apple,arm-platform
+
+      - description: Apple M3 Max SoC based platforms
+        oneOf:
+          - items:
+              - enum:
+                  - apple,j514c # MacBook Pro (14-inch, M3 Max, 16 cores, 2023)
+                  - apple,j516c # MacBook Pro (16-inch, M3 Max, 16 cores, 2023)
+              - const: apple,t6031
+              - const: apple,arm-platform
+          - items:
+              - enum:
+                  - apple,j514m # MacBook Pro (14-inch, M3 Max, 14 cores, 2023)
+                  - apple,j516m # MacBook Pro (16-inch, M3 Max, 14 cores, 2023)
+              - const: apple,t6034
+              - const: apple,arm-platform
+
+      - description: Apple M3 Ultra SoC based platforms
+        items:
+          - const: apple,j575d # Mac Studio (M3 Ultra, 2025)
+          - const: apple,t6032
+          - const: apple,arm-platform
+
 additionalProperties: true
 
 ...

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260313-apple-m3-devices-dt-binding-88cf8a6fd429

Best regards,
-- 
Janne Grunau <j@jannau.net>


