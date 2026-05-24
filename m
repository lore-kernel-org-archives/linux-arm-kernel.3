Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFEECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LM3LpCBe1/njTqEFIo5zYNSwmDEp0EgGwQLLh4EuYBI=; b=VmrzRPpY5DzLWt//LDocgO+Y0R
	AiKMahd38ZlJLfcyko6a0A+jpOmxt8mJABe6CcLXdSIK6uPdylIfmxqSK7bg1cD+7LGOy8wMuce9N
	L2NO9arTXJ+RUCr3FEoyJt2Gli3muQtq0iYBnPXRQ/ssWsFAbxizPEsCd3NhG2Wo6sqMhUpQRIY81
	kO5o9BrkF99r0GRhvw+4AUREaLKhVb7HB0Edfy2VBTKpa/HVNjxQJ8T3Znwm6oYN3D9pf7PNn58aY
	uIcbm/ySxnaNvgC+ifvrbSwbThB5uLxgqQrTlSTNJyLujJzPHHrEbvBCy3QjCMIDYZiJuX0nrCm4p
	VuDmbxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAyX-0000000FCea-1aYB;
	Sun, 24 May 2026 15:42:49 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAyT-0000000FCdu-3kmw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 15:42:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-365cae89bf5so3871542a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 08:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779637365; x=1780242165; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM3LpCBe1/njTqEFIo5zYNSwmDEp0EgGwQLLh4EuYBI=;
        b=lKHQAyTBtL/VXA2REATyqV63TtVOb7qNefwTQ2EzjK3AxjDw7qL/K/070tEj118FwI
         uce5loVIbKifFkFqpI2IcfLB36ie8WAT0ryk2z09cFtRTEvQaLz+sumZWLR3tGhDvgQd
         xKPeKTe5EneU6HvDF0PgYmo+W1xDlmNnQDDvfdKhNvjQosXIUI990LNsCKldqiadFU1X
         +0eKbhargqW2MZW90b2Hf7MIjnzzLkNywz3SzrkFNGUWwlzLxLujiD3gISlQfr48PkbP
         f8Lyygx3fAiaW1zUGk+AittHabW173JusGoePUmgQBKYQ3zA+GzXfIKFdlC6SHqPir9G
         ruDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637365; x=1780242165;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LM3LpCBe1/njTqEFIo5zYNSwmDEp0EgGwQLLh4EuYBI=;
        b=LzPujud699vNR1UakX9rbMCElcktnXU/HHOTRRl9M9enQcpy4oFI9xDILscsKPmZcq
         VHIcrPgDampA6+zTjXZrix2sitZCFDcbO06lVCc7Kkq8DmVOz5ZuXtkDSxN+fIbJAqtQ
         NH6A46VWmruJKjuTCR3ruX5DOLIkk0zzjR03OwagJlOzHi/SH4bmyp7QVCtMnp72qKCC
         x4DQB/bmEOGfL+iVYk6wEiO2dCSUI1qoREBWbtSGeHh8MzHRprBq4pojZcEn5wUpPiYQ
         MgNmvHuQY78G9RBTs+f/t9qTe6jXxHYy827P7CgbeqgyqnEk4UgNTl4zsK6nHSvEO0XG
         U94g==
X-Forwarded-Encrypted: i=1; AFNElJ/utS/urRTEou6BvbcdsQFOUZSGNk7/mNYcbgLLeOKRQRvBWEyvR1T7+gv+G1mtAXLQUso4GhfJ+kRmwEMUTxAI@lists.infradead.org
X-Gm-Message-State: AOJu0YwkV0b8lOAIWWqAapPLn2Nhk73t7Sx7QiP40uyvQIOgHsLryatU
	o49/oSBIYdN3a7pgz1AgKSiZJuZimo/T/1g6lP1pyk26f8UmOF1ka3oB7edYU/SY
X-Gm-Gg: Acq92OFvbqXW4Hr42a2qdUl89f6khmuXmeCOFaDI6wcGQ0zCk0z7YmBmIRAj1x21VL0
	Rwzjb4CBFTv/7SzaogvTFzzBAaDrKiadCbn3FsyWKWUP52kryoSLhUMoeSzuFqOKoGVZ1FTl/5k
	sX5GfyQg22/YxdX4DXw5iD/wt2ZayyMqEgC3yb5QrrJwVNGOOJmu5E4WXmAKM9k+SsuUMa6CxoA
	brnn/IEIym92qnDyLRKURtgLduq1uagex44vRcIYkpsUFxyZpYIl72s0BgwpRV94gfJCye0vLoC
	So2WnOPaNoGnx+PRvNdHHgYOm4GwO+o9KBX3FA6TL6Ae8gtR/gB6lHRnY3Wsstp4HpfuE6lFo8A
	sczdcFeRZdK9MRR8EB2mmeqw4EyvdqVIpXKzgZ/WDqoURc9SiXPcwCWp+3o1gWXP4gYIfJEyc5Y
	bH1WdWyQDKTwTFCC9pr6WxcZMGBKRWEjOcK3ipqGc=
