Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82572C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCwEnHmZYStesPLVZzhLCy/SlMOkoHP6UZc4smqj+Is=; b=FzzCsJyCpTvYkCJtSVWFeME9RS
	+X8cWvtNh2naP5n3GiVrosV/KaGxpJ+/YkVTu8w28AwqJvjvc4HZrnWPiVp28ejNbE1vj+SNOuoug
	ZSIkbHZp+l+I+MqW/XPMo0ARX3SgvsX5Om0APF6+nbxKoOPeBMpNmwSzy2sRtCMXQA1MVPm72jUjH
	QTCxrMpebGMLmT23Xv6QjjpSzX049iY3IMo65SWCFyk0fj825UHYFV7IEeI7bqcFhLklPXuDSgsAF
	GfYL8n6axzsDx+MLN3k61oUZC5KoYEeBX41/PMMbZ/eRdQawGUhg0an/EYGUTR6CHGlurBiMgUDt0
	KJPWJ9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0UI-00000006D7N-3n9H;
	Thu, 06 Feb 2025 11:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfza6-000000062LX-3rEC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UCwEnHmZYStesPLVZzhLCy/SlMOkoHP6UZc4smqj+Is=; b=dl/TKL4/B76wg//y47dlW6Msmm
	lkCWDXmIJLiKeh3M+wKr2ByWGbhCusVlcmHUpsPse5LzKZh/udDWfzwzV7lstYPKoGuXO3kVqaAUc
	YKEN2tYt6n47wmBW2lWJxBFr6P1DnKP9T8+A9lfM7c9Wc0OQICPXUpWNvb72YDsu8GjdZIrDJ10IU
	bQyeDnYVNdJxb4e2CzgtZYy6h5lDfoViK9/rtvfKb2bEZ1j+DQNuUTqnDHKCtGeiOyJgGwXTPXseS
	9mWUlB35FHr/IdP/1/3/h7+27X23xpTRIQTk5n96hOPoEeuLaf0DWB48OkWOB925HYinJrBSw7aCO
	yKfWj/YA==;
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfza3-0000000Gv1l-41eC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:58:01 +0000
Received: by mail-ed1-x544.google.com with SMTP id 4fb4d7f45d1cf-5dce1d61b44so1488263a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839478; x=1739444278; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UCwEnHmZYStesPLVZzhLCy/SlMOkoHP6UZc4smqj+Is=;
        b=KNJ3GOhvdFqEEU9Ud4OGvQlOI4YpxRBYeEkxMh1gHTGPgaSxZXLB4XvtYInmRQnxvg
         L86DBdYhKVPWnjt5NDlPUZ/flnx4PALGyH9yLgSdVuBdnF9IBUU4fE/9BXneqF164EyQ
         ognCyYDe52469H9/t58Zs3xShBiC12zuMF/xg6hVbk7xfd8qESjEdFh/9lXVoIut6EwA
         g0DqK4RO65vPd2ZULJxL0WEidkomE9NQNy/Jie/Jw7Fk1yUvP44nyRcpz3btkuTWNV00
         A4DqSqmgo6bvOEkaUMAs/gYoNBh8FTBcJtYAQDmbt9eJy9VrUgLj8YHJQG5aYmIoi9Uz
         MDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839478; x=1739444278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCwEnHmZYStesPLVZzhLCy/SlMOkoHP6UZc4smqj+Is=;
        b=GAwVCT75AItiCZP7iuWZp3cBgZBg457YEjxPKJbsHjvmhsyTE3eYRjKLUONiAeevAd
         YgqJgNhTKrtirVP/YZKRgvUCpzTfagaBs2ublpajiaxu5lOGboF3lJ7G+A5t06c+ghuE
         aXmlZszKItaZ8vALj5KiKe1Lteh1n7xwYR0N748/Og/osXL8TeXVKXATyF+rLP6WJge7
         r8GLMP1SbdR4tAI6DY7yF5lk7uCSlBj7tly3kX9HXpxuMUxYxuP5GUauTlPNiVLDXmbf
         A67LtBiJHjmVv2ho52iwUiwPEPYfWnM1VFT72eq0t9ZsgmD/1rwZ093kXa3h+7wEmhlJ
         f1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXceSUg0O3k6qhqOZaMKFr3xbda1/Q/zgP9a/wNGJo+kkbBouG4LnjCMH7UsoCwKhb/YhI7LVPhCRC53OMPq1Rk@lists.infradead.org
