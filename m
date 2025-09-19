Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6B6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=; b=KgYmSGTzb03w3L1nx1DK1D1O5W
	axU0dSQYTjRKzBMdIPJau4G9d6q8cjppuxq7HArqdWgMHFF0GcAn+cL//hjPjylLZ7joeDuETnl7P
	FJQLy6ofgRHG3oMNcbLlAMXIB5gN7iYVwUleB4WRmfKMnaHOqbUekrPwrnstbEMI+cl57kkOx8THW
	3HjXGP3Xyr/dY3+dNC1BvDK3zwCjb31iN0TVfeWWpXgeJVppXyl5wVMSheHrTkXFuGagLZB3IH/rR
	T+Y59zazNYAEGVO7KPFdLkLTw5Kkgc32sQoR+uFauVbhZuaG/SeDVeBmK4K4RtrDLP0lYQ+zdS8+T
	1B6YX8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVNT-000000022TH-40pz;
	Fri, 19 Sep 2025 07:17:55 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVNR-000000022SF-2Rq6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:17:54 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e32821b5bcso518559241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 00:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266272; x=1758871072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jN8ls4Umh9EIXSEQoAkCyXxQ8L8mjN2Gdzzs4J/riyA=;
        b=CgkOhWUd4TAqoC7DiNRZTuscqUNF8Nj3Ab/b5rJJFSFgGYTQKNTDjECV2UV9pxtKGV
         uHtGtqwXzW2muLM1s4zK0mKxiGpCWmHpY+lYID7HAaZaeHlJmUwtUPXh+YVx1BhVbsMO
         FaoAH2alCrH/1O1gD6qaP+aoujLFclI0SU3+VBW3od1cDFVWu0ubLiNv2NdvXUmR8UQz
         Yko7+rvpBaxg7seNNkdoUWfAPdMYDqvR6NRfwaSLhR0BfZdNtwOpHeUVRrFL3upMvWLl
         3qvlwcoSZBfmQlQCOTyMjYq3Kvc309LOyUOJBBrzoVTKtEnh2k/UWWRfpgLHjCQUnmka
         KMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVdlAxAftuRMaweozGKZ0eg2sMPehA5bStPx+9vhuxkfolNPvyhIaQhEVHNpgoNed0FaEpzwRcg0axGIqQbqFmV@lists.infradead.org
X-Gm-Message-State: AOJu0YxxUEISLX7LlHkv4z8eDA6XGbIsIyEYrJfH96lksuKIkH6lIncd
	hW2569ZfaYDBJ5PeFGEZ5R4+PBZYGfTiC9XY0pEa5lNcFV9ceKZuimL5CWf7oU4e
X-Gm-Gg: ASbGncs8YMLMhiE5GbKjLnYyqnZef4s2/JcoZnxyR23TzywkY5jd0zKubF98TQe/lOP
	UtKQrpQjUcozZlIFEmUvfDNtTUPtY7MIB29tXaZZ0Dqa0l436FC7dHXLP6TFd7UAU5x+mJCJg/5
	jOLYjj5LvPMM+lxVWFo6ZqfAAPgyBWQLWL+WAMizi7tUn7QpY9CdOXp6nfyV6i9de02VuIR9nu4
	u/glT3VAxP7Q7mnqz+u0UChkjMIt7eXofZJYpjFno1J4HNwYw6BXJJ1racSPT7CcVFvArXHKiGb
	T3Uy2uQB9SApTOIrVE/OD49BIFgeUttjwGvvsUmUtnxp+yBrGzXKr7emQwE6b6cOjsCuLv21LJO
	ibTcHjkw9jB1iX5KYb8qE6L8rf4hZWzC/ZdCqPXdVoUnMzrRdepf1GD9zlysS
X-Google-Smtp-Source: AGHT+IFfWpv6wkyhEN3E9RcmbifLk+7P9nRdpWzIDLIhBRe675k+A67/uPFJG7AltkIQkgR7JjMD9g==
X-Received: by 2002:a05:6102:4a88:b0:527:4113:6ad6 with SMTP id ada2fe7eead31-588e0ba5605mr615474137.9.1758266272221;
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e82e3771sm447782241.22.2025.09.19.00.17.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-58bf3b15575so47160137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 00:17:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuMcb2F5XWucAnlYZA25UQMOzQC6h6gZBgZwQk75CffpRao+y4ZlPNdjFcYxGBNQLjkIy12rMehKuyXpBZILHz@lists.infradead.org
X-Received: by 2002:a05:6102:534c:b0:55d:b35e:7a58 with SMTP id
 ada2fe7eead31-588f3357b74mr639278137.23.1758266271934; Fri, 19 Sep 2025
 00:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com> <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:17:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
X-Gm-Features: AS18NWAI1tRNfDFQjIFUy24j2rmv5VjIZdZQpBy05JHeqlSMB-7iVf4odZQDlmM
Message-ID: <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_001753_628817_F594FB00 
X-CRM114-Status: GOOD (  29.51  )
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

On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> >
> >> I'm still collecting information about which of the remaining highmem
> >> users plan to keep updating their kernels and for what reason.
> >
> > On this topic of removing some parts of highmem, can we say goodbye to
> > kmap_high_get()? Only ARM uses it and only for
> > !cache_is_vipt_nonaliasing() systems.
>
> Good idea. I think we are almost there, just need to verify that
> there is actually no impact for existing users. I already knew
> that there is very little highmem usage on ARMv6 and earlier, but
> I tried to recheck all platforms that might be affected:

> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>   get kernel updates, and the only one I can think of with
>   DDR3 support, but seems to be limited to 256MB total memory.

Are they limited to DDR3?

IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
new variants of old SoCs, to accommodate the changing DDR landscape
and market.  So perhaps they also accept larger RAM sizes?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

