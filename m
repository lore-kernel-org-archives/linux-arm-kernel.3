Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F90D4660D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EpbTbJbIYQW2HGVw5tfKbZOFlETWSnwKBDBmcbacs/s=; b=kQvohN35rfyyFYpD23nsUGTJqK
	bviqfZ1fqeV8LCVH5IVb0oIHRvi6bKKHGt+NLoZCoRcSL20cOE0jJr7e/QIA5b24ODG9RDSZOeQF9
	mueffruLguqmv6zyvyFRJr8hO6nLw6TprB1ZWL52hVfc3+T85qUOTnAj9pm6KnFbrTfKIaavvqu+V
	G8nUwHXa0qSCTrYw8GymK0izYjV9JFu1rNucs8NAZTmjYuRTaS1hYb4fH+DMJ2jLvtx/8b+T89srw
	yzt6Po+x5BbGrlQNmVLHgU83CeNfi252+9LRWdan33qzKNl841jIPmzuXeWhSEdIWTUlIFiNAwMyj
	tViN02YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSUL-0000000D0K9-3R5y;
	Thu, 15 Jan 2026 18:54:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSUB-0000000D0IY-0giZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:54:29 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c3e921afad1so500704a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 10:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768503262; cv=none;
        d=google.com; s=arc-20240605;
        b=L0FblaW8K71mKJ/1pzlr7nZNzXLIMUhfAYvdIdMCch/cKWyemVoJdFmVX4HThPumcg
         rGINTWp5HcR90ta2KUlxWeVn19RnxsUtsILPKCj5HG7ekLeIETN+qfL9Jvz3HMNNRXd+
         OYZOGbcO5dd7TRtmhAqyGMvUSmGHfcXK9HMiIAyg0Z89IYpzb0aFy3hDyGK47YZPGXXM
         ennok9BmY05fQgb8xHC3n/XexWXk5uJkAIkFW3IA8nLWULSkpJEDNLEukCuqDuGEbAUj
         9U/E1j42LuEv8slWfzzOLAQ4W7RqRmENd8FAdPk4Kl+vOXNBhXkezDhmJehrgdIYaUAr
         IuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EpbTbJbIYQW2HGVw5tfKbZOFlETWSnwKBDBmcbacs/s=;
        fh=T0H2W0GauBNxYGAyO8Kvri/slz6ySgtccYa+yTzV0Kk=;
        b=Mp4VHzu1wOASjeuWKL4qCsaHwHsnFoUkQWNNdJ1h/GET46ZSmh2kyua+gkdLuSAOIP
         5IfNXLG7hAuVscdG3nNsU9MO+4YQllpaUtNY3smUaQ4YEQnwp4HVvrQUbkZetVABJn/i
         PsfsqF8YRwXvBZ3kruzyB0IKBAsqqEaRZAuH9TXEMTYUhrfBiOEWM/qTUrBDPzapDIE3
         QvtZ0q7rz7zSu1t47omTFFILBZsYJmHCL0JrmDBjPn9Ht0Rm7zwPy94RSr/ONScBmynu
         ECnKH7G53tjkFNKgyI+lrkO7/orfwdh3nR4GYziSrel5t3zdJMdd0rK4Q+LHJdaxVT99
         snJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503262; x=1769108062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpbTbJbIYQW2HGVw5tfKbZOFlETWSnwKBDBmcbacs/s=;
        b=h0smgP6oQxj13/kXSRRkOM/5zFeyHHNCZ7HJ4gKzA0O8VfgU0hM82sx4fVDXrAVkNt
         DqhJ33H7wpgR0hNOOamv9jnZeAWNJebi/dNodJoKDRkOXuYd2eKjDQ9sYmzOhD/O8lV2
         uwlcbId7U18VsqfmEdsZ9eYkr7fGhd0G6cXc28kBPZ4WM9ufmmcxXdAip88YhRTHo+l7
         9tPL2Xgsd3s8gulQMiNuCPaFLO4k2i9LcZxEZFih3IhJbUYUgoeRqFN+g09p9ofqGzm1
         M/sOqvHa+r5WwFM2cWR2AbewO+x4d98ileIHZz8p+HJ+O7zBxbN92mZVM5SsBnbeyHaN
         OGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503262; x=1769108062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EpbTbJbIYQW2HGVw5tfKbZOFlETWSnwKBDBmcbacs/s=;
        b=DlfLtweJkIc+j0ujQftD9g3zC/AVrZ380GOn2LXHuaXE0CwJk7rUtPF7V3Wwfpq1qO
         KUaAwwnkXPiQmqXZUy+YwXgkV7BL9ZN46UNXADrm5hms0DZ9yCLTVKaNWbnYn2E5QJMF
         FYlYvtmiXfoW9PreY3dFMfAcb3LwMW2r0z+v6x9hVMaJtvMkbVG3fyWSIynn4STAI5mu
         cuo2S8wsdFq0y858RHUUu85UGCsKDhjJJQbm2yH3blxtc2GC1ve0dB3Sfo4FRgwNhoOR
         U7QK3/Nh23RpwTN6empLSJzXnYZZz36YziojVoRY7iyT95noHlsoVZ92l3lnQXFK4zZz
         lb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9g0vFtxCakx5JV1c14F8Ap35WkRoEm42rGL56Q06H0P19HptlXdryDmGCtXpUSsdTAljFMzS3t3iplQWYngBL@lists.infradead.org
