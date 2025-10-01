Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A202CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POuuzDaE027sS3UnARcGZErQKblTvCldvGNQkoyhMyM=; b=jgfbZzAHIgXBSE8zqhnIHMBLeK
	BHFLcKTH6ED269sRZF5bPgZTxm745MUZkY2y9QsKx4caS19L62ayVr5Q0G7Gk+G5O/NnBBaZGPtxb
	4UYuS1P+7cc3rZhCZ6Vlp/fht0cj75RgA1y/w/I29bp376VvEG1frRcd4C0G/VZtPXWWHDlUZOKzz
	jhkSYFiT4MHLttp5//RWEIsM2Mq8Nb7rP15BcNxDPt63aY0eEm3WvTxKBsZf5Wkf6LVnTKctoLanl
	PxNt0hemdaFwUTZKVXvO7TWl9QUjpV0XwGKVjoCqn+oHXsZts7i0NYk332C9Mw00BDOlVM5S+WZRE
	maqgtU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vF8-00000007RLG-0e3s;
	Wed, 01 Oct 2025 11:43:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vF5-00000007RKq-12Jj;
	Wed, 01 Oct 2025 11:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759319009;
	bh=QwWYceFhrlj2n4QpoSYYb1INdrt8SZFnjsPSRKC8Ai8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JvdRWByaedr36nrzV9z49Su5k+BFyLuJAdCvn5zRJ7dTh6fnVFJZ43gx7RznmEaDQ
	 OpGNJgMdGzDpzyZzxZfAvSq7s38t/v/UeTzT6JnrQ1O5H7iX8usV7PVy7k4mxwTKrV
	 O2kTui57hrk7bH8gMQnn4Qz0CraaoAfVD+Hg9L2OjXuX+XN+Q79rb2hBmabmRMitQj
	 J3opN7MBT9NWwYzdz7iVKIhv3AtYDfooccdbeKEI42xfYKCljKG+eRDgSUWEtLjKab
	 Ry1qMKKMw06NXMyJ6V7MhlIKNy6ElIEsGU0dfJhfXT6vMrtfuKE3+SJPNFEJF3ljJA
	 28KvNjvVv1L9g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A46AA17E131B;
	Wed,  1 Oct 2025 13:43:28 +0200 (CEST)
Message-ID: <a1a84405-fa69-44f2-b714-4844303a8f4c@collabora.com>
Date: Wed, 1 Oct 2025 13:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: mediatek: Refactor pll registration to pass
 device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Guangjie Song <guangjie.song@mediatek.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
 <20250929-mtk-pll-rpm-v1-2-49541777878d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250929-mtk-pll-rpm-v1-2-49541777878d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_044331_437697_6EDD4F73 
X-CRM114-Status: GOOD (  11.68  )
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

Il 29/09/25 14:13, Nicolas Frattaroli ha scritto:
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
> 
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
> This will allow us to extend clk-pll with runtime PM things later.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thanks for doing that - this exact thing has been in my backlog for a
very long time now, and you've done it before I could, and without even
knowing that this was in my plans.

Perfect.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

