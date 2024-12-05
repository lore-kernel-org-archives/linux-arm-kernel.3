Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C06BE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gqKJX96WjuMzNv1UDqKia0i+nmf02k77E5+nkTkEng=; b=oZi2HDyMmU7vGgWY+v4eskPR+D
	4WOXpZoU41nWu26iNGXfmc506D66PZkWDV8m11Js3MnOOqrNi0ixPMVo4pXmWercL2r2EoRsbXviI
	80go15G5TJJQauBnMI1B8Pg6+yc06Ik7DrkPtHUNZsy6yFLL7XlFMJpdMCXyhtWKjA34J6zxetfuC
	xfV4UEs3UtbRkqyiVSEiwJw+p4iXOMl2P3C0Smwpl+nYIa6pFOGVDNbylXsN0x62wBcKSrWV6Fo6U
	5BjQgNsXSOf/t8aet4jqqBDM36jCUVRV2H+fSDXirvYqZpRjcOi9LDLcZZcH1C8WwjAAZ6GykPslp
	2mYeZauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ94r-0000000FVp3-354Q;
	Thu, 05 Dec 2024 10:27:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ937-0000000FVSD-0LjF;
	Thu, 05 Dec 2024 10:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23AA4A430B0;
	Thu,  5 Dec 2024 10:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEFEC4CED1;
	Thu,  5 Dec 2024 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733394331;
	bh=xc/AP1q5J7sVe4uDrqIu8OSigI0sdX0g5xbtoyVjNxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s7f/dkLhhctWIeUhGLpjKXnajl+5VZbXesXWXsw3g9wn7qcKhle+r+8J9OmlTgPtP
	 4VziQdVRNp9frk6Gd3HgDsmJQ5yMp/ov/RMej/aIvR8Xt/wCVL5IdZXYLSX5/aFlsn
	 /87Q4MMfeo+q2fKouI/C2HTFxtkh1QrDsCFiZGE62cFHULm8HWpHzrMp+QWJChO7aH
	 WZVR5Rrder2DLmoTSi4Jcf4VMHrf06/SnzgMo3rTGpXSjSary79Wmj4hYZHfNLURpg
	 fKL2XVZMAOyCLw/Sk4yEDZ/gs5zbJfQiO16d1fmuulK8tUR/X2L5qUaf+0tT0M0TgV
	 9aUR7/WdcYNQw==
Date: Thu, 5 Dec 2024 11:25:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add clock ID for CIF0/1 on RK3066
Message-ID: <5kesytgbhfununu5li4ychaw4newkctx4wuhlshks2ertfkd2t@jauqcntehv2z>
References: <20241205055122.11613-1-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205055122.11613-1-val@packett.cool>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_022533_180930_66B6AADF 
X-CRM114-Status: GOOD (  11.75  )
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

On Thu, Dec 05, 2024 at 02:50:46AM -0300, Val Packett wrote:
> RK3066 does have two "CIF" video capture interface blocks, add their
> corresponding clock IDs so that they could be used.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/rockchip/clk-rk3188.c             | 4 ++--
>  include/dt-bindings/clock/rk3188-cru-common.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof


