Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF7FFD3758
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyWJXR9Z/xFegGs944ugKPX1170B0Wc7rBrXRrtZGqA=; b=oxv+Hqz3aIRaLDkRUn4uuHS42Y
	sDCuKWb2TF2NWr8vijZAeNiL7jzTgOVWVfWs4UsUMVk7PcxQEiyGezfVElZ93ePAp0qMIsYII1Uyx
	6hrVhLtjqHifpUdPUaltqO57/TbBH+SQgJBe5Lwx6IpRivX9CMuFNdMrke2I1kdqj4uX3RdbXQykZ
	zHazhMgAI3B5k+9ivuDKqX7N1yXXPnqK/dRPog46eJqJyDERBdGmi9Yd1aOI66DdhYLgMKZx1TbwZ
	5mnuSHmbZsDXdSLK653M5mfFg6e/usDeBZ5MEVEmOo5byFL9IzVxSFg9rhZBSYaN5tlLtvsTldCO9
	BqpziIGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvE96-000000040rr-1McG;
	Wed, 25 Feb 2026 12:37:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvE94-000000040rR-09TW;
	Wed, 25 Feb 2026 12:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772023055;
	bh=bZmckL3Yy8Teh5h9dCs5VOGu35lRyyRphjRBHRpxOD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jbVLFS2MsxEpQj+caszgA5d0ZbkwnS2Zr/hl9FkzC6cS4XZXj3onpz4CU7rPdQVKc
	 2iXclG/fHvfgyBQ0RVuylUQXOfKwjb84ZHaCaQPwxxoxfs874/cmZqnUsVJsVDjUEZ
	 RYspmveWD0K2HGdfJ0VxLxU8TaCpbfaZZpX6cYdDJIf41/V+5TXyVtDWno/uaBFb76
	 MR6b4vof+Kn015TGbuWZ4AbvCLprACkh30T66pjYS7LdmIACy90PjA30DcGBQY0yrk
	 pvZXuR7NH1VX3q6FIgpBhmC71XuB7H+6ZZRWSRrQifKRXEq4J5uEUkWOBQ79s3Irqy
	 dD9PMWFMjXkIw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 47CA017E012E;
	Wed, 25 Feb 2026 13:37:34 +0100 (CET)
Message-ID: <edf07a47-77be-4acc-8825-b14a5d1838df@collabora.com>
Date: Wed, 25 Feb 2026 13:37:33 +0100
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
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <010d77378b9cca477439b92d92c8f5bfb2d4df65.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_043738_225107_04961189 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Il 25/02/26 11:34, Peter Wang (王信友) ha scritto:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
>> @@ -519,15 +519,13 @@ static void ufs_mtk_boost_crypt(struct ufs_hba
>> *hba, bool boost)
>>   {
>>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>>   	struct ufs_mtk_crypt_cfg *cfg;
>> -	struct regulator *reg;
>>   	int volt, ret;
>>   
>> -	if (!ufs_mtk_is_boost_crypt_enabled(hba))
>> +	if (!ufs_mtk_is_boost_crypt_enabled(hba) || !host-
>>> reg_vcore)
>>   		return;
> 
> If host->reg_vcore is NULL,
> should ufs_mtk_is_boost_crypt_enabled be false?
> So we don’t need to check both, right?

We need to check both because UFS_MTK_CAP_BOOST_CRYPT_ENGINE depends on:
  1. reg_vcore
  2. clocks (crypt_mux, crypt_lp, crypt_perf).

Failing to check for both ufs_mtk_is_boost_crypt_enabled() and reg_vcore here
will introduce a bug that may result in storage corruption.

So yes, Nicolas is checking both because it is *required* to check both.

Regards,
Angelo

