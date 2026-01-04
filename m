Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3903FC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=; b=UV1DtX2HZnhuhN/TbUQPwiZ2eg
	DsgKA4dWIN+4xMM+dF/TNlVbt8Ix8U1LEuJSv1c75v3gFblUNgulUaobc7MlJV55adzvjhtAHjRg0
	G+WrJ40ysLVTHtkOQQvItESn1lKSuTiiusP94C5DFl6s+j/38IZzhVUbtMvjlcNjoFaNQiRmb709e
	3/FuK+6jUrXCkntoS6TxWzRjRSvgMWA3sSvTKsQO+6SgvS9Wp/82gxz9bWZO2DDHHUkXX7FnesdLg
	P+HGQLNjOq4sGwSoSrqEQvv4TY+/CLV6S7OoCKwCI40lA1XHmJ8qVVYXVv7npIGy3e6PlhVdEsLmf
	+151XGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcX6Y-0000000AXIu-43cK;
	Sun, 04 Jan 2026 23:01:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcX6V-0000000AXHj-1J1R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Jan 2026 23:01:44 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-431048c4068so709847f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Jan 2026 15:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567700; x=1768172500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=hTSV515b18AO70GXYckibs+eV1Yf40cmefJ3AECPmzgJXY0x69zumpmOx780Wn1yDB
         NBDc9G/W6wB6GHURfQaQxJwlDfzjB3hUnmUo2o5EikOfsXuZqTT2VUU7ZPqkaUfEY0hQ
         EoXY61CoiQYuqoGHt4+8EyYEEDRb7y2a+Ejd3Cdnf8LtAvZk9/XySyjY9wipOiqTXvow
         S7xpehxZG26PEcAXRbgoIdOnuAa6IElqXR+Nga6FJwDZPi6sUqlqr9N8Q64RarGyErjQ
         XuHz0Y3r+wk2UXYuazNXLWehBUkJ2bLaDOzOtKU0VEwuiRF2vMgYR5EV9X7cNsYgQd5G
         uO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567700; x=1768172500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qjmKR/eiCoAVpyGnbyfS9wTkl7aiV0GxbUH0ODK6l+U=;
        b=EdO6cg/W/H39YZhd2OilTR8Bvj4UHnM+r4l2Ykfu3Fedz4HaSIRE2fadtyx/8/FM7v
         QSSRmQ19PLNtcRZuFQamc98kdTTfkVey+Dn5JcHk7auKvwplXKxQUt6L8tDbFQQv1EGx
         EZgstUZM4S4jKyjEulbcmcNyUvnq2CQgGp2yp+pIJ5ENwYml6lsgmnRcSOcJpRV1a71j
         8czRFXcfZAkuwMNCcssHndP+pxPGPFtflEooFQ4KJtSJu8jSfi1Y+/FC8kbeiKu/rSup
         oruGIIvShs54ZMs93spj1xafa4ena6yU6BFGcOvfOEA5bTvm2KOkD1lvbhGb841YhMVi
         ZKwg==
X-Forwarded-Encrypted: i=1; AJvYcCUgGvAi3TY+63EuAK2i8QFMkDlR8sTGW18MKFO8lkdqATMO7DHOeIw3mFECvlpATrhUURD7Y3GtN31+x9DPAlu7@lists.infradead.org
X-Gm-Message-State: AOJu0YwhSWJBGZvP+pVMivzvtoggRNx0q/uaNru7OlNxT0e9Ye5NyqaW
	0KypfJFzZO/wyrhXx/9LtEgkz+fDyWIFh/pZu06qQ6PqcdhN4N62R0AW
