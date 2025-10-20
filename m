Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470D6CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/c/4oL8Z03NjnVaEgMnJiauD1mgyw2BMdnR11SbtOU=; b=Dlps9b7VL+Vbk24ch7mMixzyQ+
	CJ2kCXKZp935me6QU/EiqXu4EY9ezmPYQSPd2VxbyRW8wZRkj8vIVVnUmos6mDJVYpBlL4v43I7Jl
	CYhJyELEKHGNZpz9mteat3hPJT+6PBmtt4nK8+humyL/TaX/sfYZ1iCPYfw7EBiEOPK9gsoxxdQFc
	LssJheDMe7vG5RJrgs6f4ofRrE/wGUECgs3cO+5+kRvmDIT+hWoBZPgeXjMAaviXEG3cJtlqhOvhu
	6SBoothrgvIpB9y66NSyUIZOeWgWTPd9AjjM5BV6twSl2dgh+IgE0XTjbBQ4Tjc5utV5sX3TbB+nX
	Z6qUSAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoQ6-0000000D7xC-0TnB;
	Mon, 20 Oct 2025 11:51:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoQ3-0000000D7w1-2Oae;
	Mon, 20 Oct 2025 11:51:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760961056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C6s9lTyHmYNGClzUwi70t4LJADX3+pHHK1XyNHdHK8pkqZ0ewDbfJbwIXWji+uiKKcmUeuBW6l+zGWUuO+03pxUuW4fSbebuqG/S8KLJ5DCvdHU667ISmBHyMLGiEhevq79+UUaFc7vwqAm5S5mMXdCMvSHVgcf314a5waiB5NI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760961056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=A/c/4oL8Z03NjnVaEgMnJiauD1mgyw2BMdnR11SbtOU=; 
	b=iW82Q/ZctwRGQX/L9mOKuaimgoLOz0fVBR1M3TyCll3uEAfcdqH7w9UXuCqxDvtaM0ZJWtujTQtrBMFIsHz79mKsGlZlxVJUxxPgaOPiETDnmLnSSlwiQ6TTLdJq4ZGBBnB7YHbpk1mKNlRkRjCJStTnqRl8T1J3jkhSJ2wQsK0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760961056;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=A/c/4oL8Z03NjnVaEgMnJiauD1mgyw2BMdnR11SbtOU=;
	b=PaL/OAYlpW7pCWoX/nW8/r5Ars7ZMGegZ6sORd7Ra52eVXY8qtIgTV84a6OuCiti
	f1QFLSFukxd6rYxUkCCtp1sRRNyjyBoz59JCtIF/7UUcfAFVo1cFMZUeeejGOl4n1WW
	oo+B23a8e3D8+ZHnwIQTPwmfqEktI30JqVK/GOy4=
Received: by mx.zohomail.com with SMTPS id 1760961055618931.097867690532;
	Mon, 20 Oct 2025 04:50:55 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v8 4/5] drm/panthor: Use existing OPP table if present
Date: Mon, 20 Oct 2025 13:50:47 +0200
Message-ID: <12781303.O9o76ZdvQC@workhorse>
In-Reply-To: <386ca96d-34b6-4aab-844d-ea720099cf6b@arm.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
 <386ca96d-34b6-4aab-844d-ea720099cf6b@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_045119_645908_DDF47A13 
X-CRM114-Status: GOOD (  25.77  )
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

On Monday, 20 October 2025 10:35:04 Central European Summer Time Karunika Choo wrote:
> On 17/10/2025 16:31, Nicolas Frattaroli wrote:
> > On SoCs where the GPU's power-domain is in charge of setting performance
> > levels, the OPP table of the GPU node will have already been populated
> > during said power-domain's attach_dev operation.
> > 
> > To avoid initialising an OPP table twice, only set the OPP regulator and
> > the OPPs from DT if there's no OPP table present.
> > 
> > Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ++++++++++++++++++++++---------
> >  1 file changed, 23 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > index a6dca599f0a5..ec63e27f4883 100644
> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > @@ -141,6 +141,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> >  	struct thermal_cooling_device *cooling;
> >  	struct device *dev = ptdev->base.dev;
> >  	struct panthor_devfreq *pdevfreq;
> > +	struct opp_table *table;
> >  	struct dev_pm_opp *opp;
> >  	unsigned long cur_freq;
> >  	unsigned long freq = ULONG_MAX;
> > @@ -152,17 +153,30 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> >  
> >  	ptdev->devfreq = pdevfreq;
> >  
> > -	ret = devm_pm_opp_set_regulators(dev, reg_names);
> > -	if (ret && ret != -ENODEV) {
> > -		if (ret != -EPROBE_DEFER)
> > -			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> > -		return ret;
> > +	/*
> > +	 * The power domain associated with the GPU may have already added an
> > +	 * OPP table, complete with OPPs, as part of the platform bus
> > +	 * initialization. If this is the case, the power domain is in charge of
> > +	 * also controlling the performance, with a set_performance callback.
> > +	 * Only add a new OPP table from DT if there isn't such a table present
> > +	 * already.
> > +	 */
> > +	table = dev_pm_opp_get_opp_table(dev);
> > +	if (IS_ERR_OR_NULL(table)) {
> > +		ret = devm_pm_opp_set_regulators(dev, reg_names);
> > +		if (ret && ret != -ENODEV) {
> 
> Is there a reason to not fail on -ENODEV? I would assume it is a valid 
> failure path. 

Hi,

the -ENODEV logic wasn't added by me, it was added in
Commit: a8cb5ca53690 ("drm/panthor: skip regulator setup if no such prop")

with the justification

  The regulator is optional, skip the setup instead of returning an
  error if it is not present

I will not be changing anything about this logic in this patch set,
as it is not in scope for MT8196 enablement, since MT8196 does not
use this code path at all.

Kind regards,
Nicolas Frattaroli

> 
> Kind regards,
> Karunika Choo
> 
> > +			if (ret != -EPROBE_DEFER)
> > +				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> > +			return ret;
> > +		}
> > +
> > +		ret = devm_pm_opp_of_add_table(dev);
> > +		if (ret)
> > +			return ret;
> > +	} else {
> > +		dev_pm_opp_put_opp_table(table);
> >  	}
> >  
> > -	ret = devm_pm_opp_of_add_table(dev);
> > -	if (ret)
> > -		return ret;
> > -
> >  	spin_lock_init(&pdevfreq->lock);
> >  
> >  	panthor_devfreq_reset(pdevfreq);
> > 
> 
> 





