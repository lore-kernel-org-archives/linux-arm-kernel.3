Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB3DFA1FE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1VwOtAx2tzj0aOe6EJy/gEvxOwRvEH5McU5N86vEIM=; b=wi0K0MO0hVDED+Godh4J2Mbpw0
	6ots/6rZxGCUEhO1d+Tdkm3j96UJCYmnMZ8V/+gFRTwJuqTAFuc890LP3F46QzF27eaRjVTy5XTeX
	Jf+cTaIOonAW6ifbOCUzTuLNmSD8mncjUzeephKn4NYWtoEIp0gxD2AVseDZj+48WoPZ64N7O//ny
	ZJ2tms1ewV/GWkJfg1xVTvBfpHcUnVyOnKnINwvGaIptE40k9EzVrT6cG4gsqc8sELDQscwUk5xer
	Nk/CLyA/ggePY9raaB760Okxi8NtL5Q1fCfpoxYBlp5HNv/VTKJSVaOncao1RasppnWJJvuZzi6Cw
	0cg48D8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcpO-0000000AfHl-47lj;
	Wed, 22 Apr 2026 19:01:39 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFcpM-0000000AfHP-0UG7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 19:01:38 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7180FEC00CE;
	Wed, 22 Apr 2026 15:01:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 22 Apr 2026 15:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kevinmehall.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1776884492; x=1776970892; bh=K1VwOtAx2tzj0aOe6EJy/gEvxOwRvEH5
	McU5N86vEIM=; b=bsh47LX9HivrVOA3lFFnsFEYLff7hYGudNjNN0Vvt9ETjWyO
	XL1G0aYfF+nRro01BWNTczXWIhMhZk2KiWyzcaYwIooTtjvkFKIok/zXJPIxFfGw
	NbVQNVJmbTHQo3yDu/l9rdn7f6LJwNc6W41r1/xNMCtRENWS4eCWz9zZGD6NQW/A
	O56YQurW8QS3pAs0x6DZoKWbIRuA4LsDEcKJEjgZdSqZ2iqInQ3oT/38npFjzANO
	z5fov2m+ZKBYvsljZzWnT1s+Lrkl5tAn/NLa7EhxCWlp6kJoGMiksHJNuRGCleTS
	Es5Uu0GxkyCTYtqn3i1R14CIvL2GUpxH2M23nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776884492; x=
	1776970892; bh=K1VwOtAx2tzj0aOe6EJy/gEvxOwRvEH5McU5N86vEIM=; b=A
	PO/rQN1TM8rMPgTvl7z016DLsvnlJCet07VPm4o6zeprGGcdld8b1Qv82veavPad
	qLiXBSeYBGdtGqEteS9GSf2bFuOyK/9qmIgY7ASqDDCRIV1wrOy0s0/8HDBQkcr4
	u0YScO7LBuIagonFp2VPjvMw8XwtyQrqfBDFRDcZRjQnJTHaWwAul+sOh8fNjV2Q
	ubsr3sjDXUgi5SO8apGTSKFBLBD4+ohva6c/ofQQezh6M6VtKjwSx3b1Sg/AcNE7
	ZRTV7ExJlwDhBtVDj9trvGyQn01qX9xLjYMqX3h+A0wUbg1e4ZiJyBIHV3xBLvyU
	2q95JvfduMgr2U06Dr5Zw==
