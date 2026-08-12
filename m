Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5539C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTo9zPlaH3flPDssEgbhBqafK8pdC58gZr52aUiEgTc=; b=iz+hZyK4dgeCx28iuaD/MW8s+h
	8A6kHiAHoELwiXEWOH8Dg9eeZLyy8lMmzJ9/YSt2o474g8O73Rlax35txmcp42fQC96EFQ/a1IRLb
	IceSvCxBTpOllis3IRyZU4QZfy2CHc3LJSq5hovOl8fTEdPrzYq/cre47j+LYU9dilsFJYKFl2yPd
	c5NQHMfBY4s1NP5assVPtNQUMuxTs4pIfmU6FN1uzk5eGi5wyY4j7KarzRdUT1i7n5lGSCftSRObj
	5xhUcSsy4K7/GKpZGoPgWkQBQmmWAbbgzV/ZyqEklDqxW6Becv/6qwjWhaR8onY7T1ZSWcGTk19IE
	xvnHdlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8Na-0000000GDV0-28lF;
	Wed, 12 Aug 2026 12:48:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8NX-0000000GDU8-0D7R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:48:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495522bc0e2so379165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786538897; x=1787143697; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTo9zPlaH3flPDssEgbhBqafK8pdC58gZr52aUiEgTc=;
        b=KcfYlOK0muPxBSxck2d4EuRmab2mo4avg6hEwnaDAD3M5cNR9opfD7P9dO/dj3C4YW
         S7tCsysDqh32dlYhKh7ixIu2ma9UVuTqd2S13PKw2uPT7IUlwUUMX8azdrJ4ntnR0rox
         Ns1Urnl7uv7xnOtI2TOQ5eDz+O8chtxJ7NBIQfWJbe3rwtN885LIYK4kBqxlYdk7th3j
         aEV3cXYxZRMmXwq2XGMtfs83NuSxLyI04M1xbqDUZAOYWcbNNcljI+ERhj2CQnKxFZR6
         C/d32BiEpWasl/dHtqVlFHTFN5Se32Jnawwj15TomAKNZejqbt63wAID6TZhnoEMfse9
         TkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538897; x=1787143697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTo9zPlaH3flPDssEgbhBqafK8pdC58gZr52aUiEgTc=;
        b=rMwwlZB0RrhiEz61K0lb4266qOfj4vaX/nPGMWLLJIDXvfk6vAFFC9bG+PFd8Ajujj
         NBFsoS4chFfOspQqL8HnksKNDni7z13bIbM9U0xbeq/6nU9LqVlEGStGe6QPgJckOP6k
         OcHZl+zJXdi8zu9s6F345VCnCRWlewfbCeSIwpL5A43VBgLiPefv4vXey/m1zmxaRtke
         C2GQB/ZXcBbzqr0yVbuRkaknh8abxiH4DashIAM1Oudzojm7ZmMxcTjKlBTkBv3AGu2o
         Mw5+xv52QRj34ReuO3KKZ3YKn8z87AVim4CkYkKBoLiFmZbDBI3trAsY6vDusEvahgEz
         7BHg==
X-Forwarded-Encrypted: i=1; AHgh+RrBz6Si5XbsbQjFfd1ilOcuKiltjd8ritFfNr/KjBVeGr/onjrJE4SVRDJjFfX0wwEpN39kH5QEsuvno2NVk6Ti@lists.infradead.org
X-Gm-Message-State: AOJu0YxFV7solI9wdee7lFbtRnch9VjgnF254b91rAy2PoxHdsJZdOs3
	HwvtpwbMfxKvtQozUhjwSJfIzwrZW1Bxh71z27o0HWzvGf5IQgq4YN7n
X-Gm-Gg: AR+sD1395iP/LmiMgqsRzNh+5HzkNw/gCHLz4TFc4nLlUbQUWsZc/v2mrY90irpZbza
	pLsSKoo8598w3BQWfyKLXv9pN2W8WKxxhuLIPBaB+h9wl4Ly04wvFPvN5V1ICNMLLH1oiEplchB
	X5mrhcaQte64WlH0m9i1B0RAvPF3hGKwFD+re+ItLj1bs7uzVK+KebzRG7E916cyuzU1GxIJvrH
	/wYjy6lUCVWFBX5mtUvXnlchvfPDBK+c2Wxd7Q/SDkd8s4tP2UadNHcwDVQf2iJcipWu6MRaycD
	FrbDsLDLWEGTJjPV+VNOfTF83FvcYoxQ8Raauqzvl1OqMI1WqMW5A2YulsqpQ8yPlXdh4GmVjBI
	iiz+h72nnblyvJ5n9NbYIEq79o8e73jx0QfBFghLLyAf2qsBW9I4IKHcWzu0FWt01Hx5T8g4K5A
	nVsQC1dF9xVsnjVAOar62jYZP7zV+f0p+tWnvCEmRwtFfsmtyhx5GJBU3PBS4oLedzd0Lh8skXU
	QuSilSvFuWC7nOSLbWdBGbhm5x1L0w6s7SzTqxBRtfOiY4INiisGZI1VOX8Y3jZkcls
