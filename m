Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E4CFA464
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjeWek960NcUIgiohtPXB+Vg0rJ92eP6xQNpgT2ubOU=; b=LdgE40raZ7eHhGrwClrcfYKk2H
	RyClJIKZH0cDY6mPT7pcJ8q9BbZmDcgLRt4ivJKmSSuF8ul3de411X+OQ0oB+bwhdSfxcMj2oZcmX
	UVrRqNCTZJ8KtoPehkuOvjv3L9MydrcVlpFPB9R4gP6S8lP2YB7IRmE0Ah3TXpBwi0HiRF0+V4UO8
	uffrL5N/HN6wWCyTlOuvXMH4iwACNkviIPSch1MEdfyK5wJjoR8KoKyj/LOQEPJU+1+sqSaYr8Ha1
	el6nS/lM0UEXacJJve4gYuXOmlaDZq9neDgWw40HIhIRMqbKLHpJq08WksEr6/sRuYkBShuJCjvuH
	svLoZ13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hh9-0000000Fmkt-41n4;
	Wed, 23 Oct 2024 20:11:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hK0-0000000Fjfd-0EBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:47:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so196744a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729712826; x=1730317626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjeWek960NcUIgiohtPXB+Vg0rJ92eP6xQNpgT2ubOU=;
        b=DqVxs3ZhXQRcZ8QM5ARRTisphwUTJ/3BKIGgaTghh+I8DZvdJD3UfcK1xl9zbjol4r
         M9ZVLD4rSwCBe4U/nsnTT+beyBPSBrG/1320fJ3QEZZfYyeaIk7Lmv/O5q0AKzmeWowB
         VfGyl4BgUdW3zMwdkZWMvrP0dk3U+DDCX84jVpmu+GDVaGXJVANq/3BK78Kw71K2D3xk
         Rx3EIapVy774qwX4DQGnzTnzMHpC3ct92QgoivaION18vQFeVTFVCpXWRBg+nB0LJIo/
         daE3pFk5ZfmaqL4U8SJ1laU90BqT/n26BTOh1LmjVRPVuU29tmfXZ6PvxcYSNFz0iiko
         sQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729712826; x=1730317626;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjeWek960NcUIgiohtPXB+Vg0rJ92eP6xQNpgT2ubOU=;
        b=O2NqW2xsXV3ml7Df20qafqQT9E27O/sZYumePa+OV1Q2l9IvirxhRYxxzTy/MWtcPN
         YKXBSDzzM/W3udVW4vWBhgx88x+kF9nYhfs/cHpFN5SX4skvvncBkuTr83xdaRq41+hZ
         pflcAMMZIUIq9t+92i/fYVBwhnErjwsxZAACXHpBo8TYkidbUHVXKng8nLgrJ0H5bK03
         7Fcx1WyF/deKbdz/RhMbfl89a5uzx601v11f94xGffOyaHSwkYvTRuyViWEmNwOvLgv8
         tpl5+7AAzD3p3ygqr7+JkS+7NKCaTS6oM2XxU6ZZB18JWQdFmppOZUw0qeUz8VNenK0w
         tlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdUe0sLHUXsbMyzpg2jYcGZY+iFEo/7ex/eAAvvk7tUT+2WvYsIaLc2SsH0A4McN4e0WDI4u2ApSkC4tYhs2Wn@lists.infradead.org
X-Gm-Message-State: AOJu0YyXqFJ/gKxpiC7i+pdCqOP7nctB74JCa4+3TQTpeejmk8wX4XQe
	HkufINkuZrf9pfxXJ0jARIvgmUAEGDAJx+Cs+vZLdogHVMx5dNbu7+siiObtjlk=
