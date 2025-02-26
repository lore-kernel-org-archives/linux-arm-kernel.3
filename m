Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49449C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUjbFqo2QU1rdCqx9p0fWtYPlF+MFrQBYwjU1X0A1aU=; b=ljqVuRu1FZhObzGOvPZera6CHK
	qWBWD9KPYt+TW4tPJrOo9CoiuEzlhalhCOVrCstTUZS+sjwdb/kn4VHeMG687MeGGWyRNmlMlE0Nj
	S+7URPXxd5+F1ukiQ/5PpeIaPv4wxZFt1dEjNgYyQ34yHRq+44EAZ4l2NS441aCZUp6lKrdI+p3vW
	wDKEDPz+bpHxNoMLYAto4Z/1D+yvziheyZX0JwvhpmZcCqaqSo1VDg4qb0VP3oCrzUejWCPOOZURM
	cZHS+K4j8fpv6ljj8PTTLsdhtFv0vqwMC6eyZ+oUK0sJC6q+H1C+X2uyMEIvgErAi0LU9JXjFs63+
	43ReWAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLIq-00000004jzW-3COe;
	Wed, 26 Feb 2025 17:34:36 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnLFv-00000004jbp-3Bfo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 17:31:37 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 43EF31380090;
	Wed, 26 Feb 2025 12:31:34 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Wed, 26 Feb 2025 12:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740591094; x=1740677494; bh=nUjbFqo2QU1rdCqx9p0fWtYPlF+MFrQB
	YwjU1X0A1aU=; b=WM/0LC1UY6lCx1XQ3RQMgiC5qkWp3PQoHg/zMjPgz+8Gq8S0
	FBenfcrQLGGoc5UF6zmDUP3l5ax0oHuMvWn4NraU7YrxngGwp2oOcZv2UOTxL6mb
	O9wNmTpGS2PzhF32+3LKfli/5XAP3geTi4ZH6stjuRQMc5qeLCg/wuQuMwV2x8c3
	aH4CsQa6Itghgtt93uX13spUhBejo1ZsVVsZZLdNhHOXy3TU2Y0wTmdYgXQ+bqZ2
	JBefG1dr9UPz4Ig3DJGYFgKq4xqjcoCZz1vWwuyr62UyK58tMZMU8NMDyBw4JeS5
	B7Eq9/dkO8h2qiWkNdUvPwaO47g38WHRdaJy/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740591094; x=
	1740677494; bh=nUjbFqo2QU1rdCqx9p0fWtYPlF+MFrQBYwjU1X0A1aU=; b=t
	V02rHzgC1pl8ZK+rDnzopS1aXDVwAw3HXJ313o9+R1x6Pz+0dcp6aEzlpRPWYBTD
	EWyp5iG2UcTRJdF+C00/FzCdJx2+tc6Q9HwgB6SoIRylZqyuVf8LvdGJuERd20WB
	9fpgaji04rE3N7+xwDAUKQpePeaLrJs2csHEt9/UCw0XPgQ+FORYeKGoi9ByLOdt
	mCBuskbLWPeSWDzeNegT8kPp6itF+c46gZpz0aemAFuQWeBtqV1rSBiKWq3nbifd
	LmCFC7FSwtMs8tw/Hl41SXgpt/hcC8pgDx0ZVzHqLPH6WeIXiyuVhJw96/tTOUZU
	+JUTXr8s5v/L0GUmSDwCQ==
