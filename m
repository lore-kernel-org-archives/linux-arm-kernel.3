Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9152FF9936B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=; b=cYtAFQDmLF0qcn0h7q01G2+EWn
	WZlWwTZb/4cVMkvmF2zYDQlAyss7hNlw8Eb3xgGutckoP1TwcnKOl41hBomcHAsEj6m3+x5xi2dLX
	7TJxWa3Ck5B+iA50N9O9mVS67DtSKskJpxR8nWC/8+BdJrFhPxuFyWnGTy1qmujYW2t3UdRpGPw6w
	8BeRf7qxq7OYLr82Tad2BfsXUnraTlhCFsTTxK0ynwteOmcu1F0ToNjbwgTJ55HDCIRX+5fza9S7R
	1/+ILXIScYbO8ELDy/xRZw8SdQB3Vbp6kPAWno0qYna9SQZSBV7UL5BZXqRJEfAghxYCEwfTKveEx
	F88ymBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrez-0000000BVKr-2syh;
	Thu, 23 Apr 2026 10:51:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrex-0000000BVKL-3MAd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:51:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so11697561a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 03:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776941510; cv=none;
        d=google.com; s=arc-20240605;
        b=LS1JMGK218ITWw9gAQGwE0dX4B/3dbjVeNd6GJZtB0rgbBgMa46DkA5LX7C5yXQu1z
         /m3pgK9DVFJRlsJZr7MM72buV3Dh79qBN1dIMnPkJBzGiqfMl28nFNUslFQ+bzRwf0Vg
         ajNFUYgvA/vKbLuZ66swRhsg19NZsR/kqcl2U60oxzZVqZpUqkJrOr/5YASH0eVbL9l6
         xJDdwswqp8hk8LKynO6u4bA0u9WVhWsZc/yFa5vE1GuWKwFAOA8Nur69SYSY1TbvX44z
         MjQ4GHWBPbdFhzZOm/YCJyY6V1Umn+qfXyQi4u+22NfAVHXA1f+bR4zuUJsIFMw/obA6
         lhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=;
        fh=LniZeSFfxY9juorVuS5W3OhGyAPj82vS7t1WGzQnN7g=;
        b=Xr3bq2vXvaAB/H1CXnP1d8pMdtrKzHgYBpkuE8Hmel3WDDBMkREO26aFpiauQodU6D
         UuAaztH+F0w9irA0gNaNfcyLEg5d3y/qBaXmDlrP/H3O5xX8Coawpzzv6sfRGyKspL8N
         P9m/6kRlxyl8i5AUG+JZR5zZ+L1HTmTRkqDNIdFZ4OTffW+UeuogjPFNdszMTcvZ3TnR
         Mkbxt7bvM1Fu+smXBFoQIlSKhHuElcYaYOsnaiDzl/+J4HT6Xgi4J+5uqEJ8+rN9hOaS
         7cSJ0IhgfXlcVrArWEffi93U44rOP9a0koWtpU7/Z6Xt7TVXNedREZ2A2DCO6+oKlFLj
         cZFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776941510; x=1777546310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=;
        b=kyZ6EiF+UCKWbiLfrGCXg9Agwav7WNgyGKNTVwQtNsxG6jAiJTB2/fNTO5XJu9GXAX
         OffGYkkV7EfprJpsu24CCVZOjzMVXgS18qEQvYIKHIgsngv5YJBSS70YmyBuqCJeuHWi
         N/UCRRp0qUb3rrRdkE9Wqfwqn04hOjhdbuCsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776941510; x=1777546310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4u0NLqUbLY9OPqLjh5qipvi/NJ3ZqeW6p4Eergru/hM=;
        b=Nj9NMxQp0j4jN3JVooSLwam9OJ0w3UvNGiS6kOMqMRhhNRCVRdf9/fugBMlQAsygVn
         gqJ3nTG7v93RMkHaoc21gBeJ1+1bdo8882Bte3bWSEg0rCBShAvESDiFrpAz0EgRDVnl
         RgXlyptTtgzsPEMlO+gMX05U+Fg7BCTyM19eI8SQ6D6VOT3cRJUd64/FNmiq09yIlIcw
         Yz/UhZVb+0/9E+91i/kaROSIEAWSoPNlxrLxH9PUj5JV2IJJzlb85g+yYO2qx2Tx9Ch3
         ySL4YLB+6Y81223Jun9QW+Ku8Ur83umg/iAi28047ra8mXFVjfxWlHcCRWymlAwN8wEm
         DHtw==