X-Received: by 2002:a05:600c:4688:b0:498:8e6:d463 with SMTP id 5b1f17b1804b1-4997c0ddd6amr30132445e9.1.1786538897096;
        Wed, 12 Aug 2026 05:48:17 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B84A6001A34C2DD5D9E0419.dsl.pool.telekom.hu. [2001:4c4e:1b84:a600:1a34:c2dd:5d9e:419])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c98ce0bsm47612095e9.11.2026.08.12.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:48:16 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>,
	tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: Igor Paunovic <royalnet026@gmail.com>,
	alchark@flipper.net,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/10] accel/rocket: take the completion register writes under job_lock
Date: Wed, 12 Aug 2026 14:47:52 +0200
Message-ID: <20260812124755.6507-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812094106.1391698-2-gahing@gahingwoo.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com> <20260812094106.1391698-2-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_054819_115079_EBC85F08 
X-CRM114-Status: GOOD (  17.89  )
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

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores

I ran this on an Orange Pi 5 Plus across all three NPU cores, against a
base without the series. Both modules were built the same way and
neither carried any local DVFS work.

  base:  v7.2 rocket
         + Guangshuo Li's "clear rdev on device init failure"
         + my "request the core clocks by name" v2
         + my lifecycle v2 1/2 and 2/2
  test:  the same, plus 1/10, 7/10 and 8/10 from this series

Six phases per module: all three cores bound; core 2 unbound and
rebound; core 0 unbound and rebound; all three unbound and all three
rebound. One MobileNet V1 run per phase through the Teflon delegate.
The oracle is the sha256 of the tensors that both change between
different inputs and stay stable across repeats, so a stale output
buffer cannot pass as a recomputation.

                          base    this series
    three cores           89.3       90.0   inf/s
    core 2 unbound        87.6       88.8
    core 2 rebound        88.9       88.2
    core 0 unbound        75.3       75.0
    core 0 rebound        88.6       88.4
    all three cycled      88.7       88.3

All twelve runs produce identical oracle hashes and the same
classification. Interrupts per inference are 42.75 in both, and the
distribution matches phase for phase: with core 0 bound it takes 41.7
of them and core 1 takes 1.02; with core 0 unbound the same work moves
to core 1. Neither round logged anything beyond the probe messages.

That comes to 2596 inferences and 111048 completion interrupts through
rocket_job_handle_irq() with the two writes moved under job_lock, with
no difference in result from the same count without them.

On the change itself: I could not construct the race on the normal
path. The scheduler runs one job at a time and the fence is signalled
under the same lock after the writes, so a submit cannot overlap the
completion it follows.

Where I think it is reachable is the reset path. rocket_reset() calls
drm_sched_stop() and then says "Remaining interrupts have been
handled", but drm_sched_stop() stops the scheduler, not the threaded
IRQ handler. A handler already in flight can therefore run alongside
rocket_reset(), and after drm_sched_start() alongside a fresh job.
Making the write and the decision one step is the right shape for
that. It does not stop a late handler from writing the zero into a job
that is not the one whose interrupt it is handling, though - would a
synchronize_irq(core->irq) before the guard in rocket_reset() be worth
having as well?

One note on the base, since it matters to anyone repeating this. The
core-0 rebind step needs my lifecycle series underneath. Without it,
that rebind hands the returning core the index of a core that is still
live: the driver prints "core 2" for fdab0000.npu, inference starts
returning a different answer, and the teardown that follows dies in
destroy_workqueue() under drm_sched_fini() with a poisoned list
pointer, leaving an unkillable D state. None of that is your series
doing - it reproduces with 1/10, 7/10 and 8/10 absent - but it does
mean the three-core test cannot run to completion on a tree without it.

Igor

