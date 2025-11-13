Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABBCCD4F5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYMUekvRtMYJKAY6x3e543kfQ1fKTe+PgZU/W9oNQzk=; b=km1353CBZbfIJ6ata7wsRjz77t
	slXRFuT+jXdFWxqayN5ZpWf83heUBUozVW/ILJ906OWRpFjk6iYEkScHcGg0x88vX6pc8GJyj/pwQ
	9/4aOMge7Bko/WIpdQ2vWqUYuTpcwwp5f3d532LPRsRi9ef289uYC41gFZBI5+ONJXd2j6Bff9O9c
	Lssc/i2pWtliFy6he7F5oY9tZ4Ju28J6WktxNwJ5ABeZbl8EaO7d8aRkIrQCynWVVn544eyruUfWi
	NPuPhy+bWLLktDOzyknAfZz4cGHeQt32JRt1GrZxsjoiaZ+pHQHIBvDwSHkvNqZxHKpOw7ZMG3tSm
	OzI/+HMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJT41-0000000A8OT-0At7;
	Thu, 13 Nov 2025 08:52:21 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJT3y-0000000A8Nz-0A1e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:52:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 259BEEC0197;
	Thu, 13 Nov 2025 03:52:14 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 03:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763023934;
	 x=1763110334; bh=jYMUekvRtMYJKAY6x3e543kfQ1fKTe+PgZU/W9oNQzk=; b=
	UbX4QYFOHS7kBbZS2klHc11vV1MJMf5lbQVdafBWQWU2pgA+NC+fizZmjkIrCSwh
	wqdJk5AsI2DXuYps4ryvp3Dzhf0fGJSgTU0WgjDG0MgxPryNQabHxRNzkg0HomdK
	W4SYLV0n7IfnrryUMT2UuV5M65dPRyN52tqbcYG6ofaCaIVF6KkVTMqbiYNXJHjH
	6c2esTorgdgrLj0A1dVnRbdXAH0TKej8dS3wHcbG3uBNetqocpex9jC4I4fX7nZ5
	bokmnQ7kU99Haav5uZNLDKCrv1zteDZ1wTz10xbla6R1q0yhpy0z3EHTQ5tB9ILj
	3SV0mnOud9k5bldu+5/7zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763023934; x=
	1763110334; bh=jYMUekvRtMYJKAY6x3e543kfQ1fKTe+PgZU/W9oNQzk=; b=h
	LD5WtIAtxI6L/j83lw5/ymPmaVx9Tm4CvHRo0fZPueushTVf7/j6zKpOVX9B5o9M
	oFWQ+MoggvqmotadRqh286mTw8cfI4ckR0IOOTH/xTX9DVVyGZ1rVb+n4Aiku4Fe
	kT/bJ9R+8EnAfN2aLOYFsbhV7drBsRGWC1BVC50CPHTZOAP1YezEmb0aJlnZ77n+
	dNSwcOldg5s1I9KIb97xasxHCo1XXybw6RrwowmL3yHL9XlMoU17gafUGTATfWiM
	guzZunISesGzK7hNqwcft16r7a+5MPbqEOUxcNo4DJdxihKCFYNnVu20e0L1XVQA
	+j3XhI4GjgkUphxdluhgQ==
X-ME-Sender: <xms:PZwVabJh48yaDBPI1bi__mlNjPtlpGae6bubQDE-xcYKfV4gEaqqeg>
    <xme:PZwVaZ9YPc6-Yuww52iuSMIVyQCkSa85HAWyp-WnCnz8TpfeJoi9VNgW04pPhSpRI
    JSbRRSLCAdBDLVT8po1glFCn6KAEbwnmyC69V4CvkdBLsffmlKXoHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegumhhithhrhidrthho
    rhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesgh
    hmrghilhdrtghomhdprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PZwVaWR2j3NHIh-HnpFZRzycEiSbyzOLYaMdGFGYZlqw57s1gjDgSQ>
    <xmx:PZwVacPWQToEZFGpspzQ3hBahW0MV4HIWcMBiM03k-oNFg8JfSmXvA>
    <xmx:PZwVaavlkeWD_mmw9tjdXSgH3y081ty-xIBFei22wZd3-XSNZAyFxw>
    <xmx:PZwVaYTbLS79eXhLy0E95xLJuKpP95NCLqJstCZ1sG9VIldoxwViVA>
    <xmx:PpwVaaHpABdLi6z7_2kjSTe68Uj_yDTY3ILn6PPpGu0XsNZBCcaTQDvH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 152DA700054; Thu, 13 Nov 2025 03:52:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbaJD8fJSN-F
Date: Thu, 13 Nov 2025 09:51:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Kees Cook" <kees@kernel.org>,
 "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Alexey Klimov" <alexey.klimov@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <c9be32d5-a2a0-420b-9308-5f0a19a07eea@app.fastmail.com>
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005218_554795_1902265A 
X-CRM114-Status: UNSURE (   8.31  )
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

On Wed, Nov 12, 2025, at 14:55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Please take this through the gpio and asoc trees for simplicity.

