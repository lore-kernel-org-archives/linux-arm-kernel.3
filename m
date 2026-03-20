Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9752E108B919
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvlSLsOg9rAATuQvp/4b0bNk+5Q0SCiitC0H9DNdVRg=; b=QjVQvLa0ixkvkRVf7PrxDnGqfl
	8P/W3ClVm+UoDnaB1GNQpVxBYOffkkc/3If9W77MlSwPuRzs8UNPFui/7xvC/ycDhwwj/M7VsHliQ
	V2H6HrxuHZtW3vfJFBT2HjiqO9blx5k7c0iIp0CuEiyZD4+ED2v6T9Oui6NL5ytlEy0N8H0MhMLfJ
	HVeD44yGOgG9GsZm9jVSotX9Q8xIsc4ud6WMxcnrJCJv8D0HhVXue39Y/1qiEz4XYfjGl58ZZVFyP
	BkZUkfRtjrMsihh8TDwn9AcfdMZwdx9dDQxmhBjbnsNvoouxkrJt9gyOXOTLx5mT/okY2LKODalhH
	x9lItOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtO-0000000ClC0-24Zs;
	Fri, 20 Mar 2026 12:23:54 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3YtK-0000000Cl9e-35vS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 12:23:51 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id EFD0513800EB;
	Fri, 20 Mar 2026 08:23:49 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 20 Mar 2026 08:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774009429;
	 x=1774016629; bh=DvlSLsOg9rAATuQvp/4b0bNk+5Q0SCiitC0H9DNdVRg=; b=
	kxqkGfoNzJ1Nfkysg1t2YWFBtdrkKtAXajLr19o5yTV4uNR7b3WUaGHCKiItMfPw
	uPFaeqE1qJEges2lPjXVKzEvEAuW6Ec9QAq15GE4uFw7GYjKCi6A/2Pb7IGC/rr5
	zh+//Uxkow/WU+Bm/zLJAS9ELyPsbOW8K1s7z3z3OAGQxyC9FvLPT5nIlxOkFltz
	UTHeLaIdB6vOs7wK0lfJ751TpaCEubXGhcIEmciwpnMN59vXQ5FsWjRfJtw6NqFA
	QywQat+7v6f5kV+lPcHgLpE5rO4DJhK8tKvqX+idg18V1cdVjS7MFC4ciSllk9M/
	7tG/jxOw5WBJVzYztzkWmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774009429; x=
	1774016629; bh=DvlSLsOg9rAATuQvp/4b0bNk+5Q0SCiitC0H9DNdVRg=; b=W
	fqNrALMH4jlRtBaBnWxxlXJpOm1j6RC6UUVfl669L/LZX690Z9vpIKibQCw2F4fR
	hIBEdx4OU89DKQr7FwIVxLUJIEyGgNMMPrBYJEZzxK2aalOYRN/RqFevg2ui3hlf
	bmgK8HEOvGeZurnEz8r+fTT4CdyIWEQnbkSy1eAfSjPGq7i82OoSwTYnd3YhVPoz
	NngU1gc4lQSxKyeQANeiAFxcO8tjISlenCqirwu5jnr20zWmRejsJKhZhSCkRyJh
	8xAMAsbqzMM6h1giX/JYcDTbrXrSxY+4p8HzPEn34hfxn/OY3jLVFYhxrAMkFydI
	GteExEfVfGC/WTM/ZsQlA==
X-ME-Sender: <xms:VTy9aebjw2LNMQJXGQMWZcArKawVrtQjgmNmumFvXDr6yZj0f_N-BQ>
    <xme:VTy9aWSggZq7pGzGzIdgGu_xDbhaDg1XflVT6fDMNE2i9HAoG07liqXCU433AmxRH
    fFo2sfko9evmDYOXP-mVFsVj15SUQbGTD83ltTrW9pIFq_aY5Rd7dk>
X-ME-Received: <xmr:VTy9aWgzpyujsqdgdC0hiJkweu8r2ZPPIXRX5GQqCblhrkt1tDFL8tNe3sDo1Nz7bBNPP4ikUGnla4GvS8e-LcOXemDNEgQlqjIbwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesgh
    homhhprgdruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgr
    uggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopeifihhmsehlihhnuhigqdifrghttghhughoghdrohhrgh
X-ME-Proxy: <xmx:VTy9aSsj424flPXKykjrHkK-jJe-ctDGlo25aXhVwT9_FgvzEeiMhQ>
    <xmx:VTy9aYz0OprbOQVwkF4uGj0R93G2v1rAL91zaL0TBwTmXpxMmSZv5w>
    <xmx:VTy9aQMvCkotxZ486VCWuE62iZIPPD6VULDWPEjMtEwGrOFjX2nnLQ>
    <xmx:VTy9aS32E-ZcT2nqC10JayjpWGqkoadP08uEcGqfCH9MSjootdigRg>
    <xmx:VTy9aXnSPeUSvL6mCP49a2gIPMhXctaKYkf2i4MOjuD-sRamR1ISVo8i>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 08:23:49 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Mar 2026 13:23:24 +0100
Subject: [PATCH 6/9] dt-bindings: i2c: apple,i2c: Add t8122 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-apple-m3-initial-devicetrees-v1-6-5842e1e393a8@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=983; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=eBMmaDJ/djXSONMeeCKnBnkO4wJ1J76ZtSepqcRlrt4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsy9Nh6esY6yNj+VJ69fPWP9zOkpj+tjdhvavZ7j5yBsd
 N9i7Z2FHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACby2ozhnwVf3s0tvhaGDu/+
 FxsdFNij0fyvqVuw75LX1tVqAuY/lRj+GZW6Hsq6sJx9T6XV9uvn41cmTjXovCwtl/7+7qal69I
 quQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_052350_862690_9E4C70E2 
X-CRM114-Status: UNSURE (   9.27  )
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

The i2c block on the Apple silicon t8122 (M3) SoC is compatible with the
existing driver. Add "apple,t8122-i2c" as SoC specific compatible under
"apple,t8103-i2c" used by the deriver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 500a965bdb7a84e4997b52e8c19dcc1a7ee0cff7..9e59200ad37b63eb6f00e1e219c53bcb3f7ee402 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -22,7 +22,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-i2c
+          - enum:
+              - apple,t6020-i2c
+              - apple,t8122-i2c
           - const: apple,t8103-i2c
       - items:
           - enum:

-- 
2.53.0


