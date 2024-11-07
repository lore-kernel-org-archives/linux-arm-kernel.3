Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81F4D43352
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8msaSe+3oWz+aKRykRN807B2tz3tiigw8hAFdXd/xuE=; b=4LjzAfZzfuaM7BMEMHJ2rVsyjJ
	WaJn5UI0x0ucX9sY3qzXMpLZKq181u8ijL64lHQ3Q6P0pVpm1ELsJ0eNUPpW49kWUzFsxWhOGe5Yj
	WcPyK9jStjn7XNUgFNC5cuXueuhOxEGlLvZNF3bTzSzojmgYrSsuGpJtMOuYnF5TlMqiA/XL0W8by
	FYnXmJAIIC/IsA5m7ulp6gJoAR4bUgdRVfDlSwObcngWbqWdBL+QEFaNnEr0Mhbeoj4TFQdhgvMtA
	rIHZgQ4wYB41CV2YiPZ++H4OBZu+X7kbiynpN/XM66fBqzTMqRHuAcq37+I1TI2YX0xonBSpyZ4g+
	TwNxQMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91fx-00000006wWJ-1mGd;
	Thu, 07 Nov 2024 12:31:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91eC-00000006wCB-1PXC;
	Thu, 07 Nov 2024 12:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730982597;
	bh=9UJ51zCp7wFqF/ltQGzkqv1QEUcQEdNvnUFBhAv+OvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TseUTXg8aYui9PetXY++xfEKHvzIkL108Spbu+2pRgYESsPB/z0XT192r4r4XDDUG
	 rOUVEV1tCflaYxFHUPx+wvBjqjZxpUk0IKChZYjccyrOeotMc9cmfDWUxqci8YJvMx
	 vqFKvpllM0rdm9ifsMTTvx6aTwMtLaM9hq+oD3QKT9zmR+ppNy1PGoTlsNSRNwwbT6
	 CVhADPi8Gn4iN841t9T/o6qQyUmta5PCBOOpkzSnI0q8MKE8pVJhfGOEK0QCJ/hUu2
	 TSBxGbMOfWkHu0fAwbIja2WifkwbFep/f+HvocZcJHpEoaPjsqq5DTWLn0z5lVjvwB
	 IzUovG/SKhmcQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5ADE217E3624;
	Thu,  7 Nov 2024 13:29:57 +0100 (CET)
Message-ID: <451c8f42-f8eb-4734-a19a-1e9a2694ce34@collabora.com>
Date: Thu, 7 Nov 2024 13:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: mtk-sd: Fix error handle of probe function
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241107121215.5201-1-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241107121215.5201-1-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_043000_562532_D6A5F48D 
X-CRM114-Status: GOOD (  10.33  )
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

Il 07/11/24 13:11, Andy-ld Lu ha scritto:
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
> Fixes: ffaea6ebfe9c ("mmc: mtk-sd: Use readl_poll_timeout instead of open-coded polling")
> Fixes: 7a2fa8eed936 ("mmc: mtk-sd: use devm_mmc_alloc_host")
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



