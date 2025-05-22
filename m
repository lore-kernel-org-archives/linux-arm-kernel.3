Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA298C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYtEiOvOJY+FaEu+fbVRhtpVNQYUEghdyi9GI75aP8I=; b=1Z+4c7tOX0Xue0lQDJ1NZQU6V8
	o9BP7eknbzOaNhUX3tDPITUlLSdQv73KypLpAOujyCH9D7RBkiXMfV3qc5kZUMrHyP6sBQzSg0jmv
	2KQtN0WRhrGi9iWDXnxevV3FoqSKEt+Q6gwEH91EV2oz9cBJJQvLORuTbqPcBiE8Xd7h3LMEhbQio
	PSKImhJgIUEOl1TwlyoDyW7q1xmsNj+64aoGBo+C0zaNEv5iX6aI43pbH+rAiqdSXYYfju1InjnP4
	OtX2KBp5mDf+aLwjIG2BUigFIGkdAKOytMdgB1qPBmABaa3Qs0to6xgyEEUmzncIOwU6gUlsqjYwq
	tHyLW4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIC9V-000000025KA-2AoJ;
	Thu, 22 May 2025 20:04:29 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIC7T-0000000251N-0Epf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 20:02:24 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6f8d8fb211eso40633936d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 13:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747944141; x=1748548941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYtEiOvOJY+FaEu+fbVRhtpVNQYUEghdyi9GI75aP8I=;
        b=4L//GNlnNMN5iIgYlgjB8SM+ippAldyvu7uVNjp82Wht0p1T046wwusc9HuPYUtUK0
         6QBytwhzlaqQW7hYDrxfUrklLSrxPRBBF6CLC3+eWCI27q+BL/W/2jLg+jW163u+OWIW
         KNuq+KAIxSCpJxV5f6kwMMMq1B9I38bQwbyNUAr3lu/oqMmHINH0J98zo3DvwOe9FPsP
         KnJP+GRUEehOQPLuU53DsHuEkMT7v429WvYJWH2Ob93SJo3VSuaH7i2yJdnK9bXVHAxD
         eWAJmKp54qlEMXO9qDHtwMr5YdnGneAqn/gNCv62zHhDm/CEnz62p41sdQA/mE3tmJv8
         H4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944141; x=1748548941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYtEiOvOJY+FaEu+fbVRhtpVNQYUEghdyi9GI75aP8I=;
        b=Ie/UuuaamteDTQGT2yO/S1UEtucRsB/D04d9xNHxi6T2ccFbxcNX1H3HmeQ9uYlxIS
         2/65o75P6nmK/15PKPFgMmLgDywfnhRnRb2RcxRXjjaTtrHfm8WrXkszsvaPi/2urSfb
         RrChyQVJzMxM/qYWRjTgyB7+YKE6Zecbsb5AkKm/GrXBMF9AEmJ92lQuDJ+MtVU1D0Em
         IDZ33y8E5Qulspnti2XzCLADdTqnBiq7xl0NCcFEAk3Y7lhbpGaMsAWea/ZFIGtnnMCG
         7290nbHmJwkB8KyTbp3NfzC8h+Ljf1CMD2n/XJEb+kGg/UsdF1ogp6LrcDiv79RHrwZF
         Bgxw==
X-Forwarded-Encrypted: i=1; AJvYcCUpTWHMyFoYEFsFYSFIlqMIru9lR44PEYb/bCUZrefu5c0ubQPL1B/QlMcYqNE+tMAFjldaHJ74V46zA7DLQuGS@lists.infradead.org
X-Gm-Message-State: AOJu0YzbHMWoHEkX4k71BFFptUl+Pz9Q4TiJXS3t65C/IKiRbx3QlRUq
	rLDp2M9fR580raZsupyw+/VcYgpcE0vYgvAWb3HSrLcIHo//0CVqSRv+o2JpGpJM7bmW6H3IvAa
	Nu9UQHAT8pgmBGGvwnT+OCzEfZRa9kyo34/+4ywFj/TzkdchfwqEHopJggL6cXA==
