Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E36AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=; b=C/j78YrPgf27f07lUeTx5k+nXh
	AGaaE1Td+/oAyTodhPIs6Q4Oy9KBW3So/AY7akAxEAgalFdY5XdOfWqXHhAAd3+Q2gTVmfZKqZL0V
	VAPU2i+r7+FsP/pcZFk1Z+JlCUFmlvSFzVCge1jJfGMtY2c7WU31NTHTk98PgD7GN9CRbz+PfC0eM
	hU8kImlXXflmjFJ85y/Yn0ibdNwcHdNFlQzkTLUP3IwQ/3NsbrEWFHlp5qO0VyFxCQ5og0OkR3+Ey
	/vrNnic3sRJ5blwTJydHBvxsCuvzgsyRhUCgNVfohReZvfJ0EhHPuHaVHTl3E3Ux+HnCy693KLSfN
	vLxYMXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxea-00000000N1b-3wCc;
	Fri, 30 May 2025 11:12:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxcQ-00000000MOK-4356
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:09:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4e62619afso301112f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748603385; x=1749208185; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=K/NIuDq71XG/rmc5YIhJVSgPT780dd2E1irmLc5qW9HGz9I1RRgPrak8Voy/puaUQc
         mYxKWXaPyNTew5V/lK6N8vjk3Setc67PmcVyWms203mCBTO4guBXMDmq4B6JZwCkWtiJ
         OWUWatd+kK4S55RfBtg/4mr1x/i9zSrIjhikCcJax544QspzVHY4I6r19HfAs7ofQM4q
         zCO0nqSu2LF9AzaDqm+nvmh3l+aCTYzS8jl4on7NRM0flamlDqyKvLMXDP4DOKVGJw76
         6zQAOvucgvbKuBuvN2JXMDaJCsUT/NjPlAOjtmAvxyENJRPPNuVe8CkJCYEMYdOkFyam
         taJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603385; x=1749208185;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nKHlHU74s9id5ECnlxromIqBTzfUbM5l+HheDzzqFcg=;
        b=dVYioog9oIvQ/2ZdbaC+qnju35ebwr2YHBKs2taf7lk1WOX5SMBLVqWAnfvyYlUoQp
         DP/BTPOwvm3rc8Ne2QDZclgXrVb3Y3jGGodu7+SuOyHlVD+vPuYSDbAHx7Vdw/mJEUll
         Hjl8tqa7VcdCUQAK2PruiXTNSvmbic/2OEG9Pzbwb073JiJ/r7yvVzCBjNaXmK3g1awr
         knkCYH9KXMnxAH/QOvXJWYPx0mBQnfArNgLF/LeRcw+3Iq5PCGneG1THtXTxqugpcPxd
         FU/4Bh2QQRvxTOBB/+ABkeOcaWpMYFaGYvysBJgiFq3uNV+KiOs3Uxu5lYmkZus58xlJ
         MHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkxhEdZt3K3B4uxp49a59TQscxF9Lu0UPzoWYQX1LFAZ0L+tQGsDaEhIUt/ZSVmOpXQoH3Yh+0Izb1k/pX4ORy@lists.infradead.org
X-Gm-Message-State: AOJu0YwgPO58USCo8rFMEAuushgU9AoqNVBUzXR0qpqVorOov9NIG9vc
	j/YjEF5AJ2ZkHPjyjdHt3HNB8ndf2rMUEq78iGXKDGvvyQEudsaGv3XJDzqdCxCYDXQFaB9hvOX
	1b5Rh
X-Gm-Gg: ASbGncujTf4LCghrXJwbzoxVqxa/YjYVXCQfJAcwXmSU9uKI/yajLCIARixQwKwo9cu
	oN+2qx2ySz5epvTZd2eunfYe3CrTJPvuvEsoE4z8XAKVeM9ymfB+z/U45rhw77im8BmoHP7U9+u
	acpVIdXANuK0FkvvnIU0mKHvhogphGEvPx3pZ8AuXxVYXpL7mYl6M1Gvt/TlL7DVq1AnGVxcr8w
	G50M/Ys9W0rkcxFvtXaZsPkppHb+zlr3ZUGB+DyDQj6oSEOsZR8LM2LcpZTecfmfyU6tjoJ0VcH
	vqWN6LSusUZgltIw+uuWsbo+G/X0xVhtFfNCwDUj9IziC4zxEOVG88TqWpw=
X-Google-Smtp-Source: AGHT+IHWlRXsHj8fy3YljEwKBbucuDh540moRSz1XXe7HUhMOymhGLaK6eZjYnDZtJV/6QwPDY4NXA==
X-Received: by 2002:a05:6000:228a:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a4f7ab6c2fmr730169f8f.14.1748603384676;
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:23dc:ac4e:5f79:355b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972c1sm4593368f8f.68.2025.05.30.04.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:09:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 13:09:43 +0200
Message-Id: <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
To: "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: "Anup Patel" <anup@brainfault.org>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Mayuresh Chitale" <mchitale@ventanamicro.com>,
 <linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
In-Reply-To: <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_040947_000072_3DB33672 
X-CRM114-Status: GOOD (  12.33  )
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

2025-05-29T11:44:38-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/29/25 3:24 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> I originally gave up on the idea, but I feel kinda bad for Drew now, so
>> trying again:
>
> I am sorry if some of my replies came across in the wrong way. That was=
=20
> never
> the intention.

I didn't mean to accuse you, my apologies.  I agree with Drew's
positions, so to expand on a question that wasn't touched in his mail:

>> Even if userspace wants SBI for the M-mode interface, security minded
> This is probably a 3rd one ? Why we want M-mode interface in the user=20
> space ?

It is about turning KVM into an ISA accelerator.

A guest thinks it is running in S/HS-mode.
The ecall instruction traps to M-mode.  RISC-V H extension doesn't
accelerate M-mode, so we have to emulate the trap in software.

The ISA doesn't say that M-mode means SBI.  We try really hard to have
SBI on all RISC-V, but I think KVM is taking it a bit too far.

We can discuss how best to describe SBI, so userspace can choose to
accelerate the M-mode in KVM, but I think that the ability to emulate
M-mode in userspace should be provided.

