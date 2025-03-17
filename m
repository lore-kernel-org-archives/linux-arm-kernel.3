Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F68C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juhBGFrnJEtXmwmWUkOgurD4ow1+cM0JUbcI3gD4F48=; b=HFXIHoQIZlhDIyDPeSdDTc1qHM
	N/BmftRNgYaBR8mSDcfvMi/1fXAyk8jOZProT7kU8A0H7zud6BuxZ96LWEVNDOclkimfVMG6pT4C7
	GwfEXEiuDLEXLJAlwMnbQTLq4ynuxtG2TU/42DcSBgnhiMOGWmbrM3hx4UslSWv1nmLiry2mfvnng
	KhYFnfXCTEBerWIkc0Ihhe0tc7nCctSezd+EhE7WwHaXQMHPaVE6qwiCbu29HCZSYn5VDwCl53sUF
	4vQm4eILt1JTKtwJ0H45L+pjeaQEbSou1DjIm0AF7jHiol/b4YGTWub83nr0V2TDFKPoe/qk0D9Ac
	vvHvEcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBkh-000000031az-1mbk;
	Mon, 17 Mar 2025 14:47:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBV4-00000002xjs-0Vtj;
	Mon, 17 Mar 2025 14:31:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742221868; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BJpEgdkNOnSiwPrSUBLBl5lYM+9hFEOctSz9K9PKKQtT5xnLZulbT4jKlx5w5CyrA7bRjPfUchYlYQNkDIwJ3I8ppedq7Dv1VUg5TyTlG2+HY/vwjLnveGsb3+E7+EoKkbk06OmOsrqbOGSgrmMMWNGes0MRf19ZxaeGjSmMx2U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742221868; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=juhBGFrnJEtXmwmWUkOgurD4ow1+cM0JUbcI3gD4F48=; 
	b=ecgMK9cayVciXKLAu5E0ZSdMZjVvZf7lm927GcnIz1VU3UBjjcCpsJr6CrO7K2f9wtg5uRocgz3DxeRYM18tgoBdiZTywAnL0hqyXDt7roYcgzXKcBYO7FVAEnXnxnPBUWt3hueS0tglURSEXOwtsGM2mod3r3cMkKSr9mVwDrU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742221868;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=juhBGFrnJEtXmwmWUkOgurD4ow1+cM0JUbcI3gD4F48=;
	b=CiAXpq8Nrl/AHbcs52PL//215ZsdMXGiJpd1bLL0pvgHIbsjUTw4dPW6Xg9FdhHh
	VyKaKpzY/kQP6q94ru+oCbZfFGzK9UMFu98OW0CsHa8T49RsZCBg6kxjO7W9/aGUXG1
	zrh0Fz3mtauDQ+mUb70hAcN9IV4RZYToVMNZEumQ=
Received: by mx.zohomail.com with SMTPS id 1742221866050461.80081265142326;
	Mon, 17 Mar 2025 07:31:06 -0700 (PDT)
Message-ID: <992360e3-632c-4a0e-bb84-a72be7d7cd37@collabora.com>
Date: Mon, 17 Mar 2025 11:30:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
References: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
 <20250317124044.16257-5-ariel.dalessandro@collabora.com>
 <20250317144436.2bcc17ed@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250317144436.2bcc17ed@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_073130_224941_8C3C1860 
X-CRM114-Status: GOOD (  10.03  )
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

Boris,

On 3/17/25 10:44 AM, Boris Brezillon wrote:
> On Mon, 17 Mar 2025 09:40:42 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> +static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
>> +				  enum io_pgtable_fmt fmt)
>> +{
>> +	struct panfrost_device *pfdev = mmu->pfdev;
>> +
>> +	switch (fmt) {
>> +	case ARM_64_LPAE_S1:
>> +		return mmu_cfg_init_aarch64_4k(mmu);
>> +	case ARM_MALI_LPAE:
>> +		return mmu_cfg_init_mali_lpae(mmu);
>> +	default:
>> +		/* This should never happen */
>> +		return drm_WARN_ON(pfdev->ddev, -EINVAL);
> 
> This won't return -EINVAL, but !!(-EINVAL), AKA true. We should do
> 
> 	default:
> 		drm_WARN(ptdev->ddev, "Invalid pgtable format");
> 		return -EINVAL;
> 
> instead.

Ah, good catch. I missed that from the WARN_ON definition:

         int __ret_warn_on = !!(condition);

Thanks, will fix in v4.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