X-Gm-Message-State: AOJu0YwkKLZyr+4SD9sC8fvRlWGFodb5rHCZkdAm9cxmNQmsnGZcCa94
	uuER+LupSvrrN+nx3TOJa5R4N4koKtYqU7ql+dxckOS0rnkn9XUr8oxLXelvB8npei4mYytILP7
	/Stajc7QBncauwDNUbZQOJMvWmOk=
X-Gm-Gg: ASbGncud3kqbY+EFLApIi21IWQBxjiQ8Y3FjexgVS2ep91I/m4O1GNhRMWkVX5JBRZu
	iXjWqOC0kmlQfnYR6dXS7XMT0KNqoAm3ImIDqpDBYHM/PQ/6B9UTQDVTRZjksPzMDahEhnCoiba
	g=
X-Google-Smtp-Source: AGHT+IGP8tAW0CXvHNHg7p5sWcAX+S7UmNuU0OrOMLWbPyPHRVVI4cXsDxphL4+JA8N5RtUQ7mSHl6x3rrvdPIqiBpg=
X-Received: by 2002:a05:6402:27c6:b0:5da:a97:ad73 with SMTP id
 4fb4d7f45d1cf-5dcdb71bb7emr7512035a12.13.1738839477521; Thu, 06 Feb 2025
 02:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20250203214911.898276-1-ankur.a.arora@oracle.com>
In-Reply-To: <20250203214911.898276-1-ankur.a.arora@oracle.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 6 Feb 2025 11:57:21 +0100
X-Gm-Features: AWEUYZn3un_MskJWBGcJT6aFZUZFVS49qML1cEO5eTlJd56xDvMM1MKgwwStIVI
Message-ID: <CAP01T75B-UjoKugBsCHnfjwMmL5Bdfs+-YK3QH7mLUJs0+mmCA@mail.gmail.com>
Subject: Re: [PATCH 0/4] barrier: Introduce smp_cond_load_*_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org, 
	zhenglifeng1@huawei.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105800_189447_F1E81ADC 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, 3 Feb 2025 at 22:49, Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> Hi,
>
> This series adds waited variants of the smp_cond_load() primitives:
> smp_cond_load_relaxed_timewait(), and smp_cond_load_acquire_timewait().
>
> There are two known users for these interfaces:
>
>  - poll_idle() [1]
>  - resilient queued spinlocks [2]
>
> For both of these cases we want to wait on a condition but also want
> to terminate the wait at some point.
>
> Now, in theory, that can be worked around by making the time check a
> part of the conditional expression provided to smp_cond_load_*():
>
>    smp_cond_load_relaxed(&cvar, !VAL || time_check());
>
> That approach, however, runs into two problems:
>
>   - smp_cond_load_*() only allow waiting on a condition: this might
>     be okay when we are synchronously spin-waiting on the condition,
>     but not on architectures where are actually waiting for a store
>     to a cacheline.
>
>   - this semantic problem becomes a real problem on arm64 if the
>     event-stream is disabled. That means that there will be no
>     asynchronous event (the event-stream) that periodically wakes
>     the waiter, which might lead to an interminable wait if VAL is
>     never written to.
>
> This series extends the smp_cond_load_*() interfaces by adding two
> arguments: a time-check expression and its associated time limit.
> This is sufficient to allow for both a synchronously waited
> implementation (like the generic cpu_relax() based loop), or one
> where the CPU waits for a store to a cacheline with an out-of-band
> timer.
>
> Any comments appreciated!
>

Thanks for splitting this and sending it out.
+cc bpf@ for visibility (please keep it in cc for subsequent versions).

>
>  [...]

