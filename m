Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018B1CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awjIVE5GTEF+KDsYhCwHYpegGXK7Ot+lcer0SPzDWFQ=; b=BR6nPSXzM8U9r6r0f2kyYwmXn4
	MCRAv8clPstnW/ZJEcexqzk/8tvWyGbLanLL5Yu+0CfWYdRUd03KmQ3fGCU5PslVf+IjT42MSyBzH
	Mmdii5jQfFLBwx+SulmW/arrbxId7YkHdITYblYqysVut5vbn2pORn7RrrJtX8U64dnsViqk7XfVM
	sZQIudN3+ZMpFYQPgV9C/zPQD+YRovLtWpJHha8i+Y5uMMXczzE40PaC+y9H4F8plC+ZupZZppTZU
	eUb/Yy3M5jjxwtYhTNzKaH99NTC01tHQT1eGNs892bTtNYUiNeoGDCAcdVOiNRHqFbvQ+C8gPlPxQ
	p4IIAouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M0C-0000000AnRm-01Or;
	Thu, 02 Oct 2025 16:17:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M09-0000000AnPe-0QBP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00D0F490AB;
	Thu,  2 Oct 2025 16:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CEAC4CEFF;
	Thu,  2 Oct 2025 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759421871;
	bh=TdGO/UgXtuKgeNJ7B5QwoIhZurKp1jniMNAKLD4x55M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezcaU6dPQ9zoGc2Ek4Pyu0FH07Ntmutca4epdD7cs59WmG/tidw58Tc2basWIBj9/
	 TVErReFMSpFvAg8uR4RCYlnANxcCniV4w6iGNMRwhmFfXUORgJkaU+6u7gTFtQFWHw
	 ZxL2MFcz8gUmv6ryA1WJO84PCDDYdI3b1pF0jPaTdee5z4QAWxpEP1n9Yql/DnwhJF
	 jg7J1aORbcefgJFEQEJp0T4foCxIwbecMeucJQXsWx9JG057NDvmgvSk3tKUrQIHc7
	 qaLP3DDoPk60HWnbtIOm1oktLbrhGLooVMDM3FJyho6F10Xp3DfbaUJHfbbacwH/6v
	 cQePe2piMaKKA==
Date: Thu, 2 Oct 2025 09:17:50 -0700
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 02/20] arm64/simd: Add scoped guard API for kernel
 mode SIMD
Message-ID: <202510020917.8BFF293824@keescook>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-24-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-24-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_091753_155074_2B19CFC0 
X-CRM114-Status: GOOD (  11.78  )
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

On Wed, Oct 01, 2025 at 11:02:04PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
> cleanup guard. This hides the prototype of those functions, allowing
> them to be changed for arm64 but not ARM, without breaking code that is
> shared between those architectures (RAID6, AEGIS-128)
> 
> It probably makes sense to expose this API more widely across
> architectures, as it affords more flexibility to the arch code to
> plumb it in, while imposing more rigid rules regarding the start/end
> bookends appearing in matched pairs.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

