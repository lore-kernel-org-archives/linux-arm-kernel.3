Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6D3D3515F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 08:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjkBPhSq2KNJwwC5a6VjrIfS+wjdobuUB/quFKLmn9I=; b=VXQsGDvnJ/lB57OfpBXh+x283/
	stXw/isduVsYK6CxwzSlu9FfZKiSK27+5G6fCtAj87WTQ1sxz0GLtXHi7joN8RRR7vEt0Gva0g7i2
	hmBbuCEKQfYzf/awadVEOJb1n9WDHw/pcVcsfpKhqVPUSNqGdfvKFQbI0X1KjmnEOENIE1tIQFKAk
	UBmErhhEHVDuPsBGlD+6wFffQoQoRTsoO2MQmnYAFX4XAIiIQxF2lIj+Dp/qxHMCDD35d61VwOmIr
	pYMTFhqudnx8SsbIeXJwjZx0xDrrjkiJdKWB5tffvZ+7PG2vHLNWLg6TpAGvk7RJ4lgB2ylfhkTB1
	39ywHL/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7r7m-0000000EKi5-3SAW;
	Wed, 01 Apr 2026 08:40:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7r7j-0000000EKhU-45aL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 08:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UjkBPhSq2KNJwwC5a6VjrIfS+wjdobuUB/quFKLmn9I=; b=kM54CCHbb0aALj1vg76idNGF/9
	ZpQDEHgzXqOuFNdh6nObce9l1t8qYj5PGvCHXMDsIPM9+R0eZ8ngd5dNDKNTfqGDBRid3kHLF0XVU
	/uZOBDagUS0AMc625Hk99EG0LurLJRfv5gRH6J6uPWDYftWz1X7MpwsNBoh1vjDDmA/L00Z4S+6Sm
	yRu8+1yHuWxija9A+7Qp0/RA4sXjJ9/3rrtsuh/P4UvoCmM9Kqa59SQ2Oh9KY8YMYcj1vAR+mTLnW
	UArOVokkkV4yrf2FLzj2BiM4Jy6y6hOqm9WegcCZ/Ez8MMRjSj/S4sVnCdM+ab+kgh8CkOnZw/Ko8
	JJ1d0iZw==;
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7r7g-0000000HSOP-3gQB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 08:40:26 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56d857af2a3so499665e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 01:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032821; x=1775637621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjkBPhSq2KNJwwC5a6VjrIfS+wjdobuUB/quFKLmn9I=;
        b=qwxCHREO0ACURIdeIUV+WmwJOw24jCmfUWAfOKMVAxElRPXvkFXI4CFIek+ilkSlHe
         KA1EpgpnC7oBCQcFODkMVOEkAIE0/UESLMFaW33E36uhLrrE4Z8c3g3wp+pBuRYiKyqN
         vyESJrnW4Eadh0/GhgFAhTctzSPyjS12RkvklZESizrzQibhKyHyAdKaYOcJJb5gvTZu
         zPXxFak8nixa6NyFyRTtB9nYE+oBUVVF301ldEkfqr2Ho59qfLLKsnDY4jILV1Hl9ATN
         MAt8EndkO9gj5ADSBfvj0Vr5BHthGwaS/c2967RgvYDT0wmWZHVIm5WlqhNugJZQQJT3
         nGFw==
X-Forwarded-Encrypted: i=1; AJvYcCWpmkm4pvp6wY0cH8Twd9uYwWF/xkziXFlspur1sKVtZt+DDsW1yM9Nv7/L0zjS0Qx2mX5stZjv2hZvP6pXDt/z@lists.infradead.org
X-Gm-Message-State: AOJu0YxNhS5ie4iLuUMnGxjoSRKne9ZccEEwG8cNdNXiLEEuSBIjA2zZ
	a/HoizbRpvxv5qbe5WXCT9LSvNCWlVqeTVpGL5nEQnN8AFRz/qpFFRCDVM5VxHRN
