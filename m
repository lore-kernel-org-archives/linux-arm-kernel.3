Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59513CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SONRaOttlMp8OIyY9jiVESbcAKRSgkO2lpj4SVPyv+M=; b=ap6A1PSFfTolBn7JYL7cOHvMhD
	z2fg7gDSVb883ZH30gLiOJK201a2C4YiCGev6ofBf469lO6UHQaG05nBvCIwsOc3gDNua9FOc81ep
	pjQflLlo9+AaKig49+vHkzoFypxeKB3zGjl3DwjcYmPvSXUvVIh/5/wTIBS6VWOp2putNqn1hfZmG
	PzBf26F634yj0Q3LQXtPwiBzcjJj49PXW6i1cAcgAcJiiBRnwVF8cRJajRVltP8IFagFQ6lGpf0JI
	2YF5J9p+bK4ajTtK4StAHPnMJ9bSmJl5Ann4B50Mp1+qcOIVdvJg2hI+z5ZoK6NxAEQTMNwhKXncX
	YwWW8EKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE46q-00000000uQM-3vbP;
	Wed, 29 Oct 2025 11:12:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE46o-00000000uPJ-1dUC;
	Wed, 29 Oct 2025 11:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761736371;
	bh=s35qvMWiPZye3mUq5eDEkpYwlGbij9U1I7wTMhBYFyI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ancwp3/XUPKjTQvDhJuUU/IpaBlsnpvEiPhZsSTX2lmXUrROvRFfktCfKVyYdFuAk
	 57F0XzYcMuB8hr40V6pD7NAbiOjIkUwf4r0b6Yd2ucGNYhWyfU5SbKxLifyscl8a/W
	 a9S2E1f4CwNWV/ufrd7uWNuyVY2JQALxqu5ND4GIsgRpwQRW8Fbu5cZb83+K2tkk/S
	 rlUMaBiaVCpgAS6+ocypqSOcomhDaBQnEqKJm6YPbtOMfmIFjl9hWVXrL4OlfGfn61
	 pDmZ5eVgmCKit0O2HtSRPEkOh4OI+Fbfq7vGTFKgFFMquuqfdavABm3t6QUrF957fk
	 BlMl0l1gxsUpA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D41B317E00A6;
	Wed, 29 Oct 2025 12:12:50 +0100 (CET)
Message-ID: <0ddae136-3c25-4d70-9bc2-4e423873cd43@collabora.com>
Date: Wed, 29 Oct 2025 12:12:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/12] media: mediatek: jpeg: fix jpeg hw count
 setting
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251029065354.22257-1-kyrie.wu@mediatek.com>
 <20251029065354.22257-2-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251029065354.22257-2-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_041254_643250_1051C477 
X-CRM114-Status: GOOD (  10.32  )
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

Il 29/10/25 07:53, Kyrie Wu ha scritto:
> Different ICs have different amounts of hardware,
> use a variable to set the amount of hardware.
> 
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> ---
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 8 ++++----
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h   | 2 ++
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
>   4 files changed, 8 insertions(+), 4 deletions(-)
> 

