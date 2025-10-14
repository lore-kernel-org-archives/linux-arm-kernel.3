Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6E5CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6t5IZTCPtjGXDZ8O5vIPFfZSX3bj222TT23T+Zn8D0=; b=LlNGzgCz6iyakfCarKJM11LtVH
	lOjTSzuyJqDXFN/BQTaBDZ7ciiVCCEWPvhRuvjo6a+4N0seKBO5oRD8JZ9icVA1EUntGOCT3J7Gee
	xU1mp76ozU9/i3iuvMZdq+K8elGaPkDVod+7qrDpzrCD0V0tj2iTUmP6kq8zu2JQnpa8VPNteay8h
	SFP+XFjhYKQPsOKmnmuMfyCVeJteYLYLf91IgYJjBnX/8zHJU6mxLa3CV60v9GClnoKsyuac/wkjz
	R+NaC70syW43tU7BaJHPYpzGPtgh0IKt2iTcATA6LLDX5r9CvnDcbtFMdxryv5emrGrP9XxacPb7r
	sX29Dcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8boL-0000000Fqaj-2kMx;
	Tue, 14 Oct 2025 09:59:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8boJ-0000000FqXS-1tl8;
	Tue, 14 Oct 2025 09:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760435952;
	bh=RW9rDXZZTkBlQd1CX3NyCXi4d1HyJorh8kDyYsGTwnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DKxP0x3lFLMUJe9HY7f4ODu1k5SSB8FKbFPOGVemcQPAL3CtTFJkgsAd1lGyH3p63
	 xQTj9go7D7uuE46t5QxNGzCSmf0I7IEjboyBISp5li9Eq9Op6qEXpWlqScuEDripIM
	 uuSZMO8uc6A0oHfZ5VPfJtT4uJmQ1V5IT3qMKYIfXYwXp9iLewsGrAmixJTmVhpBJO
	 dgOBlgz8DwmAu3Qj9aayunm5X2u2V1M69TYaV6WHFAXfm0Q/2p7SsvI51z/tIiCDxG
	 4o4u9xoNW/zSFZaHp6Adc0ZcnmP6WPAJpf1KAW3C8gSToQZvgzTcwMajmkipcGA1/d
	 AYJR8scTTngnw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1801317E0125;
	Tue, 14 Oct 2025 11:59:12 +0200 (CEST)
Message-ID: <be3a2d50-044b-429a-820c-5260c6ce730c@collabora.com>
Date: Tue, 14 Oct 2025 11:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] pmdomain: mediatek: Refactor bus protection
 regmaps retrieval
To: Sjoerd Simons <sjoerd@collabora.com>, linux-mediatek@lists.infradead.org
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com,
 y.oudjana@protonmail.com, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, linux-pm@vger.kernel.org, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org,
 matthias.bgg@gmail.com, krzk+dt@kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
 <20250805074746.29457-5-angelogioacchino.delregno@collabora.com>
 <a2eae87efe46ebf397bcec3580eb9bc152b80846.camel@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a2eae87efe46ebf397bcec3580eb9bc152b80846.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_025915_818663_9021C5E1 
X-CRM114-Status: GOOD (  16.49  )
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

Il 13/10/25 15:41, Sjoerd Simons ha scritto:
> Hey,
> 
> On Tue, 2025-08-05 at 09:47 +0200, AngeloGioacchino Del Regno wrote:
>> In preparation to add support for new generation SoCs like MT8196,
>> MT6991 and other variants, which require to set bus protection on
>> different busses than the ones found on legacy chips, and to also
>> simplify and reduce memory footprint of this driver, refactor the
>> mechanism to retrieve and use the bus protection regmaps.
>>
>> This is done by removing the three pointers to struct regmap from
>> struct scpsys_domain (allocated for each power domain) and moving
>> them to the main struct scpsys (allocated per driver instance) as
>> an array of pointers to regmap named **bus_prot.
> 
> Trying to boot v6.18.0-rc1 on a Genio 700 EVK using the arm64 defconfig,
> ends up hanging at boot (seemingly when probing MTU3 and/or mmc, but that
> might be a red herring).
> 
> Either reverting this patch *or* having CONFIG_MTK_MMSYS builtin rather
> then a module seems to solve that.
> 

Thanks for the report.

This is not a problem with this patch specifically, but surely some race condition
that was already present before and that does get uncovered with this one in some
conditions.

Without the devicetree updates (which are not upstream yet) this patch is
fully retaining the legacy functionality 1-to-1.

I'll check what's going on ASAP.

Cheers,
Angelo

