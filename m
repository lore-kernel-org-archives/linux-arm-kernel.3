Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F340D7495A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 03:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6Hk2iByrl+ZQ3rlmE7kX1tVXBrw5AAsnQptTHF94QE=; b=pEZCEQLgG6XR5L7k5ql5C6gh5W
	dwBeEBYcMaK8V0MeqlTWOnvWHxn+OgPXO6AAGBlniflr11rzLq/PDrNJpRX5P5iFQR1oUvCJn1Ubl
	cYCC3VflES0HLvR4AxIpHCc47+kHg3m7WRGGLpkigjKEUDzsHqpXi76vTxFn50FsS6R9zSmNBnK4l
	ymX5N2kEGH4YCzbqmSQ0ant77raXRgyqKac/FdIaJeJAovhdYft4868EudiQq8z3XMha+5nWxwzRj
	M17cWNzppw1MUygOOYd6C7wL13t14Pnm1xctzovx6SW6t2mOpj6ejDPJF33iyohx3va8EqBw1tCqg
	t3pMeifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zor-0000000GdIb-1bT2;
	Wed, 30 Oct 2024 03:56:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5znF-0000000GdDV-0Wya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 03:54:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C34B5A43328;
	Wed, 30 Oct 2024 03:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E18C4CEC7;
	Wed, 30 Oct 2024 03:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730260487;
	bh=m9jRoaIjj0R3IBUXDEbeFOIY1S2xyAMDH0k/CvRVTYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6VEzGM4OLD0pv9QDVMHcAbG2j6QHoNg45lYOw+iCNGs1NApsMbi+AJA7yOHrP037
	 xcptzsNLK6Q5XeGjMPV2dbxFLJdGI4s1HgnnnLGs/FqVGa+9lqirrhZNi+q3ppYbO9
	 bKb8o4AFxLL4s/T0/G3dCAmh55O/Rbsh7rPB9pZGD3pz9ydp9HbBMrST60vCmamqab
	 WFoMNbiA8DXScTxKS6hiKauokbW0w0cVeGpTuKqSOHH4G+RDB6oXusmNIc0uRrRl0D
	 LhIoOGx6Jk2XaBL56e6qTy4QPIFxkTJe9LfJ+xptpquwzbf6vJy1vbHDaPo8SF4FVq
	 vj6Uyy4+U1SMA==
Date: Tue, 29 Oct 2024 20:54:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	herbert@gondor.apana.org.au, keescook@chromium.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 1/6] crypto: arm64/crct10dif - Remove obsolete chunking
 logic
Message-ID: <20241030035445.GA1489@sol.localdomain>
References: <20241028190207.1394367-8-ardb+git@google.com>
 <20241028190207.1394367-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028190207.1394367-9-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_205449_246950_14A2635E 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon, Oct 28, 2024 at 08:02:09PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> This is a partial revert of commit fc754c024a343b, which moved the logic
> into C code which ensures that kernel mode NEON code does not hog the
> CPU for too long.
> 
> This is no longer needed now that kernel mode NEON no longer disables
> preemption, so we can drop this.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/crypto/crct10dif-ce-glue.c | 30 ++++----------------
>  1 file changed, 6 insertions(+), 24 deletions(-)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