X-Forwarded-Encrypted: i=1; AFNElJ9MvnZEglsE/V1OtsNAzHfFu1NcmA6/NfOzg77Z51FbrHKCLLYNxbR0rYoo99ciVx9Noajm6jpEfWq3WQ5JLYKB@lists.infradead.org
X-Gm-Message-State: AOJu0YzFhmXR22zhfhnjJuyxryTRiqPW5DnmZA2MPmVoq5JGKC9aewLr
	AQpgrjvIhab3OEJJrAWAMI21l6aPHrduSolqU/opHPlfTPi7STSsjRCQ/G03X5k+7Fszi8b5uz6
	4D//BJlPNMkAukWsxC0CpPj6JLxjn36sSZKEapH0zAA==
X-Gm-Gg: AeBDietSZSz/l51yaUFca8yj37TSNXnU5FRfuORXwYfJxA6VbavJK/j2M0NdYpSPciH
	7jFk3tBOUTZRPyC6WYYpAg8VtE1YWGPCbsgzNj6FzjnX5b+v0ajYhj+SeFthG/g592+earj/JoY
	HGsCL20gY15qR63ITViOPpSyppXbGj05pGQ47QUwrAyWMqJsdobl/Qv3B2WfKIkZ7Jlz/lenhCg
	RdDU91F2FTb4oIJ0aJNiLE7U4LQqfgdI1DGm4nOUSCtpJUTkuJP6iZdvRY697CDwqnVOO9G1A1f
	j4gbuusvwLqo8ctZ7xu3R15+udc=
X-Received: by 2002:a17:907:6c0e:b0:ba5:216c:56e6 with SMTP id
 a640c23a62f3a-ba5216c6068mr1253044166b.0.1776941509520; Thu, 23 Apr 2026
 03:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <87ik9i0xlj.ffs@tglx>
In-Reply-To: <87ik9i0xlj.ffs@tglx>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 12:51:22 +0200
X-Gm-Features: AQROBzA3iSwpg4ayUbVJtTBbvtVziiX6iVRBdfeBowQbJ9gb9fUCrFN004zqE30
Message-ID: <CAHnCjA0UBNXfjHw=Y34OrAyGRNUtVF+zWd3ugyX6pd_mCk8K9w@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dmitry Vyukov <dvyukov@google.com>, Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_035151_854120_7EC00EA1 
X-CRM114-Status: GOOD (  15.18  )
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

On Thu, Apr 23, 2026 at 12:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> The kernel clears rseq_cs reliably when user space was interrupted and:
>
>     the task was preempted
> or
>     the return from interrupt delivers a signal
>
> If the task invoked a syscall then there is absolutely no reason to do
> either of this because syscalls from within a critical section are a
> bug and catched when enabling rseq debugging.
>
> The original code did this along with unconditionally updating CPU/MMCID
> which resulted in ~15% performance regression on a syscall heavy
> database benchmark once glibc started to register rseq.

Just to be clear TCMalloc does not need either rseq_cs to be cleared
or cpu_id_start to be written to on syscalls because it doesn't do
syscalls from critical sections. It will actually benefit (slightly)
from not updating cpu_id_start on syscalls.

It is specifically in the cases where an rseq would need to be aborted
(preemption, signals, migration, and membarrier IPI with the rseq
flag) that TCMalloc relies on cpu_id_start being written. It does rely
on that write even when not inside the critical section, because it
effectively uses that to detect if there were any would-cause-abort
events in between two critical sections. But since it leaves the
rseq_cs pointer non-null between critical sections, so you dont need
to add _any_ overhead for programs that never make use of rseq after
registration, or add any overhead to syscalls even for those who do.

