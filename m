Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EE3C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zfh1J1wScY6I6AtqTGV541Y/0tcJ30PORLPEWwfay08=; b=4NjL9nvgMDBnt7y+p2+NB72lZS
	g1029oJFh/joyT60nTmvWjAO9WEgYgYdxbLSgE5tJCm+lUnLPZSEPgMIIpXpYif0HsLIfNKdzjUGj
	3rlv3s5tM4LJc9aeFqCIqv2knwDFjzU7CBurOQpef1ofGLo3Yhsl+TCwgUEgXReBIeIYNbUZO94Ql
	eYmfTilsBu0zxFbIV1SWMAbdBp6cJTBzfvh/DAkrc9lJyE5G49CEfPwe4Q6MOryf5Lw9p/R/HdU4d
	R5F+Usd4rMp4DA8GFu09/PTAAZZ/t5ILk/AR4XScjq+PsGCI2Ytbhs8yVf/7AMh05/PkzHTWWKlzL
	niUe4Cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2WL-00000004weY-3Bzk;
	Mon, 17 Feb 2025 14:54:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk24G-00000004qT6-15TZ;
	Mon, 17 Feb 2025 14:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739802350;
	bh=GUAxZImZWtamppr8zlI/A9rVG2tyYKU95DwC2jGXbBg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mJOE/RVj3wNsVYObyE/oZbGXxop1evH9WUwdJoZUmA8+53sjNIBAVNW6klqDyio4L
	 OxQv+iqv5Lq/tD7aiwNo5rmA7a9FChrl45oo143dGcKIVxMJIufdV2b8IzE6eG2TWH
	 IOuxuElpbrjwjmuRzMIebMsDLB0+nPNVYi8E2wV18dZ/io13aQjFEGoD2I1bjiEzAw
	 A+oSCGd6CjFfz2+UbqZG7FY5oSdyn5PEp4sDFcEdQ4hJ4h0jh65WUMQGaFMjQ2lysj
	 t2Wz3yY13uQUyKxGnvd0YichLhTjV3Y98R/FBkIFgdlRQTk/ONx9VRx4SFGd+lHCG4
	 9UY81byDPryCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D4D4117E0F86;
	Mon, 17 Feb 2025 15:25:49 +0100 (CET)
Message-ID: <041ffe38-ca24-4e05-90c1-e37f9323c7cf@collabora.com>
Date: Mon, 17 Feb 2025 15:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/mediatek: Change main display path to support PQ
 for MT8196
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>
Cc: =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "treapking@chromium.org" <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-6-sunny.shen@mediatek.com>
 <b3a6afa2e818d31dc60632615215a88449fb78bf.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b3a6afa2e818d31dc60632615215a88449fb78bf.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_062552_443217_C4AC37C0 
X-CRM114-Status: GOOD (  12.19  )
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

Il 17/02/25 07:06, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 10:52 +0800, Sunny Shen wrote:
>> Due to the path mux design of the MT8196, the following components
>> need to be added to support Picture Quality (PQ) in the main display
>> path: CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
>>
>> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index b810a197f58b..1c97dc46ae70 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -242,6 +242,13 @@ static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
>>   
>>   static const unsigned int mt8196_mtk_ddp_disp0_main[] = {

If you build the display controller path with an OF graph, you don't need to
introduce any mt8196_mtk_ddp_disp0_main, at all.

Since all this work was done and upstreamed, and was done because hardcoding
the display pipeline for each board is only bloating the driver (and wrong),
just express the pipeline with a graph in the devicetree.

The driver doesn't need that array, not anymore.

Regards,
Angelo

>>   	DDP_COMPONENT_DLI_ASYNC0,
>> +	DDP_COMPONENT_MDP_RSZ0,
>> +	DDP_COMPONENT_TDSHP0,
>> +	DDP_COMPONENT_CCORR0,
>> +	DDP_COMPONENT_CCORR1,
>> +	DDP_COMPONENT_GAMMA0,
>> +	DDP_COMPONENT_POSTMASK0,
>> +	DDP_COMPONENT_DITHER0,
>>   	DDP_COMPONENT_DLO_ASYNC1,
>>   };
>>   
> 




