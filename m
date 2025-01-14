Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC08C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkDcNJulp0KAE0ecW8Wxpxi/6ej7l7BU9iILAcZFrUc=; b=l960ULnk7NQtZv/tOTLRv6bwjB
	TZBq3JvOsgBDEqJCHXcaC1Uq87/Cp20PW8OwTR6T3DPQ3lqbmZ4d+AQL76Uy5f93Bu77Hw4/EhbE2
	bCDsjab0XPRsX0J1LPKmhtR6FZwjsz61dB0c9w6/ArP6Yt3tKroSHSH6fTwx/PL/dyzu1fFlCQOSl
	BTSegdMoYNHZcMDlh72qAxON7lU9YOZxMyFl6lOwKELYlIg8IGZjFR+p5ppm6qpDOp+cn9cqKWbjw
	NIxpezmepCzimBpbAj/rky76ME0aI9NiwAts/BPegmG7XdWDszJU1oWznp/95eHwD993FDnhD44OC
	dzzydNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeiq-00000008CXO-0UJ6;
	Tue, 14 Jan 2025 11:04:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeh3-00000008C9D-2ioD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:02:46 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-540215984f0so5847939e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736852564; x=1737457364; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tkDcNJulp0KAE0ecW8Wxpxi/6ej7l7BU9iILAcZFrUc=;
        b=yM1uXVJ00DALkScaowjxdsWIO6kzw3Srv4LvmJlpAIfMKrtNziRUKFD5uzIKcjq9Z8
         H0Sqr/sSbLHuoax1oi0h5NGuQP2tqTKGOiv+Zu7X3ZerM6y8yVfUGYQ7Px8wSjcQFe/L
         fpiqH6iW/33PVbKVE33JvGRutSqbpDsXNbrqskvM7X6LoOT+9BB8pKlDGwmR3oiIH1p7
         Meya1XHGXG7Zu1BelagaxOMv7PhCnV8adjzoInC8wCU3l/JVySJ8su0kRWFKWRPU7/z/
         07IWwlh86RaFpua6qOGx0yHX/pzHvDF4jowZK/ubhRFCOOcv3gmtK/8BxMheTsHQNtQz
         U0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852564; x=1737457364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkDcNJulp0KAE0ecW8Wxpxi/6ej7l7BU9iILAcZFrUc=;
        b=fufp+Z9y2Vh+WoV94KAGAC7zuYG38Ogy1MlrBg6gjycAHJeHYozYm9awF/unSpJ/vM
         p2RhlBY8QjNofgOda34x3N6i3Bt21OsfMQjZwU1p9+LsAFzI7zvs01+RlfNg1ZQGJetB
         ADnHfQTzEGpc/662bYBdLxexPEqBFjqgmzd3tVg+PiOFuegQe7tO3LvfWa0HW91B26yQ
         +oGIKXVXs6fddbBCXbSYOhmRYsFL108UufL61ygTe+ZxnYTVi6fcojBk06fpg1or2GwT
         05dxecDkrFUQglPZ1fB3i2s+jY5UuCE5pzmEmIZCupcFEyJKh+3ejSox4fwsd45Y3dvD
         nsag==
X-Forwarded-Encrypted: i=1; AJvYcCVpwNN3prwBodWSiE8MQ0dNRi7EVnqfzyj/b5Ly5EpPdAyjgkZKo0OEImUt2J8dsVHO2PH7h3EbyYwo8fIkjAKH@lists.infradead.org
X-Gm-Message-State: AOJu0YzBJlgVIXmzJvciqOVQ7yS5E7PgurBCzIlf4mNZZCY//VSHjtlU
	kAsOTNzisfwxMp/86Fort6wllHtq07kkIMPbT74v3MQk5RQi10qZQq5v9cg17SBR/uSzEW2P8PH
	D3Xi9POE/B69OQ1xsBv2K3ZGdppL/XWRksJ12
X-Gm-Gg: ASbGncthR8mpQjk5dEFK4YKSLLtwx+3NPI737tGlvgx7sGFQQLL7L7PXPGgM9adU364
	MKKtCeBYiTeWPcT4dEjo82q5jxzMmNlyfSABlyn/RHt/StFFSZR0hEBiudsZ+aNeIRalM
X-Google-Smtp-Source: AGHT+IFf7P01M57Y+Gqy83yzIJ8jPqDjZgPJXvExL+TT5lSQl/qu1v6b8b1aedUzQTWqMr/JTwypkmUtqg6Oh/W0giE=
X-Received: by 2002:a05:6512:238e:b0:542:97b9:89e8 with SMTP id
 2adb3069b0e04-54297b98aa9mr3302952e87.23.1736852563653; Tue, 14 Jan 2025
 03:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com> <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