X-Received: by 2002:a17:90b:4d0a:b0:368:f0a:1c48 with SMTP id 98e67ed59e1d1-36a671e2735mr10585390a91.0.1779637364483;
        Sun, 24 May 2026 08:42:44 -0700 (PDT)
Received: from udknight.localhost ([120.36.203.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm6914751a91.1.2026.05.24.08.42.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 May 2026 08:42:43 -0700 (PDT)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 64OFUlMj008301;
	Sun, 24 May 2026 23:30:47 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 64OFUhEd008296;
	Sun, 24 May 2026 23:30:43 +0800
Date: Sun, 24 May 2026 23:30:43 +0800
From: Wang YanQing <udknight@gmail.com>
To: torvalds@linux-foundation.org
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, akpm@linux-foundation.org,
        willy@infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: lpae: fix non-atomic page table entry update
 issue
Message-ID: <20260524153043.GB7031@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	torvalds@linux-foundation.org,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	akpm@linux-foundation.org, willy@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260315004746.GA32062@udknight>
 <abYHfGjqTRAB_oyR@shell.armlinux.org.uk>
 <20260503155432.GA18098@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503155432.GA18098@udknight>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_084245_938104_77B657B8 
X-CRM114-Status: GOOD (  28.11  )
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

On Sun, May 03, 2026 at 11:54:32PM +0800, Wang YanQing wrote:
> On Sun, Mar 15, 2026 at 01:12:28AM +0000, Russell King (Oracle) wrote:
> > On Sun, Mar 15, 2026 at 08:47:46AM +0800, Wang YanQing wrote:
> > > The ARM Architecture Reference Manual explicitly dictates that writes of 64-bit
> > > translation table descriptors must be single-copy atomic:
> > > ARM Architecture Reference Manual ARMv7-A and ARMv7-R edition (https://developer.arm.com/documentation/ddi0406/latest)
> > > "
> > > ...
> > > A3.5.3 Atomicity in the ARM architecture
> > > ...
> > > In an implementation that includes the Large Physical Address Extension, LDRD, and STRD accesses to 64-bit aligned
> > > locations are 64-bit single-copy atomic as seen by translation table walks and accesses to translation tables.
> > > Note
> > > The Large Physical Address Extension adds this requirement to avoid the need for complex measures to avoid
> > > atomicity issues when changing translation table entries, without creating a requirement that all locations in the
> > > memory system are 64-bit single-copy atomic.
> > 
> > Thanks. Now, please locate where the need for the updates to the page
> > tables needs to be done atomically, bearing in mind that we program
> > SCTLR.AFE=1 and SCTLR.HA=0, meaning the hardware won't write-back to
> > the page tables to e.g. update the access flag.
> 
> Dear Russell and all
> 
> ARM Cortex-A cores (cortex-a7, cortex-a32, cortex-a55) all have "walk cache ram", 
> according to cortex_a32_trm_100241_0100_00_en.pdf (https://documentation-service.arm.com/static/5e7dca43cbfe76649ba52835)
> "
> ...
> The walk cache RAM holds the result of a stage 1 translation up to but not including the last
> level
> ...
> "
> 
> The walk cache ram will cache translation result of L1/L2 page table walk, so the non-atomic
> pmd entry update issue describe in the patch will cause partial updated 64-bit entry to be cached
> in the walk cache ram.
> 
> On SoCs like TI keystone and Sigmastar SoCs which will run arm32 linux kernel on high address,
> the physical address of page table will be 64-bit and will meet the issue described in the patch.
> 
> I think it is right to make page table entry update become atomic according to ARM Architecture 
> Reference Manual.
> 
> Thanks

Hi Linus and all

Non-atomic LPAE page table update issue on arm32 SOC that run linux kernel on hight address has 
caused strange mmu related problem, we meet strange unhandled prefetch abort issue due to the 
no-atomic update when we run arm32 linux on Sigmastar CA55 SoC that uses 0x10_0000_0000 as the 
start address of DRAM (We do the same thing as keystone SOC, use 0x2000_0000 as start address
of dram, then switch to high address)

I haven't get any respone from Russell King in last three months, the full history could be see
at: https://lkml.org/lkml/2026/3/15/38, I don't know why.
I think make the page table update become atomic is a proper solution for the problem according 
to ARM Architecture Reference Manual.

Because the mainline tipcode still has the problem, so I want to try again to make this patch 
become merged, if someone don't like it, please tell me what is the better solution for mainline
kernel.

Thanks.

