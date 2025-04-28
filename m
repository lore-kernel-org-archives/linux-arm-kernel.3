Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD68C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGHvgmXuRyhO4FY9ie5ulcZe9dpbfqVfa/omQpTJU54=; b=DdALC5yEgr2aB5WgYBhHeRY11u
	OR3D7gB/CuzhPtf9+invcs8AhIlJXr+9I6MC858TfQRpDsEuUjzI5XE76vA/7aYJBg3lSEeVgfPZb
	/iKvPxMJw8vL1l6l/YrEDP+++qrsUoIJ+fZDE8GHu7WTA9VKwbsWgk8kSKsMgOYd/uKOOvOs2klYf
	ddPGnat6ZKtblfwRoNFg7NQuOfD8euhPj7KEesNpgdD/n7iASzPeRzUXLN2XGacWhyrMVcpuT9ne2
	8wigmfWmRsvqxIpP+XTHJ6HKi7uXPV68HEwrI7I/+m/IUfsBWhax6Vz7JNZDjCL6mMMHZFGK/xGgv
	aa/xCATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PZd-00000006eVc-4C74;
	Mon, 28 Apr 2025 14:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PWH-00000006dti-04Qm
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 14:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EGHvgmXuRyhO4FY9ie5ulcZe9dpbfqVfa/omQpTJU54=; b=prnCe+syn0RKLW5S+IqMv1XwOF
	Ht879CN+Qhxa3Bh5nBR9HVprxqlcgvBC4ifVrtpOjkTfXVFDXaTvPpaU9JZub4JV+n6KYwqZwDPTY
	oe96PXv6FNIbCSQmhCDqpHcnjFBPYrjmqLIPKY3/ko9bGcSY2C0+g4sdPdLylDSc62FhEZUM9cDwD
	nb1nnzUL4rfur1Bo/VCemqNXi4DVi4/UhGmwMcbKRPV/I2zasj8DGTUARgqGi1r4VpX7zOTCabpQ/
	YatzrBRbso3OBvC4zhXVaWwEqp3dlP8th01qRftwNnlkSpSFwsvU/e+L15ooXlN8n2mh1hWQ1sH1L
	hbELZWaA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9PWE-0000000Co58-159L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 14:31:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-739be717eddso3974219b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745850694; x=1746455494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGHvgmXuRyhO4FY9ie5ulcZe9dpbfqVfa/omQpTJU54=;
        b=VcU/+p9RG9U1xuWjlskxh32dF/KiKgjidLOvLljVBrH/uSHfOuyy0rOiWj4G87MEI/
         UtvuvGqbq+4oWtNoGmX6o+oWUtgy2pKWSivSmufkWhn+NV8Oiihom9AZyyWZ/v9uCWiv
         jfFEIEq/2cZU6CXmX631UCq+uXPuFi59188e6mwS9kw66rYb/LKPhs5iY8Kxsh5xid7M
         FXJjYR36U4rBMyV7TrqKZNY8LpzQkq21sXRzqrlAdvRRyRAuHJAoWc2oa2ZjGsiMSC87
         u+NJgG8JEt0aRP7wnNaJ+E+GsDS7caQM2gd9N4ucVaLDLVebEhm4xfqobv6eIzTHrTsv
         I6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850694; x=1746455494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGHvgmXuRyhO4FY9ie5ulcZe9dpbfqVfa/omQpTJU54=;
        b=LCcE9Q5zGbm8VT5wI1I3BUxdjZT7RHlZSxDa0mpzpgEncSTY7x+HoIzirMVw1PAgh8
         +n/rISPdx13O5qH4oyVSsCvpiO8I/Jxl+gBVs3lqebXD05prix0PnXBB22QdngNxYr/H
         FjVRi/SeiS5aVqX5OnGoSyTXW30cbGr07knR186PW0t5HHO0Z+sLIXM/DONegJhfE7O6
         YVdX8hLIoibcR2r12L9gxM7FuvZZsXTXbNIqJ+9SiB7xt+kZKTyrzNUPBK4w9BzfCgDy
         bvOaCldrMQutoZ9jrj10d8dH2rZdpBe+0Fun0X8NBq3UQemrwOuxCeFsuSmFfWrbkXTq
         Vx3A==
