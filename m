Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F425C678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p6XOkeoDQJLkrsMNO6nm3ky3rtrZULdQv0fQ3koQnY=; b=N0coJLr0wEyaUPfzPkMoB/PyCM
	ymBm4F13lkd5gwhojYL7hJcfu77CDbcESiHkWfDwVlF88vuvidgki3qw7acGt+t2TpbwpUxlls20M
	MJzfmbPnfTEdepAnAte0ugSdv30usyqiOfdQnigFq8rXGM6U8/jACIkT1faTS93CdVtXOQUNVkpS4
	TnHJ3nKOiZWnswB9m/183o3Qz7RGbOMmmpNrTU+mMBe9bp3npwBCA3tkd0a9Q+fjO32/B5T6Jxf+8
	UCupV6dwsDWOB5mpsKxqcNk+fuXpB8cbYQgh7ndrHSLHErS1dBSRbe9qG/HsA2RM/2qEvjroQ+EG7
	Mlht47IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnI-0000000ADWL-2ZY1;
	Wed, 11 Jun 2025 14:51:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIkL-00000009cg3-3mg8;
	Wed, 11 Jun 2025 10:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749637912;
	bh=3z8hZFa9//bUvzwLa3zjwL+7K6avZpJg2PLIMuQmLL4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Og+Ohgdrlx/tf6pMagXXUidF1owJ7JRpFiMxz0sXLlLR9I2U8xFsYL9B+0W1w1MT3
	 ABTGmg3o1ZfpZDQW+9sCzpec1N0npade21fFY2BIdbUSmoTiAndGHckAXyVLBin1Zw
	 SEFLxL2fNGuiAOER7JvOE7F5hrIsNSMOMWwk5wJLRaG04QJoWl4/qY1oXWuzJBb6Af
	 wsSwTI7WHVnBOjhKpaaXNrSKvb/y52T44HaGHpXZpxyCXBT0I6xgzKADXngnaMedXD
	 TeT5RIjeDhQMAfnPxWxgjbiRGw9wPUnIqens1694qMuudhCCCtN7OR2QcCO8DmFrm2
	 P+aTeW0M3kohQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F6D417E02B0;
	Wed, 11 Jun 2025 12:31:51 +0200 (CEST)
Message-ID: <ccd10443-c643-487b-ab2b-f1da00f97ed7@collabora.com>
Date: Wed, 11 Jun 2025 12:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250424102509.1083185-1-wenst@chromium.org>
 <aCRaTY76dnaavsrd@finisterre.sirena.org.uk>
 <89e2699a-94cc-4d1d-9788-2c5bce1c361c@collabora.com>
Content-Language: en-US
In-Reply-To: <89e2699a-94cc-4d1d-9788-2c5bce1c361c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_033154_085252_E2158115 
X-CRM114-Status: GOOD (  12.64  )
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

Il 11/06/25 12:22, AngeloGioacchino Del Regno ha scritto:
> Il 14/05/25 10:54, Mark Brown ha scritto:
>> On Thu, Apr 24, 2025 at 06:24:54PM +0800, Chen-Yu Tsai wrote:
>>
>>> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
>>> buffer pre-allocation on some platforms". Link to v1:
>>>
>>>      https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
>>>
>>> Angelo requested that these platforms use reserved memory regions if
>>> possible, and fall back to pre-allocated buffers only if that fails,
>>> to align with other MediaTek SoCs / platforms that already use reserved
>>> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
>>> SoCs.
>>
>> AngeloGioacchino?
> 
> Truly sorry for this slipping through the cracks - and thank you for the pings.
> Also, thank you for all this code, love it.
> 
> Whole series is:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Sorry again for all the wait.
> 
> Cheers!
> Angelo

Also, I picked patches 10 to 13, applied to v6.16-next/dts64 and manually fixed
a merge issue with patch 13.

https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/log/?h=v6.16-next/dts64

Cheers!

