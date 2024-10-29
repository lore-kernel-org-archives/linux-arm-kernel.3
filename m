Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C283D3A679
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJ60iYYizLVnwfouw6y1QvHsSQJGFUgW6DG8wZvrPSM=; b=WyjKGf2E3C3cGtfxkSbN+l5YTv
	i1O1B5pdmJ6ZhiRI7FVyeAYVt5Shdl6zr4B0CogIktLWOZaN53pblnCJeogwEg9vn4w1vANRn9RPb
	oPGxQDUnU/VhlptC85KTYkTifmJsbreBIZeSPV83qm4kx+GT45Y5s9MdGmrKdFgIdEZoF/DjLn6Kr
	IqUteRzUJdL3s1+933DVrzqYfStMjpnGda2YzIcl/4OArbbfEDJAfCyeZW0ecbmTmTbAW2+KdR+Qa
	j+Ck8yqx9DW0zhHpc7nTkqHch5i3sO2iY39fz8LHVtwOzG+qmFtUVAu7yONJrsAYIURdYvgKdF9zG
	w2siMbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q82-0000000FHau-1Vtk;
	Tue, 29 Oct 2024 17:35:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oA4-0000000Evrg-1Ftn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:29:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2852BA42E52;
	Tue, 29 Oct 2024 15:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1175AC4CEE5;
	Tue, 29 Oct 2024 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730215774;
	bh=h6IT+RVIi2EiBIQas5qph1pu5nvBCYYWrS8/4i28TQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DD6+B/AauYc/wLBkQ+xNoFMHiwkWj6X5sIBzRMeHK1cnGNjaC47cdnFKua7OzUwiK
	 EmgzTxh3Z5DXJO0Y5tz/201vinLaimuLmZjw+bM7DZVNKV/JKGvxfo1dE/5+5Wlxwy
	 FitB71U8/f4JPApNeU4ER18SwcZiZq/aoSx+o5fUIpLQL/3Sw6rub3NHbv5dnxnt5N
	 8JwwJbNJU6PuRYoRvQ1u4Dppn2EwipEtDXgn2m3krBqvbPXRe/bkxvCLz2zek4zpKo
	 +Fg42a89YUu4ao/2ukuxp7jK9Q4WZkj4RtUnbjyCa/12JsTJeSWFKtXeHBpt95Czob
	 TqyHhZa4BdZXw==
Date: Tue, 29 Oct 2024 15:29:29 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf/arm_pmuv3: fix building on 32-bit
Message-ID: <20241029152928.GA4865@willie-the-truck>
References: <20241029152420.3251097-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029152420.3251097-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_082936_486436_E910C8D6 
X-CRM114-Status: GOOD (  15.59  )
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

On Tue, Oct 29, 2024 at 03:24:10PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The write_pmuacr() function is only defined on arm64, so building the
> driver on 32-bit arm now fails:
> 
> drivers/perf/arm_pmuv3.c: In function 'armv8pmu_enable_user_access':
> drivers/perf/arm_pmuv3.c:784:17: error: implicit declaration of function 'write_pmuacr'; did you mean 'write_pmcr'? [-Wimplicit-function-declaration]
> 
> Add a compile-time check around the newly added code, as it is never
> needed on arm32.
> 
> Fixes: 0bbff9ed8165 ("perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/perf/arm_pmuv3.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Cheers, Arnd. Rob already sent a fix for this [1], which I'll push out
shortly.

Will

[1] https://lore.kernel.org/linux-arm-kernel/20241029120602.4061566-2-robh@kernel.org/

