Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDEE9B25F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJPzhmWuEkuxziwHR8fY73TMQmG0YNy15OgEFbsUKvs=; b=K8VSxTSRQ/zqV7+U8lApZJRw7S
	7UuKumYo5TAU5YJxXL4Z7uT86Gp8Dfe9p1OERHqtR09t8cMt9SKbiuZ6h5ODC4iBEKuUwlDJnPYG2
	/Srs6prnG59Y3Ww5o9z+/iupp4Dm6uQ5kfTx87snYhLX/8hlxC5KEIZpwdmh/40mlZeD+O6c56vJE
	HGTMtZpghdRuKCv+icl0W76EMbyRzNlFGK7FY1zhRamqQD8CHGNc8plbDK8j2ikk4e8os1zCH1Sk2
	asorolmHUq5Gih84aiM1Xsku7wUbqQw6gs5Omwwu8vPNPR20Sj9KuexBmtjIs2rjUA69uz4CUXIgy
	VyM3GgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurjh-000000024AF-0Hz2;
	Tue, 24 Feb 2026 12:41:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurje-00000002493-47OL;
	Tue, 24 Feb 2026 12:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771936912;
	bh=frB8S6YZv/co/jpO+5WGrKt5NldRYnBoH/LpqHatns4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hofm1FmknMdxMcYB2Z9ugTxcQrVBLUQ58wZjxd6lEJIY0Boufzx4xMv4R8B9QniKX
	 xUO2t55T1YHIicluD5f6tlcEch2cxVBzHYJ0yWpYWdvg9paQFmi6nptrAoOKpNoYT6
	 YmYULapPXMJfwekKZWfPwYYNdfLOzqI42ZqNyG67I0VyOddjJf3eOQXVrUGsJFamEN
	 LLWBBVeSkvUxguMDWCs/1LuEev+Bmjw+zIXTQT1OwP89ubC5BQe6utspBMEn9xlG7/
	 ebFtKS6XI5jWeiIbljCQx8CjAwNc5qYAz738Gg8cK/hlmVrWx4T/qNh+IEYhr3BbG6
	 FJoruteFLdhOA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52F4A17E06CA;
	Tue, 24 Feb 2026 13:41:51 +0100 (CET)
Message-ID: <24445e6d-c308-4df2-8b3e-7ee8a8e3f2fe@collabora.com>
Date: Tue, 24 Feb 2026 13:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/23] scsi: ufs: mediatek: Handle misc host voltage
 regulators
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
 <20260216-mt8196-ufs-v7-10-b5f2907c6da7@collabora.com>
 <2c7c84a2df19624ba9f207fd3fee47a8bdd9d8dc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2c7c84a2df19624ba9f207fd3fee47a8bdd9d8dc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_044155_163469_0C0B1507 
X-CRM114-Status: GOOD (  12.00  )
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

Il 24/02/26 13:38, Peter Wang (王信友) ha scritto:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
>> @@ -1188,8 +1190,21 @@ static int ufs_mtk_get_supplies(struct
>> ufs_mtk_host *host)
>>   {
>>   	struct device *dev = host->hba->dev;
>>   	const struct ufs_mtk_soc_data *data =
>> of_device_get_match_data(dev);
>> +	int ret;
>> +
>> +	if (!data)
>> +		return 0;
>> +
>> +	if (data->num_reg_names) {
>> +		ret = devm_regulator_bulk_get_enable(dev, data-
>>> num_reg_names,
>> +						     data-
>>> reg_names);
> 
> Hi Nicolas,
> 
> If these regulators are only acquired and enabled once,
> why not just set regulator-always-on in the device tree?
> 

Because:
  1. The UFS driver has to acquire the correct supplies regardless of them
     being on, guaranteeing both a readable power tree (sysfs/debugfs) and
     a correct hardware description in devicetree.
  2. A future update might get those regulators disabled during deep sleep

Regards,
Angelo

> Thanks
> Peter
> 


