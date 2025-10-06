Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B647CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 20:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCcRyy1Yu7zNISo667mzGuEp4lMQK8XsTkEal2tO1Ts=; b=XRoA5T0SgHadRKA08n/QbG3II4
	zblwnfGdy70/hafzy4vOE1pEp8Z1odc/B4sxmxyGP09e4OtB8BJeblko1y+LRRZzpurjUTiBoszbW
	iZlAGs8mclmdhkYRSmZPViNAAoVYAly78z8frV2+239FiyUnFzNIWdNaJtXU9EjDh5GcYesahoZd7
	wJ8gLOem0F1fUXPosvBqmyO/+WWzitw2YUkyTFJRRoOEi31Vh+hJ9ffC564mysv1B5pzi1clmikFP
	kDtJMB1U1REEeCEvnXR+rOg3YKKUWmqB82I8eNyNMFilH8s56gPAEAswr8wqT6tDTO3T4AARPS68B
	op6HyadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rbP-00000000iZg-3SIo;
	Mon, 06 Oct 2025 20:14:35 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5rbN-00000000iZL-0Zna
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 20:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1759781667;
	bh=F5heTDPpPUVfFqxG9wFJpQt7FRekFZPQJlePM3gnxM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5in1Zd8DM9zu63rG4XY1fj3D4E6ogskNSKalmeS+IYtBLIroj27+jpxHsvFB0n1G
	 GBiEn/C5awdao2/uOFQK8Uxaf9FQoxd9AGQDfifeDzBfwGH+IPUpQNhwxW4Eq8dcxa
	 aW4iEVbog+p58dSYFueEruX6Z39fAZc6ChEzSmvM=
Date: Mon, 6 Oct 2025 22:14:26 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, shuah <shuah@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/7] tools/nolibc: remove __nolibc_enosys() fallback from
 time64-related functions
Message-ID: <a5b8344e-8214-4946-8344-f34e969d30b2@t-8ch.de>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
 <20250821-nolibc-enosys-v1-1-4b63f2caaa89@weissschuh.net>
 <cec27d94-c99d-4c57-9a12-275ea663dda8@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cec27d94-c99d-4c57-9a12-275ea663dda8@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_131433_344664_42725234 
X-CRM114-Status: GOOD (  26.32  )
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

Hi Arnd,

On 2025-10-01 09:43:37+0200, Arnd Bergmann wrote:
> On Thu, Aug 21, 2025, at 17:40, Thomas Weißschuh wrote:
> > These fallbacks where added when no explicit fallbacks for time64 was
> > implemented. Now that these fallbacks are in place, the additional
> > fallback to __nolibc_enosys() is superfluous.
> >
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> I just saw these fly by as they made it into mainline and
> I noticed that there is still something wrong here:
> 
> > @@ -39,10 +39,8 @@ int sys_poll(struct pollfd *fds, int nfds, int 
> > timeout)
> >  		t.tv_nsec = (timeout % 1000) * 1000000;
> >  	}
> >  	return my_syscall5(__NR_ppoll_time64, fds, nfds, (timeout >= 0) ? &t 
> > : NULL, NULL, 0);
> > -#elif defined(__NR_poll)
> > -	return my_syscall3(__NR_poll, fds, nfds, timeout);
> >  #else
> > -	return __nolibc_enosys(__func__, fds, nfds, timeout);
> > +	return my_syscall3(__NR_poll, fds, nfds, timeout);
> >  #endif
> >  }
> 
> The change is fine, as there is always at least one of the
> time64 or the old syscalls implemented, for any of the affected
> calls.
> 
> However, the problem here is the default to the old time
> types on 32-bit targets, for two reasons:
> 
>  - this fails when turning off CONFIG_COMPAT_32BIT_TIME

Good point.

>  - the old types are often too short, both for the y2038
>    overflow and for the file system types.

So far this was not something we actively tried to support,
especially with the restriction mentioned below.

> I suspect the problem is that the kernel's uapi/linux/time.h
> still defines the old types as the default, and nolibc
> historically just picks it up from there.

So far we have tried to keep nolibc compatible with the kernel UAPI when
included in any order. This forced us to use 'struct timespec' from
uapi/linux/time.h. With the upcoming implementation of signals in nolibc
this guideline is relaxed a bit, so we should be able to use our own
always-64-bit 'struct timespec'.

> The proper solution I think would be to do the same thing
> that klibc has and use sane defaults for all the types
> along with the modern syscalls. At least __kernel_time_t,
> __kernel_timespec, __kernel_ino_t, __kernel_loff_t and
> probably a few more.

Thanks for the pointers and ack to all of them.
I'll take a look at those.

> We should also consider drop the
> legacy type definitions from uapi/linux/time.h and
> require each libc to define their own.

Can we even just drop them? Or should they also get some backwards
compat guards?


Thomas