X-Gm-Gg: ATEYQzxD/Y6ltOifGv3WoQDbBkK8HS6LoDR2v0vZ4dY4KMPZV6NilwingjHB2iOxzsM
	CTRhJEBd4hKfJ8mEHsLnubLBmfjJG8ZNqZlU0havrO0OfoQqL2lnP5hKzLSWAl9vd88Pw+255u7
	xDDkim63BuFffK6v6sheJaIMp7EhDsdvxAH3QwKOX0nrxn8Hl3WgGyxKaJATzsPiRPoagCrJKDL
	nIWI63Jo49+ySgs/q7rCd9hik1u49gIynmkfsaoKZeAxy7TeCvnzVfLsU3L653jr3t8EUmeBT0p
	XY0o0gmpM2aniHvS1SOOJx0iHRf2/UMUyoMQHOBnF+6Cd3QAwFda14Y8C9kGtgpTdDjAz2gh6Gf
	DQIZLunrN/xRRsFS6Mt72RIfDU0hwy26AIdI0yWL5ZkuyIOpfN4fi4NeCggLcbU9eqBSFXiRaUu
	4oLlnoMLni+PCa+NX1UgLBa1kbLWjuqoXfb2LtnTgviwLqrMHREUCUg0EAvOAf
X-Received: by 2002:a05:6122:1348:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56d8a96ff4cmr1095650e0c.15.1775032821313;
        Wed, 01 Apr 2026 01:40:21 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a46f4dsm16147808e0c.15.2026.04.01.01.40.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:40:20 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6055dffd694so440504137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 01:40:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuIuceyM1AVBN6oaxohCy2kO2GpFY59JkP7PJPKb4s9BzJIm35RFgvXyRzzvfP42wuJV3pkF7vJ/84DMRU8HfX@lists.infradead.org
X-Received: by 2002:a05:6102:3749:b0:602:a9f3:74d8 with SMTP id
 ada2fe7eead31-60568183e55mr762941137.25.1775032820403; Wed, 01 Apr 2026
 01:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email>
 <vA8GpbivDeKzKN1k0B6m1cvW-rZwJjKzvhksYdUJPo4fsfhLQoXtWoK59V1YX_U2U3jcVR2PAmzrleamvq8Dmw==@protonmail.internalid>
 <833bb42a-65b8-4c93-8109-d2959f8b807f@amd.com> <DHHOCNHDN27K.RIE745OFAACD@bereza.email>
In-Reply-To: <DHHOCNHDN27K.RIE745OFAACD@bereza.email>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Apr 2026 10:40:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-NOqrApQpnq9cSRD69ViAcSyyRVERnuy9FiUJXFSZpA@mail.gmail.com>
X-Gm-Features: AQROBzBtK2awVoYZlNLRH_TxbROG8uZpU4rpSXf9Z2mSy2RwErngCSoFK_0ago8
Message-ID: <CAMuHMdV-NOqrApQpnq9cSRD69ViAcSyyRVERnuy9FiUJXFSZpA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix CPU stall in xilinx_dma_poll_timeout
To: Alex Bereza <alex@bereza.email>
Cc: "Gupta, Suraj" <suraj.gupta2@amd.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, 
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_094025_034744_B8ACED44 
X-CRM114-Status: GOOD (  30.21  )
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

Hi Alex,

On Wed, 1 Apr 2026 at 10:27, Alex Bereza <alex@bereza.email> wrote:
> On Wed Apr 1, 2026 at 7:23 AM CEST, Suraj Gupta wrote:
> >> Rename XILINX_DMA_LOOP_COUNT to XILINX_DMA_POLL_TIMEOUT_US because the
> >> former is incorrect. It is a timeout value for polling various register
> >> bits in microseconds. It is not a loop count. Add a constant
> >> XILINX_DMA_POLL_DELAY_US for delay_us value.
> >
> > Please split this change in a new patch.
>
> Ok, will send a v2.
>
> >> Fixes: 7349a69cf312 ("iopoll: Do not use timekeeping in read_poll_timeout_atomic()")
> >
> > This patch doesn't fixes anything in iopoll, please use correct fixes tag.

Fixes-tag are also used as guidelines, to indicate which patches
are also needed when backporting something.  I.e. if 7349a69cf312 is
ever backported, any other commits that contain "Fixes: 7349a69cf312"
should be backported, too.  So having this Fixes-tag, in addition to
another xilinx_dma-specific one, sounds fine to me.

> Ok, but I'm not sure what would be the correct fixes tag then? I though I need to reference
> 7349a69cf312 in fixes tag because this is the actual change that surfaced the CPU stall issue that I
> want to fix in this driver. I'm fixing the call sites of xilinx_dma_poll_timeout but they were added
> in different commits. Should I add all of them? That would be the following then:
>
> Fixes: 9495f2648287 ("dmaengine: xilinx_vdma: Use readl_poll_timeout instead of do while loop's")
> Fixes: 676f9c26c330 ("dmaengine: xilinx: fix device_terminate_all() callback for AXI CDMA")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