X-ME-Sender: <xms:CxvpaXiXWi9oIh376PNNtWTjLCDC6CsFDmbcjs4-RJu51xVYa-kMsg>
    <xme:Cxvpae0h1xtmg1TuTlMu9kOINd-9ea23gybXsQArRDtqY0ZOYZpFBS6Hl-x451_e0
    01ZezRQrPa4GvNbtsdGTYGHQo9pFIZZy3ev0HH0uFsVgXmowhIYoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeihedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfmvghvihhn
    ucfovghhrghllhdfuceokhhmsehkvghvihhnmhgvhhgrlhhlrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeltdegfffhvdefuedtledtvedvveehjeeljedtudffgfefvdevtefggfel
    leelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hkmheskhgvvhhinhhmvghhrghllhdrnhgvthdpnhgspghrtghpthhtohepuddtpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopeifvghnsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrg
    hrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugidqshhunhigiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtth
    hopehmihhrkhhoqdguvghvkihlihhnuhigsehnrghnlhdruggvpdhrtghpthhtoheprhhs
    tgesrhhunhhtuhigrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnug
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:CxvpaQuica_t67utsH-8az6hAva_q_l3nK_KCZqEG1V_7W1VHcXhdQ>
    <xmx:CxvpabtmlBmObmxuXs6tXNTv5eLaeabdz_2XAtdQMTLDcUl4XGxOwg>
    <xmx:CxvpaVEDLg5F8rD7pcrTwq5ZITNxzDpphUYqFy40p99rsO33vIC-Iw>
    <xmx:CxvpaWMCI6RzUxGKMbiueEdpj0E9_X8jk8b3mJ7TID4QZorSySa7BQ>
    <xmx:DBvpae2WdIsDRgOMB6HbD-_ZZxygrXmmlFd5Rpa45ZdbUatym89mPY95>
Feedback-ID: i421842c8:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A1F4B700069; Wed, 22 Apr 2026 15:01:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 13:01:11 -0600
From: "Kevin Mehall" <km@kevinmehall.net>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Chen-Yu Tsai" <wens@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Mirko Vogt" <mirko-dev|linux@nanl.de>,
 "Ralf Schlatterbeck" <rsc@runtux.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <d199f72a-093b-41bb-b33e-b6685563f704@app.fastmail.com>
In-Reply-To: <66909301-ed23-4b36-8955-a69b64eed9a1@sirena.org.uk>
References: <20260420164755.1131645-1-km@kevinmehall.net>
 <66909301-ed23-4b36-8955-a69b64eed9a1@sirena.org.uk>
Subject: Re: [PATCH] spi: sun6i: Set SPI mode in prepare_message
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_120136_703733_44BD08BA 
X-CRM114-Status: GOOD (  14.76  )
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

On Wed, Apr 22, 2026, at 8:57 AM, Mark Brown wrote:

> Might this cause the native chip select to get asserted, we didn't set
> up values so it'll have defaults if it wasn't previously configured?

Per the H616 datasheet, the SUN6I_TFR_CTL_CS_MANUAL bit (which it calls
SS_OWNER) is documented as:

> Usually, controller sends SS signal automatically with data together. When
this bit is set to 1, software must manually write SPI_CTL_REG.SS_LEVEL to 1 or
0 to control the level of SS signal.

SS_LEVEL (aka SUN6I_TFR_CTL_CS_LEVEL) resets to 0x1 (CS high = inactive)
and is also written in sun6i_spi_set_cs(), which is called in spi_setup() via
spi_set_cs(). Thus it should be initialized before we get here the first time.
Once SUN6I_TFR_CTL_CS_MANUAL is set, it is never cleared elsewhere in the
driver, so in any case, this can only affect the first transfer.

I believe this is actually a bugfix in that case: having SUN6I_TFR_CTL_CS_MANUAL
set earlier means that the write to SUN6I_TFR_CTL_CS_LEVEL in sun6i_spi_set_cs()
takes effect immediately, whereas previously that CS falling edge would have
been deferred until sun6i_spi_transfer_one() set SUN6I_TFR_CTL_CS_MANUAL. As any
configured cs_setup delay happens between those two steps, the configured delay
would have effectively been ignored on the very first transfer, and this change
makes the first transfer work like subsequent ones.

However, what's not clear to me is why SUN6I_TFR_CTL_CS_MANUAL was in
sun6i_spi_transfer_one() in the first place. sun6i_spi_set_cs() is writing to
the same register, and it seems to me that setting that bit there would be a
more logical place to do it, though I don't think there is any functional change
vs what I have here. Let me know if you'd like me to move it to
sun6i_spi_set_cs() instead and how that should be submitted (same patch?
separate patch before the rest of this in a series? standalone patch to be
applied after this one?).