X-Gm-Message-State: AOJu0YwGw7sdfCrHkg259UyNr2KPMvAOBxJc7QECvxvJ4xADIYLz/4sV
	oueu1xtr4Dv+/SFApIBIK7Cm/mx0kTh4A0cNHDSbXHqyyX59TjLuMwFxVkmnaWCC3El1pVx5Rao
	Oy5/OWE8/OtBIGSk4Pe6udyHGmCgiW3s=
X-Gm-Gg: AY/fxX6iVIiRlV9ZQepAwnOV5p47N1kWnf4X/FuNxXYda4F4WJ6A8h2nIELDzJEhyOf
	BaEHwlj5KOHAw/gPE/HjSUo7rZcrELnXZtPrhte5/p/hlM3zsjBpF9gX8uMebskKz21W6yqZ/xa
	LQPX0p/MA/NJaULl+6j3l57hXgni5hPwKEU7/k8NJmj2W27VnKglmWn9YSPnrCjnwb0brdHBtx7
	euq88hasJfD9be4kCiKXh18HWFSrR0tD83mhyHdxWug7Q9Yk3cV7K3Ow9qZ70vW5hPkvcywSfqB
	BvLZhYx6
X-Received: by 2002:a17:90b:2682:b0:341:88c9:ca62 with SMTP id
 98e67ed59e1d1-35272f8c54bmr287868a91.31.1768503261661; Thu, 15 Jan 2026
 10:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20251230145010.103439-1-jolsa@kernel.org>
In-Reply-To: <20251230145010.103439-1-jolsa@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 15 Jan 2026 10:54:09 -0800
X-Gm-Features: AZwV_QiwkBtwLCiJrqG34-zTIw_OQKLb1v72y1BxE2HMZ_jpyB1tumI3srsjTrw
Message-ID: <CAEf4BzaRU0DoM9hHtW5Bm7njodfg06JzTOe=ABAqZ6iMjAt4iQ@mail.gmail.com>
Subject: Re: [PATCHv6 bpf-next 0/9] ftrace,bpf: Use single direct ops for bpf trampolines
To: Jiri Olsa <jolsa@kernel.org>, Steven Rostedt <rostedt@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_105423_343323_C103226F 
X-CRM114-Status: GOOD (  26.34  )
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

On Tue, Dec 30, 2025 at 6:50=E2=80=AFAM Jiri Olsa <jolsa@kernel.org> wrote:
>
> hi,
> while poking the multi-tracing interface I ended up with just one ftrace_=
ops
> object to attach all trampolines.
>
> This change allows to use less direct API calls during the attachment cha=
nges
> in the future code, so in effect speeding up the attachment.
>
> In current code we get a speed up from using just a single ftrace_ops obj=
ect.
>
> - with current code:
>
>   Performance counter stats for 'bpftrace -e fentry:vmlinux:ksys_* {} -c =
true':
>
>      6,364,157,902      cycles:k
>        828,728,902      cycles:u
>      1,064,803,824      instructions:u                   #    1.28  insn =
per cycle
>     23,797,500,067      instructions:k                   #    3.74  insn =
per cycle
>
>        4.416004987 seconds time elapsed
>
>        0.164121000 seconds user
>        1.289550000 seconds sys
>
>
> - with the fix:
>
>    Performance counter stats for 'bpftrace -e fentry:vmlinux:ksys_* {} -c=
 true':
