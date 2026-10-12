Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E67DCA9EDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1u0TTK6mlFZT6VLHFzxqw1NWE5qUPMphCAjj5bHCrQ=; b=pME/Pb/gBfymBFAYLp65L3+C2u
	Z1si+lcWpULO6HZobe2UOpL0cFAfQx74BZqkqcVfJ73LWuj4EJWoovyzcPAMc2DY18TyxKLQKDP1S
	YpPRIHRC8dUGkuNiK44V6DagOaXN+jxThnTmSvGK3F9nlQy6dM4S1eTP9VJOKCBEhg/icW3HwmyFi
	tSb+ZRzm899XY25ngBbK1xYVDW2Zo3hCYogk+FpnI+GviNxQhwCHGRrc1i307rdJNdvng1CIYS3ks
	7yaCGhZp8zcichqv3ftJ3WoHbS1iUHD4k7zeniT5Xo0Q79qYBgHhwJBmUoCsLqxZS/ekLoT/ykc1s
	0ls0NAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7t-0000000AzzF-1LPI;
	Mon, 12 Oct 2026 16:43:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ7q-0000000Azwz-1atw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:43:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A994D169E;
	Mon, 12 Oct 2026 09:43:41 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CF133F673;
	Mon, 12 Oct 2026 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791823425; bh=clp9MA9YZuEI5EtCokrIl6KhbsQK09KkMkQbTQwBPsE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEmzAGvfOEoLDUDmLFTS6rJgfAIalRcOEBWFjwcr7tELaaPi9+5TdYQDj843gO3ej
	 xuuuQpSTnAe1p2B1tl0jRfSpPulZuNyoBOQb/lS0z5e5Z+Mzc/odtqgDtqpqikqvH5
	 /uaLxmrc0WjTtXJYX9ldTfBg7jhgg2tpHkUdIK3g=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: smccc: Pass only the required device probe arguments
Date: Mon, 12 Oct 2026 17:43:33 +0100
Message-ID: <179182341292.872409.17228247622943344974.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010100249.643327-1-aneesh.kumar@kernel.org>
References: <20261010100249.643327-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094346_467925_183D09E4 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

On Sat, 10 Oct 2026 15:32:49 +0530, Aneesh Kumar K.V (Arm) wrote:
> The device probe passes zeroes for all seven argument registers to
> arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
> GCC 8.5 reports "r7 cannot be used in asm here".
> 
> The current smccc_devices entries need at most one argument after the
> function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
> version. Pass zero for that argument and omit the unused arguments,
> avoiding the r7 constraint. Check argument requirements when adding new
> probe functions to smccc_devices.
> 
> [...]

Applied to arm64 (for-next/smccc-bus), thanks!

[1/1] firmware: smccc: Pass only the required device probe arguments
      https://git.kernel.org/arm64/c/c6e78a4080a3

