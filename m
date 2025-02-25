Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8339DC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztJ9TPKfw79H1U7F8FNYKgieHHYygfRVq9fvoom+UzY=; b=TpO3c1UxnCg8TGiZPvyEhjFkdt
	MqjlQLU5pF9BTuYPJPRxvD9vMSAnWYqTMox/zR62mSHlsI6GbEM3echKzqcv2tFlvWzO9ZUWLNyn/
	RIEQ/YYLpRH3umQrZS/pfKALC9r2UOMeYhaELsCeRn9YuFELjE53y2YTkTQUljcTOqbaL1mJXEJ27
	NVJDQ8SKoAT0KiwTV0MC7JAQt84pPrvLymKL3MU5O7PtaZv5SdlaszIrI3OixhD6vceK9/mYI6xBC
	7IhzXwOZO33TywA/i8W4eHkq4o3LdcTQIOe+ubSVG+aXANlZqVVYTUyS1xhSdX16J66O8FPrOPBp4
	kAfg4HZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0H-00000000KW1-1orV;
	Tue, 25 Feb 2025 16:41:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw8C-0000000HYym-11Tq;
	Tue, 25 Feb 2025 14:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494515;
	bh=XGd1XNQmqCz8KaVN0OhhQX9JZety99RRX4T3g5Moydo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kr2oUmfcJQuKh8aILaNXIdCk1gSqWLuexXQKP5GEN6nIHKFq188/m0uvAxW/kwaEL
	 BcewF+ymErrazigNMoAwodNtf56IjFDJQZuuIr+zpzzBPfKYUBz2V11BhYWsPYZV24
	 rPSymGxo2avto4L43NxPAKZf1/BuJJbHx4lsNJGF+67u7gCM2pcXJlpzMSXWIEIioC
	 5DRWAeVnH/tnCPT4RTKex9V6MykG2hjKoQaTPhBECZyUG/MCZBNP5YaEgBE5sTJ/hj
	 D/QfV/e0loBOt5//Fe5eOCwsyLaBFnUo4PczRljtEWv/mqUaMz8Kiv7+P/9AlCMXv2
	 Y8RJGKDAeTfRw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2693717E1016;
	Tue, 25 Feb 2025 15:41:54 +0100 (CET)
Message-ID: <173e41bd-4fa0-4b54-8739-546536ad7c3b@collabora.com>
Date: Tue, 25 Feb 2025 15:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as
 non-volatile
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-3-3076f5b50ef7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250225-genio700-dmic-v2-3-3076f5b50ef7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_064156_430508_1F32EC1C 
X-CRM114-Status: GOOD (  14.48  )
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

Il 25/02/25 15:33, Nícolas F. R. A. Prado ha scritto:
> The DMIC_GAINx_CUR registers contain the current (as in present) gain of
> each DMIC. During capture, this gain will ramp up until a target value
> is reached, and therefore the register is volatile since it is updated
> automatically by hardware.
> 
> However, after capture the register's value returns to the value that
> was written to it. So reading these registers returns the current gain,
> and writing configures the initial gain for every capture.
> 
>  From an audio configuration perspective, reading the instantaneous gain
> is not really useful. Instead, reading back the initial gain that was
> configured is the desired behavior. For that reason, consider the
> DMIC_GAINx_CUR registers as non-volatile, so the regmap's cache can be
> used to retrieve the values, rather than requiring pm runtime resuming
> the device.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