>
>      6,535,857,905      cycles:k
>        810,809,429      cycles:u
>      1,064,594,027      instructions:u                   #    1.31  insn =
per cycle
>     23,962,552,894      instructions:k                   #    3.67  insn =
per cycle
>
>        1.666961239 seconds time elapsed
>
>        0.157412000 seconds user
>        1.283396000 seconds sys
>
>
>
> The speedup seems to be related to the fact that with single ftrace_ops o=
bject
> we don't call ftrace_shutdown anymore (we use ftrace_update_ops instead) =
and
> we skip the synchronize rcu calls (each ~100ms) at the end of that functi=
on.
>
> rfc: https://lore.kernel.org/bpf/20250729102813.1531457-1-jolsa@kernel.or=
g/
> v1:  https://lore.kernel.org/bpf/20250923215147.1571952-1-jolsa@kernel.or=
g/
> v2:  https://lore.kernel.org/bpf/20251113123750.2507435-1-jolsa@kernel.or=
g/
> v3:  https://lore.kernel.org/bpf/20251120212402.466524-1-jolsa@kernel.org=
/
> v4:  https://lore.kernel.org/bpf/20251203082402.78816-1-jolsa@kernel.org/
> v5:  https://lore.kernel.org/bpf/20251215211402.353056-10-jolsa@kernel.or=
g/
>
> v6 changes:
> - rename add_hash_entry_direct to add_ftrace_hash_entry_direct [Steven]
> - factor hash_add/hash_sub [Steven]
> - add kerneldoc header for update_ftrace_direct_* functions [Steven]
> - few assorted smaller fixes [Steven]
> - added missing direct_ops wrappers for !CONFIG_DYNAMIC_FTRACE_WITH_DIREC=
T_CALLS
>   case [Steven]
>

So this looks good from BPF side, I think. Steven, if you don't mind
giving this patch set another look and if everything is to your liking
giving your ack, we can then apply it to bpf-next. Thanks!

> v5 changes:
> - do not export ftrace_hash object [Steven]
> - fix update_ftrace_direct_add new_filter_hash leak [ci]
>
> v4 changes:
> - rebased on top of bpf-next/master (with jmp attach changes)
>   added patch 1 to deal with that
> - added extra checks for update_ftrace_direct_del/mod to address
>   the ci bot review
>
> v3 changes:
> - rebased on top of bpf-next/master
> - fixed update_ftrace_direct_del cleanup path
> - added missing inline to update_ftrace_direct_* stubs
>
> v2 changes:
> - rebased on top fo bpf-next/master plus Song's livepatch fixes [1]
> - renamed the API functions [2] [Steven]
> - do not export the new api [Steven]
> - kept the original direct interface:
>
>   I'm not sure if we want to melt both *_ftrace_direct and the new interf=
ace
>   into single one. It's bit different in semantic (hence the name change =
as
>   Steven suggested [2]) and I don't think the changes are not that big so
>   we could easily keep both APIs.
>
> v1 changes:
> - make the change x86 specific, after discussing with Mark options for
>   arm64 [Mark]
>
> thanks,
> jirka
>
>
> [1] https://lore.kernel.org/bpf/20251027175023.1521602-1-song@kernel.org/
> [2] https://lore.kernel.org/bpf/20250924050415.4aefcb91@batman.local.home=
/
> ---
> Jiri Olsa (9):
>       ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
>       ftrace: Make alloc_and_copy_ftrace_hash direct friendly
>       ftrace: Export some of hash related functions
>       ftrace: Add update_ftrace_direct_add function
>       ftrace: Add update_ftrace_direct_del function
>       ftrace: Add update_ftrace_direct_mod function
>       bpf: Add trampoline ip hash table
>       ftrace: Factor ftrace_ops ops_func interface
>       bpf,x86: Use single ftrace_ops for direct calls
>
>  arch/x86/Kconfig        |   1 +
>  include/linux/bpf.h     |   7 ++-
>  include/linux/ftrace.h  |  31 +++++++++-
>  kernel/bpf/trampoline.c | 259 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++---------------
>  kernel/trace/Kconfig    |   3 +
>  kernel/trace/ftrace.c   | 406 ++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++--------
>  6 files changed, 632 insertions(+), 75 deletions(-)
>

