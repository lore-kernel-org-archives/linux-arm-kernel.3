Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B79CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vse43kwVk9zkWnDHplwrc7Ats+OltF42HirnQKLgfc0=; b=bE0gDoelVUB0bspM9N7dF5JlR+
	WlaqWt5NfyOOQ8RL433iifRCREwJH4ern4c80iyVK31gK4KZ+fxLQc1fx+N1i09gvx9RT1bKA0IJD
	vvV//LDO7apPTMOFn1cNeLcOscWUjjwbRziYtL1FQiumDdBcBdtrlLRCzQrAhLDxdGitcnPcU4noW
	zVtC8HV8U8VRqFcmxA3d5wnGJhtQQ0oNF5r8lykXA6OYTyheQ3DjkrfUihlc9LgUaIRJJjFWsOl+u
	ppvsDCnhiTB/equpY04znamGduDKWr3oO6gXrc4yqvYRjDi3sWykkB7AY5QxUNmTuTxw6K0K5MPtM
	S4dskKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZh8-00000003oOA-0lJB;
	Wed, 05 Aug 2026 11:21:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrZh4-00000003oNH-2waa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 11:21:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB83C153B;
	Wed,  5 Aug 2026 04:21:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01DAB3F66F;
	Wed,  5 Aug 2026 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785928911; bh=/iJTCW17ahxPRx1HgFbIWlIcrG14qstN68rpDrM2mKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=afsruKh5eASSavojLCE9iWwxEk/PzOhPmR0YPhoJKNTNcEQKOHfI+yvWe7I048rqI
	 dXMAq8b7g+4TD6L2EqJpQwhkhqM4bnuvfJe/BLBKfxgZ1SgMOqO9U2bfSzXTcdrhIe
	 p8NIgTSFn8XE9fnNd4aeCsS6b+mtSjKHraeR25eo=
Date: Wed, 5 Aug 2026 12:21:39 +0100
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
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
Message-ID: <anMcw5lTFN7OYreL@arm.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063255.1638614-4-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_042154_828184_CC915AA0 
X-CRM114-Status: GOOD (  13.65  )
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

On Wed, Aug 05, 2026 at 12:02:51PM +0530, Aneesh Kumar K.V (Arm) wrote:
> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

I haven't checked but Sashiko has some points that it may break the
build on other architectures with COMPILE_TEST.

https://sashiko.dev/#/patchset/20260805063255.1638614-1-aneesh.kumar@kernel.org

(for some reason I get error 502 above; hopefully it's temporary)

-- 
Catalin

