Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8ABC36007
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTVoLyGgbdmzjrUE8T6GsZDPitalOn1Yi5lAm2rNLKM=; b=VU7E27Qt0sJiGSjBOSfjYfcrrf
	EjLFiicAoSheri/5E6hr4eO8DrG2i90jWqaC+tevlvmCJEHfkrF7/DI9ho1Zq4HAEXwru10RAB2Zz
	m7MzB1eRXG5UfPi/qOHEsDh9Hkhxwl0DMX0jKgABjDDJZRWzcFylk4Ri8ebp7f9GJ1Q8SPDPQU7ai
	8j1/N2nVNppDE+IpDEkhCnk8Dfamz4z4weGmLVldf/HUqdFwAdGOb7VeraHhATd6U0jLF0xDhZ3DL
	JmLGpsdAi3XlRw7xvrUYBjA390oycm7yMJEsgRT5jjUO0kBjhPGrCJV6M6Z+sUBK68BsCM9fBo03N
	Z2cdGxEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw3kg-00000000Bij-0BnS;
	Sat, 22 Mar 2025 18:39:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw3iz-00000000BZm-3Y0B;
	Sat, 22 Mar 2025 18:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742668645; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XyWN7OBjTEt5Kf6pHc3iqCwNHigU0MHqrbUxGIAfWBdarqVjgx8Xrg62yWTAJMvX2fy2PlKU1bqQMaGdR2PzEQZv1OFcPl2ZulEJ4rR/BmukUvxBI3oYOSef+F12hrl/KG7yS7fhZCpcrWOdYLSEkALO2UEym9+e4dMFAsEX9Qg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742668645; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WTVoLyGgbdmzjrUE8T6GsZDPitalOn1Yi5lAm2rNLKM=; 
	b=NGiLLNnXBjvzD/5K9hpWWxGHtM+95jCExdGFmPPZyJUbKLbo67ffGf0M6HfoepEwPHjWcBbBugemU0llRaGEq7+JC2IlwwKNBghor3Tyalav98CoNYuzt5Bwd5fYYArMOufBvZ656cfp+yQ3AEUbCO8ZAxAhzuQ+Nvws4hVnrDo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742668645;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=WTVoLyGgbdmzjrUE8T6GsZDPitalOn1Yi5lAm2rNLKM=;
	b=P78cOOK3yLrTakfL9AysUuqlYQIRr71SKVn8pAn/olUWqqBmU/Q7hC8WdsF3SPHk
	QdF230ZqN6rHDjktqqbWFM4+75eyj5Vfq3uQ+SW/h/OjrdwoOesZ8ZHNEMFnCu7uU5u
	15he9RGEwc1srHlluJffNiOWjoK360kz4VghNPOU=
Received: by mx.zohomail.com with SMTPS id 1742668644881646.2713412624316;
	Sat, 22 Mar 2025 11:37:24 -0700 (PDT)
Date: Sat, 22 Mar 2025 18:37:15 +0000
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 3/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature
 flag on Bifrost models
Message-ID: <rocdajh3msvq2mesaftg4garbdxl4qn77kxpqhwn4pv2wncc45@x7iejre6y3kb>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
 <20250317145245.910566-4-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317145245.910566-4-ariel.dalessandro@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_113737_948673_2CC6693E 
X-CRM114-Status: GOOD (  11.44  )
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

On 17.03.2025 11:52, Ariel D'Alessandro wrote:
> Set this feature flag on all Mali Bifrost platforms as the MMU supports
> AARCH64 4K page table format.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 7ed0cd3ea2d4c..52f9d69f6db9d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -54,6 +54,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>
>  #define hw_features_g72 (\
> @@ -64,6 +65,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>
>  #define hw_features_g51 hw_features_g72
> @@ -77,6 +79,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
>  	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>
>  #define hw_features_g76 (\
> --
> 2.47.2


Adrian Larumbe

