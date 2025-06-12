Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3845C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv8y1hwAZ1ADO72IiD5Mm9fc1qZ34wninqrfu7oXtRo=; b=QY1jc2uJ86tHoGtKgYpF8zz81g
	zIovk5Z+cRs2PXyrEPWsOBcor6jrJlXDcMZJA38tjpbafR2hYUE7zCLWgu4CRA4yzaHDaXU7BW9j6
	LM7/XjyFGkI9Hmi8OHITDkPFZhD92PKOoEbvMPFjJqXNKte3f/dBawxp5dDqhGvnDz8NcgOrr4oDb
	uIR80CV8+FtzW7gacGpJSySv3opRD2d+eG00lT43xf0gWk3aW6wI2JAFu9HocNE3EnI60LAsnXhj6
	1+zZdf5Qh/Kzu/EjNKbf00ezfNPbXgtoBTMPxM7632KIBtArS3w3kIiSKqfo9/wgy/9WlV70hpPLA
	VZhwVxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7P-0000000Ejpt-23j6;
	Thu, 12 Jun 2025 22:09:55 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlm7-0000000E2bN-1o98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:31:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-747fba9f962so1130634b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749499; x=1750354299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xv8y1hwAZ1ADO72IiD5Mm9fc1qZ34wninqrfu7oXtRo=;
        b=lhmHSgZxCr2Ejls14bCFwSqHiqBISWypMSpT+g3oyzxH32SZSPF46Iq+YoH7Rk4Hxq
         0ZJHWPGqW0oI4hN3/PmAIX9LurCPnXXB0VQlBsEDHn2PBOrhIXpLdOUDY3vAwzqofnLP
         RkGgHjDRctBTwuue42G4it4VSvKD1r4XOm5wBoamJB6opTTDeW2oZMUEEuSaGVVJNUqa
         67gWthOUUpdM2BOoMJk1mab/p7gR/34/t8/dwkKK/oOXTDCqedINbI4TUrsRifStiDec
         F6kq0LjNBV1pkpYXdrZ2YmSVIls1N+wiw78g9mFsskkN3KXwbP20AH5DjnEbgw+EVM1Q
         6YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749499; x=1750354299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv8y1hwAZ1ADO72IiD5Mm9fc1qZ34wninqrfu7oXtRo=;
        b=OcTll1kh0UmhgHPRBk1rzg+sbLxCAI+fKYv316G5vGcgXhHs6crjVZCN3Dj+U5BdHU
         ABl0Zfkp6lqhG8ZKE5E+XO0q/EpCD1ptLiKEeWMBKgTvUTCzaPuU4dYeAZzsJ2fqwcAv
         3oudh8pGiXHOdDIxghRdzrMi4DC6ziLTHZV/EuNQ7w/Aom8ucSzoCRKQbRe4QjmxVHGv
         eoEcwYwDu4xeT7WZFjJRjBW9nKvXAzIwjD2yGCzLGM1YCOTPHMeK0xuZxHCedC4vtibU
         lZLfFu0VsOSm0oViodgXV401XsnI8cMPVpYbH2Kk7gimdYcZ+cBo3HhYTTetR/H6OJj2
         tFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpkyrxZRhLujkC9gj4HD/9j90PimJXl15hhC4Rqzr8RbR+WLuBJa29vrM+FPhlx/az8Hi8k7PQ0YkBH2iHpNT7@lists.infradead.org
X-Gm-Message-State: AOJu0YyLvA3Gjlniv2QsMKJOWiW5Icyvn2U2RdPZE7qfTtYAvouYSb8M
	TcBNH1IQoQoEmwzOeG+QiWNgSfBWsfXanLDsYxCFl1gdDoVNlD7IsOL+Kc8lE/eB
X-Gm-Gg: ASbGncvSMIU7WKOrnop4GQOmCiRMwEFpyC37QqjHy8sta1fOIs2NTziEBQqZWs/iJ+q
	B60e52Wjg97zvyAkMC0hsYxPfGh8iNPLPC6qrlmA50N7SCXAWMV3E/StOyA2EQE3lziNJfoiuyw
	yeg5617lZXs+eqzRRDOJLjxxDPukw7dTcLXmpXy/5KDnRawiXQW5mSjsS66GhBV7SO/KT4PfeMH
	ZjLYjcEuv5ZJgdpGdCMGK2K/q6rG0Jei39i5IVYmqcslUuq25obJ3IjQ8NbA0knpZI9r83UXuAj
	U33JXnIfTBfeiKLMEiN4AVy8D5AOEp7u4yj8HoTzEWx7CbIQjB1I3phFOJMb
