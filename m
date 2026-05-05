Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03FCFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeRP4uxgJUzsKmseBXlEN6ZhvSvowWXW42C3z5EkAwQ=; b=M1be/NNausrRja2hFuWyyPAAiy
	/Evvr4yBKVSrx9XMTfVWArNnmXWDYtqbFSi9HuKbzr/iGrySxGt0q+Xm3N6sGBfxyN/YQ3fmZfwy+
	RW6a3BX+dNg6XRd1lmTtIuDGMkEnFsmDWz7OnT6HPTgw8tbauza2agJ/XCk0K9YZLoguJza0nlnZ8
	ZO6OGlJCDco5Y9/UL4chUEiPb/C0y21Y1F2109yvmlrom+/fcjhhDMt9XSDJve7jyJJp7H0Xtov/X
	8xuPF5k+dgmiLi26F+8gs4imL67klrsqnMUgkS0RkuG6QsDpoLAsv58F7DV8CNpJkXUTdxHLFwZ//
	X5ifVVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYW-0000000FyWs-2Jd5;
	Tue, 05 May 2026 11:03:12 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYR-0000000FyUV-3jxn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:03:09 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D84557A0122;
	Tue,  5 May 2026 07:03:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 05 May 2026 07:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1777978986;
	 x=1778065386; bh=OeRP4uxgJUzsKmseBXlEN6ZhvSvowWXW42C3z5EkAwQ=; b=
	K72goCizpiMpUklrgpWjKTeIes8dzkD56WgkakutA0cUxwECPpD8yrndEzUYrkfH
	woXcBq9vUa+sddZnAfjUSRyoJmrV2db7djvsVWRm5SQeL/QRWZuUxwI5r86B0hxv
	I5ctNZ/ba2Up3H5fQomW3qKozvIG2QYH6QdAkZrpIfp2w8pe/HUlo3EFqURtxJFC
	g1N/yBUxoKlJYpNYuQ/Oh/UVfVgb2Ydv/Y2fiAg6UbOP87AGfdFhXm1NNzpEyFzf
	0dx2keGCUNkrgKxNXGvx3yUwNMEq3RmtXZZ655LhsNJPRa4dHtxgQBavcLakluPC
	2ddD8RX4EPh2ROJ19X+zSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777978986; x=
	1778065386; bh=OeRP4uxgJUzsKmseBXlEN6ZhvSvowWXW42C3z5EkAwQ=; b=G
	n8tKnNM0WqAw3+4MzLlYAcqL0+zQBhbHlw/GPxqLC40emlmydDrH5bMwCY5UnQcI
	nLt6SyzH0ZcOTZ78x2Z4jEgQtxNUfdXHniUN45woOjYckTb4vleKnY2LiEAlYMmt
	PhK4YyjkemBqmtQ1uJbhcP25qEVg6oqlRRfWSqWSCkqtaDUTugPQIo0gEDdEfWXe
	N/pTflB8V/FSQz7OTVWiLu+t3La+7lTaFaHPQ5zuTPodUoKkb2wYN29DfuOgw8ZL
	SFRdW9s3DjkYGIcLuMKwKz58pUOJ4v+GrHNQ5gU0OO+tUZ6WbZ6k2KiV2EAuwER8
	v8B6Xv9jyaggSZSQAQplQ==
X-ME-Sender: <xms:as75aUeDQoM0VYYvbggm3tiWoqmBuFuwoNHsYAvP0NEicHUCypOLtw>
    <xme:as75abGGibnrmY6yMuTZfWdmkOl_o8qc_7OwMm7uveBArQ_tyb3VTJq7VcYSey7tM
    taTvF0RiwMFAjaRKiOYSdvvh_wdgDziBUyGLhK7JHF4paYyRUu9GA>
X-ME-Received: <xmr:as75aeGnCWtJcyXhSQzy3Jb9DViALe5H8XQASm8Kt9RiUjtOTIVhcv-H-MM4l5r3MLDceqo_CH0bHgd8ZXOgYMjv_jtFDHM1olPWqw>
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
X-ME-Proxy: <xmx:as75abPvX_1fGa2rptLUpeo266wgotKqOGtGYMdJo0VqMqiu_-6iFA>
    <xmx:as75aTrIS09XtMVZ2D3f2AwFKlav11_zFkZ_mC68_Fa1zBv7kChSNw>
    <xmx:as75acBGEw73i2q-BjdyRYfkDksNuX0bsI0EF7FGiO58HTHIeQV5AA>
    <xmx:as75acNYMYSq7QxTZmcc-tR7tUJL42l5LA4dRGtPXvLx9tIeysTDbg>
    <xmx:as75aUMatedB9VUnrJk5oBLcYs5G6uMS8-xUTDN7UAQukVEo0pNtUa1y>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 07:03:05 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Tue, 05 May 2026 13:02:40 +0200
Subject: [PATCH v2 2/6] dt-bindings: power: apple,pmgr-pwrstate: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-apple-m3-initial-devicetrees-v2-2-b0c2f3519e0e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=+bvTFb6N9eybW1xIFA7El09z2HTI0pUgSg1eZJeYWis=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyf5+LdpierT1DWjFu4eUHRuvM8379tDX3Xn/D4QNGtt
 +uk1z/T7ShlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRp5qMDGfmz+z1zyy6f/x0
 8b0mxmj9qDdFjuKKxltEF1mdvn7bPpWR4XXVgv5vmvELZC4U7fHRUVraXvEpXfd0sy9Pduweb92
 zPAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040307_978422_C2CBD891 
X-CRM114-Status: UNSURE (   9.79  )
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

The device power state management of the PMGR blocks on Apple's t8122
SoC (M3) is compatible with the existing driver.
Add "apple,t8122-pmgr-pwrstate" as SoC specific compatible under the
existing "apple,t8103-pmgr-pwrstate" used by the driver.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index caf151880999..c9be097cfba0 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -43,7 +43,9 @@ properties:
               - apple,t6000-pmgr-pwrstate
           - const: apple,pmgr-pwrstate
       - items:
-          - const: apple,t6020-pmgr-pwrstate
+          - enum:
+              - apple,t6020-pmgr-pwrstate
+              - apple,t8122-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 
   reg:

-- 
2.54.0


