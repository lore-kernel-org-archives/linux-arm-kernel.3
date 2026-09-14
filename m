Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E255C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k39SxnrZMfdWVjQaPHF86OxGvf8o87JhugkFg8qWuBk=; b=OsVEgbkcfr8pEk0mtXOdCHvK2u
	k2XkAmoUUp6BF80fYXJM8aD4mALo509WCgGCRdsWAPoWQG+ZnPmpPai9yP/goffmt+GGVZYu91/IS
	qJNV7qTV1Uf/1gvK8I9XKgf7PUG+dU9d/Q6kwrCoHvJ0e+OF01I0/0Z07x5f8rFNkdPKs4DucArDW
	mb64z+GROr/axIQJE+1oSao8zt5gImfm8n+mvSXjrnnxfyrrcEYMVPKiaV1pPZOGGCa567KrKmAjx
	MeYMgd8nR2IDA6xfJk9kH2oEDh0/lDfEv3tdxjIhuMJj6usjr6dLFSNGJAdU+KQKGY1iE0IG/8V1c
	AJGx2dxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61rP-00000002hBw-1pMc;
	Mon, 14 Sep 2026 08:16:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61rK-00000002h9P-24M1;
	Mon, 14 Sep 2026 08:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789373771;
	bh=wVOGZOIoAqD9kxg/V5gIB3ga+5nuc8Ne44/nZXD7tYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FkB1NNcPSaQdSCKxeLfrLHsnDAMpai8mhY09L76wHyr+2PrJMNd/4fULMtGh3lR+r
	 xbqanqYeS3GnPAQPaJDnp8odwhsNxOjryyMKOsz2TbvJBJV3RC068Dmr9yRsjobESa
	 jF6P66B8xMaLdqZQ7XQNMUCx/FVEiFvnIxh95kh37nzvnS5AFk014cP3RrVNmHN+YE
	 TRvuN4b/ooPxsgsont6UHgnQiMmkQZ+6nV4G/s6CttVeIrMvkSDFOxUMVQ/8SE7anE
	 TdH6GI7TS1uUjVQ5BkK4hDQjP9sHNo1W/Fx+zhAfk++IAtpvBTtELbkTRJK3tpeuto
	 lDM8WVHhz9hkQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2443817E020C;
	Mon, 14 Sep 2026 10:16:11 +0200 (CEST)
Message-ID: <88272aca-2a9e-4a75-b7f2-4f7aac8b6d18@collabora.com>
Date: Mon, 14 Sep 2026 10:16:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
To: Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-2-3d0c0292c85c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011614_690516_653F4E5D 
X-CRM114-Status: GOOD (  10.73  )
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

On 9/12/26 08:40, Ryan Brue wrote:
> All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
> field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
> MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
> bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
> time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().
> 
> Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
> FHCTL on for mainpll, mpll and msdcpll, with SSC.
> 
> Found by inspection while fixing MT8173. I have no MT6795 hardware, so
> this one is untested.
> 
> Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


