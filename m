Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 02:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWiQUGDJYpUyYTvlOld+PGAp6qItv2FNiR4OCFvP0v8=; b=OOiFi3IjGDXEvDApcpzwhldZmM
	YydXjeoG0iKKDw7K3/CVrupCfJkqL0npr1jDuS/mHy5njJJT/nu3sDgsiMj4NWGhMKqMDdR3sNM/S
	VHfyVop6GXQbb7g6DIEe0FoZoKyFEUar7jYu/2JyQ49uTPVvtM7MPWU9RK3eJiIaFlHOcGFnFGluW
	DOb3q88e3j3agAX6QCWAT6cRoz0wVMgKD1U5Unk9bDDbvHsEGACCco5ki8AdpU+0qEgBZEvvsjRQ/
	/3Y0Ex8ory2U7/Pvo4m8/SnOz4D+YX1cHw1dsavdwS+B0ILfhZSdsainAU8oArzx9o9/x0opduWBL
	bl22+3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0tg3-0000000DNAg-3tab;
	Sat, 05 Apr 2025 02:54:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0tdZ-0000000DN00-3O8f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 02:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 294745C3E60;
	Sat,  5 Apr 2025 02:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DCDC4CEDD;
	Sat,  5 Apr 2025 02:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743821520;
	bh=PzDiYIXiT4qV7j99+SEDS7NUkNdgdAH825CcNms1K7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akYWiaIpudqYuh/RU5mUvUpyjHQ9SsRC2e6O8Q6mWOaTfc1rl/Xm4ye0GFnKPa8j7
	 gZ+ZeFVE+LKlcasCzx4Ym6eGmDPTbgzIBuToPndu2DJim9j28dKoROFtiBWktOHxr5
	 5CRnpTUBPA2mQJZODX/bCDD20PcFMPcig8PvPUfq/F7vWAl8+d+CuF3gricqVC/NTo
	 pArbQE4WLxb+pHEyC0U0GCNnuyJ5uGPP1I7AJ3gSlmXB95HwcLxQaH6UzDK4dfIkvm
	 aWcygHkRedG4WHhMsCSTzmcceB1vJtKZYAO2ussw8u45CCSAxOztaRDMWIdaikrea3
	 oJqStuO7jvsEw==
Date: Fri, 4 Apr 2025 19:51:58 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/3] crypto: arm - drop dependency on SIMD helper
Message-ID: <20250405025158.GA175983@sol.localdomain>
References: <20250403071953.2296514-5-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403071953.2296514-5-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_195201_888990_DC789367 
X-CRM114-Status: GOOD (  11.55  )
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

On Thu, Apr 03, 2025 at 09:19:54AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The non-SIMD fallbacks in the ARM skcipher implementations have become
> dead code now that SIMD is always allowed in the contexts where
> skciphers may be used. So remove them.
> 
> While at it, remove the sync CTR helper function now that its last
> users have been dropped.
> 
> v2:
> - drop unnecessary includes
> - add patch #3
> 
> Ard Biesheuvel (3):
>   crypto: arm/aes-ce - stop using the SIMD helper
>   crypto: arm/aes-neonbs - stop using the SIMD helper
>   crypto: ctr - remove unused crypto_ctr_encrypt_walk()
> 
>  arch/arm/crypto/Kconfig           |   2 -
>  arch/arm/crypto/aes-ce-glue.c     | 104 ++----------------
>  arch/arm/crypto/aes-neonbs-glue.c | 116 ++------------------
>  include/crypto/ctr.h              |  47 --------
>  4 files changed, 20 insertions(+), 249 deletions(-)
> 

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

