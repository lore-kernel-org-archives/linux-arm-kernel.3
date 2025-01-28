Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E18C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fMuy/pYgza/riIVTVPhUzUfkiZ2bVUecFPV047zGXs=; b=Xh3IDwtVGBoxp86TmyghFr5AYv
	c+qg9gmHfPVJZ1youQqlWlUrWtiAzC+KhkY4w7gOJ10jD7zb+7eGC2XnHl6oIzSqDkeAJK4fnpQZo
	hsfkuDlaGLZFVzzYCfablyemcO/hbg16hNExfZqTXtBEXEPSkMefGj7qsJzeqxz9W6vy80/CE42M6
	+0BMjAB7FAPBpxruft1sXPfihvoa8hEvXXTshmD4grZqfG2afKLTeR3BLKROHL3/iiF5Ot+dy6qvq
	ZvOA+SHVq30xId79uVfLRUQO7GwVmfcgwCqNn++Uun+YbGY12W1vOmAHfrRjJvCZnZLlXYcwxawhl
	2BlEPWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgsx-00000004NOR-3bhx;
	Tue, 28 Jan 2025 08:23:51 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgql-00000004Mqd-0j9f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:21:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2165cb60719so93976745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738052494; x=1738657294; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fMuy/pYgza/riIVTVPhUzUfkiZ2bVUecFPV047zGXs=;
        b=gMiJgfMEyquSkLx9kSLBER1eHCjO89pB84cfT3kGIPpOxD4j68AneKZuzpq+yujRE4
         6SiuApsYJ+K2eJg7I6sAiDx3Ls2IDew+IT5bn9zws82Mdv8D95F19ar/hSeitAgs84va
         GRyMmpqy1FSDTaA2AU87MPyaDSYoljfqCqD+NtG3kRs8k7yav8pJRZqPQcRykJJUqcW7
         MYPTu2u8XDbgWc71z/O6KTXzWhydMymUlwdjJrCRDygdid0YuH0B3UTt1yDtjuoKmvqY
         NY5HJMJaa1EzFrKn6gaCu978HkFMWujpq0XQW01SRBu7JPLfuyGmCPLVidxWoZgyIFG/
         jFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738052494; x=1738657294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fMuy/pYgza/riIVTVPhUzUfkiZ2bVUecFPV047zGXs=;
        b=ELanm7Ot4Wy2tU9ytiwxxzwJpqpBJl8TrHRioEJM2xqGjWbzA11UmKbMW0HsfLas0a
         2Dzi/QI4coFhFthc562l74O1wzBuz2o8cf8h11F8N/hvcJrgf+6wt/0jUYpYjSxfDKva
         0REsr4IZFwvD3lqGCbmpkMqOMW7Ao/8KePLfKKLI2eqspGiPY7gNKU/9bGL8J99iOtzF
         bYvvKyRS5mvfKCFG0rj7XOYNmIlAd0omjcnFM+g8AFPMj7LWqWKU7q+4GzAOC/pFZSFk
         2CsmBrZ4/2R1YMQUhrA8OgImjaAkp9bmAcOVnSox0bwDJaD25gaadoLiq7zdDELmwNmt
         C22A==
X-Forwarded-Encrypted: i=1; AJvYcCWWy/G6lT/QjIDze7zDmhtfA1fPHrB3e3Bzyztc9gR7GLEcbzdvd1NuduONOS8CBy1DQPHJ/EGn0MsQGIES3tcZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOaIF9YIMrgmYwuQ+6N2Ec9MuForxb+s6FkyS6dxvDy5lVtjt0
	7jpUV/0vuh84VBqzBjLfxTigInl7ubjgIjwY4kSC8Xb9qK+EEHUS
X-Gm-Gg: ASbGncvAu0Smfm+aNnMeiKfxDArKCXIFPjbGkZIvbCvSQETWh4XlinrO4mSpYnfsjlt
	SX2SFtK+XJhyd8x69tA3h5NlU5Vmdim4ncglsm+jNNGR/rdW+MJVbFCu1Y2JFNM+Zl6ZnRpdNfO
	DafX74N2kxGYLwAfkf88dRt3Rv/BiD3QIA3MznsmUlPaMKDwYHDo13wadBIZHiHQomSc5C3tZeM
	SKGZz09XGoSU5qNQfDuJnrIAaMe8dtipYv6CMDGWHY7CNihtJ1Pmcqpg4Toz/tDzaoakf/4hleI
	txr2VCGnp9LSW/8=
