Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61989C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt/WotSflPJ7SfOyz8ZoSm3HZ+oIFTYVnelZyMiFwPg=; b=N4ZAZpK1wGYvJpMoZ3CifH7SfD
	0EExsepuKg3jNhJrfUbiBt0azLQGMV+GWFF5unnrTIfYqV1o9U5wECz2juKEaBqa85L5YR1NV/I+/
	Blu955i4FvutkyvokLYJE4a8MwSFoECEd8NXAz5bMU8/ZWtqF4e5DN2uv2popRjCeLPMgikosrcX9
	I2qFoLOOPPAVSGBOk1JMa4/QhmkhmyZ8Xwr4ylH3qp6VPxY0VYCXiTW+ACEVcFQvXQ6RzJt54C5jT
	tMCsI6GjLy6yeBJl0+oRutkqVISgLtpXMxb7aM7DOtMM8danc/TElqnr+6TBpUm9qULK30uIcL3Vn
	+hNVqugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqRsl-0000000FUdG-38l8;
	Sun, 02 Aug 2026 08:49:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqRsj-0000000FUd3-485q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 08:49:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAC9460A64
	for <linux-arm-kernel@lists.infradead.org>; Sun,  2 Aug 2026 08:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494F91F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Sun,  2 Aug 2026 08:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785660556;
	bh=Lt/WotSflPJ7SfOyz8ZoSm3HZ+oIFTYVnelZyMiFwPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dq3nO3rQWlCrsB/MsrkWLhwP9IllERjg4H9AECGR4P78rEu4d0rg9G3Wl6BwGwvwM
	 W1BPgLMCKWgsIyUBV2v/aJZ4YLt4QV1dD6tR+61hX0grg83r68cg/y4k4g82Mu8KVE
	 9eFSieLjpPUQtFrWltKJifg7LMQtKG0i/jN5vIAFYtUuSk6aeeXCXcfJTG2XnMGzCU
	 UjGZ+/dDKrw+atKD6hrBzdJM7VB3ZN6GwvoYZhHJ2IoZy6elY+ypyUueEvd1ILaXPd
	 sPn+i/UBSXeV3+kEbTGY1C9E8R5D52MswUfR1Gz3WrwstE/yoF1wAlwlrihMIfa1dF
	 vdIeqJgMQhhTw==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e512a9a6bso128291885a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 01:49:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrybKGtcKeTPPr4dxPxRZ0mmD7jGcrXQj6Jz5dUGuTkX2TerRIYYPvGcXM/ZujPpHrAMpXBs+FXFCwpDoLfda5U@lists.infradead.org
X-Gm-Message-State: AOJu0YzgNUwo2JtW5hhaRNFeWLnaxg+H/1wcDJg8lzuHG8Y1ZOClCAOY
	v4NYDBs7+Up14SekYccK8fRXh03o1HZhM0DjVSbBZgNEfHLGwxP2D1vooBvXhz7KwUiYMN9V0rf
	pFhlBOrCo18uCcnT+KvCV8s2VIOYgWQ0=
X-Received: by 2002:a05:620a:3987:b0:92e:e376:cf97 with SMTP id
 af79cd13be357-934a0acd7a9mr769036085a.44.1785660555581; Sun, 02 Aug 2026
 01:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260802074018.73887-1-baohua@kernel.org> <20260802074018.73887-3-baohua@kernel.org>
In-Reply-To: <20260802074018.73887-3-baohua@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Sun, 2 Aug 2026 16:49:04 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wLG77Y5r9Dy6QOqgmjNM5W1E5aGqKyJb7Bp3WGemNFmg@mail.gmail.com>
X-Gm-Features: AUfX_mx5OHWyntVSVER1sCMf_W6pihUsx09VgYnLvBQglt_q0gIbFInfOzX4OmQ
Message-ID: <CAGsJ_4wLG77Y5r9Dy6QOqgmjNM5W1E5aGqKyJb7Bp3WGemNFmg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/2] arm64/mm: use VMA lock for kernel faults on
 user addresses
To: akpm@linux-foundation.org, linux-mm@kvack.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, surenb@google.com, 
	liam@infradead.org, ljs@kernel.org, vbabka@kernel.org, shakeel.butt@linux.dev, 
	david@kernel.org, linux-kernel@vger.kernel.org, zhanghongru@xiaomi.com, 
	willy@infradead.org, zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Aug 2, 2026 at 3:40=E2=80=AFPM Barry Song (Xiaomi) <baohua@kernel.o=
rg> wrote:
>
> Use the VMA lock for kernel faults on user addresses. This also
> makes the existing code below meaningful:
>
> /* Quick path to respond to signals */
> if (fault_signal_pending(fault, regs)) {
>         if (!user_mode(regs))
>                 goto no_context;
>         return 0;
> }
>
> Right now, the code above is dead because !user_mode always
> takes the mmap_lock path.
>
> Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
> Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  arch/arm64/mm/fault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 85e23388f9bb..241f1ab07ab3 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -607,6 +607,7 @@ static int __kprobes do_page_fault(unsigned long far,=
 unsigned long esr,
>         unsigned int mm_flags =3D FAULT_FLAG_DEFAULT;
>         unsigned long addr =3D untagged_addr(far);
>         struct vm_area_struct *vma;
> +       bool uaccess =3D false;
>         int si_code;
>         int pkey =3D -1;
>
> @@ -663,6 +664,7 @@ static int __kprobes do_page_fault(unsigned long far,=
 unsigned long esr,
>                 if (!insn_may_access_user(regs->pc, esr))
>                         die_kernel_fault("access to user memory outside u=
access routines",
>                                          addr, esr, regs);
> +               uaccess =3D true;

https://sashiko.dev/#/patchset/20260802074018.73887-1-baohua%40kernel.org

"Does this conditional bypass translation faults? Because this block is
guarded by:
if (is_ttbr0_addr(addr) && is_el1_permission_fault(addr, esr, regs)) {
it appears uaccess is only set for permission faults like CoW or PAN
violations.
If a kernel uaccess routine accesses an unmapped user address, a translatio=
n
fault occurs, making is_el1_permission_fault() evaluate to false.
Would this cause demand paging in uaccess routines to fall back to the slow
lock_mmap path, missing the intended optimization?"

Good catch! I should have only modified a single line. Then
unmapped PTEs would also benefit from the VMA lock:

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 85e23388f9bb..e1b406d667aa 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -674,7 +674,7 @@ static int __kprobes do_page_fault(unsigned long
far, unsigned long esr,

        perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);

-       if (!(mm_flags & FAULT_FLAG_USER))
+       if (!(mm_flags & FAULT_FLAG_USER) && !is_ttbr0_addr(addr))
                goto lock_mmap;

        vma =3D lock_vma_under_rcu(mm, addr);