X-Gm-Gg: ASbGncsGhGd6NuJFCR0/PJdqwW5bxF1B+W5BE28YjLN7Dpifu5uWo5XFuCXaMjMjLPF
	RJv/Z8yfrcI6C+VoD3XiRUhEpEIhbHpnoDiD32Eu9w8ls+lG4/mCpBOjWpkOrzmDloxO3gqaAEJ
	vjfNbpIUTeIMpofn6HNpZ3mNfcSVtU3FDEKMhcTEYzOps=
X-Google-Smtp-Source: AGHT+IEucfGw+409TlEusjP+6OlYVzLfhDBZdAG6SCdZYc8C7RdAhMQVE8YivqBkAZo+MIZeaLcFh1on0ea/ipIcJmE=
X-Received: by 2002:a05:6102:3ca8:b0:4bb:623:e1f7 with SMTP id
 ada2fe7eead31-4dfa6c61bdemr24828235137.16.1747944129793; Thu, 22 May 2025
 13:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250522184249.3137187-1-dylanbhatch@google.com> <20250522184249.3137187-3-dylanbhatch@google.com>
In-Reply-To: <20250522184249.3137187-3-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Thu, 22 May 2025 13:01:58 -0700
X-Gm-Features: AX0GCFvfkzpEu5JGWQRB8yIzUnMv-s4h5bh4PH9PmaEgpJEyTdBLcPIDEBaSofI
Message-ID: <CADBMgpxiQMGZpdqxc5ejeuhowUVNWiDqx=BVmRQEWxkn1+WXHA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64/module: Use text-poke API for late relocations.
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Song Liu <song@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_130223_115585_EA339742 
X-CRM114-Status: GOOD (  13.37  )
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

On Thu, May 22, 2025 at 11:43=E2=80=AFAM Dylan Hatch <dylanbhatch@google.co=
m> wrote:
> -static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len)
> +static int reloc_data(enum aarch64_reloc_op op, void *place, u64 val, in=
t len,
> +                     struct module *me)
>  {
>         s64 sval =3D do_reloc(op, place, val);
>
> @@ -66,7 +69,11 @@ static int reloc_data(enum aarch64_reloc_op op, void *=
place, u64 val, int len)
>
>         switch (len) {
>         case 16:
> -               *(s16 *)place =3D sval;
> +               if (me->state !=3D MODULE_STATE_UNFORMED)
> +                       aarch64_insn_set(place, sval, sizeof(s16));
> +               else
> +                       *(s16 *)place =3D sval;
> +
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U16_MAX)
> @@ -82,7 +89,11 @@ static int reloc_data(enum aarch64_reloc_op op, void *=
place, u64 val, int len)
>                 }
>                 break;
>         case 32:
> -               *(s32 *)place =3D sval;
> +               if (me->state !=3D MODULE_STATE_UNFORMED)
> +                       aarch64_insn_set(place, sval, sizeof(s32));
> +               else
> +                       *(s32 *)place =3D sval;
> +
>                 switch (op) {
>                 case RELOC_OP_ABS:
>                         if (sval < 0 || sval > U32_MAX)
> @@ -98,8 +109,10 @@ static int reloc_data(enum aarch64_reloc_op op, void =
*place, u64 val, int len)
>                 }
>                 break;
>         case 64:
> -               *(s64 *)place =3D sval;
> -               break;
> +               if (me->state !=3D MODULE_STATE_UNFORMED)
> +                       aarch64_insn_set(place, sval, sizeof(s64));
> +               else
> +                       *(s64 *)place =3D sval;           break;
>         default:
>                 pr_err("Invalid length (%d) for data relocation\n", len);
>                 return 0;
> @@ -113,7 +126,8 @@ enum aarch64_insn_movw_imm_type {
>  };

Don't merge this. I spotted an issue -- for the data relocations this
looks like an incorrect usage of aarch64_insn_set(). An updated
version will follow soon.

Thanks,
Dylan