X-Gm-Gg: AY/fxX7OZf35nzgmw77+BfsSqL4VxCizc3dbesj0qDT7knnlUsSMuORi69qQRKKRJmK
	GMSSeatDAxyNsYdB+OvYnMbjQOa8zTcWQBYIKHZLKFa+JUgkiHvDLedzTAqZjaBAIvWOqu5QogU
	EE05cTPP9jfhXvC+XcNTizJheMBOEAccC3nHkGrjNA/4l1u8hBDYj4xISxGVCjwVSdUhN9MgTcc
	yseaoAbQEXCnCQQMwSZIEjO4TBul5+eOG7O1kzeMSJZsS9uqhlEEREkh/FONmtdZ2PeInxZ0Ou3
	QPhQQt+r/A7kKsK2kqdt1pG8dO2+x0EP+DkKZN4C2h73HyZcvGFHjOgi7XCuAs3J4tdp/gkIJcJ
	kaS5o7lyYYiSjokRt048O9/XElVSfvMRnKVubpgN8HNp9qvrcrCORC5uKayQT0wu+63ylJ8uCxO
	pw+xXOMGbNdTiVuNlAsa3en5FmdhrQcDLixDo3oITy7ObWYDTOv3tX
X-Google-Smtp-Source: AGHT+IEPxlgtmoJsOcbnrDXHkchjsFc7moeHiVQTpzEoBA2t+H1hGAq+A791EuxHgrzC5U6Ox/NHuQ==
X-Received: by 2002:a05:6000:3111:b0:430:fe6c:b1aa with SMTP id ffacd0b85a97d-432aa434e77mr7977363f8f.26.1767567699992;
        Sun, 04 Jan 2026 15:01:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm99650545f8f.17.2026.01.04.15.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 15:01:38 -0800 (PST)
Date: Sun, 4 Jan 2026 23:01:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260104230136.7aaf8886@pumpkin>
In-Reply-To: <20260102131156.3265118-4-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_150143_443155_A7984980 
X-CRM114-Status: GOOD (  27.61  )
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

On Fri,  2 Jan 2026 13:11:54 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Previously different architectures were using random sources of
> differing strength and cost to decide the random kstack offset. A number
> of architectures (loongarch, powerpc, s390, x86) were using their
> timestamp counter, at whatever the frequency happened to be. Other
> arches (arm64, riscv) were using entropy from the crng via
> get_random_u16().
> 
> There have been concerns that in some cases the timestamp counters may
> be too weak, because they can be easily guessed or influenced by user
> space. And get_random_u16() has been shown to be too costly for the
> level of protection kstack offset randomization provides.
> 
> So let's use a common, architecture-agnostic source of entropy; a
> per-cpu prng, seeded at boot-time from the crng. This has a few
> benefits:
> 
>   - We can remove choose_random_kstack_offset(); That was only there to
>     try to make the timestamp counter value a bit harder to influence
>     from user space.
> 
>   - The architecture code is simplified. All it has to do now is call
>     add_random_kstack_offset() in the syscall path.
> 
>   - The strength of the randomness can be reasoned about independently
>     of the architecture.
> 
>   - Arches previously using get_random_u16() now have much faster
>     syscall paths, see below results.
> 
> There have been some claims that a prng may be less strong than the
> timestamp counter if not regularly reseeded. But the prng has a period
> of about 2^113. So as long as the prng state remains secret, it should
> not be possible to guess. If the prng state can be accessed, we have
> bigger problems.

If you have 128 bits of output from consecutive outputs I think you
can trivially determine the full state using (almost) 'school boy' maths
that could be done on pencil and paper.
(Most of the work only has to be done once.)

The underlying problem is that the TAUSWORTHE() transformation is 'linear'
So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
(This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
This means that each output bit is the 'xor' of some of the input bits.
The four new 'state' values are just xor of the the bits of the old ones.
The final xor of the four states gives a 32bit value with each bit just
an xor of some of the 128 state bits.
Get four consecutive 32 bit values and you can solve the 128 simultaneous
equations (by trivial substitution) and get the initial state.
The solution gives you the 128 128bit constants for:
	u128 state = 0;
	u128 val = 'value returned from 4 calls';
	for (int i = 0; i < 128; i++)
		state |= parity(const128[i] ^ val) << i;
You done need all 32bits, just accumulate 128 bits.  
So if you can get the 5bit stack offset from 26 system calls you know the
value that will be used for all the subsequent calls.

Simply changing the final line to use + not ^ makes the output non-linear
and solving the equations a lot harder.

I might sit down tomorrow and see if I can actually code it...

	David

 

