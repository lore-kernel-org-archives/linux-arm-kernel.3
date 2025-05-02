Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F10CC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 07:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhyG+qPql1C6VOEStks/G335oAHhX6Klfc0SAJXR260=; b=r4LTAlMS618f8Muu5DbwvRwNUo
	ExyG7vulH+J3tBSfLcz0HR32mAz2lNG4mH0Zst3AMW4DNrkXlDTXJ4csERzHwFaeqGZSlL6Ye9N2B
	AWYXmEye6eMqhQBQYNPb/Ii38ZcIYPHzdOJWUgKe7bzbcTihem7IVkcru1K25uOTRkG9SjLZftIqL
	RdPGqxuCwFf+nV9ZVZwWfFgwE6EK3WACITMu5JvXv9R+aKmMpPOXwzSnNF35x885wH1gaDcJFlzhD
	zVoZ2V+pXNWtvk/HuzekGZMa5cqUxv88Iz5I9apK5nluHN4Mz9mxktMOrT3HynkjBSZxH6SYAtqlV
	NBhaLhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAktZ-000000016Wa-1xLS;
	Fri, 02 May 2025 07:33:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkre-000000016Lg-0rIs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 07:31:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-225477548e1so19234985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171077; x=1746775877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhyG+qPql1C6VOEStks/G335oAHhX6Klfc0SAJXR260=;
        b=OKxwr9ecuDs+3L7/boN3Qe8Yu6cL4TIOQKW+bNG45ii1ZfHf+Z8zBHWz5PKP3xIM/7
         +eEFkwyOzOCRQOcWLMo8gPu0vYrDmGI16H6DS+jJVrr6niFOcwhI1/I2OhlZ7WpVoBLj
         Cu4A/AhouoQUrPHIkVmwt0nDZDlrWCRKmVxYxqvQgDUZMvU+t4KizfBI7PsopEW+kx/b
         P54mH5CBqgEH0VC9BVBQA7Thiy8daYsfB1xms2dbHR056PVKf6EWeqYL2EBeE+l3Am/D
         HyP6JcjdG/XLNJhRYAS6w0p5U3A0LIlPvVIsCM6HD63sTA0BlGSJm97W8MR7lIoHaktd
         WEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171077; x=1746775877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhyG+qPql1C6VOEStks/G335oAHhX6Klfc0SAJXR260=;
        b=Y7BfFgaVJFnx1pWRwaoeZAMunEdbSyJaucwW4IpYHAQR8m5b2PgNOv+MURd+35dkRo
         9Qo9JI8byddB5B4IWAWGLl9MJsd9pYBPRG+c28JCiVXdOq1PbX7bvvA5M7Np/y9PwfHU
         MNu7GNmxLIyEdtDET3XdHYcHArqs3Mbztt5geNCJ1TogdnfteM2gbjYgi6ECZG8/RCc2
         idhuRwCzizkf4TcrCV8h4swvb3tg4Lj5+j64GjwrdfvOdXEJc0IfA9qpdHiy2BO2h+99
         Of2hFu0e/Xox7oh4o0D8odD2HtGanG8v40xpHKQACM1g6HyOLzO1Hzy5TwfGulLZV/qA
         K4DA==
X-Forwarded-Encrypted: i=1; AJvYcCXv4KGtuBtj1B2BskDIK0xFdXHnUV0XyZEUgbDb12WtZaplwUHuXQN5qeTZSUD6jO/TiDXcNT2DDWpLZUCop7++@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1RMKH1aYQ2GwK/rd82XNXttbj7Yi6NPzkv7SDUW8jz0gFmMYl
	SSWZU0Dd2AL7vIHklLh8RCByappnFbGv4PFYBqEQFrqB7NKvClTr
