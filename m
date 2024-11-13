Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6BAD462A3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1cZIurGHSFm5igQJ3WS0qdAcXWekFSNUvBBVdDMcRc=; b=fyDHbD7FJVnuu5dsGiIPH2v0FU
	rh+VvtZUwzC7N3XGMI3phSTkCWn6PkIPlPTJnClvKZ6EBpJJJMIQD5veXiM0jDN3epwkP+gOk5K8Z
	smy/8uRI/wU3p1bIb81PFHWxaGxDBHfSf4xIH5IqDKtbvnoMRnZPyJLLku02Q5RNWNyHAz6pRCmig
	kOWNGNrsUgE6utyNAgqMDxBOc1abQ6VI3YB4i3Eznd40gj1en5J8VKRUHv+ZYbVxK9utjaafCBMbQ
	sLkpXXMeIstlIGfTxIFcc2TyeTNVJ1X3YX1oA3g8935daOhJ5XMKOxQRXBZ61/df+PlP2FFg+G7LS
	mM3JZvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDtD-0000000719h-38Od;
	Wed, 13 Nov 2024 13:58:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDrH-000000070iC-2DgN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:56:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A42E6A40873;
	Wed, 13 Nov 2024 13:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C0BC4CEC3;
	Wed, 13 Nov 2024 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731506194;
	bh=gsUS5NkYc+BSuN+B87UnPKIrPHzMI5FqQyudN3+W+4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5IVoU1pGhtU2vmp91T6VWlU4stkV0YbBXR90D0DCX9lStjm6BZRycxlkUrkvu2Ut
	 nSb/xhJ7Y+1kAyW+0PEEGLvgZ6fQQuYz7F2F7ggdLtO9X+fz0nY6gk0MWQ1enrG51d
	 +f3jsI+D7+gznMbQdKRa/I8T1DrEHdZierzi9L7S2hYoTK2fQn48fw8lEl76GC46MB
	 89zKKUpx7RYBoMU2tugTqzdvn0zOAiEQv1yrBSv+rfwO4qdVfXIu1BmHZtRbsaUasi
	 Z/Hl2nO0EorddK5pwCRXlPcVeWmSb+gLrPU2GN6CGr/gZs94UjJeqMKSetvgfzzeXC
	 3O89wj+TIlxvQ==
Date: Wed, 13 Nov 2024 08:56:32 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/6] Clean up and improve ARM/arm64 CRC-T10DIF code
Message-ID: <20241113135632.GB794@quark.localdomain>
References: <20241105160859.1459261-8-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105160859.1459261-8-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_055635_664437_EA21E93D 
X-CRM114-Status: GOOD (  18.76  )
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

On Tue, Nov 05, 2024 at 05:09:00PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> I realized that the generic sequence implementing 64x64 polynomial
> multiply using 8x8 PMULL instructions, which is used in the CRC-T10DIF
> code to implement a fallback version for cores that lack the 64x64 PMULL
> instruction, is not very efficient.
> 
> The folding coefficients that are used when processing the bulk of the
> data are only 16 bits wide, and so 3/4 of the partial results of all those
> 8x8->16 bit multiplications do not contribute anything to the end result.
> 
> This means we can use a much faster implementation, producing a speedup
> of 3.3x on Cortex-A72 without Crypto Extensions (Raspberry Pi 4).
> 
> The same logic can be ported to 32-bit ARM too, where it produces a
> speedup of 6.6x compared with the generic C implementation on the same
> platform.
> 
> Changes since v1:
> - fix bug introduced in refactoring
> - add asm comments to explain the fallback algorithm
> - type 'u8 *out' parameter as 'u8 out[16]'
> - avoid asm code for 16 byte inputs (a higher threshold might be more
>   appropriate but 16 is nonsensical given that the folding routine
>   returns a 16 byte output)
> 
> Ard Biesheuvel (6):
>   crypto: arm64/crct10dif - Remove obsolete chunking logic
>   crypto: arm64/crct10dif - Use faster 16x64 bit polynomial multiply
>   crypto: arm64/crct10dif - Remove remaining 64x64 PMULL fallback code
>   crypto: arm/crct10dif - Use existing mov_l macro instead of __adrl
>   crypto: arm/crct10dif - Macroify PMULL asm code
>   crypto: arm/crct10dif - Implement plain NEON variant
> 
>  arch/arm/crypto/crct10dif-ce-core.S   | 249 ++++++++++-----
>  arch/arm/crypto/crct10dif-ce-glue.c   |  55 +++-
>  arch/arm64/crypto/crct10dif-ce-core.S | 335 +++++++++-----------
>  arch/arm64/crypto/crct10dif-ce-glue.c |  48 ++-
>  4 files changed, 376 insertions(+), 311 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

