Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C815CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8Ocn4nwTRhFMkjQTMAnp8QwG3RynslSzTJA+aoMMG8=; b=gY+5iajqVuNDXkUgMke0gHkQB7
	uuw6uxVQdEAcfGJ2qSnrLeEZ/7Df1RZlNAjWtB33f3MvFYBHKu47yXoqVejnLIBG2sGV/uzequzTk
	MlUDr7ftJxvV7SLsHM2B3bloCRqKElpjc7gacP8/JSg/on+5X2e61MoZaEliLwWy0v4DtCayJU2Yx
	1+NfEYaNrBT4/Wh4SByBiWcLJ0s7yIZ3JEJfZt8Pvx0T6BNwykodG57IrUxxzk5ikR/1HPqf76gDj
	SoXOxNd3VY0pSoOWF9ZL29hH1BCK+FqSBgI2uYc3R2MLI452KZpBgvI0FQpTDLO0fdDReS8WxsN9t
	EAY20N0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5L5-00000001oPC-2B5X;
	Wed, 13 May 2026 08:53:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5L4-00000001oOq-1EOj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97D56600CB;
	Wed, 13 May 2026 08:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35477C2BCB7;
	Wed, 13 May 2026 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778662389;
	bh=vO2Fq6n7DMfc4owJztYq4f21UxNQ3yHxFKI4nhD0l6g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ihk647Q6Z+znMSZqQNrJ9GSxCrIzUL2H+uKMZ75jjuImKW+uYTPsSMbowS7zyr776
	 cdY13jsSyBYIt5eQGjSqQXL/BUdAx/ZcHFa55g9sIBfkUapvPhYtbx/uL9ktd2y7dy
	 DbJM/6IdzBYa4tyR+adRFhRsQrthR5aocBEtPklEZEOfEsNiqQeQ/xQaP84peePQVH
	 16IgJTQLJNsCxjQYkLt6G+qCVp9fdxNHnfksny07l3AfH9URzTMFvpRIt+yOzFufqV
	 fX/Lx4WloXyuOjjZ7nMHnfA++zdiO4ZXFpLzRpQeLMKnYMntm4X5mFWNS64AqupWkD
	 RG1U+BM3+7KRA==
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
In-Reply-To: <2026051352-albatross-contents-7113@gregkh>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
 <agM7VmoQ--ylUmyM@arm.com> <yq5a7bp7u77f.fsf@kernel.org>
 <2026051352-albatross-contents-7113@gregkh>
Date: Wed, 13 May 2026 14:23:01 +0530
Message-ID: <yq5a4ikbu1w2.fsf@kernel.org>
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

> On Wed, May 13, 2026 at 12:28:12PM +0530, Aneesh Kumar K.V wrote:
>> Catalin Marinas <catalin.marinas@arm.com> writes:
>>=20
>> > + Suzuki again
>> >
>> > On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> >> The SMCCC firmware driver now creates the `arm-smccc` platform device
>> >> and also creates the CCA auxiliary devices once the RSI ABI is
>> >> discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
>> >> helper redundant. Remove the arm-cca-dev platform device registration
>> >> and let the SMCCC probe manage the RSI device.
>> >>=20
>> >> systemd match on platform:arm-cca-dev for confidential vm detection [=
1].
>> >> Losing the platform device registration can break that. Keeping this
>> >> removal in its own change makes it easy to revert if that regression
>> >> blocks the rollout.
>> >>=20
>> >> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@=
arm.com
>> >
>> > I wouldn't merge this now given that systemd checks this file. Could we
>> > have a symbolic link instead for some time until systemd eventually ge=
ts
>> > updated (years?).
>> >
>>=20
>> I=E2=80=99ll add this in the next revision.
>>=20
>> static int create_rsi_compat_link(struct device *target_dev)
>> {
>> 	struct kobject *platform_kobj;
>> 	/*
>> 	 * target_dev is:
>> 	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
>> 	 * Create compat link /sys/devices/platform/arm-cca-dev
>> 	 */
>> 	platform_kobj =3D target_dev->kobj.parent->parent;
>
> What?  That is crazy, you don't know that is always going to be ok.
>
>> 	return sysfs_create_link(platform_kobj,
>> 				 &target_dev->kobj,
>> 				 "arm-cca-dev");
>
> No, don't do that, if a driver calls a sysfs* function, something is
> almost always wrong.  Don't be making random sysfs symlinks please.
>

Sure, but could you explain why this is wrong? Below is the full version
of the updated patch.

coco: guest: arm64 Replace RSI platform device with compat symlink

The SMCCC firmware driver now creates the arm-smccc platform device and
registers the RSI device as an auxiliary device once the RSI ABI has been
discovered. This makes the arch-specific arm64 arm-cca-dev platform device
redundant.

Remove the arm64 platform device stub and let the SMCCC core manage RSI
device creation.

This changes the real device location from the old platform device path to:

  /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0

Keep userspace compatibility by creating a sysfs symlink at the old path:

  /sys/devices/platform/arm-cca-dev

A Debian Code Search check found systemd matching on the old
platform:arm-cca-dev device path for confidential VM detection. No other
userspace dependency on the old platform device path was found, but keeping
the compatibility symlink avoids breaking existing systemd-based detection
[1].

[1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

modified   arch/arm64/kernel/rsi.c
@@ -159,18 +159,3 @@ void __init arm64_rsi_init(void)
=20
 	static_branch_enable(&rsi_present);
 }
-
-static struct platform_device rsi_dev =3D {
-	.name =3D "arm-cca-dev",
-	.id =3D PLATFORM_DEVID_NONE
-};
-
-static int __init arm64_create_dummy_rsi_dev(void)
-{
-	if (is_realm_world() &&
-	    platform_device_register(&rsi_dev))
-		pr_err("failed to register rsi platform device\n");
-	return 0;
-}
-
-arch_initcall(arm64_create_dummy_rsi_dev)
modified   drivers/firmware/smccc/rmm.c
@@ -4,13 +4,31 @@
  */
=20
 #include <linux/auxiliary_bus.h>
+#include <linux/sysfs.h>
+#include <linux/device.h>
=20
 #include "rmm.h"
=20
+static int create_rsi_compat_link(struct device *target_dev)
+{
+	struct kobject *platform_kobj;
+	/*
+	 * target_dev is:
+	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
+	 * Create compat link /sys/devices/platform/arm-cca-dev
+	 */
+	platform_kobj =3D target_dev->kobj.parent->parent;
+
+	return sysfs_create_link(platform_kobj,
+				 &target_dev->kobj,
+				 "arm-cca-dev");
+}
+
 void __init register_rsi_device(struct platform_device *pdev)
 {
 	unsigned long ret;
 	unsigned long ver_lower, ver_higher;
+	struct auxiliary_device *adev;
=20
 	if (arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT_SMC)
 		return;
@@ -19,6 +37,10 @@ void __init register_rsi_device(struct platform_device *=
pdev)
 	if (ret !=3D RSI_SUCCESS)
 		return;
=20
-	__devm_auxiliary_device_create(&pdev->dev,
-				       "arm_cca_guest", RSI_DEV_NAME, NULL, 0);
+	adev =3D __devm_auxiliary_device_create(&pdev->dev,
+				"arm_cca_guest", RSI_DEV_NAME, NULL, 0);
+	if (!adev)
+		return;
+
+	create_rsi_compat_link(&adev->dev);
 }


>
> If userspace can not find the device anymore, that's fine, that's how
> sysfs works, devices move around all the time.  Especially platform
> devices as those are almost always not supposed to be platform devices :)
>
> thanks,
>
> greg k-h


-aneesh