X-Gm-Gg: ASbGncsn89P/7F2QsWEAXfc0BqqaliN5cxgV+EfibqvPFLqRYxUrhZc9cDGtGr/HBxH
	dQOnSc35aVyYqH8T+gA+EcoUE53A5t+iQv0Mzvf97kls4HgLI2cnfJvgOaSUffS2dJaIgWhL692
	FisC5Ih4P3MgpJ61fZnlHb+YbtOKlNx1ID0zC4Kz7Du70myydaAHa8Q9O8Tmx+9utBFs6QZbmWC
	k71X/rXwafjMNl5ZRPWe6aejljJPI/9tG9OXOt9H7v1lRD/X/R2Qzzteb/Yq468o5UN5QRs3Oqe
	l/PV5rS9g+DzuHMVlz6EuT41HUKBDwsAq+7CjMf2
X-Google-Smtp-Source: AGHT+IH52a6BgPoPUu5N1D3Rb40EG6pjnTkV9nhRgxYGSZyv07U3fjSm8A6SXkBygATuXX2l4VA+sQ==
X-Received: by 2002:a17:903:2f91:b0:224:191d:8a87 with SMTP id d9443c01a7336-22e1034418bmr27532815ad.26.1746171077036;
        Fri, 02 May 2025 00:31:17 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f7c8sm937775ad.228.2025.05.02.00.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:31:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B8C52420A6AB; Fri, 02 May 2025 14:31:13 +0700 (WIB)
Date: Fri, 2 May 2025 14:31:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, praan@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v3 16/23] Documentation: userspace-api: iommufd: Update
 vQUEUE
Message-ID: <aBR0wWzQablOklyW@archie.me>
References: <cover.1746139811.git.nicolinc@nvidia.com>
 <0beddeaaa4a8a7a45ce93ff21c543ae58be64908.1746139811.git.nicolinc@nvidia.com>
 <aBRA75V9l9WlI2Q3@archie.me>
 <aBRYVkOKfFGMb5Y+@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vde97DQHR/3Yogi4"
Content-Disposition: inline
In-Reply-To: <aBRYVkOKfFGMb5Y+@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_003118_247155_BF8CEC02 
X-CRM114-Status: GOOD (  20.82  )
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


--vde97DQHR/3Yogi4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2025 at 10:29:58PM -0700, Nicolin Chen wrote:
> On Fri, May 02, 2025 at 10:50:07AM +0700, Bagas Sanjaya wrote:
> > On Thu, May 01, 2025 at 04:01:22PM -0700, Nicolin Chen wrote:
> > > +- IOMMUFD_OBJ_VQUEUE, representing a hardware accelerated virtual qu=
eue, as a
> > > +  subset of IOMMU's virtualization features, for the IOMMU HW to dir=
ectly read
> > > +  or write the virtual queue memory owned by a guest OS. This HW-acc=
eleration
> > > +  allows VM to work with the IOMMU HW directly without a VM Exit, i.=
e. reducing
> > > +  overhead from the hypercalls. Along with this vQUEUE object, iommu=
fd provides
> > > +  user space an mmap interface for VMM to mmap a physical MMIO regio=
n from the
> > > +  host physical address space to the guest physical address space, a=
llowing the
> > > +  guest OS to control the allocated vQUEUE HW. Thus, when allocating=
 a vQUEUE,
> > > +  the VMM must request a pair of VMA info (vm_pgoff/size) for an mma=
p syscall.
> > > +  The length argument of an mmap syscall can be smaller than the giv=
en size for
> > > +  a partial mmap, but the addr argument of the mmap syscall should n=
ever offset
> > > +  from the returned vm_pgoff, which implies that an mmap will always=
 start from
> >=20
> > Did you mean never be offset from returned vm_pgoff?
>=20
> Yes. Will fix this.
>=20
> > > +  the beginning of the physical MMIO region.
> > > +
> >=20
> > Confused...
>=20
> Meaning that VMM should just use the given vm_pgoff as is, without
> adding any offset to the vm_pgoff.

Understood, thanks!
=20
--=20
An old man doll... just what I always wanted! - Clara

--vde97DQHR/3Yogi4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBR0wQAKCRD2uYlJVVFO
o2GmAQD6yTz+9Kdn/nHALYBCiSbtX+ewWJjZ0spXlFlQyWBmSgEA9HdlnssGmaCv
oibhf/yiDjC4MkNfQVDV7Jw5qTjhagQ=
=zmrU
-----END PGP SIGNATURE-----

--vde97DQHR/3Yogi4--

