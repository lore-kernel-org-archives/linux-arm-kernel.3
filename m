Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E629C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLAWLSHy0TSwl7+tgWW0CQncnxmp+W5DE/5jbJvqW4U=; b=24dR784TEhGWJ01CgFcRiSQxlt
	PcOi0gRtazxCFEOAWRmyyux9zJeayOPdvmdrmCPvhG+qLbf3gQ9WpWvunOyvXDiTQzx72vtCdd2y8
	2RlRcvJXgHbs3WEVRefMwqa+LbliczDEOsT5JmzYLsL1s8PxtqUDi6a2jYEf9sLyGKOrAt9oH/rew
	p/pixYo/U0x/+RsdY8y56w19lUzqC6CwgAQO1q6NTKLpXmbNgsPofjcQyGXy40f+4h/iyLEZZSA2Q
	c1TH7WUC9JGHxMug7pqRbGyaVkuuKk7i+X4GCOvaIklSK8c33MS2a2CTlfUe8VddQD1VKgDD1K1vS
	Rn+sp99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaLl-0000000BtBZ-1Ruu;
	Sat, 08 Feb 2025 02:13:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaDO-0000000Bs9y-4BIL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:05:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso609880f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738980301; x=1739585101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLAWLSHy0TSwl7+tgWW0CQncnxmp+W5DE/5jbJvqW4U=;
        b=XazkQTpRzW+7kXxzWJJLkwLUKFUw04LOe1MShl+teHb6WC58x8uC5Lb9UIEWzVx96O
         KP8YvRoBJFvxxsT0bXeFANwiZXyhWgLBam18eEiu+s8P7ZCYiLPN1FqOVk8rp0MMTwIa
         HHjJmCIJMoDszoq7BZhsJUenuB+D85eD0w6wk0Vm3TwAiixgW7uDlnbdGBl1kpLaif5U
         n4gdg0l5K967x2ANjlQ1P4YI/iI5I6TjXCR4ph22WqVTGARIoXl3HuNQioRe9ET77mQ8
         tBc9O+oRG3XG/dfBX73iPpwR199YR9Zu9dJIxuVb6bA8C1rMFxNa/ay3DaBUPIx0vs/Z
         bC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980301; x=1739585101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLAWLSHy0TSwl7+tgWW0CQncnxmp+W5DE/5jbJvqW4U=;
        b=hFJp9gA+OF/ntPviZQLvIJXUV23J/cXuHNv4SkwR+de4K5BxCJybe0sljqvBjin+QU
         WFU8uxhw29HtX/Px1hIWISY3jUJ0hgTzytG4c2cpfyvNvVs4UKxFaHbO1z0PzyP3MxFt
         aYOHomG0/HQRYfPoRgIubANke/gRCVwAHChu4Mcdwytu8VdH0AtCDaYRbMiFxOotcIAe
         ABR/+/UGzouhuQFZrzQdjBfMflfJ75TFMupNXoxfgIiizywps4ArUjNaZQCRBF9jo+Pq
         zz5CLuZJnvJeAHcYGMRFQkm3gABXRKJbmh51YQ9nk9Urb6AkvDvhDQf70pM178blvs7d
         XrzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtXPPP5I8wAWivDBfmNRIiGVMcmBEbqPrFZICvlmqRlEfhlxk9luEEODdbV4QT75HhTFq+h8l/VeWdSWrfH6W/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1uMski6K9lGb4cL8tN9VRMTj0JCe6qJ4uig71KQhzKUP3o+lM
	438eVJtqOizhiZFtqgBqvWmkSOmRZxKvix8mvwYXvuRMq6/CKQJVZ5YT5MRA0LLKVqUAzn8NQfS
	uYbn/PAmWFFvf6S8mYLG8yk90Be4=
X-Gm-Gg: ASbGnctFJiG8zz0XGDJpKiRNw7YMTb9/pRhZJw2OFwuYoInRrxQ5HWhBEc5NNbCTMAO
	TcJASaFG9QNm1WHCRZqT9RoD4qb8JoaXznI86gSFFxFQ270GjD9a/UBSA/dpAR5HD3PX1gcB9Ul
	w9UX4WydAIjVrHE4K4EzCBL532OdjT
X-Google-Smtp-Source: AGHT+IGLStgu8AXC9q/i8f9nQHUBuaSfxwvSq8Eg4fLl4TJeqHMutcRrjl7FjFaKlKFT+6nEI2m4IxYOG5h5nun2Xvk=
X-Received: by 2002:a5d:6d0d:0:b0:385:f1f2:13ee with SMTP id
 ffacd0b85a97d-38dc935f47dmr3503009f8f.46.1738980300974; Fri, 07 Feb 2025
 18:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-24-memxor@gmail.com>
In-Reply-To: <20250206105435.2159977-24-memxor@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 7 Feb 2025 18:04:49 -0800
X-Gm-Features: AWEUYZlLTRyf_ClCJ_SG_e1Sm6AP8DlaHhKMYR5f6FACR-Jnh5gK8pkaAR7oKxc
Message-ID: <CAADnVQK8+-nkvDnBq=pVkadPX9zASdTSEDn6bUe7hqgs=Bm_iQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 23/26] bpf: Handle allocation failure in acquire_lock_state
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
X-CRM114-CacheID: sfid-20250207_180503_039321_298D33C9 
X-CRM114-Status: GOOD (  15.31  )
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

On Thu, Feb 6, 2025 at 2:55=E2=80=AFAM Kumar Kartikeya Dwivedi <memxor@gmai=
l.com> wrote:
>
> The acquire_lock_state function needs to handle possible NULL values
> returned by acquire_reference_state, and return -ENOMEM.
>
> Fixes: 769b0f1c8214 ("bpf: Refactor {acquire,release}_reference_state")
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---
>  kernel/bpf/verifier.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 9971c03adfd5..d6999d085c7d 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -1501,6 +1501,8 @@ static int acquire_lock_state(struct bpf_verifier_e=
nv *env, int insn_idx, enum r
>         struct bpf_reference_state *s;
>
>         s =3D acquire_reference_state(env, insn_idx);
> +       if (!s)
> +               return -ENOMEM;

I'll grab this fix into bpf tree.
Next time just send it separately, so the fix is not lost
in the patch bomb.

