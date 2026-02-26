Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A98FC5927
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Acs4mdWOeu0RVlYgoszzz099Xsw0LTZEFLKS3hlerbs=; b=njeYs36AZjfftWG32LXOK0W8Pb
	D+PIJjpedDJReQWqA9oLbQ689Q6pldwhG0lq4hmEarKpT0y5RSrkXBdiRpxqvmTxUagqueZboBQ7U
	vLGqPb1rrDDf55nF4ZxEJeq5rIApTbZidvg+zIEM2yLXuNCUiUvEk96XkZHqCBGTJ5QuDm3xqhdz4
	+A5WZO8eyLe16oxF5sf6ZcBISBkE8SdNYZj6rY/ef1thU/RiHyPrEov6XxHwL+Exa/PlACdxUCxzp
	pFA1pGtXLL6ip6bqJveBb8/6U63oSvKaiYKopiYLYBG8ycKX9Bs4xrus592yq3TBF0K9BFRfMIqQV
	a1VjfzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYgZ-00000005vwt-135c;
	Thu, 26 Feb 2026 10:33:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYgW-00000005vwK-2aTO;
	Thu, 26 Feb 2026 10:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102009;
	bh=jdsbqMmee99OyhJwJac7k9/iwfoy7HEhr67oW7RcG5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PRHn6pu+LYe1i99VPr8a907RdPH5EhiuOOyQtA7a/NK/fnXla5CncaTSQKWOpYLQR
	 yLbX7w4Xe9MowggMHpLaITfeEpI+vsE0HWZUuixZchr0IlNWYy621A3ihrW9g7yvLE
	 CnJT3vghjIDsu/lmOBoB0OPGCB6zUTciwjtb27n7mBeY/enrvY4dfDucHEFtrbW+AX
	 c11jnZBAwJk2LQgPKxdFbQoEgV4ItyB2JHLJV9tLiX8kXhxpE9C1t/c9gxnUROXJqf
	 narGfuanBg48j2NvI4RInpxAiTp4PPsU2ExWCANyvvLuSv1UNVQEHNyJMV2QQ+JKGm
	 48XTfhIxKJXcw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB06017E0097;
	Thu, 26 Feb 2026 11:33:28 +0100 (CET)
Message-ID: <20e7b970-df30-455e-8067-128de2dca022@collabora.com>
Date: Thu, 26 Feb 2026 11:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/23] scsi: ufs: mediatek: Don't acquire dvfsrc-vcore
 twice
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-18-b5f2907c6da7@collabora.com>
 <010d77378b9cca477439b92d92c8f5bfb2d4df65.camel@mediatek.com>
 <edf07a47-77be-4acc-8825-b14a5d1838df@collabora.com>
 <c7214effa728b74e753abc0dee8d655e036ca7fb.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c7214effa728b74e753abc0dee8d655e036ca7fb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023332_801077_C88530F0 
X-CRM114-Status: GOOD (  13.84  )
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

Il 26/02/26 04:45, Peter Wang (王信友) ha scritto:
> On Wed, 2026-02-25 at 13:37 +0100, AngeloGioacchino Del Regno wrote:
>> We need to check both because UFS_MTK_CAP_BOOST_CRYPT_ENGINE depends
>> on:
>>    1. reg_vcore
>>    2. clocks (crypt_mux, crypt_lp, crypt_perf).
>>
>> Failing to check for both ufs_mtk_is_boost_crypt_enabled() and
>> reg_vcore here
>> will introduce a bug that may result in storage corruption.
>>
>> So yes, Nicolas is checking both because it is *required* to check
>> both.
>>
>> Regards,
>> Angelo
> 
> Hi AngeloGioacchino,
> 
> To clarify, BCE stands for UFS_MTK_CAP_BOOST_CRYPT_ENGINE.
> 
> BCE     reg_vcore   Action
> true	true	    If check is false, continue
> true	false	    This case cannot happen (X)
> false	true	    If check is true, return
> false	false	    If check is true, return
> Therefore, we only need to check whether BCE is
> true (to continue) or false (to return).
> 

Thanks for the information.

Now I agree. There's no need to check for that twice, as the cap is set
only when all clocks and when reg_vcore is not NULL - I missed the first
lines of the ufs_mtk_init_boost_crypt_function() from this patch, where
Nicolas is adding a check for that at the very beginning of this function.

This means that the UFS_MTK_CAP_BOOST_CRYPT_ENGINE flag is being set only
when all of the prerequisites (reg_vcore and clocks) are satisfied.

I agree with you, Peter, there's no need to check for both the vreg and
caps, as the cap can only be set if the vreg+clocks are present.

Nicolas, can you please fix that and send a v8 ASAP?

Thanks,
Angelo

> Thanks
> Peter



