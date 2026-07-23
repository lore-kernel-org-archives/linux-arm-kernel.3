Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB063C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 15:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYpHP3NN7o6cY+8WOSgLS6195biQhMZQGaK4qqozNH4=; b=TS17yiMVqfkKv018y/fvWTzavi
	MPYJQJ0XTiNw/AoXKG1Cm5SpJS4y3Qo0oYh6tWM1tFDiugHMSmFrQDui9vJg0G15JGN9PQJHXkNlb
	i31cFWXQqQ1LHk/kFEljgKhbhV41Evx5YeBFK9krp2i9oy4V3j2oawHXpOL+/geFPxtbBt7KPtZOP
	qrWlnYnijuksWNsOGwSnsVks+YpjPYM55C8aphmLD6HEJ2fiq/C7h3/LPa57Ba8M2vvHajuWpkOqi
	QUfiJAx5YzQ+xjXtasSePypb3V4CcFBv0jk54MqEOf+r63bthaXwvJNAmnjc/iLTg9rEGwRvoHmZi
	L8JS6Cew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmv59-0000000EZ8G-2Ff0;
	Thu, 23 Jul 2026 15:11:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmv57-0000000EZ7r-0k8g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 15:11:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4955de8797cso5076135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784819487; x=1785424287; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYpHP3NN7o6cY+8WOSgLS6195biQhMZQGaK4qqozNH4=;
        b=YRlrM1TPMfwB2gkk3Iuk5qNdirubJQOOZTOF+TQnUfM6eOge1ad1GjB2rTXNwNqSRa
         9H/NxZG0R5YmnuIelPMMtlqlDgZIR4iTAurw4DwaKsbHDO8ftCl2vApGz0Rn6jkxspWK
         co16V/oJmaGuA1IXyVka9oVunwj3+uG/ipqOzGYihbexvD6BHJC6OpPGvJFS3nBva9Q0
         RoqXh5qWHb1c0aYozOBPXBNSqqq8ay4/A6hBXK3CTaQOTR+dwYOX8Y9MVQgAIRlKhFVY
         TKU/ohhqGWww5U9mYO+k+5QrIMCI+OQQLFtSiboOM674lS8aLlIQ+wIZhIEe0250L+gg
         o58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784819487; x=1785424287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYpHP3NN7o6cY+8WOSgLS6195biQhMZQGaK4qqozNH4=;
        b=eE0itiPWXYBlCZP6VErteuuBiWr2s9FImbBXWcsdxlIWDZUjENv0+kpNTQAyO+wLBP
         0j0l9WC0Ql67lubb1FQrcRUAhCDSwrXdoaGTzTCvANPkfiuKVywX7Pp19tR2+n0VLeQp
         Q8BfcJYQ8I6+ZXaXVtYQqPbfyVegZenm8IRpW831/HtU6hBjGMWtGwSjusAz/4Hs1sRA
         7falgdB12bcR15A+99fWNRhLm9msZCgMXEGCqj09OVl3cjbNCEqldrUlbt2/blTmRQ2J
         a4zOhc1wyaL6BQnP9tdwM6Py0S6flofoccL6Hfz8Vwjfy8yiXwqtZuP/byujNQJH7UtH
         UYHg==
X-Forwarded-Encrypted: i=1; AHgh+RozwUOT69PnN1R890mPfYxpjiYkPgHXoLdMiMcHgBiD8tsHoUdMHfLughFaoPgCexCG8YSnD8fNkvFqehnysSt/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5EySRyljFqgpdg5rTIB6Q9q+B8rMMRQVOMXLDoGVrLZN/D7Hx
	gbQ3CYp5yf8WqqRe/yvGX3k2vQGjSOL+NTE3uKqryQf/exJlRyxnD4y/mYWxbMmYMA==
X-Gm-Gg: AR+sD126brjBvr3lhAl7rstx+U5SvFRx5QRLH+ge09X1hy2p68YiXzll3IZsQnHUjcQ
	3Z7iE5xEc7uC+zM6Ye3Sske5ANmBG8ETHgqOGIZY6xvpVqYuLJ98jdJ0oSG+y8eEqHrcyOSOa5M
	PzkyqY+N5ITIhD2raEDaqOaiMyohsFyrE/YiXYAQSgQZJVhVs0HU3P7QKGhZheQBiZhgGsLk+Cx
	5UEaZRtDz4/U4lgh5HDalvB9a7z6Qz5AjlIoASLhvKuv+B4EdQ2CSSwzXY0E638sjoLMtbbHXa9
	lgT0337WA2T0NZ42XN895O3WzIXfCizTKlbbT7USxOm+2/mvYoJ9cqUoiP1PDX2L1S5B3rZBu72
	5be+1V4hLAK+9QFb/AhHanJe6Laeeuro0yC8zxHJI3kpZTA5/cFGN+BLYQvoe56zpMAXVHTIcA/
	u5iROS1VGlGRCKMnRR+h0/fxcMCkZeI9gGEnLUlDpGt8WMTA==
X-Received: by 2002:a05:600c:3b02:b0:495:4a34:16e3 with SMTP id 5b1f17b1804b1-49573c8d556mr34382785e9.1.1784819486164;
        Thu, 23 Jul 2026 08:11:26 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm17181563f8f.31.2026.07.23.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:11:25 -0700 (PDT)
Date: Thu, 23 Jul 2026 16:11:20 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v3 04/17] KVM: arm64: Add a heap allocator for the pKVM
 hyp
Message-ID: <amIvGH7UmZRUPmJT@google.com>
References: <20260720171513.1415357-1-vdonnefort@google.com>
 <20260720171513.1415357-5-vdonnefort@google.com>
 <CA+EHjTwZftoD=D2G_1S271CPTdYhCcRwQGHYzwVS4OMLzAx-HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwZftoD=D2G_1S271CPTdYhCcRwQGHYzwVS4OMLzAx-HA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_081129_249579_44664C39 
X-CRM114-Status: GOOD (  14.76  )
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

On Thu, Jul 23, 2026 at 02:19:00PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 20 Jul 2026 at 18:15, Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > +static unsigned long hyp_allocator_reclaimable(struct hyp_allocator *allocator)
> > +{
> > +       unsigned long reclaimable = 0;
> > +       struct chunk_hdr *chunk;
> > +
> > +       guard(hyp_spinlock)(&allocator->lock);
> > +
> > +       chunk = allocator->head;
> > +       while (chunk) {
> > +               reclaimable += hyp_allocator_chunk_reclaimable(allocator, chunk, NULL, NULL);
> > +               chunk = chunk_get_next(chunk);
> > +       }
> 
> Sashiko raised this, again, confusingly in a different patch.
> hyp_allocator_reclaimable() counts only the per-chunk reclaimable
> pages, but hyp_allocator_reclaim() drains allocator->mc first, so the
> memcache pages are reclaimable yet not counted here. When mc holds the
> only free pages and there are no reclaimable chunks, this returns 0,
> pkvm_shrinker_count() reports SHRINK_EMPTY, and scan() is never called
> to free them. Should you add allocator->mc.nr_pages to the total?

Yes of course, this should be added. We actually have it in the Android version.

> 
> Cheers,
> /fuad

