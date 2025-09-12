Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053B6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVleiKu31pQJvOTx6DJtoA7EhwZMfzZz46Lx8F+cNfU=; b=zlz3fomI568BK1ZFKyK6GSBkUT
	nFpgkABeuhoV/EdGbRI312oqhRo8AdR6Lw+Z738jqSNIUCRQ494ZaVfmbwus3bHz+kMZvcfg1ytj1
	MYjJW/SwtcLU8jOnX1HDwD+cuq91Sggah6gfYlIEoNjNE4AKzawitKGg3SsQe6ajubVQSelU7Yz8H
	odVHNH4cy7ugx5Z9LL8Fx+0mIMNmu5i4aZLDZrMUWsNibWK3AOubP8BtYCuXjI++XWbwFTQiLVu2v
	mWWesC65NY8ie07laFfYQtLNse+ZabstKqyWRqqinCYMP5dweSU1JEMyj+3NMZ8fT0eBaaIeBHHFt
	ifKO3GeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxwB-00000007Zd3-3VgN;
	Fri, 12 Sep 2025 07:11:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwxw8-00000007ZaM-2Sic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:11:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45cb659e858so10953485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757661071; x=1758265871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GVleiKu31pQJvOTx6DJtoA7EhwZMfzZz46Lx8F+cNfU=;
        b=fVNqwM4sWHkgmws8Zzw9mNW+UJXGWoCwU25taci9+wsZ4Re6unZdw4TnK3jSg6WUyS
         QkdZzMEUnNGPzdBpM3yDOzDCdzIRZe3rnNdxSyoJAB4bNNQH7GpxN66zb6VqcRoKV1Qi
         ui4HaZ5fMRMlkblGWjI/Hsuf1qDOnq0z2F6ZdKcGWEcpooGutVQYKthIVs5AS+MusbmM
         pM6Es552rpTk4DWSYZzRKrAFP0WveuC3MhsM/+51LY8spE2xZNn2Eif49fPqO5ThY2WJ
         FS2xBm14wnrRFmS3MpWtfZUdXlnxz74Xqva+1wrgHnXyyqTZqqM5j+AUCr1YlK3QgCsU
         Dvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757661071; x=1758265871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVleiKu31pQJvOTx6DJtoA7EhwZMfzZz46Lx8F+cNfU=;
        b=InixEPgYZeQkrUwEnl9jYxuMjrha2/r+RQM44VmbGuA5C6y1DV9iwzfvokifsZ2lx3
         WnMDDdd4+/bBl3b+EF/OLK9UQ9w4BC8D84UxGmt1x/04MKsjRqGJpj2/I+lSlzOg1C90
         9OENI5JPm4wbNzdFWSc7VrG3U6dFnjKRwzmTLihaAf1KMDudnmxoUGEdnVBWUpG5YK8M
         9aJWGP82DmVbPkCKL1Oa+lUZAqN0bZz4A6wwoR/g/9wY0KPTa8t0LehqLRPQOrqTLRc9
         920q04WkXRH6ODo2eP+yc8Vj+FJsCGHCsBYH0/Vc82v5dCw/WGqy5BTU0wY+lQX8BIzX
         5kfw==
X-Forwarded-Encrypted: i=1; AJvYcCW0JY/m7ePR4OTgcHMDVnccrI7r/+kgjQNtOzz4r6DweWQA0c8mmmhIZxjeBkFR0zy1uYrhmKr906YdR692THQE@lists.infradead.org
X-Gm-Message-State: AOJu0YyKFC7yVtN+rekOhAIaHtf80S84DEjNXcGlnhvRE6/amm2+K7Le
	kpLHM+yJpFU+CTc/YN/g6QVjq80NPR0M2HW0QQoYLEkITImx9K8Hu/gT
X-Gm-Gg: ASbGnctypfiRJigB68nkVEvza+5aMW34lZXH7hU4Oxg4BUZx5NXs0tznuMNwVZjiM6b
	q4ZQyVew4HaNFDYKWB8W78gvJDgCtlUnA8MlnOdSGtcjjhjL97E/HJvk+nBJc3Y9ECebkdQvSqA
	8EBvNE8CuV0v65hUh0CH1Cp+DYWte9H1nABfNrdQTvOE5Dnu9m0eYjBacO8zWM8pIA4wxkwAZ4X
	tOAHUMdSwgVcJaPV5f0Hl0F2vX4ky/Pcy9jj+5gGOC4D1h3cTFB7Ule//P22XcfnaSVTUXdv6gz
	tWt6OvF++R0d6DIAYs20FslQADwjsB0ueZcCVWCkxPfSi4tNVzQbA7uEywypPsn/B4VZm5LGp5j
	ThSIBxuoMY7Z3X4tLwtsoXYWz51WPlJI=
