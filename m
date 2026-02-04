Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB64E8B385
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 00:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B7LEzFbT6KtS/eGZF26PxctL67vrgylUX7HQbWrfj0=; b=XSCMtrewIwbyhU4ubHo2GQROck
	l1NeSxJvxIuO5kkiEN9UMItwfRevsK76wlQRcNcplEe4cSffBxQj5NzrHr9c10o7bhU1ZokYH3S5j
	GktEKkgtHvhIBpatKXgCK5RbSIvxoQb5o7I4mqcR5xUSotxrocrEZv/3mdoehnP8gBnKxGoUmCMHh
	cNkvDv3IEKPntd9pqSwhpAzH+zqF3dja5nW8G6aA4s9KgNCIh2r2nFBhlJXIf0kLEw8oZ00u38X1C
	2H6atkYWnkD6Vm+NkcGPTzrZxhfO1MwFq6T9uyuAoU46V4khR8XSRZeeeXNciwMESyLF3s7WtFrTH
	/pSpuZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQTP-00000007c5t-1931;
	Wed, 04 Feb 2026 00:10:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnQTG-00000007c5a-3XOY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 00:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E4EF56013A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 00:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA1DC116D0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 00:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770163813;
	bh=09clEcawHkNfyp7ZMAhgORt18mzDuzsUGyciBe/dhKk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UwoKY34vmvoNNoxgZqa6MNxQLprvYduBWvBRqObyhrrELswQ4ybNwHPO1GTbwxzX3
	 +iEV7bvNdvucd25O4ZMCfWWJ2Gx/sxfnptH7ONli/MKjAV56Ln/421Y1xGPwTZynFd
	 iQh/o4XTAn09Af43BQyuzFXWtbzI+HIVVQP3yKVJ4tMsPjqgvYH9ZtEQ6B4eof60+1
	 KAJOEN38uEwt0i0u5h/GcvFDJtua8Xs7jLzz2aROy95GOCO9dFMN3B7g1ndGLODaIC
	 PWqPnf2WOCKiaP4Zj3xBLfU19TSmYki2juZWMoSsekjVIwgpJs2Y6+xFC+YnKEzpE4
	 jfHgVn5aFuqIQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-649523de91fso5726595d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 16:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkX7DydcSqo3WNzYDeOHGlwnFe4ndxmOuw+po8OnE4LNYucjGaJTTSqMqf1lagZruEOIlKmqIIWz1DCKM/WPxh@lists.infradead.org
X-Gm-Message-State: AOJu0YyLfUI18X0BiEWbjR1C7+DaU+6seywPY4cR1MLJiWXXydMdL7ac
	fWCOM93ljkaTMQjsnRdBOx9aJ/ljuWW3rW18GOzlLyw+AA6QArM45ulATQhKqSg+GZLkQPwXSaJ
	Ev3f6vLWzSP7G6U8ygJekJnJ0zDcOqZ0=
X-Received: by 2002:a53:cf4b:0:b0:649:b915:a050 with SMTP id
 956f58d0204a3-649db32a9b0mr955246d50.9.1770163812988; Tue, 03 Feb 2026
 16:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20260203161843.649417-1-wangyushan12@huawei.com> <20260203161843.649417-2-wangyushan12@huawei.com>
In-Reply-To: <20260203161843.649417-2-wangyushan12@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 01:10:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
X-Gm-Features: AZwV_QjvMWAiftJN6MLcoMpTXQm1LSYgxX_ibjpuO8tDCsBbv-OaJRt5BnOeM_g
Message-ID: <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Yushan Wang <wangyushan12@huawei.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, fustini@kernel.org, 
	Jonathan.Cameron@huawei.com, krzk@kernel.org, linus.walleij@linaro.org, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, fanghao11@huawei.com, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, wangzhou1@hisilicon.com, 
	xuwei5@hisilicon.com, linux-mm@vger.kernel.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Yushan,

thanks for your patch!

On Tue, Feb 3, 2026 at 5:18=E2=80=AFPM Yushan Wang <wangyushan12@huawei.com=
> wrote:
>
> The driver will create a file of `/dev/hisi_l3c` on init, mmap
> operations to it will allocate a memory region that is guaranteed to be
> placed in L3 cache.
>
> The driver also provides unmap() to deallocated the locked memory.
>
> The driver also provides an ioctl interface for user to get cache lock
> information, such as lock restrictions and locked sizes.
>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

The commit message does not say *why* you are doing this?

> +config HISI_SOC_L3C
> +       bool "HiSilicon L3 Cache device driver"
> +       depends on ACPI
> +       depends on ARM64 || COMPILE_TEST
> +       help
> +         This driver provides the functions to lock L3 cache entries fro=
m
> +         being evicted for better performance.

Here is the reason though.

Things like this need to be CC to linux-mm@vger.kernel.org.

I don't see why userspace would be so well informed as to make decisions
about what should be locked in the L3 cache and not?

I see the memory hierarchy as any other hardware: a resource that is
allocated and arbitrated by the kernel.

The MM subsytem knows which memory is most cache hot.
Especially when you use DAMON DAMOS, which has the sole
purpose of executing actions like that. Here is a good YouTube.
https://www.youtube.com/watch?v=3DxKJO4kLTHOI

Shouldn't the MM subsystem be in charge of determining, locking
down and freeing up hot regions in L3 cache?

This looks more like userspace is going to determine that but
how exactly? By running DAMON? Then it's better to keep the
whole mechanism in the kernel where it belongs and let the
MM subsystem adapt locked L3 cache to the usage patterns.

Yours,
Linus Walleij

