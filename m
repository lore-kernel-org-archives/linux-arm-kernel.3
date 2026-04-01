Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CD9D35165
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYNXoDLuWNfwp5XBEd4n/pNv5MYXSU3jRb1oqKiPsCc=; b=zOdxc0tuvOucKzpGgL2QlzHX8S
	2rtL/S7JDY58J1SPacd+0TYb39X/ragOstvl7LLnu5W8UY7j9BQQ1XzG79K2zEYUHTA9Wgdej4Go8
	Yyt1hwp5TWV6h0YbgAHzA5wtq76zoVsPBKu5bJ6dZeQy6UR3zT62klNW0NZSfztXLyFxcZQmzu4Yd
	ZJqooxPXFzDIcYIwqRNl733aXBQxDCmqu4BojwjY+3v8yJQKfgAv/EBfuiRs1G6JwUnxe0yTWhoIe
	mOfGyDKvK7qz2F3p/EJihQ8bFLpMQt/pyytCTees0y/EPml2T5RDYUoHU4M+zUI6t4ub4lDv+oOaD
	QLKxlYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yJZ-0000000FiaI-0PVO;
	Wed, 01 Apr 2026 16:21:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yJY-0000000Fia0-0CYI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 16:21:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3805F61843;
	Wed,  1 Apr 2026 16:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D668EC19421;
	Wed,  1 Apr 2026 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775060465;
	bh=drBC9tOfKfdoHN2E8R097GbZ13wkOyEIJZP2qtLUFxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vC+WEBD9t/yRlOGyAjxRWQI99HkaBTFQ0qIY8KLgkp1Ha1ZYZNvokDywQXDai0Yes
	 1lbOBB6H9qzOUdNjf//PrpNjUOYletWvB0EZzdyfmCCLrq2W7ilROp1yvEUSFeS7LR
	 t5yfUsw4lekdc24omC62/dQT9kQmR+4hwng+IRH+kFZG4qAYnnnly0CS+b9q4NDSPj
	 T/d6onA2jT5rrHK+hlnB4JFYIppcRytR4A58XegeS2ckURO5KKB/gCaW3YNbvMFtWL
	 oIyZ/KtbItvrlca4ANZ0Istto5xsTiiPbMJVjSyj8DG0rTosKB/yy+D9EWevnsedYD
	 hrnebPYA3m75w==
Date: Wed, 1 Apr 2026 17:21:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: Use the correct buffer size during
 RXTX_MAP
Message-ID: <20260401-agile-agouti-of-atheism-cb342c@sudeepholla>
References: <20260401111738.323647-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401111738.323647-1-sebastianene@google.com>
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

On Wed, Apr 01, 2026 at 11:17:38AM +0000, Sebastian Ene wrote:
> Don't use the discovered buffer size from an FFA_FEATURES call directly
> since we can run on a system that has the PAGE_SIZE larger than the
> returned size which makes the alloc_pages_exact for the buffer to be
> rounded up.
> 
> Fixes: 61824feae5c0 ("firmware: arm_ffa: Fetch the Rx/Tx buffer size using ffa_features()")
> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
>  drivers/firmware/arm_ffa/driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> index f2f94d4d533e..d0c926aca120 100644
> --- a/drivers/firmware/arm_ffa/driver.c
> +++ b/drivers/firmware/arm_ffa/driver.c
> @@ -2078,7 +2078,7 @@ static int __init ffa_init(void)
>  
>  	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
>  			   virt_to_phys(drv_info->rx_buffer),
> -			   rxtx_bufsz / FFA_PAGE_SIZE);
> +			   DIV_ROUND_UP(rxtx_bufsz, PAGE_SIZE) / FFA_PAGE_SIZE);

Did you mean to use PAGE_ALIGN() instead of DIV_ROUND_UP() ?

The new pg_cnt calculation is dimensionally incorrect and evaluates to 0 for
all the supported buffer sizes, so FFA_RXTX_MAP is always called with an
invalid page count.

Example: with rxtx_bufsz = 4K, the expression becomes 1 / 4096 on 4K/16K/64K
page kernel, so pg_cnt == 0. Wouldn’t this  cause a boot-time regression for
FF-A driver init ? Have you tested this ? I am trying to understand what I
might be missing here.

-- 
Regards,
Sudeep

