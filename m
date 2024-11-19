Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16445D60074
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ut9J7dfNWbIAZvs1QiNuTESwaFmTM/irq+5AWRZgbAY=; b=md8iAdqp2Pov8CpsgI7V06jpIs
	7tKYoZ60Qdyk1sj4loI6LKSlNwYJHFhf9JMDqIqs2BhAQJu8P5hTjtrS10jf3iLvRO/jAlfqQzV9e
	YVV42eUWk3Nd0KX002XD1crN4OH2nwnuL9yri6X4f8FvNcjHCiB/xeEIVdG0o8ZPBsEbsfcp139ST
	FNd399bKLlnnhsHW8S16InX0Tt7fkR8+LPfhAYl318Fqf9NV5PDMIC+gyOGTFNhQmPhJjvVEutgBU
	0ms8CjVjb0xrXk2uRODoSP8HrQSOCbuaveIVuILyFKhh3ZWgzsoHIn/9sIP5lfnW10GWbdtA2EicK
	TIdxa0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDK6h-0000000BpGK-1lzw;
	Tue, 19 Nov 2024 09:01:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDK5g-0000000Bp4U-0FMO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:00:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21EDEA42772
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 08:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EC0C4CECF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732006806;
	bh=s8xwzMSQqRRhgWbEzyj1PJULHTCex8PmVGVdqmaYwow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GlziSZGmgL17KEpUWxgzaWOsXBlCH5SlK3CTGZSKb3Kjzg46uJCRjm55rJ5VEKQgX
	 RazWTGA7VUdOd0vadOXm/Ei4Npvau9DSDhZBxgdhcsTEFLqwUSto2eS6g84Kksg8Yf
	 ud9m/WvWYQEu8/yjHjxlYLvAO3qkruoPRf9PbcYkd19M0wRaag7acSN+i8eMkSyOy7
	 3Vm1PyCJE9iHlAr761csU/bDq2lB/s20SLZaAfOcioYyigqdG4wX8ti2HFKy9y2tx0
	 ZPuMpYMyj85QId7YFztdUxnRwiIeYe8nfTuFcnW6ZPUz5ESS7rSRd/iWkIfUjW67Wq
	 gH3SFim+Vt1/Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a007743e7so4465918e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 01:00:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXR45RfsUjkhb26/8q66Ld0ejdq/oWrCqQ+uAUh6NX0041/pJRsBM5iSCcQ3sEa8Waft2Qo/GOZaUl5Ks86I/Jh@lists.infradead.org
X-Gm-Message-State: AOJu0YwPJjzKwLjurhUixSVHxuXG9zWOjEbc8S3751BzeCF18MWAskkD
	bpeoJTBSw0m3NJf0erHoLrgj+NdTBGWAWigVnhQZ3gopBKcMMZV/VYs9jCumuCYvCZNlhFkizjZ
	BYHV/RmoKGaCnYFhHqieNeDmF6gI=
X-Google-Smtp-Source: AGHT+IGB5F8WlM471SFc1V5UKClWXgSP36FaXp9LSspKRLXsBt4jIufb/Zaq1Z6bYkALOF5/F3wzsN456cYehpKsaQs=
X-Received: by 2002:a05:6512:31ca:b0:539:fb30:1f75 with SMTP id
 2adb3069b0e04-53dab2a659dmr6164698e87.24.1732006804616; Tue, 19 Nov 2024
 01:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20241117002244.105200-1-ebiggers@kernel.org>
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 19 Nov 2024 09:59:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
Message-ID: <CAMj1kXFA15AuT5wd0vMJ3X94uysvnGLy42FAQt8fxJsW31UdAg@mail.gmail.com>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_010008_248964_4CDAD750 
X-CRM114-Status: GOOD (  16.63  )
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

On Sun, 17 Nov 2024 at 01:23, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This patchset is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v1
>
> This patchset updates the kernel's CRC-T10DIF library functions to be
> directly optimized for x86, arm, arm64, and powerpc without taking an
> unnecessary and inefficient detour through the crypto API.  It follows
> the same approach that I'm taking for CRC32 in the patchset
> https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org
>
> This patchset also adds a CRC KUnit test suite that covers multiple CRC
> variants, and deletes some older ad-hoc tests that are obsoleted by it.
>
> This patchset has several dependencies including my CRC32 patchset and
> patches queued in several trees for 6.13.  It can be retrieved from git
> using the command given above.  This is targeting 6.14.
>
> Eric Biggers (11):
>   lib/crc-t10dif: stop wrapping the crypto API
>   lib/crc-t10dif: add support for arch overrides
>   crypto: crct10dif - expose arch-optimized lib function
>   x86/crc-t10dif: expose CRC-T10DIF function through lib
>   arm/crc-t10dif: expose CRC-T10DIF function through lib
>   arm64/crc-t10dif: expose CRC-T10DIF function through lib
>   powerpc/crc-t10dif: expose CRC-T10DIF function through lib
>   lib/crc_kunit.c: add KUnit test suite for CRC library functions
>   lib/crc32test: delete obsolete crc32test.c
>   powerpc/crc: delete obsolete crc-vpmsum_test.c
>   MAINTAINERS: add entry for CRC library
>

Nice work. The shash API glue was particularly nasty, so good riddance.

For the series,

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

Happy to take a R: or M: as well, if you need the help.

