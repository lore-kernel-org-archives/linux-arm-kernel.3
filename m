Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AACE68975
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 11:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tOVqDGIVkJ6VSlfAnQKasdgXF9e/3uyEUG7DpZuXhY=; b=l42txpkREhHczOn8euRXZ7oU68
	yWFFakvbBYBkGHojaKr8ApZHifvXYwCH/au2NLnBiRgi29lPyIUBeBaFFZq3ErcEzel3jKqFBtqGo
	XZNwVn8um9CXTjXuawTjSJe6sAdPsYwJUE08MwS7fLtsXmC2WyJ+IZ6IGMPKArqgnwuMgaSmMFnsc
	tA4uZvtVf8TI2JAKEXTYacjTrhD5EN600WoiUhyd7nlYG6Rd6LF+Vswer5dxXdDzb0WcMsAcm7frQ
	k2TSn8KE5uaMk+sE0lKOUhwxGxYyxDIOmQasxTUtPUSPWkMsJcKdXila6Begggv+4733vRXldiMxE
	+eacc+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TE9-00000003NWf-0u3z;
	Thu, 31 Oct 2024 11:20:33 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TCS-00000003NJl-35wK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 11:18:49 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5eb73ec1e1aso411948eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730373527; x=1730978327; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tOVqDGIVkJ6VSlfAnQKasdgXF9e/3uyEUG7DpZuXhY=;
        b=scALhf1peQuZWETSquCMTTJpD09XInrkK01A8P/OOaqRS4A4pjyQIyUYzj11uLzZPK
         kFtwyudaJjUdmtDiEVobEoS8Frjj6mS4Rq8N/qMncr/Pn/08AkT7naxymJB+RnHld4dx
         ysT6VpaAhTIFhEkvLqF9q3Sa5xrP9MYhrx/SJCLjQOkUz5scU53dXs6awFIzRS7Ev72x
         BBpgBXGhD5mlc34tAZrDGXwj4oBqBmGiDOTH5MgsSwJzK4FN82y2o62TOrjH6PQD9xBl
         wg6dy2f2Z3n1wmizmILKDCNSbYwVyOEs1wTPWXZ0gv4LEGjpGUBVM5PI6oybPm1DfXhl
         EwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373527; x=1730978327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tOVqDGIVkJ6VSlfAnQKasdgXF9e/3uyEUG7DpZuXhY=;
        b=QGA5DIYy8Dsu4O3R5cfHW91OIqJtEsFRDuHwEF1A6aICzCjaj+XRuaVc2pOXq4epx6
         gEXOvr6b0HDdDhQ//FSb8wQa4PNagDVz+ERGTSYJHgU2Kl/rgjMiMwSJzp8Sjj2xYleW
         dCxNfdCQQ+jUsf+evuFaDEbPnxIkoRP95bNajW+mBBqwnkPBIn6fnPIHLCYtjapkMyCD
         2nkWkC1Qc3aXChOKp4QWH/Ipyv50Ovrj8m6+5KZbud3v4HJhIu5+gbT+fcZHQ2W+Ub7V
         cUQdUxpjlDl4LfNDRhFWJnevM8FzkFugySolzWFNi0Vgi26HpGZ3D08EmAj2gpBYol6P
         EaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzLCOkgHmR529mbyOr5Z4Et37ur44KFmsWG+fTUumElWxGRPST9QL/cdI9A/OFfEFSwB30XCd3naDzR13ma45X@lists.infradead.org
X-Gm-Message-State: AOJu0YxumGSPxKYO8Y25wcH0HgT2fEfmRV+eUd+toG2c6mz0P1xU8gGR
	+0SxacWGgs7V+cWCqFd+sI7wZ+EKH/BvwGb7nSiu6Dcuj60ZzVWDcoDgpxtRj0OJ7GTJCj1gqcQ
	LiM+DAMMbNk5H6Uw1HxyCuhy/WH5A+3lQlK5UhA==
X-Google-Smtp-Source: AGHT+IFQY0jyd6E8l4ZVxaxh5x5SVk1SxFaa6tSUf7REkjjSQjNyJIZv7P8E7RYon6B3a5PLGcKeZNWF/nmdRTVbnGc=
X-Received: by 2002:a4a:a701:0:b0:5ec:5922:ddb with SMTP id
 006d021491bc7-5ec592219f4mr4806888eaf.2.1730373527001; Thu, 31 Oct 2024
 04:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-5-peter.griffin@linaro.org> <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
In-Reply-To: <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 31 Oct 2024 11:18:36 +0000
Message-ID: <CADrjBPpYQQNdYya_95KXRYBrfSD91E-rfYcw6Q-ZNOgh5-4VJw@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR
 check
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, avri.altman@wdc.com, bvanassche@acm.org, 
	krzk@kernel.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_041848_799361_9C473735 
X-CRM114-Status: GOOD (  22.88  )
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

Hi Tudor,

On Wed, 30 Oct 2024 at 08:56, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 10/25/24 2:14 PM, Peter Griffin wrote:
> > The values calculated in exynos_ufs_specify_phy_time_attr() are only used
> > in exynos_ufs_config_phy_time_attr() and exynos_ufs_config_phy_cap_attr()
>
> all values set in exynos_ufs_specify_phy_time_attr() are used *only* in
> exynos_ufs_config_phy_time_attr(). Or did I miss something?

Yes you're right, I'll update the commit message.

>
> > if EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag is not set.
>
> yep, wonderful.
>
> >
> > Add a check for this flag to exynos_ufs_specify_phy_time_attr() and
> > return for platforms that don't set it.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/ufs/host/ufs-exynos.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> > index d685d3e93ea1..a1a2fdcb8a40 100644
> > --- a/drivers/ufs/host/ufs-exynos.c
> > +++ b/drivers/ufs/host/ufs-exynos.c
> > @@ -546,6 +546,9 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
> >       struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
> >       struct ufs_phy_time_cfg *t_cfg = &ufs->t_cfg;
> >
> > +     if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)
> > +             return;
> > +
> >       t_cfg->tx_linereset_p =
> >               exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
> >       t_cfg->tx_linereset_n =
>
> tx_linereset_n, rx_hibern8_wait is set but not used anywhere. Can we
> remove it? Not related to this patch though.

Yes they can be removed if they are unused.

Peter

