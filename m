Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC62C7EE24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=; b=DuppowtGyysoACFNCvhBM6W4cE
	4CNwYZXj4DGdjQ4bLcG8Lor7OmeYOjumEK0WNyFaVbC32U7VPFbtNXLwVdm9Zx6muBG7fheGZjNXB
	txw+WLnCXd1Cywvd7zMbdb+NRsuRtGvFQt+6e0BuJ+t3GlhbA5hY+arjHCCp79uVU/WTqEbhoWuar
	CJ4ObS3hsb3sWise8IjEfGxHCD4qTssT8oiUF3PZiVvHmZQ8xojm9CKza67oswPh7ncnAwGeLu3hs
	I8fng5n0wjuSWh/flr3/xk6flOkoblVYcPK36KVh5O4GVvw+kaDU2do2U423O5M5tS7xLD6FuikIa
	KZwtPMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRV-0000000DRSA-28nq;
	Thu, 19 Jun 2025 15:44:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBtb-0000000CfVP-0oST
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:49:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2348ac8e0b4so111195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750326562; x=1750931362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=;
        b=pT31u5RcgQe2nETBdGKKHlwAcKFs8x94z/Gqj3HYyZ6QVRbbfzVQtSV1RQnkmgfzM/
         xGXGn6TvV67xW3NTOwZN+FD+JIvDJdSMCC78FVLDAGGmRcgNwC2Ya/XWzo4OP5Q0KoTj
         84P4CP5HP53lf6frHAYjVy4R7HNXb0qEt0aDS8IIGIU8JmwnFSL/62EpQbmAlHjmdG9V
         +L1T5Ub9zaTv4U0i8owSt2LRPDJ6vYRhYgGiVWkQxOmLs0n3WHZhm7HcmxIJO6NFeZLS
         YKaN0WtGx4cT/iyM7OIrbbp4G6tDRwAZDHpABCIpOrM/xn3NG3ilazto60aGNrX+6NBI
         WNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326562; x=1750931362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17oxjeeFsHFeG65L770MNpFPAUdse/NuAwqFBcFBF84=;
        b=AwMbyurEaPwzCWEEl5rgaFGlWeRK1mmPpLnDQG3gypG0sdvbuPxN35qTXk8Y5mouDy
         bpqURT7saUZ00RzrBMXjK/Bowx6a6K2ar4DbmYZiEuocAPFtkpg/aYji/0igj0LzwDBy
         wwM8zI7dwwWr+U49aW6aZ28eVjaKtgKe+E817dA3ZnzNZr7cVuBP1DZ+ALU4AkuPlQ/K
         N9PA8GVRByk1BkcOCgzOdSwv0rZldwqcgdiEoOHxva5sk4ej2fdC5GhKk8D1oqKB+Jav
         tn0pRGTX8fSqWkAkjlHOuAZSixHxgLYWQRMpnzHvcnTLqebBBlB7shRzIc012/cEly8h
         8eUw==
X-Forwarded-Encrypted: i=1; AJvYcCUO4wLyvvxTzYQ+cpwBMzyoj2OeTz4rbZbkUgXMUlQokFqtWNE308Yao5yY7SYlruknecu5nPvHT32RZgeFHfBB@lists.infradead.org
X-Gm-Message-State: AOJu0YzGPjjEqnTUHWDbbmdRMyHiIRCP9+wVHX61Rnq/iiOdAzJEat+b
	rTAxfUlzbnxSTUe30rxr7uJGp3rtV2gtWHaf5hrzasDLqxp7e+2tHaFgRyNVaIh6Hw==
X-Gm-Gg: ASbGncuCiREmSkpzdL9dbbjb7HG5tB0nSlzTns5UrcK1BzFCCFYuI8+S/CtV+PgG8EH
	wliKb1u33oMD0/uHIBKeYEuBG+KjbVFY536B8AHW4QMmT8gob8tEuZHAh0p916k4va6F4hdUpS+
	ofcMlGkq5swWs3OMLU7bUWmq7QdPBuerO+YngOXUlEbggTsAJHV3ARcI6zZtqErDKLmP94b+FQg
	cZgPs1LNCFwCtb8fDd5JdoUbZ1Slev9ayd731pDdRQwpEDkmGOiG6dWrCnJ8nZOubZxXLlOj6P3
	Z2Us4Tm6olWByeZsp9EgC7mo+XvO7InFt7ILTuu606hobKFkowNVSgGKIU3P+E6lIIhuyMyNGVx
	KJOAKjdwtYHQpdsXkPdPS
