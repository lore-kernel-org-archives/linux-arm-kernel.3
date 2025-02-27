Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D358DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 07:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4Cf2Q2JGCb1vUFOG2D8/BTiCyHZaa8abHDKG2+9Rns=; b=160gd7CepUCC+KXcO4wIyQn6yg
	er0T3TkoLFB/R2d1pypX3D5R16AKv2eJmoGn8Bs22iO4bFojTcSg1hlT9Xxg36M7T9PLL6h26zMVO
	PdGJL/76GJF6bvuHvN9UTV2l0lNnrHAJ9YjedRC8MVESHUZZpI+39lxtRBGQEJFvNxG46QXOBOoDr
	yq8NTuVrlySqLf3adTSk77qApmJGHGWkZzoRYBPL0yIYFgjhPsSfwmGMVx0mBDhCZO+WE72gXLfY6
	64hV16wYdcpTck2uKlcaIXQ0q8bGUEPKfokQ0NvFYk/zTyARPlgEtWWu0CscK9nLUH7lpaXD50ICh
	gHJ3cldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXvS-00000006W5m-2OrI;
	Thu, 27 Feb 2025 07:03:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnXtu-00000006Vpp-3CDM;
	Thu, 27 Feb 2025 07:01:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2230c74c8b6so16795255ad.0;
        Wed, 26 Feb 2025 23:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740639702; x=1741244502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4Cf2Q2JGCb1vUFOG2D8/BTiCyHZaa8abHDKG2+9Rns=;
        b=gmvrWxSG4l0vz7XjInljjtVbVp+P3wExic759BwDLeilrqRxCvvJt1zHGHUtFeLFkz
         B2OBc+jrkuSVps5GECoWKXJk4rfQXQimUfZr3Zopp2pb7i4yDhqZg1C/gLgIS6aLyKKY
         +wldBUb7Bhqgrf/lNxfY5FvgNelMNzcQnVXOUitZCNZ+Hjnvnv7pTPHhnfAdc8BpqO8N
         DyFjxX31MBEaAUvmz8DUv08s6thpfBR8bbQ3qFY0UijYF8FhApVX7bn2bAOe/gZ8uR2w
         RKsKE9Dyk8508NZCt09WrYptOMhrwX7KYIeg1FW5QHLuRMn/ZcpMz7/ybq89cJ2v7qDI
         WBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639702; x=1741244502;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G4Cf2Q2JGCb1vUFOG2D8/BTiCyHZaa8abHDKG2+9Rns=;
        b=k4q+dzH73GyUl/MdfWpkM9SLII8ORSYv2DfOELAC6JFuYMYqWSfKTVn/W/B9j9BlB9
         TI+QVFMdJSenp8v6IrQkxqpYpqPDdvcaUXjbQuG6AFatIIjuY6I9oZhw8pzf0Tq6TLaH
         eJR6BcW+hdfx4y/W1ox89gaju2E2brcwewcqZIPf1YOSrwd55lMPkAUabIv2NzNU7Rkt
         uQXIOjacQUie0jB1qmSXSESI9Qlwu6fEvz/4OiVZPlYTNUQBYyO1DBhbQ8nAWzg3r8gH
         Pbu3jCfh0WhOkfYsM6Fg3m+ofsZqlSkTfUp+p+sKzhF/ogfIbA+1iPbqeMR1tGCq28D+
         Y1FA==
X-Forwarded-Encrypted: i=1; AJvYcCVW4d/LVQ4v58wKMhsex2p2syn4TQaNvCMrigsGvegGOLZdG2iTWTqfdD+WjE6ilIf0F6FZ9gm8dFrD3eDlddmA@lists.infradead.org, AJvYcCXrRMf+oiadlFS9xlgWsDS59nMugD51yFBr+rcne2EQ9AH/UUzEg+lecVOnUIShgq8C8AkCtwoRgM5EoMs=@lists.infradead.org
X-Gm-Message-State: AOJu0YymTvwcQ3F11p6Kzeqt1Vrh/5gVY2oAtkjGtV219ffBVK6xDfU7
	mpMgGyc5A6+/WeH4meJMWkRlWVoKaxuAZ0R9fTxgV176hBBNkjvG
X-Gm-Gg: ASbGncshB9smcjbY4t7J3eVpuy1+ZtPzx35vVKuMAYBIyF5krmIMFmahJxrRBUcSNNv
	rm2jIZb8ahYy1FZYtJu7xRZRxglWMc+4LVKEmPuMLJhW4GdBX+9B54PryyNHs+5uhsCJNPokHJl
	Om7a6CMgnnUp3CLj1OQPxxfwYF0ArvS2QOP7r5DeLnZNbeAnQiQtTUJkkO876Jwf5ar67cgsTXN
	lG0ab8U2fJ7vZu6txRuAAcIX6CBuVX0fV/Ch437Cu3G10atmNUbXheVhQNGAJb+1VfVFOVW/GU7
	sUkMM/KloJfiQiZ5Ek59UspRgWOcDlaM3HVZT7ThXHzy8ZaZTDnoKWUA7jmk/hT42b91V3wn6Do
	BMCgsZwU=
X-Google-Smtp-Source: AGHT+IH6Gzg0OYHyzDi78b7AFnhF1INa9SiQutoDGstlfU8EBaRq8eklnquk6k8/CG2wX5A54qoa2w==
X-Received: by 2002:a17:902:db0f:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22307e6587bmr163986135ad.39.1740639701881;
        Wed, 26 Feb 2025 23:01:41 -0800 (PST)
Received: from localhost (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2bd6sm3160785a91.21.2025.02.26.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 23:01:41 -0800 (PST)
Date: Thu, 27 Feb 2025 16:01:32 +0900 (JST)
Message-Id: <20250227.160132.578901242125873182.fujita.tomonori@gmail.com>
To: catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 peterz@infradead.org, hpa@zytor.com, will@kernel.org,
 tangyouling@loongson.cn, hejinyang@loongson.cn, yangtiezhu@loongson.cn,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v3 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN
 asm code sharing with Rust
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z79rO-wRZtN5S8f9@arm.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
	<20250213135759.190006-4-fujita.tomonori@gmail.com>
	<Z79rO-wRZtN5S8f9@arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_230142_800486_52BD140E 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

On Wed, 26 Feb 2025 19:27:55 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Thu, Feb 13, 2025 at 10:57:57PM +0900, FUJITA Tomonori wrote:
>> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
>> Rust to avoid the duplication.
>> 
>> No functional changes.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks a lot!

RISC-V and LoongArch maintainers,

Can I get an ack? Or you prefer a different approach?

