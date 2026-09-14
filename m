Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453B1C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwtNamVppoCHbYqbZi9q499OEY2ueI6/B2MiZTzOFFw=; b=vyXGpElQ9El2xfhnMGR9DmaD4C
	fDL9nxur5eiIpfaPqkXfKDtEzatScnp3e2lBpozGjZjO9rOUUbH2quqizOVFXMiucQ3GPVqwDh6Ql
	aLgtUkfQa2+wqRuwwwrqtm4AJ4fkv2gIlJ9EPOd8Me5ECEEbhQrugWFs9kr+gTt1blBVkjRWS0Xvg
	vnYXlNkUCaDEZ0MTaqi4NTPFMNoybgyTTexsCH6WcHoSkZkrcyMEqjLAl5LgHkEFGw+9xFuOdZWfp
	yTWZr3sr83Qsk9HLeGJRn1nZ1oxa1N4AtXpT7ZrmtMVtBGKxo0dcT/wemc5ea1s6D88N4QMB3HgV0
	CQfhql4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61tS-00000002hYK-492J;
	Mon, 14 Sep 2026 08:18:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61tR-00000002hXU-1Gl1;
	Mon, 14 Sep 2026 08:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789373902;
	bh=DWggKVY8dMTtllAFA52TbFspZ6he1PLAFTJ0dJKkSDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I25XpAC06/I3GfHLgZt/v9IewDM52y/atTzc4iP6NsBkhEcubS81cw/KOMU9IzYZD
	 TdzCWfEYrcLUNsM9x0IMC3EvudaVv9uQ7SsvVtaE+Bi1H8Xg+jCkuzV6bpb3G6M3PA
	 cC5+Wr3zzOixAPGFCzH50qNxdIsS7uUxGVvm/BSN8fF/VesB3rD39ERE/YexmxsfIC
	 MEby6kGFk+MdwrsaJ4PDtqqGYd4fMT88WQLGkozyvX9/CUnVmH6XdM9iP4Nd7or5h6
	 0rUaA3jwfphEhZxr3gbtDE09jzGxMmO1+ZunKkHYyABuLAJTnq7PY5khliM1lo6IRD
	 0Yvv0wu3jhV+g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F311717E020C;
	Mon, 14 Sep 2026 10:18:21 +0200 (CEST)
Message-ID: <e28acd6b-aac6-4e2e-8d0b-b9ed22820d73@collabora.com>
Date: Mon, 14 Sep 2026 10:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix pdata array members initialized as
 pointers
To: Sasha Levin <sashal@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260913172930.1150324-1-sashal@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260913172930.1150324-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011825_493033_E7CADFF7 
X-CRM114-Status: GOOD (  12.75  )
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

On 9/13/26 19:29, Sasha Levin wrote:
> Building arm/arm64/i386 allmodconfig with clang fails:
> 
>    drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: incompatible pointer
>    to integer conversion initializing 'u16' (aka 'unsigned short') with
>    an expression of type 'const u16[4]' [-Wint-conversion]
>    drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: initializer element
>    is not a compile-time constant
>    drivers/phy/mediatek/phy-mtk-dp.c:761:18: error: suggest braces around
>    initialization of subobject [-Werror,-Wmissing-braces]
> 
> 14 errors in total, one set per offending member.
> 
> off_ana_lane, off_dig_lane and driving_params are declared as arrays in
> struct mtk_dp_phy_pdata:
> 
> 	u16 off_ana_lane[MTK_DP_PHY_MAX_LANES];
> 	u16 off_dig_lane[MTK_DP_PHY_MAX_LANES];
> 	u32 driving_params[PHYD_DIG_NUM_DRV_PARA_REGS];
> 
> but the SoC data instances initialize them with compound literals. A
> compound literal is an object, not an initializer list, so this is not
> an array initializer: the member is initialized element-wise from a
> scalar, the first element gets the address of the literal truncated to
> u16/u32, and the remaining elements are zeroed. Hence the three
> diagnostics above - the pointer-to-integer conversion, the address not
> being a compile-time constant, and the missing braces.
> 
> Arrays are the right type here, since both members are indexed per lane
> and driving_params is sized with ARRAY_SIZE(), so drop the casts and use
> plain braced initializers.
> 
> Found by KernelCI builds of the linus-next tree.
> 
> Fixes: ae859204b519 ("phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata")
> Fixes: 7cf38eb0ab59 ("phy: phy-mtk-dp: Add support for digital and analog calibration")
> Fixes: 6fe4d5beac72 ("phy: phy-mtk-dp: Add support for MT8196 eDP PHY")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Whoops, sorry.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