X-Google-Smtp-Source: AGHT+IEuCYASVN8j1eZMJIcAvoBEAqstpKSSgGIYZ2iYQuSQhTyrI+a8+/330LWZVAAW9AYW4syqlA==
X-Received: by 2002:a17:902:fc46:b0:234:bcd0:3d6f with SMTP id d9443c01a7336-237cdfe9619mr1746815ad.1.1750326562236;
        Thu, 19 Jun 2025 02:49:22 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb04a6sm116435595ad.178.2025.06.19.02.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:49:21 -0700 (PDT)
Date: Thu, 19 Jun 2025 09:49:10 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kevin.tian@intel.com, corbet@lwn.net,
	will@kernel.org, bagasdotme@gmail.com, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 07/25] iommufd/access: Add internal APIs for HW queue
 to use
Message-ID: <aFPdFnKvus57cGOU@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <64145b184a0fa7c9b60532c9b475a51625edb77c.1749884998.git.nicolinc@nvidia.com>
 <20250616133719.GC1174925@nvidia.com>
 <aFDSNYOTToFSbFA2@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFDSNYOTToFSbFA2@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_024923_236325_10147C7D 
X-CRM114-Status: GOOD (  32.26  )
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

On Mon, Jun 16, 2025 at 07:25:57PM -0700, Nicolin Chen wrote:
> On Mon, Jun 16, 2025 at 10:37:19AM -0300, Jason Gunthorpe wrote:
> > On Sat, Jun 14, 2025 at 12:14:32AM -0700, Nicolin Chen wrote:
> > > Now, access->ops can be NULL, to support an internal use case for the new
> > > HW queue object. Since an access object in this case will be allocated by
> > > an inernal iommufd object, the refcount on the ictx should be skipped, so
> > > as not to deadlock the release of the ictx as it would otherwise wait for
> > > the release of the access first during the release of the internal object
> > > that could wait for the release of ictx:
> > >     ictx --releases--> hw_queue --releases--> access
> > >       ^                                         |
> > >       |_________________releases________________v
> > > 
> > > Add a set of lightweight internal APIs to unlink access and ictx:
> > >     ictx --releases--> hw_queue --releases--> access
> > > 
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > >  drivers/iommu/iommufd/iommufd_private.h |  8 ++++
> > >  drivers/iommu/iommufd/device.c          | 59 +++++++++++++++++++++----
> > >  2 files changed, 58 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> > > index 4a375a8c9216..468717d5e5bc 100644
> > > --- a/drivers/iommu/iommufd/iommufd_private.h
> > > +++ b/drivers/iommu/iommufd/iommufd_private.h
> > > @@ -484,6 +484,14 @@ void iopt_remove_access(struct io_pagetable *iopt,
> > >  			struct iommufd_access *access, u32 iopt_access_list_id);
> > >  void iommufd_access_destroy_object(struct iommufd_object *obj);
> > >  
> > > +/* iommufd_access for internal use */
> > > +struct iommufd_access *iommufd_access_create_internal(struct iommufd_ctx *ictx);
> > > +#define iommufd_access_destroy_internal(ictx, access) \
> > > +	iommufd_object_destroy_user(ictx, &(access)->obj)
> > 
> > Use a static inline please
> > 
> > > +int iommufd_access_attach_internal(struct iommufd_access *access,
> > > +				   struct iommufd_ioas *ioas);
> > > +#define iommufd_access_detach_internal(access) iommufd_access_detach(access)
> > 
> > 
> > >  struct iommufd_eventq {
> > >  	struct iommufd_object obj;
> > >  	struct iommufd_ctx *ictx;
> > > diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> > > index 9293722b9cff..ad33f1e41a24 100644
> > > --- a/drivers/iommu/iommufd/device.c
> > > +++ b/drivers/iommu/iommufd/device.c
> > > @@ -1084,7 +1084,39 @@ void iommufd_access_destroy_object(struct iommufd_object *obj)
> > >  	if (access->ioas)
> > >  		WARN_ON(iommufd_access_change_ioas(access, NULL));
> > >  	mutex_unlock(&access->ioas_lock);
> > > -	iommufd_ctx_put(access->ictx);
> > > +	if (access->ops)
> > > +		iommufd_ctx_put(access->ictx);
> > 
> > I was hoping we could null the ictx to signal internal? That didn't
> > work out?
> 
> access->ictx should be NULL for internal. It should have been:
> +	if (access->ictx)
> +		iommufd_ctx_put(access->ictx);
> 

Ohh sorry, just saw this. +1, I too believe this is better than relying
on access->ops being NULL.

> > I would at least add a comment here this is filtering internal that
> > doesn't have ictx. Maybe a little inline 'iommufd_access_is_internal'
> > is appropriate. We'll be sad down the road if we need ops for
> > internal.
> 
> Yea, an inline will be cleaner. Will add that.
> 

Ack.

Thanks,
Praan

