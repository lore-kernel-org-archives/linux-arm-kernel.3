Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A001C55174
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 00:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOdorbk/UlhKifvig4KB0lM7KTYBeYcFRnwahVZUW58=; b=xMksNFI2mcIG1Bg/pccpNjO9WP
	TqB5OFtaXwQrtW54Bpmju3Kpq87vfT4woVloN/n1mBMyRpjnlbp9xUWrFplXDFrgyTNHvRTz7bn1y
	ZRBj7BLmmxyn4N6dVQNuf3lEq8RIjA6r3BzDvnx7kkEQFQC+2s0EWca1khpg70tnCNBxGPZqWA+HY
	FiDOyUHkI7TSqRZn/c0qt2QPngowmEFhrKZHTQbGGKzY5o/yfj9VWNbuGOTamfav8yxr2E1YEKL/R
	q3GGSw9ausGNA90YAToxNV6/XaI/B111OUrO13MThIevV4l8tANBwiHvvNpEsK1JDdVAT/FflZGCl
	ZgxjwSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrll4-00000004fl0-0t5S;
	Thu, 06 Aug 2026 00:14:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrll1-00000004fkW-3tms
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 00:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785975286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bOdorbk/UlhKifvig4KB0lM7KTYBeYcFRnwahVZUW58=;
	b=Z3jCsFtg6kYxTbizKRZy3Tvvn00aZQE2pYvBiqkEYh2E2sCVa+p042QSXId+tLn6/JWBQ3
	ILvp6RJGS9kOImmvbODZmZKhlGpJERTcsRVqN/PwWUgdla863NXyP0PPkQjGOmUYXWm4xM
	stK+RJY1aGo8x10Vncq8BNz8wnO8uo8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-uB5W7CX9PUGr4JwfiYC7jg-1; Wed, 05 Aug 2026 20:14:45 -0400
X-MC-Unique: uB5W7CX9PUGr4JwfiYC7jg-1
X-Mimecast-MFC-AGG-ID: uB5W7CX9PUGr4JwfiYC7jg_1785975285
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81bee860fb7so52938097b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 17:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785975285; x=1786580085;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOdorbk/UlhKifvig4KB0lM7KTYBeYcFRnwahVZUW58=;
        b=V09skGLK+1VFT1xdNcgX6pPjgJlKCnt4VycBMexMEPp49wpqDxz+xtlmlncNAj/DRt
         SzEKc4QOUkPhWVoxXSWGILT+mXMB9dC/N+G4jIMx8aa71k6AvKjGUlAk4Fc+WhzXNp77
         gpZ0aOK3t8F8lOLaRpHswhKa9BUkPeILW/pzMCrpVgqdlG5xzATh7uoSaeHLV8WhrZu6
         h4MDXg6nSrtGSi1m1FRV9m6dEp0TcFpyRVgZjLU2l6o653apSVDoqbzFLrkRv6p8reUs
         TszTrsa5R3psnRENB5QPMDhHOgYdH+BP3G35O3rzEgFQvk8nh8u8k4iJFcrClOQKAlJ1
         3YmQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc4EotTUIJuxDM4PZ0yBGnZ4WuXVxnxTJJ0w0egAXtPDZhMS9U9+fm6gejBBEZIEnYEw1L0TBCvBjZT9Y35znw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0YyZfT1dNTDSimxgTUFQh58e/O+iVYL34OOnVoBTfgzNgi0Bn
	gZqpA8nMO+vspwRYCn4GtgmOXMoVPJPRW42fda2c1vshq2+Jsnyl7bOl4D7iKUWynj0iVq78r8s
	LmVTjO41OhGnhgR2Uy8jtG2H+0EOMlD1/dXgMDt39Wd3rUKRfKB7rqirzW/y1Kz0bSRIakYxKzh
	SC
X-Gm-Gg: AR+sD13k/v6MRJ0kyWFOYVEMBJYYPOAkF9NXED5ZtWk2R0b5X/LlXuLgEMaTzkoW/nG
	TeTwIXU+wE36JW7+fONUTaoWrxPoJO8knzU2C0A0wOU7I1aYuSWOdTlBIlUBff5cFpLFDPucaTA
	cB4M5sBUHdiXuiOOMa03y1suqOt9WLSpybi3gS8ooKsjKO181p6oE8r2h4VKrlR9TtqHRASzrvc
	IQZHj+y9tWRdfArLGN7ufOTootrDPD1X1/xqLHM1XhUgmEvkUmI8cZKKIIGxSULFPXzRZxa9ISp
	BPeX6UkTWJZk4m9U/PqDeQILA/oEEA/8fzB4bwkYrMEcrsPGklH9l0Q2a86lMQms6UEwhgVucpG
	3+vNMG/fx/DdGnM7b0wwKUNxJ/0YAMML7bj8=
X-Received: by 2002:a05:690c:3613:b0:81e:9826:942c with SMTP id 00721157ae682-8201bab4aeamr67377837b3.0.1785975284913;
        Wed, 05 Aug 2026 17:14:44 -0700 (PDT)
X-Received: by 2002:a05:690c:3613:b0:81e:9826:942c with SMTP id 00721157ae682-8201bab4aeamr67377517b3.0.1785975284317;
        Wed, 05 Aug 2026 17:14:44 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82013c49127sm29075737b3.32.2026.08.05.17.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 17:14:43 -0700 (PDT)
Date: Wed, 5 Aug 2026 20:14:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: fix self-consuming provider module pinning
Message-ID: <anPR8mIUmDV1j0gA@redhat.com>
References: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260723-clk-provider-pinning-v2-1-8dad72eb79f0@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: njDsxUsbMiIKLN0jK1F2pK-3Ij8zwgs1P9_orAFAI9Q_1785975285
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_171448_051667_E2856A9C 
X-CRM114-Status: GOOD (  27.27  )
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

Hi Chen-Yu,

On Thu, Jul 23, 2026 at 03:00:51PM +0200, Jerome Brunet wrote:
> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> struct clk_hw.
> 
> When a struct clk is created, the module usage count of the provider
> is unconditionally increased. For a self-consuming provider, this means
> it pins itself and the module can never be unloaded.
> 
> Increasing the module usage count should only be done when the consumer
> lives in a different module from the provider. Use THIS_MODULE to
> capture caller's module and increase the module usage count accordingly.
> 
> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> pass a NULL owner. As a result, any provider module will get pinned,
> same as before.
> 
> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> This issue has been present for a while. Virtually all users of
> clk_hw_get_clk() are affected. The majority are compiled as builtins
> according to the defconfigs. It is not problem in this case but it is
> if the configuration is changed to module.
> 
> The following modules are using clk_hw_get_clk() and are compiled as
> module with some shipped defconfigs:
> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> * drivers/phy/cadence/phy-cadence-sierra.c
> * drivers/pwm/pwm-meson.c
> * sound/soc/codecs/lpass-va-macro.c
> 
> Currently those module cannot be unloaded once they have been loaded.
> 
> """
> rmmod: ERROR: Module blabla-module is in use
> """
> 
> With this applied, we can get back to removing the direct usage
> of the struct clk in struct clk_hw and eventually remove this
> struct member entirely.

Do you have any thoughts about this patch to the clk core? I agree with
Stephen that we should add kunit tests for changes to the clk core where
possible, however in this particular case I think it would be very
complicated. It also feels more like an integration test instead of a
unit test to me. In the hopefully limited cases where we don't add kunit
tests, I think it would be good to get multiple trusted contributors to
review.

Thanks,

Brian


