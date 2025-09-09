Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7EBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=833QCxEdhL0JSxB6O316FiCLruN7/IzPCiKaaovTmfQ=; b=sJGhnieBXs8lXt9pZNH7snTNtA
	QJbXvP48Luuct2CSzbV/12iJiZ+d/BBgcaPmauq+67hNFohdxw8xx8ngRBDpbFXt5di1AXslqtnwj
	crFHt1E7JQwSoGZde5gYTxAvHTVayk0XoQll+SyFJmI4IJ77MgilKi6B+TFWbLZNV1omaFYsNU9A7
	YlldxGfpryVLrE2b54yi0aTz8YH6LyhOP3kgU5C/TDYnyQMKOZ31YngooGB50pRTYdVNmXjB0aFwu
	MQ30vgoLndtK2nvV3K0Mq8vT7fLLQeYv2K7ceQ+uMsrwIOmYDCisSuRXn/h9e4EG3WL6+xMBfftsP
	e0cBPbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3cZ-00000009b5i-3qD3;
	Tue, 09 Sep 2025 19:03:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3cY-00000009b4p-0fmn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 19:03:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45de2856648so14365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 12:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757444592; x=1758049392; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=833QCxEdhL0JSxB6O316FiCLruN7/IzPCiKaaovTmfQ=;
        b=eiG0S2TR+jc1RrxcTQEWHu0Ur2dZvv+kG3ZZ8YN0FNk9hDs/nMgwoHRj5jRBDTthLh
         /GRXcTnS5+FXZzoLytQ0N57UBo3dZmDED+XFCTWvB/PlBf59qr5ndtPwMhpucU+ECDBL
         oDu2gpgW7zzKo8RsaqQHW+mzDSdycTkFTGziLlxkKFRbSx5JvBGZw7geZcwZBXY5+4lH
         Q3QR+BUMnBbP3nD8vkbYnIbv9h2kAa3eqIY9pE/TroLDM4X437tSmojGlLVJQfzmKF6x
         9nGaFeQbcZR5RomkWzJg5YSGMDNZCfXJYOrQj8XYx5wA904UblssyclM8Immi/uw4FUo
         Hkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757444592; x=1758049392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=833QCxEdhL0JSxB6O316FiCLruN7/IzPCiKaaovTmfQ=;
        b=Z+Qvp+d+NsFSk/wn6e9Bs4k52OUpeCxlZ2JwikxzQnoNo5t7GkiB22hV6CHj7dynEt
         65tSfaVq+iMCtf15/sw6kWvti3JOQBv8Jln1S61AxI2eYxVALpaXIDaHHk/x/u4fqyDf
         eSXF25Uc6z/tLGBG96FJ4tSKFvX8HyaGWxdBJUywbkRndfkDhqR+u3eNnpDSvR29SJ0e
         /rHcgZtIT+fPawDOxth9z6EOcXDGWa50RupP+w4AaxFbV4K6mukSKzkinY624uSr6/7n
         RlAqmXi2lZ92fNXfZgBJMGGWfUm8VsVFJaJEa/Net2vM/V65DUTl7Ke/k4AVlsMdRpvj
         rToA==
X-Gm-Message-State: AOJu0YwI5uTxLxqXmn1N1BZFwlxHPVq4VjbHz5+XsCr/c4KCYXPkXq/l
	Nsf8XMPy1hqTBUBTLQMfOAoXRp08+dLQ3nqcz+7xEwsabh1XCo3SHcxGEMiG5OxPPXxYHwvHWvS
	hi5jUEQ==
X-Gm-Gg: ASbGncv+x7nW7eR/Fm9xRHhPRInUFlBX7wQiveycF/NQ/46gg1Yp6rXOeBE76zBFKcI
	dJu1Ngl7WpT9csUuq+pO1kXfzvu4NWP9WfN0X5j/W627HrCkyUjYPPel8WbLlyAFiNNkebhke7G
	71Ga+8NrVyHfGAJO/Ibx7CAVD7qzOM1pvx6EtPkga8kiYB2xOopWqbK0eeOTuY5r1IDZm/8j6+K
	Rb7P1ng0WXiG6iZKSr5FJe/k59eZNQUF3Mhp5JQ6q/gChGxYzZua+UvRLoOfxjL3giJDQgKhrXA
	VTQ30Q+W9zDt9zd6C1ds3jjNL6HrdWwHSufPGZD1v+gZVsBqxvXpNZvdjlU2raNNJwRKcnYvF+p
	2u91beGfjTX9YAQq4sGYBYUly1Ucqv0bApVaKENqQnC1r7/yYQYcLfRi51pYttykKh17eRywEU1
	RJoA==
X-Google-Smtp-Source: AGHT+IF/7Gke/uEJRI8ZanBW5R1zgvfkJ5RRqnaXdfg0LKuZIsEThOsZZRdKhI2pCuXyyI5lT2W0qg==
X-Received: by 2002:a05:600c:5c3:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-45df73eb3a0mr156745e9.0.1757444590528;
        Tue, 09 Sep 2025 12:03:10 -0700 (PDT)
