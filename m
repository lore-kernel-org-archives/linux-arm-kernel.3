Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E65C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 17:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=; b=MgTVUKDW8TFs0r
	Hx9y2V9krKCPf1+0Eaepa/tQF+J8/su6z0acqCB/UMQ3MHYIq8I4t2+Wr8pOGMfOkBwWdmbPaWtsg
	1E6u5zQTXEPuu5zm+yn5pzI4qfuWsW3mewDtxD3MI92m1dvuNxwT4xBulLfCvE7ogmFdMnNKhQAnu
	aq3x1dblqjzq7n3e3vRXa6qk8jrKehUzsQwVS6wN3nJyi+S2RJBgUKhtzVm0fi9dqi2GiU2wpYjgH
	qlbDyhR4wnsR6gg46jH+z6w8KlfoVX+35WtvyPIA3IsDwSvNvI3Ky2GHA/cFJ5ht60WixVyEL6PAc
	Tz9EaXvLfdqwfQd2/4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ptD-0000000HKVs-1qo2;
	Fri, 18 Apr 2025 17:52:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5prH-0000000HJrH-2uvI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Apr 2025 17:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:References;
	bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=; b=nzM846Pw+Mlf6+pRFNMGeSql6h
	ZoVTG2a8SuyYjMwuddpVWE1asRjGYwv8EeKtQt2TJ6BGENFUzTe7lzSEKt36duG2cwwJDSMhxX4S4
	WM45LqCG2yXhUrSo0/YdWkGd7KmzloFHlzu5w8sb0Yjsq0yxZc4wmbA4suKBWhIKZZLDDje0UHam8
	5k0abWmKIPILlNyjcOP0pSHszuzwHbcchxNRF2t+tVcRBUN294A/qbES2N6//gs48vrnDhVKMQCEb
	aZVTGgxaonNGc6mxJP4sWYGbHbjnzK3WWbua0sROg6su85HY9kYOAD8EW5qYv5vD2Y19Q8Ij3QLhf
	plYZct0A==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5prE-0000000AaVV-1HiT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 17:50:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227d6b530d8so22600035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1744998628; x=1745603428; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=;
        b=AE4amTbplPwhAeiC73M13ZsH4eihSWamtlTvvxo5MAMGOO+sXEFsz/YhM3BldFUXuZ
         lGWk8c3kddGUgxAQmkQGp/Av/perQfKk2J1zOZzk4gcEKJfBmxwIoMHeAEejPu05Y/2T
         ETFitzQXhg2z/QRRP2CzLIwHHMm8mrdN2VYVqmfEJgkj5ifQnvHMsiw0aTTPeCwiTx8W
         op1xrd0tSXr2n6geSULYqhrXCi84pCrKbCX+/32hTBmM1RkiHIIc7YEqStCNLkL3vJVS
         DkJh4eUGmkdIoTpN04mgypZwXOqYxUAO+Uz9AGMdnOE0Nxp4lI9UmfQ6Dkkwgr/kyH7w
         xwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998628; x=1745603428;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=;
        b=u6lX15oZDq9k2M4k2koDDUF3+2JRLcVM7W8uw1lhQtiDXmz1InSFEvmv7EjkEO6nYZ
         TRXR6i0CdppuS2JtGGFpNTmRDx5ZBNA2Os+36MBjCqgbVCzNJ7iMYQlq7qUXqS3Jp0Hi
         k4jgpcJp9gY9eydrHFFb1ATa3/5VXllPXLvij1SsF29Pe7AxHhxRYdi3xaDhq4KgZ5l0
         uYsnc6Q6CMP0Gu9b5vqyLi1NfOJe1pvVTf1A78AuTWbLkwQkI9lapxbMxJEDEuXjB3Hx
         cvyssfLQadJ+w0PcSDL7IjJ8hTbL0YQBbduZPxgcPZBH6PlVQK2yXaOF1AyJd6hj/HHU
         Sk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjAewaj+ghbRypsgyGRK5GowkYVgOzRdfkxQNh47MrxLZdOR0+n6Xm4KZxo3VcbZA6iqhou1KYGXcKwfKrsAGh@lists.infradead.org
X-Gm-Message-State: AOJu0YyTMJixYoFRjjthZ20oCwvYf3JuplTHCyACqr4S7OIGgxps+m7E
	NWs2vk7JF4otshYoGYLOpveuuXN6gnOH6tCOORuTw6zdek5wc917PClGiE6wFck=
X-Gm-Gg: ASbGncsVc9eiyI5ixuy8hcLv39IBvL7K5Ob8V+vnwmPCANMPOaMYmLPJrjN/55S9Lq2
	B6U/xf4Q87E2RAYFEan+vxLiab0s4HIOWqSQ/1ubJSynHg+J3VJVYNJ87yLlfFu/0TJ033QF9ZH
	EPxE45jerl6QSlg/2iAxCI9+FWUZPBcWeQMFVUcpXJDa8etK27rQjofbOKvtQ9fkDz5Xib2sunK
	C7OtOZ23/FBw4PGnaS3zhk4k1Y6tRuePuovPdktn33wOrCd9HXXovG4iwvr6+qWcQJjZZ6WcGnO
	Qpwq1oThbDDnhOhlpIt0lCshjUeAyvAWQQ==
