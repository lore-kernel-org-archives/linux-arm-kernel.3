Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4BBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyd0m6/llDOLqTKGKBUszI5BSryEijFnil6SKX904AM=; b=sJmUyDs/muxJHkIn/V/AUsWdVZ
	u0hJaGHLqvgp8a7XeCvkn+Dw4RZu1+BDp4QFVeNVGd+HrQsvUfL/ZTnMAmewSEtolPMbItW/2+2Um
	2UCEOPSHmHN+hK55R3m7MIpSnD85Bv9F48izyYLq1HThag+FlMCGOVLaYJ6Jvhjyu2+qQKm0k2a2f
	pqnCCypUil3RZnl5eebJXu1+DyNgA3yuctDwe39EFgZ1mSoP1BVqU/HrTR0k40TknVvN5F8edxWq1
	SMLBQVnp8W+pXaSUb2OdzsVw93cOjVlpknE8/7+73ITimEbVSk9MO8KTlLevpNoo3kxJWBnP17e1i
	fOeO5OdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0o9-00000008DrX-20Ed;
	Thu, 24 Jul 2025 18:36:45 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0CP-00000008ABA-1KDP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 17:57:46 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2ffa81b41d7so693987fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753379864; x=1753984664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyd0m6/llDOLqTKGKBUszI5BSryEijFnil6SKX904AM=;
        b=WG/9KSX/T36PYuiholTPh7y6joNwonrpJu4Ad//HDoP806n/4mlvViBsnDWuVHKUlF
         VFQGDfl4TWn8zuyYSut1tMiBliQWJNVa/lb9Fqmy+HotdhwwsC2Yfiq6z8vKpU0thJC6
         tXIzSdKaY9Xc6olePmSWexbTHW9F5sUOro5lELvav9isXh1PpS6bAljTzmbYRqqNx2ej
         w6w9dPG0/zkVHD0rQhhRu7rL11qlYH6Q92mZTsz+GrIR+LPMVh7wrMcw0Z9Ugs2nLfXM
         ewZ3Bq84tryTzyG8lfpcvzp4+Gz7UAuD/m7wodQSnGNOspDwoV5DEBVnqfc8miMgA8dN
         vtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753379864; x=1753984664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyd0m6/llDOLqTKGKBUszI5BSryEijFnil6SKX904AM=;
        b=UgyJwGyNTqWNhsx15tFFcZbmoerlgDsyr/FG6lZ2Tr7JIMT2XZQBxvmXrD9/53dWIH
         pqrl6RESajidxXrYQSyh8pOvXDxbmDq2E50kpqaEoBVGRVfxSrFdfdpeaLlJPa/jSMoA
         4KgEKoNua+n+IueWIU7qUj5Eo1WYbfWZBt84IehQ05MSpwx36o9FvWcQF3a78u4EmJlN
         2S6r+mmpCLOBoxdwGpm/V4QYLHRbn44Aq+dmSVhxltQK82gtOqlViUlxFoOUAEToofO8
         21cfrXMu6EX85YXgcJa1fRlH2VVsu7Z0Z2kXvHZUUZIwLIVDGVswdClHbQYT/c0OF/7O
         5tsg==
X-Forwarded-Encrypted: i=1; AJvYcCVsbxm3Dc9yesfw75ttbC3T3tw0dZGeYy9PXa2qQvGtU2vSaxgFby/nAIlOsxossEIQ4iIhVGLlPbql1GFwCWFS@lists.infradead.org
X-Gm-Message-State: AOJu0YzsjBOHTh1SCKxfVWfbFMKGnNofReXSqGG0c/xXpPWPmSTlomsN
	LqCsSsn44fwrlIKUnlRpWFsUj5CVyydiQGVeUASqJ35NDFIR18p6fo8ndsy4lSqmblg+pyhftb4
	StXPYvgpWYWufNTKY9w83J45DfPZSXLg=
X-Gm-Gg: ASbGncv32x3g+VOJyC1ip0YnBTrXhUwwDToO2BQ7fu9/4Z65BZtSgc0jnTuOF8rsJ2r
	sH5vEd4Wp3lb5sRxQ98K6R6CMPoKpCoDCO5hd2ZFRugNRyGTHcVsPASyN/MamA8Cf7yf/dee6n1
	TcOapwM2vDGHAP40UyxgJx0zfd6k1tzOQ3S73mfjfkGshg8DuRZSn6kZZMMhsHGf2IyWptH4fv2
	nytCamqlg==
X-Google-Smtp-Source: AGHT+IG3/GyCL+VU5AJJltRsP0Tqqxq0Yjumuw9YfIJLpjiZLw0Gf28GIuEQWGeaaejWHUNBndHaOx9Y7PVaKw3h+ig=
X-Received: by 2002:a05:6871:56c2:b0:2ff:b276:97f5 with SMTP id
 586e51a60fabf-306c6ec5c4emr6012951fac.5.1753379864254; Thu, 24 Jul 2025
 10:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250724172603.18701-1-suchitkarunakaran@gmail.com> <aIJxVDBXyFgrz8AV@shell.armlinux.org.uk>
In-Reply-To: <aIJxVDBXyFgrz8AV@shell.armlinux.org.uk>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Thu, 24 Jul 2025 23:27:33 +0530
X-Gm-Features: Ac12FXx7y99oCagbZGmHtRkYJYdYeVHvbVt_84oh7Yoa7X7XzSgt_3Uy39Ssjzw
Message-ID: <CAO9wTFitMEzPXNqrMs7U=+M3jAghZtO1iXYbw5YBL1bwpB_Ecg@mail.gmail.com>
Subject: Re: [PATCH] arm: allow single CPU configuration by adjusting NR_CPUS
 range and defaults
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: ardb@kernel.org, linus.walleij@linaro.org, ebiggers@google.com, 
	nathan@kernel.org, lumag@kernel.org, dave@vasilevsky.ca, 
	ruanjinjie@huawei.com, kees@kernel.org, liuyuntao12@huawei.com, 
	linux-arm-kernel@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_105745_362435_C4FEA822 
X-CRM114-Status: GOOD (  16.67  )
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

On Thu, 24 Jul 2025 at 23:16, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Jul 24, 2025 at 10:56:03PM +0530, Suchit Karunakaran wrote:
> > Previously, the NR_CPUS config for ARM required a minimum of 2 CPUs.
> > This patch changes the minimum NR_CPUS to 1 when SMP is not enabled,
> > sets range to exactly 1 if !SMP, allowing only a single CPU setting and
> > adds conditional defaults:
> >     - default to 1 if SMP is disabled (uniprocessor)
> >     - default to 4 if SMP is enabled (multiprocessor)
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> This hasn't been tested. NR_CPUS depends on SMP, so if SMP is not
> enabled, then NR_CPUS doesn't exist in the configuration. Therefore,
> providing a default for !SMP is meaningless.
>

Oops, I think I misunderstood the intent of commit
278d1ed65e25d80af7c3a112d707b3f70516ddb4(cpumask: make CONFIG_NR_CPUS
always valid). And sorry for not testing it, I wasn't exactly sure how
to test it. Could you please point out the issues so I can fix them
properly? I appreciate your patience. I=E2=80=99m still learning my way aro=
und
kernel development and trying to improve. Thanks!