X-Google-Smtp-Source: AGHT+IGA23Ky/6K1hLSlTaGOzyYMHc1wGHqIfEJ8xAUCi8at04bQFz8GD3I/8Kj7sYnVrWvjXsXjWg==
X-Received: by 2002:a17:902:e80a:b0:216:6769:9ed7 with SMTP id d9443c01a7336-21c355c7dc2mr753720045ad.40.1738052494133;
        Tue, 28 Jan 2025 00:21:34 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e173sm76602675ad.32.2025.01.28.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:21:33 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 88B8C420A74B; Tue, 28 Jan 2025 15:21:25 +0700 (WIB)
Date: Tue, 28 Jan 2025 15:21:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
	kevin.tian@intel.com, corbet@lwn.net, will@kernel.org
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v6 11/14] Documentation: userspace-api: iommufd: Update
 FAULT and VEVENTQ
Message-ID: <Z5iThcDwBmBHZBJd@archie.me>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <300d03449b9420d756c1589e1c24bb8b4d508293.1737754129.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m1sZIbxqV2u1bbA+"
Content-Disposition: inline
In-Reply-To: <300d03449b9420d756c1589e1c24bb8b4d508293.1737754129.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_002135_236964_6005EC35 
X-CRM114-Status: GOOD (  24.35  )
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


--m1sZIbxqV2u1bbA+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 04:30:40PM -0800, Nicolin Chen wrote:
> diff --git a/Documentation/userspace-api/iommufd.rst b/Documentation/user=
space-api/iommufd.rst
> index 70289d6815d2..b0df15865dec 100644
> --- a/Documentation/userspace-api/iommufd.rst
> +++ b/Documentation/userspace-api/iommufd.rst
> @@ -63,6 +63,13 @@ Following IOMMUFD objects are exposed to userspace:
>    space usually has mappings from guest-level I/O virtual addresses to g=
uest-
>    level physical addresses.
> =20
> +- IOMMUFD_FAULT, representing a software queue for an HWPT reporting IO =
page
> +  faults using the IOMMU HW's PRI (Page Request Interface). This queue o=
bject
> +  provides user space an FD to poll the page fault events and also to re=
spond
> +  to those events. A FAULT object must be created first to get a fault_i=
d that
> +  could be then used to allocate a fault-enabled HWPT via the IOMMU_HWPT=
_ALLOC
> +  command by setting the IOMMU_HWPT_FAULT_ID_VALID bit in its flags fiel=
d.
> +
>  - IOMMUFD_OBJ_VIOMMU, representing a slice of the physical IOMMU instanc=
e,
>    passed to or shared with a VM. It may be some HW-accelerated virtualiz=
ation
>    features and some SW resources used by the VM. For examples:
> @@ -109,6 +116,14 @@ Following IOMMUFD objects are exposed to userspace:
>    vIOMMU, which is a separate ioctl call from attaching the same device =
to an
>    HWPT_PAGING that the vIOMMU holds.
> =20
> +- IOMMUFD_OBJ_VEVENTQ, representing a software queue for a vIOMMU to rep=
ort its
> +  events such as translation faults occurred to a nested stage-1 (exclud=
ing I/O
> +  page faults that should go through IOMMUFD_OBJ_FAULT) and HW-specific =
events.
> +  This queue object provides user space an FD to poll/read the vIOMMU ev=
ents. A
> +  vIOMMU object must be created first to get its viommu_id, which could =
be then
> +  used to allocate a vEVENTQ. Each vIOMMU can support multiple types of =
vEVENTS,
> +  but is confined to one vEVENTQ per vEVENTQ type.
> +
>  All user-visible objects are destroyed via the IOMMU_DESTROY uAPI.
> =20
>  The diagrams below show relationships between user-visible objects and k=
ernel
> @@ -251,8 +266,10 @@ User visible objects are backed by following datastr=
uctures:
>  - iommufd_device for IOMMUFD_OBJ_DEVICE.
>  - iommufd_hwpt_paging for IOMMUFD_OBJ_HWPT_PAGING.
>  - iommufd_hwpt_nested for IOMMUFD_OBJ_HWPT_NESTED.
> +- iommufd_fault for IOMMUFD_OBJ_FAULT.
>  - iommufd_viommu for IOMMUFD_OBJ_VIOMMU.
>  - iommufd_vdevice for IOMMUFD_OBJ_VDEVICE.
> +- iommufd_veventq for IOMMUFD_OBJ_VEVENTQ.
> =20
>  Several terminologies when looking at these datastructures:
> =20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--m1sZIbxqV2u1bbA+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ5iTgAAKCRD2uYlJVVFO
ozC2AQDPP1Rr/NEdpC96sqjf+s6u1DgXFgQ1dghVRl94136J4AD/UQWE5HkY2pgd
+/5yHWzPSekTkat+mn1D4NZcmc/8IQI=
=M8Cm
-----END PGP SIGNATURE-----

--m1sZIbxqV2u1bbA+--