X-Google-Smtp-Source: AGHT+IHTtFpIUh9V1D/hgIg7h0JnpsXp9Bovo24GVumcqsEBZfrWrJPuzOPDear/0hml7HCNfS1GQA==
X-Received: by 2002:a17:903:98f:b0:221:7eae:163b with SMTP id d9443c01a7336-22c53627298mr52330365ad.46.1744998628042;
        Fri, 18 Apr 2025 10:50:28 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde845sm19513745ad.236.2025.04.18.10.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:50:27 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:50:27 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Apr 2025 10:50:25 PDT (-0700)
Subject: Re: [PATCH 08/15] crypto: riscv - remove CRYPTO dependency of library functions
In-Reply-To: <20250417182623.67808-9-ebiggers@kernel.org>
CC: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, Jason@zx2c4.com,
  Ard Biesheuvel <ardb@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-78030c23-f066-4b83-8d7b-c1720725199d@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_185032_430097_FC7F7D35 
X-CRM114-Status: GOOD (  18.13  )
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

On Thu, 17 Apr 2025 11:26:16 PDT (-0700), ebiggers@kernel.org wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Continue disentangling the crypto library functions from the generic
> crypto infrastructure by removing the unnecessary CRYPTO dependency of
> CRYPTO_CHACHA_RISCV64.  To do this, make arch/riscv/crypto/Kconfig be
> sourced regardless of CRYPTO, and explicitly list the CRYPTO dependency
> in the symbols that do need it.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/Kconfig        |  2 ++
>  arch/riscv/crypto/Kconfig | 12 ++++++------
>  crypto/Kconfig            |  3 ---
>  3 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bbec87b79309..baa7b8d98ed8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1349,8 +1349,10 @@ source "drivers/cpuidle/Kconfig"
>
>  source "drivers/cpufreq/Kconfig"
>
>  endmenu # "CPU Power Management"
>
> +source "arch/riscv/crypto/Kconfig"
> +
>  source "arch/riscv/kvm/Kconfig"
>
>  source "drivers/acpi/Kconfig"
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> index 27a1f26d41bd..08547694937c 100644
> --- a/arch/riscv/crypto/Kconfig
> +++ b/arch/riscv/crypto/Kconfig
> @@ -2,11 +2,11 @@
>
>  menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
>
>  config CRYPTO_AES_RISCV64
>  	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_ALGAPI
>  	select CRYPTO_LIB_AES
>  	select CRYPTO_SKCIPHER
>  	help
>  	  Block cipher: AES cipher algorithms
> @@ -25,43 +25,43 @@ config CRYPTO_CHACHA_RISCV64
>  	select CRYPTO_LIB_CHACHA_GENERIC
>  	default CRYPTO_LIB_CHACHA_INTERNAL
>
>  config CRYPTO_GHASH_RISCV64
>  	tristate "Hash functions: GHASH"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_GCM
>  	help
>  	  GCM GHASH function (NIST SP 800-38D)
>
>  	  Architecture: riscv64 using:
>  	  - Zvkg vector crypto extension
>
>  config CRYPTO_SHA256_RISCV64
>  	tristate "Hash functions: SHA-224 and SHA-256"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_SHA256
>  	help
>  	  SHA-224 and SHA-256 secure hash algorithm (FIPS 180)
>
>  	  Architecture: riscv64 using:
>  	  - Zvknha or Zvknhb vector crypto extensions
>  	  - Zvkb vector crypto extension
>
>  config CRYPTO_SHA512_RISCV64
>  	tristate "Hash functions: SHA-384 and SHA-512"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_SHA512
>  	help
>  	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
>
>  	  Architecture: riscv64 using:
>  	  - Zvknhb vector crypto extension
>  	  - Zvkb vector crypto extension
>
>  config CRYPTO_SM3_RISCV64
>  	tristate "Hash functions: SM3 (ShangMi 3)"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_HASH
>  	select CRYPTO_LIB_SM3
>  	help
>  	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
>
> @@ -69,11 +69,11 @@ config CRYPTO_SM3_RISCV64
>  	  - Zvksh vector crypto extension
>  	  - Zvkb vector crypto extension
>
>  config CRYPTO_SM4_RISCV64
>  	tristate "Ciphers: SM4 (ShangMi 4)"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_ALGAPI
>  	select CRYPTO_SM4
>  	help
>  	  SM4 block cipher algorithm (OSCCA GB/T 32907-2016,
>  	  ISO/IEC 18033-3:2010/Amd 1:2021)
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 2467dba73372..8c334c9f2081 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1424,13 +1424,10 @@ endmenu
>
>  config CRYPTO_HASH_INFO
>  	bool
>
>  if !KMSAN # avoid false positives from assembly
> -if RISCV
> -source "arch/riscv/crypto/Kconfig"
> -endif
>  if S390
>  source "arch/s390/crypto/Kconfig"
>  endif
>  if SPARC
>  source "arch/sparc/crypto/Kconfig"

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming you want to take this with the rest, thanks!

