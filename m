Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC2ACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JVIGqxXEZ/xEgEjDKATsUBMS7BB/DuZHqhbZawd+cI=; b=G0W0wGbhqWvxTa4oJSF1gWvlKQ
	UECsObOQrPz4u39wQbLwDJZMwBkIiIGZkyB8OhtNZ4DbZpAfp/E+cynyzSCzFYqm9mieUKTegePyu
	p9t/KAyZH0KYVZ5xS5gjnvXVUtQBE/szKKas46uhVu6ToDnmBa4W7ukVt0ly+ZOpqI/R2K+CvFGkr
	SCFV7qK4RxC88gWLiQzrRPjA3k2W/3dZBR2T5uduLNnKNWR5awTBFKbN7GcQiU2eo++iuEmadTlcw
	cvhHXS4xZEJLqxPG7bhRie7cBsXQgbsLp8PbZYpJ6y/FXKhJAatblQa9aYL8uAYS4PzwBBgDhrp+I
	YzBi1Q5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCq1-00000003Guh-1APc;
	Wed, 13 May 2026 16:53:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCpz-00000003GuC-1xYl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:53:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CE33600AE;
	Wed, 13 May 2026 16:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02F4C19425;
	Wed, 13 May 2026 16:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778691214;
	bh=CSIDh0xWijcRoNScDTG4wflgc8+1KSMZAlni6K3Isks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BluXs2Dnd1E4eDJlDmiCY2pHZcAERGmV3RjzUbgePSLGOsaxB3Eqw/in6kvMPSxly
	 1UPS1PlEPrhrV9bCtEsrHCvI8/HF629nzmc8xpdTP/JqglSA282MQN8GVhAsRzEcXF
	 194OAu8GsbgXnaL7mUHj8Sm9XtZ/kNLuKy2yQBcHGcNBW/YHQL0YHjjL2clegc0vbl
	 ENVPwhH4OhBJIH1SeOV0H6hItRDpGQkjNvJrn8+q4q5uzluiFggKZ0zYTpClYU23fA
	 lVpzflZJpaLR5EloVOTz7CFcf41I/L+l81+f5AxmMMkhllCDQLb0qVa1hTElRh5y2F
	 2s0yYfAuPFKOw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 2/2] coco: guest: arm64: Drop dummy RSI platform
 device stub
In-Reply-To: <2026051316-confidant-turtle-1e84@gregkh>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
 <agM7VmoQ--ylUmyM@arm.com> <yq5a7bp7u77f.fsf@kernel.org>
 <2026051352-albatross-contents-7113@gregkh> <yq5a4ikbu1w2.fsf@kernel.org>
 <2026051316-confidant-turtle-1e84@gregkh>
Date: Wed, 13 May 2026 22:23:24 +0530
Message-ID: <yq5awlx7s12z.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Greg KH <gregkh@linuxfoundation.org> writes:

> On Wed, May 13, 2026 at 02:23:01PM +0530, Aneesh Kumar K.V wrote:
>> Greg KH <gregkh@linuxfoundation.org> writes:
>>=20
>> > On Wed, May 13, 2026 at 12:28:12PM +0530, Aneesh Kumar K.V wrote:
>> >> Catalin Marinas <catalin.marinas@arm.com> writes:
>> >>=20
>> >> > + Suzuki again
>> >> >
>> >> > On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wr=
ote:
>> >> >> The SMCCC firmware driver now creates the `arm-smccc` platform dev=
ice
>> >> >> and also creates the CCA auxiliary devices once the RSI ABI is
>> >> >> discovered. This makes the arch-specific arm64_create_dummy_rsi_de=
v()
>> >> >> helper redundant. Remove the arm-cca-dev platform device registrat=
ion
>> >> >> and let the SMCCC probe manage the RSI device.
>> >> >>=20
>> >> >> systemd match on platform:arm-cca-dev for confidential vm detectio=
n [1].
>> >> >> Losing the platform device registration can break that. Keeping th=
is
>> >> >> removal in its own change makes it easy to revert if that regressi=
on
>> >> >> blocks the rollout.
>> >> >>=20
>> >> >> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683=
cf@arm.com
>> >> >
>> >> > I wouldn't merge this now given that systemd checks this file. Coul=
d we
>> >> > have a symbolic link instead for some time until systemd eventually=
 gets
>> >> > updated (years?).
>> >> >
>> >>=20
>> >> I=E2=80=99ll add this in the next revision.
>> >>=20
>> >> static int create_rsi_compat_link(struct device *target_dev)
>> >> {
>> >> 	struct kobject *platform_kobj;
>> >> 	/*
>> >> 	 * target_dev is:
>> >> 	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
>> >> 	 * Create compat link /sys/devices/platform/arm-cca-dev
>> >> 	 */
>> >> 	platform_kobj =3D target_dev->kobj.parent->parent;
>> >
>> > What?  That is crazy, you don't know that is always going to be ok.
>> >
>> >> 	return sysfs_create_link(platform_kobj,
>> >> 				 &target_dev->kobj,
>> >> 				 "arm-cca-dev");
>> >
>> > No, don't do that, if a driver calls a sysfs* function, something is
>> > almost always wrong.  Don't be making random sysfs symlinks please.
>> >
>>=20
>> Sure, but could you explain why this is wrong? Below is the full version
>> of the updated patch.
>>=20
>> coco: guest: arm64 Replace RSI platform device with compat symlink
>>=20
>> The SMCCC firmware driver now creates the arm-smccc platform device and
>> registers the RSI device as an auxiliary device once the RSI ABI has been
>> discovered. This makes the arch-specific arm64 arm-cca-dev platform devi=
ce
>> redundant.
>>=20
>> Remove the arm64 platform device stub and let the SMCCC core manage RSI
>> device creation.
>>=20
>> This changes the real device location from the old platform device path =
to:
>>=20
>>   /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
>>=20
>> Keep userspace compatibility by creating a sysfs symlink at the old path:
>>=20
>>   /sys/devices/platform/arm-cca-dev
>>=20
>> A Debian Code Search check found systemd matching on the old
>> platform:arm-cca-dev device path for confidential VM detection. No other
>> userspace dependency on the old platform device path was found, but keep=
ing
>> the compatibility symlink avoids breaking existing systemd-based detecti=
on
>> [1].
>>=20
>> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm=
.com
>
> Don't attempt to put symlinks between random devices in sysfs, that way
> lies madness and you will never get anything fixed.
>
> Just fix userspace, it shouldn't have hard-coded a device path in the
> first place, and you are thinking it would now use a different
> hard-coded device path?  Please do this properly.
>
> Again, there should never be any hard-coded device paths, they are free
> to move around and be renamed at any time.  Use the correct apis instead
> (walking all bus devices, looking at userspace attributes of classes,
> etc.)
>
> So your patch is ok, if you remove the symlink stuff.
>

How about adding /sys/firmware/cca/realm_guest? This would be similar to
/sys/firmware/uv/prot_virt_guest, which is provided on s390.

-aneesh

