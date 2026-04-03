Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F8E8536E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3TgrwVgeoZcZASDHDP/iFsOkmG4q/7olBpiPeQBlYk=; b=NwUP4ja0IaG9iqRX+yJMlG+jwo
	SAun7huSZNxx0E0SkwP5QMAga75R08WdTo8piiCA7GrH8uPMs7rpH6Frk4HWEHX2K5zrYJbkWIamv
	PS6ZgvD1pAWfWQFzCH1trxryZaXcVuFlPrzrJs4eQqeJQXLy2q5RumSaC9n1VpnH7rNZN1fGed3iO
	O1wuaENFSi608Xv3hSjBKYb96UiR+bRl7JJZ28xoDTxH+YPqdvndqMvHX7mwR+wBHTzYQ9AGMnyCp
	3Gyn6xWLjxMnXw6tpFUnhvQoSXOXPY8dO3lywRGWy1C39uWhV+ya2IMjx9ojNDl1+NFcvmq4Pm/Bt
	CgROlnFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8eah-000000024Qo-2wcj;
	Fri, 03 Apr 2026 13:29:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ead-000000024QC-3Kos
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 13:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775222973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D3TgrwVgeoZcZASDHDP/iFsOkmG4q/7olBpiPeQBlYk=;
	b=V0s3DYoh4BnRIpDfwehNVE3p7Yuj6iy+6Qia14gpgJKS0Irp4OGMbu7chup6fIom26VlsU
	2Ep9Srxmm7pS7/wNwedO6+H7XCrNJ84BadreYBQ+tb7IIvzRjakiV3ggRrJ9FdAsY1oaIf
	MbDHUTxJWMtted6w5OBR/Gsv0cDnyPI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-_BFiTNdXO2SZlTh8K8mlWA-1; Fri, 03 Apr 2026 09:29:29 -0400
X-MC-Unique: _BFiTNdXO2SZlTh8K8mlWA-1
X-Mimecast-MFC-AGG-ID: _BFiTNdXO2SZlTh8K8mlWA_1775222969
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so53672551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 06:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222969; x=1775827769;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3TgrwVgeoZcZASDHDP/iFsOkmG4q/7olBpiPeQBlYk=;
        b=ddJxzdHqUTHpMFM9rJPx8aQDB0rCaiUYG/pQlS27M/hS1NClVqXRtVWAnAZGgKPzLH
         nvt99alBGJnuLaH3aWcec2hV+KiVhNm5gQzqZOQ9SHM9bX/BJH56Ubv5pmXC1SJJ8ZVa
         WSHVkmibeUOr5uoJH7sU8tnQhVcFz7z1f2tsMhqc9BH5xm14HBjCaWIyn6S+UV/y/sUr
         FVkPS/2sGVUnmtuGeIx4h1iAkzrrgmxHBfrY3mjnNczHyGv/Sn+EAEnSbWLYqBSxlJ5B
         MCTZ3VPPS1rTVMnFZBw6trC704u0DBPjtU/PJp0m3OS1XzHUXZFcBAx/Fju6AHYinfUa
         vDbg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ijE6bm1X4Qizbu+/HQj7c54ymvgZQwgYwmJ8tx5glJODAWC+X3PxTD+mKhSK4GbTKDUcrA8MmpIGTTl8RDLF@lists.infradead.org
X-Gm-Message-State: AOJu0YyAK/D4OBlOgGqnCSnQoHyxNZThmvHsLjlYDWB1nEmWfwqiXwHn
	p/LidNRUooXTtQG1EJ6Wfxmqx6jmd6xGD9v4DT3bcjkeoeJ7HT9W3x3wHsLEpOwdtc1JQf6D0BE
	nfT01Gy1Oa00iSMZ32hCXjM78ln0992Qu2tlfBNgE3jFuERlC/S1xgxoPhT+BueD5nqe/8saZfd
	we
