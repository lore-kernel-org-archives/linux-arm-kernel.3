Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DBAE95375
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=; b=gkYQK3BnLQwissPqcjgFYtq4m0
	qoZfQbXkv96QmAIK6vN46dvls6ZsU0r0vuZcBNlCbtQ9TdsJ3kjQbU1oLN1XAcg6dXrkRmtdYjmp+
	U14sYb29LcNot0zUwP8tAwvggslalAknens/82dE73+HEwxDm5IXfDmTloPlhAMxOWNpoaip9ltPS
	+hNqUJvhA1zc0ONld0ye++xzW13a0AqiiCIjtcZ14SsUb46D42JMS/GCehocjgsx6HYO+J1C48ugV
	5PIgjxLKXUsgLIaz+dNlupxZWxXl9SZ5xZ7oOUr8s6dfEpEBiB+1cdgmN+WwDf56u4oRJ/dMqpBeU
	3J7i5lzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaPD-00000008IzQ-38HW;
	Wed, 04 Feb 2026 10:46:43 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaPA-00000008Iyn-3itc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:46:42 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-124a677c9afso3925768c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201999; cv=none;
        d=google.com; s=arc-20240605;
        b=fn+VMei+fXXwlmE0KzYe3g6YVTWSDrci6G7bRhuYaBOFHFMO/7lig2TxRYp8uz4fHq
         cQT+Vuig0wRclmuWz8NIkSllm13STcx19d7hccoGzCCDbCSsyMj+2TdbpVwIhuCIqxCu
         8PxFsKymVIOFj37Rs3dS4ImNAbzjzHve7a+Vj4Zm8EbE/U4WSda+uc7Zs8K37YAi9RkG
         LAZ62s4PrE5z/Ws0Psf9YPSVRCrF5njC7EnnmkAYokh6pYWykeoENqDOi5+nCJ9Ob7gA
         A7aNMtD7dUa4CMZomsIfyFtB9ke7PGlX5t9oC2TvTLvRyrwD1t0S8Tmlu93SKs7jg3Qu
         01tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
        fh=z9hxUSSR7+ITjieiA8eXKubbhDT37aSSfvDcVC8gDPg=;
        b=hR2Z49Lisyv+N0rxttGhwat27DLvVBY4z7hp6gY3zmH2yCcYEf5NwBaZno4LyUXapX
         1y0kD1kD64aJ5VNTak0Op3oiG/xYfPv9K2SATqcMYriySPGCnOZqNeeYBoMd/YqjvW11
         XJ9NCPT8h9rqqd9/x7CwhTXw0SD8+W7eWyExT8/MROgYK3r628o1o0vJ5eu/aL7qUPq8
         MzVO093gffctRp6jNMss9FVTBa2A+8Y2SIbC9T+aWCB//JYlzqDbdBmnQaoQMdj9lQp7
         HSpeuWBZPMMLPsqyYZWkysBPw/++Y5MreSEPKgp4KCWxA3FFYEX4P6uY8dJJslh7Aj2m
         J6Uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770201999; x=1770806799; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
        b=q2lJYo6m4erCMhzi8w6/OnwBUCcHF3zRcf3akEDs3jlxHFsvGqYKC5jII78DOetvbz
         p6d5wDOcwzSYAS1eg9qK/1cMoY+UBtk+Wxae+w/AWJOrvBL7sMoRRwjQjJK+m4unVyQk
         7XKRKEpy5RCoddPDgShnXkVFQfM36nGWldRIoIP5zTI3ECo9wz0UEbHs75dorj3O0ddh
         rjLf8bXaTrkii96saatw5PftA9TJhJhuvNyOG17YDjpDBEm0ZjgkhfJahqq/5kldV4S3
         S2R+alFx+WOStPm1EZwahLwn4pN66ipc0VAeBjHnbtpqbHaRH/Rpo7pwNoYHobUi5GWI
         trMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201999; x=1770806799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY7fp7PgRMRvrZC+OlVEnEmguT5LKW9pH/1apzccJLU=;
        b=LHb+YYrtcdLRgWlkydCmOCq7nP8/NhtiE4J5ZUUePUNiwcfGoP39FrPY9z+p3radRO
         VDQypHIm/cLfc1lbNQyJdDS3jMRf5UQly642kIjjenufwJn4Z12mAnjmxC1e2v/bUyur
         mCJQVlpCzL+2U/JfdQB50+UJyz7Pj/p1Zfrnl0BbucpQ3sgSAwdvbj/krrQBBuIoVH5o
         xknwGAfXhadlv6iOXFjt/7QV5X4O9ej80r2jOpVT73LdBSSgh6tFpP+CIrar0l2gJMie
         M+hprxBwTNwZkZefp+5D0IKl30qYuOa/+oZc+hk33ivhM0ZPxzt1hCjQoXsD7upr/hvv
         29ng==
