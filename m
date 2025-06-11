Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297BCC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ceWooTgy2+jDupNZxgq24JTXHuRIrYX5iX2NIhNutw=; b=lbImLdrkeoIoFi7R68hUtY9svp
	9f8X4ieQuMXU9q2kCUNGKgq6BxC2m6BNixVhp1JcfmzsCtk4yhqTbhaFPVuI04ha4b4OoR8wwJybU
	vrfnkyHlBUPJvdbtNZUEivY61qf1KXjEK0SXSMf9J2rmvE56PIOgW3p/QthZQngsRcQ4M4Xfb+oHR
	C1chV4+O7Wx+nCbxJ8aL+7CV9d31/g7DsIKzgdbzaza/0YSzFrINQlZxwXokPaF/gKxAmGW2Zre7C
	YloR8G4ngBSkVS805ZpegsS38Z2xOzGZ573EqoqOPMIJeU6ucTpGramRcd9w4TuwNdJccc6mz212o
	MT/igi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMn9-0000000ADG6-0mLn;
	Wed, 11 Jun 2025 14:51:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIb6-00000009bNZ-1MqE;
	Wed, 11 Jun 2025 10:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749637338;
	bh=4b8PduoACBUaCTjAzlGQ9Kuyj+rMJBqCfxKWwFHLieI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hLGriKWWoCwGqWdh1GbD0GObWrxIh27iLleEURTa0gamLYw1slQuzfcKHMThAZbbD
	 u/vWvaGQDSIvec+qPx4kRkcu84Q3dsS2iEAn0TZgTlHYxEkQaKVXUOdN1CWlPz2Pfw
	 78Vi4zza2iDTen1lja1G3CwBtqnyHtgtd1ULn/QU4QIJQEH75hjpltDGZoaYdZrf/F
	 e8odADGznQabfvc23h6j2ZZ1CzL4S4POiylYfoRNYYiYnT89tSXS2ARYxerv4vP+/0
	 aA2Fyqq9t/mCPGrtj+2cjexHHTob+S3WGIb0LDbfY67LCGPZu3Ce1zxacePla06KqF
	 FR20WHeTAJipQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A640317E0C99;
	Wed, 11 Jun 2025 12:22:17 +0200 (CEST)
Message-ID: <89e2699a-94cc-4d1d-9788-2c5bce1c361c@collabora.com>
Date: Wed, 11 Jun 2025 12:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] ASoC: mediatek: use reserved memory or enable
 buffer pre-allocation
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aCRaTY76dnaavsrd@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_032220_516109_22AA1D07 
X-CRM114-Status: GOOD (  11.50  )
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

Il 14/05/25 10:54, Mark Brown ha scritto:
> On Thu, Apr 24, 2025 at 06:24:54PM +0800, Chen-Yu Tsai wrote:
> 
>> This is v2 of what was just a single patch "ASoC: mediatek: re-enable
>> buffer pre-allocation on some platforms". Link to v1:
>>
>>      https://lore.kernel.org/all/20250401085659.1222008-1-wenst@chromium.org/
>>
>> Angelo requested that these platforms use reserved memory regions if
>> possible, and fall back to pre-allocated buffers only if that fails,
>> to align with other MediaTek SoCs / platforms that already use reserved
>> memory. The series covers MediaTek's MT8173, MT8183, MT8186, and MT8192
>> SoCs.
> 
> AngeloGioacchino?

Truly sorry for this slipping through the cracks - and thank you for the pings.
Also, thank you for all this code, love it.

Whole series is:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Sorry again for all the wait.

Cheers!
Angelo

