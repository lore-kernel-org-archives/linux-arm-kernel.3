Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F1CE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUoipqwINErtScImQT/pK8ikFLW9WxsFyv2aWgrTKQU=; b=fojg2zTKRvrgYTd5d9H+CZhQND
	WSkktgJOcZVmlrPgw58phe6HxEtBzqKAJgaTYN4pOz2SYTTOFlo6VIMu8NrMRAyXEcuTzV9LTm/jT
	2Bt1Y+PSSc+olTbpKNbK5R/oKhbDFBe5E5njcdxmX8HfBJJEzXOVoqV5rC8Z/SsOcP11M68fguwXD
	L2+Ujqk6FAykMQdhYfTH6dBI792rXAeDZfTklhvTf7yLpZCCvvJkgIv5nzgQTMuOutl2LQJXn9pww
	JCRfWEA9kWf3UIDPMGjJnYjUmrW+dS3z1XwAubW1W+9eLlzPsh5gEH4dRUf4T3YTxfmmY0WxwDMSD
	lSH3ZkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLILG-0000000EGTJ-08x6;
	Wed, 11 Dec 2024 08:45:10 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIKB-0000000EGBX-1Qp3;
	Wed, 11 Dec 2024 08:44:04 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 13DE340349;
	Wed, 11 Dec 2024 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733906639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WUoipqwINErtScImQT/pK8ikFLW9WxsFyv2aWgrTKQU=;
	b=fET0avlRfjFvv6n1c4Q7Byb5prAb2b6BY2o49YLKT3+i/tNGTqN5LxuMYxmsigTLJ5WuZf
	TduRVyFFyJpATin75Ah4YgvM0WSqzgGn1JPEQJEAfgVGQdO/sSNxB9HZ4U1CYfVH+ihB2k
	LOvt0BkmZZ0UPpSCW1ka4m2JJZ+PhY8=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 46180360076;
	Wed, 11 Dec 2024 08:43:58 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 11 Dec 2024 09:43:58 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean
 Wang <sean.wang@kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Sam Shih <sam.shih@mediatek.com>, =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=
 <arinc.unal@arinc9.com>
Subject: Re: [PATCH v5 2/5] pinctrl: mediatek: add MT7988 pinctrl driver
In-Reply-To: <32201aec-f3d2-49a7-b0ca-2ede10fec103@wanadoo.fr>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-3-linux@fw-web.de>
 <32201aec-f3d2-49a7-b0ca-2ede10fec103@wanadoo.fr>
Message-ID: <598f595589d061bf314d942095cd5dc6@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mail-ID: f7caaa60-9ba2-4071-927a-9434349a1399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004403_550972_20D1F40E 
X-CRM114-Status: GOOD (  11.25  )
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

Am 2024-12-10 19:45, schrieb Christophe JAILLET:
> Le 02/12/2024 à 12:00, Frank Wunderlich a écrit :
>> From: Daniel Golle <daniel@makrotopia.org>
>> 
>> Add pinctrl driver for the MediaTek MT7988 SoC.
>> 
>> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>> [correctly initialise for the function_desc structure]
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> 
>> ---
> 
> ...
> 
>> +/* flash */
>> +static int mt7988_snfi_pins[] = { 22, 23, 24, 25, 26, 27 };
>> +static int mt7988_snfi_funcs[] = { 2, 2, 2, 2, 2, 2 };
>> +
>> +static int mt7988_emmc_45_pins[] = {
>> +	21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
>> +};
>> +static int mt7988_emmc_45_funcs[] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 
>> };
>> +
>> +static int mt7988_sdcard_pins[] = { 32, 33, 34, 35, 36, 37 };
>> +static int mt7988_sdcard_funcs[] = { 5, 5, 5, 5, 5, 5 };
>> +
>> +static int mt7988_emmc_51_pins[] = { 38, 39, 40, 41, 42, 43,
>> +				     44, 45, 46, 47, 48, 49 };
>> +static int mt7988_emmc_51_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
>> 1, 1 };
> 
> At least all the _pins arrays could be const.
> Maybe we could also make it possible to have _funcs const as well.
> 
> ...
> 
>> +static struct mtk_pin_soc mt7988_data = {
> 
> const?

can do, but for funcs i see no clear way

angelo, can i keep the RB, when changing pins/mtk_pin_soc to const 
(without changing macro in drivers/pinctrl/mediatek/pinctrl-moore.h)?

>> +	.reg_cal = mt7988_reg_cals,
>> +	.pins = mt7988_pins,
>> +	.npins = ARRAY_SIZE(mt7988_pins),
>> +	.grps = mt7988_groups,
>> +	.ngrps = ARRAY_SIZE(mt7988_groups),
>> +	.funcs = mt7988_functions,
>> +	.nfuncs = ARRAY_SIZE(mt7988_functions),
>> +	.eint_hw = &mt7988_eint_hw,
>> +	.gpio_m = 0,
>> +	.ies_present = false,
>> +	.base_names = mt7988_pinctrl_register_base_names,
>> +	.nbase_names = ARRAY_SIZE(mt7988_pinctrl_register_base_names),
>> +	.bias_disable_set = mtk_pinconf_bias_disable_set,
>> +	.bias_disable_get = mtk_pinconf_bias_disable_get,
>> +	.bias_set = mtk_pinconf_bias_set,
>> +	.bias_get = mtk_pinconf_bias_get,
>> +	.pull_type = mt7988_pull_type,
>> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
>> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
>> +	.drive_set = mtk_pinconf_drive_set_rev1,
>> +	.drive_get = mtk_pinconf_drive_get_rev1,
>> +	.adv_pull_get = mtk_pinconf_adv_pull_get,
>> +	.adv_pull_set = mtk_pinconf_adv_pull_set,
>> +};
> 
> ...
> 
> CJ

