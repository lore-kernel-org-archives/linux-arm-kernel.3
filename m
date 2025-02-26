Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A012C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iYy0IpLCeQb1PHojS9KoM42iYxcOqMQsa9CMfL/p/c=; b=Dw1jCk3+MuSazB8eTf1uZmL3d7
	cD52VxCWjw4n/XxiotxC9TvqX16SQYkYuu8Q/tCRMqY16MJmtK0v2zYpXqF5M6fjMOESU6ybaA9WF
	YCKjnQR9FZhz1KNSqSoQPJ0EABAn4bXfgooWtNC4A2NOfyb1z200lCweTlcegByxvB6scCcP2CwZG
	baumwJ3D8LimTo0kmblgIE75og2uS11dXObBElr5kgW+N5oXM2LnFtdKzWoYaZPqcoEXTiNjLCQl2
	cg3RomoUGJFA7V24q2owmsRGi83gsvUeSyqlGoeq9PbIgzI7+ngb1IrYU38uNaIpabGip+bbZu4iL
	mW4IuQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKm3-00000004cS7-18lT;
	Wed, 26 Feb 2025 17:00:43 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKdg-00000004anG-11IV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:52:05 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AE8FB1140094;
	Wed, 26 Feb 2025 11:52:02 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Wed, 26 Feb 2025 11:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740588722; x=1740675122; bh=5iYy0IpLCeQb1PHojS9KoM42iYxcOqMQ
	sa9CMfL/p/c=; b=g4ieDrVv/phXnemR3ZsNThAk6E6AZbzLbXJAMV8sJ8sYq63f
	C9l1L+KTzRWxZCTuoBAsnCkGKNjKdkaiXGvcW8V1yzw2JaeSBvPwfp1WnpQ00Aut
	XcKK3uF858Mr3vwuu1sx1GEzscaCN4U1QoMUj9ardGnUJzM31t9wa155iHJjauzl
	27yl0jUZlnvRVIhJctmudrk2Y5FMOKZtgZ+8hxkQieIA7iKojT7IvwZGhDh9BKQW
	zwOYVE9KoMX6Jg9URnZ7mXjzGkkSh19GhNxEeeNDI/cuNB+LrVgNTaOb1AG87X53
	JLZMWsIUc/sPraV1lRNGXYEzEmIzeNczIwPR6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740588722; x=
	1740675122; bh=5iYy0IpLCeQb1PHojS9KoM42iYxcOqMQsa9CMfL/p/c=; b=K
	BJbDOIZUmLK+w/0hXVbFDRphkfhDphV97il3nzweFbcxWAJEFDjU8Gqw2nFoBi0b
	o6Av1GVysfMFWCuefVHOy+gjv9lAQGNwlHZ0cgGATLitdagCdzxv2o1zwgQGJdjg
	OD4wZtqAUwI0OryKx/TDwrj2ZEcxKcvYD51ObUDPBMfg0lxVmDGnY2jp5KaHdKeA
	hBzMHJRB9DH4vtbWij9TnQXMWtJCX9Br5OAGPf5mtX5CSUfB6ZGe4P1xmWJhS/sl
	x2BPoNXdVQzAtxeoz9W6CqFswHcsAkNrKs56A8qeteHgSazbV/0EuaBLo6cJw6XP
	QdosrjWtjktUSlZafCg8g==
X-ME-Sender: <xms:sUa_Z4RY0KqV2cDjzbFvyZ_o0xAouYiCysSFrkIj_2NPaFiyWR1bnw>
    <xme:sUa_Z1xk4kM9Jj9iW699vYSOR03jmfTc97a3GJ-ZLpZLijBgtf7SWtgsdLNy-7kPG
    4x63_D32yAYzy662hI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekheduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeegheduteffteeguefgteeugeffvdejgefg
    gfegkedthffgudfhudduieelkeekkeenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghn
    sehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehlihhn
    uhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprh
    gtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohep
    mhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprghlhihsshgrsehrohhsvg
    hniiifvghighdrihhopdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:sUa_Z127v5F1-tpz_DKAqecbUd9oZRtYLG4AJuxaWLIRoiaKOxaQFw>
    <xmx:sUa_Z8DAl_UAdWwb2mIcj2iO8LqEc9RuvyJNj4d3i5B61o1RAhZqbA>
    <xmx:sUa_ZxhWDVY2g5KByIq7c4dKW-uOc4w_ezxWdLEWpL8rw5rn2qKbRA>
    <xmx:sUa_Z4rUDU6lA7RnFBhp6lG2kcbfeKFv3TrbtaM0DkoeIeQnC8V-nA>
    <xmx:ska_Z_ZVP3Lm1_PJXM5UDde9viUfhnDEgXIdFDIYe7jvGiWoPzm8HmU9>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CA904BA006F; Wed, 26 Feb 2025 11:52:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 17:51:40 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Cc: "Janne Grunau" <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Hector Martin" <marcan@marcan.st>
Message-Id: <63c5cbfe-4751-4409-9be7-2fda21b09503@app.fastmail.com>
In-Reply-To: <Z7y14Q3ifu7U1tHI@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-2-1a3af494a48a@svenpeter.dev>
 <Z7y14Q3ifu7U1tHI@blossom>
Subject: Re: [PATCH 2/4] soc: apple: rtkit: Implement OSLog buffers properly
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_085204_529657_D140B34D 
X-CRM114-Status: GOOD (  14.58  )
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



On Mon, Feb 24, 2025, at 19:09, Alyssa Rosenzweig wrote:
>> +	if (ep == APPLE_RTKIT_EP_OSLOG) {
>> +		buffer->size = FIELD_GET(APPLE_RTKIT_OSLOG_SIZE, msg);
>> +		buffer->iova = FIELD_GET(APPLE_RTKIT_OSLOG_IOVA, msg) << 12;
>> +	} else {
>> +		buffer->size = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_SIZE, msg) << 12;
>> +		buffer->iova = FIELD_GET(APPLE_RTKIT_BUFFER_REQUEST_IOVA, msg);
>> +	}
>
> The shifts are suspiciously asymmetric. Are we really sure this is
> correct? My guess is that both size & iova for both oslog & buffer need
> to be page-aligned, so all 4 lines should be shifted, and the bit
> offsets should be adjusted in turn, and the lower 12-bits in oslog_size
> and buffer_iova are reserved. But that's just a guess.
>
> Anyway if this logic is really what we want it deserves a comment
> because it looks like a typo.

That guess can't be true for syslog since there's no change in behavior here
and the syslog endpoint has been working fine so far. This common code is
also used for other endpoints that request buffers and there haven't been
any issues there either. The size is just passed in "number of 4k chunks"
and the IOVA needs no additional fixups.


The entire reason for this commit is because this common logic just didn't
work for oslog. Our u-boot fork uses the same logic as used here [1]. We're stealing
a chunk of MTP's SRAM to make hand-off to Linux easier there. If either size or
IOVA was off by a factor 0x4000 this would've never worked in the first
place.

I'll add a comment that this is really what we want even though it looks odd.


Sven


[1] https://github.com/AsahiLinux/u-boot/blob/582f851413c3fd1fcd60d701ed54fff2e840b9cf/arch/arm/mach-apple/rtkit.c#L144


