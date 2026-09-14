Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9432CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zvfAl2WXpyRbptwTK34md1iz5r8Ti8hPBdZeaTQQQ0=; b=dUBJBj2wNvGS80S9xaI/1CbJ77
	LeTupa44DndMFb53dmAoPndAN2tvbx5SYXHSJvzXwdwxlnNK7Zrbk1hD6eX3+sdtMM4M4xhnMyzF5
	McM7hrezdMMlA2mOPHb2v9gU5yYBLhbWd/AIUXHEfO+svtrgW6v7wrfKxCJOD/0JnVgFLOMXL/0ZU
	yvFs2F9sOYCcDRS3wOAZRuBc9sQ0wEP+cztjFxGecoqqfSxzcPcOJqv/G8FB9Vx900QUBZkxmhkXv
	VVctUcFOlexDFBvB/Jz6IpO21iSrrrk2kiexgI4jah8yH4k9G+IPaXcQ97367MM/EKLgdr6KelzWW
	JOiOGNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66jt-00000003llX-3Jbt;
	Mon, 14 Sep 2026 13:28:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66jo-00000003lj0-2fLd;
	Mon, 14 Sep 2026 13:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392526;
	bh=REg4uHosenbAzdgcoWyyerJu0bET1xnnXP0zRa4SxuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JtEKlTZqyP4QCKWctQQaSU04v/ZcRaHosFekq2SlpKf+qf8lK25dl3pdTgqNQLUJq
	 NHo057bIdCakhw2D7kMI1eFfaSphIsjkaeOvT0v7vYuqmMLgn1HDX3XhBTJYK6mkAf
	 piay2ebCwrdAg9BKqvcyWy03vpJP6Ilab2ukxf7cyh9aq535Mj46OXdW7dhkcAbsfi
	 +jJxow1i+99lq88nLKOEshluO9DIcX4CfGNgwgSClCYc5xFIgph7IWoNaPyjHCDwok
	 F1xTTiCjq/KVutWK5mjB4Hk6jRNqm6Nz083uDLu8Qra0mYRIB2wiB/Gz/yMeCEnrVq
	 5YaqWYIVIcYsg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24D5817E01D1;
	Mon, 14 Sep 2026 15:28:46 +0200 (CEST)
Message-ID: <9a2059d2-3682-4716-a8b7-82acac520234@collabora.com>
Date: Mon, 14 Sep 2026 15:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] ASoC: mediatek: mt8189: Validate sysclk
 frequency
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-12-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062848_827191_74982412 
X-CRM114-Status: UNSURE (   6.14  )
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

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> A zero frequency causes a modulo-by-zero error when validating the
> I2S clock frequency. Reject it before performing the validation.
> 
> Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


