Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EE9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFWUFXTnz9dex45O8YRMmKqjD10tuvD+dujNT3ZLSXY=; b=Kz9KMzUsddORweSuSy/krDHRAt
	IZGq7pkjl7hwrQMqL81bqa/FVN2bHylAyRXnIAGCMQsffOICyo9CGt6/PSvH0hhmvTUvbAuo+iU+e
	+xLYYcQE48LC0vj1pilA6kaCjQtWYzmxx9m1lO4Ms2IY7R6RsYlkZD0BejGO9P0qaCa044XnlWWcG
	rnMuqQEK8f5fxN9U38Y6AaaOKXil5haN+6bEV64dI/5+0xsX+AS+DWZxwpNyccVUsFyltqxCvbkpG
	s0KeAsXtf2mcmEYnKtwwNBW5dcVRxIl/FVWmlSVGIthacuDEIDpOi+i/cJeZkHjLuyYrgyrPPVv4q
	2IdVN/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfRH-0000000BW9p-0ybe;
	Wed, 19 Feb 2025 08:28:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfBY-0000000BRSx-09wZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:12:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BCEB5C542A;
	Wed, 19 Feb 2025 08:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EA2C4CED1;
	Wed, 19 Feb 2025 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739952719;
	bh=Y5C9D/vFHq4rZfOa6tjHQU7RIYN7P5MhUkxZQyexirU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xxib5cAQRAHBXgg/XZIb5FeRnQ76iLxR+ijhdedzKV62UHDAff2Uxg+sB7ZfMSm41
	 lieXAdHOB6oaxNk7+MrR5O6UPFaaqvs4qZIYulVMdtAiNnCfNmUK9EGVd6nGEbj3IG
	 38OI3b01ulJ+OLGmFSu+CRgsL5lMGfcspLdLTxzptWXN0ENocKkOa+G88BWM+qyLAB
	 Uh69vR9QRo2K/F7SZOB9uIhqWvWP06LZDRt1nKCmlSQrFn8oBBP9KhFkLvwgZOrvu4
	 xvqs7mBrui87AkpYW71HwO4Qc78agSRRrH/iHCRLQVimTGDCHtTFVvDXyx2ZyoSJmO
	 v61Tf+FY2u2hg==
Date: Wed, 19 Feb 2025 09:11:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
Message-ID: <20250219-discerning-affable-chital-1fdff4@krzk-bin>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001200_130110_C7E48FCF 
X-CRM114-Status: GOOD (  16.87  )
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

On Wed, Feb 19, 2025 at 12:20:32AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
> compatible to the existing CLKOUT ID list.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
>  	}, {
>  		.compatible = "samsung,exynos5433-pmu",
>  		.data = &exynos_clkout_exynos5,
> +	}, {
> +		.compatible = "samsung,exynos7870-pmu",
> +		.data = &exynos_clkout_exynos5,

I wonder why do we need to keep growing this list? All devices are
compatible, aren't they?

Do you use clkout, BTW?

Best regards,
Krzysztof


