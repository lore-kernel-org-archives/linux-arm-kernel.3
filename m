Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D51CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=; b=IH8CA6FpgFeYu5QArzbrMOX39K
	wybvkM6NtEQSmXhze2JrnHwZ9ufNClnQzbxG13ioI5kLpsFI3gIIRQmKPcIBZwq0Vq1oPQjyKWSu2
	+pRslb+icnXRnpP6XvvoqkQooVgZ5obXeoSIysEixs2dpMX1/mNTYvq/oHFPo2fGAJmR61gI80AvE
	EALwdyJ8IW4jC8pxxyis+qhTmYIIVzRXtApKUJjLsrYbLA3KDX7Ieik/74Exgg752V0sqNC6qwhjn
	YRwu0fxBlIV8jg1CrVIEamS3Zo11+DueN1dANICa93WMyL65eesPj4aXjPYcjstk9txux9zHMMIK6
	fEPM7ocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jzx-0000000B3h6-1tgA;
	Mon, 22 Sep 2025 17:06:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jzu-0000000B3gH-2pd7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:06:44 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57bd7f0e5baso1794023e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 10:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758560800; x=1759165600; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
        b=vcFeyfZm29uE4so8DQdGzaLZA88NqIEhJLmh5cCnuj80K36sXCU6LEIe6L7pJMWnAU
         bizjFylMTnwPCSgFI/YYnvQPwR8q0gjf2TYcVB+Es0DPGR37r79KCboJHq6LzoHenp+d
         Evl7kw6HxkIr3Cr5jhRHqVjuzCLeSsl7j6Gg5NQmeeubDSe40rril4ld3PvLxYZfBKoo
         fue6habXIHlXjrWRqtXkz4FZWSLXUhgVUi3bLgxwBEKJUCkuefPwPiK9yJ2Ci1JSilKv
         Es/34N0pDEe0Hg/aVTBwPC1Y5gzyDNy2XddyR7IdxO0ZARqwtBSl3g3o04MXTJp4mHX5
         i2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758560800; x=1759165600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et/xnvrYuQUk0byB46PUmXIo7392F/K55Vqq2WX1kEA=;
        b=F2q0YylPRDt1GdE/pusEhRccXoKZPEMvU/IukPWLJOYIsHJI81qwNZDl4Z3joSkGNI
         WzcXrJNcxlx74vRitwqhE7izKb6C2T9CMnLWSZDiuKjREXVly/slhRXCLXLFtw547rth
         FZuRnByPjbup9MrKI9YaeDurnv7V4UYMEMrFbtyrFaLT569UrWVcALnjDchke5S0VRpT
         T+/nsawP4jPayKXFV3yikOZMSwkx/MaOBlA50yj0wDzqEsikngncsET9uuiZxdLfCb5v
         HnTCfhUKZgTgKq+ewhk35rthNnyXo+jCnWtj2o9Qo//NDXkSk7gsgq+Nty2b/zuFprjt
         dgTA==
X-Forwarded-Encrypted: i=1; AJvYcCV1dtvThxadMphjimpsWmv+t0xmUwvNQRfM8Q3e6pBPXXiqPBc4B2ablh+ojOE1JNoa+dTzbEs23b0a9MxND9HG@lists.infradead.org
X-Gm-Message-State: AOJu0YwdCDwl3FdDemQG9UNXXX2J1/+t/mPQMMAVZL4MJa4Dfo3BubGY
	tEZGL1ZZ1qCCZzK/ia70V7zhcc/rBSka3PFHcxBE1agjivll57fIYkRXFdUSS5O+LBJF0SMmzUB
	c7/Zrp2uxsl4BLo815ZM3GHiIysV/M15dxFB8MAqp7A==
X-Gm-Gg: ASbGncsX+g2UjUqYx7/hEWowM/PmiTfPgcoQMMNSnwP1necwp2KLVZLCTRr1wVmGHLv
	9wdG2o2I0Fp2TQFXLyT88xvUJnq4U/GH37njBzz46CLAn/TaXcxk2MZsWNScrFeEzqF3xpVY5g+
	ovU+Pe9sL11+Lptm8KPlpspBO2IHDCBX87PtyWW+W+kWaEeOs027rHXye83cCaL0u+tmxPgvFxY
	Jzu
X-Google-Smtp-Source: AGHT+IGGtpp1dzmc7QwuqgW2pSLIm4mtcBhZLeu+2i3+Ni9prtVcG/n56U1c5SPCEyTQDr/U3BLl49JsojBTLduSacs=
X-Received: by 2002:a05:6512:4013:b0:57b:aff6:68a2 with SMTP id
 2adb3069b0e04-57baff66a5amr2706206e87.26.1758560800251; Mon, 22 Sep 2025
 10:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com> <20250919143436.GC2132010@nvidia.com>
 <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
In-Reply-To: <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 22 Sep 2025 19:05:49 +0200
X-Gm-Features: AS18NWDJSAue7YE7c8rlG0jvR5lve033dTh_Rnu2Tx6e392cgPO_ZPu-mU9r2No
Message-ID: <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	imx@lists.linux.dev, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_100642_967345_728F2A1C 
X-CRM114-Status: GOOD (  25.25  )
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

> On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
> > On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
[...]
> > I am right it sounds like we can drop vivt cache support with highmem?
> > vivt is alot easier to understand if kmap isn't running around
> > creating virtual addresses aliases!
>
> I think so, yes. I've prototyped a patch for it to add a dependency
> on !VIVT and the drop the code paths that are clearly no longer
> needed without it. This obviously needs proper testing, but the
> diffstat is promising:
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index f14bac913d50..0a31cfaf3818 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1214,6 +1214,7 @@ config ARCH_SPARSEMEM_ENABLE
>  config HIGHMEM
>         bool "High Memory Support"
>         depends on MMU
> +       depends on !CPU_CACHE_VIVT
>         select KMAP_LOCAL
>         select KMAP_LOCAL_NON_LINEAR_PTE_ARRAY
>         help
>  arch/arm/Kconfig                    |  1 +
>  arch/arm/configs/gemini_defconfig   |  1 -
>  arch/arm/configs/multi_v5_defconfig |  1 -
>  arch/arm/configs/mvebu_v5_defconfig |  1 -
>  arch/arm/include/asm/highmem.h      | 56 +-----------------------
>  arch/arm/mm/cache-feroceon-l2.c     | 31 +------------
>  arch/arm/mm/cache-xsc3l2.c          | 47 +++-----------------
>  arch/arm/mm/dma-mapping.c           | 14 ++----
>  arch/arm/mm/flush.c                 | 19 ++------
>  mm/highmem.c                        | 86 +++++--------------------------------
>  10 files changed, 27 insertions(+), 230 deletions(-)
>
> I did get an email from Nicolas Schichan (added to Cc here),
> and he is still supporting a widely deployed Kirkwood based
> platform that uses 1GB RAM configurations. He should get
> a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
> would expect that to continue working, possibly with minor
> bugfixes.

Hello Arnd,

We don't use HIGMEM on our Kirkwood platform, we are happy using a
2G/2G WMSPLIT. We don't need a lot of virtual address space for
userland, and with the 2G split we don't waste physical memory.

I'm happy to test your patch serie with VMSPLIT_3G_OPT and see if it
still boots with it once you send it.

Regards,

-- 
Nicolas Schichan

