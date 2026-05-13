Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC2CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEDRe/xC/gPc24D+Kj1YaUyDaZbKSvYBwdYalmYN/BA=; b=4WOaCqgnJzUT1uNyz5QT29sHgx
	Qm1wtGI8l3l6YT4dL4TtPHls5JtSoX2ypQcneSEzYzWSybwqTmhjnDpJZ2amcR5Wp1zDYfNX4YcxG
	02kSdCFfL0Ulj5Vc1Ohq/wj7/sjNZdKSZyqbdIMkndPsVcTXTH1hX+4tXo0v1fsgSura8RSzTIRK/
	LX3B1D/5gcIRjzrttXXFg0cn3K0P5iiXcZnSb1QWjuBPcaMuvSPGmME6S6lU2tqeEOKCgFUtULrum
	41aJo1r+AyHVeOKiqK3AXsRluvYimUBCkZtAb2aF5pZ4+3s76O8MMF19rqL5zH1qEGE3A1ppfxc6p
	usPeaCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6FQ-00000001zUm-1Lz1;
	Wed, 13 May 2026 09:51:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6FN-00000001zTy-1vXP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 806DA43BA6;
	Wed, 13 May 2026 09:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38152C2BCB7;
	Wed, 13 May 2026 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778665880;
	bh=sqWUPzpRP4PII6LWHef9S7DmiWrMfjXIWacy6KIrHew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GX73eICGy1Ri9uocWlivZ8Px9qGDYrPBKaSf2s7DdV2g3MbsLcGWV67MmSIgGb45K
	 m5ayHurz0+d2nMlZToxkUqAHdu4sXCcFVp3jpwSPlwZU82tClOMwFb46fPQ4g43/FE
	 TkXdCFpRR14glId4QdLJf5xPPI08MFY5kAO/xWLbXh6/CaPguc8Yh7FiVAxiQU00a4
	 ioiyKm4LvPhT7yNQfYYROK2C7wwo0yGyKM3+y/XHnRDf7GAQlZbAoxfD0hPJoPS3Qv
	 HWUwr3ljU6jP0wwnbaPzU5+VAXAL9bMgmeBEBs2wHSLEfqWePf8mTFyU3wgwiAcsee
	 qIDGUeVnlPLHQ==
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
In-Reply-To: <yq5a4ikbu1w2.fsf@kernel.org>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
 <agM7VmoQ--ylUmyM@arm.com> <yq5a7bp7u77f.fsf@kernel.org>
 <2026051352-albatross-contents-7113@gregkh> <yq5a4ikbu1w2.fsf@kernel.org>
Date: Wed, 13 May 2026 15:21:12 +0530
Message-ID: <yq5azf23skmn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_025122_126036_0B44FA45 
X-CRM114-Status: GOOD (  31.08  )
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

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:

