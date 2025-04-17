Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98580C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZp/NeDHcn4kz4i8YEhiZ7BJXzOynMSoJ4YpajxDv9Y=; b=dz0t7oPGCRNc0W+fwIKTzhLdq7
	qvpw4sQAfeu4Qw1xlvHOAGOhXWbqQKg7AtpEXUm1clqJUjcqkwdg06PvzGfKlymQOsSPEgh74Ys0f
	MpadubSlusSF2Uk/WVttu1VN/zYsmaR2xo7IuOSUeNEHHyf1awu+pzYt2zdQJbXhSMdVfyJ91CKhI
	6oxsddN6ehXxuUxkIGw0rhA2xcv1urlgRrKCFZ/ZczxBT7Hjh5xGvtfoKhtooNz8fQjmNN6dlfRId
	3VSnKiY54xQGxbrJNYyhcakjI+MGQQwDAFYdWvWC9f8W8LKLYzG/GQ8XQaOGrtersPCSA2L7l64HK
	KfMjUVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5S02-0000000DecD-3qmB;
	Thu, 17 Apr 2025 16:22:03 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ROJ-0000000DYQo-2VBT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:43:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9C8A439AE;
	Thu, 17 Apr 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744904579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LZp/NeDHcn4kz4i8YEhiZ7BJXzOynMSoJ4YpajxDv9Y=;
	b=m38jqekqN4LLyjuSzkr9b68XeNZ/fLMNDbqHEZyi3Gj55qmnrcebhrmp1ePWxiXt8rPd00
	yA5xxuF8w6OYc9xjjtalMIDVipq+edkpI59JeI/V1jX6PRwLKyq4Q/z2WZcuXeIlNwmb3V
	7FTk22k2WZ1Uywvzo7gQNRbKs/XL0RvFnM5ZlXKvwH280acGfoV38tDvXnJevaUr0SDTQ1
	s1bGigazo7VVOyfVMoQq8fiGn+J8vgJmlx9MswhLPH7aayxQuaXLqNLF+zrN/wrIUksvP8
	uM902u8R+jbUo2bfD6sKSMz11oOjrVFLY54bxE1G6PsDdSZgVcyCKFWMDLVwZA==
Date: Thu, 17 Apr 2025 17:42:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <2025041715425693974c6d@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250415160212.GA372032@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415160212.GA372032@google.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhriihksehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhnrgifrhhotghkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtfidttddrtghhohhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrhesshgrmhhsuhhnghdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_084303_761828_3DD71214 
X-CRM114-Status: GOOD (  10.11  )
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

On 15/04/2025 17:02:12+0100, Lee Jones wrote:
> >  drivers/mfd/Kconfig                                |  35 +-
> >  drivers/mfd/Makefile                               |   5 +-
> >  drivers/mfd/sec-acpm.c                             | 442 +++++++++++++++++++
> >  drivers/mfd/sec-common.c                           | 301 +++++++++++++
> >  drivers/mfd/sec-core.c                             | 481 ---------------------
> >  drivers/mfd/sec-core.h                             |  23 +
> >  drivers/mfd/sec-i2c.c                              | 239 ++++++++++
> >  drivers/mfd/sec-irq.c                              | 460 +++++++-------------
> 
> >  drivers/rtc/rtc-s5m.c                              | 197 ++++++---
> 
> MFD parts look okay to me now.
> 
> With Acks from the Clk and RTC maintainers, I can merge all of the
> driver stuff together and submit a PR for others to pull from.
> 

I don't think the RTC part depends on the MFD one so I was going to
apply the patches in my tree if this is fine for everyone.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

