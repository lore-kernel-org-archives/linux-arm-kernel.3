Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113A4CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0mXskqG+N/OYJzrEX02yN5xbL6YiROAAykPs8sgc9A=; b=Vu1Grw1jqDwPw4Q7ndGKXYJSb4
	9vtgSz5OARuSJ05bWdsqiSbN4FDLEnyUjGsmXaFse0r2xpog2en6b1Lg4P0d7FrbP/UL0VxpZFTgE
	3oQNZs86FA9oQgfNKCYPkJYJprWgf5EgXqktL7arfpVYgFKBCTGG/iUyYpG6aP4vpIc9o9QjLPEnn
	T+wKzJJlIojmq54/mgOyDmZkEdBKPPM4ZsA7J1VgXahfKNqpDUTPfalmuUNblvAfeDs5YcXNWq5EY
	2wGCavCR6v9+q+jSQWXJ/562JcPlrJFRmiBz2lXckdXU9jCxVIh1yYP37F42T9JiNiC7Dd1OPpwZ8
	Fxj+bvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6D-00000007PDP-0Lqo;
	Wed, 01 Oct 2025 11:34:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v69-00000007P8e-12TO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318455;
	bh=RGqZAG5ZFUepNGRkuJiS/jtxSWMctgEuai/I5vyMdYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zs7EjgywF9Eewol9zMZfR3xot3u/T1kS4eP+HARGF9KYYlvJH+dUOjU5yw8d081hm
	 EgGGH8U7PxqKo/80kNhWR4hbGvFc/uQTiVaj3T8mBJfGANSYeGnQ8sJHvp0Ne4MDxy
	 QjsMG7smcCeM4DQP+QVsyCsHFN55LIYcjnNDhgDlCyLlWDjINNRv7pCfDpJzaXl7MM
	 XpKf08VJGPFvCzbhbXt+RgryDBwcJ2hBsuHc3Yit8pmDDgkN/PN923Q0ILlgptQYti
	 Ms/3rC69Pv8fjWbVFmc3WXXnMTMhU3UiHp0e1Is3tlpItjXhiCSt1U8cfV+KL6ce3p
	 9gv3x7TUZ+yaQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3192817E1345;
	Wed,  1 Oct 2025 13:34:15 +0200 (CEST)
Message-ID: <64c778bc-1a29-4ed0-96fa-dae38479813f@collabora.com>
Date: Wed, 1 Oct 2025 13:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 05/13] spi: airoha: switch back to non-dma mode
 in the case of error
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-6-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-6-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043419_171588_BEFA7146 
X-CRM114-Status: UNSURE (   7.09  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> Current dirmap code does not switch back to non-dma mode in the case of
> error. This is wrong.
> 
> This patch fixes dirmap read/write error path.
> 
> Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



