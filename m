Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F6BC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ajz6QvfIPoWST2gPobUz4JJMn5hIHPMN2q0uTcAYj8=; b=XknSz2QzL6bHuetbPFDJmen7R4
	W9ZWgMjJH6preMYe4lJJoY6a7TzF2kKNmmHA33SMQOFZ+1cEjUlK9mAEeZAGMS9RYFt0zu6gchuDU
	o2n4RyF2RpxZEbLaqKtc3zjh8Ex4DkMFZuLMioFXU/eH60B4HR8N2pDg4XtXl32JOWy7bv7GnNRQr
	E18wsnmxKA2gJVsR9oaGqnz3XrFrKMshJd5x4VpOCOwnuVJdAoyBb6uEJlZmOTyZG7huVcU+nR/15
	e2oSyzIMi8tt5JKVNTlttf0lf3sE16K/0dOKGq1r/QTTsZdTXiVvhbqh2qVnIJ7u08KWsq9Qx7tkX
	o6l6mDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzby-0000000EwGe-0vBy;
	Wed, 15 Jul 2026 13:25:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzbu-0000000EwFP-46Q3;
	Wed, 15 Jul 2026 13:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784121912;
	bh=X4hQ+PvvpEFhGE9C06CCHumxc5qZ+hbNEyoPw6puCII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXumkldPtd+e+lBP2cMWTV4Ri8iZUa5BqPUvQpqEoi09jZd+Z+fozCyBlv3i7buBm
	 0YhLBlvIADf/Rrg+TW28ks9sCjqpTLKRqGN31jUR4NQePGOGEN6Ps1fClmBiAj/Jss
	 uvuviNrBdHRhichf9JK4C6pt5+2ahBzZkygh4KwwDJvr8sAuufHL31c59v//drDXWb
	 EF3oUnOuKmjuunj8uy80HKIIr6pW29XMOexWQmokxrSz2S4ZrVnD0BlAB25uWYXBgg
	 iwU9O+kHn6z0LCtaJrwzRaDLeTLQQvNvL1SWcIrpGWSFNU+MCgunihXM8xrnQcMMfl
	 wr+jKqU3LQ4pA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D4BE17E0DE9;
	Wed, 15 Jul 2026 15:25:12 +0200 (CEST)
Message-ID: <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
Date: Wed, 15 Jul 2026 15:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Esben Haabendal <esben@geanix.com>, Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Adam Thiede <me@adamthiede.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8733xko1ms.fsf@geanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062515_179831_8A07C8E3 
X-CRM114-Status: GOOD (  12.46  )
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

On 7/15/26 14:53, Esben Haabendal wrote:
> Gary Bisson <bisson.gary@gmail.com> writes:
> 
>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>> running in order to lock its PLL during its own pre-enable function.
>>
>> Without this change, the bridge gives the following error:
>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>> sn65dsi83 14-002c: Unexpected link status 0x01
>> sn65dsi83 14-002c: reset the pipe
>>
>> Move the necessary functions from enable to pre-enable.
>>
>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> 
> Hi
> 
> I have run into the same problem, but in combination with another
> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
> bridge and the dcss driver.
> 
> I have submitted a fix that adresses the problem in the ti-sn65dsi83
> driver instead. With a bit of luck, it can replace the fix proposed in
> this thread.
> 
> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
> 
> /Esben

That clarifies a lot of things.

The patch on mtk_dsi shall be reverted then.

Cheers,
Angelo


