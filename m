Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EB2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sagFfB8etWtWcyIYJmDr4YdUwZeOCagtQBCzT2iAgEU=; b=Q/FWyiBIIz0ho4rbS4cnXJ9yvV
	2liIAZEjNrmtpIm0G95g7cNv9dsy40DVr5S4I2fQGTkzw5EJVFCrhP09Zvgu3dOvIVVr+PU8h+wjl
	kTRNUJBGTK1ojA0GVlIshakOxuM0Uw5OrkuRIMskH5T0WZ2KKfmlUwodd9SnyGxFlnIhnZ5Zm4KVx
	jS6Dx83qJKV3mX+AGTE2ldIle12irLDWMV1KzkJApXRFQL0wZJQlMbKGhzPjAJ40Ia+x/lSs0OfU0
	9FmGFICwkfMHqhJ9uQXk7v1QpGMIqLfOSxU6F0t4fiiOtS/1o51ZtmLVS8eRqrPg/03IOYd12faM3
	Hmxx3Nig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rVV-00000006w9A-29Py;
	Wed, 01 Oct 2025 07:44:13 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rVS-00000006w7i-1XGO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:44:11 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D6CF91400042;
	Wed,  1 Oct 2025 03:44:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 01 Oct 2025 03:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759304648;
	 x=1759391048; bh=sagFfB8etWtWcyIYJmDr4YdUwZeOCagtQBCzT2iAgEU=; b=
	2yJQLHZDNZsXBF9lD/7oBQhUCkBq1uHVWKyFgz/GlOk3JGMS3vKdIOqHR3dKdEsA
	D7K2khMcXkRPlSSSl0r5+XBWATlgpRAMXeEIaQVEInYlgYl3/6LU2kELN8n29ROq
	3G5kvRes0cyPDXxlJ1AReLvk/2sgwoknHSthIu9ZEwXRZVR8rYa/dPe1osnBRpGe
	cXjsUZ9AIiXhVUYJqB8znNgyIEF/2QCwbND4sRcv/pj4jKUBVfZThZncImSbD5Av
	n+3UyhmuG9nWsbdgrEaPPAYpK2PeowIXQFS0HyjC2QszOIdGv6RBtxSjVCWUcnM5
	Om5OTHSRYMH4eJ5FLLjtrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759304648; x=
	1759391048; bh=sagFfB8etWtWcyIYJmDr4YdUwZeOCagtQBCzT2iAgEU=; b=y
	tzwukjgLv55xRL35/gPXwAd8ovGvE0BJdpi4ocS8gSulQe+3vNiGLr8xd36kq0sj
	HazVs/6f4Fzsumrq1e4D4zQXh87KqXzkBTp0HAXJvoMtDf4Ee09PerQXkVtTPOhd
	j3kS6BNOMHgVpxYcQKqY4tleNtWZLJ3SyBopzviCZymBsmoGooKwzMitad1x1BGA
	MRW3wzv+3GRg3ZMUFhnrmI+bT/35zqItgVXhyvzcI/sD3x/nplR4RGblC+7S2JUb
	bCP3yNYCSUA2Kx5z7Bkygo2ShN4RTisJhbtaR4mpJ2fNxZCKbzwe+R72Dqte1eVP
	YZ0YS5jBhR73skTrqRt2g==
X-ME-Sender: <xms:yNvcaAkQiT0W4FWfWQPOdkLE2uxgga1Net3WFQydGZu33lf-CXpV1w>
    <xme:yNvcaKq9nsmw6vgwKzX6RQ4dlwEntBIGihOBVm8FYb2AVR7yS59u2eX-rU4AW6cHB
    kq9S4H5aFF8Y7-KV9J07PfccmWbTfAdlickHM2TxMbtjQVSNQwa4tE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekvdehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopeifsedufihtrdgvuhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugiesfigvihhsshhstghhuhhhrdhnvght
X-ME-Proxy: <xmx:yNvcaBnFZWf9lPl75QgGYQYeI79FANEE-P78Oy7yFlcHlDyEfRALEA>
    <xmx:yNvcaJZIQU4FNAIvJAoDzoRtSENz2UQLf3hFB3khCnwfTXpoycPLGA>
    <xmx:yNvcaMHk8GrCWy0KTxWoNhdb87gUFPbgKfy2RTzybnd6i66hMr1WPA>
    <xmx:yNvcaIbNd2ZNDTZqwh8wkoZeCtbGJUw1MRwukBEk05VKVeLi9CmXKQ>
    <xmx:yNvcaBZKFON6Jdupivinfex_YHfhm430aEx8pha-eUyfmefOqURhbTg9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1D053700065; Wed,  1 Oct 2025 03:44:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AQeYErt0RC5c
Date: Wed, 01 Oct 2025 09:43:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Willy Tarreau" <w@1wt.eu>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, shuah <shuah@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Message-Id: <cec27d94-c99d-4c57-9a12-275ea663dda8@app.fastmail.com>
In-Reply-To: <20250821-nolibc-enosys-v1-1-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
 <20250821-nolibc-enosys-v1-1-4b63f2caaa89@weissschuh.net>
Subject: Re: [PATCH 1/7] tools/nolibc: remove __nolibc_enosys() fallback from
 time64-related functions
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_004410_639642_A257C630 
X-CRM114-Status: GOOD (  17.67  )
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

On Thu, Aug 21, 2025, at 17:40, Thomas Wei=C3=9Fschuh wrote:
> These fallbacks where added when no explicit fallbacks for time64 was
> implemented. Now that these fallbacks are in place, the additional
> fallback to __nolibc_enosys() is superfluous.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Hi Thomas,

I just saw these fly by as they made it into mainline and
I noticed that there is still something wrong here:

> @@ -39,10 +39,8 @@ int sys_poll(struct pollfd *fds, int nfds, int=20
> timeout)
>  		t.tv_nsec =3D (timeout % 1000) * 1000000;
>  	}
>  	return my_syscall5(__NR_ppoll_time64, fds, nfds, (timeout >=3D 0) ? =
&t=20
> : NULL, NULL, 0);
> -#elif defined(__NR_poll)
> -	return my_syscall3(__NR_poll, fds, nfds, timeout);
>  #else
> -	return __nolibc_enosys(__func__, fds, nfds, timeout);
> +	return my_syscall3(__NR_poll, fds, nfds, timeout);
>  #endif
>  }

The change is fine, as there is always at least one of the
time64 or the old syscalls implemented, for any of the affected
calls.

However, the problem here is the default to the old time
types on 32-bit targets, for two reasons:

 - this fails when turning off CONFIG_COMPAT_32BIT_TIME
 - the old types are often too short, both for the y2038
   overflow and for the file system types.

I suspect the problem is that the kernel's uapi/linux/time.h
still defines the old types as the default, and nolibc
historically just picks it up from there.

The proper solution I think would be to do the same thing
that klibc has and use sane defaults for all the types
along with the modern syscalls. At least __kernel_time_t,
__kernel_timespec, __kernel_ino_t, __kernel_loff_t and
probably a few more. We should also consider drop the
legacy type definitions from uapi/linux/time.h and
require each libc to define their own.

      Arnd