X-Google-Smtp-Source: AGHT+IEoE/7nP686w6pk3SeRkMQfgKpBqRUP21YfwjuJ6c+2hOcRGVGk2JFzUaMxoEIJyRYjgGXiyA==
X-Received: by 2002:a05:600c:19c9:b0:45d:d291:5dc1 with SMTP id 5b1f17b1804b1-45f211da6aamr17769535e9.15.1757661070482;
        Fri, 12 Sep 2025 00:11:10 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d75a0sm5471643f8f.44.2025.09.12.00.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:11:09 -0700 (PDT)
Message-ID: <6037201a-a13f-4a3d-9377-3f9f91e78773@gmail.com>
Date: Fri, 12 Sep 2025 09:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] MediaTek ARM64 DTS updates for v6.18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <46756067-ca2f-4053-b9e9-bc6e66170b21@gmail.com>
 <CAGXv+5F=uPnzrpDtPXc2ipwp5AhiEwGdxhuhPtjwWhAxWJMc_Q@mail.gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <CAGXv+5F=uPnzrpDtPXc2ipwp5AhiEwGdxhuhPtjwWhAxWJMc_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_001112_670148_2519F6EC 
X-CRM114-Status: GOOD (  20.13  )
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



On 11/09/2025 07:23, Chen-Yu Tsai wrote:
> Hi,
> 
> On Wed, Sep 10, 2025 at 11:04 PM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Arnd,
>>
>> can you please have a look on the following patches.
>>
>> Thanks a lot,
>> Matthias
> 
> I still have some patches outstanding for some time. Could you perhaps
> take them as well?
> 
> [PATCH v2 2/2] arm64: dts: mediatek: mt8188: Change efuse fallback
> compatible to mt8186
> https://lore.kernel.org/all/20250610063431.2955757-3-wenst@chromium.org/

Queued now for a possible 2nd pull request.

> 
> [PATCH] arm64: dts: mediatek: mt8186-tentacruel: Fix touchscreen model
> https://lore.kernel.org/all/20250812090135.3310374-1-wenst@chromium.org/

Queued now for a possible 2nd pull request.

> 
> [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
> https://lore.kernel.org/all/20250814092510.211672-1-wenst@chromium.org/
> 

Queued now for a possible 2nd pull request.

Thanks for the heads up!
Matthias

> 
> Thanks
> ChenYu
> 
>> ---
>> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
>>
>>     Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>>
>> are available in the Git repository at:
>>
>>     https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/
>> tags/v6.17-next-dts64
>>
>> for you to fetch changes up to 12a565af705542c4380e95f4e3a505a2c25ad754:
>>
>>     dt-bindings: arm: mediatek: Add grinn,genio-510-sbc (2025-09-10 11:51:16 +0200)
>>
>> ----------------------------------------------------------------
>> mt7988 (bpi r4):
>> * enable network
>>
>> mt7986:
>> * add dedicated sram node
>> * add interrupts for RSS to ethernet
>>
>> mt7981:
>> * add thermal sensor and auxadc nodes
>>
>> mt8395 (NIO 12L):
>> * enable UFS
>> * add gpio keys to the PMIC
>>
>> mt8195:
>> * drop reset for PCIe device
>>
>> ----------------------------------------------------------------
>> Aleksander Jan Bajkowski (1):
>>         arm64: dts: mediatek: add thermal sensor support on mt7981
>>
>> Frank Wunderlich (7):
>>         arm64: dts: mediatek: mt7986: add sram node
>>         arm64: dts: mediatek: mt7986: add interrupts for RSS and interrupt names
>>         arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>>         arm64: dts: mediatek: mt7988: add switch node
>>         arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethernet
>>         arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and link to gmac
>>         arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phys and leds
>>
>> Guoqing Jiang (1):
>>         arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie0
>>
>> Julien Massot (2):
>>         arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
>>         arm64: dts: mediatek: mt8395-nio-12l: add PMIC and GPIO keys support
>>
>> Mateusz Koza (2):
>>         dt-bindings: arm: mediatek: Add grinn,genio-700-sbc
>>         dt-bindings: arm: mediatek: Add grinn,genio-510-sbc
>>
>> Rob Herring (Arm) (1):
>>         arm64: dts: mediatek: mt8183: Fix out of range pull values
>>
>>    .../devicetree/bindings/arm/mediatek.yaml          |   2 +
>>    arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  31 ++-
>>    arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |  20 +-
>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |  11 +
>>    .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  19 ++
>>    .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  86 +++++++
>>    arch/arm64/boot/dts/mediatek/mt7988a.dtsi          | 285 ++++++++++++++++++++-
>>    arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |  14 +-
>>    arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |  14 +-
>>    arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   3 -
>>    .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  46 ++++
>>    11 files changed, 508 insertions(+), 23 deletions(-)
>>


