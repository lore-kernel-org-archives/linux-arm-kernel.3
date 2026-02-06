Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D1AEE6B68
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCCtMzm6KqTbqKB92m3wtbBJnFEnWOwykIvs2rrsvJU=; b=aKHenA9gX2nNbgx6gPGUuXQ81y
	54yTvWeeLOZUx8dkMHGcJ2pZgER7onr3Y5QwaF9GJPtSMnEnP5d/PhX8ZCJfRRQcQNRw8BtTOvGk6
	1G14zMTT3MCF8+qUo6SEacPIGyiiN1AuQAtXohSfP9c5imsnhFpv/nSgeBsY9HKETf+ZwAONdIDy7
	uyP1j2nQMZ1cNxTi/d+cYROWdsum/q2jeEK3RS5bHmTseCfeg0c2XX2ePPEbkyvceZI4hS4TWouLr
	4n2cD3C9QjzUh8GPJH1I1w3vKTNHC8NFqqKRpQB6w+dJvcVjwZmyF6LftBRrKLLR+cDbltk47slkr
	9c0xSIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voTg7-0000000BqwH-32nV;
	Fri, 06 Feb 2026 21:47:51 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voTg4-0000000Bqvv-28Pw;
	Fri, 06 Feb 2026 21:47:49 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 5832D1D000BD;
	Fri,  6 Feb 2026 16:47:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 06 Feb 2026 16:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1770414466; x=1770500866; bh=YCCtMzm6Kq
	TbqKB92m3wtbBJnFEnWOwykIvs2rrsvJU=; b=kBQMKStbaWizfGcsqaYCUVeRXl
	18X6KsqsYCwdpcMGjEciTdsbb+yLhV9StQFwvmZosvG/P6OG+IMl7r2mTqHSls5o
	SKzgMtNB+AhrHKJsdJGclfX9LceKyB6GkPZl/GFjBv++gaIS+1U/UMGs5DRjFCeg
	o258xWxh4WFB79d5LuPbUc+8s8UlQuC4uonTBO5wUwbSxCWampFCCqHeGJJmqgwd
	uqqRl2hV1IPLXy9YZwB3duueonLr6fi74MZCjyUYZFNp25OV6qKb2uQtGWeyTBdf
	z+6SyQ8q3IolX9WuIDMQFE3tAznkr5BrPSQVxb18rpwsyCb3+r9+2jOLCFJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770414466; x=1770500866; bh=YCCtMzm6KqTbqKB92m3wtbBJnFEnWOwykIv
	s2rrsvJU=; b=uKzF/cEA0hrhle1IQzAyKhFNvHnu3cNQNBLimuBgyrLki+C6Mha
	0oL+fhAiF/06EF9H9N11ubEOzgNzS7ib4evZ6tNAT/M479ICnqaELWYSe4joj7EC
	pyZmp1Sb21xIN2htTSW4bkUIKuZRQiyMTZKZ+votcc4bSRdCUR5Q67chqKTeb9rv
	b9eBimOJnsIyReMk7HMBPmHXmW1BiVIjHBeTwt+0EcehmnqCfmjwExFIzq89Pl9c
	m3EWZ210r3ltFrcvBC8znQ+PE8wSZanCCc6tA08GM7zLN9lhBYUR7HAs63lgHL+K
	/VxQW7VI22zIsUebStq25Hjy4rAiOtbqhvQ==
X-ME-Sender: <xms:gWGGaQY1U7LGf3qZzWqxMB6I7BXEs9a3VsDCRMr2Y2BE0JYevFhpcA>
    <xme:gWGGad_XTPfw63MoMJcVpAJL2Pnj_oj21Eij9Zp-JIa6tLBg1tpDEPEB2AQ_AI9LB
    0iYE48Ss-6qV7L3x4XUM-OTFPQs8dKnyWbkYaeCFPRX4US6jEyn19o>
X-ME-Received: <xmr:gWGGaekYXEBVsWx-Dg2pvdP2AuIdk9T_aHu5WUgwaDeKg1Ilz1RskqIMm_0tLG_efOmg4r69kaH5BLO6ZhuXEZJEkpM-Q-BDraw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeelvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgud
    euffelfeekgeeukedtheekjeettdfftddujefhvdehtefgiefgledtueefjeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepnhgvihhlrdgrrh
    hmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    phhhhieslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gWGGaaym8DcKTckLZWNLKcqul9MNG13j_q24zyRHxU3TTjtqp__j-g>
    <xmx:gWGGaQ6vRVdNfE-kTbeISIjryQxEsIOI5qjA6TyPj5wHkEnyAbLTaw>
    <xmx:gWGGaSXTe1oECI_g0b5H7x1K6oq-fFOzFaMc2B288fYl-a0BryAKQQ>
    <xmx:gWGGaQIhj0tJru23BiEDnr314BKc2GesQL-k-3GjpLtCfTeehkgKbg>
    <xmx:gmGGaVtWZYGpsm4aOjQ0c6w3flL9z-JlnOnH66XQ6Huu0lgX8oK8Tlno>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 16:47:45 -0500 (EST)
Date: Fri, 6 Feb 2026 22:47:43 +0100
From: Janne Grunau <j@jannau.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] phy: apple: Add Apple Type-C PHY
Message-ID: <20260206214743.GA194367@robin.jannau.net>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXvX1bYOXtYCgfC@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYXvX1bYOXtYCgfC@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_134748_737728_84AB593D 
X-CRM114-Status: UNSURE (   9.73  )
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

On Fri, Feb 06, 2026 at 04:40:47PM +0300, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

This is unfortunate, there have been useful bug reports.

> Commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY") from Dec 14,
> 2025 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/phy/apple/atc.c:2209 atcphy_map_resources()
> 	warn: 'resources[i]->addr' isn't an ERR_PTR
> 
> drivers/phy/apple/atc.c
>     2191 static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcphy *atcphy)
>     2192 {
>     2193         struct {
>     2194                 const char *name;
>     2195                 void __iomem **addr;
>     2196                 struct resource **res;
>     2197         } resources[] = {
>     2198                 { "core", &atcphy->regs.core, &atcphy->res.core },
>     2199                 { "lpdptx", &atcphy->regs.lpdptx, NULL },
>     2200                 { "axi2af", &atcphy->regs.axi2af, &atcphy->res.axi2af },
>     2201                 { "usb2phy", &atcphy->regs.usb2phy, NULL },
>     2202                 { "pipehandler", &atcphy->regs.pipehandler, NULL },
>     2203         };
>     2204         struct resource *res;
>     2205 
>     2206         for (int i = 0; i < ARRAY_SIZE(resources); i++) {
>     2207                 res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
>     2208                 *resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
> --> 2209                 if (IS_ERR(resources[i].addr))
> 
> This is checking the wrong variable.  The * is missing.
> if (IS_ERR(*resources[i].addr)) {

This issue was identified by testing and is fixed in next by commit
7d55b44e2be1 ("phy: apple: atc: Actually check return value of
devm_apple_tunable_parse").

https://lore.kernel.org/all/20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org/

Thanks for the report

Janne

