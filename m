Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96652CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 23:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=; b=dJYp0cSsqeJEK/LjnW/cObY5KA
	CVpmoqI9cmSSUtElBoJCJ+3hpVNmcfWK/uwnMwBnRKo/GyGh1msR426Yd8Rr3rnatAg80hkCoWNaN
	xIho13ecm2ONi1/bGccw+ck4/F4Hq/aP9cT/+JNveCpVqPb0fxLePjwIopHsDM2J8HedujHDg11c0
	SdsWpMFegylAicHCWJlFm3uybtg1nArupKNQSY8dPtwApvydpqeermhV0+sfrA+GiYu7ear4XJj0U
	Ec82mXG8bSnT8PiE59PKCDWbRO7Oa0VzacneFENp0YrgA8t1KYRm7h32jMg+ZaOiJkrp6dcO1xlMC
	gbqlLxtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVdsC-00000001JWn-2h5F;
	Fri, 05 Jun 2026 23:22:44 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVdsA-00000001JWF-1zhH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 23:22:43 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7e6f586a0d5so1139077a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780701761; x=1781306561; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=;
        b=fs17hIV6THaHHpia9qpEKlNKV37eRFMPZlaggHlNwe4oR1iKKfzwafHMjWWN0kjNNn
         D7fWQod/xpG8dlBQddVyFt3aABSPC8wRnOJ898JDXfXhShwkCzh12C+94UKhMM0Pq/bW
         9jgIp2W5cgIl40Xofh2TQqMgQLhrE4pTivHBAas24FGtrCIhuuUpDjzEmlfQrIlxnDrn
         R4kMutv/4m4vi4S4PezRsvOjjoW0L3NnPL6wXKTDDLnkBVkfZYJbHjUZZhW8qVxxdtAI
         g7qv+k6fqBuugWBgB57pcmZqH6Og/Hu/SF66xnsPWULtIL451taUbF8vrk6RpYb68zpY
         PLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780701761; x=1781306561;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2k7U07qtwbFmbaheJUqoAwqTh+vQ4LcZsVmb0igPq1c=;
        b=Q6HwK1jyIVi2uX4WjVN8/eim5VPKknp9o3lzHH4aHFVj7OlzVNfx4NRuHRBM7DhmF6
         +KuGAGkGv6LYdVWoq2/rtbKuR0Cz09OU3vLQVdGOSAWEXdGAc+NaXhzGUiMGkzZEB29k
         XcFA+fVlAfMkoS/VEnkJcq8OrR3pl2AjeavrtU9/IOxnL9RB7AtipBa8Ne/YxDtKiINX
         IxM/eQN+SE93ESxiVkHGxTH5JpGqe504Y9Cz0Cm5m5Fz1MQXVnIq2sLL32kwz/Ml/jIq
         JDxJ9Fu68YAkuX1/Z5Vck1WS0dVHqgDKGslIqLcX1vCKiblJU22WLFFZ8hEvDAIhg0Ny
         e7/g==
X-Forwarded-Encrypted: i=1; AFNElJ9gX/8N65pe2n4nk8n49rievQcZ4rGhU41pTcJeVcvbwKHpc10rlc5dc6sF1HGDmAbQxhAa5q2CZuS1K8ZYTJPM@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ8ZNv+KLYWBjjBJDu5yGi3+JRRdw0xy5XzszVsJ/dXUIP24KS
	oNXer0vKq6c60M5f4dE80lH8WS2e7pjuB0wfi0q7NMSsiTRFDMkh60Ri
X-Gm-Gg: Acq92OFtqawiQGWDGkyQonns1K045/EhUA64lSbh5n88wMw8ji8WpJftEGcdDitkss4
	AypGNzz0tuuTdqlWZ0CZmXmXaShA+AYcmPpbsh0nxZmIaKMMrSV5koc8apRtmW7jScu4GpuUON4
	RHOEnmWVzew9O4A8S1wBGHPGaUb3Wgvm/+Z+xP4VTwFZB7XJjgy5xgjQUHbBkgTsxkaUgho+BRL
	HhpARH4PhpZEOwaYNY8tGl8iysJ9gsl2iT0tKTSYxFUdKKFnyYT/wNhUxL7621pS0Z0vuz8SXnU
	I2Yb5lFiu1btIkgpx4K5BlVuvMkbF4//Nuw2NbbijQ47YIkJX0Uo+LI2BoHjRDTC1zGzl6mmlC/
	7/WdWG8RKmkMmUzO8M502rqdlJA9u0efIF3C4Ji/o27O8dWNjediiPP6R/hFi39jZ/4DZ4toQO3
	1SyVqDHSKUDVCIghUjCczTI9rUYK+9iXybE1WzgUET9ETWVA9DKu6CEIj9eR3uxbDZoD2G8WJy4
	8sdtZf8l4NYZ0CoK7KxOsL2n+vy
