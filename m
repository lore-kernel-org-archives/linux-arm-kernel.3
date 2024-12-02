Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CDD7830E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWP2nOacdw8dcp9xCEnOhAq9+JdRNOxtUsMQotTb1DA=; b=BdRbssUyodC55b9f0PkvmQP6ht
	M6aIi4pXHWzmypZ5Mj+av0luSoA4TFI93b1xZXeJcmfJtjHaw2v7w1CRDfWgO+NkrMWJLlkJ050Qt
	JyDXYZe/z2G8t0fsItrSUST1cmFOx2afpwZyaDLkMUi1rFq80CyzBlcK8ufwKgFegdZ0pLdJAVwP/
	OR0yN9zIrVeNIhzd9d0QmlABAf0Pd+1P1r4lxB9IIyeBlU5VriiHeFoAlNpVuxCvpJJA/lpVNRoaE
	dv9XnvPWIg4MH6riKVbivPi0UqAbOxJY48uVmwRnQwEYgQJbiIIooaCH2Qgsu4zNTtnd8nEOho1lK
	I69Csvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4mk-00000005wIf-3w0K;
	Mon, 02 Dec 2024 11:40:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4fx-00000005uf4-13IU;
	Mon, 02 Dec 2024 11:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733139189;
	bh=Jsl069Z7B15EOI+tkFE003qkYdLsc0cZrKK5DwfnEcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ITYYuTg+SxY9g0kPy84cu0XpYjv4mjm0R/MclZQ3GPtgBIs3K2ogTX8hhXxZ2SzXQ
	 kuau5iLXO+nHJZkz15FOaBmtxgFTO0yV28U2oZL78xV65xYo1TVx6SqvYH3rBthTzA
	 bE7LeGSKnKwsRH0xxDkV6lLMwqfSu01o0sS9smtJ/d0RKVaQHkNPxx7I9cp9j0CWCI
	 BKe0+8s/n2wXhoJt21LhfGX9zVwjiHBHJ5173wmzKc4Ha4Cuxgo1auxdEhxqLvRMc5
	 Qolf5xPUBepQmMDRJJXZbT8SljiviLED/e56iLx9QQ9HTFOfZYGghjEnGgjuaFIdig
	 jKn5qTyYlrsPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35DC017E3626;
	Mon,  2 Dec 2024 12:33:09 +0100 (CET)
Message-ID: <000cf951-1afc-4bcf-9f72-c484dcfa1b2d@collabora.com>
Date: Mon, 2 Dec 2024 12:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_033313_429764_C28FDB95 
X-CRM114-Status: GOOD (  11.05  )
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

Il 30/11/24 14:58, Uwe Kleine-König ha scritto:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/devfreq to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> While touching these drivers, make the alignment of the touched
> initializers consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

For MediaTek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



