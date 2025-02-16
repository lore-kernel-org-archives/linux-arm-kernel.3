Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86132C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 10:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UDdI7fW/FRxm0SJsuY4wz4Lj3XvYXPcwSHR/kIT/08=; b=ByAxYkbKVrLNvH23q6AlnjnO95
	iSdm7+91Nz7lmUXhsZsU6654PLlbCZyJKagrS/6Kt/NPRfK/bwpl0HKpzZHpQVdFt/Hvazs6D8BSg
	pGP8iD6lFmUUPHQJRkh+vGqEiIRKZpRLBv9ARfNnGp18ojfneLBT6uZmdZseeMvCFyZCJRMdsc9fj
	36XV+y05I9ZChV21auKAcqoJFqHTMo+5AKFFYRjkqHWKuJ0IZEGojuwGngtoYauLT/7UzSvl0kCwC
	jmjBxr1zgZuEGoSKvK178OW9NlW0YpWmY/1b6IRl7kIj2Jy2k6IGTWvzZn2tcr+c41dgU0cfjBr7j
	LKqFafJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbtj-00000001e4K-0RWO;
	Sun, 16 Feb 2025 10:29:15 +0000
Received: from [2a0b:5c81:1c1::37] (helo=lahtoruutu.iki.fi)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbsH-00000001drF-2NVD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 10:27:47 +0000
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Ywhmz4Kyhz49Pwk;
	Sun, 16 Feb 2025 12:27:31 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1739701653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UDdI7fW/FRxm0SJsuY4wz4Lj3XvYXPcwSHR/kIT/08=;
	b=K+An97/rQeUnbTmrWPrvvfYWYEb0ba6S0P++RyswK5SuQfvgm3ptDEKeMwntqCAuCHjpEl
	U17q8hUo8bRKpnVdbJqr+t3yq76iR+EpSg2kk0kEnbb4DM1gYLd+lRWs3ssHf7pUa+mQPT
	xndl+4EeWuMmGCLN41AIzujd2Ds0DaSwvJG1Qk89L3TATKXW17W6NqGCsX/exoA+37rbgg
	v4DiGTVcaDbqW36C/fBL0V31iCP98EESFsRzL/7g1ubE3ZQIstdC/9o42TIFbEd4cETOUQ
	LTHyNXFiZXXdD/8d8GdF7cU7MzzF9ufSdxqpaXlzMd4kTcWEnuQRwWHZOmL5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1739701653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8UDdI7fW/FRxm0SJsuY4wz4Lj3XvYXPcwSHR/kIT/08=;
	b=VJOMQUOJqf5983pAmXgu3K/uH+noiSsRM2knVL/ON9EbWzS6A6hSQgNFK7l8e9+dvostFq
	EPmfj7+Mz3OP+2dRWdfP3h0wcqqyXBPuq2w62LRQrFx4EKiGgVHcV290GYmPwsR1m/b+yJ
	WAYgeO+of8dZ6Qc1ad5OwkFfdIdM79QQgSJGg+M/6JyD0kQ7ZiUtEs0Aw66WYiVUpolagY
	TTrtRS5YCTrygiy3u9EhqEBWqc/dUbNglQsGvfTU/QGSyy8s506Dkffx/zFvGdH8R+m2uV
	fylchr+47fBYNb72TEVe3fLxEaMTsBszCvph+JuHlsOSCMfwWP5hEUsrR/fjnQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1739701653; a=rsa-sha256;
	cv=none;
	b=ZBJ56CB07Z+z1S8bIb+4rr4vRBy8w5OVBoISiy3QMAVjzbBtBLc5Y1soyYHWX8fOb6mCdY
	jbiZ5urA6n9O3nnnQGXoNeLv8TR3PTkyEQA4rh0DZOZ3v0PQgKLzTOiThP7zB3sZ+nCeYk
	Xa4cFZEijGV377BvPEslHroBqWnxDMsTLaqGhdsWkl3XJdX9Gr63F4Zq5WRHkjYKhUkJV8
	KyZCnWKQsA2yN8oIm5dk2UP4KgYwtRJMG3Xq8f8MPnzc1zwww/bql+32zYq+jDnDRQUKFC
	OLlM+FWzb9oIH6DLu6045YxYhnmbdl58TNcn/MbSxONjf06B1bw5MTRzyNAu/Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 35F8A634C93;
	Sun, 16 Feb 2025 12:27:30 +0200 (EET)
Date: Sun, 16 Feb 2025 10:27:30 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sicelo <absicsz@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org, will@kernel.org, mchehab@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org, hns@goldelico.com,
	b-padhi@ti.com, andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: omap3isp: Handle ARM dma_iommu_mapping
Message-ID: <Z7G9kkYgvWQu2xPa@valkosipuli.retiisi.eu>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
 <Z7A61N13dZpu53xI@tp440p.steeds.sam>
 <20250215194328.GF12632@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215194328.GF12632@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_022745_783145_06D579E1 
X-CRM114-Status: GOOD (  30.47  )
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

Hi Laurent, others,

On Sat, Feb 15, 2025 at 09:43:28PM +0200, Laurent Pinchart wrote:
> CC'ing Sakari.
> 
> Sakari, would you pick this patch ?

Thanks! I wonder what happened -- it wasn't visible in Linuxtv.org
Patchwork but could be found via the message id.

It's in my tree now.

> 
> On Sat, Feb 15, 2025 at 08:57:24AM +0200, Sicelo wrote:
> > On Mon, Oct 28, 2024 at 05:58:36PM +0000, Robin Murphy wrote:
> > > It's no longer practical for the OMAP IOMMU driver to trick
> > > arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> > > same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> > > the arch code's dma_iommu_mapping out of the way to avoid problems.
> > > 
> > > Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >  drivers/media/platform/ti/omap3isp/isp.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> > > index 91101ba88ef0..b2210841a320 100644
> > > --- a/drivers/media/platform/ti/omap3isp/isp.c
> > > +++ b/drivers/media/platform/ti/omap3isp/isp.c
> > > @@ -1961,6 +1961,13 @@ static int isp_attach_iommu(struct isp_device *isp)
> > >  	struct dma_iommu_mapping *mapping;
> > >  	int ret;
> > >  
> > > +	/* We always want to replace any default mapping from the arch code */
> > > +	mapping = to_dma_iommu_mapping(isp->dev);
> > > +	if (mapping) {
> > > +		arm_iommu_detach_device(isp->dev);
> > > +		arm_iommu_release_mapping(mapping);
> > > +	}
> > > +
> > >  	/*
> > >  	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
> > >  	 * VAs. This will allocate a corresponding IOMMU domain.
> > > -- 
> > > 2.39.2.101.g768bb238c484.dirty
> > > 
> > 
> > I have finally found time to test this patch on the Nokia N900 and can
> > confirm it is working fine.
> > 
> > I was wondering - is there a reason that it is not merged yet? I tested
> > on 6.14-rc2, which did not have it, and notice it is also not in
> > linux-next.
> > 
> > If it helps:
> > 
> > Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> 

-- 
Regards,

Sakari Ailus