> Greg KH <gregkh@linuxfoundation.org> writes:
>
>> On Wed, May 13, 2026 at 12:28:12PM +0530, Aneesh Kumar K.V wrote:
>>> Catalin Marinas <catalin.marinas@arm.com> writes:
>>>=20
>>> > + Suzuki again
>>> >
>>> > On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wrot=
e:
>>> >> The SMCCC firmware driver now creates the `arm-smccc` platform device
>>> >> and also creates the CCA auxiliary devices once the RSI ABI is
>>> >> discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
>>> >> helper redundant. Remove the arm-cca-dev platform device registration
>>> >> and let the SMCCC probe manage the RSI device.
>>> >>=20
>>> >> systemd match on platform:arm-cca-dev for confidential vm detection =
[1].
>>> >> Losing the platform device registration can break that. Keeping this
>>> >> removal in its own change makes it easy to revert if that regression
>>> >> blocks the rollout.
>>> >>=20
>>> >> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf=
@arm.com
>>> >
>>> > I wouldn't merge this now given that systemd checks this file. Could =
we
>>> > have a symbolic link instead for some time until systemd eventually g=
ets
>>> > updated (years?).
>>> >
>>>=20
>>> I=E2=80=99ll add this in the next revision.
>>>=20
>>> static int create_rsi_compat_link(struct device *target_dev)
>>> {
>>> 	struct kobject *platform_kobj;
>>> 	/*
>>> 	 * target_dev is:
>>> 	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
>>> 	 * Create compat link /sys/devices/platform/arm-cca-dev
>>> 	 */
>>> 	platform_kobj =3D target_dev->kobj.parent->parent;
>>
>> What?  That is crazy, you don't know that is always going to be ok.
>>
>>> 	return sysfs_create_link(platform_kobj,
>>> 				 &target_dev->kobj,
>>> 				 "arm-cca-dev");
>>
>> No, don't do that, if a driver calls a sysfs* function, something is
>> almost always wrong.  Don't be making random sysfs symlinks please.
>>
>
> Sure, but could you explain why this is wrong? Below is the full version
> of the updated patch.
>
> coco: guest: arm64 Replace RSI platform device with compat symlink
>
> The SMCCC firmware driver now creates the arm-smccc platform device and
> registers the RSI device as an auxiliary device once the RSI ABI has been
> discovered. This makes the arch-specific arm64 arm-cca-dev platform device
> redundant.
>
> Remove the arm64 platform device stub and let the SMCCC core manage RSI
> device creation.
>
> This changes the real device location from the old platform device path t=
o:
>
>   /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
>
> Keep userspace compatibility by creating a sysfs symlink at the old path:
>
>   /sys/devices/platform/arm-cca-dev
>
> A Debian Code Search check found systemd matching on the old
> platform:arm-cca-dev device path for confidential VM detection. No other
> userspace dependency on the old platform device path was found, but keepi=
ng
> the compatibility symlink avoids breaking existing systemd-based detection
> [1].
>
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.=
com
>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> modified   arch/arm64/kernel/rsi.c
> @@ -159,18 +159,3 @@ void __init arm64_rsi_init(void)
>=20=20
>  	static_branch_enable(&rsi_present);
>  }
> -
> -static struct platform_device rsi_dev =3D {
> -	.name =3D "arm-cca-dev",
> -	.id =3D PLATFORM_DEVID_NONE
> -};
> -
> -static int __init arm64_create_dummy_rsi_dev(void)
> -{
> -	if (is_realm_world() &&
> -	    platform_device_register(&rsi_dev))
> -		pr_err("failed to register rsi platform device\n");
> -	return 0;
> -}
> -
> -arch_initcall(arm64_create_dummy_rsi_dev)
> modified   drivers/firmware/smccc/rmm.c
> @@ -4,13 +4,31 @@
>   */
>=20=20
>  #include <linux/auxiliary_bus.h>
> +#include <linux/sysfs.h>
> +#include <linux/device.h>
>=20=20
>  #include "rmm.h"
>=20=20
> +static int create_rsi_compat_link(struct device *target_dev)
> +{
> +	struct kobject *platform_kobj;
> +	/*
> +	 * target_dev is:
> +	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
> +	 * Create compat link /sys/devices/platform/arm-cca-dev
> +	 */
> +	platform_kobj =3D target_dev->kobj.parent->parent;
> +
> +	return sysfs_create_link(platform_kobj,
> +				 &target_dev->kobj,
> +				 "arm-cca-dev");
> +}
> +
>  void __init register_rsi_device(struct platform_device *pdev)
>  {
>  	unsigned long ret;
>  	unsigned long ver_lower, ver_higher;
> +	struct auxiliary_device *adev;
>=20=20
>  	if (arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT_SMC)
>  		return;
> @@ -19,6 +37,10 @@ void __init register_rsi_device(struct platform_device=
 *pdev)
>  	if (ret !=3D RSI_SUCCESS)
>  		return;
>=20=20
> -	__devm_auxiliary_device_create(&pdev->dev,
> -				       "arm_cca_guest", RSI_DEV_NAME, NULL, 0);
> +	adev =3D __devm_auxiliary_device_create(&pdev->dev,
> +				"arm_cca_guest", RSI_DEV_NAME, NULL, 0);
> +	if (!adev)
> +		return;
> +
> +	create_rsi_compat_link(&adev->dev);
>  }

To make this clear, the above implies that adev parent is a platform
device and hence target_dev->kobj.parent->parent should be platform
kobject?

>
>
>>
>> If userspace can not find the device anymore, that's fine, that's how
>> sysfs works, devices move around all the time.  Especially platform
>> devices as those are almost always not supposed to be platform devices :)
>>
>> thanks,
>>
>> greg k-h
>

-aneesh

