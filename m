Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2C110FC454
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtTJZ2wfNEt2cLQXV6l/PRWSpcHnG0qmiWEptUKrHmM=; b=M34w9RW3xQQ0qIKW36t+k0/9Jc
	nWmjyt5aES7iAJLmahcA2dAxrX/fSpHU5x+qWLjz5mQdQnjpdyc5xWCgCzU//dfnGdAZUM/ePakws
	E10pRPzbEPUQ59ef55tqinP5bNXNwqbygi6n1429xCZBmtWIGZL+biGKysu9TxKHtKSeeDOC27Fb/
	nOnt9EVs16asu9xrLL13VQKj+6/4QTyl9KYPniQ6EqMctGDY9U8CsEbjEvW6DLo+AhuFPHPyclS2e
	UoOZIidMwm0lGXLqgxVfJWOooD+MRQjczMHnuNzkNPYs+GffhSua3pmWWS6nzTViJ4PY9oc58KMm7
	IvfUjiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbRU-00000009Ubx-3oGy;
	Wed, 08 Apr 2026 22:32:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAbRR-00000009Uba-29Nu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 22:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775687526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtTJZ2wfNEt2cLQXV6l/PRWSpcHnG0qmiWEptUKrHmM=;
	b=IjYoltosEV/9coNsi2A6OkY+LtLrwlm04YuEbNj04+8xRh8acmUUHx4oWUNAnzTktNAfUi
	AKnzMmRG5QBakwME1nJ4FQGs36FZgyAK+7NtAAG0HGwcoJb6PrPM7iDjcOrXWptcCXtfbJ
	lCuOJQQ8NZ+WA73HN81IEs7Nf91wjuw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-DVgpkNsNN2alfWMpimHOKg-1; Wed, 08 Apr 2026 18:30:35 -0400
X-MC-Unique: DVgpkNsNN2alfWMpimHOKg-1
X-Mimecast-MFC-AGG-ID: DVgpkNsNN2alfWMpimHOKg_1775687435
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a3bc7f5d43so13775756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 15:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775687435; x=1776292235;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtTJZ2wfNEt2cLQXV6l/PRWSpcHnG0qmiWEptUKrHmM=;
        b=JgCyt0DlgAOys+jZfTZbHHD+TBX8xo+BfuJa5SE7ktF1ukF/8vGaHqefmgWM1opbrF
         6AWsvkBAPbCHrA+HQzbvJ7g5HJNINI6AxYgMsUs9oXtt1SdTQs7vRi9NX/iQ3Y5NFY5G
         7p9He4flgLJ3wxntq3+R30u3Z8ET/HHszVYpaVhCk4GVwXYPMoVEVcJbQ9J2d+55jWt0
         sK1bsLQEK9vZA6ExXJf2k3xyRru5iTofDQv5UoYo16oSDsqR7o899f0tqsgjrGKpzINF
         5irvhIFVaBk275nvMq2ruL7qi27Uo/BP0w4VNK8vrSI1B3HEpG2iMsgvUpS7EVSIH1Ln
         NvSg==
X-Forwarded-Encrypted: i=1; AJvYcCWmcKPfQLE5G0X//LcPTOT0IStvSjxUoV3h3yu6aix38xQWUkv9dzB+SVszudSyXGRLjDH2ukL/W6gLIbmTAdGf@lists.infradead.org
X-Gm-Message-State: AOJu0YwWcIU0lOyI4Z1tcr2j4XLIKxH062bH2bUTZu1dzlhjqxrB9v7+
	S+PslABXPlCN9Qjg7Ntntj96HtF+pVQ4F+SfM+Zn41gNUCdovnw8wX5EfYTzWR56A97E37mvR4V
	WCF8gQoDkCZ4DhVTsVE/I78iJqGTmj8BMz0CqhJpw3nLnBj2fBUDgYWnSJJ9JOiwlWwvxgysPbB
	Px
X-Gm-Gg: AeBDievLFBh7iWDo4du1V10pserZlid/PzBTPFk2yU7nGeFhv5BKtbwV4OxhmgP22S8
	ME4zEypactFsF0V1Of8V102plR5Ednc8PGtxy6VeokucNxx4MdXDhrd7uvd6e4mUm+yHJHlpOvX
	/1UFjB1UOrK18Vw0MMu/n3/erHqGKTeW3ha9pmsgUCtNOfMrOFHPOyDF4o1TW/Ypgw67yvo2Rie
	o5px47IHREI3uCeeRyQLiL8RRldI7oreyRGIQFH+Fy2A3f3yxzedVOvYqgwwnicgTuR9zRjDcXh
	wiHkradObfYT32ipwwAsgGqiq1R4tsRyELitzDey2Prcdkb+tJq67xzNxm3G0gP1THM0MXcPpSC
	uMrfRSLDKrKQu9MZUbn+c6oBiUl8NBGFTSKRXUgpXQMbc4zFWTRg1FE56
