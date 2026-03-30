Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6117010D14AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUo0/wHcRmQzbX45cbbWi4ZZUfa7cbgmLMG4WHaF32c=; b=aJUnkm1dw5QuYZbUQt5P/nRS9k
	p248XOa0+x4sZrREgNfbxN+w6WLcT9y4kQMIthI9gOVS+akBV8NUILSjzWn52ekzTqLVnr+51dpSE
	WHeCSQ7ZPvRQChBQwwMd+8QCRSFbXzOueh5YP8gvvX3ZOJs/IgvF+zopxa6Yv8tLKaHwLngREUTPD
	CDKMP4qgkWm6gL3TOGfbMBaSnICZ8ipV97EK6LUC/LCXZENq+jVW5AgZ12iI+hApL3rPttoehabU9
	RFdn0nFnGaBYh4U/EJ1L+9N9cpG6K8NP/M+jcDwrlYXGH2TDiwh8cAY3ltrC3Ul5v9cStieHCl3tT
	BkHlLS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CQc-0000000BKBS-36dP;
	Mon, 30 Mar 2026 13:13:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CQZ-0000000BKAt-1UtB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUo0/wHcRmQzbX45cbbWi4ZZUfa7cbgmLMG4WHaF32c=;
	b=TgDgnMXubbTMc2S4OQ9C3FtseK+1w4oNmOhQTkPEyDvhwJxzjEA6GZhdkbATQDo7r1bIWY
	vXJuC32BxV3eOyvNHBY/38l19aFXdwYazdu8r7NG1ea4nvf/JTsNQ7aC5wuIU/rXASNvTX
	rkSuCFpWjzQzbMvEZs/i48nq/lHxDv4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-g6vpdVOJOiGRBneYruK6Uw-1; Mon, 30 Mar 2026 09:13:08 -0400
X-MC-Unique: g6vpdVOJOiGRBneYruK6Uw-1
X-Mimecast-MFC-AGG-ID: g6vpdVOJOiGRBneYruK6Uw_1774876388
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c4ec516e5so221309026d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876388; x=1775481188;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUo0/wHcRmQzbX45cbbWi4ZZUfa7cbgmLMG4WHaF32c=;
        b=hB5MNpZWojWmS9XUL6wAtTyrSiLt30XyWfYahRdn8CDoqfotFWqq72GTlcQ9k4y23d
         D93159Vj+nliS9O1dZmIp+3ZuGhSekeFwbI/nqn3ZvP1W/GX1zmthrCkQTYFM/5j7Tp7
         ablWhMfbYgvbeZJuX6UkFW6yb0sQLQ50AfWjS0ymUWldzeL+vMoRqpVRTJLGvAAvUTxt
         DJVCCbvlnimsc5eW3lhk90EBqV9mqp4QR3e6fa/MXlxyY0ipAlXFbNkV9UfuUc3jyr+9
         +seC/ogKUC8GYqbKDF7FM8f0N6sqDMpnjCIy6ZqpZRfeIXqNzqyjZqsJbZI5xAZ5L4hd
         fpJA==
X-Forwarded-Encrypted: i=1; AJvYcCU7yOMfXGnAewaTjtlI1SBNzvaaFIxDdx6DUC1cD40pznBbfauFd4QOfFRKiZ/wAQJiEIEv8SUh4Saffwn2NRLM@lists.infradead.org
X-Gm-Message-State: AOJu0YzI/CLHUWS+1tEqNK0WkOCTGzTNiJnHtqAD6AlljhWFAIqxxLLM
	d0vrjgbn6PQxFlTA2jrE7gV1WQjubQi/DB9y5GfZ+z8fTXrrYWyQTpvUNjsPA8jEzNbW07Z3p5N
	jPBRgc4OyADv5yBoH79jZE9KSh63Yu/fXSLZ9+CX8hB3zqm8qUtihqYHhYKsDHq8CE6sCJfHv35
	EO