X-Google-Smtp-Source: AGHT+IF6JO6zv2ZxYGrMpFyX5qpBH+K4yTR69s1GLbL1n6QCFkSYxYZgE78yuUZ7Dqsii20VloyovQ==
X-Received: by 2002:a05:6a00:cc:b0:742:a24d:aede with SMTP id d2e1a72fcca58-7487ceecdc6mr3909973b3a.8.1749749498580;
        Thu, 12 Jun 2025 10:31:38 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a0bcd4sm1800344b3a.149.2025.06.12.10.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:31:37 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:31:32 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
Message-ID: <20250612173132.ixgctqijtd33vnmb@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-2-hiagofranco@gmail.com>
 <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_103139_468975_62D8B090 
X-CRM114-Status: GOOD (  35.45  )
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

On Wed, Jun 11, 2025 at 10:32:28AM -0500, Bjorn Andersson wrote:
> On Mon, Jun 02, 2025 at 10:19:03AM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > This helper function returns the current power status of a given generic
> > power domain.
> > 
> 
> Please correct me if I'm wrong, but this returns the momentary status of
> the device's associated genpd, and as genpds can be shared among devices
> wouldn't there be a risk that you think the genpd is on but then that
> other device powers it off?

I am not fully familiar with the genpd's, so my knowledge might be
limited, but I think this is correct, if the genpd is shared.

> 
> > As example, remoteproc/imx_rproc.c can now use this function to check
> > the power status of the remote core to properly set "attached" or
> > "offline" modes.
> 
> I presume this example works because there is a dedicated, single usage,
> genpd for the remoteproc instance?

Peng might correct if I am wrong, but yes, I believe this is correct.

> 
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4: New patch.
> > ---
> >  drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
> >  include/linux/pm_domain.h |  6 ++++++
> >  2 files changed, 33 insertions(+)
> > 
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index ff5c7f2b69ce..bcb74d10960c 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> >  
> > +/**
> > + * dev_pm_genpd_is_on - Get device's power status
> 
> Functions in kernel-doc should have () prefix

Thanks, I will correct this is next patch version.

> 
> > + *
> > + * @dev: Device to get the current power status
> > + *
> > + * This function checks whether the generic power domain is on or not by
> > + * verifying if genpd_status_on equals GENPD_STATE_ON.
> > + *
> 
> If my understanding is correct, I'd like a warning here saying that this
> is dangerous if the underlying genpd is shared.

I believe this is correct, maybe Peng or Ulf can also comment here, but
if that is the case then I can update the comment.

> 
> Regards,
> Bjorn
> 
> > + * Return: 'true' if the device's power domain is on, 'false' otherwise.
> > + */
> > +bool dev_pm_genpd_is_on(struct device *dev)
> > +{
> > +	struct generic_pm_domain *genpd;
> > +	bool is_on;
> > +
> > +	genpd = dev_to_genpd_safe(dev);
> > +	if (!genpd)
> > +		return false;
> > +
> > +	genpd_lock(genpd);
> > +	is_on = genpd_status_on(genpd);
> > +	genpd_unlock(genpd);
> > +
> > +	return is_on;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
> > +
> >  /**
> >   * pm_genpd_inc_rejected() - Adjust the rejected/usage counts for an idle-state.
> >   *
> > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > index 0b18160901a2..c12580b6579b 100644
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -301,6 +301,7 @@ void dev_pm_genpd_synced_poweroff(struct device *dev);
> >  int dev_pm_genpd_set_hwmode(struct device *dev, bool enable);
> >  bool dev_pm_genpd_get_hwmode(struct device *dev);
> >  int dev_pm_genpd_rpm_always_on(struct device *dev, bool on);
> > +bool dev_pm_genpd_is_on(struct device *dev);
> >  
> >  extern struct dev_power_governor simple_qos_governor;
> >  extern struct dev_power_governor pm_domain_always_on_gov;
> > @@ -393,6 +394,11 @@ static inline int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > +static inline bool dev_pm_genpd_is_on(struct device *dev)
> > +{
> > +	return false;
> > +}
> > +
> >  #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
> >  #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
> >  #endif
> > -- 
> > 2.39.5
> >

Best Regards,
Hiago.