Received: from google.com (26.38.155.104.bc.googleusercontent.com. [104.155.38.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223ea47sm3592410f8f.46.2025.09.09.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:03:05 -0700 (PDT)
Date: Tue, 9 Sep 2025 19:03:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk@kernel.org,
	alim.akhtar@samsung.com,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: Fix for CONFIG_DEBUG_PREEMPT
Message-ID: <aMB55Rhn9M_DvBab@google.com>
References: <20250905162446.88987-1-smostafa@google.com>
 <CADrjBPqH==y5KaN6oBnGJ8407gx31sGVEFqqNdz8NG_vPuNPYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqH==y5KaN6oBnGJ8407gx31sGVEFqqNdz8NG_vPuNPYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_120314_225556_6E225CEE 
X-CRM114-Status: GOOD (  23.78  )
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

Hi Peter,

On Tue, Sep 09, 2025 at 12:14:51PM +0100, Peter Griffin wrote:
> Hi Mostafa,
> 
> Thanks for your patch and bug report, it's great to see more folks
> running upstream Pixel 6 :)
> 
> On Fri, 5 Sept 2025 at 17:25, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > Booting the kernel on Pixel-6 with `CONFIG_DEBUG_PREEMPT` prints the
> > following WARN:
> >
> > [    0.784187][    T1] BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> > [    0.784328][    T1] caller is debug_smp_processor_id+0x20/0x30
> > [    0.784433][    T1] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.17.0-rc4-gd69eb204c255 #1 PREEMPT
> > [    0.784439][    T1] Hardware name: Oriole (DT)
> > [    0.784441][    T1] Call trace:
> > [    0.784443][    T1]  show_stack+0x34/0xa0 (C)
> > [    0.784453][    T1]  dump_stack_lvl+0x7c/0xb0
> > [    0.784460][    T1]  dump_stack+0x18/0x24
> > [    0.784464][    T1]  check_preemption_disabled+0xf8/0x100
> > [    0.784470][    T1]  debug_smp_processor_id+0x20/0x30
> > [    0.784476][    T1]  gs101_cpuhp_pmu_online+0x40/0x108
> > [    0.784483][    T1]  cpuhp_invoke_callback+0x188/0x2d8
> > [    0.784490][    T1]  cpuhp_issue_call+0xec/0x240
> > [    0.784494][    T1]  __cpuhp_setup_state_cpuslocked+0x140/0x2c0
> > [    0.784499][    T1]  __cpuhp_setup_state+0x58/0x88
> > [    0.784504][    T1]  exynos_pmu_probe+0x2a4/0x380
> > [    0.784508][    T1]  platform_probe+0x64/0xd0
> > [    0.784516][    T1]  really_probe+0xd0/0x3b0
> > [    0.784520][    T1]  __driver_probe_device+0x8c/0x170
> > [    0.784524][    T1]  driver_probe_device+0x44/0x140
> > [    0.784528][    T1]  __device_attach_driver+0xd8/0x180
> > [    0.784532][    T1]  bus_for_each_drv+0x90/0xf8
> > [    0.784536][    T1]  __device_attach+0xa8/0x1d0
> > [    0.784540][    T1]  device_initial_probe+0x1c/0x30
> > [    0.784544][    T1]  bus_probe_device+0xb4/0xc0
> > [    0.784547][    T1]  device_add+0x4d0/0x700
> > [    0.784550][    T1]  of_device_add+0x4c/0x78
> > [    0.784556][    T1]  of_platform_device_create_pdata+0x9c/0x148
> > [    0.784560][    T1]  of_platform_bus_create+0x1d0/0x370
> > [    0.784563][    T1]  of_platform_bus_create+0x234/0x370
> > [    0.784567][    T1]  of_platform_populate+0x84/0x178
> > [    0.784571][    T1]  of_platform_default_populate_init+0xf0/0x120
> > [    0.784579][    T1]  do_one_initcall+0x68/0x2d0
> > [    0.784585][    T1]  kernel_init_freeable+0x2d8/0x358
> > [    0.784589][    T1]  kernel_init+0x28/0x168
> > [    0.784595][    T1]  ret_from_fork+0x10/0x20
> >
> > As this value is only read once, it doesn't require to be stable, so
> > just use "raw_smp_processor_id" instead.
> 
> Can I ask what baseline you are running when you see this warning?
> 
> As this code got refactored recently in commit 78b72897a5c8 ("soc:
> samsung: exynos-pmu: Enable CPU Idle for gs101") which is present in
> linux-next but hasn't made its way to a proper release yet. After this
> patch smp_processor_id() is always called with a raw_spin_lock() held
> (so this warning shouldn't fire).
> 
> I just built next-20250909 locally to confirm, and with the above
> patch reverted I see the warning you mention. So in summary I think
> the issue has already been fixed by the above commit.

I am on commit

commit d69eb204c255c35abd9e8cb621484e8074c75eaa
Merge: 68f285e26478 9b2bfdbf43ad
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Sep 4 09:59:15 2025 -0700

    Merge tag 'net-6.17-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net


Which doesn't have the commit you mentioned as it is in the Maintainer's
tree, thanks for pointing that.

Thanks,
Mostafa

> 
> Thanks,
> 
> Peter