X-Google-Smtp-Source: AGHT+IEIA9rIJ04+Qcp3TzNgVJAqmBz3KuIj/pMJ7zakUwT1dcG/rm3pZHFabLhpGBrqDgGq03uVBQ==
X-Received: by 2002:a17:907:980c:b0:a99:a9b6:2eb6 with SMTP id a640c23a62f3a-a9abf53587cmr351767466b.0.1729712825573;
        Wed, 23 Oct 2024 12:47:05 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d62efsm513496766b.44.2024.10.23.12.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:47:05 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 082235F897;
	Wed, 23 Oct 2024 20:47:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>,  "open list"
 <linux-kernel@vger.kernel.org>,  "Linux ARM"
 <linux-arm-kernel@lists.infradead.org>,  lkft-triage@lists.linaro.org,
  "Linux Regressions" <regressions@lists.linux.dev>,
  qemu-devel@nongnu.org,  "Mark Brown" <broonie@kernel.org>,  "Catalin
 Marinas" <catalin.marinas@arm.com>,  "Aishwarya TCV"
 <Aishwarya.TCV@arm.com>,  "Peter Maydell" <peter.maydell@linaro.org>,
  "Anders Roxell" <anders.roxell@linaro.org>,  "Vincenzo Frascino"
 <vincenzo.frascino@arm.com>,  "Thomas Gleixner" <tglx@linutronix.de>,
  "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
In-Reply-To: <4730e562-7d14-4f12-897a-e23783d094af@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 23 Oct 2024 16:24:43 +0000")
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
	<CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
	<4730e562-7d14-4f12-897a-e23783d094af@app.fastmail.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 23 Oct 2024 20:47:03 +0100
Message-ID: <87bjzalhzc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_124708_137123_8F96B870 
X-CRM114-Status: GOOD (  27.29  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Sun, Oct 20, 2024, at 17:39, Naresh Kamboju wrote:
>> On Fri, 18 Oct 2024 at 12:35, Naresh Kamboju <naresh.kamboju@linaro.org>=
 wrote:
>>>
>>> The QEMU-ARMv7 boot has failed with the Linux next-20241017 tag.
>>> The boot log is incomplete, and no kernel crash was detected.
>>> However, the system did not proceed far enough to reach the login promp=
t.
>>>
>
>> Anders bisected this boot regressions and found,
>> # first bad commit:
>>   [efe8419ae78d65e83edc31aad74b605c12e7d60c]
>>     vdso: Introduce vdso/page.h
>>
>> We are investigating the reason for boot failure due to this commit.
>
> Anders and I did the analysis on this, the problem turned out
> to be the early_init_dt_add_memory_arch() function in
> drivers/of/fdt.c, which does bitwise operations on PAGE_MASK
> with a 'u64' instead of phys_addr_t:
>
> void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
> {
>         const u64 phys_offset =3D MIN_MEMBLOCK_ADDR;
>=20=20
>         if (size < PAGE_SIZE - (base & ~PAGE_MASK)) {
>                 pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
>                         base, base + size);
>                 return;
>         }
>
>         if (!PAGE_ALIGNED(base)) {
>                 size -=3D PAGE_SIZE - (base & ~PAGE_MASK);
>                 base =3D PAGE_ALIGN(base);
>         }
>
> On non-LPAE arm32, this broke the existing behavior for
> large 32-bit memory sizes. The obvious fix is to change
> back the PAGE_MASK definition for 32-bit arm to a signed
> number.

Agreed. However I think we were masking a calling issue that:

    /* Actual RAM size depends on initial RAM and device memory settings */
    [VIRT_MEM] =3D                { GiB, LEGACY_RAMLIMIT_BYTES },

And:

  -m 4G

make no sense with no ARM_LPAE (which the kernel didn't have) but if you
pass -machine virt,gic-version=3D3,highmem=3Doff (the default changed awhile
back) you will get a warning:

  qemu-system-arm: Addressing limited to 32 bits, but memory exceeds it by =
1073741824 bytes

but I guess that didn't trigger for some reason before this patch?

> mips32, ppc32 and hexagon had the same definition as
> well, so I think we should change at least those in order
> to restore the previous behavior in case they are affected
> by the same bug (or a different one).
>
> x86-32 and arc git flipped the other way by the patch,
> from unsigned to signed, when CONFIG_ARC_HAS_PAE40
> or CONFIG_X86_PAE are set. I think we should keep
> the 'signed' behavior as this was a bugfix by itself,
> but we may want to change arc and x86-32 with short
> phys_addr_t the same way for consistency.
>
> On csky, m68k, microblaze, nios2, openrisc, parisc32,
> riscv32, sh, sparc32, um and xtensa, we've always used
> the 'unsigned' PAGE_MASK, and there is no 64-bit
> phys_addr_t, so I would lean towards staying with
> 'unsigned' in order to not introduce a regression.
> Alternatively we could choose to go with the 'signed'
> version on all 32-bit architectures unconditionally
> for consistency. Any preferences?
>
>       Arnd

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

