Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D78C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCUdSZJKo+DfCb7L1u9uIyzdzgr+hzjdGkAPqeN8dwI=; b=NvNq5nCJxXI8qkxg303AAl5dRl
	FW2wRsIcKpWSKeLMCps/3aqldoyp+mir+nXfRg7yJwUBm7+PQQp1cOaGKRWonnJotHm7YMPb/uuUi
	NGGudHtX4fWHbHJr7JLEUMj9k2riCU2nWyuog78z0VeNr097yWux/YyE6b4bB12B8M6NggsgQvHMA
	sf0tILhcu2iVLxp7AbJFLRt2hhBSSCIEsuWz/INGIlntdh7IWhV3w6Z/cULewSqHhAzhZ5c0RanD8
	6u3r9MGvm7qipeUJbBMZXoMscXwATt2kWstoSywyjko0CLmXgqas2bhxIAan2+OkWg0AeAH1M+aw3
	hYVXO67A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u06mD-00000007Lh1-0bHa;
	Wed, 02 Apr 2025 22:41:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u06kR-00000007LZz-0EFo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 22:39:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2240b4de12bso4545235ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 15:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743633590; x=1744238390; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCUdSZJKo+DfCb7L1u9uIyzdzgr+hzjdGkAPqeN8dwI=;
        b=XVlyGic3Za7e8PpMJPms5N50YgSurmgWWfGvoANNqXGXpKXqDe77OWyakpa9u0GBdM
         X+V2lrosL4yQUFB3aQkPoA+xCqBgvJnB0RvXbc/Xv6Py+/PXa4J3MHA+ZF4HSk4EOMcE
         nEeZvK784BCxIxmp3AqLm+dzTsMHiVzNUvzel7x/ziFk9aO1SztcYDKc9ab+GpNMQQqy
         2RsfzFERcC4KSBs+1pQa2rF/ALHBJC5GHka83KFS84Ua9idsvEmg5KCUbNgjq3Yhq+yv
         RuyNJ1JFO5GBZnY8WmCRUY6n6YhxVf2LpAqCnS1ubb9eNClhO8B/wrXNci5Fz6qegcrq
         QPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743633590; x=1744238390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCUdSZJKo+DfCb7L1u9uIyzdzgr+hzjdGkAPqeN8dwI=;
        b=AWFQnZr1R2bF5TL1YelJeyoezM4BxQjLtBYm9ZFUi/tZThm5RM8Nu33BW81fk75quR
         WQYQB4g6Q6hYW7ZsgHBBjeCmBXnV+6YF4R9PlBuAMk/L5ChsRBAk9WwidMA7pBi+Kuvd
         uu1ceqeHgQS0eUz0dugLVKY768lnxrzmo8xZIN/lHifhIE16WQLA4PjQYkrwV+BJtLKE
         X8pZzilD6fqRjgSE+0hvvL6uvWiteqjlLsnXknJRHXqB2cPAcKshirMi2uSL+qvtIc2p
         FOVYzv4kRRwsyMjVQdFFUB+Cb8K12GSeTbtyUrQLk1AzcK0uMyCfus5Z1XE7/VMpueD0
         wf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnwdiP6ajX6FZpXuHe/ZV4+xOgIdxuM59fBt2yBdd+HaBGDq5qPovWaZVjFlAMP8BMudGEpZo3tZU5AG0wYyGQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzyDjZ/i8evlJ8I9v0WjWkLRMLQhavmUmsBC3b4GCqQ4jvSK45c
	c9Ppw02zGcAtnTsDfJYxWahv7Uz0JHgo774e6wmUNzuUrhAafhlUXS9A0MOkvkTsvFQWLueNjdv
	QzA==
X-Gm-Gg: ASbGncsExMz9arqEj2/BJWx54fn9TIlempM4/VSap/qtnFMbgRWp6CRt19AKPV5m812
	9dIAmn5M8Ry8tdzmtQNpkLzkrG3iRX7iYaCAnsI+fShqwtAZiMge6s+wNe9E2C7NkvrqCf6Gv3R
	PGekLEgiO4WWJGJOBbsWTrkf+YlNsj8ArzehyM3sZA123u274ljz3c7MwfTyh5+0A4GfM0oJYoZ
	FevDo6B2U+nOwIi+lmTw0BxbAIuTNwgbj6fktEg43pI+DRmqdMOCG5nq5y0TM4cTXkttZZjCYuq
	NxjJyaA/eD8bveciZVQXoB3Ktl+lBOPyP/gOru2lkIYEXA+JNUgmDU/MT4OjDd7FqFhMGQtnCjV
	RSC4SpK0u0hnmcWc=
X-Google-Smtp-Source: AGHT+IF4gwMOCkgD1NLc9h9zDKSDNadcDgyOK8y59bXpjfWPpkP3E5OcoZpIKL40ijcRHOF0nPIbcQ==
X-Received: by 2002:a17:902:b683:b0:224:1609:a74a with SMTP id d9443c01a7336-22977deaf3cmr4975415ad.34.1743633589886;
        Wed, 02 Apr 2025 15:39:49 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866efb5sm921995ad.201.2025.04.02.15.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 15:39:49 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:39:45 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: John Stultz <jstultz@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	tigersoundkim@gmail.com
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
Message-ID: <Z-28sR02GhsNMnlg@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-4-willmcvicker@google.com>
 <CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
 <CGME20250401163914epcas2p1a16e2b7a6ecac9f010ef6eb4c8efc6fb@epcas2p1.samsung.com>
 <Z-wWA-46L08V89qK@google.com>
 <Z+yh2UUwxUz/vRbK@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+yh2UUwxUz/vRbK@perf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_153951_092829_747D0C06 
X-CRM114-Status: GOOD (  26.33  )
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

On 04/02/2025, Youngmin Nam wrote:
> On Tue, Apr 01, 2025 at 09:36:19AM -0700, William McVicker wrote:
> > On 03/31/2025, John Stultz wrote:
> > > On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> > > <kernel-team@android.com> wrote:
> > > >
> > > > From: Hosung Kim <hosung0.kim@samsung.com>
> > > >
> > > > The MCT local timers can be used as a per-cpu event timer. To prevent
> > > 
> > > Can be used, or are used?  If it's an option, is this change important
> > > in both cases?
> > > 
> > > > the timer interrupts from migrating to other CPUs, set the flag
> > > > IRQF_PERCPU.
> > > 
> > > Might be work expanding this a bit to clarify why the interrupts
> > > migrating to other cpus is undesired.
> > 
> > Let me dig into this further to figure out if the IP has a limitation where the
> > interrupts need to be handled by the CPU the timer was triggered on or if this
> > is just an optimization.
> > 
> > Any chance you know this @Youngmin?
> > 
> > Thanks,
> > Will
> > 
> 
> Hi Will.
> 
> Yes. In downstream, we’ve been using MCT as the clock event timer instead of the ARM timer.
> Setting this flag allows each CPU to handle its own clock events, such as scheduling interrupts.

Thanks for the explanation! I'll integrate this into the commit text.

Regards,
Will

> 
> > > 
> > > > Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> > > > [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > 
> > > thanks!
> > > -john
> > 
> > 



