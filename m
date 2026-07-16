Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E174CC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCPldkKY5WQbG3wYqrfYXCPADMIMyTj8M/u2E2FHGl4=; b=gP5OY75SLTXSd8h/lzVXjXM6Ny
	n91T6GVc/RTNOqyaZ2tf3jYW29V11Wb3O0Ee5VL4iapuhyimk9fZ4JP28wOJONQ5D1MZYl5GH8UGE
	lV1waaTVWSe17Pg9smFzoVgrd3xv9hNKrCrSnMNVLDnlVWl5yJlx4s0QawyESNgnzgOinAhRr/4iP
	YLp0IPc++6d5rOvS5pnWOypYxcBBqYuVahFSyYXDS40WJK0Io4Oib2b7mv9IBKmt62UkdGpT/tD1g
	8rcnZUTzFau370EL9vuIUWSIlUjh/bZmQ/nq0gZh2LtrrAFVLYdv9CDmOWqLFuiDTwVYPnPaAwuUj
	UoHEFmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPud-00000000HYt-2hAC;
	Thu, 16 Jul 2026 17:30:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPua-00000000HYJ-40qJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784223015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCPldkKY5WQbG3wYqrfYXCPADMIMyTj8M/u2E2FHGl4=;
	b=SMpeJLeRDZhH+qHRPIZRhZiRZPgJDxY8oPn+0zz02eDKVJbNaBrQJADv/KwCrTl7IOLEdt
	6lQpsZh0Ci6mjko0wzebBD15jqcTQAYRBPPggi1UIJ+T/s/fRYD52PHVxwN4rorkTnNEOJ
	X/ey360zSRqGaUSA6Fk0L/rryCTBgwQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-2qBnaCHdNXq_d33r7NRqnA-1; Thu, 16 Jul 2026 13:30:14 -0400
X-MC-Unique: 2qBnaCHdNXq_d33r7NRqnA-1
X-Mimecast-MFC-AGG-ID: 2qBnaCHdNXq_d33r7NRqnA_1784223013
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so69497061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223013; x=1784827813;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCPldkKY5WQbG3wYqrfYXCPADMIMyTj8M/u2E2FHGl4=;
        b=o+m6GnHPQaxpZPRrtkM14EempcxemhEmSJHT8yglTTAUoNn4nlf44IB6T2JzD+U3Kp
         XKtUHc3XPWG/sBZUchtFDIj6fkBfvWPaOIQ8LyebHqn+h2Dt/kUfxdzpT/QAO6S48DRW
         nTbTW6vDGrflJ8yI/WeF90J2Qz+VX+iL/AQE5AU6Qhq63QfDJbr/0gQst9tBllec+QPW
         XV+XGfByyo8x0lUTNwLETmmjfILPsrVfNJV8rC1T0SL5HMcx3ym7B5xtqlxL2yKH6/GZ
         mvvfQLjVKoveksVfuXkipa09CWKDbjGpreafhAgJujK6XC4FhoUNZl6HXyUJ/O7Jm9qa
         J0/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQv29bz0wgKVGSL09S6LfDGe0W8OPLlFsiBxHPJW2VX2I8V6RRW7DC+/BFVQiBTZ4ZN08lolp+WtBHNHjPyuRg@lists.infradead.org
X-Gm-Message-State: AOJu0YzOfGnEbb2rsHuqwJ34pAPw59DqawZbukwI3sVa9feV+of8DuMc
	WyKIV5N2IDXE4uhlVpxb4D3NEGd/F7PgY7dMofidW+UbP4HwnX+QrrVTl83P/Io1GPLMObfNIZi
	uW5vSUSExBhe6evhsNpbXHBb230BOVYEkh9mAql8wt5s097wDhZlx/7fvIbrJMDwy8utRUTWgLE
	0Q
X-Gm-Gg: AfdE7cn3NKLR4xuu18pTK/3SuwY7q16U6vO1SCKzUU3/6cWEtetXC9jaoDAubw1RSQ9
	Yfi8VgdHLCU9kFTqSCm/Y9eW7UO1AJmSD/AkxscEKm4GhlaB4DkNqrQTC/lfVQ7vhj3vJjRibVF
	BXB4/NJOI3VK+vzEPFMnr/+gxK2uT2p9//qYS0to/jFp46DF/ihA9zENScsRUfaT1RCgn0Bvfy/
	Cr+rz1+x6tqbYK0j0RvRhHpZyuOLi5yzGH4Grz/D1yCwJ4MW25x9jnS5BlB+2IMWHrkjdvg9DWx
	VmXIb7PYPfRDJNO5c6CP3Dutdly0xf837aJu+BjGKHPOTHi2fvg9J8o5orzcwySbhgGAUIHXu/4
	Y9J76+0Gvpaoagx8d+46gSDL46C05/+1aNMs=
X-Received: by 2002:a05:622a:4018:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-520b9204263mr6434551cf.0.1784223013303;
        Thu, 16 Jul 2026 10:30:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4018:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-520b9204263mr6434021cf.0.1784223012767;
        Thu, 16 Jul 2026 10:30:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm164561561cf.12.2026.07.16.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:30:11 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:30:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Message-ID: <alkVIP8jfXuVFP5O@redhat.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bCSzMJm0vFEZgx_R4SuJpPbvrRsbd22MeO916ZaMYo8_1784223013
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_103017_088168_02846672 
X-CRM114-Status: GOOD (  14.21  )
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

On Sun, Jul 12, 2026 at 06:03:01PM +0200, Karl Mehltretter wrote:
> The AST2700 clock driver also exposes the SoC reset controller: it hands
> its register base to a reset auxiliary device via
> devm_auxiliary_device_create(), which the separate ASPEED reset driver
> (RESET_ASPEED) then binds to. That create call needs the auxiliary bus
> core (AUXILIARY_BUS), not the reset driver itself, but COMMON_CLK_AST2700
> does not select AUXILIARY_BUS.
> 
> It builds today only because RESET_ASPEED selects AUXILIARY_BUS and is
> normally enabled alongside the clock driver. On a randconfig with
> COMMON_CLK_AST2700=y and RESET_ASPEED=n, nothing pulls the auxiliary bus
> in and the kernel fails to link:
> 
>   ld: drivers/clk/aspeed/clk-ast2700.o: in function `ast2700_soc_clk_probe':
>   clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxiliary_device_create'
> 
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.
> 
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


