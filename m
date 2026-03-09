Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE6BEFCD71
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcPZnd6YTmJYCmkSo2/8CySFFnDwxQJW2YpHGqa6ioY=; b=EthYRtmfZoOOE6QDSlzobtWIjQ
	xbnWHZ1FsMvirFPwwHsvt9ipaJP6fEXdZTic83gMyW0ms5n2sXYSBF1f4Q1a3J2wqSf/gvW92CVHQ
	VdPGRi200TQKujBqX8T+JOJyoY5OCQtqJ7TSPnpL3eBEPVB6A2kokawrLutla5+KVT0Df1zcomCmV
	Axu/M5fOHa37UPf1eQc7jEMrODWYHxnLZI+Xd5sfOPBIt7iMFZb0Oq+R8Mzyj06SLkxGubWAkHY5v
	cLU8D15be7PrQV/myLSH9XQneoVd8ZZQqQAvjcLF5KKv34+x2tEx42ft+zGtQ+Gu9rojq/WDqOwmF
	1W0uDqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXJ2-00000007272-2HAr;
	Mon, 09 Mar 2026 09:53:45 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXIz-0000000726Y-2Q38
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:53:43 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56b18b520e3so974254e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:53:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050019; x=1773654819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcPZnd6YTmJYCmkSo2/8CySFFnDwxQJW2YpHGqa6ioY=;
        b=vFqtPO6lWrIckfh5xbukLTeqMSTJGiy669UEH8LfZN/Y3MQ1SxXsYDCKxcs54FNXAV
         L3K4oYS7/RHgHcaDLAVoNpws9EBZq0YVmZuaXFe1mmoBjG19tATa8rvPo3w00ELeDIwm
         NG7g1GXPCR9lgDLVD0/zK3ptoQvaE4eIbspLlx/2BtPBYtSaWry0yTYNywNZguL6LcbJ
         qbX8IvaratEN57D/nGdoe27Teo8HPiMxu+PtD+D9c4R81dgtPTRv8qCh395sgtIqxL2k
         puTvxWMAjPtby1T2RNJbgkc2GUf2i0GzjbHjfdnl3WJHVXInVMTOlx0Vk6z+Jy/JpJx9
         pOFw==
X-Forwarded-Encrypted: i=1; AJvYcCVfzsjyZTXbz1BDwsh6bmJC7rgtLic7sjOxx/KOIkfVNFOPHSl7uN7TLu+ot27VkGLiy9eclIJttBw/c+EMFSTL@lists.infradead.org
X-Gm-Message-State: AOJu0YxtkyO6F9r+gNPK7QnZNh//tYTsP19cwihvpUy8fV3UF2QExbzG
	tr86dQ/VBR4RYMR0AxYIa5NYEMxPH6hYQKjATQ2wc50LD7uQ7+Dpv6K+vUvaPW8H
X-Gm-Gg: ATEYQzwjYIQM0cI8SrFT4YdX24y7MInV31UsurVa8Zgt1qhPTOrBiFw1OLWb286c7XK
	s1UN2UwF9/xZCry9QORZ3k4IRgs2vnjIjR64FHHPw+kBYobfg6MJ/Xv/z/eDy109FfjJ28WFtJM
	7scltaCAYkoUTuq27UDuHns0fcQoNfKmx43FHkIg5W6HsDOS2HcHQG5S3HH4fXCKhO42DIg9je2
	ONXLuVEEVW/lgnpuPYgzPPph4mVLnAbkP6Yc/cUTmWS29Gq+2XpuOGDibs3mBaf3N6uwS86mWre
	P1q6JQVM+W7+ae5oMPzC5cstiIFQ7HuaPaUnxVoyECAwy8tJSN8dcBjlSQ3qQS8/7DNgRq487mJ
	Lhpv2oyddE6ytuxgBrq5UL7KOt/t+KWFTQLSiKEb3DEID7swOO7/G5zmxUtbaCJYDDCP/orGP8R
	AvknciI93f1d4bVgLr0wyKLN9t4Ldkz9ip4Y2+pRGfwNetyFBzBvcmbIo8D9xx+dOXnByumEs=
X-Received: by 2002:a05:6122:4a1c:10b0:56a:ed84:e2 with SMTP id 71dfb90a1353d-56af4281096mr4164281e0c.1.1773050019610;
        Mon, 09 Mar 2026 02:53:39 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b71fe8sm9501315e0c.20.2026.03.09.02.53.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:53:38 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffdd9a6155so2870746137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:53:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXL4BkO+Wu4qdKt4vyH0I15lJkaHHF4mzJQIZ1/p9NaWRJMMXtGDUWtgfb92T1pi1HeYudGJVQRNm3PT9jyYnK@lists.infradead.org
X-Received: by 2002:a05:6102:3050:b0:600:ac0:ce33 with SMTP id
 ada2fe7eead31-6000ac0e677mr2034235137.5.1773050018562; Mon, 09 Mar 2026
 02:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <6735401861e0c2f3e5e680533cd6f71c4d6fd5eb.1771581270.git.geert+renesas@glider.be>
 <177297485599.1088487.13156698600769816077.b4-ty@kernel.org>
 <CAMuHMdXkyrDRLyDf77TFFjAX_Q_fnA_OwmbkoaEicd+F9JP2aA@mail.gmail.com>
 <20260309-bold-space-ibis-fbff63@sudeepholla> <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
In-Reply-To: <20260309-frisky-proficient-gecko-b8d7be@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Mar 2026 10:53:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
X-Gm-Features: AaiRm52STTVZn_OJ0AxO1KKzepN_Qh5JalPfQF_WP1CiVNHMvNp-jxwNr7ERlYI
Message-ID: <CAMuHMdUkJzSLiAO4cwCFSFg73q9hCYQ0fCM5_HEdwKxxgP8aoQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Spelling s/mulit/multi/, s/currenly/currently/
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_025341_622865_01A534ED 
X-CRM114-Status: GOOD (  30.71  )
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

Hi Sudeep,

On Mon, 9 Mar 2026 at 10:38, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Mon, Mar 09, 2026 at 09:29:29AM +0000, Sudeep Holla wrote:
> > On Mon, Mar 09, 2026 at 09:16:29AM +0100, Geert Uytterhoeven wrote:
> > > BTW, I noticed some of your commits use the non-standard
> > > "Message-Id:"-tag, while others use the standard "Link:"-tag (albeit
> > > with the lore.kernel.org instead of the recommended patch.msgid.link
> > > domain) to record the origin of patches.  Do you have different git
> > > setups on different machines?
> >
> > Not really. I used to use "Link:" and switched to "Message-Id" a while ago.
> > I use only one setup and if you are observing something like above, I am
> > doing something different. I need to check what is that, but the intention
> > is to use "Message-Id". Let me have a look.
>
> OK, did a quick check and see last time I used "Link:" was an year ago and
> that's when I saw some discussions about use of "Link:" for other purposes and
> switched to "Message-Id". Let me know if I am messing up something still,
> happy to look into it and fix it up.

There was indeed a fuzz about the Link:-tag[1].  In the end,
it was agreed that the Link:-tags are fine, but please use the
patch.msgid.link domain, to distinguish it from discussions (which
should use lore.kernel.org).  Unfortunately I can't find a link to that
(too many trees in the Google forest).

About Message-Id: I totally agree with [2] ;-)

Thanks!

[1] "A policy for Link tags"
    https://lwn.net/Articles/1037069/

[2] https://lwn.net/Articles/1038003/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

