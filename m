Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ABDCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8sUBfafw2Pj9EymRiq/FhdwejfERXJ10a/GvuYzdzRI=; b=J3reRmkPJyJmNhSbACxiuodZDD
	mBTWVrfdW4+e4uOkFTxbBoMvhnKmsw8vpi828DqrYt8EITf3Z41qzvXwJRxRizjK+yTjF9PqgWUVN
	//CoKbT7dujhQ1xYUQ6RVNWN5pKzQVT1cGoAqphy2NL1OejWQksNiyY6j9TyXSVWM6GH8aHBbZi4Y
	fAPthuQFaUMzdUz08qetfyPG87FOkU8/U6n5RecDz9q3gvevKjbnQ0UqXDTMYKN9PacvJ7wLCUZIn
	BglYrgBFuJeab9MMAniYsCPVF6GXl3bAMv1xUX+Eb+7rldGUYA7nhaQKGEBHwbm9Cw2iwz0q9H1L7
	LyFBJk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3Y0-00000001ULv-0dz2;
	Wed, 13 May 2026 06:58:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3Xy-00000001ULl-3gIF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 06:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CFA360123;
	Wed, 13 May 2026 06:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BA1C2BCB7;
	Wed, 13 May 2026 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778655501;
	bh=Cn5v4bqW2/MsQLPq1DIp33JPKtjj5gaVBtJoJzvhChs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cOOFdvsNl3OndujbTuhwNoJBiADkICPpCGyTWNadteVnRecN73jOP+LElpuvZMISD
	 6/W8mf1WLGUty7vrqpl/5SvsvEfFQfQOa/7GUfi5UoJKTcw4yC8dR3zm6+Ib6cTaxZ
	 nq654nlbKcktjKAGHROJY6Lpmv9BShPntMqFt0xD5Kg6NX2i6m9AibTTK0oYYbFSe3
	 l0PY2RB8YZiVXnzQqcR8c+RJuUgwpCRCHq81e1l3bkNkyIb9UBnHn0pO2iMDUMHmyR
	 OP9wMhlM7lN3EQ24WAjdRVJs+aWEQr9xSCDA4fCM/t9J2o/roiQ68TyKFSmsYZh8GD
	 L01zb+Uhi2eKg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
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
In-Reply-To: <agM7VmoQ--ylUmyM@arm.com>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
 <agM7VmoQ--ylUmyM@arm.com>
Date: Wed, 13 May 2026 12:28:12 +0530
Message-ID: <yq5a7bp7u77f.fsf@kernel.org>
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> + Suzuki again
>
> On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The SMCCC firmware driver now creates the `arm-smccc` platform device
>> and also creates the CCA auxiliary devices once the RSI ABI is
>> discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
>> helper redundant. Remove the arm-cca-dev platform device registration
>> and let the SMCCC probe manage the RSI device.
>>=20
>> systemd match on platform:arm-cca-dev for confidential vm detection [1].
>> Losing the platform device registration can break that. Keeping this
>> removal in its own change makes it easy to revert if that regression
>> blocks the rollout.
>>=20
>> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm=
.com
>
> I wouldn't merge this now given that systemd checks this file. Could we
> have a symbolic link instead for some time until systemd eventually gets
> updated (years?).
>

I=E2=80=99ll add this in the next revision.

static int create_rsi_compat_link(struct device *target_dev)
{
	struct kobject *platform_kobj;
	/*
	 * target_dev is:
	 * /sys/devices/platform/arm-smccc/arm_cca_guest.arm-rsi-dev.0
	 * Create compat link /sys/devices/platform/arm-cca-dev
	 */
	platform_kobj =3D target_dev->kobj.parent->parent;

	return sysfs_create_link(platform_kobj,
				 &target_dev->kobj,
				 "arm-cca-dev");
}

-aneesh

