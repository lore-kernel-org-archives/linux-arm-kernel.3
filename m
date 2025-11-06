Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46084CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3J+wL44QuPWoKwDUc5yLWBndCPl0lNxD64B1KJ4AW4=; b=SkUceN4tlbZIJpQrqGozXUn4vM
	cb3qZ4ywQutzaUGF1ishFkiW7Mm2t2P65CONOesXPK9KFManap4zcvHryggJOj26JNpn+pDPxKPWe
	mJEVYr689EPpkr3m8EklfYh9iVOCAJtJVgtvwKXcECeUOp1NL5H7lD2udVlvupoALxeVTODOBtfQC
	BozAYBmgtqLGm6UhwBR3QbYRFyF1a1+qHR5//PyAm9s0MnN78tJB7bFGX2ICmALMcFtJhoOZghJhM
	Jg2cSPq08UeqicBD2jhyBqTYQlKZIUDNjJYNUgkJ5KEkEDCe47BfaZmJ+9spVenBtLizQD+OIAB+d
	WB4izCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH39p-0000000Fxbx-2WvY;
	Thu, 06 Nov 2025 16:48:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH39o-0000000Fxbp-2GI0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:48:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DC2E618FE;
	Thu,  6 Nov 2025 16:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC5AC16AAE;
	Thu,  6 Nov 2025 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762447699;
	bh=C5wiFf0HtzjNwELAgnIcKzS2SjngF5LO34y+NigSrww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPAldE4Hi3LS6gkbwLjpFilfSJwWbAwjhaM2cdjdUbsy/R10VpiECYSdy2UCAr8A/
	 2sEkllP8ZshVididPe4K/fi8ryYZlkyKFtczyH81Z3NwP2NKW3oV+NCOyadqpECMmK
	 5BZBAqOls43gp9jFSH/f/q9nJV/WlghIQdLhR/uQjR9Gs4wMk7XqP9+Wa8e/rZawoH
	 eAjacCD9Jai5uhg8rS4FGU32YHHsPY2eKfx4ugYYMH3QF6RViRaleGCnJCQqWd9Jid
	 rL+2ggNqcjVto5yqq7KlXSYo7gv1TCd9r2ImAuqyP850YpGjS/ZKwUr0e6J/pWv8HQ
	 3lY4pYJY9rBxQ==
Date: Thu, 6 Nov 2025 16:48:14 +0000
From: Lee Jones <lee@kernel.org>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 06/21] mfd: prepare to generalize BITS() macro
Message-ID: <20251106164814.GA1949330@google.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
 <20251025162858.305236-7-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025162858.305236-7-yury.norov@gmail.com>
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

On Sat, 25 Oct 2025, Yury Norov (NVIDIA) wrote:

> In preparation for adding generic BITS() macro, add an #undef directive
> for the existing BITS(). The following patches will drop it entirely.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  drivers/mfd/db8500-prcmu-regs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
> index 75fd1069372c..25d2d5966211 100644
> --- a/drivers/mfd/db8500-prcmu-regs.h
> +++ b/drivers/mfd/db8500-prcmu-regs.h
> @@ -12,6 +12,7 @@
>  #ifndef __DB8500_PRCMU_REGS_H
>  #define __DB8500_PRCMU_REGS_H
>  
> +#undef BITS

Doesn't this get removed in 2 patches time?

>  #define BITS(_start, _end) ((BIT(_end) - BIT(_start)) + BIT(_end))
>  
>  #define PRCM_ACLK_MGT		(0x004)
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

