Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmQSvjOmUl987InGVnLl1IejaQslFDgwlSMpRjCimuw=; b=Mn8z6Ykde7bp9hi1Ou2zdwNBQ5
	X2H81FMOg6BVG+zA6WgZ7EhBbvDQq++72WCZA2IP3gaGzI7QtzGoCC2WNFYoBpejG6Qiy+Fwl0wRp
	cjnMINT2W6Y+Sq0SMtVfmZpvdm6B4mm0qeocygwLU4dgCJLU5ZqfQZufJvA+A/xvNvcDHauPesUOa
	nHY6eBytrPtT3AAQmHSKORK/e5M54hZTcFpMtoWNPur0AATeN3RT9+4HAyBk3H+D8PatASO3ruvj/
	EYXb1XNuquc284WHCUqV6kVJm/2cdB7NvJoX6hfYHBpPdEUIdlNzL/RdaeDd39/sKkrfPV/oOfgAD
	TBsQXrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Yy-00000004kD5-1KTj;
	Tue, 07 Jan 2025 12:20:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8SC-00000004iwl-3hBr;
	Tue, 07 Jan 2025 12:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736251979;
	bh=LT27heAOjDF/SMRtDIkYdufE0ltxFQe7yGYcUmlMEEs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OS+x5My5y8Zv5tCI8vuqHayvFk8ihZvw1yn7i52y3H4RHZ1VeHrcwhAWnuytJpsA2
	 e3l/d8L9C8vSFT/bZKg2Tz0HCswnAIk0C9tGg3QLEFaKaIRnea9c6S3Gs7V6DvbC/H
	 CW+tVCSqaGor1XEy26aE2la2ORQGxdjbI4sw9nXyvWl7CYKwCvZZQb1QfMK96MxmP9
	 YxQyey4LoqBx59UCjRKgQ646EqCkVXci9JQo6MmjL3vb65SMFETKDoz79DNyTLzsS3
	 xSW92+7rbFxS9GMTWz1zGkq3Lg6iOBGc+gbX22UpFMXKx5SiudnOjMYOIirpmTK2Lc
	 8ltX5BzqPgw+g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3B5817E152A;
	Tue,  7 Jan 2025 13:12:58 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Neal Liu <neal.liu@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
References: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-devapc: Fix leaking IO map on
 error paths
Message-Id: <173625197880.58535.7586799150314757117.b4-ty@collabora.com>
Date: Tue, 07 Jan 2025 13:12:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_041301_096634_D25CDA42 
X-CRM114-Status: UNSURE (   6.59  )
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

On Sat, 04 Jan 2025 15:20:11 +0100, Krzysztof Kozlowski wrote:
> Error paths of mtk_devapc_probe() should unmap the memory.  Reported by
> Smatch:
> 
>   drivers/soc/mediatek/mtk-devapc.c:292 mtk_devapc_probe() warn: 'ctx->infra_base' from of_iomap() not released on lines: 277,281,286.
> 
> 

Applied to v6.13-next/dts64, thanks!

[1/2] soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
      commit: a985d806d231ab40992f59a8bf96acf1b7a94762
[2/2] soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove
      commit: c2bcebc6fbf74a5aa5b127349d5cd15577d78cd6

Cheers,
Angelo



