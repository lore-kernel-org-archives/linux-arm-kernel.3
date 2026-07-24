Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9488C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv5tWqGLGkHnf04eMqxVT5ugoOpACtQyu5RJWX4G6Hs=; b=acyFcMDYclfCadnLNz4W7nn/Qk
	IbseaqBKT1PEP/1evlEV5jfvfhc2uWr6sO9pGbMkT+8/fH+hQMMbJg+ici7vH5CpvYsW0x23XuNq3
	5cIPHZsAFsEEgHsv/O2QjRtwkcvBlCQYh1ichmme9beEwVE9k6ac5ARIcel2fRExiIVSdUtY5EO2m
	yCxBF/3Er7hN5VThwx9WRUyMqjFmHpTlx2kHvdUFwM9rESLXF63LY9OMOqhYff5hlSqG4pjHFWUPt
	3NUZPUkMjaWoyvfJuyIRgQ6N7kRDRVOzX0Tap5xQupFdj9iFw3j6rBotVUbMGOSi4ikFR+ccWDkQw
	jHgYG2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFO6-0000000GQW1-42F2;
	Fri, 24 Jul 2026 12:52:26 +0000
Received: from mail-wr2-x00.google.com ([2a00:1450:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFO4-0000000GQVJ-1Tbt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:52:25 +0000
Received: by mail-wr2-x00.google.com with SMTP id ffacd0b85a97d-473913157edso205271f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784897542; x=1785502342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mv5tWqGLGkHnf04eMqxVT5ugoOpACtQyu5RJWX4G6Hs=;
        b=CgLP24JxkvQquvgXaAhA9DwUkixkrHE5cofqwGUMTjazd6wC31qtrAJaE4VbTCMTuv
         GkBj23K1ShUG9giq0ObbiSy9ov8b1z8HKrN8PHeYlcrHI6dwXCS1WLxaIcpnd0PNv5le
         6f2OkKpWQIIpQ00//sv39Gs3/QpzoxtOiu1fikLrb0wwwOVFcaDxwcWBZCf3P3Tyj7+u
         c7z+I6gFEpiLFu0NG1o8EeEw/LhZsrQesDqNalzUWcY0OeI7QQJreNhnrQOC/6OZnEP1
         X9WUQtvRyKJtkZw5CmclAyIXoAPFllaA+Bpld9Erb+CDKb2bAWM3V5S3/T/5/a5GyGEP
         x9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784897542; x=1785502342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mv5tWqGLGkHnf04eMqxVT5ugoOpACtQyu5RJWX4G6Hs=;
        b=RL5UvketgNEXnP+qk+HBBCpmYtVzfn2aOQ8Vn4SHFIxY8TkMzjIumBGUzTDKsswFhM
         RYL38C1b50mYFy5EgQ6I3Bgf16RhNCxMoowRefgEiKXXoQxe1AIseM1sE1f/WB4PVI74
         2Hru/F/hx0bR3e3pGBpvqmmP70NLZW+zKfro47GvzcBcEuucc5eDC91WOkKOwB8uplt2
         HjDysQuCopnQwZC+pDzEpuSt0sM2/mJuM+cY1PMs2jEEjRroyr4+Qv4DltyFzhryYQM7
         ijqUNLnWTN3vPRwz0i1R+V6j41FXmPG71qDPdDxfu+B0hwz1hEcFS6tWq5xOoQG92tQz
         8kng==
X-Gm-Message-State: AOJu0Yy2cvVbG/JzGXkMv36ky0D38dmSND9hN/xX10L9dKr2WnYlOeF7
	NTNpX4PHOdKgXFoCHjIIMTG2THJmKllb9e8qvVeT+Alzm9f0s1WMjkIfboc5EIIl4DA=
X-Gm-Gg: AR+sD10S4zpF/5ehC4lvxwFCMbwjAJyw2ykIS9CVCx5KNwtLsq3ubL5PkGpO3LakuP4
	q1VRYlMnMELk5G5rp7kCcKR7pkbXR3jU2X4i9TUoJmIITmPuINOMsCxO3qHsrybx3q/fCrNFzlQ
	pu/I6otbM+CIfDBuKPtahuPsWz15/ngmc01ZCTo31Yfh4G/sAymVxDjHmLUf0axLzSf15MmoSaH
	9WQUi/E+7u7/HVGrJrBmbk7ytTlLsWJl9IMNTYMFzuJdc13YrR6EPLhZxJNkZJWch1P4556ibEu
	rJ3BPcCa9HKBrF+QJteahRDbNct9uQMOsu5NzDXoLJLycndU1+gHn9QW2MOFywJBwp8nmWMMeeo
	okpAmAFEI11VIqTJ0ioy1dcH6zIXnLK/6Qv+3b2eME5yff+lIr/rHnFnNIBI1ipk2e4seYqhZvK
	dRnfqqcg==
X-Received: by 2002:a05:6000:2287:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-47f8d77c2dbmr9048250f8f.20.1784897541667;
        Fri, 24 Jul 2026 05:52:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm23383475f8f.28.2026.07.24.05.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:52:21 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:52:19 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, cgroups@vger.kernel.org, linux-coco@lists.linux.dev, 
	Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH v1 2/2] cgroup/misc: Add support for Arm CCA MECIDs
Message-ID: <amNfGkkI5OIBqpmZ@localhost.localdomain>
References: <20260724094120.166536-1-enju.kohei@fujitsu.com>
 <20260724094120.166536-3-enju.kohei@fujitsu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ax7rchmwlrf277f6"
Content-Disposition: inline
In-Reply-To: <20260724094120.166536-3-enju.kohei@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_055224_405485_26C00C06 
X-CRM114-Status: GOOD (  16.10  )
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


--ax7rchmwlrf277f6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH v1 2/2] cgroup/misc: Add support for Arm CCA MECIDs
MIME-Version: 1.0

Hello Kohei.

On Fri, Jul 24, 2026 at 06:40:56PM +0900, Kohei Enju <enju.kohei@fujitsu.co=
m> wrote:
> Arm CCA MECIDs are limited platform resources. Add a misc cgroup
> resource to allow the system administrator to account for and limit
> their use.
>=20
> The cca_mec resource represents the number of Realm VMs using the
> private MEC policy. Each such Realm consumes one MECID. Charge the
> resource when the Realm is created, and uncharge it when the Realm is
> successfully destroyed.
>=20
> Realms using the shared MEC policy don't consume this resource.
>=20
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
> ---
>  arch/arm64/include/asm/kvm_rmi.h |  2 ++
>  arch/arm64/kvm/rmi.c             | 44 +++++++++++++++++++++++++++++++-
>  drivers/firmware/arm_rmm/rmi.c   |  4 +++

(mainly for this)
>  include/linux/misc_cgroup.h      |  4 +++
>  kernel/cgroup/misc.c             |  4 +++
>  5 files changed, 57 insertions(+), 1 deletion(-)

Conditional
Acked-by: Michal Koutn=FD <mkoutny@suse.com>
(it makes sense along the other arches' miscresurces)

Why? I see this [1] (or followup) needs to be added first.

Thanks,
Michal

[1] https://lore.kernel.org/r/20260715142739.80398-4-steven.price@arm.com/

--ax7rchmwlrf277f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamNf+xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AhXYAD/aF4cHB3u4Ztw+Epfxt6r
owvtGiLz50NxCjHVwV+x/xAA/jW6M8nVIZ5COXi3AcXAaZ9Jg4Hbfex1q/uwG0FV
VjUH
=szup
-----END PGP SIGNATURE-----

--ax7rchmwlrf277f6--

