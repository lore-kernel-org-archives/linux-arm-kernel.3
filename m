Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7027C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/XhZzgLcSPvcTAeVmchQSSAeVbt7+imS8y+E/0mNY4=; b=RMGGI6loYYR+h45jd6B1ffG65r
	TWMD+AUy6Mi7IXM3MHMi0sjT5cVpLp5pLEFnC8fPlTb44YtteGmSaGAG1nadmxW++NopRtBwPEzHB
	YfJUVLPSBZrfcjFebA3WmeoEzSquRl2s1IgKsLE7+r9aos2MSZwa9I9X1WHhcz91Dg4td1COAtYsH
	b32wMtBfqkbEfBvTqRZwBkhMQ7P7CSHbQORdx7fq5rpgvFUe9YY6MbMzgikNGGeeVle2N5z5zUbh4
	8KOr8afPWjyTh1A6fWTCO4tcevz/ng+74nx2ktwF2OqU4fWGqdCt1VwLp+UPJRaJn7BRAMsbqF74I
	hvmgSONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aJM-0000000Dm1x-2dnN;
	Thu, 10 Sep 2026 08:39:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aJK-0000000Dm13-0b26;
	Thu, 10 Sep 2026 08:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789029547;
	bh=SiT1KDjlCQxg3SPpGnO4slKadQA03M3dNbnhOGR63yg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2s0wZeeGzlnMvAx9MIhuWw8oPIAKtAakw4b/WmlnFndxmywHJ4IK1Q0A77sO9h6b
	 QWGEPwCjOB/TQdvdnTqtmBYOO9CCm0Wdrgpj6zNfasuTNf3ZuIvZ2jFoNu5466sAJo
	 vX9Y/pnCvAZTHq04QrLQH0/aKhpZMuyEOWItNQgdA6H106HvixPmo/5Acz1/HTfB2u
	 K4A9A4tuHYZ4Fo69UZrk5XU5uYXwpTERx1bpkrIvV0cX9N1UfdrR8m8yy/ENoITuTU
	 oWCveip499+7Nbyz5IONwMHt58+wi2QczhgMPGFhL3h3fcRqKFlHy/EWR2l8QINn0C
	 sSAN8vA+RQdRg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87CC117E05D3;
	Thu, 10 Sep 2026 10:39:06 +0200 (CEST)
Message-ID: <cb72ff50-b62f-47fe-af40-d38558bdff6e@collabora.com>
Date: Thu, 10 Sep 2026 10:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit
 ratio setting
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de,
 chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
 matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>
 <5bmxa4pcwkiemubwfjun3dti4szu66gnxe6yw2pudq3wplpc23@inyswc2bdlhw>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5bmxa4pcwkiemubwfjun3dti4szu66gnxe6yw2pudq3wplpc23@inyswc2bdlhw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_013910_336149_DA14BBCB 
X-CRM114-Status: GOOD (  11.77  )
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

On 9/9/26 17:06, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 02:19:36PM +0200, AngeloGioacchino Del Regno wrote:
>> The comment in the mtk_phy_tmds_clk_ratio() function clearly and
>> correctly explains that the TMDS ratio has to be 1/10 for data
>> rates under 3.4Gbps, and 1/40 over that.
>>
>> Unfortunately though, the TXC_DIV register setting was wrong, as
>> in value 3 means to divide by 8 and, in order to achieve the in
>> spec 1/40 (tmds) data rate, this has to divide by 4 instead!
>> In order to achieve the correct 1/40 (tmds) data rate, this has
> 
> This statement is cut-off!
> 

Oh oops. It's just a forgotten line that has to be removed....

Should I resend or can you simply remove the line
"In order to achieve the correct 1/40 (tmds) data rate, this has"
while applying?

Thanks,
Angelo

>>
>> Add definitions for the TXC_DIV register values clearly explaining
>> the meanings (DIV2, DIV4, DIV8), and program the correct, DIV 4,
>> value to the register in mtk_phy_tmds_clk_ratio().
>>
>> This fixes out of spec clocking and, with this change, SoCs using
>> the MT8195 class HDMI PHYs can now successfully be configured to
>> output 3840x2160@60Hz over HDMI.
>>
>> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> With above comment addressed,
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> - Mani
> 




