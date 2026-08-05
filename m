Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9FEC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHqTPpoy4PlrSjK5plmGj+ERzLd4Tg5Z8i+fDM3t4Tg=; b=klpem/if7q4Hyrj0BeInEraffI
	4UR9WSeFpZW9uSBDHHeLKkxaGCR7eQv77i0Qe5YxLSJLz8xeIgwrmzXiG12eXaq2dGHvrdvfoX0Ph
	L8RiIUu1FcHXDQJaJ2VQl/hIrUFgKD6aklStcuGMxcdluV4+sg0rBL5OBkjHGMKVGcuNVjTFDd7Zw
	j6dGRgPeZMmqYkR+VBaS3qC/lp3BvYaOmaSMWgV10pEySWBpcG77kU6aI76z3eE+yiWwJZjPvMXS3
	F/znO87hZwvqI1wJg7bjb0uV0OvA6woNUP6jn4R2Ct0292KzsZngzzXby2Lr5DkgLFVRi3jieaVpM
	H5Nrp8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wradf-00000003tfq-0xlB;
	Wed, 05 Aug 2026 12:22:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrade-00000003tfg-2r79
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:22:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C28636011F;
	Wed,  5 Aug 2026 12:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0D81F000E9;
	Wed,  5 Aug 2026 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785932545;
	bh=OHqTPpoy4PlrSjK5plmGj+ERzLd4Tg5Z8i+fDM3t4Tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=d6OiclPvJS/21qaE6HRFu5Cd9pppTVz8Z7gq3bGnzkapMrP4+qwNgwAEUDUZF3CsB
	 elSFTEmNXwLrS/m5A9zKH2TtagQ6Jj5nGFSSyMLAKYDos1qwOEcFfMwRn8og1htpMO
	 88cbECxUyTntBhcbLFpUwjrzFlLJY3x/3EyHDEq25vdvr/nFilqdN6PcqeznXFjNF3
	 gd28hdU0y+C3+sdx4bo2GYv2Ybcp2wrDXdq9btP50HNeyK7yy/KQBhOxfeN8Kzug2I
	 5VVU53QIBho1A2kTD1D3R0g0tz82ZILCqC1O9SaguLJUWkoVzwdkBKTtyiO/DjDoKo
	 uw6fQESbB5xXA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
In-Reply-To: <anMHs65s6Mk-ZRdT@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <anMHs65s6Mk-ZRdT@arm.com>
Date: Wed, 05 Aug 2026 17:52:17 +0530
Message-ID: <yq5awlu43gg6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

> On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Changes from v8:
>> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
>> * Rebase onto the arm64 for-next/core branch.
>
> Was there a dependency on anything in for-next/core? We normally apply
> series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
> and merge everything together in for-next/core. We (and many other
> maintainers) strongly prefer series posted on top of an -rc kernel
> (typically -rc1 to -rc3) unless there's a dependency on a different
> branch. Never based on -next or -next like branches (which is what
> for-next/core is, as the name implies).
>

The reason is that these two patches create conflicts. Since this series
involves file movement, resolving those conflicts was not
straightforward. Therefore, I rebased the series on top of both of the
following commits:

commit 24f55f511b9e ("virt: arm-cca-guest: use migrate_disable() for attestation token requests")
commit e62decaf98e7 ("arm64/coco: Add pKVM as a CC platform")

-aneesh