X-Received: by 2002:a05:6830:82bb:b0:7de:4fc6:a588 with SMTP id 46e09a7af769-7e70ca7b3c2mr3388171a34.23.1780701761185;
        Fri, 05 Jun 2026 16:22:41 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4d::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e745fea5sm6605643a34.5.2026.06.05.16.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 16:22:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:22:39 -0700
Message-Id: <DJ1I3B2TSXSL.AV4PS9YH714@gmail.com>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf-next v2 4/8] bpf, x86: refactor BPF_ST management in
 do_jit
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
X-Mailer: aerc
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_162242_521042_5A3B3BC5 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu Jun 4, 2026 at 1:22 PM PDT, Alexis Lothor=C3=A9 (eBPF Foundation) wr=
ote:
> In order to prepare for KASAN checks insertion before every
> memory-related load or store, group all BPF_ST instructions that indeed
> access memory in a single block of fall-through cases to allow
> instrumenting those in one call, rather than having to instrument all
> cases individually.
>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 53 ++++++++++++++++++++++++++-------------=
------
>  1 file changed, 31 insertions(+), 22 deletions(-)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 0981791014eb..943a0f315cf2 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -2300,41 +2300,50 @@ static int do_jit(struct bpf_verifier_env *env, s=
truct bpf_prog *bpf_prog, int *
>  			EMIT_LFENCE();
>  			break;
> =20
> -			/* ST: *(u8*)(dst_reg + off) =3D imm */
>  		case BPF_ST | BPF_MEM | BPF_B:
> -			if (is_ereg(dst_reg))
> -				EMIT2(0x41, 0xC6);
> -			else
> -				EMIT1(0xC6);
> -			goto st;
>  		case BPF_ST | BPF_MEM | BPF_H:
> -			if (is_ereg(dst_reg))
> -				EMIT3(0x66, 0x41, 0xC7);
> -			else
> -				EMIT2(0x66, 0xC7);
> -			goto st;
>  		case BPF_ST | BPF_MEM | BPF_W:
> -			if (is_ereg(dst_reg))
> -				EMIT2(0x41, 0xC7);
> -			else
> -				EMIT1(0xC7);
> -			goto st;
>  		case BPF_ST | BPF_MEM | BPF_DW:
> -			if (dst_reg =3D=3D BPF_REG_PARAMS && insn->off =3D=3D -8) {
> -				/* Arg 6: store immediate in r9 register */
> -				emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
> +			switch (BPF_SIZE(insn->code)) {
> +			case BPF_B:
> +				if (is_ereg(dst_reg))
> +					EMIT2(0x41, 0xC6);
> +				else
> +					EMIT1(0xC6);
> +				break;
> +			case BPF_H:
> +				if (is_ereg(dst_reg))
> +					EMIT3(0x66, 0x41, 0xC7);
> +				else
> +					EMIT2(0x66, 0xC7);
> +				break;
> +			case BPF_W:
> +				if (is_ereg(dst_reg))
> +					EMIT2(0x41, 0xC7);
> +				else
> +					EMIT1(0xC7);
> +				break;
> +			case BPF_DW:
> +				if (dst_reg =3D=3D BPF_REG_PARAMS &&
> +				    insn->off =3D=3D -8) {
> +					/* Arg 6: store immediate in r9 register */
> +					emit_mov_imm64(&prog, X86_REG_R9,
> +						       imm32 >> 31, (u32)imm32);
> +					break;
> +				}
> +				EMIT2(add_1mod(0x48, dst_reg), 0xC7);

maybe it's an opportunity to cover this into separate helper function?
When indent reaches 4 tabs it's about time.

