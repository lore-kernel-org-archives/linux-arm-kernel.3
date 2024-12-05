Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7972DE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcL6LK93M7DNVKiaLOsm9hd8sg5VT8mEQUy23TGFPuI=; b=efu7p8CJDClr+pjw4N+No8EVr6
	mae3L1dzFhgKw1mWPn+8uuiH5T/rM9gSeRUjeP6kR10GSk++F4cRYVBoFUcpK0j+1XdGMriZVrr35
	1qgwd9jGzTJp89xPjmrYuhHJL5VL5v2d03GwxavF7Sr6+xJzvg2YPZz1OQEBSzz0NqOQOhGM/fm68
	fywInT92jD6Iggcyqfss7jeGWqYKzOZVzLJhstkGi41fkfVt5ffAhrB3ymyCrvU4smctCWVT2u7r5
	6awDi9QmHE2Sa5+qWYT45hfxbeyjtE5dC7piqRAMIVdzw6PKt98bysEJR5mdP907Z8UnHVnnSIuWH
	YemPyNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBMX-0000000G1h0-3dFt;
	Thu, 05 Dec 2024 12:53:45 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBKp-0000000G1Ui-3ipM;
	Thu, 05 Dec 2024 12:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733403118;
	bh=YFG6FkeYF20hfhB+H5eEVSa+7PdyoD2Fi7/VWdKN8TA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KZSgg/eG+4pJoYg5IOAh4jn0QexhOcRzFpHycAlWZdQ3PQcacmRwLiViHhCfpCyx3
	 SgEYLUIW373laCBE2ZpsVyDd/WarbyA/3w8WsmvjLxdC3wbM7KXhxZg29W12e6Q5Yk
	 f62XrD6L0AXoNwVkg4Te7ORJJZQOuaRSLUyMbq7+kugsJChxp0He5LzsethuHQ4dqA
	 Ti7n1SPjPhNcVlgCeqR+J37KfmLt48dhu4XSMKk4G+U5VEBQ8gGtKmO6wRe0Av5FF8
	 haU1hnrwnZYE3aPFxBtiyO+022xaK2ZXxKWNcseJ1bO05wdokYUrZuTTNOXCbJCnu1
	 WxwkoVLcByjRw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3C8717E36AF;
	Thu,  5 Dec 2024 13:51:57 +0100 (CET)
Message-ID: <a70a0521-985d-43a4-a1fa-36eb733d5ca9@collabora.com>
Date: Thu, 5 Dec 2024 13:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Enable apll1 clock during reg rw
 to prevent hang
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Nicolas Prado <nfraprado@collabora.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "perex@perex.cz" <perex@perex.cz>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20241203-mt8188-afe-fix-hang-disabled-apll1-clk-v1-1-07cdd7760834@collabora.com>
 <a10dbdf265194e77a69b6e40afa3df9636b3ab14.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a10dbdf265194e77a69b6e40afa3df9636b3ab14.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045200_090732_09539DE4 
X-CRM114-Status: GOOD (  21.08  )
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

Il 04/12/24 13:17, Trevor Wu (吳文良) ha scritto:
> On Tue, 2024-12-03 at 17:07 -0300, Nícolas F. R. A. Prado wrote:
> 
>>
>> Currently, booting the Genio 700 EVK board with the MT8188 sound
>> platform driver configured as a module (CONFIG_SND_SOC_MT8188=m)
>> results
>> in a system hang right when the HW registers for the audio controller
>> are read:
>>
>>    mt8188-audio 10b10000.audio-controller: No cache defaults, reading
>> back from HW
>>
>> The hang doesn't occur with the driver configured as builtin as then
>> the
>> unused clocks are still enabled.
>>
>> Enable the apll1 clock during register read/write to prevent the
>> hang.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   sound/soc/mediatek/mt8188/mt8188-afe-clk.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
>> b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
>> index
>> e69c1bb2cb239596dee50b166c20192d5408be10..fb8cf286df3f02ac076528b898f
>> d0d7a708ec1ea 100644
>> --- a/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
>> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-clk.c
>> @@ -587,6 +587,8 @@ int mt8188_afe_enable_reg_rw_clk(struct
>> mtk_base_afe *afe)
>>          mt8188_afe_enable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_AUD_A1SYS_HP]);
>>          mt8188_afe_enable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_AUD_A1SYS]);
>>
>> +       mt8188_afe_enable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_APMIXED_APLL1]);
>> +
>>          return 0;
>>   }
> Hi Nicolas,
> 
> If I understand correctly, APLL1 should be the parent clock of
> AUD_A1SYS_HP and AUD_A1SYS, so it should be enabled automatically by
> CCF.
> 
> I'm not sure why you resolved the hang issue after enabling APLL1.
> Could you share more details about the solution?
> 

Hmm. Now I see what's happening here...

Nicolas, Trevor,

Possible parents for top_a1sys_hp are:
  - clk26m
  - apll1_d4

...what's happening here most probably is that after the clock gets disabled as
unused, it gets parented to clk26m by default as that is parent index 0... and
something else in AFE needs APLL1 to feed a clock to .. something .. to allow
register access.

Trevor, do you know why is this IP unaccessible when A1SYS is parented to clk26m?

That might give Nicolas a definitive hint about how to resolve this issue.

Cheers,
Angelo

> Thanks,
> Trevor
> 
>>
>> @@ -594,6 +596,8 @@ int mt8188_afe_disable_reg_rw_clk(struct
>> mtk_base_afe *afe)
>>   {
>>          struct mt8188_afe_private *afe_priv = afe->platform_priv;
>>
>> +       mt8188_afe_disable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_APMIXED_APLL1]);
>> +
>>          mt8188_afe_disable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_AUD_A1SYS]);
>>          mt8188_afe_disable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_AUD_A1SYS_HP]);
>>          mt8188_afe_disable_clk(afe, afe_priv-
>>> clk[MT8188_CLK_AUD_AFE]);
>>
>> ---
>> base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
>> change-id: 20241203-mt8188-afe-fix-hang-disabled-apll1-clk-
>> b3c11782cbaf
>>
>> Best regards,
>> --
>> Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>>


