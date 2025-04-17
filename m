Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC559C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 13:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a49fxGq1XoHyE2U3x1UJ5ixWz+1/3CcS+lXQ+ObVx0s=; b=GGKgkInw0iFseBIBRqGf9fTjBU
	4wm205EcnDiPyyoo55U8cyGu2oQl2gsBOkfiMM9eyF9pVFOQOxVL3q80Mi0kos9UgZneEWOwNXP+j
	5/zPRK4bcj5DB0sIh/+DckX1XACzBSG1ujs8oRJd3pOK/RtvsbAEB8N8Wp0Dzk2otELRGj2vac5uz
	IzwciigQcnMMvDwLVPqUllDHsMjnGm/ypYNaZadAn/NL0sD1vBt5HFII5g2ri2otMtMzdldSSqAxx
	WLLP60tXJ7kmSxRZv6qWgpL6hSmzsrbvqpDvJsHGL+Hhw3BAq4uiWcoveNwc8rMO24Boupopu+Q3b
	cSze+NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5P8o-0000000D74a-3aAG;
	Thu, 17 Apr 2025 13:18:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5P0s-0000000D5hE-3fBW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 13:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EEA668436;
	Thu, 17 Apr 2025 13:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16539C4CEE4;
	Thu, 17 Apr 2025 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744895441;
	bh=UX5aCpiFPWHDn5y5lBqZg3C21rUMdQGu9cwtYACqRIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jQVhPpVgwjufYHxGJpES7G6EpaKPVUoh06ZvwZmLlTYAC+vceHN+5dH1EA5pdas5d
	 47tCETUmeOH9XJMp1YCNKlYdN6LZpIkEngGIzw99nIjo0KAwxLZ59LGxlJcihXoNcR
	 AafOC2sU9MAE0Dhsf41hhdjLI3D5xrmORZyfVZTmybLfZ8TUUiLybwJ3Yw71W/MP22
	 tMHTB3P1vubgOdPMt3PgvOzq+ia+xfWJQ3gIBGP2svj0kP+iq7FeCTjxXnJ+viR5fT
	 JT7/n5/p0gCbfMOQQ+NtM5m9n3rxdnwPODhXv/zB6LL9lkUwFKycInnA8q5pivCllq
	 tYdpSPxfWrioQ==
Date: Thu, 17 Apr 2025 15:10:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] i2c: pasemi: Log bus reset causes
Message-ID: <yxzzpnf2eprgaoaghuptj2izxyuu3rzdldm6emsob7asrsxbrk@kzrlellx3qim>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-pasemi-fixes-v2-6-c543bf53151a@svenpeter.dev>
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

Hi Sven,

...

>  static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  {
> -	unsigned int status;
> +	unsigned int status, xfstatus;

Let's declare the variables in the innermost scope where they are
used.

Andi

>  	int ret;
>  
>  	/* First wait for the bus to go idle */
> @@ -98,7 +99,9 @@ static int pasemi_smb_clear(struct pasemi_smbus *smbus)
>  				 USEC_PER_MSEC, USEC_PER_MSEC * TRANSFER_TIMEOUT_MS);
>  
>  	if (ret < 0) {
> -		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
> +		xfstatus = reg_read(smbus, REG_XFSTA);
> +		dev_err(smbus->dev, "Bus is still stuck (status 0x%08x xfstatus 0x%08x)\n",
> +			 status, xfstatus);
>  		return -EIO;
>  	}
>  
> 
> -- 
> 2.34.1
> 

