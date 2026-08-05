Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A19C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 09:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Um0FVaYNGuVA/zd9PefOAnqCJkiA3pKRm10xwwEqyB0=; b=2RTohQDenock3sER27KP94H8cS
	bkWtixmPgpgcqHOU+7rTWIgsTwH1EW2TrXFAITOMBaWwTvTsIVP7aR0JhPcOT5ffkRdiBst6HiNZj
	0qA2gY0caQsF7aQBvBElGlAIaesVNmp0+wyb/306hqDRTHohlA/HMkRKSvhTH6kTUt7RScqOZhiED
	Xl6nnsRAzvmlp9wgwEiR4b6yGpdIhcCZIsq5vE66MzfRr8uc93whHAg3afOa1MbhN2GpJv/WWc6rp
	sCmv2d2XM9c3WlZv0uHo/GvpkhRNI8gVwRVhjAs+Cz4Ukfnbt2ZS2244uViEthuBMC2+SjpP73K4m
	hKAt3Z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYIA-00000003fPq-1SQk;
	Wed, 05 Aug 2026 09:52:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYI7-00000003fO4-09iL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 09:52:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC50E153B;
	Wed,  5 Aug 2026 02:51:57 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59393F66F;
	Wed,  5 Aug 2026 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785923521; bh=FppMoqQb3BS4Kf1KNqMwfV4k8nOttVFmvr6G6hrRElA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kYbB2UOAtU/w+8T0WUapazRtMn6GjaxxiWPzKTHqDxwl79u9u7ObSXVPAad5G2uSJ
	 todOdUjAG4zwFnnP0uj/RyEzw63v0bh1H5qXpNsDPIx+FpKzHavx6yjnKGQ7ggACrM
	 r7WF6wYRUTfUutcGeOh2p8HMq1pySbmJTWswVlwA=
Date: Wed, 5 Aug 2026 10:51:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 0/7] Switch Arm SMCCC firmware services to an SMCCC bus
Message-ID: <anMHs65s6Mk-ZRdT@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_025203_132244_62D28582 
X-CRM114-Status: GOOD (  10.25  )
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

On Wed, Aug 05, 2026 at 12:02:48PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Changes from v8:
> https://lore.kernel.org/all/20260707081351.1680209-1-aneesh.kumar@kernel.org
> * Rebase onto the arm64 for-next/core branch.

Was there a dependency on anything in for-next/core? We normally apply
series on their own branch on top of the vanilla kernel (e.g. 7.2-rc3)
and merge everything together in for-next/core. We (and many other
maintainers) strongly prefer series posted on top of an -rc kernel
(typically -rc1 to -rc3) unless there's a dependency on a different
branch. Never based on -next or -next like branches (which is what
for-next/core is, as the name implies).

> * Move the RSI code from arch/arm64 to drivers/firmware/arm_rmm in patch 3.

Thanks for this.

-- 
Catalin

