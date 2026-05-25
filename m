Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01784CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/KJeVQcoYJeZ7NEMluoiY5LeaLQ6MRIkXZPWciIjMs=; b=gpZydxO4y7qVXhH/0ZtFQLOIEW
	TkHoXSLgtxz0xcL5nq3Zvv89BNC3xDswKKdCOv2QGcMWyLlwbe+4Q7Kzuli66OfMUV+ZpEVE4EYi3
	UlMWHlEr4GZSccu5CB1yHipA+w5j81aZMkmYp0+OwxdbHtw/2mHHd7/bBT7BTWZNSIGe/Z/xOh1Ix
	+iYWVYbeHo5mhDfhcQDz9p5jlSv9SzqL3cOi7F3+6/uvOb9blyy4SazWC2Laaa3TwzZr1LhLfMYF2
	P6izM7wJaGazHLWrVgUJt6zjbQ5C75ixRl9e6Elwz7uFK4wBvB89IHd9sMxFgLToIRKHh0JOMIo9g
	OBwlZNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXUl-0000000HYHJ-1tN6;
	Mon, 25 May 2026 15:45:35 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRXUj-0000000HYGk-0FOG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 15:45:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-441209fb77eso6002971f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779723931; cv=none;
        d=google.com; s=arc-20240605;
        b=Ecwb1L37+Eq+8ps/8MEEjRqbyunmq2JyslQRWpP1dX7NgsES1xfAY/TF2e/XxjP7ju
         YYFV9lsCtuaLnqz8FoLCRw4mgy1s0hFLmNELSxegHvTR80s5T2OIY5K9xEmSXufStg+b
         5JTC/mNG4cuqgSCweGRf21yAq10BrMtttnoCIym3TVXYFgiSfSOtGfJBiaEMAx+g4vpg
         oAlAONkFmPRlAZ9IvEpSXcnywI1+HMQ7Ay4wgnILZF/D+xk7uSxJt7i8puOyBGY+EolW
         3QJ6qYLNZJAk/RNWk6lbEOJr5H5cPndhL0qPJfrfgX0aO7SZvIP0JJJ3oYlomwL3Ffo+
         VOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v/KJeVQcoYJeZ7NEMluoiY5LeaLQ6MRIkXZPWciIjMs=;
        fh=TfZ5fWtHQ7h19Tjwph93mAJ/SxUQaK3Abhe7p7iq81w=;
        b=guB0BzckRZNF3i9RXwmLCTE/N3VP19DXMgXLBhUb8/bQ4w/xkJ10yjyIr22j7Qlcwj
         ctzPI8LJqPyniwnJ80xDiinuyHqjo10Lfo9mV7I8vatBHhw7y3mw9k0/zyymSBwdgJ8j
         UpVGgoRjI//PCx9gs4KJ6OepBm++B+BlQBE2+IDMAn/7LSuziTb+pi4nvYo2+T2GimVC
         KUiT+rKd0JDTFvkHl+6YJII71ltbnAWbwD0ksvCzeuhHZ7kbDCNUX20lkC/tKud7j5tA
         uatNE+yJ51dIhf+gdCQyj9VMXQwolb0xRGbgXYg0THrgr4PY4vfehwltkSudDV/oa4o3
         oFZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779723931; x=1780328731; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/KJeVQcoYJeZ7NEMluoiY5LeaLQ6MRIkXZPWciIjMs=;
        b=Ia2VDSB4JG7qqtvLwUw0erlbaqDYwH67jfctCPJt1kiQrnHs6oIaQo1nPSBwpDfSz6
         PtxqIA0Drxpk6CL0/uqc/yxZe42AvpRolw4GmDWfK49lpdqVU2dt0sk6l5cMdQoRAjzc
         4XOBNdfznNyu30bcM7HYyjXrOS25Z+JD76Ii9BGTQLoflLNNEeu/DHYnwanLkQce1TXS
         FurZJSlwPiHji5ZqlA3+lnyaBtsZFk08g6Zzrub7xo4eY1fQJGEyuW+9u4+a4KJsEKyH
         O9EvtH8dPLh88ndsxU7GhshOUBFjYVz2XXNlGRCvfN7GqZRm8vKLO2ccfNAsuSahEiDU
         rLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779723931; x=1780328731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/KJeVQcoYJeZ7NEMluoiY5LeaLQ6MRIkXZPWciIjMs=;
        b=ok3EqCU2C2yXZ8+aA+DGyKbE3z6rSJngUG5PWRR1vb2m+mUVYbAhWGDsGHaTeCWSxM
         YwlnaPXbNUiobt6gW2EnTHBTHHv7a/7SlFxpR4zPlFnnEwYGiPx24lAL0O6/lRZy8XiZ
         8BD5f768HBifN7pofOdQYTKEsODqq2qux9Tb9/xUGOeMhUWWuVRcIU8NNqZ3hop1xjfa
         muy56KIPF5B+49hPuWdCwUMrlufET+u43XLr5kVds7bJ+wPGF70ibcfJ4KXrOH4cvjmN
         Qbew+Fl2JvzabYKm3nr4lgE0kq2UFtzA6GZU5Q0cojc56eGgoWFC9CnX1xivrcWngOjv
         rEBw==
