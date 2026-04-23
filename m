Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E409FDEE38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yyOKutn1AUh3qcy0gcHugV9yT5TCQBCWscV32jNero=; b=LdiIoGPE3UFvKyNKLLFebHrjUn
	/LjggHQZA8OFI+tEcA/8TXCG0kuiIWDGNNonYIMovtS4bRAQhkiEgbwzNCUl4UXzDBUUzzdvu9tYU
	STqw1kt442m1OO9rEcrwG0V5NQAVpJHWxFwSekDXYT92NWPGbGp7m+EWo4s7IrXc9jgAfcKkx9lc7
	JD+ejkAH7Yt/1VsXSBOmN9XfqJy7XEVnEE08RlfWLcE5ts3HcpJ9U8jxWzZ4BIJbt3fkOSCwPc4PT
	RRlNCwGKvVmQ9bmKFEF9dRboiLi9S+8KduS3ED7WybA42FGq4q8quicPKGmJRYIUDpD0P9cXl8MuU
	skJ1qS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy92-0000000C4ph-0RsC;
	Thu, 23 Apr 2026 17:47:20 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy8y-0000000C4pO-2sGP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:47:18 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B2BBE140016D;
	Thu, 23 Apr 2026 13:47:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 23 Apr 2026 13:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kevinmehall.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1776966435; x=1777052835; bh=/yyOKutn1AUh3qcy0gcHugV9yT5TCQBC
	WscV32jNero=; b=J9hxGh4dzvGSBJ4ZN4TcZNc2mfbhNIJ9Z2eWmHFKGuyngHOO
	U3sXFV59P3Mgkf08kmSeQgNghcLCFY5RGcUaUYAhRqlOZ3P1MT3jKrsqrG6bhWW/
	Y8dJUO9ND6nvkM5fkztdRaTYf1HIzeynkkwSuyO7DjFXTzpNUhAyJDxmbXr3NA/w
	OHXsch2D/4Ml9agn3f1lia3Ljl0DgYH0Ga30qJ68jBNaQtdcNflCKlBaFCi7NWAE
	lZdxZe/P+GLWWqUCVvWvvbi/p3rDWBpKEueXWC3thsJb0vW14Tiur52w2QxR8uWq
	vzHpgoMBuCq6+HCVEwzplRCu2o9psXDXC/Uc1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776966435; x=
	1777052835; bh=/yyOKutn1AUh3qcy0gcHugV9yT5TCQBCWscV32jNero=; b=F
	0/sK1oGT0XgjbemMNXGAaTSHH9002fBNX0cXg1DYebw9VdMmSPzmVlegL/scTwTM
	zRgt2QUkpvUdYuQ19AHSxZ8JnKWUb+CQ5IWLqHYqN1GHtAX3BPVEXscNvFyr7iVk
	OrMtIcGXb3x53ulUqs4nM5W/VgSYufZ1rpyrEIWguts9Zg7JfJ3y0M8bdzduUiyY
	K7FRT/7ODh6gBErQh8tg44UmNVrCuFPm6QCoLUp6I9Y9ihin1XOW/JHJZq2wYBk9
	e/OFCVsfeVAHhwz+jbXjJlQa+Vl/joa9yXVdjHIgifCm1KfaJ7R29jVRaJO09w08
	SVjf8qva+KjmWH05vWsXw==
X-ME-Sender: <xms:I1vqafxDeMit8elWCOKgxY5i0xUTSHkqifbmPG5g--wk2V6OqtS6hg>
    <xme:I1vqaSEuKHgZgfUWyJCBzfzxXbjsjpWjfk6qfqcwzyRTXu7Unbne3FnGC5RvY7zXL
    60rpoUOfvn61mLL2trV7qFD-ijYU-CErqIfczAIBm2V6wRak2p-gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfmvghvihhn
    ucfovghhrghllhdfuceokhhmsehkvghvihhnmhgvhhgrlhhlrdhnvghtqeenucggtffrrg
    htthgvrhhnpeetfedvheeigfevheefkeejkeegleetiedvgfehieelkeekfefgtdffvdfg
    gfegfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhmsehkvghvihhnmhgvhhgrlhhlrdhn
    vghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghr
    ohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhsuhhngihisehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhhirhhkohdquggvvhiklhhinhhu
    giesnhgrnhhlrdguvgdprhgtphhtthhopehrshgtsehruhhnthhugidrtghomhdprhgtph
    htthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:I1vqaU_lITDgZ2Esk56uwSjT1p5gNliCGChgJ_F5_Lh_zju0i5IxEg>
    <xmx:I1vqaVXgldAoQu0Z7iyuwmH95JmWDNcd-mFl0dB8qYKM7Ar_BfWDmA>
    <xmx:I1vqaRe1nfIRCG2TbJxaMFCu2nGVrAbXmEBWTPHgypJ1SkrADX2b7g>
    <xmx:I1vqaebf17BpPhPYgYJSYp6Hsb0JIQBvrfYFOOuz4M63A4FvAniSJw>
    <xmx:I1vqaeYetFwq8hEBfFv9ARHGDTfNRQGnjQN0NhnkdP020C-lNdZW1Car>
Feedback-ID: i421842c8:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1472F700065; Thu, 23 Apr 2026 13:47:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 11:46:28 -0600
From: "Kevin Mehall" <km@kevinmehall.net>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Mirko Vogt" <mirko-dev|linux@nanl.de>,
 "Ralf Schlatterbeck" <rsc@runtux.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <9987fdee-7146-4dfd-a34b-d475a96685eb@app.fastmail.com>
In-Reply-To: <f93e1bc6-608b-4c75-8b1a-80f701ff37ce@sirena.org.uk>
References: <20260420164755.1131645-1-km@kevinmehall.net>
 <66909301-ed23-4b36-8955-a69b64eed9a1@sirena.org.uk>
 <d199f72a-093b-41bb-b33e-b6685563f704@app.fastmail.com>
 <f93e1bc6-608b-4c75-8b1a-80f701ff37ce@sirena.org.uk>
Subject: Re: [PATCH] spi: sun6i: Set SPI mode in prepare_message
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_104716_800864_B8E0628B 
X-CRM114-Status: UNSURE (   8.02  )
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

I tested with `spi-cs-setup-delay-ns = <1000000>;` and a hardware CS in the
device tree, and confirmed the suspected second bug: without this patch, the
first transfer after autosuspend ignores the setup delay.

> I do see that the driver uses a reset controller over suspend, are you
> sure that setup() will be called again on resume?

SUN6I_TFR_CTL_REG is indeed being reset after autosuspend because the above bug
reoccurs after a few seconds of inactivity. I am not sure if setup() is running on
resume because the datasheet reset value of SUN6I_TFR_CTL_CS_LEVEL is the same
as what would be written. Either way, it's moot if we set all CS-related bits in
the same register write.

I've moved the line that sets SUN6I_TFR_CTL_CS_MANUAL into sun6i_spi_set_cs()
rather than into sun6i_spi_prepare_message() as a separated commit in a new patch
series:
https://lore.kernel.org/linux-spi/20260423174001.2797797-1-km@kevinmehall.net/

