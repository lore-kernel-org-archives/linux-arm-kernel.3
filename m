Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C8ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tevLS1YEVLhzj9dfTyQDjMvXZjqzh6tuEAY2qUJdPv4=; b=irjRdFY7O8cfdwPyg3LJutNRPV
	MMb68AG02CRAgbT5j2fi0xG+9vYk+QXGo1oGW1k6lrYlnQStnBYtG1rWYX+KbIS99MhVggJfd8YOh
	DAIYct8AKcuZlgYxzPUclxwPQqHZc7jxIwXi2aEz+yF3lIDZccRJPwZzg8P8AU1aH0e6fJ//KkVMD
	A7WybcBW7h+g1S6eucLveZol3STjdZIWr7OVhJsCE4UK3Sd0ovo2AQ5AFRE7jHgJHi7KDYQxVs4Lg
	onotcyguGgf36OcdkhrPLUNRY7ziYmp0/L9ckZNUwOD0GcCXFIaXkV80Fvr8tBaYBO2C4CCi4mocK
	AGuEqlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Y7-00000001lRD-0fqs;
	Tue, 07 Oct 2025 10:04:03 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Y4-00000001lPZ-2gMc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:04:02 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17C59140032F;
	Tue,  7 Oct 2025 06:03:59 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 07 Oct 2025 06:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759831439;
	 x=1759917839; bh=tevLS1YEVLhzj9dfTyQDjMvXZjqzh6tuEAY2qUJdPv4=; b=
	hYTmtSydKG9oPRfnCYKeZMB6gO9WimOjQqYj43y6uReWlAGrTS+mIJ2O/h+qzQ+G
	7j9oWwx1RizoTZdsCfehKxRh8AoogNricEQDeIkY5996/TEu1Liv2fxHrmuL48sb
	ijyUULwC65IXGp51z04uZogXukXhBpiHDKzM8HXkqkrEg40DZCaM4DqPOvNLiy2H
	xOQLgEF4te25jxqIBncmTEXMJx1bVpYE+wcarmJvckw3cCEwaXNceTMwJGF3ANoF
	OLd1Ir5hWS7U+W1piJHKoo8Y9ZIKglrAGc9dmDypEOy47AxJqGmt9mM8+anfSJeR
	h0nj0v8i0BUvzV6jaVE5hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759831439; x=
	1759917839; bh=tevLS1YEVLhzj9dfTyQDjMvXZjqzh6tuEAY2qUJdPv4=; b=q
	NNEWXbbtvojh2EjcUveN0Pp79hPHUbwVnMY/t/eOYsQJ2RYHQhTtdUEuRW9Iai7o
	VR7Um1o6PH00eNaA2FMxKBbweFnS/YdLnO0Aj+ZoEiMxUyzh37UraoOBN72SNVZh
	19kGquRVTIgoS8xbmr2nJ31nWmfNVzS8kb+jE3EpFo39S+y3LNtIypy6NwPUYdpK
	q0PQm79soeE7wSqSrCYeyZwSSu26oS9sGrXBBgi6UaNf2KQCXkV5avInwa283yxO
	i2u0PhjOy9cNRkJHfEnvVRX4StIcgW4TaXC45K8rQ0oqGaMdn2qp0bSa7D1T19wa
	2kHohQTAa+c1/gj3aOGVQ==
