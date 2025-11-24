Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4399CFD31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqdTUMCeW7Lensd0T2BzMn8sozpgpEo0C1IIhY12GRU=; b=AkvxZs5DWEX2Idw9cpZofOH2GL
	JQn8U6pIzV1K/ZjePcoL+VNIsDIRTO1yC98L6v17p7rssybnrX0vRdV8I1JWOwlX/5To/83tDQXEo
	Q2o0Aqox1ybTDg/UAAAWTt8/WtRBaKH3spbnyP+V+K8tvyG/vKn6ycY7tHapve5KLTvEYxbxe/YEv
	IbFIgYrWRMr5nhCHE/BA8UJLinimAiLMHFR4lPZQ4iC/8xuo+1nU/S0U43J3D4lWFs4/fNN8nrsBC
	hGW1D5JLctRkPQVr1l37JT25ZjHcBmDxx3J3FaFo4qabXMslohocbqdk3jecAadwreRZ5q+i0EGcg
	mRd5PKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSE0-0000000BIRe-2ky5;
	Mon, 24 Nov 2025 08:47:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSDx-0000000BIQo-3Njl;
	Mon, 24 Nov 2025 08:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763974021;
	bh=Lh/Fvv6yUxE9thBp9vYaxzBuy27oKjRvkalfxWUJRGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yju8eTl02ktUwBS3epbE6CWaJ2t86j+NXq+KOFwYDhYNBPGqG9yQuus5P4S0g7OXG
	 QZncMgYs1Eb2yVbwxIg7RjdRzzYIpTH7r8cBqc+OhyyWNDd0zAx1funsaNgvOah4uh
	 3PBWBiMEOsaggJHjnp5jocu90zp7TVCfyL+Q8SF1s+cNMRnDdrUa7SyiXXAhimgn3d
	 xDFy3njJPRyuR+jU5I47vg6dr0Kj9hE0URDMw8oUQ9LlUWzwb9/TG7g6dXumsMtkAr
	 Sdy34LoNt8JxYmPrA9sbwYWHctNvjtWOAK7P3NEmozgbpwUCxwFeErcsb0iLdcEvhT
	 vQicr/3uc7LFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AC9617E1123;
	Mon, 24 Nov 2025 09:47:01 +0100 (CET)
Message-ID: <402f3df4-15e7-4903-ab27-fe80be609073@collabora.com>
Date: Mon, 24 Nov 2025 09:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Fix error handling in runtime PM setup
To: Haotian Zhang <vulab@iscas.ac.cn>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, laura.nao@collabora.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251123154315.1564-1-vulab@iscas.ac.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251123154315.1564-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_004706_031219_2FCA857C 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
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

Il 23/11/25 16:43, Haotian Zhang ha scritto:
> devm_pm_runtime_enable() can fail due to memory allocation. The current
> code ignores its return value, and when pm_runtime_resume_and_get() fails,
> it returns directly without unmapping the shared_io region.
> 
> Add error handling for devm_pm_runtime_enable(). Reorder cleanup labels
> to properly unmap shared_io on pm_runtime_resume_and_get() failure.
> 
> Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers during probe")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



