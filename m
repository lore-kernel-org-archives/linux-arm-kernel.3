Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9607CC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ve0L2KMTf8VYmxPzzz0cRHh9fEHMH/Ae92c9dfad8QM=; b=KipQ5Ps0rvFJG+kFJW2OBuJWbP
	2AUcuJqfXj9YjBXC6QbkLOnFd9IWR64ppSBLPjBXspt+8SEFEULZLv1wFywVAIz7z4xDrC1u2oP+M
	XtolZ30QN2WGozOI1+lyhpRXVsvIymTfMA8L/uqE6PI+Bh7FrT06kGxGFlYHI7bAQIPr9Sjw+tcwh
	ablUk/hNxlfSxQnNGlYoMcbelLFlDZEGFYDckB2v+eCrtWcM3/j4zu1IkQxo//T1e51En/+xv9fdp
	dmM+bD/PRXGO+VN33p3xJ0ebFFcnYAxGr2xn0JxGj+W2n7XvoYJy7fEw/Ij+wXpri2CXhnwEupymd
	jlxdbKIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnN7L-00000005A4x-0Pgv;
	Wed, 26 Feb 2025 19:30:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnN4d-000000059N2-2CvW;
	Wed, 26 Feb 2025 19:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0C94A5C6167;
	Wed, 26 Feb 2025 19:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8977AC4CED6;
	Wed, 26 Feb 2025 19:27:57 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:27:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	tangyouling@loongson.cn, hejinyang@loongson.cn,
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v3 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN
 asm code sharing with Rust
Message-ID: <Z79rO-wRZtN5S8f9@arm.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
 <20250213135759.190006-4-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213135759.190006-4-fujita.tomonori@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_112803_603252_E02EC6B6 
X-CRM114-Status: UNSURE (   6.66  )
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

On Thu, Feb 13, 2025 at 10:57:57PM +0900, FUJITA Tomonori wrote:
> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
> Rust to avoid the duplication.
> 
> No functional changes.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

