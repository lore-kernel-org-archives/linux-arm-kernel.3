Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E52C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=; b=PEEAgfc3XebuzGdEYyaIvO6qzO
	tzAkdGjhGwlEvgtMDvMKVRuKyI+wls6aEiBqc015EWaIY99t8YNqr0x4RjxP2p9Xi2XETEzJF+kpf
	jZJDi086yBtj7izsh8ArCXyFrjVL21p7ZvJD6R408Y/EvkT9RkIHkISqwvDNZ5qrcQ7e5EYUwrmKx
	pBkE6PjXImoqDyrksDIip3kuJCzbADV5c7MGZfxvMI1Tb/bFwXY35mo/xQvZsegARILb1FVT6TFbw
	OOKlfP60bXwC6GfGsCTdvrmVpT8Yk0FiKTYDudqac3ZzILXPVPBowWcvsGUwyfpdn9Dkor8AvuPx/
	nAQpf7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAog8-00000001nJS-00R7;
	Fri, 02 May 2025 11:35:40 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAoOT-00000001lDK-2DTQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 11:17:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso7962205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746184643; x=1746789443; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=;
        b=lZOYktcCiHRuBmGPR3g0MAmtYTnqitLSQijF3TOKnh3AaX91wHWutdpIEfowekbw8A
         TNjdC+djfZRkp7AVD8fhFX+tXQvcqAuJO0zB4e9cbqWHKgp0s1HbIo8bFs+bvUuBp5K4
         FQwvo3UmmwiTnXaNT3lv2/khG+5SgxjfrBgVbFR6/S25topC9ThcH9mb21ZG7EOneRfG
         c6bsLtx0/dlSjJ+TTPpfpRcD9fkn97Nacz6pPoKplWQfQwawg7bepsacyMu21Q/zjMWd
         HjcNlR3RrbI5x/TJvfSrcCGi42kwrcaoai6ewuuI/hp22TadJ6JD6O2kjyphrZ5WhEo/
         DaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184643; x=1746789443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=;
        b=eXrJxG0esAoqkvqlaeoxoAqgM1vAj7i0HBs4YaOeUdHNPbWItXihA/QCQlIliUURDA
         /QWOxu9koiujCgBUPzVuiJPGpnVt3vLJFKISiazBxa3t7m3NFTwh9M1wc8rboLW7lS8u
         YqfNqurKQInVWwuLtYlW0rF8FiK+ibs+0JeumaH5HiQFItncCVcpUVmx0uAYeJ+r3McY
         MD10UrFjhLSqG5qUDjdUc5Y0tcw7GZrUTj0hnFsvYXOFQZDiuvCrWCDnUYF7U/QnS5yG
         YZgeaqhpDl60/T/zCsos4+OPnpfLDsWA1kVYq4b45eDCB+Zly4GVQ7WXYWxeyy25TpYg
         /gxA==
X-Forwarded-Encrypted: i=1; AJvYcCXa8AuZP/6/lTfCUt2YCuRRX22Dp+dnTSfDM9z3JvijKqoYafuGGLEtByT/srbj2YSR3Hhsq5b6MkCVDyl39/Mf@lists.infradead.org
X-Gm-Message-State: AOJu0YwQijmuh/gFLsR9FPdXTCzYF1ZCtImQH6MRi/oHoCIy6UVKpqgD
	y0ze3lrwAPAG6nNRPKESgwJYsSUAvi22RTfFMZrN6ntg+fQHKCSFg0eZmLwINxgAoMNn2pYJ7MU
	AoWaWCopj0grOiQ==
X-Google-Smtp-Source: AGHT+IE72hvZ6mV4D/kXtlS6V50J8cDZa9GKooUY0w71JECu4b4Ctc5ADtyJqEQ5cdCjB5Oy5b/n+Jkyg9Gzn9c=
X-Received: from wmbel14.prod.google.com ([2002:a05:600c:3e0e:b0:440:5f8a:667c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr50048405e9.9.1746184643608;
 Fri, 02 May 2025 04:17:23 -0700 (PDT)
Date: Fri, 2 May 2025 11:17:21 +0000
In-Reply-To: <20250502094537.231725-5-fujita.tomonori@gmail.com>
Mime-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com> <20250502094537.231725-5-fujita.tomonori@gmail.com>
Message-ID: <aBSpwXh0GnuyXyST@google.com>
Subject: Re: [PATCH v6 4/4] rust: Add warn_on macro
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_041725_567908_3DB1AC8C 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, May 02, 2025 at 06:45:36PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable annotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

