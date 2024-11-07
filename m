Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A357D43346
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxThl5afrOvPLVqB4A2Wiiyp36R80L2UE1nggdLYscE=; b=wBtlZ0ohHpCLjgmkMUJ2FQOho1
	xg6tJD8OQADTc7JS5RVs6K5lzqwJ6F2/5B4WL22vwjF75icVESt2rU2/mGGleQYGX3Q50dFQq84s6
	gcwedT155j0o7zyAWFSBrTsO2qW5/nHAOr9g6rKaXDa9yDZxYOY6voUe9EajAQH3x3MuyHYoGS96N
	iqU92pFuvzTDZ89VOOWV7kZ6SPMNyWLsdR6GofiOPH3Q3sZOTvFaeRAZbqjPm/uXIDieLH+07wH0i
	U97oXzKFJVsUT8bqSdg2+wLkgWyV1PsRbbOm1Kdf54NXxyflRGw598q9n88ioShzOY6t8m79tHYGM
	KATmLp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90LH-00000006c14-26W1;
	Thu, 07 Nov 2024 11:06:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Hd-00000006azC-2Eik;
	Thu, 07 Nov 2024 11:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730977355;
	bh=b0bTy290Gv4Pae9BlhjI0SkrHyDgzfB15dcSYgwkuhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lNkq8uuXecRWDRa2Ptic2EWcNh7IFeOscAVOFNFIJqBbRh2VZA7NRdn8eMKeWcNi1
	 Ch4B7WgNl2Ca8+xjNc/v0fkK3lmS7xMhwYpv805KcoNyP3Kx63SEl5wjQwqpIA3y+l
	 7dwTqO65OjBxvK4hHyrvRCsdRUtGLi9wqvCbSgMORdMPXWdmOUIVMWhupR+GZMMV5S
	 8jiS89xYjKKHPeSi9/ywpl0QRo4jrheiYLoz2MT83m4kmOl6tIEmULpnmOcP75EUSw
	 +oqsWtWHizEu8JVgRGWYtFPhMH8nUaUlEG2vNvExmV/+FX67SVQkmFWYNCplxSvD+n
	 saI9kp/FNePFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B71F17E35E3;
	Thu,  7 Nov 2024 12:02:35 +0100 (CET)
Message-ID: <900eb529-9868-4455-8f13-3e6ce6c99983@collabora.com>
Date: Thu, 7 Nov 2024 12:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mtk-sd: Fix error handle of probe function
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241107014714.24981-1-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241107014714.24981-1-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030237_787449_87BFF02D 
X-CRM114-Status: GOOD (  10.91  )
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

Il 07/11/24 02:47, Andy-ld Lu ha scritto:
> In the probe function, it goes to 'release_mem' label and returns after
> some procedure failure. But if the clocks (partial or all) have been
> enabled previously, they would not be disabled in msdc_runtime_suspend,
> since runtime PM is not yet enabled for this case.
> 
> That cause mmc related clocks always on during system suspend and block
> suspend flow. Below log is from a SDCard issue of MT8196 chromebook, it
> returns -ETIMEOUT while polling clock stable in the msdc_ungate_clock()
> and probe failed, but the enabled clocks could not be disabled anyway.
> 
> [  129.059253] clk_chk_dev_pm_suspend()
> [  129.350119] suspend warning: msdcpll is on
> [  129.354494] [ck_msdc30_1_sel : enabled, 1, 1, 191999939,   ck_msdcpll_d2]
> [  129.362787] [ck_msdcpll_d2   : enabled, 1, 1, 191999939,         msdcpll]
> [  129.371041] [ck_msdc30_1_ck  : enabled, 1, 1, 191999939, ck_msdc30_1_sel]
> [  129.379295] [msdcpll         : enabled, 1, 1, 383999878,          clk26m]
> 
> Add a new 'release_clk' label and reorder the error handle functions to
> make sure the clocks be disabled after probe failure.
> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

Please add the relevant Fixes tag, as this is a fix and should be backported.

After which, I'll give you my R-b.

Cheers,
Angelo


