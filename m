Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CEC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoC4A91iFsIqxL2BMCOUmzr7+gQTh3p7d4FX0nmuspQ=; b=hyWDOCTbeNYtcIS4htEF06lZBh
	GMLjKIc+aaZZL1jW/TwqNQUwvz+XERS3e42+gp4saRh2e0Awx8ymgzClx978wCv1rcim71G4b1kwf
	Vp27M0ZEXsAwLCjKZSe6ydiPiNaov/cdj+z1NMFkxizK3n/ancZP9f0JlEdOBwMX9An2z6D7fe7Wy
	Fi/XBqla2h6G1mSWZzqwEWJzdYwrQUzYph34MkwCmQYZucGfKHtK5pJElrh0XOnzhCvdxWqr+M5zM
	BtAjAAmmDTWntGQ1hpmD8EtyIw7zOwEUmB6L/w+YaibtjDynk+hBGOQBe+7yCtqEGiWxBWBb0Gh1O
	QeTomZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7w8-00000002Lz4-2pOe;
	Sat, 18 Jan 2025 12:28:24 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7ur-00000002Lgl-2TGD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:27:06 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 43684114016F;
	Sat, 18 Jan 2025 07:27:04 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1737203224; x=1737289624; bh=WoC4A91iFsIqxL2BMCOUmzr7+gQTh3p7
	d4FX0nmuspQ=; b=mrx4BB+CmssLyUf71Eqo2eu7tVcNAEpzowoyXpw2lk/J8Ir0
	SXP8TsW1lR0pw0aNz8vnm0tkAD5MU4LICWDR03MNQpiKZBmfwCLoQCBrr5wu6sWo
	qFlAI555DMqQ1WQ5ofmTftZ+E94V14k/PiUuKulfjTC4o5+okjjiyRnoKlOMe8PY
	xzA8Y0Ei8xKOJdaQWHI4OV94g/wGucHTV6MRFXfoN6Bqmcg2tPtB/Gic/X28lgnj
	BOwKnhChtFBCr/wkH0bno8zTVivWuA82sw+Rg26H8ShnKI1HJbJk8Rj3xTYveycJ
	xLmDrIN4v2qODW1TktrCg02zMENAjF/TDMZdJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203224; x=
	1737289624; bh=WoC4A91iFsIqxL2BMCOUmzr7+gQTh3p7d4FX0nmuspQ=; b=X
	yvvM3r+LP6WJF2IziGXYIk1RVmI2BSMaQvU/b8soNFY22sIwlqg+mwlyVM2BVyzK
	F1Z5PgmTHDakMk2oXos9PNzWH14icbmfQKpE+PYZS5udy9G02dJp9T+Rv5hcnGjR
	WBJqQitZ99CUQyQFplHJ3wrirdB9Ro36OQmtQ1mm4Jr891n1UR0eidfSCp86qL40
	aGTsa3UGWrfzX9mwF7SCbxxw9nT86cpvnuQa6/6XLc+r9doASZ7wSg6dqr+r/qKr
	WUBtu39bAPHex4QBPDEP29BmKqc0RZ4GEWIzUmEAbDNv8ApVO5XxGaHAQtt3tVTP
	f9Tk88RJZXnZkbhEkYrMg==
X-ME-Sender: <xms:F56LZyaeWD18yhBu8BgFMPfq6SttXnImRIU6SZkgpIN1Obh5T3g_Ew>
    <xme:F56LZ1aWz8NDvKFJBjcWxs0MlP-LDVJNldPgkbkBAsGDBXo7R7WrgrF6lmSdhaLGD
    tMibjXIYThcUpYvR8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
    ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhihuggsvghrgh
    essghithhmrghthhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhv
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilh
    drtghomhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvg
    grugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:F56LZ8-eHAM8JgqrGT7RaXuVjbLzvO960cp8y59-vn1BEAtFLtrHzA>
    <xmx:F56LZ0oElTd4FZnoPQhCEbOjC7LnSbNyWYMfOOCCwUFq06v-QVjO7g>
    <xmx:F56LZ9oTyegXG15FuM1mfp8oKr1nzEloMH029wa84NnwFWF9RQklWQ>
    <xmx:F56LZyTsUZ8mgA33eWZGCYOtD8d_uMi2glQprU5eBq4i1q5WNJLI6Q>
    <xmx:GJ6LZ-6M08OjXcWgu5OLwA8dh7wltlw7YEAGUFttWUS_TtpOl3PpIDao>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C9F22BA006F; Sat, 18 Jan 2025 07:27:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:26:42 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Neal Gompa" <neal@gompa.dev>
Message-Id: <b1588d48-fa70-46ec-adde-5981b4031005@app.fastmail.com>
In-Reply-To: <20250115-z2-v4-4-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-4-d7361ab16ba0@gmail.com>
Subject: Re: [PATCH v4 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_042705_702388_13E08B88 
X-CRM114-Status: GOOD (  12.61  )
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



On Wed, Jan 15, 2025, at 23:46, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add the MAINTAINERS entries for the driver
>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>

>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 
> a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 
> 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2191,6 +2191,7 @@ 
> F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
>  F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
>  F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
> @@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> +F:	drivers/input/touchscreen/apple_z2.c
>  F:	drivers/iommu/apple-dart.c
>  F:	drivers/iommu/io-pgtable-dart.c
>  F:	drivers/irqchip/irq-apple-aic.c
>
> -- 
> 2.48.0