X-Forwarded-Encrypted: i=1; AJvYcCUBW80TXumAbFNOFDA0PnFFPLEEJKfj3DAfl/cMkfk7P7fRm0O54Bo2so99Xj+ClC5aKZU7By0e+wxWLsgyV+Pb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr+OrxBV6a4G49QAdyKb2nyUJs3kjtb0//9Uzp+Qk1JT47HSfn
	QpBS6N7WjE/JMcXx+I9T4HmS/z4lt0eOg99uxPU7whUcRSlnFEISQ879jUzSfUVpHYpcYeEnQFl
	RD14bS0Wp96rj/zxtCKFuMM3Oioxu7C1rbN4+9vLh
X-Gm-Gg: AZuq6aK7qWpgFh1re1QudVlwg+CNk2F6BpWIMa7AFmTl4Ws0X+kHR9OPpCEbHIRfwqT
	or+5XG/W68kUHDVtkOPpoJDpBS5h7bFnQm7VcT9z1ZaTqiO7daH1PKXYRO8wH6+/l39krDAJzzX
	oakoQuN15mtfGyD77GPABHcbw2qI0mtBEHNRRrU+HsaTcAZxaiKgewmCdRunNiJWVU4pO3CEem4
	VSC6G13T3NdLEcxqyCEu2M1YzByg0orTR0YF1KKeygD9KgwllMj5XpikGg7RaJ+WiMy6umGKD65
	yW7rp2DsPbPvOrmkNqmKBBdCxg==
X-Received: by 2002:a05:7022:eacf:b0:119:e55a:9bf5 with SMTP id
 a92af1059eb24-126f478dab9mr1212137c88.17.1770201998956; Wed, 04 Feb 2026
 02:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin> <aYHgNSF5a3F7UGU_@willie-the-truck>
In-Reply-To: <aYHgNSF5a3F7UGU_@willie-the-truck>
From: Marco Elver <elver@google.com>
Date: Wed, 4 Feb 2026 11:46:02 +0100
X-Gm-Features: AZwV_QgT8kiMwUIl_me4txlYVSU9o0fAA5wwpILgXvkftY8OJh5BYQhTCavfUPo
Message-ID: <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Will Deacon <will@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_024640_924516_6D557BB0 
X-CRM114-Status: GOOD (  15.19  )
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

On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
[...]
> > > What does GCC do with this? :/
> >
> > GCC currently doesn't see it, LTO is clang only.
>
> LTO is just one way that a compiler could end up breaking dependency
> chains, so I really want to maintain the option to enable this path for
> GCC in case we run into problems caused by other optimisations in future.

It will work for GCC, but only from GCC 11. Before that __auto_type
does not drop qualifiers:
https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)

So to summarize, all supported Clang versions deal with __auto_type
correctly for the fallback; GCC from version 11 does (kernel currently
supports GCC 8 and above). From GCC 14 and Clang 19 we have
__typeof_unqual__.

I really don't see another way forward; there's no other good way to
solve this issue. I would advise against pessimizing new compilers and
features because maybe one day we might still want to enable this
version of READ_ONCE() for GCC 8-10.

Should we one day choose to enable this READ_ONCE() version for GCC,
we will (a) either have bumped the minimum GCC version to 11+, or (b)
we can only do so from GCC 11. At this point GCC 11 was released 5
years ago!

