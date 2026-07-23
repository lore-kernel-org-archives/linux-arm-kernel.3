Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8926C531D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=; b=spg0aOENO81IDD/09bht7i69Cf
	JDcZvUr9DPkAeLu1gl10QvQWhfrFI7VFEJG32KE3nwXUS3F2onBZNPPDM58Y7Jokcc/cSsyAqYuMa
	cswrZPeRhDfUSwFUr9klOQQquW6x4a2UHb8QB+Yu+bMPdQZ9FyGbysgGKuolAedI14lK78kFFl8mY
	ASdkEpWv3KM2MRQ+fxej8a/UtRXf1Jc1OqRs4ICBLu2/30Bu+BUlPfe0xkedgsStCGl9aXdA5t6Gh
	t5fGyNkep9vFOc/n3We0AZhlaFc2hd9KcCPhXOLNPgld5UoanEg2efvbHXYDY3ko75Bw/JcXMa8hP
	/D+vr1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuUc-0000000EVPa-0AnN;
	Thu, 23 Jul 2026 14:33:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuUZ-0000000EVOl-1DxQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784817221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
	b=Hyqjdv9XSqBtMPxYd6qRDGBvlPbmxWFKGlbih523LbTpYlO3Y/tjIuHxb6c2ED21ylbwAp
	xPDgHQykbxRs6OuohT8+G6l4RDxmF4kazVWGR9CaLEvEpef6t5ba2hJ6gA0MUHRK2x2AZd
	8j/lYtvgu1QB8DvrNgyrmo6n6gtuzdo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-KiZXotsQO-C1b76fjgx46Q-1; Thu, 23 Jul 2026 10:33:38 -0400
X-MC-Unique: KiZXotsQO-C1b76fjgx46Q-1
X-Mimecast-MFC-AGG-ID: KiZXotsQO-C1b76fjgx46Q_1784817218
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e97889ac8aso14259556d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817218; x=1785422018;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=iVdNONL+dM2UzIwQn5ofMr2FMrg7V/GpYFr8z6yNbGpsZ5kr7LTwm2PcBdQfKzv+eB
         Kd4KGAdTgSPXRpthp5Nko42sAHyQPCGB9Wf3cHn6vmwfw12lZYapdDVsxbG30RBi02Sz
         HejM/xRCIi+h/fznolvA+XnD7sBWkXGyMax7obFkyeSHa/dRha9KLHP0saHML8scIDj3
         Xy3a/UXzKsFqsuUw1eOC3a4d4Q7k/hAdiM93XrY5c2SF0OSb1Jb3KcncPTwRmwWY0KVJ
         mdz3XQUNsK7dI25o2VxNLK7fsOTRjKoCZXb4EHzTBatfumqwoGjGQjG55OU+oP0ccIC7
         Qx9g==
X-Forwarded-Encrypted: i=1; AHgh+Rp9De6mn2e1l06cGSCBDP9ggRmpv5FslNbXhZ20AuE524zz8JKIAKdcl59L5tkR2VjvjRIFDOOBOILpupq3ZxnK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+P7ZThp7M2mtfbrvDdnRrv3suvsZbvt9uKVP39Ui/s+5kOGmr
	LrRV9d9V65Tcgc2n6k+vZKYDKglRk+6MhhNhlISNCc3hEAJ4LZJaSXZyzu77VJ2vfYqsvyo8gJA
	mHReiGp/f4VzpzpT5RrNpoaTcNyRpBD2Nb96asBLt6WwyEZzRPIGtQ3AG0yymkTevRmXpcdRyh8
	sP
X-Gm-Gg: AR+sD13wLDehucMwytK8dZDSrZnSu6TY1hS+Z0vmb5Y0bhqWqZ8UfDFr7t+MYrWsd0E
	XUsOv608SHcfEBCX6dzQV4kKMmmbNFeMnj/hTOigArgLb+923IiQACfXR7FeMGNQ5tX2sr4zQHO
	ylSFSTpqSZdqbRYwGdYvp9GeqeOZXuAGf6SgNFSdZPupFCfZqx16GbDAeB8ddHiu8+OCSP299IF
	ovnNxXGJd2nmehnUDPKdplYwjSzBvbU1ryWeGW4dW+Pkd+nVCLEPkimM5fFg4z/ezS/DBlG5TB2
	ASesLtVjuQAvu2wPq3iGLvDjoih2WBbWMVW+s6jniBa60buAOUh2J4iLcrZtP6phecEcOGEHtfG
	VDOfBfzyXx++ug/vIQ04ZAyIj6oZCWs6gTQo=
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40225796d6.8.1784817218098;
        Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40225316d6.8.1784817217491;
        Thu, 23 Jul 2026 07:33:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b5f85sm46744846d6.2.2026.07.23.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:33:36 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:33:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
Message-ID: <amImP6sFlv-sNhMh@redhat.com>
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xOLpNz8eXQ0aOvJKZvMFfiJh_jREkLvoHYNrxlXJ19w_1784817218
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_073343_403156_ED9249C1 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist:
> * __clk_get_name() -> clk_hw_get_name()
> * __clk_is_enabled() -> clk_hw_is_enabled()
> * clk_get_rate() -> clk_hw_get_rate()
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> The change being very simple, I did not think it was necessary
> to split it into multiple changes. If you prefer it to be split,
> just let me know how.
> ---
>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>  drivers/clk/qcom/clk-krait.c           |  2 +-
>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>  drivers/clk/ti/clockdomain.c           |  2 +-
>  10 files changed, 32 insertions(+), 32 deletions(-)

This looks good to me however can you split this up by clk subsystem at
the very least so that the various submaintainers can pick up these up?

With that:

Reviewed-by: Brian Masney <bmasney@redhat.com>


