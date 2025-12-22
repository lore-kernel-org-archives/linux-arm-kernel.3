Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92CEE66886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 00:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJR+oepnPgn4ESTA8aZqNg4xMqQB2g84eaTDs8qEqRY=; b=1E2bjm/d/atnTbKhWJmFS8KM0H
	//0oC2B41AG4ssEnBxdrnUa6dEc3SPdqv5dBWDSFg8POELCyVvL/jAKYwlCPz+3ej+Xg+nKvDHDDu
	7P49T75A5dz3PckFbE/8Y/sYpCqVEJB+9IsaofSPfCstG4nOjLQ75U/iHnrKiqfMCZ574N9OFY+MX
	bngaLS5x+X90y10os48siaXrAGuoQcGCil6oXDXmXJtXFPzg8c7eRUM0Lu1XH2Gz5rtnAeRnmOLBU
	OopfT9nY9HM20RM0AMjgwmMECwSrXuDCK92duUdy83lRwUsTXvsMUsQkS3hxVEr5fUzHAQNeukSQB
	YY3UnKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXUCf-0000000Cva3-1oGb;
	Mon, 22 Dec 2025 00:55:13 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXUCc-0000000CvZe-1ixn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 00:55:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so2687415f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 16:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766364907; x=1766969707; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJR+oepnPgn4ESTA8aZqNg4xMqQB2g84eaTDs8qEqRY=;
        b=UQlWlZRpFypUVLzWnREFSGmM5mI7jhkJnscXfu44QH4B5yazr9G5CYlgVfnv4nTQ2G
         qiiqRNkVop1GjsqMeMIJZ1ZJ3c4y56l29FIzloqO4l8Ms5q7sj2Ioyz55fdLiJKtGyhs
         ElVMuZszGLWyA3t5mP4/vZV8hOnAUqKuUVxESFsMBLXdQ1X5IbiHtWzDie+x8X3Q9p5Y
         pLp/t2eR+cRpiYeBLchL9/Og9pwx8lG33rsN7oW/AbOU85OmddhBz0mMbrqf9a8Cyp+e
         O1A9tlQYR0HbrtP6OhuX/gS5V39VeN4eFBm5zijjAdvu9TXOjbX27aVFQM19xRifMLjo
         P+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766364907; x=1766969707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AJR+oepnPgn4ESTA8aZqNg4xMqQB2g84eaTDs8qEqRY=;
        b=XiQjRBdL7260WUc4MP/HhPmnOmwblvKWwqX4KbCGprB1q5pAMBQKMdh7WYGFxzazo8
         zReGygqeC2NzduIdU8Vdmg1LoFLcqjxyMzuWZ3z5+zgnkcghEYMs6Z0rfcFFV7W+OAPN
         gYiXmTN3k7n0yYJs/nITuggrknts7j83Ygq5eoEjnImQUjOPq9iB+7Ybhic/3YDk9ukX
         YxKrwvpNvJxFGnFM0+/FUysPTvs4x0abXZDHs8wU3G01Ibm/7Wtb8UlfbZZ+n6Qb2HXj
         9STg/WTWM2YbvcffMiQcveJ0B7NkPSlyHIESScOvMqXkY1hq7x36gv6XIOcrnVw/5RXC
         0ggg==
X-Forwarded-Encrypted: i=1; AJvYcCVzy/HZohULO4udPiEYZCbODQSYPeXtkRowD4vBjUomwyDZv1YNz97p62SLfEngmtM0kWZnQTr+NF+N1QBaEFto@lists.infradead.org
X-Gm-Message-State: AOJu0YyYuHhzZjTlASTXqDtDgUb4peInYVSlTf46dKXUKcOOEA1S2Xsi
	/PAYwe03K49pJH9LGQ7nmV8FMznwmXO1HvObjFiAJ8i5aKlwYrYNpx1cA82oX7ZHIxo+FuIrxGO
	Pu7ce0rOEvDngKOf0aD8u2W+Z6iuqnRg=
X-Gm-Gg: AY/fxX6UuhlsyNOdTzkUGN7m9VlNbX66gHlJ6GefZma3W4+xrleklb0qfLDhTmUetRo
	VKmJ67jucA14aEqoGDMy8j+/WsZLsHrlm6OOPODKWUmDLvtDyKaQauFd1+dmmIa4jH7uIMVFeLu
	MLFL0ROTgvEC+smrDH7l4D6iNQMQraqdpuJS7tyYwP/HGX6pi59Wb9cKiXQodKpVUkJ+kJbO3Be
	oh2GWZAfuXc/dzBjjRiE6qQvOrTtSWUFrlvXH/YNlxyO9JZkOt7OXRFsMOAm6mMoy0nKAAP
X-Google-Smtp-Source: AGHT+IGXo112KvGcJQYLFJQyDVh8Z25BfmkkrlbAlVE+is8DciEiIb/8FFrxOaCCHs4sJhEl2FQ8wkM0usotETFfncY=
X-Received: by 2002:a05:6000:2503:b0:431:a33:d872 with SMTP id
 ffacd0b85a97d-4324e4c1219mr8352787f8f.8.1766364907461; Sun, 21 Dec 2025
 16:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20251219184422.2899902-1-puranjay@kernel.org>
