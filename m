Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BFCD2E9FF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBz91a8MEpFPVBEutYVuvXyg8fG9pG5FW8VmASXPlzU=; b=qHOMT7ejzvDNsPmnkCBX17dl5l
	zk/FfHZdZp2hQa6lpNOEDovNGDiSiy5iFC5OK988ME/InNMecFSUsL014i23n+bOJOsqS6kqXLbs9
	F9jUK6KES/3v/ZbaH24UrfF4T1ZJd8DZfKysz1NQaXWURDmDmS8Ib1SiRPgSO9izA2EQZjukSyjbb
	dWhWujN0/sQN65bxbHT4TgJxgTKNVv18N2sP4ADLAJnBlzXXBVQhnf/KB5MpA9anf9TXwlTqjWBkf
	ELlalLUXQFcVDBJ/DXP9hnJTlr0DKTMFjqBQuxmafAb6PbaNVjrGRH2iyNdUKDbOzqsP+z6XgRcQh
	0wZJo8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVRi-00000000KW4-3Q7e;
	Mon, 11 Nov 2024 14:31:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAVOG-00000000JwS-3GdH;
	Mon, 11 Nov 2024 14:27:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6DEE5C5A59;
	Mon, 11 Nov 2024 14:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70BCC4CECF;
	Mon, 11 Nov 2024 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731335259;
	bh=0HBp91eFMMg3rKBeBDysVTX9mLxQIHz9phYBimdndCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sbqA4CXwcNwBw8gvLUFLeNBaL48iTGzehpPg5Yhv0GwvduUO+nKVZahYoI2wdEQwi
	 4BNpw+B4xRdHlzD8ZyUoZWhF5lpd4KL6Favdt3REZqqZPEs1OiVJEOyZi0zSAtx6Cs
	 x98lCeuqTAtNNPvzPEejZyU7/45eOlFzcPYAGfmBltgfjVMo53DDBzpnarihw20/GQ
	 Qx//WwmaP/HOa/mfOyQ8KAIi4S8s4d9/0eHgLGOyZngJWGH7ScMg5NMrS3NVTOY8kK
	 r1Q0pjJW9N/UYlHS5ULw6XjL59ERlJ3eskvHZN2pzq/AD9x/6G5ScRAspOKKfeKuFJ
	 I1AzT8XdOb8vg==
Message-ID: <0c2f2274-4487-4d7e-a558-cb9608f59118@kernel.org>
Date: Mon, 11 Nov 2024 16:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Paul Cercueil
 <paul@crapouillou.net>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tony Lindgren <tony@atomide.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org
References: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_062740_889592_AC8D1360 
X-CRM114-Status: UNSURE (   9.25  )
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



On 07/11/2024 16:57, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/memory to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> A few white space changes are included to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

for drivers/memory/omap-gpmc.c 

Reviewed-by: Roger Quadros <rogerq@kernel.org>

