Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B854E7E35F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6VA0Qm5NwkpVfaj6RzxqQaP6W4PT04aWCmqKAyd8n0=; b=y06o8ti56EAlb3YOzKOyaLffsT
	5zJYeIj5YS5LvQewIbLBJwYKhSkpB+ahqGSK24gMa1a8Y3Ji1p0/X9KB/ljnH91XlIbnjnRsq2D1Q
	enUrx+VRdS8gzw+tguu1/am1uk5yoTqcNpfnewp1JBfEbbrLSL6VFRrs1ghfeHG9IvkVE/mMrg/bs
	7TKRyDISK3kZNUdbFyJBDq0BPAn10wp+q01gp3Dhxi9CRBuQu8yFB8wOEzq/WJ76dez/4ylvNAxOE
	iJekr3Ni2oLl/zv9rSrmtb5BW9OEwc4rg45YnIYicb6ozinr3II6G3Ds9iINkOfiLpci+HZGd+pe/
	9al85GvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b2m-00000001pa5-298l;
	Fri, 03 Apr 2026 09:42:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8b2j-00000001pYj-1zp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A4E44288
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Apr 2026 09:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782F7C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Apr 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775209340;
	bh=GdA5Glxo6eWa4W/ST2bpPz/cVuoZBhUidEmnv04LsNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sr5PK5c3V49Uy3VYwCD9vYigDLKR4gGc2AtzThKwNAfYfobhRzZIrB/5r8WmJwWkT
	 P89Js6i/LZQeljSwc7IprHEtqzVFHul50y3lde1GlIS/U++wLo7KEi9z930RS9aHeF
	 91xnhm2780BYhzNKVsATmZMERd5V6zrIFTMuI4ixwYaHjs8lOtHPCdC/6ijQ0osxUH
	 B5iTnHwYG8Oye9w9N/ITXuANXU5zSiPn7gqaFQKBhAkjZyIS3xb+lIlmSYK5AMqhKC
	 /RdWw6cCzD+axy4JLFVzNLJvJrCSED4ggnr7TK+IikoXn1xCxMEST8sO2hZXXUd5IX
	 nP6hq6G84PujA==
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso17822465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:42:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3Veb9fXIv2xlkVB7E+cv8IeOMGsfpFLdoAchXQqtGCuajKXpHhVVEPzN1ayD90SZBJfR4e5bnqIVFnK7BSsY2@lists.infradead.org
X-Gm-Message-State: AOJu0YxwQSkYi04+ISfUnA2mlokNTU+lIUK2+JNlGaOg3eNjHFJmjAwI
	aM74bRLIbmAfSg620U1JMxlQfh1V0gCegXyCkJA4h6LLEGqvicFDYh2xNF7BRvi+qvc45LWwQ2O
	q4Uur2CThFKlt5YkzPmm2R+Lh3UMJcs0=
X-Received: by 2002:a05:600d:1:b0:485:50ac:b8cf with SMTP id
 5b1f17b1804b1-488993be280mr33529815e9.0.1775209338532; Fri, 03 Apr 2026
 02:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260402112250.2138-1-kprateek.nayak@amd.com> <20260402112250.2138-5-kprateek.nayak@amd.com>
In-Reply-To: <20260402112250.2138-5-kprateek.nayak@amd.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 3 Apr 2026 17:42:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSDg7JWHGS5E_OQWibFRTrY5bUuoOntmVE-MCt+FawLZw@mail.gmail.com>
X-Gm-Features: AQROBzAUeD-7TzkN4Yu-x7VvnBwCOKoW_8ACkDGIhwIZtFzQ_Q59qb4XpopnZvw
Message-ID: <CAJF2gTSDg7JWHGS5E_OQWibFRTrY5bUuoOntmVE-MCt+FawLZw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] riscv/runtime-const: Introduce runtime_const_mask_32()
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, David Laight <david.laight.linux@gmail.com>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Charles Mirabile <cmirabil@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_024221_564408_957259DF 
X-CRM114-Status: GOOD (  21.38  )
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

On Thu, Apr 2, 2026 at 7:39=E2=80=AFPM K Prateek Nayak <kprateek.nayak@amd.=
com> wrote:
>
> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
>
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. GCC generates a:
>
>   lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
>   addi  a0, a0, 0x678     # lower 12 bits
>   and   a1, a1, a0        # a1 =3D a1 & a0
>
> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> by Claude which is implemented here. The (__mask & val) operation is
> intentionally placed outside of asm block to allow compilers to further
> optimize it if possible.
>
> __runtime_fixup_ptr() already patches a "lui + addi" sequence which has
> been reused to patch the same sequence for __runtime_fixup_mask().
>
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
> Changelog v2..v3:
>
> o Moved the "&" operation outside the inline asm block to allow for
>   compilers to further optimize it if possible. (Based on David's
>   comment on ARM64 bits).
> ---
>  arch/riscv/include/asm/runtime-const.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/=
asm/runtime-const.h
> index d766e2b9e6df..85efba8ecf12 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -153,6 +153,22 @@
>         __ret;                                                  \
>  })
>
> +#define runtime_const_mask_32(val, sym)                                \
> +({                                                             \
> +       u32 __mask;                                             \
> +       asm_inline(".option push\n\t"                           \
> +               ".option norvc\n\t"                             \
> +               "1:\t"                                          \
> +               "lui    %[__mask],0x89abd\n\t"                  \
> +               "addi   %[__mask],%[__mask],-0x211\n\t"         \
Ref include/uapi/linux/reboot.h:
#define LINUX_REBOOT_CMD_CAD_ON 0x89ABCDEF

#define RUNTIME_MAGIC 0x89ABCDEF

"lui %[__mask], %%hi(RUNTIME_MAGIC)\n\t"
"addi %[__mask], %[__mask], %%lo(RUNTIME_MAGIC)\n\t"


> +               ".option pop\n\t"                               \
> +               ".pushsection runtime_mask_" #sym ",\"a\"\n\t"  \
> +               ".long 1b - .\n\t"                              \
> +               ".popsection"                                   \
> +               : [__mask] "=3Dr" (__mask));                      \
> +       (__mask & val);                                         \
> +})
> +
>  #define runtime_const_init(type, sym) do {                     \
>         extern s32 __start_runtime_##type##_##sym[];            \
>         extern s32 __stop_runtime_##type##_##sym[];             \
> @@ -256,6 +272,12 @@ static inline void __runtime_fixup_shift(void *where=
, unsigned long val)
>         mutex_unlock(&text_mutex);
>  }
>
> +static inline void __runtime_fixup_mask(void *where, unsigned long val)
> +{
> +       __runtime_fixup_32(where, where + 4, val);
> +       __runtime_fixup_caches(where, 2);
> +}
> +
>  static inline void runtime_const_fixup(void (*fn)(void *, unsigned long)=
,
>                                        unsigned long val, s32 *start, s32=
 *end)
>  {
> --
> 2.34.1
>
>


--=20
Best Regards
 Guo Ren