X-Received: by 2002:a0c:f114:0:b0:8a3:221d:9095 with SMTP id 6a1803df08f44-8ac743038b7mr23717416d6.15.1775687434746;
        Wed, 08 Apr 2026 15:30:34 -0700 (PDT)
X-Received: by 2002:a0c:f114:0:b0:8a3:221d:9095 with SMTP id 6a1803df08f44-8ac743038b7mr23716276d6.15.1775687434158;
        Wed, 08 Apr 2026 15:30:34 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a59323a0dasm184620536d6.4.2026.04.08.15.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 15:30:33 -0700 (PDT)
Date: Wed, 8 Apr 2026 18:30:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
	Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v5 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Message-ID: <adbXBwKC_cNxGlpr@redhat.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
 <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SXGHM2pSP3uObXtkl_Ns9xfPtnsRUTJIRj1mbW6qPX8_1775687435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_153209_645899_9503CB3B 
X-CRM114-Status: GOOD (  24.44  )
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

Hi Thomas,

On Tue, Apr 07, 2026 at 04:25:08PM +0200, Thomas Richard (TI) wrote:
> Implement the restore_context() operation to restore the clock rate and the
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() operation. The parent index is saved in sci_clk struct during
> set_parent() operation. During clock registration, the core retrieves each
> clock’s parent using get_parent() operation to ensure the internal clock
> tree reflects the actual hardware state, including any configurations made
> by the bootloader. So we also save the parent index in get_parent().
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
>  drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d5071223f4c..428050a05de3 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -47,6 +47,8 @@ struct sci_clk_provider {
>   * @node:	 Link for handling clocks probed via DT
>   * @cached_req:	 Cached requested freq for determine rate calls
>   * @cached_res:	 Cached result freq for determine rate calls
> + * @parent_id:	 Parent index for this clock
> + * @rate:	 Clock rate
>   */
>  struct sci_clk {
>  	struct clk_hw hw;
> @@ -58,6 +60,8 @@ struct sci_clk {
>  	struct list_head node;
>  	unsigned long cached_req;
>  	unsigned long cached_res;
> +	u8 parent_id;
> +	unsigned long rate;
>  };
>  
>  #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
> @@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  			    unsigned long parent_rate)
>  {
>  	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
> +
> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> +					   clk->clk_id, rate / 10 * 9, rate,
> +					   rate / 10 * 11);
>  
> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> -					    clk->clk_id, rate / 10 * 9, rate,
> -					    rate / 10 * 11);
> +	if (!ret)
> +		clk->rate = rate;
> +
> +	return ret;
>  }

Should the computed rate from sci_clk_recalc_rate() be saved as well?

>  
>  /**
> @@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>  		return 0;
>  	}
>  
> -	parent_id = parent_id - clk->clk_id - 1;
> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>  
> -	return (u8)parent_id;
> +	return clk->parent_id;
>  }
>  
>  /**
> @@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>  static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>  {
>  	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
>  
>  	clk->cached_req = 0;
>  
> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> -					      clk->clk_id,
> -					      index + 1 + clk->clk_id);
> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> +					     clk->clk_id,
> +					     index + 1 + clk->clk_id);
> +	if (!ret)
> +		clk->parent_id = index;
> +
> +	return ret;
> +}
> +
> +static void sci_clk_restore_context(struct clk_hw *hw)
> +{
> +	struct sci_clk *clk = to_sci_clk(hw);
> +
> +	sci_clk_set_parent(hw, clk->parent_id);

Are all of these clocks muxes?

Brian


> +
> +	if (clk->rate)
> +		sci_clk_set_rate(hw, clk->rate, 0);
>  }
>  
>  static const struct clk_ops sci_clk_ops = {
> @@ -269,6 +294,7 @@ static const struct clk_ops sci_clk_ops = {
>  	.set_rate = sci_clk_set_rate,
>  	.get_parent = sci_clk_get_parent,
>  	.set_parent = sci_clk_set_parent,
> +	.restore_context = sci_clk_restore_context,
>  };
>  
>  /**
> 
> -- 
> 2.53.0
> 


