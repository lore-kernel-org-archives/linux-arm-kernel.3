Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876F1C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 03:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9Fmb2BpvFenPgSBSx7aFW99AUa48pruOHMxG4AYI/0=; b=tBPCef7FwMUPhobxk6glkEXAqL
	H7nb+3sEEgjdzg23YeiF52kRIXcp2tO2zEEhH2ttheC7Oka5fbFHh+eiAxgazO7SobykT2Z0NfFEB
	bSI8snfwYz3vi1DW0qU6v2jbfA9ks9xxG/qK+Lo+86moke8rr37OSWQbEWesY4lFEkOt4DkMquBAA
	Ih0fXim/2qRQBJqbN2Wrno65EIU0Khokw5SpvdC7v57XgzSEQ63SWjtSbpSW6Og9k6HQA8G1zJxO4
	zefwGc+jT0FVhI2Fi9m0XEvJE0/5J+Y6rI6J18ARbgqX17CfGm72vd3ZA2/1jKW8cyTRns0i29LjH
	WGnr6SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhTW-00000000icQ-3ToP;
	Fri, 02 May 2025 03:54:10 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAhPg-00000000iHG-2WWx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 03:50:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso1363407a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 20:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746157812; x=1746762612; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9Fmb2BpvFenPgSBSx7aFW99AUa48pruOHMxG4AYI/0=;
        b=kqwjvbYZlHRdAapwjTseaEXQAhBDd+gNYGK6v9gr0nxhe1JkwSaTa/XK88LDcKK8U2
         M5qrCsrRR1aM/dVmVW1wgEEwLcWCgQHp35lccHAapR/Jl++dlD9eYMPiylLuOHL8eKdc
         d159uzKjsEyKcCcvfcra/YbAOSX2NTZSPjMFMv83cbPWtawgnghV425s8Mnc/2jMtYmx
         2ekg+M1lWQ7ndG6Y50yqSTmsL1FdU+8nEQ190/eMRSQuECN1yyFPk71OKVuCxW+5m4DF
         sjEUEnmHpRsqe3EVjoo/EL2f9YkTYRzG9zS+3bofyP191AmQ6hNN+bcCFTP2PEZGtqQe
         N7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746157812; x=1746762612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9Fmb2BpvFenPgSBSx7aFW99AUa48pruOHMxG4AYI/0=;
        b=Ku3/lNNdjYFiiYse8FZ1QY0iko040A3ps0MctMQaUN+lIOPXvlWi8kmPldw4DXC9yo
         zGzAlb/LC1SjXHwvt+7EsXWApTHvvuMAy4G0iAwWpzHmZSMQA71yL8wlEjU6Y0ZodGLy
         YXxfvfd1EjJer9nR9miZxhvte7ddelWcw9Ds2vXyoJBxqKKBsZeRKJd6whm6AGyC/yrL
         hPj67cAMqegcOX51UYIv3HdO/NWvDVdRXddWoymYpnBu1vTIQib+ldZHh2MpNSYiiRmb
         Dsmw7rnBpJRm77O4lUugVLLbUyvkYpEllTYGcQKWxohXYiRlshm6Hs9Lb1cXejZBDY1S
         ooYg==
X-Forwarded-Encrypted: i=1; AJvYcCXPadj0BnPjHIkorGoV/FQssOc35ShZjTQjiTjPomReWYEtlJUlXpfUOOrw2FIB2W3UbM1fmZOMBGMySnD+dER7@lists.infradead.org
X-Gm-Message-State: AOJu0YyCrv80cZBEeBfpOUqNX1xipF5628Kfo3pSNfNc3BnaIpsXNLkU
	Kh7Q9nbmB1NT1J5gvgHXw/kQ9GwKClC2ZzBb6uuzAJ0c5zoSAZ7k
X-Gm-Gg: ASbGncvvloJTq1jJXuUI4kTX5N6PBy8QHtyr2RKx/W6Lh7+Pbwf0BJaG9N1tp2INmZu
	lnnH8Ld7MhPBxX5MLHv3Q9vCD0kO5xuWpQlL3GIHTXlnkVSKnGhZu03CQgbPikb9FQcwYTAe68W
	6I9iErtdO0Gg8aj1ObOSIPu3e3W2eK8eC/7wEAUkMKN08XAVfy/V2Oja1dMDXL805JJvfE89zFJ
	nirdIIPwL4YDdzZmPf2Rh5irTjWtRsOV7amcp8mMnuwyWLgbnJASNnIoUWVDNUGVpd3h7W1SqAP
	xBFAFsHFPz6uRBUXFe3XxJvDeUZzVNV15ypiGCUC
X-Google-Smtp-Source: AGHT+IFusSWo1BAwwXVBEu66ZFOQHwzVAGyr3p079qazgApC+Wzq8zZL3bsDTFLCQouzn2+zKuFDTg==
X-Received: by 2002:a17:90b:586c:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-30a4e59f952mr2796823a91.14.1746157811349;
        Thu, 01 May 2025 20:50:11 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e852sm1776417a91.23.2025.05.01.20.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 20:50:10 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CE99B420A6AB; Fri, 02 May 2025 10:50:07 +0700 (WIB)
Date: Fri, 2 May 2025 10:50:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
	kevin.tian@intel.com, corbet@lwn.net, will@kernel.org
Cc: robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
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
Message-ID: <aBRA75V9l9WlI2Q3@archie.me>
References: <cover.1746139811.git.nicolinc@nvidia.com>
 <0beddeaaa4a8a7a45ce93ff21c543ae58be64908.1746139811.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VfsLxvgoTsplys2W"
Content-Disposition: inline
In-Reply-To: <0beddeaaa4a8a7a45ce93ff21c543ae58be64908.1746139811.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_205012_639022_15328810 
X-CRM114-Status: GOOD (  14.57  )
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


--VfsLxvgoTsplys2W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2025 at 04:01:22PM -0700, Nicolin Chen wrote:
> +- IOMMUFD_OBJ_VQUEUE, representing a hardware accelerated virtual queue,=
 as a
> +  subset of IOMMU's virtualization features, for the IOMMU HW to directl=
y read
> +  or write the virtual queue memory owned by a guest OS. This HW-acceler=
ation
> +  allows VM to work with the IOMMU HW directly without a VM Exit, i.e. r=
educing
> +  overhead from the hypercalls. Along with this vQUEUE object, iommufd p=
rovides
> +  user space an mmap interface for VMM to mmap a physical MMIO region fr=
om the
> +  host physical address space to the guest physical address space, allow=
ing the
> +  guest OS to control the allocated vQUEUE HW. Thus, when allocating a v=
QUEUE,
> +  the VMM must request a pair of VMA info (vm_pgoff/size) for an mmap sy=
scall.
> +  The length argument of an mmap syscall can be smaller than the given s=
ize for
> +  a partial mmap, but the addr argument of the mmap syscall should never=
 offset
> +  from the returned vm_pgoff, which implies that an mmap will always sta=
rt from

Did you mean never be offset from returned vm_pgoff?

> +  the beginning of the physical MMIO region.
> +

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--VfsLxvgoTsplys2W
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBRA6wAKCRD2uYlJVVFO
o+SZAQDJ/gcFcLrWtK7lcL67yMIrbhi/Ip66m8FOzciKz7X4gAEAu6K/kN2zgCb1
Up14Fvx9ssPG1/hIFF+QXlsxiG4N0Ag=
=Umti
-----END PGP SIGNATURE-----

--VfsLxvgoTsplys2W--

