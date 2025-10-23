Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE15CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVDEM4oD9jX0d+ROBJ3prXRtO6D5OWGJxHZZT3Buk38=; b=CA6j3GDSqOe9mVfrN/PuOzERcM
	Vl0upJl/tb4LzDZW8ghUM+Eqx9LPdamtO17Td5g4kt0VIpTDtczOLGase3la9S8nz3bIge+ABU2vz
	/8Dn84lLBRCR2j2k5jUCuft59i+u6s8uff6wRY5ixYtyqfWxZjEf81KgDjOvTiPO6YKTpwDHO9Kwl
	HFg8hV0I1A1U3XpzZZ9BggxhP66QD+885QPyCXN0hnegCz6dqk6J8WBGcM8wAfZS6Uh4X6eg6JjmR
	JYRy2hlj8oTlDcQVjJUXmtow0ets/BOgPSi0eODR0aehRcpaj8/8PmyBe7BuW6Fw6Rz5yZInOOchn
	qUgRnxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsD1-00000005p85-0nOv;
	Thu, 23 Oct 2025 10:06:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBsCz-00000005p7V-1Dv2;
	Thu, 23 Oct 2025 10:06:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761213959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OLK072fVQUm6uoyWmfSIvM7Gj2Plzm1vwQw3XoZ/InQPjlVp1Z/wQJJCUffCt5SKo2J5IqyXiun/m0UgmZPGudqubUvjkrEicAUbIt6C1AVJEE9rxrcZsrCOcDZndyvMbTK9M43IOOxu3TfHb0P4D0M/zxa8It48BDGlQj9bgDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761213959; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MVDEM4oD9jX0d+ROBJ3prXRtO6D5OWGJxHZZT3Buk38=; 
	b=n6sbHRfdYDRZpJ5gR7ftbntFW5AnxsqJUmn/n1mrafkz4TWKDPfAuC5PSzrV3hXk9maWGdB21sW5TUx2Wu+JVCQhLLMovvTjxswpgSph96gFhLa6vMDdUAEoSR7I794DDtsyJJ2NmrkFmrefRcNEXt3SKbCNlJBHfVvMJcoD9uQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761213959;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MVDEM4oD9jX0d+ROBJ3prXRtO6D5OWGJxHZZT3Buk38=;
	b=OCUWIGcyWmrXejR9OAxxkrU1SvAfqTyolX19MGbGBuFk45ewELOkHo/86QNMtlnb
	xcGpL6V9ttgJ88u0+ZVpZotdaw8KdWDI7Od+UTTGxLJ7GsE7ItqxtpDnWxrI6hfhBl3
	IXrOKXratDXejg44wig9LtpjiG6KRBdhgG06h31I=
Received: by mx.zohomail.com with SMTPS id 1761213957436587.1983409307098;
	Thu, 23 Oct 2025 03:05:57 -0700 (PDT)
Message-ID: <3bc33fe2-5a6e-4f7b-a925-6fc72625a8c7@collabora.com>
Date: Thu, 23 Oct 2025 13:05:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
 <b25aa269-6dc8-43d4-a3f3-85691ace134e@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <b25aa269-6dc8-43d4-a3f3-85691ace134e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_030613_509754_E969AF75 
X-CRM114-Status: UNSURE (   8.58  )
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

On 10/23/25 11:42, Cristian Ciocaltea wrote:
> On 10/22/25 7:19 PM, Dmitry Osipenko wrote:
>> Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
>> is backed by a virtual device that isn't IOMMU-capable, while VOP is the
>> actual display controller device backed by IOMMU. Fixes "swiotlb buffer
>> is full" warning messages originated from GEM prime code paths.
>>
>> Note, that backporting is non-trivial as this depends on 143ec8d3f9396
>> ("drm/prime: Support dedicated DMA device for dma-buf imports"), which
>> landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
>> initialisation"), which landed in v5.19.
>>
>> Reported-by: Daniel Stone <daniels@collabora.com>
>> Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
>> Cc: stable@vger.kernel.org # v6.16+
>> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
> 
> With the patch applied I'm not able to fire those warnings anymore - tested on
> my ROCK 5B (RK3588) and ROCK 4D (RK3576) boards.  Hence you may add:
> 
> Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

More testing is good, thanks.

Forgot to mention I'm myself tested on 5b/3588 and 4c/3399.

-- 
Best regards,
Dmitry

