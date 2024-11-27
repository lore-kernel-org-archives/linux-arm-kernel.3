Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB4FD609CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4I5zwip32VE0x80GczpRS+sOgjtsG2u2ASIHfQIlJg=; b=Rfbqaae5NJXUudJ5Yz24jBH6d8
	TZ/ll26JHhSklw8VYhrzOapPfhku+BegZtE3QGY56eD2n6Nr2dvmt5za/mkHumVtVXbjEYZBPROsc
	2z6lrFhqIbkVw49NkDa1hlXqcxsu5cUKjxIBt77fSv2mjSeUiLLL0mw06vfMpgaBkuAfCnmq8Nyvl
	VNymO0yxOhrE7mYHqCo+5ZGK+6M6glpObkMj98xGfEXNfI5aKpJBCitbgn5IGzUd76ZXnL7se+kb7
	Rbqo2iyc6u3CMTnszhMruAW9xznemTKoZzioWfg2pw0IrrprDX0tvgJ23RjWLZBn+gR4Cao8J07Hb
	EF4DDE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF7l-0000000CosC-1R42;
	Wed, 27 Nov 2024 10:18:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF28-0000000Cnkg-2oMJ;
	Wed, 27 Nov 2024 10:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732702349;
	bh=IaiHuo4scdpLUjxAuqxQCLHP5S3VKQOFoLobuMRfDP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qfpy63VRp+Uzmit3asBeOPNHHgjSk3bdV1jEs4Jb1m48XeD00Q3O78HQ/EG0GJWnp
	 WNdOWe6jzdj5T3Wbtvi4B8/dvg5s2RggxQ5dOjrvFFmIOJjk3CafjCRHrQ6vQnjCU9
	 IPmPdv8L6Q1X8eyet3hg2zryrTvaO6UL2l6Es127XCoCSU2HdS+qPP6FQK+lDwmGuM
	 t1fsdCJ4WFzxeYdjihlZd/840DeGzMyGZZEQzisYJ8YnASUpVk86jTQUmJEM/znADK
	 oCQnzBw9As4EnwZpuPfgnOmWvj3HBXSO7vKHvSiGB12n0J7pZgOjd1/mKshPitnIUC
	 JsqHS+pNcP90A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B98B17E35DC;
	Wed, 27 Nov 2024 11:12:29 +0100 (CET)
Message-ID: <20bc569f-273d-44c2-b725-250a974730d3@collabora.com>
Date: Wed, 27 Nov 2024 11:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: Check num_codecs is not zero to avoid
 panic during probe
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_021232_860823_E31B2466 
X-CRM114-Status: GOOD (  17.13  )
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

Il 26/11/24 21:09, Nícolas F. R. A. Prado ha scritto:
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), COMP_DUMMY() became an array with zero
> length, and only gets populated with the dummy struct after the card is
> registered. Since the sound card driver's probe happens before the card
> registration, accessing any of the members of a dummy component during
> probe will result in undefined behavior.
> 
> This can be observed in the mt8188 and mt8195 machine sound drivers. By
> omitting a dai link subnode in the sound card's node in the Devicetree,
> the default uninitialized dummy codec is used, and when its dai_name
> pointer gets passed to strcmp() it results in a null pointer dereference
> and a kernel panic.
> 
> In addition to that, set_card_codec_info() in the generic helpers file,
> mtk-soundcard-driver.c, will populate a dai link with a dummy codec when
> a dai link node is present in DT but with no codec property.
> 
> The result is that at probe time, a dummy codec can either be
> uninitialized with num_codecs = 0, or be an initialized dummy codec,
> with num_codecs = 1 and dai_name = "snd-soc-dummy-dai". In order to
> accommodate for both situations, check that num_codecs is not zero
> before accessing the codecs' fields but still check for the codec's dai
> name against "snd-soc-dummy-dai" as needed.
> 
> While at it, also drop the check that dai_name is not null in the mt8192
> driver, introduced in commit 4d4e1b6319e5 ("ASoC: mediatek: mt8192:
> Check existence of dai_name before dereferencing"), as it is actually
> redundant given the preceding num_codecs != 0 check.
> 
> Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



