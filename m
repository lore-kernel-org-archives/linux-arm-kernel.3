Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D2AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGGzdxKs99WIvOvhHGBuDPDZWmYDMpqFQRNBN6fwpSw=; b=Y/yQHoAFwl7t4+VLyVJlkz3JYY
	yFVA5EltVxxbSVOk04IHlN6W7t4onBWOZ/peH/UmE47n1/ZsOyNJhO0hcZt3SbIo8ZjGZfq2Yzj/M
	VVJUJ9LZosq7G55GLWzecoXolGf5fP7q3g95gE6Lp43TlAQu9iIEAVJSaq1yvJjjbRRjEv116voJ7
	YL2cqPr/EkPlWNXRy0P98nUdGrwXMPMZw/m9CSR4iG440tk7iVMPLFfdGZqZes50Ndw1qyvlGBeos
	7mU3BtUIGiGEnHKpobBmhIwT6HUgCXQOzCSskDkAthw0ikR4fYwwCS+DhdT6ObKDyT2QeK5Z5h8tk
	9+FQEZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgK3-00000008V62-0eT1;
	Mon, 09 Dec 2024 16:09:23 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgIw-00000008Urz-0DUk;
	Mon, 09 Dec 2024 16:08:15 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 2458A1140192;
	Mon,  9 Dec 2024 11:08:12 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 09 Dec 2024 11:08:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733760491;
	 x=1733846891; bh=lGGzdxKs99WIvOvhHGBuDPDZWmYDMpqFQRNBN6fwpSw=; b=
	TBLTHCMplAQlJdeuQQkMM42PUgi3ZqruQ8Jw4QMtNE8/2V0vyb8XjhcGzScGH24n
	XmMvnYKhhhamUi8B+/7Dyq4k0jUaHA+g+jQ+DrViFmI5dFjvA/hEUwvS8EE0xxMF
	hJdmI5eWHJM6wgJSQiU1AlKJAleGf008VF8QZjDFjffizPJyL1uqumSMxm8L/l+7
	WOUInjjhPhydDvcWUNn1xKp2/WVWiALIQ8+KiIetCCJ11ENKHEoNpNFCbWP68FGN
	0L1miB6SH79m+tijSQKh4d5chjpHN01ziMjStD4bLb763x3otd8j4sFNCeBpyFd6
	Epi330aKMHQL/93/b3QODg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733760491; x=
	1733846891; bh=lGGzdxKs99WIvOvhHGBuDPDZWmYDMpqFQRNBN6fwpSw=; b=l
	vGr9RJEsg5snz80iOXaT3YI60d8ndjMSPOp2dwht+WbMYyHNhLc6dMsTiDoifh1p
	1fqXguOCKZeH2oXDxCUHFLPfFTa5TubcZxujO2IOcZEIeOqjdASMrpDVk5sPng9b
	nfU4J9dld6EsHYVVxofNdbZ+Qz57Jp4llfJRJZgjsFa8i1uEi53t9sxzH+IhVr9E
	eLVyrPJHTdwwyR3JfrPlAe7QTllZ6eSrJPH5wD8DZ5s44biKy7QpIMyEStuPfl4X
	jepIa5A7MFI2bOyN6z279/jBJt5qCs94wwhnMpY5SiL6078pS0mZtC6b92m8Qbjv
	pjH+7WDodtPWkhd4D/D5A==
X-ME-Sender: <xms:6xVXZ1YdRy5luvP_KolHRbeucQwqGXeZgFu_HWCLdSyHzJmUamNS2g>
    <xme:6xVXZ8bd4H9MFb7v_UtQU40jPIKI4QVWsGv_zZu3jt6FGpbzg4-rBGSJ0PG6516Vs
    IsuwurKLog0_xCRG7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeeigdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhiuhgthhgvnhhgrdiguhesrghmlh
    hoghhitgdrtghomhdprhgtphhtthhopehjsghruhhnvghtsegsrgihlhhisghrvgdrtgho
    mhdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtth
    hopehmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtgho
    mhdprhgtphhtthhopehssghohigusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvg
    hilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghmlhhoghhitgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:6xVXZ3-p5pfO8YOYxyU94ucOT9yL81ex1CEDu31SN2hDc05SK07c9Q>
    <xmx:6xVXZzqxdZEwqEFx5y72G5_2BNeyNeJ718OlImRJGhs-oFPNAj0puA>
    <xmx:6xVXZwpWEpZiQVKzIlv6jSO07--YRBCmAAEWmpoJ5Gk4M-wfj9Miqg>
    <xmx:6xVXZ5Q6Ot2189TBydRQ5wS5LNDeur3Js0FCwfKVr1uADo__emnbqg>
    <xmx:6xVXZ32UoQWhJWnPf8wEmQMaYSUeZHwtPaFr3GZRiLd-akKNSn4CRCqW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 727622220073; Mon,  9 Dec 2024 11:08:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 17:07:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Jiucheng Xu" <jiucheng.xu@amlogic.com>, "Stephen Boyd" <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <5519bdc5-4056-417f-a89e-26f9ae426922@app.fastmail.com>
In-Reply-To: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
References: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
Subject: Re: [PATCH 0/2] reset: amlogic: rework auxiliary reset support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_080814_151615_6D5A7C5B 
X-CRM114-Status: UNSURE (   9.67  )
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

On Mon, Dec 9, 2024, at 17:04, Jerome Brunet wrote:
> The current implementation of auxiliary reset controller, with the
> registration helper in the same module as the driver code, does not
> allow to properly decouple the registered auxiliary driver from
> the registering one.
>
> This patchset removes the registration helper from the auxiliary reset
> driver and changes how regmap is passed, to simplify the interface a bit.
>

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

