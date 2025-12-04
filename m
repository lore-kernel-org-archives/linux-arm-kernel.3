Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7174BD1BDF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 04:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeKq3K01IZ7jHaGYfWdN8UW5kD/x33pKcQPOgi/19XE=; b=Wox8Ch4goraCBoApIHHpUTYmy4
	5eRTOYj90Hia+mwW5rsuI5PZaDI6VAOQeWvq1xLnN/bapA5KsNsWs40rO/vqBDcjJpubyhiKDT/SM
	bD99hwmzn/8ViZawEJpxY2N2RLlNFa4Bdl2dUajuNmslymwV1n0y1FMPmdEDREl4gg5iun5474vJb
	gN6kMvdAqVd5bkRl5mHGfDCpWSM8UVO+6lvKJkj28vtZ/zp+YfT+gqEqPiQvEGixVSrn2fyY8GUJW
	TT5V5Qp5Qw93yvCIiNE2g7mgj8DabzoDdzY6ZfULeymOBELCjcsB+CTy1tr2s5jvF75nkD3+Omgzl
	eWNNfMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0cq-00000007QxV-2j9V;
	Thu, 04 Dec 2025 04:07:28 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0cn-00000007Qva-27o7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 04:07:26 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7ae1c96ece1so74472b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 20:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764821244; x=1765426044; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeKq3K01IZ7jHaGYfWdN8UW5kD/x33pKcQPOgi/19XE=;
        b=BZGJIgmwKyL9/JfQLtBVi5TgycQ6W7mHevTgYhDEJMgMlREQhlgZNj7Bhr7jGnjI2q
         r8yssUvVeYqZ0CBJW/1lK3wAhFLOqJOPoWHhPb9/jCg2oQxakQoLeN00V4TGtb3oTrMO
         gNiGx6CI4GRJSwT6VwY4On4rQS3Mil5S1Nf0U+0CzgfAhpFUXq+x+pjHHKfbC2PhNCad
         FjrQhCIJr1FNasiRTsFhmSqa0hHW99hLuRKomZ52BEBhSJdM3fFvpEnVZm0laDr57+NJ
         yuF4TrVIA7sWjoubd6RRI8MWn9QF/p85Z9ZB+/bSwrohXD8ofAtU/swzSlhmWcHgBdw1
         FfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821244; x=1765426044;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeKq3K01IZ7jHaGYfWdN8UW5kD/x33pKcQPOgi/19XE=;
        b=o3pXrFqLwKO1tXxVGmYPbMl9xsZFNByKCg1sLIqRHe4oDc15BrgIwfRUOyLEz4geom
         z78zWjrmn8T4txT1MHhVJtiXilUSzBvD3Rh2u/t6df9LXuFf4ulGXEXsUM3p7k2RUgcf
         PAHteWBh490IGqMAL+AG2LPq+jPhmeuf0+FfZdDjqlawC+Q01zrdIwl3gI8DnJl7Z+mX
         /9YsOn7OaPND+/udPqXRG2rAVLr56rmqbF6zPahDVYGRQLVLYTyeDdVaa6V7EbyBR0T5
         z0Ky9Orn6zlgf31yZ+YL2gGUPlyjbIwU1j+/ASFAbXSPpuyN2662rQH5VI2wQ8bNsRfI
         nmpg==
X-Forwarded-Encrypted: i=1; AJvYcCUhj8DznpFoKfKYdEVZjHBI1+PXCzl3kOkIQ+RUkKni4UUaHg81Hl2NlslRbUL9eBwSfYlqg0q0eFv+KirEbgfl@lists.infradead.org
X-Gm-Message-State: AOJu0YzCWEH48tkQ1TsrXO4HpJw2WOEmFb9K3ZHUPHoPYTXb2oU+qR2b
	ZuUzsAfa8xQ+s4cRf6HjzjUhu4/DQ9f5TYL3QTCV6FZoaYnQGNF4VRMBdsXH45IzHwA=
X-Gm-Gg: ASbGncsDQJG+ZQhNCDAox304jVcCLK5pLej7/0hLyD28a2xrvjZ921gdXzIhrvfZXV6
	/zRc6MJyS6AyMohcIo6hkZ7SrkBr2XrH7OXZQiK6MwVzbTO+9QxFX/M4kDqZfsFUQLjtKu+fWeC
	r92l71QtaUeCU8jFZ528D8OCPxZTYtzy8W4YhD6vxyrztpRwPrg9mceFmRfiGKZQUVsjXMHUR5+
	YchzOIqXRkfcjXg+mv7+F3WjSb8bpVKsf8Fw8Vhm0XJZ9JK3iUs0/KGmfkfpMwkHr7RUS7w+4Nu
	RVZRnc0geeDahVpR/bciivR2LjmjgHPrmwJO1S93718AjQqO5mdMxl39Qb3rk5mvwNm8gFrEk+d
	dmKxwY+78T0Ais4SotdOKyenmENA3vsDSBYVfLUUwgJOtVBwfJYZKuDjhAXkAyl4YQIGnQrvBwD
	bx4ynOZ+AqMC4m
X-Google-Smtp-Source: AGHT+IFETMXBEPq1xYCaf/E7AS0knJzl97OZORYZaw66EE6vr0bBWjN/SIxbzghX4zykOuat10Iytg==
X-Received: by 2002:a05:6a00:4fc5:b0:7a9:c64d:f717 with SMTP id d2e1a72fcca58-7e0b376a0e3mr2205439b3a.5.1764821244022;
        Wed, 03 Dec 2025 20:07:24 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7e29ff6b56esm526574b3a.20.2025.12.03.20.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:07:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 13:07:20 +0900
Message-Id: <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
Subject: Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <conor@kernel.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com>
In-Reply-To: <20251127125305.89961-6-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_200725_546916_E7BF8807 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
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

2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supported.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
> diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/ri=
scv/riscv_sse_nmi.c
> @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct=
 pt_regs *regs)
>  	type =3D atomic_read(this_cpu_ptr(&local_nmi));
> =20
>  	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
> +	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);

Please document the intended preemption design for all SSE events,
because it will be a nightmare if we forget some assumptions in the
coming years.  (That includes the relative priorities of RAS/PMU/...)

Thanks.

