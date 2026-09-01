Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C0BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 08:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+HrXbMbxa/Y02K3QZMbt843lXkhHRmzbDFOaV/a9gQ=; b=qU8ibAzZmTnkpk5/MyRryJoiKk
	v4IbdB0/hmfY1mVVUgOCW8z2bbRHv0ZfBu4Po1MSMbjDhh4lvjJW9NsGcIuXq2bjWjwEw6c9LDYSK
	Oi+eKW+w0PfJwl5RciHM3l1Gt3LhIcoJCnti+arnpWVBGBxbewiySm2MdbE30pS3rpsY6R5nAx85k
	TyHZI+nEjfBTHfLkuomw8MLSi1mIbM/uReYA9CggllGbzLxbvg55+6BtK7UfENsY/IBBME2b07ai+
	JEXv+YRo+RyYM4zwxX7CHLBKh9BaJKjmplbF3cXGhqPImx/2YmgN7UdnEsfWMboEvqzkOwDTXFgVs
	XlMtYblA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K9X-0000000BKcy-1H84;
	Tue, 01 Sep 2026 08:47:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K9U-0000000BKcQ-3fzi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 08:47:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-498012a61f6so34345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788252451; x=1788857251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k+HrXbMbxa/Y02K3QZMbt843lXkhHRmzbDFOaV/a9gQ=;
        b=cqgLt8VHA6qBDqVjDnNWIcktVir/3l2fNOg0ZCOGHjLamYxA1z/kzFjbc61trTrj6Y
         bSo3lJcG+IjuckfPtAwhtVszdgy0CVHz/sT/QhxLOPPvlNQypnDIkROwtU5HYMvCc83V
         uR4Pq5Bh3Be2RRmUPnnhUHRiPFgA4d0cPCJvjU/qusc/nB63EGyNxi0nxSFuOaZwlGSY
         Dj1j1BqFzq/DSrgADPYtdP8q5wPNUF+wpIEKhhTVW/Ox0YkUDjfLvHmgivjeZvnS25Ew
         ezqF5pbi2EJ8DMIZ1ecjPMzW29BfHisTNB8XgfEgwrsIYHNXiUzqUf5ku//BGcYfy1DZ
         7WLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252451; x=1788857251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+HrXbMbxa/Y02K3QZMbt843lXkhHRmzbDFOaV/a9gQ=;
        b=iROGYTpJuoc/WOybFf1PcFxJ4326LcSHk0/n8QOm2o+a8VOn98DwHfP1PNcuCFtUFa
         Aydx7nqVZNN6mmRQKAAbKqzS94abqCukXjJD+QWO4/UCvfdR77NypFX2qOUHsGOwyECC
         nm9TZfvgfp8knSayG1zOugtNxSHZOVTgUzzqjUpllMDqtHydgQzykUVjlov6TtRm/ccy
         CxRlRf58m+g4lEyC8ERZbS/l/0LUb2liClR2AMuTOmrReb3segKMfrdVDoEMH5iyN4RN
         BxZatgKyvVcrU19JMRkd8IeOcHUdHjQIUUqe0Pcs4iXzTpgVXuKZJbkK6OzzPZ0qYe8w
         KSrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxgTK+yrca8aYexofpkLHvn3s5UhsFkJFovyHydNiVlPk6NwewkOA7yM5V4AEJK7PqgpQyOyjlpTSLtKiaWuJB@lists.infradead.org
X-Gm-Message-State: AFuF++l2TjranyS8CEV3qXaF+nFw1F1q+kRB9LTeMDHegBTRleri6DXy
	x3vIBIaubclePfMK/K8EX55uiE8WanAtMtB+51e6wFT4p90v/xz4GZhsF97K1L44yg==
X-Gm-Gg: AR+sD12MnjKx+ogJeE756w72IgBPHhafcqi0kDWTUifhVbnrRjqU72ItYu1SnxdTmkd
	w/pWP+2d6DFhrf8vul8NRWKB3j84D7J5cNYVawgtTkj6CDxezAXh2Rzoind3I3UN6yL6w4zyeAc
	t5YgrtvoLo82GilzkpHWJVEwUmhWi2wWQQgidYgQNkRmCculBsErNPuTz14YDSmtQf3XzArml4B
	vs6TUxC0MkKYdBYVKmRqFx25y3MSfx/yD2Ew1n1jscaDZNaHAuGHS6xh56avQPSVLnOIYAdr4S8
	Ajd3VuXYgrvOBQACTZ82ibMoeaHJV8+ny1RR9Zkk2PwzQndRkvzTpOZ06tDgpIUaakE9HYp3K77
	uhDxOS41EUQebWYuGEGasvkYFvHk6zB2727gHnKF1ww3o9u0acZEBL8jtaaD8t4scNMmUDaoFh8
	MThknJAwbJw55C8usmB8cwp/nhQ7OdLAqFKEqyq5NtxgAi2auR4ZjpyFtfM2Had2iQO5mdHBELD
	fhj+R7sVzpRYdlb/4DE62CByGG25g==
X-Received: by 2002:a05:600c:12c2:b0:499:be2c:94f3 with SMTP id 5b1f17b1804b1-49cdd26e207mr507145e9.6.1788252450501;
        Tue, 01 Sep 2026 01:47:30 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm220827575e9.4.2026.09.01.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:47:29 -0700 (PDT)
Date: Tue, 1 Sep 2026 08:47:25 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH 3/7] iommu/arm-smmu-v3-iommufd: Fix error path in
 arm_vsmmu_cache_invalidate()
Message-ID: <apaRHXMxfM7lxdJV@google.com>
References: <20260828125409.1921538-1-smostafa@google.com>
 <20260828125409.1921538-4-smostafa@google.com>
 <178792724269.3808739.17189675074822824146.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178792724269.3808739.17189675074822824146.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014732_920725_4B2731AA 
X-CRM114-Status: GOOD (  19.20  )
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

On Fri, Aug 28, 2026 at 11:27:22AM -0300, Jason Gunthorpe wrote:
> > arm_vsmmu_cache_invalidate() issues commands in batch size.
> > However, if arm_vsmmu_convert_user_cmd() fails, it will return to the
> > user that it processed "cur - cmds" which may be part of a batch not
> > issued yet.
> > 
> > Fix this by calculating the returned entry_num solely based on the
> > "last" that tracks the last batch that was successfully issued.
> > 
> > Also, fix the number of commands for early failing condition.
> > 
> > Fixes: d68beb276ba2 ("iommu/arm-smmu-v3: Support IOMMU_HWPT_INVALIDATE using a VIOMMU object")
> > Reported-by: Sashiko <>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> 
> Nicolin's series fixes this and the other sashiko note about over
> allocation:
> 
> https://lore.kernel.org/all/cover.1785258826.git.nicolinc@nvidia.com/
> 

I see, I will add it to my review list. Hopefully I can get to it by
this week.

Thanks,
Mostafa

> I think it is in good shape, I would rather merge it than hack on this
> further.
> 
> -- 
> Jason