X-ME-Sender: <xms:9U-_Z55QMmbaue7jPjXhTOPc2yJOxWxGcVdJtDRShFRS1JaB_8pNiw>
    <xme:9U-_Z25jeFUVG2jM6psDfQiMtLOJbP-HhX1KBmJTmfIaPw-mbaxz7JZVTM67ccVtn
    uKKftEi6v8ccc7LeGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekhedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhesjhgrnhhnrg
    hurdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgt
    phhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9U-_ZweCX5KzNvhd_NpFBh_R4tdc8bGHGWS51T9n5Ct4tKBpTQiqMg>
    <xmx:9U-_ZyIT1FZTvA0dG08CxtLhYmTRejfkzuVcFFTmUlnnCY-fbDA3yg>
    <xmx:9U-_Z9J1GN3EYlpS2kbuxwhhEiIxLmsQ5z9DeMih4_F-cAgjffjR9g>
    <xmx:9U-_Z7xyw1f3v0lL-nXRwO76DDO9t1sWzdQeD7tvALwEXH2AT_S8xA>
    <xmx:9k-_Z7i6Koc12ngnRQwYUsJfAY3Ds7vuT0_vRi3o4B_Q3IEoHlXC_q6b>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A5F55BA006F; Wed, 26 Feb 2025 12:31:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 18:29:17 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Janne Grunau" <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Hector Martin" <marcan@marcan.st>
Message-Id: <dfef22a5-1f36-403b-99c4-2d910a38f9ea@app.fastmail.com>
In-Reply-To: <Z79JyhOQUI_LV4oV@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-2-1a3af494a48a@svenpeter.dev>
 <Z7y14Q3ifu7U1tHI@blossom>
 <63c5cbfe-4751-4409-9be7-2fda21b09503@app.fastmail.com>
 <Z79JyhOQUI_LV4oV@blossom>
Subject: Re: [PATCH 2/4] soc: apple: rtkit: Implement OSLog buffers properly
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_093135_955326_6DC81484 
X-CRM114-Status: GOOD (  23.88  )
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



On Wed, Feb 26, 2025, at 18:05, Alyssa Rosenzweig wrote:
>> >> +	if (ep == APPLE_RTKIT_EP_OSLOG) {
>> >> +		buffer->size = FIELD_GET(APPLE_RTKIT_OSLOG_SIZE, msg);
>> >> +		buffer->iova = FIELD_GET(APPLE_RTKIT_OSLOG_IOVA, msg) << 12;
>> >> +	} else {
>> >> +		buffer->size = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg) << 12;
>> >> +		buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
>> >> +	}
>> >
>> > The shifts are suspiciously asymmetric. Are we really sure this is
>> > correct? My guess is that both size & iova for both oslog & buffer need
>> > to be page-aligned, so all 4 lines should be shifted, and the bit
>> > offsets should be adjusted in turn, and the lower 12-bits in oslog_size
>> > and buffer_iova are reserved. But that's just a guess.
>> >
>> > Anyway if this logic is really what we want it deserves a comment
>> > because it looks like a typo.
>> 
>> That guess can't be true for syslog since there's no change in behavior here
>> and the syslog endpoint has been working fine so far. This common code is
>> also used for other endpoints that request buffers and there haven't been
>> any issues there either. The size is just passed in "number of 4k chunks"
>> and the IOVA needs no additional fixups.
>> 
>> 
>> The entire reason for this commit is because this common logic just didn't
>> work for oslog. Our u-boot fork uses the same logic as used here [1]. We're stealing
>> a chunk of MTP's SRAM to make hand-off to Linux easier there. If either size or
>> IOVA was off by a factor 0x4000 this would've never worked in the first
>> place.
>
> I'm not suggesting things are off by a factor of 4k. Rather I'm
> questioning what the behaviour is when we're not 4k aligned. (I.e.
> the syslog or oslog buffer does not both start and end at 4k
> boundaries.)
>
> If we're aligned, all our bottom bits are 0, and hypothetically we're
> putting 0 into "reserved-must be zero" bits.
>
> I guess it's inconsequential if everything is 4k aligned in practice.
> But .. is it? I don't know.


For the common buffers at least we sometimes _get_ the address from the
co-processor when it e.g. points to its internal SRAM. We could access any
buffer aligned to a 4 byte boundary in that case because it's just MMIO
access then and I'm not even sure how strongly the buffer passed to us will be aligned.
I'd rather not zero out bits there because we just cannot be sure those really
are reserved.
If the co-processor only asks for a buffer we'll grab it using dma_alloc_coherent
and it's going to be aligned anyway then.


For oslog there aren't even any "reserved lower bits" in the message. It really
expects the down-shifted address on the wire starting at bit 0.



Sven