X-Forwarded-Encrypted: i=1; AJvYcCUTNe+hIriI59oRmftynhDBGz0M6yiAP8QpMtxtxNtby8+3e9RuyKibjPmWHFxV8YCMwaWhNWnIQ2SNev6ZcpqO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+wKljU1JxAQXmYJ9Odn1635LrZ1EAuAoAKkT0+nTjW5JxzQLO
	ZzULqb7Bl87SxVKmw+1Bk2VBziUwmawBGJH8mv3p+MbE2GyuRsXEjVicWg==
X-Gm-Gg: ASbGncseAqKz1JN1wsSlsHS9kFBHabA3fG9FzwmoKzZY+OLe+rk4PUTGcqFvOsy1EBr
	SoDekLVQUT6cp5MeLNG8gHWiPCHKGych8/mB6MMeVdNlBvgx424E4qhG+X4TR7tPIqBi6BPWIQR
	uhP0xyU5VHzFyEDAgNbuHz8+wYrjgmtXnImvY8F8f+Uh9ipDyPD4qRauJbk5nJD+p9OFoF3eeP2
	oP3W4EIdz4veeCOp1joD/xSYvGaIuxepdBp1n5TDrWzK4VOaRuOJ3KG1kOb2KV4qhEifmPr2fxK
	CtT53b6AO+WSz20ZLnADgAIQO3DQMqQvP7JIr1iA
X-Google-Smtp-Source: AGHT+IGZk7PlsdCZr/j/ecR8nUYCM0KRmxVw7bgRrpwVPA2oV8otwvEl5YVA/3glGzlDDrcVC80bqA==
X-Received: by 2002:a05:6a00:114a:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73fd9047c3fmr18100251b3a.20.1745850694197;
        Mon, 28 Apr 2025 07:31:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a995sm8016677b3a.112.2025.04.28.07.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:31:33 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6E52850790E2; Mon, 28 Apr 2025 21:31:31 +0700 (WIB)
Date: Mon, 28 Apr 2025 21:31:31 +0700
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
Subject: Re: [PATCH v2 15/22] Documentation: userspace-api: iommufd: Update
 vCMDQ
Message-ID: <aA-RQwyTS1m4CuPw@archie.me>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <820dfdee121292fe4cf891feb86f82ceea521e22.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vD4TXIxpca4CWbLZ"
Content-Disposition: inline
In-Reply-To: <820dfdee121292fe4cf891feb86f82ceea521e22.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_153138_399148_A4AE6288 
X-CRM114-Status: GOOD (  14.64  )
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


--vD4TXIxpca4CWbLZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 10:58:10PM -0700, Nicolin Chen wrote:
> +- IOMMUFD_OBJ_VCMDQ, representing a hardware queue as a subset of a vIOM=
MU's
> +  virtualization feature for a VM to directly execute guest-issued comma=
nds to
> +  invalidate HW cache entries holding the mappings or translations of a =
guest-
> +  owned stage-1 page table. Along with this queue object, iommufd provid=
es the
> +  user space an mmap interface for VMM to mmap a physical MMIO region fr=
om the
> +  host physical address space to a guest physical address space, to excl=
usively
> +  control the allocated vCMDQ HW. Thus, when allocating a vCMDQ, the VMM=
 must
> +  request a pair of VMA info (vm_pgoff/size) for a later mmap call. The =
length
> +  argument of an mmap call could be smaller than the given size for a pa=
ritial
> +  mmap, but the given vm_pgoff (as the addr argument of the mmap call) s=
hould
"... partial mmap, ..."
> +  never be offsetted, which also implies that the mmap will always start=
 from
> +  the beginning of the physical MMIO region.
> +
=20
Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--vD4TXIxpca4CWbLZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaA+RQwAKCRD2uYlJVVFO
o1eFAQCh6j1PsCslXzfPWuS46AzQ1o7ZR1WP481iUjIyZLhY3QEAixFoHFuftiEx
UNcaIuEJ2lZEhZxTyJA7ccrRXFyIfQo=
=VsW/
-----END PGP SIGNATURE-----

--vD4TXIxpca4CWbLZ--

