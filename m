Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566A5C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fl7g83EJcOWH5FHBku4zjmzjCnfMb9T61oBNbl3E4mA=; b=MIzO8R+n98L0T9tKAn7CaMsSaS
	Axe5Lv+3wK3w89SZsxqaD4Z0oyjsdTtbBqsUQ4ymHfy60An3Fd6ZtJp+uiZDE4cnWtKUaadMydYQG
	tyO87tGB/0oDfbfm3vE1Vty8dKRo/EnffEfWn7tl894m5pIK7MUuKX6NBaC3u2+VqjSdtHAuhzHBp
	39MCcjqwraHyfS/ydQ0iq14cWENA23kuVJF+/3Ciah5i1krZK5Q21UPZeZQM8mBU4CECLDcV49IJT
	+O59+G4ZM5bEA6zeNAA7alK8ep/rE8Voxer/RV7y6tYKkCGtNBiChZXqOoj1T7cpq0DVr0VTVSlUK
	/KNJmPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACGD-0000000Dhf4-1cyj;
	Wed, 30 Apr 2025 18:34:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACCf-0000000Dh79-48Rx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 18:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18FE74A14B;
	Wed, 30 Apr 2025 18:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F53DC4CEE7;
	Wed, 30 Apr 2025 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746037841;
	bh=T4eePFbM5LSrE/2KS+Bqr4adCBt8knMhqfA8OjbYrTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qop5rON8lnLTAy0Dbg56VCAOI7RIIuxOiV8MxIrqC/2X45QRWrAXHobrr5JdmCqaW
	 UEHoYYd4ydI0Cbyd8mY2FVUBnesQglBpYOI9UrOgT8tQo6CZmW6WIcjtgr50MaYprh
	 mnQByuCFdBvoms8CI9ayxMitQ/PTS62hptOLj90TStt+iSQcaIk5lAT3GgLkQgJXss
	 aJkNYgMjgNE5mXwFywXgJ8ObyxRBW5a3atOi0vffbxvJET5gF0WrMZ2cAeLIi/3Wge
	 ivkUJIrqKEG0aIoarLZkmqcUdc6k3L26vA7d4N+6EtsPWrTXnsLLuGr9oG/GED3Z2a
	 BTyoubY1Uqosw==
Date: Wed, 30 Apr 2025 11:30:38 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH v2 3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
Message-ID: <202504301130.3AACEB0@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
 <20250430162713.1997569-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430162713.1997569-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_113042_079719_19ED9155 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Apr 30, 2025 at 04:27:10PM +0000, Mostafa Saleh wrote:
> Add a new Kconfig CONFIG_UBSAN_KVM_EL2 for KVM which enables
> UBSAN for EL2 code (in protected/nvhe/hvhe) modes.
> This will re-use the same checks enabled for the kernel for
> the hypervisor. The only difference is that for EL2 it always
> emits a "brk" instead of implementing hooks as the hypervisor
> can't print reports.
> 
> The KVM code will re-use the same code for the kernel
> "report_ubsan_failure()" so #ifdefs are changed to also have this
> code for CONFIG_UBSAN_KVM_EL2
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Thanks for the rename, this looks good!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

