Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46759F9D0EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRoZhc7yg9F23mLAHjUKYTQwoZNpqNtKczqcDpo1FpQ=; b=3pHzJRHHPHzCZUSZOJOKw20kgL
	PrE8AE7GtPrLlHgBQlpdg3erjQRJoU+MmQswmXfxH7hDAodcibplPxU3HCWiCmu2MfUZedYfBTf0p
	sTxKHQIVL/A93Ff2O7ksoeGup5iwwZnroTww9aJYAMR8x15kLFwSWYLrROhfwJt5bdXvwragoA9mt
	hoOCQ8o9LcNTMtxZrVG/gglfpcAJBy40sAQVvjUkq1nJMXeFHWnh3E9dSS7mabG8VPAJAPcelWrGj
	IQfIeHDVyJ88nyAVvV8ol68lntNZvlz1qPmxsBQeq36Y+W980dCUvs93pCku53nHevbv8m5f0zthI
	s6Uedy/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjLJ-000000008sl-0uso;
	Tue, 14 Apr 2026 19:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjLH-000000008sN-1Csw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:22:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFEB845D9;
	Tue, 14 Apr 2026 12:22:28 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1384B3F641;
	Tue, 14 Apr 2026 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776194554; bh=8+TC7ndMORebjkxM3quRFYUKduQeP7Ch76ZE1Cq4uRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FcstPX1BHfwmpVnXvngbSQRxbWJxfdSvQn/DDzmGkEkJOnOWT3GYxexTgtrlXdJkp
	 M8Zpb5ypXKeVO1H1g0txECZoEqjfbuFaJxzbYP7scISjCridUNdBV8RTaddlxM6H2p
	 BGNqCJoaWZTXru2xRk7/l8GEwKbvBPrXax9m3nk4=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sami Mujawar <sami.mujawar@arm.com>
Cc: Will Deacon <will@kernel.org>,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	YeoReum.Yun@arm.com,
	Jagdish Gediya <Jagdish.Gediya@arm.com>
Subject: Re: [PATCH 1/1] virt: arm-cca-guest: fix error check for RSI_INCOMPLETE
Date: Tue, 14 Apr 2026 20:22:23 +0100
Message-ID: <177619452606.2125475.5828908227230519543.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260410163636.259443-1-sami.mujawar@arm.com>
References: <20260410163636.259443-1-sami.mujawar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_122235_383451_26E1B538 
X-CRM114-Status: UNSURE (   9.19  )
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

On Fri, 10 Apr 2026 17:36:36 +0100, Sami Mujawar wrote:
> The RSI interface can return RSI_INCOMPLETE when a report spans
> multiple granules. This is an expected condition and should not be
> treated as a fatal error.
> 
> Currently, arm_cca_report_new() checks for `info.result != RSI_SUCCESS`
> and bails out, which incorrectly flags RSI_INCOMPLETE as a failure.
> Fix the check to only break out on results other than RSI_SUCCESS or
> RSI_INCOMPLETE.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] virt: arm-cca-guest: fix error check for RSI_INCOMPLETE
      https://git.kernel.org/arm64/c/e534e9d13d0b

