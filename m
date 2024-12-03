Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4C8E64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3rwoHqIVnmxtNxDPSG6Cqf+q8c4DgmmReYZaA9pX3Q=; b=jUvN2vQaLKCoz+R2B5iVI9jlHJ
	Dvqa7666yQOJIrj/os0cSaCkcoNJ3tJr0UrjLnLeToSYnMsceTsxPbJ92keCtGyXkiUEi8CZKAF4t
	y85BTBpi+mZyweZb4SuC7LlkMM53AUqPc/kl63RObqyFVxjkr1OgwfucvXgYAFVFkqQTesayngc+i
	sBgNI50Oz0MWRXHsn0d9awa4bbVcW0iMpzMz6xPPFJm3v1AC3d/1WvPCXvvp1jEAbNdRFIxX1CXYg
	N+pIPTuBDouUM8T+qrMoxp5KLzkdHpGzfyqL36f1ia+d8Esv4P/fJw8JxuLPyMstOql3lIg0ymTfR
	ekjxgZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISJR-00000009U7W-30Pd;
	Tue, 03 Dec 2024 12:47:33 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFR-00000009SuW-3nbt;
	Tue, 03 Dec 2024 12:43:27 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 3F9A41140120;
	Tue,  3 Dec 2024 07:43:24 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 03 Dec 2024 07:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733229804;
	 x=1733316204; bh=e3rwoHqIVnmxtNxDPSG6Cqf+q8c4DgmmReYZaA9pX3Q=; b=
	OWpbv2SdQuVdeXsxgYdIYA/KQEOsujuHaYuE+skl6m9P5hdrE1UaFcyybQkPuq76
	6bDBp5NqD2kG0j0jDI6+04wCI5uvt1TO1z92YBGOc33JBgoO/zGJ7xpXQnYwB5VU
	667WPgV0VTiOBBpkrYn1oW+AajdtHHYz6yjw5weKd0VHoteQxB+Sni1pyWC94cVn
	oyFzT3pAVGLUe7OzVVq9M5pz5Jti3NLHzc3+9ZdMpRBKGK8Veka5ELFQby51OiUr
	+1jr9TL1AJxvhzsOWtsUmoZ5MzY/TNz7PGb7rrIVtaHXyYXgqgniHuQDEzfkh6o4
	fFAjI8NgK94sk2ElzYY0PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733229804; x=
	1733316204; bh=e3rwoHqIVnmxtNxDPSG6Cqf+q8c4DgmmReYZaA9pX3Q=; b=K
	Ql/Q/j6EGWizSaPnM78KL9nimX4jWHu9cNWoF4HcO7W/wVQ1uUjxhZFhTTfx5Aqa
	33M2uwreBzdZ3DpqTmvU9GsBnGJ2GjS79KV6sFxNvqIOKmm2TJyKdUUhVFzEBEDb
	lyqQYwbrXuCV6yN+Unumr0KACnFBJH18vNTwqmfdn2113Vjze7mf4HCB5Kc7g352
	8qWG+EANLFAd/r6OQYNVyMAloDENk/oyZBqHUwQMx8ARCxhZuq1mr5QNc0tIVy1G
	UDhSXHQ/HU+fKLtkUQDQtrCBozEGl8F/KA4WbYh/NRa+QJrAKdCSCdjHG60cVwqd
	Oo3OPhib3xoDag3C274eQ==
X-ME-Sender: <xms:6_xOZ37LmToeylSHwE4pDy2CC6E5m2h_r4emE7KwttNNJVQHVt814g>
    <xme:6_xOZ870bERLOl4bEyq42aEL1h4E0640CllVZme8LosqvVIuXgXJ4C9HRHoJHCkcP
    5RY2rk4pE1J9tS-748>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieefgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrh
    gvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhr
    tghpthhtohepmhhtuhhrqhhuvghtthgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtth
    hopehmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtgho
    mhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhr
    ohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghmlhhoghhitg
    eslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:6_xOZ-ennU-tpmMXwOsu6RaxhRKa7cQJ3SLICt0PVwd4NRL5gMtdig>
    <xmx:6_xOZ4Jz0epV8mXeYVZkTuiQXVfz4hRW3uVdMBbCiJgN2KBOEe3SwA>
    <xmx:6_xOZ7K-EJ0vlzGs_aawZZIr1KnCETj6hPiF1n82ixW_cVLWxCwPXw>
    <xmx:6_xOZxy6c5QJ1uApKdY5MSpVFiSi-rLKFyt4L4vkrPcScJcNH3bxoA>
    <xmx:7PxOZ4BhzLtJMlJEFOxcFCY0DqjofD7tFay4QLAAL-V2FXPVnqzKTQKW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 913E62220072; Tue,  3 Dec 2024 07:43:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 13:43:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Boyd" <sboyd@kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Mark Brown" <broonie@kernel.org>
Message-Id: <0f07300a-8b32-4d3e-a447-b3fe3cf1ca81@app.fastmail.com>
In-Reply-To: <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
 <12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
 <1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
 <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
 <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
 <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
 <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
 <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com>
 <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com>
 <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com>
 <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044326_265536_19612AED 
X-CRM114-Status: GOOD (  22.28  )
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

On Tue, Dec 3, 2024, at 03:53, Stephen Boyd wrote:
> Quoting Arnd Bergmann (2024-11-28 07:34:46)
>> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
>> Stephen, can you please take a look here and see if you
>> have a better idea for either decoupling the two drivers
>> enough to avoid the link time dependency, or to reintegrate
>> the reset controller code into the clk driver and avoid
>> the complexity?
>
> I think the best approach is to add the reset auxilary device with a
> function that creates the auxiliary device directly by string name and
> does nothing else. Maybe we can have some helper in the auxiliary
> layer that does that all for us, because it's quite a bit of boiler
> plate that we need to write over and over again. Something like:
>
>   int devm_auxiliary_device_create(struct device *parent, const char *name)
>
> that does the whole kzalloc() + ida dance that
> devm_meson_rst_aux_register() is doing today and wraps it all up so that
> the device is removed when the parent driver unbinds. Then this clk
> driver can register the reset device with a single call and not need to
> do anything besides select AUXILIARY_BUS. The regmap can be acquired
> from the parent device in the auxiliary driver probe with
> dev_get_regmap(adev->parent).

I like the idea. Two questions about the interface:

 - should there be a 'void *platform_data' argument anyway?
   Even if this can be looked up from the parent, it seems
   useful enough

 - What is the scope of the 'ida' number? My impression was
   this should be local to one parent device, but I don't
   know how the number is used in the end, so maybe a global
   number allocator is sufficient.

       Arnd