X-Gm-Gg: ATEYQzweUKVpEXTPkVEtApKSCWoVVvK6MxZpRIt47FXqyIzWknO3RGqrbKPmCB0/sFh
	YPHgYsxjPcEl4R9wSBx6tPZbB8fzBQ+6ssZc0uTSDoc4t/jcl3PKXakFtsJPtGamcfzfNFG5/9U
	kPBAD7cerHL1XkFZ9qLPZLNFdvg6eiNIO67RSwEk034GYaPkg+RqtC4Z0EEyzmp5G0JWxDGJ2Sf
	Bwmn7fv3HbXvhA6ZcLhGrFsB56L8He/u7H7TIIW4McElb2FpuXSS/I5dd/9omuxda/FOJcWg9z4
	e+3rz11iJQ97t+qEkyiu+pDbMYAYdVGvLI/dlO+ouCG7KT2C17grZ0aT96yBqcC8w/1HTGIT8n7
	v+DCv8f6PR7z1gdQC9ZwtgZPKHZuEa8YB/PUuZLyuvJlpFRYZr5q4UYKf
X-Received: by 2002:ac8:7f88:0:b0:50b:37ff:727e with SMTP id d75a77b69052e-50d62a95729mr48480051cf.44.1775222968997;
        Fri, 03 Apr 2026 06:29:28 -0700 (PDT)
X-Received: by 2002:ac8:7f88:0:b0:50b:37ff:727e with SMTP id d75a77b69052e-50d62a95729mr48479561cf.44.1775222968488;
        Fri, 03 Apr 2026 06:29:28 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d63962c30sm17886441cf.10.2026.04.03.06.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:29:27 -0700 (PDT)
Date: Fri, 3 Apr 2026 09:29:26 -0400
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
Subject: Re: [PATCH] clk: mvebu: use kzalloc_flex
Message-ID: <ac_AtoG1j_I2m9Ja@redhat.com>
References: <20260402002011.89926-1-rosenp@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260402002011.89926-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LjcNnXknOa6NrhVaQDTtzhD3MfL2Ys_nhm0OfHX1o74_1775222969
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_062935_923842_679D617B 
X-CRM114-Status: GOOD (  21.65  )
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

Hi Rosen,

On Wed, Apr 01, 2026 at 05:20:11PM -0700, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc in one
> allocation so they can be freed together.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment right after allocation as done by kzalloc_flex with GCC >=
> 15.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/mvebu/common.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
> index 28f2e1b2a932..4129690fcae0 100644
> --- a/drivers/clk/mvebu/common.c
> +++ b/drivers/clk/mvebu/common.c
> @@ -189,10 +189,10 @@ DEFINE_SPINLOCK(ctrl_gating_lock);
>  
>  struct clk_gating_ctrl {
>  	spinlock_t *lock;
> -	struct clk **gates;
>  	int num_gates;
>  	void __iomem *base;
>  	u32 saved_reg;
> +	struct clk *gates[] __counted_by(num_gates);
>  };
>  
>  static struct clk_gating_ctrl *ctrl;
> @@ -257,24 +257,21 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
>  		clk_put(clk);
>  	}
>  
> -	ctrl = kzalloc_obj(*ctrl);
> +	/* Count, allocate, and register clock gates */
> +	for (n = 0; desc[n].name;)
> +		n++;
> +
> +	ctrl = kzalloc_flex(*ctrl, gates, n);
>  	if (WARN_ON(!ctrl))
>  		goto ctrl_out;
>  
> +	ctrl->num_gates = n;
> +
>  	/* lock must already be initialized */
>  	ctrl->lock = &ctrl_gating_lock;
>  
>  	ctrl->base = base;
>  
> -	/* Count, allocate, and register clock gates */
> -	for (n = 0; desc[n].name;)
> -		n++;
> -
> -	ctrl->num_gates = n;
> -	ctrl->gates = kzalloc_objs(*ctrl->gates, ctrl->num_gates);
> -	if (WARN_ON(!ctrl->gates))
> -		goto gates_out;

The gates_out label and kfree() needs to be removed.

Brian

> -
>  	for (n = 0; n < ctrl->num_gates; n++) {
>  		const char *parent =
>  			(desc[n].parent) ? desc[n].parent : default_parent;
> -- 
> 2.53.0
> 


