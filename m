Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46D0EB28D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sijXPfJFgYiHGlokq+9glTHvgeqjMbPNINHhr28TVcw=; b=4wj/I127v+Rsm0n446bzok8/9I
	rn/NAARdthLTcSS6Tio8YhE9d9Koh5A7NWX87wKcn0lfxivgnMa4f+NqD5STrGPKNspj0Ji13PLVX
	9rTW+ZPz6F50WRZyET+y1Jo76euIVo/Si/zCiOdjz1if8WJnQnBYZcN19MlnT8FbaBGS9gSuU9v0R
	jy7GbSfbvYxWpi8Fok7HI9kfvwCj2ZNscVgDjJ6X9kEU7yAtFHAqGMJkKBFzdJZfYHMw6/jhvjDYt
	rIydHtHHZGJxQkORoEeGnSXds0L1XbqY9o8nYX9beex/C1Tp/lwYx6ap6GlyzcnayUSnBUpe/OyXy
	HrIEUc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGqV-0000000B0yD-1Rpm;
	Fri, 06 Feb 2026 08:05:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voGqT-0000000B0xs-0Uja
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 08:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7695843F01
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 08:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AD4C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Feb 2026 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770365140;
	bh=VjA9WG5uIdaKDgvlAcdrZL7nBJ9K0TRfovG8Z290BLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W8D3SeP7WQz2mHdJSENw80KNduMie+qRQxcje+3tWGZ1MYVfh/Z87xBPyJktAyrXm
	 tBdWHY6AhdmLfZfnc/5Cf0TCK1hn3GbKadCRKLvQfov1EAmhbdUxESRXYTQhPywVfj
	 yhXrgEIsVxoLKBGbQXjo1Fy9jC3E35DbTgH42Xk9AoIA25AGYdIKMronZuMgezclB2
	 XAOkzNyaT8tdCV6JkNRzIwy3gci509yOXGH/RncBvf9GfEqu2Y5Pred5X/VmfzQnLS
	 rc8FaEjPbHqpI9/O2MwsoxxV95Sek+RRMsKoSrnmYDL3svGz1xkUrVZmfjJraLIjyY
	 sPwQHzu0qb/Cw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649d4690174so371070d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 00:05:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHF6rZ/wz0Yj8CZSw5Xi0/iCp975k97JlDGNQbBweEftHITstaD1BGzfaKPpex6wNaPhXrL/2qFSK3aWge401u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4CzA5KUolAcpy+4Cbp5CG0W2v2FS+7YCfF8gnwRXtni52JTCk
	Gs9GSXAIXKMa2g97WJUVK8UeTkBH1ExozTYM2T53I1cxc1+4kvgVpoT7687+p1hqzxFe2k5encg
	dMZxO0nuEiuU7TskhLoQH3CBrBaVfPeI=
X-Received: by 2002:a05:690e:e8b:b0:649:e94d:ea2f with SMTP id
 956f58d0204a3-649f1eb0c01mr1641003d50.39.1770365139557; Fri, 06 Feb 2026
 00:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20260203161843.649417-1-wangyushan12@huawei.com>
 <20260203161843.649417-2-wangyushan12@huawei.com> <CAD++jLn+TDfu-aQ+Kfm=unYp4Zjg=endP3GGzZcpuYFR=s1K1g@mail.gmail.com>
 <20260204134020.00002393@huawei.com> <CAD++jLkEtpiTxaNB6vfHnbmoV1PPB7W4T_04eQrwk2os_zpfpA@mail.gmail.com>
 <20260205101814.000072ec@huawei.com> <CAD++jLkVoorGWceRaF0VNeNLQz8TM1p2Dz-ivgyr4_T_QB_wfg@mail.gmail.com>
 <0028a425-140d-4baa-b482-d6f2d349f8c2@app.fastmail.com>
In-Reply-To: <0028a425-140d-4baa-b482-d6f2d349f8c2@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Feb 2026 09:05:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=b=EMwwvnp2Pi_VHauJYYL-PFz5efX974GHAaipgT5nA@mail.gmail.com>
X-Gm-Features: AZwV_QgIGqX2-_3gosbNd8Kh3MnK3hh7AS6z3TDmO2tSnA4Ufv3DAMg0HpB0UlU
Message-ID: <CAD++jL=b=EMwwvnp2Pi_VHauJYYL-PFz5efX974GHAaipgT5nA@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc cache: L3 cache driver for HiSilicon SoC
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, fanghao11@huawei.com, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, 
	Zhou Wang <wangzhou1@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, linux-mm@vger.kernel.org, 
	SeongJae Park <sj@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, 
	James Morse <james.morse@arm.com>, Zeng Heng <zengheng4@huawei.com>, ben.horgan@arm.com, 
	Tony Luck <tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_000541_200265_BFDB48EE 
X-CRM114-Status: GOOD (  22.15  )
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

On Thu, Feb 5, 2026 at 3:39=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:

> Another similar technology is memory that has already been locked
> by firmware (or hardware design, i.e. not a cache), and there are
> a few I remember:
>
> - drivers/misc/sram.c exports sram from physical addresses to
>   userspace. For a deeply embedded system with known amounts
>   of locked-down L3 cache, the firmware could just pre-lock
>   the cache and expose it to the kernel as an sram.

I think that's possible but not practical. To use the special on-chip
RAMs for speedy execution the affected code (hard kernel) has to
be compiled as a separate PIC file and put into that memory (IIRC).

I think I heard of a platform (OMAP?) that would lock down the L2
cache and use as some kinde of on-chip memory during
retention.

> - your own arch/arm/kernel/tcm.c, which does not currently have
>   any upstream users. I don't remember if it ever had.

Nope, but it is just a very fast SRAM, the only thing that is special
with TCM is that it can actually be moved around in physical
memory (!) by altering some special registers.

> - arch/arc/ had an elaborate downstream patch for wireless
>   network SoCs from (IIRC) Quantenna that would link mark
>   any performance-sensitive .text and .data parts of the network
>   stack to be in on-chip SRAM, but no user interface.

That's how people mostly use SRAM for executable code I
think. Some use it for data too especially things like linked
scatterlists for DMA.

The Huawei patch is different because it doesn't require any
special compilation, instead it identifies the performance-critical
code in userspace, then tell the kernel to lock down those
specific lines. It's a more practical and generic way to deal with
this problem, admittedly.

What this patch doesn't solve at all is the situation when the
*kernel* want to lock down some cache lines for whatever valid
reason. A generic API would make this possible when we
identify some performance-critical code inside the kernel as
well.

Yours,
Linus Walleij

