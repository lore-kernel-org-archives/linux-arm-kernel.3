Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AAFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UTK91GY1l2gHr3AsIq1attbX9Pte4LfQOTH9k6ujRs=; b=vkxjKoY5xXC/9pHuJKwteT+Faq
	nFpUcVvxF46XtvrD3E1VmwO7y0/zK0F+e2C0cV4EQ+FeVQdFKP+6mrgVr2Pwt6ppL/MFj+/gqmKFp
	rgFPEhiMhR+QJVcC52/6dvZn7i0ESC6tAj4LquraDvDa2Cu+1HqtikreE4iVwx2Tyvpl3+o9OKQKd
	tFarHGez4cDXZ2zjbnVm811i39IWLUdjAtCF1f08BT9F1EUf43USEu1zR+EDyILgxH7uxdo0nnci9
	SBrrb7vt87VomsFmLGnqmgHxSiMo+YGMuTqrIpLx7JsCKIMvw1KYu9ICCxu65BZ77hkpzZuCxEPLT
	BgCCmvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPji-0000000Alpz-1fU6;
	Wed, 11 Jun 2025 17:59:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLMG-00000009wJS-4B6v;
	Wed, 11 Jun 2025 13:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749647950;
	bh=YnZHAH16ZCoZK3qgLn0+Hvc/WENmD4Pl8KAmSNL+Yb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hgTspcjgX5qjLaXGcb9UQ23SvAQx4tbGKCiiY8/fTGjJe9k1HOPJTTX9CgF7mEre5
	 TN/wXhIC60siTNtw9EUYa7edrD966CThz8qEStNlBLsKXxFNQelpFiL+nvtcHqxbWq
	 buacOZ8MqQkH35PC/p4BAWR8sdhJVlEU7OPGm69fMSlwbcYyqJblLqgsLP++z93uIU
	 zWvR9ZQ1XHaxT1u2sIiPxyy+AbLoGn21ZuK4ZVXYPlfR62kcAl51hv87hTP0eb2/MV
	 +XgbdyjEjnSAuWBL/vfbPjxWJ0q4sc6K1aIBYBfbIqZDO2gpvwLnSg54RPYGL0WlMF
	 6w05HwFDBp43g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1230E17E0E3A;
	Wed, 11 Jun 2025 15:19:10 +0200 (CEST)
Message-ID: <313cea9f-f6c5-449a-bcf0-80eb5088b7f3@collabora.com>
Date: Wed, 11 Jun 2025 15:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, sean.wang@mediatek.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, eugen.hristev@linaro.org
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20250606090017.5436-1-chenqiuji666@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250606090017.5436-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_061913_193389_FC99C865 
X-CRM114-Status: UNSURE (   5.57  )
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

Il 06/06/25 11:00, Qiu-ji Chen ha scritto:
> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
> 
> Fixes: 157ae5ffd76a ("dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505270641.MStzJUfU-lkp@intel.com/
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