X-Gm-Gg: ATEYQzx9eNts6XFVhIE/5s0DWF1pYjSYmc/O6MJ8R3YsXMmYlTT4d+i1v1bNZdF6TFV
	PV+L7WzreDIxYCsHi+r6fY8TZxtgB/Vt2ZhvwPOZHDe1xGCagQC5b3/a8fxt8LLyvUH1YnDlb/C
	1zd9iaeDKwhYr5SEfIhzLqeG0+mpLo3kcSZYhNbf+q1096ClSWVfTAOOiOVUQbwRyxzWsGgLx8y
	cRVm0Uzue2z51jQFZ3AKKdUgCccs4ncDD+52iphOKyB4hZ7gr6Jav5RDj/l0Na02qbg4vU2vun6
	bSvC1ufUgNEyQZsQyZwc4QTnvVvgfRFsv3d9iQU3BqlTzufPSMzWract8jYeSkJYrIHBK9HvQq1
	20x9y2CVbg0aPwDzSy18XQTZU8a2/mHS3Sy+TvYJ3MdAPrwXEOC07OgFi
X-Received: by 2002:a05:6214:4105:b0:8a0:22bb:1d3c with SMTP id 6a1803df08f44-8a022bb1fb2mr76477746d6.3.1774876387584;
        Mon, 30 Mar 2026 06:13:07 -0700 (PDT)
X-Received: by 2002:a05:6214:4105:b0:8a0:22bb:1d3c with SMTP id 6a1803df08f44-8a022bb1fb2mr76476806d6.3.1774876386785;
        Mon, 30 Mar 2026 06:13:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ec6ec2266sm63989576d6.0.2026.03.30.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:13:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:13:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] clk: kirkwood: use kzalloc_flex
Message-ID: <acp24GchNcb9iHXJ@redhat.com>
References: <20260326045555.240730-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260326045555.240730-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MVABGvrP7p1ndaqO_EzOUP-QAMYvMk-cuXWCGd_NNoU_1774876388
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_061311_515143_43FD514C 
X-CRM114-Status: GOOD (  20.93  )
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

On Wed, Mar 25, 2026 at 09:55:55PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member and kzalloc_flex to
> combine allocations.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment to right after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/mvebu/kirkwood.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
> index ed061d82fb65..fc2972538008 100644
> --- a/drivers/clk/mvebu/kirkwood.c
> +++ b/drivers/clk/mvebu/kirkwood.c
> @@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {
>  
>  struct clk_muxing_ctrl {
>  	spinlock_t *lock;
> -	struct clk **muxes;
>  	int num_muxes;
> +	struct clk *muxes[] __counted_by(num_muxes);
>  };
>  
>  static const char *powersave_parents[] = {
> @@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
>  	if (WARN_ON(!base))
>  		return;
>  
> -	ctrl = kzalloc_obj(*ctrl);
> -	if (WARN_ON(!ctrl))
> -		goto ctrl_out;
> -
> -	/* lock must already be initialized */
> -	ctrl->lock = &ctrl_gating_lock;
> -
>  	/* Count, allocate, and register clock muxes */
>  	for (n = 0; desc[n].name;)
>  		n++;
>  
> +	ctrl = kzalloc_flex(*ctrl, muxes, n);
> +	if (WARN_ON(!ctrl))
> +		goto ctrl_out;
> +
>  	ctrl->num_muxes = n;
> -	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
> -	if (WARN_ON(!ctrl->muxes))
> -		goto muxes_out;

Question from Sashiko:

https://sashiko.dev/#/patchset/20260326045555.240730-1-rosenp%40gmail.com

    This isn't a bug, but since the goto muxes_out error path was removed here,
    should the muxes_out label and its kfree(ctrl) be removed at the end of the
    function?
    They appear to be dead code now and might cause an unused label warning:
    	return;
    muxes_out:
    	kfree(ctrl);
    ctrl_out:
    	iounmap(base);
    }

Brian


> +
> +	/* lock must already be initialized */
> +	ctrl->lock = &ctrl_gating_lock;
>  
>  	for (n = 0; n < ctrl->num_muxes; n++) {
>  		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
> -- 
> 2.53.0
> 


