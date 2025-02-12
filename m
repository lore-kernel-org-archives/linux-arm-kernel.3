Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2E6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqbhkphDrNXMbC5XcyZfNLbZWTUaWRUr5NpWlSk47SQ=; b=IUbeTp2zfQxoVwGqcqC1ygZZMP
	ebXrTcHOM6Gm2X3DlqYBgIf0ReGCKlZz54deaj/9m1tt3hc6FxANXJ6DaAr+hEa3fHA3Panx1KAS8
	TuYx7gbefqs6VPBL+nm4qGmbMH5VWB3oIRlae1PSw+q4bMVVpogZjLMI2jfxPXDINlWUlGfTNAzVT
	DHr1HnarsGHkYqf6l0D15gCbfWfskO0+BYz/u8yHZ82t54sMdb+XVyEBzWmOychWukBql/ejiQa4O
	Jixa+2dB9EKpOvtWa3RX8gjDDo8BJ3fNWgQOMQ2MamU8kELGywxLWi+Oa1A7VnF9uGpbcmcQOov80
	KUbn909w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHzN-00000008ZZo-3Ixs;
	Wed, 12 Feb 2025 19:01:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHxw-00000008ZF6-45Nk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:00:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3CD812FC;
	Wed, 12 Feb 2025 11:00:28 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 732B63F58B;
	Wed, 12 Feb 2025 11:00:07 -0800 (PST)
Date: Wed, 12 Feb 2025 19:00:05 +0000
From: Leo Yan <leo.yan@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v19 11/11] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
Message-ID: <20250212190005.GD235556@e132581.arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-11-1c1300802385@kernel.org>
 <20250212185227.GC235556@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212185227.GC235556@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_110009_054930_92180388 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed, Feb 12, 2025 at 06:52:27PM +0000, Leo Yan wrote:

[...]

> > +static int brbinf_get_mispredict(u64 brbinf)
> > +{
> > +       return FIELD_GET(BRBINFx_EL1_MPRED_MASK, brbinf);
> > +}
> 
> I would expect the naming of brbinf_get_mispredict() will cause
> confusion.  When the function returns 1, it means "Branch was
> incorrectly predicted".
> 
> Maybe consider to use '!FIELD_GET(...)' for a reversed value?

Please ignore this comment. Sorry for my misreading and noise.

