Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4312FE95371
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBA2o7+e47w3UjPHFsATFd2l83iI8gXmECb2djCkRuc=; b=cTCJz1UEzNMGALrJ8SBhGbh7fM
	MYrowssYd+geu+K7zMXLQPXVOVqYDCYOqdAHpRR1CMdC0xou/wIK/WmR2iNOTsc3viq4iJqBk4Sq0
	G4k88RPqb0viISom8T3JSdTWbnqZSrnfLnCAh0uOxfiY9nTglYoCXytVLjPy96pDpAWIzR0yAb23o
	X6uJ6oZ8AQU1HFoHdU54EvWew8lXNeNMiQFoVRRPsjfxK3oJpzlLYWPhSg0EzukPWTy4zBKER+zJH
	JkVf0Q6F6maOaGD6Fil4B2OR0rFtjf66Fdwg6IoSoknj5pP3gVLYmfIcBuXMArgOYJpstZNRxAuop
	SoTOU4wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZmh-00000008Gbu-2pZV;
	Wed, 04 Feb 2026 10:06:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnZmg-00000008Gbo-1FbZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F7E86012B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 10:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F05C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 10:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770199613;
	bh=KBA2o7+e47w3UjPHFsATFd2l83iI8gXmECb2djCkRuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m5xfKuJ3Pi+ev3Huoh6CB/JLzZcgHZ5HCF5BIWZ46e60KABFeTZFkUDOZf4bf7bXp
	 lTotmXJTRx0j6f4N12AOw1OPPw7ItlnDT4SBOeDqem1ay5DDXjlepqNxQkalqo088W
	 rLQzRoA7jD1sqHe4bw02aG39D1tNZpY5a902APjgPV237+BAQOSV/vLjkU+f3ySY8y
	 FvuE15fdWWgwJyulkSx7PHCdceycGk7A6Zqjwmjqpf9OPySs3obqLdfCIC1zs6Yo2J
	 hEVTo/9Y9ORGzsMwWs3hFNDAjIn3LzJs2FbdrJaafavl5sNHpZSd3CtpgpB0DQLnuz
	 cCLh3fRPfbLYA==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64969550a1aso6524593d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBqSHES/7zOxCXM001KnI1k1JDmT7+QHq38f3TkJr2LvX7Cn5kz+3vYI20l2NaYy/exWFhuz4IKsJkCXK8czEr@lists.infradead.org
X-Gm-Message-State: AOJu0YxBoE0CZ0icv5D2HDFVjr7bsxURbCO9EwVmnyiN//kpoU1okkJ7
	+5b0Ma9UWhvxJ85EeB69qlv98X5z6l3502Oiud66D+gPPF7eATl+MUO0bzYEnzg8Bd9dMsJ0Mqq
	Ex4GnPY/wxzy7VB2NQhb2IZczEySJa3I=
X-Received: by 2002:a05:690e:1911:b0:649:dbff:9380 with SMTP id
 956f58d0204a3-649dbff9742mr1895246d50.66.1770199612141; Wed, 04 Feb 2026
 02:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com> <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <cf0cc98b-75e0-40d9-93d4-dc2218a22d4d@huawei.com>
In-Reply-To: <cf0cc98b-75e0-40d9-93d4-dc2218a22d4d@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 11:06:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLnK-B=q7X6VyUZDQiO7bG+u0mpC_PzXqhtLvW9LYxEe7g@mail.gmail.com>
X-Gm-Features: AZwV_QisEY_9B_sKkTC0sBcVsIsjOeZTyUJLrpwZfj-V519b37LZ34b2vh36n7I
Message-ID: <CAD++jLnK-B=q7X6VyUZDQiO7bG+u0mpC_PzXqhtLvW9LYxEe7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: wangyushan <wangyushan12@huawei.com>
Cc: alexandre.belloni@bootlin.com, arnd@arndb.de, fustini@kernel.org, 
	Jonathan.Cameron@huawei.com, krzk@kernel.org, linus.walleij@linaro.org, 
	will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, fanghao11@huawei.com, liuyonglong@huawei.com, 
	prime.zeng@hisilicon.com, wangzhou1@hisilicon.com, xuwei5@hisilicon.com, 
	linux-mm@vger.kernel.org, SeongJae Park <sj@kernel.org>
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

On Wed, Feb 4, 2026 at 10:53=E2=80=AFAM wangyushan <wangyushan12@huawei.com=
> wrote:

> > I don't see why userspace would be so well informed as to make decision=
s
> > about what should be locked in the L3 cache and not?
>
> This question is actually: should it be kernel or user space
> application to decide if a cache lock should be applied?
>
> Maybe the ideal situation is that this capability should be reserved into=
 kernel
> space as a vendor specific optimization option. With the lack of knowledg=
e
> of memory interleave etc the best move of an application might be allocat=
e
> cache lock as much as possible.

If it is a vendor-specific optimization that has no generic applicability
outside of this specific system, dependent on a specific userspace
that only exist on this system, what is the value for the generic
kernel to carry and maintain this code?

In that case maybe the code should be maintained outside of the
mainline kernel tree.

What we want to see as maintainers are things that are reusable
across several systems.

Integrating this with DAMOS in a generic way is what will help the
next silicon that comes down the road.

I have already seen similar things from Fujitsu (IIRC). We need this
mechanism to be kernel-driven and generic, not custom and
system-specific, least of all driven from userspace by sysfs.

Yours,
Linus Walleij

