Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE4DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEsXF9Ci0pOXKtOKAJPjgn2loXpllrh4pvEkKsXbuQ0=; b=48NrRxNN+JauzCF/g3kEDjY4Vj
	Ps7Acry9ltHf3QuH20gI0Vtv/KSs4Dfz4amQTX0Kpq//pWTPTUIYnqZTUgEYsD0uV3VZ5IDkUVhHY
	fYdZCx/vM+H11KWzJYPZQZSpGwB5u869zYQ7NW3dXHiGl8V8V1n/mWY2e+Nr1CGM9Y+diUZPevdAa
	MLoy5KgK4cFasl+VhPZLiJHIWVtvcXBArGqKOPwUY0fcPx04UfKQ5Um9544+bF3YLIKi6D/ySXUno
	05lKqCs7ZVYu4FJFWZjVfuSZUm/2XQ2nfno6+gwBRr3zcxN63nf/0pIs2WU7GrOgMA8lz1vvmS8Tb
	UqGpvpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACEI-0000000DhL4-35N1;
	Wed, 30 Apr 2025 18:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uACCM-0000000Dh07-2OYg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 18:30:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D4E904A747;
	Wed, 30 Apr 2025 18:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B0BC4CEE7;
	Wed, 30 Apr 2025 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746037816;
	bh=+Bh8W2opHqTRaacu/woH8jsXXpI+2jmNYlTxL3d821E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JkjsRPYlAsu1h78KDySX25PgSxCEQQwPBbYGDI+dVxcyA+ledZYULD/nf80rFHTmT
	 jz4eZW27iWvei/YehGt1vTSNurOLzCK/MtbaY+N4635Gy6UFwiHv1kzjeVw/4NsKGS
	 LRdygwbPVG37+ZS/pkpG7JFPd+ctzoqYsUWVPv0jMhUejpy18j7XXOHdWTAJqK+SNH
	 kKymcWmoivX1DomlQ+updVqU+saEnelIQ0d3ViCPLR4+yDthYf1Ii26xLIlWID0EXI
	 2W+qFiaQf/j0i21Rgkr7royQpTd4SF05Wh9GhG+0abzxQmVfkQvSw91WWSgP6F6ZwK
	 mzfIHdS8QQIjw==
Date: Wed, 30 Apr 2025 11:30:12 -0700
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
Subject: Re: [PATCH v2 1/4] arm64: Introduce esr_is_ubsan_brk()
Message-ID: <202504301130.184F0BC@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
 <20250430162713.1997569-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430162713.1997569-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_113022_625110_446DFF9E 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, Apr 30, 2025 at 04:27:08PM +0000, Mostafa Saleh wrote:
> Soon, KVM is going to use this logic for hypervisor panics,
> so add it in a wrapper that can be used by the hypervisor exit
> handler to decode hyp panics.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Mechanical change; looks good.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

