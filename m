Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FF9CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=; b=dvv0MUD/X7C358NAuQ9NRQBD5S
	vcyMEy0tzPq8n0prhiP0+jzzLldntPDrwwrWcPvYKpWJBOzNXlqCFfPfX9ybQsVS3WZ+SeQT6n2lo
	lvslerBZxN6q0DWbzOYofzjNa1qKelg/Sfa4I7QwqLvJmzMifbm/qQpN2pldjsnSgvkn3rPlL/3vl
	jUisXijK2u8brH8s8ghJUXZv1u5BaW2Gq4IyUPvnWLv0EHfDZtIx/4o0cEUO9sQJjJe22VQpymNii
	dIlq1M7atpNEiQg9OHPRzfj/zQ5Yij9UYZMkEkks6RRrc73MbMT1yA1yWXsIJ8lRvJcU6yqwe6BqV
	VTTDLyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKaf-0000000EJqr-0fBv;
	Wed, 10 Sep 2025 13:10:25 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKab-0000000EJnx-2Cqz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:10:23 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f74c6d316so4222162e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509819; x=1758114619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=gcz0a4vUMm7pHoNnG8g6qfloUG5fZuTHfb2WcF/QUMFgEgSq5fh/ayfp7D2cyGxLRa
         2rywDf3116ubkwGGpg00yfC5TLxN8YY8KapldvlfEAiRESyyarIj3I1Biho9NueuBylA
         nngrBdvulx2vUlhqIThMIB9j/V4xeygWylQlsRqHITCKPyRw1dEOnTvjG6eg+FV92XB3
         k8DVn1guT2KaRuJXbdy/BOi+WZ4OsmNhmaPiUcV+s5xz9QzYuj5WeQfAURsepqYBeZl1
         53C0SkmQSIM9WU3dCxy2fMYmqBimtJZ0wBB1G32HT1TjFSs8pPCeTtkkio2NIV/MjaPI
         rBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509819; x=1758114619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=wjf4LMe4tuY03BRZVFBhyrn7IyT2gZaVpQijuklQP5ATbVyATEZGCS7Lp9NPuL6zvY
         jtDTvbyNS4H71StYun2pCQLv0XxgoaSLHmkmYrZ4Y0/4Izd0/ZBeTnC7/zK1e9Zmg+LF
         tTj8BHiiey+qlYL0Y2GbnqcwCQGlHM9gLPr7+olt25Zc/wJIbRkj/vHlilKsIymRTHdM
         LkGj9J0lorlMSRO8c6IW6x9hYaxNHdiO9Ku525MKUKH9X2xrSxJUK1jQgDzd/AYxT6xb
         NUZoNLlxQVDWqwa2rAf68A2KjdN05pEryW/uJDbYWl1qTE1TFjyY2eor2MDF7FlDThVS
         7rdw==
X-Forwarded-Encrypted: i=1; AJvYcCWZsSbZHAmWJCCtEMMVbu3ukWlmRe4IPg912lNdOne3qHlW3lhhXFa3Qn6TtUlmaXReEWMihLoE3KmNqDkJtuVy@lists.infradead.org
X-Gm-Message-State: AOJu0YzGU3WeuzbUcHSf5l6q9IxCyDc1j3oPExJoWNBACdW/koU9sYrv
	e+UeWds7MAAMBT+F3sBCJdaIw5w5cUGWPUBP6J6HxTAJhXMIXwMEjXF5EX+fbxfMZDrsWWY/FWb
	+H5+LdCKI7XIlOzoz2Y51u+jlZhQWU3cyL5vIZxiHsg==
X-Gm-Gg: ASbGncvpNDxLMYLyc7SWwfCBLHX0cyVfNzDP/65J5KBAWj8cxIgQBDUsMx2PmUkjRGd
	Ml28qlvPUMD+J4gs6u1DdZjIevWSVstsCuO6bF8r9B+lbRpTXhLrtFd+4zvI5N+O4IFJ2bsbngg
	58GDFuRsPaeYMnKUUZ+kbUj9+MrfZq41Elvf9UY6CTNXEthjB3J9IpXRK3TOqSRWQ06JnEgMOyS
	98jfQM=
X-Google-Smtp-Source: AGHT+IGgInBj1Ic/f5mZf9DHaSimxT6oABg1gWpLpcYCM/ousRHHwwGjp7S7ZCbmXiMiFXeqAGANnBbsml0uYfwnmj8=
X-Received: by 2002:a05:6512:39cc:b0:55f:47a9:7d33 with SMTP id
 2adb3069b0e04-5626425ccd6mr5952206e87.44.1757509818943; Wed, 10 Sep 2025
 06:10:18 -0700 (PDT)
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 15:10:05 +0200
X-Gm-Features: Ac12FXx4fqtngzlb3aPI-q1c6xVbomqK3jaNECwBf_yyF7AQZ2ofNJeHmlxFUVw
Message-ID: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_061021_594447_69914671 
X-CRM114-Status: GOOD (  21.25  )
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

On Tue, Sep 9, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> - ARMv7 machines with 4GB and more exist and keep getting
>   kernel upgrades, but to my knowledge are not in production any
>   more. These are mainly 2010-2015 era chips based on rare
>   out-of-order cores like A15, A17 or PJ4 that were designed for
>   low-end servers, chromebooks and network equipment but replaced
>   with 64-bit chips shortly after. We had planned to bring a
>   CONFIG_VMSPLIT_4G_4G option to ARMv7VE to keep supporting the full
>   memory at a performance penalty, but currently have no plan to
>   finish this (volunteers welcome).

I'll fill in on the details on that, because I tried, to the best of my
ability to prototype this but I failed, so far.

Here is what I managed to do:

1. Building on another rough prototype by Afzal Mohammed, I managed
to compile the ARM32 kernel into the VMALLOC area, this works
fine and here are the patches:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Dkernel-in-vmalloc-v6.10-rc1

This is is done so that we can unmap *most* of the kernel
memory but *keep* the VMALLOC area, so that e.g. exceptions
can still execute and save to stack when they occur, and we can
call into the kernel to execute said exceptions.

This in practice means the area 0xf1000000-0xffffffff
which also includes the high exception vectors that must for
natural reasons also be kept in the mapping.
What we have mapped today (all of the time) is
0xc0000000-0xffffffff.

A minimal 256 MB mapping from 0xf0000000-0xffffffff
should be able to cover this.

So when we are talking about a 4G/4G split we are talking
about (4G-256MB)/(4GB-256MB) split to be exact,
we would keep the bottom 256 MB.

2. On top of this I tried to decouple kernelspace and userspace
allocations, in essence making anything outside vmalloc invisible to
userspace by unmapping it using the fact that ARM32 (LPAE) has
two separate translation table base registers: one for kernelspace
and one for userspace.

Step 2 makes sense because we know the reverse can work:
PAN (privileged access never) makes userspace memory
inaccessible from kernelspace unless explicitly requested and
that works fine already, and we implemented it for LPAE
with similar trickery, see commit 7af5b901e847.

It's harder than it looks though and I never got it to fly, but
maybe I will try again. My patches is a mess but I am a bit
smarter now due to reoccurring MM-related work.

Yours,
Linus Walleij

