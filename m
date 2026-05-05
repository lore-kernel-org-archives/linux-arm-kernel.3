Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84650CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0DLBQ104H4pRJmAnhQAaxKxLWgSeWObdD3M2XI1ycA=; b=UM/iKVR47pl9pePIf2Tb/7PguU
	WLkxkwiEOAFhaYppvsErlZ3pY78zkPAA7b5nqQ5bofRbQ1wFQ+5p2sLczCXU3CpkRyuVBYr0+kMmw
	IyufZ51tqZhB/LNifyk/3TgGtf65tBLErySjCZ7i/HHEFXYx1EGp4HlBWN2ir7v9vBlysFj6z1v9g
	w6P+RkJN+hJzlurwjsX3H2VMdd//AYnGTKxAn1Dgpf1wcv2x2vHrIMDdV5U3/EJ21xFzjKUpoDmvH
	VpOuqSHR9UMAVQJlxSk1E7kt7CKsqgwTFLqkDLzU7ZeBq/3DxhiTyvSaGvrI8AhOl3bZwVZmtUK50
	JS8SWQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYZ-0000000FyZ6-2uNE;
	Tue, 05 May 2026 11:03:15 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDYW-0000000FyWq-3ECa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:03:13 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B0E9D7A00F9;
	Tue,  5 May 2026 07:03:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 05 May 2026 07:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1777978991;
	 x=1778065391; bh=U0DLBQ104H4pRJmAnhQAaxKxLWgSeWObdD3M2XI1ycA=; b=
	Xm19n2oXQlkfpl7PD05knKysNHYSX/DZC6xWdl0KGZikxAsQ2xKQ4Cl2Y/QZqu6h
	N7XfULeSMKJMP8JhpZUlJ2FXlJkWy/uXt+dJh+xNtDplcLqcIOzfS7e7ZrD6RKkg
	/8SPVF46HR6rbc3WhqNysnuY63Og/RLNznfcQ7aQAWjuvle0vwX7DtE6h+5fxaZs
	xduD8YZXW16O9zHIMnIKh/4AP+f4US8wxuQyPL92uclXakO5gbtSi+lnZnYANTkt
	WrfqNlLh3C8uT83qhLStmJVKCthcUsB4+qCJGJb1c+kI2AA91KWEAD8Gnt0cFy/r
	eFG3E4RmVaryde5uQ9natg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777978991; x=
	1778065391; bh=U0DLBQ104H4pRJmAnhQAaxKxLWgSeWObdD3M2XI1ycA=; b=C
	XliGvqnT3Nqf7DRfQJEV32dEYwkIWY40zvFXYyY0MVpgkXhgzBjxhY1YWLzACZwB
	R4djKXV1PCe3G58huIs1tdY9l2TSSOSzygIR6InvRv5xEWO0IG9VtJ1wmDYzF9YO
	nCiOkj5c2Z58Eg/ae2NrwOpvJERdsxmYV0zdF0ZR2avFoEWq283aD6ioxgqwswBb
	sDvAc7zeGsY9KpY4QppLxXuCqeZ2tb/zVcDZa5YWqPHw3yH5zGxPJduZIx6bHJK0
	SWdEv0lNLN9bTy8+IpaLbOIcaa6rxMi0rvje5GE+hnwne7DYcoiiSShTpw9O6EM/
	Rcvask8AuylnlGfQwTgbw==
X-ME-Sender: <xms:b875adbo5zz61EYJmpRiN-a-Tf31XkwFzcjO20QbJoHdAZyOqwatNA>
    <xme:b875aZQ-CAAr1L1vW7CpyanwkXgCMO8EmT4sHq32HMfpDfzhWs1TMFlOZlleVGY8H
    gSYMl5YZdQI2XS_Zg3j5KqN25rrI50C9nYJ3VdqBhrWBjI2PiqO9Q>
X-ME-Received: <xmr:b875aYjld6fqsNualD1kCroMf4bSFWX44NBLw-8pMOg5T5x3tr7ESbY2-wTQ2prdmC7-YAVPtzYMknHBfcGYWYoLU0jvm3iRRTwkWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgf
    ekieetieeltdetieetfeevieejtdeileelieetleegjefghfejvefhgefhvdeknecuvehl
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
X-ME-Proxy: <xmx:b875ac45qGt3YsKntDBkUmfmcZsi07UFMLO-2n8NOx4luWxYuec-UQ>
    <xmx:b875abmXi_FwqmY1DzUjJlw8M5iyAJ_xPJDhrvry-NAEpG-ITF8S8Q>
    <xmx:b875adO5vuJ0F5Z4mnU4LecPXvUsAtF6pm3ayDXBidsbf90aQ9PWgQ>
    <xmx:b875adppGKrPTXLa-kDmLid02qJfFdImwTs4_QmAdojFj7846PeATw>
    <xmx:b875abYSIFQ-C8DC67Zd8AtwBDuHvGnc04ZEH_MU3wUkZo94vayY-9Ep>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 07:03:10 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Tue, 05 May 2026 13:02:42 +0200
Subject: [PATCH v2 4/6] dt-bindings: pwm: apple,s5l-fpwm: Add t8122
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-apple-m3-initial-devicetrees-v2-4-b0c2f3519e0e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=gUN8s2Ri7zG9BdlChN+PUyMx26oLN03c/SpGRdRYMTI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyf5+JVAxwT7WwO7jN17Vzqeu7Fl7l1H8INnd+vTXd7P
 Vtm/bPTHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZioMjIsLDtk6hzpHf669e5
 XSXnu/4eW72mXZSt/srJm0uW622TUGT4Z7p+ztmUIyfLdjgc73rzvPj+q4i7k95sn/Ns68RVzhf
 YfdgA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_040312_874107_54174E05 
X-CRM114-Status: UNSURE (   8.75  )
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

The PWM controller on the Apple silicon t8122 (M3) SoC is compatible
with the existing driver. Add "apple,t8122-fpwm" as SoC specific
compatible under "apple,s5l-fpwm" used by the driver.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
index d8f4f9ffe884..25ef04b60ca1 100644
--- a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - apple,t8103-fpwm
           - apple,t8112-fpwm
+          - apple,t8122-fpwm
           - apple,t6000-fpwm
           - apple,t6020-fpwm
       - const: apple,s5l-fpwm

-- 
2.54.0