X-Forwarded-Encrypted: i=1; AFNElJ/Rk+Mc/fHBakuv/uwVwimT0D4TpUZ3VSmVRMR/E6c0hWbyeTpSDYiF+WnglGiBQp1oUGYiehLbJ0vbLCTolOIM@lists.infradead.org
X-Gm-Message-State: AOJu0YxzKsZ5qv1DZT+0Kh5wv74ZpbeOUnxbflZSSByIqMd8gAIZRaC1
	ckmfFr6gpWA7VhjMaBbEO+1nKB5AU4QvBK8kbEnvY2X+WTyuW8n1k9SMw1DOaq0nx3fofQv1pRp
	L97kACVAWZt6mkPj5oe0h2tzHBVbgSjM=
X-Gm-Gg: Acq92OGkoV902aH3KWNPhBYVY+y3wlqCCeGOS+iXRlKjH39quMB2/+prFsMBeH8UYad
	pHcrx6411WE6KTWpfZsRKps5ZExEWUCM8Gzz9lpq8blo/+XdE7qw8XYdqHzDieqx3jldifiwgIh
	Ev+YuXNi4SoRL+UdRIEJ/6a4v21oTRX1KfFr0r173vVYnZw8aXgCwqDG0RQthEFOUBhWFrI644Z
	fZONEY54Wl+LXek0FgqEIBm5MTTt3iVPtwupNwpuZ1aXR9Kv52ZamKb0qT3TbyKZZJKgDw0S6DJ
	gneJ4ZVLb5FEDOlulos3l/e9IFOK2b2kV5K+0acL2iUX+jnrBfkJo4phf6fFlzJYAoYfTbnraBe
	VzcqiqNbXo08Y+0fSHBg338T1/27/QgsORNF5
X-Received: by 2002:a5d:59ae:0:b0:45e:8526:7dcb with SMTP id
 ffacd0b85a97d-45eb30deecdmr22155169f8f.7.1779723930477; Mon, 25 May 2026
 08:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260522172219.1423324-1-tj@kernel.org>
In-Reply-To: <20260522172219.1423324-1-tj@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 25 May 2026 08:45:19 -0700
X-Gm-Features: AVHnY4IIG790PDlY0_eU6bDIBpmGdEOYyU8PJIW44rY53Ae4UthkEJDV1ZzBOrU
Message-ID: <CAADnVQJ2r6qYRw-kRe-55Pwg9zAhj7SQkOd_eH=JSAyBFKKymg@mail.gmail.com>
Subject: Re: [PATCHSET v4 sched_ext/for-7.2] bpf/arena: Direct kernel-side access
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, sched-ext@lists.linux.dev, 
	bpf <bpf@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_084533_119247_1F1DA6CA 
X-CRM114-Status: GOOD (  13.33  )
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

On Fri, May 22, 2026 at 10:22=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Patches 1-2 (atomic PTE install + arena scratch-page recovery)
> --------------------------------------------------------------
>
>   mm: Add ptep_try_set() for lockless empty-slot installs
>   bpf: Recover arena kernel faults with scratch page
>
> Patches 3-5 (helpers used by struct_ops registration)
> -----------------------------------------------------
>
>   bpf: Add sleepable variant of bpf_arena_alloc_pages for kernel callers
>   bpf: Add bpf_struct_ops_for_each_prog()
>   bpf/arena: Add bpf_arena_map_kern_vm_start() and bpf_prog_arena()
>
> Patches 6-8 (sched_ext: arena auto-discovery, allocator, set_cmask)
> -------------------------------------------------------------------
>
>   sched_ext: Require an arena for cid-form schedulers
>   sched_ext: Sub-allocator over kernel-claimed BPF arena pages
>   sched_ext: Convert ops.set_cmask() to arena-resident cmask
>
> Patch 6 reads each member prog's prog->aux->arena via bpf_prog_arena() an=
d
> requires the cid-form struct_ops to reference exactly one arena. Patch 7
> builds a gen_pool sub-allocator inside that arena. Patch 8 converts
> set_cmask() to write into arena memory. BPF dereferences via __arena like
> any other arena struct, no probe-reads.
>
> Base
> ----
>
> sched_ext/for-7.2 (f31e89a8f583)
>
> Git tree: git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git =
arena-direct-v4

I created a stable branch bpf-next/arena_direct_access
with the first 5 patches and merged it into bpf-next/master.

Tejun,
please pull it into sched-ext tree as well.

Let's do any follow ups on top.

Thanks everyone!