In-Reply-To: <20251219184422.2899902-1-puranjay@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 21 Dec 2025 16:54:56 -0800
X-Gm-Features: AQt7F2pipINI8bOKwhk7Vlx-Mfc7O28EOzE3UkbvfYD9eM80LDFFQDrjSkRRY2U
Message-ID: <CAADnVQJ91+B=BQ4BC02uqtm+PDerUOfYHDdVGTEbHyi+MCV6bw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/2] bpf: Optimize recursion detection on arm64
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf <bpf@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Kernel Team <kernel-team@meta.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_165510_490534_A2E0CB98 
X-CRM114-Status: GOOD (  25.42  )
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

On Fri, Dec 19, 2025 at 8:45=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> V2: https://lore.kernel.org/all/20251217233608.2374187-1-puranjay@kernel.=
org/
> Changes in v2->v3:
> - Added acked by Yonghong
> - Patch 2:
>         - Change alignment of active from 8 to 4
>         - Use le32_to_cpu in place of get_unaligned_le32()
>
> V1: https://lore.kernel.org/all/20251217162830.2597286-1-puranjay@kernel.=
org/
> Changes in V1->V2:
> - Patch 2:
>         - Put preempt_enable()/disable() around RMW accesses to mitigate
>           race conditions. Because on CONFIG_PREEMPT_RCU and sleepable
>           bpf programs, preemption can cause no bpf prog to execute in
>           case of recursion.
>
> BPF programs detect recursion using a per-CPU 'active' flag in struct
> bpf_prog. The trampoline currently sets/clears this flag with atomic
> operations.
>
> On some arm64 platforms (e.g., Neoverse V2 with LSE), per-CPU atomic
> operations are relatively slow. Unlike x86_64 - where per-CPU updates
> can avoid cross-core atomicity, arm64 LSE atomics are always atomic
> across all cores, which is unnecessary overhead for strictly per-CPU
> state.
>
> This patch removes atomics from the recursion detection path on arm64.
>
> It was discovered in [1] that per-CPU atomics that don't return a value
> were extremely slow on some arm64 platforms, Catalin added a fix in
> commit 535fdfc5a228 ("arm64: Use load LSE atomics for the non-return
> per-CPU atomic operations") to solve this issue, but it seems to have
> caused a regression on the fentry benchmark.
>
> Using the fentry benchmark from the bpf selftests shows the following:
>
>   ./tools/testing/selftests/bpf/bench trig-fentry
>
>  +---------------------------------------------+------------------------+
>  |               Configuration                 | Total Operations (M/s) |
>  +---------------------------------------------+------------------------+
>  | bpf-next/master with Catalin=E2=80=99s fix reverted |         51.770  =
       |
>  |---------------------------------------------|------------------------|
>  | bpf-next/master                             |         43.271         |
>  | bpf-next/master with this change            |         43.271         |
>  +---------------------------------------------+------------------------+
>
> All benchmarks were run on a KVM based vm with Neoverse-V2 and 8 cpus.
>
> This patch yields a 25% improvement in this benchmark compared to
> bpf-next. Notably, reverting Catalin's fix also results in a performance
> gain for this benchmark, which is interesting but expected.
>
> For completeness, this benchmark was also run with the change enabled on
> x86-64, which resulted in a 30% regression in the fentry benchmark. So,
> it is only enabled on arm64.
>
> P.S. - Here is more data with other program types:
>
>  +-----------------+-----------+-----------+----------+
>  |     Metric      |  Before   |   After   | % Diff   |
>  +-----------------+-----------+-----------+----------+
>  | fentry          |   43.149  |   53.948  | +25.03%  |
>  | fentry.s        |   41.831  |   50.937  | +21.76%  |
>  | rawtp           |   50.834  |   58.731  | +15.53%  |
>  | fexit           |   31.118  |   34.360  | +10.42%  |
>  | tp              |   39.536  |   41.632  |  +5.30%  |
>  | syscall-count   |    8.053  |    8.305  |  +3.13%  |
>  | fmodret         |   33.940  |   34.769  |  +2.44%  |
>  | kprobe          |    9.970  |    9.998  |  +0.28%  |
>  | usermode-count  |  224.886  |  224.839  |  -0.02%  |
>  | kernel-count    |  154.229  |  153.043  |  -0.77%  |
>  +-----------------+-----------+-----------+----------+
>
> [1] https://lore.kernel.org/all/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paul=
mck-laptop/
>
> Puranjay Mohan (2):
>   bpf: move recursion detection logic to helpers
>   bpf: arm64: Optimize recursion detection by not using atomics
>
>  include/linux/bpf.h      | 38 +++++++++++++++++++++++++++++++++++++-
>  kernel/bpf/core.c        |  3 ++-
>  kernel/bpf/trampoline.c  |  8 ++++----
>  kernel/trace/bpf_trace.c |  4 ++--
>  4 files changed, 45 insertions(+), 8 deletions(-)

It was applied to bpf-next.
pw-bot is asleep.