X-ME-Sender: <xms:juXkaNQl2VChS8VgVUTbmeeVE5BlNC1PTPwJg_G9IFbLI0VEsgsGvQ>
    <xme:juXkaBlncBfMe1EM9l3okV5oKPT6AkbX_6RBrIfzX6JNyAMWtBiojsDH7f9Ug9bQh
    rER_IIUaNL6oVQglgr0EEGnp1ZrgeOs2dwftz0Uiwyakqeqy8PU3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutddtudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopeifsedufihtrdgvuhdprhgtphhtthhopegtrghtrghlihhnrdhmrg
    hrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlih
    hnuhigqdgrphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:juXkaJLBAfaTsVP6DfGIWR2H62aKN9OhGgV5wW9B-hbApI7DCXDM3Q>
    <xmx:juXkaNRoP4zWrJXpVT1uZiXbEvnFfqEVeL3u05oyBHdxJBbZON8wsw>
    <xmx:juXkaBMoN_Q1MqQMlkzQsY8yV9rWK70KtSXO8uCiI9zbeQwZuDPXfA>
    <xmx:juXkaKWga0e4oEQke5h0TnUxuDmN8uDXPcPX_qIMdLb3zMX-DFmQdw>
    <xmx:j-XkaHDaLY0T-iizkHCf0y8cj5SyWzawl5k0QvFI6iADNpvFlmPlf6r4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A19B0700063; Tue,  7 Oct 2025 06:03:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AQeYErt0RC5c
Date: Tue, 07 Oct 2025 12:03:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "Willy Tarreau" <w@1wt.eu>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, shuah <shuah@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-api@vger.kernel.org
Message-Id: <b554958d-1f38-4d61-8378-ce784c2bb188@app.fastmail.com>
In-Reply-To: <a5b8344e-8214-4946-8344-f34e969d30b2@t-8ch.de>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
 <20250821-nolibc-enosys-v1-1-4b63f2caaa89@weissschuh.net>
 <cec27d94-c99d-4c57-9a12-275ea663dda8@app.fastmail.com>
 <a5b8344e-8214-4946-8344-f34e969d30b2@t-8ch.de>
Subject: Re: [PATCH 1/7] tools/nolibc: remove __nolibc_enosys() fallback from
 time64-related functions
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_030401_228288_320266B5 
X-CRM114-Status: GOOD (  23.89  )
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

On Mon, Oct 6, 2025, at 22:14, Thomas Wei=C3=9Fschuh wrote:
> On 2025-10-01 09:43:37+0200, Arnd Bergmann wrote:
>> On Thu, Aug 21, 2025, at 17:40, Thomas Wei=C3=9Fschuh wrote:
>>  - the old types are often too short, both for the y2038
>>    overflow and for the file system types.
>
> So far this was not something we actively tried to support,
> especially with the restriction mentioned below.
>
>> I suspect the problem is that the kernel's uapi/linux/time.h
>> still defines the old types as the default, and nolibc
>> historically just picks it up from there.
>
> So far we have tried to keep nolibc compatible with the kernel UAPI wh=
en
> included in any order. This forced us to use 'struct timespec' from
> uapi/linux/time.h. With the upcoming implementation of signals in noli=
bc
> this guideline is relaxed a bit, so we should be able to use our own
> always-64-bit 'struct timespec'.

You can probably either "#define timespec __kernel_timespec" or
"#define __kernel_timespec timespec" before including
linux/time_types.h.

Note that there is no time64 variant of "struct timeval", so
any syscall that needs this has to be implemented in userspace
as a wrapper around the timespec based one, e.g. gettimeofday()
needs to call clock_gettime() on all 32-bit systems.

>> We should also consider drop the
>> legacy type definitions from uapi/linux/time.h and
>> require each libc to define their own.
>
> Can we even just drop them? Or should they also get some backwards
> compat guards?

This is the big question, and we kind of left this one open
to be decided later when we finished the actual binary interface.

I think simply dropping the old definition is one of several
options we have, because that does not change the ABI in an
incompatible way and just requires the few user space sources
that use this to either require old kernel headers or make
simple source-level changes that they should have done for
portability anyway.

I see multiple decisions we have to make in that option space
once we decide to do anything:

- do we change the headers for both 32-bit and 64-bit userspace
  for consistency, or only for 32-bit userspace to limit
  the impact to those users that care about 32-bit?

- do we remove only the type definitions (timespec, timeval,
  itimerspec, itimerval, timex) or also the syscall macros
  for the time32 syscalls using them?

- What method (if any) would be used to choose between the
  time32 definitions, the time64 definitions or none of them
  when including the kernel headers?

      Arnd

