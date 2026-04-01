Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C04B1076386
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1+2VQkpQDWxKn++1SDl/8yvuBOCLWqGjOQe0MiVs+8=; b=ZcADmSdYBrPSL5fAWfqPfsDE05
	8l1AA+ezcK1S74U4+8fz/35aA1MhUjrsK+J6+TgHQQAsO3cqI9nVgBhfhCXcS65SHm7kpTGFpwVJ0
	5Y/mkGiFn5HbV06J4PWB5/QxPV442JFFqcjzsMcImyUNi4lyzcAfcqK0pGJMJes5XuDGsR9VaUlH2
	tqZVguePm6O+o5JK3/c/FXuNODO37FMv37E3a1Fb4xJoMgoJBztti49cuZrKIiWJfTeWOOYArnBMb
	Dm2MnjXquELhl+abRjZNOd8/G84qOl0Kf/e+g8nqtmnVQgdpINY88HvpbV+M97PqAtm0LVK1ujRg/
	MHpXOgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7z4z-0000000FokL-0iZO;
	Wed, 01 Apr 2026 17:10:09 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7z4x-0000000Foja-1Enj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:10:08 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50b6c45781aso27601cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 10:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775063405; x=1775668205; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x1+2VQkpQDWxKn++1SDl/8yvuBOCLWqGjOQe0MiVs+8=;
        b=ngiLybe7aigCLQS7QKTKzmwhftwDm6iQTSeKHwfVWuX0RFyBNuqCV60pFzC0k0w5F4
         VdXMa5Dou0GGGP15w5Vn9JQ6PRXCh/gdawqe6w7uQLRLhspvQcTbtGR2lmkf4tOP0CuG
         aUMtyMzlhnkCxEc7ZyQHF5DPGVeAZaPQb/xJuuNY99g+NNB8QfL0/k39MNxIZvZZoWCb
         tFZHeaocrhyMkkukKsOBvpib5nPdcawotdtd7yw7QTdj3BmOBbRozZk1VNxWqgOiTVpD
         ce3BrWHfnYdWW3Oa6EW/M28kR2wfkC6ZWguA2GU6RxTZcVVIT1hro/Z0MYE9N48QHlCc
         xhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775063405; x=1775668205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1+2VQkpQDWxKn++1SDl/8yvuBOCLWqGjOQe0MiVs+8=;
        b=K273kwPvXcP0igSUijNTRrT4fZdeMccF5J4zx3+UMY2tdiRjV8aBWcgNB5vOwyG9nh
         QlbSc7s4PupAylwPwgp2MGhJAzNQH8fS29Fp/nZl/igEgtQ2TWCUHOGV9ot/pa8tcAiQ
         l+R+R5jeFAqkU1il9s0RB7lTIxdyC35rd8LnCh0Ar0a0re5+gr2rv/qaUsYmKtFE4AVv
         EaT5L/AXYScE6+TkBSXylk1AQ4ADK30b/8MLl6e0eCrUzgu/nMhA5kr40SSq7bAp2c3T
         7avOul2eMXbzmiUftqx+kE+IQvlkHfFffVctep4dy5jY1tBxIbcI7yQ1mCpC44XfPE5z
         a8Qg==
X-Gm-Message-State: AOJu0YyLCn0RY5sRtsve9w6r+puXL0Em7SnYekW4sk/Iu4LrZFnVne4i
	EN7vKiaK5ZepQLp+5XJ2Ktpq+h66iL2CPWVCcwaE796qHqvDb1l+EED2TteYYkLr7N64cceaJn7
	YvzZXrQ==
X-Gm-Gg: ATEYQzxBAB1JnEfV1QSbJ8PXD1OX5OdtyVU6WwTB2UGK2VXsRLLGvZEoRS7oLVeF3Nf
	OuOVvyZR4Fp4AKBvmfQsLKAOqB2Hmnp9ZZ1XW7OEEX/OouqzNu+SwKxvN6fUVfi6gJ6BlJw5Ae+
	WFIXTGxwvHj468hzUE/tLRQP596bk16LneTWrLLksoiO0RsjPSxKPbqtgsYM3BFkaY94bV01qmb
	PbD2OjMHhG0x46WRsohfwak+HhFP09yjBwRm42sJUOJngCo9/2njJlZ/0k8wFMDUnEWHq7WxmXq
	XZItiKdbFLi4fT1q8h9nMmKnH8k7HS0g74gxpcDMEeZwqpNMudIXDkL+QLVeqXiLMRtQsl0I/8B
	eKZpRz6G3YGKpoxbEYt1FGrdlA26ujo7vMdOKYE5t8WxtRIwo7XjM1JxOSUePnhJs+VMcZn5OI/
	NjH+1cYoKS8hpKbzbfGmBEMWB0TfY1fWZ2FvdZ6oWcSt0UktH7MbSmZzMHpKlBh56NUaA=
X-Received: by 2002:a05:622a:a945:20b0:509:14f0:bff2 with SMTP id d75a77b69052e-50d4c724995mr488371cf.12.1775063404658;
        Wed, 01 Apr 2026 10:10:04 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e73126sm434180137.4.2026.04.01.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:10:04 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:09:49 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com
Subject: Re: [PATCH] firmware: arm_ffa: Use the correct buffer size during
 RXTX_MAP
Message-ID: <ac1RXRQ6qsWqxZkd@google.com>
References: <20260401111738.323647-1-sebastianene@google.com>
 <20260401-agile-agouti-of-atheism-cb342c@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401-agile-agouti-of-atheism-cb342c@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_101007_395176_E19A4496 
X-CRM114-Status: GOOD (  24.71  )
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

On Wed, Apr 01, 2026 at 05:21:02PM +0100, Sudeep Holla wrote:
> On Wed, Apr 01, 2026 at 11:17:38AM +0000, Sebastian Ene wrote:
> > Don't use the discovered buffer size from an FFA_FEATURES call directly
> > since we can run on a system that has the PAGE_SIZE larger than the
> > returned size which makes the alloc_pages_exact for the buffer to be
> > rounded up.
> > 
> > Fixes: 61824feae5c0 ("firmware: arm_ffa: Fetch the Rx/Tx buffer size using ffa_features()")
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  drivers/firmware/arm_ffa/driver.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index f2f94d4d533e..d0c926aca120 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -2078,7 +2078,7 @@ static int __init ffa_init(void)
> >  
> >  	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
> >  			   virt_to_phys(drv_info->rx_buffer),
> > -			   rxtx_bufsz / FFA_PAGE_SIZE);
> > +			   DIV_ROUND_UP(rxtx_bufsz, PAGE_SIZE) / FFA_PAGE_SIZE);
> 
> Did you mean to use PAGE_ALIGN() instead of DIV_ROUND_UP() ?

Yes, PAGE_ALIGN() my bad, I will send a v2 for this.

> 
> The new pg_cnt calculation is dimensionally incorrect and evaluates to 0 for
> all the supported buffer sizes, so FFA_RXTX_MAP is always called with an
> invalid page count.
> 
> Example: with rxtx_bufsz = 4K, the expression becomes 1 / 4096 on 4K/16K/64K
> page kernel, so pg_cnt == 0. Wouldn’t this  cause a boot-time regression for
> FF-A driver init ? Have you tested this ? I am trying to understand what I
> might be missing here.
> 

Thanks,
Sebastian

> -- 
> Regards,
> Sudeep

