Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42870C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 01:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/goMiwoZ9a2nGgXHy/KgywCzCXPCOrvFLwPlIkrV3lQ=; b=Ct4Pj/SFTQKweVvMbCBoFo7Xx0
	cWGzXena496dpLD9s0U3GhO5MzoJbv4AoEBJLS5rHunkfzmHvz63iM+0Yc/OiJ3LjBMrFSuT626WA
	yItIxiSm2Q6a+C+LSk6aHxYbwQN5MsImja+mLrCoA4eISpiyB3liKcJNkZ5uFErwsVqI7pr/Gyf7/
	gUs0DdJl9AHi1DSMnjDHBSofVgvLSVidHnKucf17xu9izCQUVMxe8pqVMnVOqYJd74KH5G72MnMwh
	p+oPOzcrA/yKwJJa0LboGV40VDqbtRDlKQvG8MTylTyQVfABuu09y5HSJD5EMFyLwzyeWuXney4zB
	R19nsWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tga47-0000000Bqjg-3JuK;
	Sat, 08 Feb 2025 01:55:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga2k-0000000BqbZ-0Sg3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 01:54:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361f664af5so28903965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 17:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738979640; x=1739584440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/goMiwoZ9a2nGgXHy/KgywCzCXPCOrvFLwPlIkrV3lQ=;
        b=NcSbKHLghFS37iAyfUHSuP55YSXkH48LSblM6lyM/J+/J/6gLrRNyfONUVx6JaZRNP
         iEhYp/66Ko2Oc08dmqDFQyjlo3B5VC7BaPLyRO6WFW85g9XtfhGyzZUU1QXzTs/b3eAb
         Ho/vMo0MF2uxAluY06NZySQoDbXz8RmzmDx4NmEaWdrSygchirFHUIEZVWHuoCoR8zGc
         af7z44z3mZUtjb9qOsfD2NwZJOg1tkIOiXYCnz8N1Ze0OoRFC0oXwbZty4CjKS4/EUNZ
         +UNXaGNF5S0Amp+WfTWpkv78rmhbsNYirv5qfHgxeUG1csVFtYdmsszIFdDgpPQyUZaz
         EVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738979640; x=1739584440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/goMiwoZ9a2nGgXHy/KgywCzCXPCOrvFLwPlIkrV3lQ=;
        b=LrlR1vMccjblzqYCQwGheXF7L+H62RI+n5J0519GMYVPpaF+YhaMZb2Je1KnOwqOwn
         8/65qWsWwDqUWv3qPsGaNjKqn/Mqi+sNSv2RV+bZC3bgbvPSQjXd3gjH6rfjLk7vcEB+
         hLPJ4x7NCwhbJjOl/oQij2eNbkMVHUrgj33ElwK3JN6mBHv5eH1vElTb/3J+5jjSf9bv
         /37cGIhqA0BqSH1tTwXXdCe2Z9U/7o16WtE1svg+haOZRzvbyB3LM4mongTF7XBLwFbb
         lTaB41PyWdbOfnpmSTExvZhIMpk+70Fz0ebcexSkOoy/++raGi2jzj01cWprenBcTitA
         oRvw==
X-Forwarded-Encrypted: i=1; AJvYcCXGKBLNwfTOEIV9RqehaLRYBR+CqfzI0UqCAnfSGmLjnEk9l6EjBgKC9wKtaxpmCQLA6QwMCBeiscZ5B8r48qex@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Yd1NlayZGTPHf6Srh47YjQCm3cqPFhgh+HWDocMSsWZIR+EJ
	KtcbfgZ6SqTLp/AEYYHf6ixHgUHyQQaOqf3Jftr1rv189jt2Pwal2lV/hU5cVk/1VgE+pZcceRT
	/S2TBZdP3/SfICseplMiAPe9YsT4=
X-Gm-Gg: ASbGnct57RqS/2qzJDRbtSvodFZikU8png8aJ9k4IVNFxwz+Trnd5K8Yg7UI2XiaMW0
	VCHePaSUbnb7Y78OL/38vSVhPDK8xTwApOueaYYkr9iZMpeonekje4X3hRdfnT+b6bTOAMYwIbw
	zFWjfO/gRlYHoO0/jSYIYChm6PJFQe
X-Google-Smtp-Source: AGHT+IG9ncxhWb1JDjWrffjcJaSLE/cGisHt3doGbPXfB2uc5syeNwNjChl7mOFipKQ8YpOR06lQMAWoY36G1lYyN2E=
X-Received: by 2002:a05:6000:1041:b0:385:f0c9:4b66 with SMTP id
 ffacd0b85a97d-38dc8dec2f6mr3125108f8f.33.1738979639593; Fri, 07 Feb 2025
 17:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-12-memxor@gmail.com>
In-Reply-To: <20250206105435.2159977-12-memxor@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 7 Feb 2025 17:53:48 -0800
X-Gm-Features: AWEUYZnAQdSbylvQFKH-kduRkJgF7cpFCzktTKz3eyY2jqCF3QQ_ePHqKFyE-Ks
Message-ID: <CAADnVQL=E3F5-Uwa5_508e+OKzLnLGJGtAMhv1WW8kHobzBMgQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 11/26] rqspinlock: Add deadlock detection and recovery
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, Barret Rhoden <brho@google.com>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_175402_150136_43215186 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, Feb 6, 2025 at 2:54=E2=80=AFAM Kumar Kartikeya Dwivedi <memxor@gmai=
l.com> wrote:
>
> +/*
> + * It is possible to run into misdetection scenarios of AA deadlocks on =
the same
> + * CPU, and missed ABBA deadlocks on remote CPUs when this function pops=
 entries
> + * out of order (due to lock A, lock B, unlock A, unlock B) pattern. The=
 correct
> + * logic to preserve right entries in the table would be to walk the arr=
ay of
> + * held locks and swap and clear out-of-order entries, but that's too
> + * complicated and we don't have a compelling use case for out of order =
unlocking.
> + *
> + * Therefore, we simply don't support such cases and keep the logic simp=
le here.
> + */

The comment looks obsolete from the old version of this patch.
Patch 25 is now enforces the fifo order in the verifier
and code review will do the same for use of res_spin_lock()
in bpf internals. So pls drop the comment or reword.

> +static __always_inline void release_held_lock_entry(void)
> +{
> +       struct rqspinlock_held *rqh =3D this_cpu_ptr(&rqspinlock_held_loc=
ks);
> +
> +       if (unlikely(rqh->cnt > RES_NR_HELD))
> +               goto dec;
> +       WRITE_ONCE(rqh->locks[rqh->cnt - 1], NULL);
> +dec:
> +       this_cpu_dec(rqspinlock_held_locks.cnt);

..
> +        * We don't have a problem if the dec and WRITE_ONCE above get re=
ordered
> +        * with each other, we either notice an empty NULL entry on top (=
if dec
> +        * succeeds WRITE_ONCE), or a potentially stale entry which canno=
t be
> +        * observed (if dec precedes WRITE_ONCE).
> +        */
> +       smp_wmb();

since smp_wmb() is needed to address ordering weakness vs try_cmpxchg_acqui=
re()
would it make sense to move it before this_cpu_dec() to address
the 2nd part of the harmless race as well?