In-Reply-To: <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 14 Jan 2025 12:02:31 +0100
X-Gm-Features: AbW1kvbVjib7z1JcHA7nqt52tIMjbajYXxACvsKxzNI1Rng2SxsEsnkK92Vh8CA
Message-ID: <CACT4Y+badwgw=ku--uJRWA94SA6bGXdtT+J9eO_VQxqWDxGheg@mail.gmail.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
To: Marco Elver <elver@google.com>
Cc: "Jiao, Joey" <quic_jiangenj@quicinc.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_030245_709666_D44E536C 
X-CRM114-Status: GOOD (  30.54  )
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

On Tue, 14 Jan 2025 at 11:43, Marco Elver <elver@google.com> wrote:
> On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
> >
> > Hi,
> >
> > This patch series introduces new kcov unique modes:
> > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> > CMP information.
> >
> > Background
> > ----------
> >
> > In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> > the instruction pointer (IP) is stored sequentially in an area. Userspace
> > programs then read this area to record covered PCs and calculate covered
> > edges.  However, recent syzkaller runs show that many syscalls likely have
> > `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> > introduce new kcov unique modes.
>
> Overflow by how much? How much space is missing?
>
> > Solution Overview
> > -----------------
> >
> > 1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
> >    - Export `KCOV_TRACE_UNIQ_PC` to userspace.
> >    - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
> >      - `kcov_entry` struct as a hashtable entry containing unique PCs.
> >      - Use hashtable buckets to link `kcov_entry`.
> >      - Preallocate memory using genpool during KCOV initialization.
> >      - Move `area` inside `kcov_map` for easier management.
> >    - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP`
> >      mode.
> >
> > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> >    - Save `prev_pc` to calculate edges with the current IP.
> >    - Add unique edges to the hashmap.
> >    - Use a lower 12-bit mask to make hash independent of module offsets.
> >    - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> >      modes using `offset` during mmap.
> >    - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> >      together.
> >
> > 3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
> >    - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
> >      exclusive.
> >
> > 4. [P 5] Add Example Code Documentation:
> >    - Provide examples for testing different modes:
> >      - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
> >      - `KCOV_TRACE_CMP`: `./kcov 1`
> >      - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
> >      - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
> >      - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
> >      - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`
> >
> > 5. [P 6-7] Disable KCOV Instrumentation:
> >    - Disable instrumentation like genpool to prevent recursive calls.
> >
> > Caveats
> > -------
> >
> > The userspace program has been tested on Qemu x86_64 and two real Android
> > phones with different ARM64 chips. More syzkaller-compatible tests have
> > been conducted. However, due to limited knowledge of other platforms,
> > assistance from those with access to other systems is needed.
> >
> > Results and Analysis
> > --------------------
> >
> > 1. KMEMLEAK Test on Qemu x86_64:
> >    - No memory leaks found during the `kcov` program run.
> >
> > 2. KCSAN Test on Qemu x86_64:
> >    - No KCSAN issues found during the `kcov` program run.
> >
> > 3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
> >    - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
> >      and `vm mem` settings can avoid OOM issues caused by genpool in the
> >      patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
> >      Qemu x86_64.
> >    - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.
> >
> > 4. Modified Syzkaller to Support New KCOV Unique Modes:
> >    - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
> >      Limited `Cover overflows` and `Comps overflows` observed.
> >
> > 5. Modified Syzkaller + Upstream Kernel Without Patch Series:
> >    - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
> >      or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.
> >
> > Possible Further Enhancements
> > -----------------------------
> >
> > 1. Test more cases and setups, including those in syzbot.
> > 2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
> >    and atomicity.
> > 3. Find a simpler and more efficient way to store unique coverage.
> >
> > Conclusion
> > ----------
> >
> > These patches add new kcov unique modes to mitigate the kcov overflow
> > issue, compatible with both existing and new syzkaller versions.
>
> Thanks for the analysis, it's clearer now.
>
> However, the new design you introduce here adds lots of complexity.
> Answering the question of how much overflow is happening, might give
> better clues if this is the best design or not. Because if the
> overflow amount is relatively small, a better design (IMHO) might be
> simply implementing a compression scheme, e.g. a simple delta
> encoding.

Joey, do you have corresponding patches for syzkaller? I wonder how
the integration looks like, in particular when/how these maps are
cleared.

