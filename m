Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3ABC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3J8IqxFlSoU/0r1zyy2o9xbU54oZgTZ4NmnsjxhNqI=; b=ANsYaV5Z8HtpQ9ceJhrtB63R48
	Xu1z2gv5BWraSCzFs9i8Tr/69IZZmqozls8YT86LBNw9f4lGKWZCUPEx2LV2CXE0H+MuIEiBvM3oQ
	eZljacCymKSSeeQWq0AJY+lrAYfI+OIVGWOpFeMoDY3ASNBShon4A/uk/pO/GVTKq7jARMymlX344
	DUPBh/2qBzbDXovxp19hZ/2kgZGtQ5ZgTHHwt9xvVFW84pMdRWv35B9kSXMEAHN7lLnxsmFZCjhkO
	O7KXkIck+HDJdBGApWP9R2TyODZm1anbyRMWteE+0IkVs3NA1c5xQTypbASNRhsFQdLBCnGCGpJgw
	U1usbHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61rP-00000002hCE-2Psw;
	Mon, 14 Sep 2026 08:16:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61rK-00000002hAE-2bzl;
	Mon, 14 Sep 2026 08:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789373772;
	bh=KmDFdP2PCGwNHDyGmTqqOczfnEO4AH8iQhkGwRe5FO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y7RvtF2MP6xjZFYMKxmDCKDtpY02DpCQAblLlSNyDzWAPmeYOsi1iFsvtq9xK8gld
	 9rDlVVb13kfU/MmLvqp1JgWUe0DUDlSludHi2488uUD9sJo4WEnPCOEROsTsI5o1G0
	 bU5Gzcv4mvcW/8cVY4ACwWqPRc71jGz3jxZCeJuWGspEEpWPyUVs+mlZ3HqvcizAzM
	 glz06CK7GUTBE5TmwdJ1vkIPiu72gkJr0Xk1hEdgikzbADwPOqWSFtAzxnRLpWL74i
	 rLiAzDm38lzFH6veUErnNvowB36Gqmd2vGQyqfIRq31T8tetuShapxEsUM6EvPk8EO
	 S9Fc+vrSFoZIQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFF1B17E091A;
	Mon, 14 Sep 2026 10:16:11 +0200 (CEST)
Message-ID: <811d2e61-cf30-40cc-9efd-02c11b79e747@collabora.com>
Date: Mon, 14 Sep 2026 10:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
To: Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
 <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011614_813690_9F6B924E 
X-CRM114-Status: GOOD (  11.93  )
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
> MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
> 20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
> a status bit that comes up once a hop has settled, and new_dds from
> mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
> never matches and every hop runs to the 1000 us timeout. The PLL does reach
> the requested rate and clk_change_rate() discards the error, so the cost is
> 1 ms of atomic polling plus a warning and a register dump on each rate
> change.
> 
> Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
> GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
> with GENMASK(20, 0).
> 
> mt8186, mt8192 and mt8195 share the constant but are correct, as their
> hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.
> 
> Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


