Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B571C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTo/qlwHFno7qN//rKd6nKiVeNsl6hzDFWTdga0qU5U=; b=n0AzCV04EA94tkh8E0bgHnqojL
	89XpHRQHf07kEnBMbO6EARgU9OMEUVUCIKJmatQJBAq/UlD7r4w0Nk308j2+GFj1BdPBBKyr7EchK
	6ud5aQLT08UAchanYhsJL0FrQNb3X+MqZgZ30MySJNjlWIny4nq8mkeGE78aTULL4ULO4ShC/38jU
	8tEWCn1Q5wct/wRcc5PpdNZcl0uV6nwYUnFdeP4jF3rRKsN1O5/fMs7d4lko22gW0uyyhE+OWQHc4
	lGLdgzxqZrKqlQYCsIPhJinkZ6OkJL8rKQ5zONXKsOTuBO5cx3x2bW22aIN5/i9VQFjFlxHF7QxPc
	O/3uC5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEgy-00000009S5P-0Gcx;
	Fri, 25 Jul 2025 09:26:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEdD-00000009Rly-3NsP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 09:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 694C8176C;
	Fri, 25 Jul 2025 02:22:14 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B55213F66E;
	Fri, 25 Jul 2025 02:22:19 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/10] coresight: Fix and improve clock usage
Date: Fri, 25 Jul 2025 10:22:11 +0100
Message-ID: <175343531849.493374.1972746372917823.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
References: <20250724-arm_cs_fix_clock_v4-v5-0-63f648dae021@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_022223_888698_6477C181 
X-CRM114-Status: GOOD (  10.17  )
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


On Thu, 24 Jul 2025 16:22:30 +0100, Leo Yan wrote:
> This series fixes and improves clock usage in the Arm CoreSight drivers.
> 
> Based on the DT binding documents, the trace clock (atclk) is defined in
> some CoreSight modules, but support is absent. In most cases, the issue
> is hidden because the atclk clock is shared by multiple CoreSight
> modules and the clock is enabled anyway by other drivers. The first
> three patches address this issue.
> 
> [...]

Applied, thanks!

[01/10] coresight: tmc: Support atclk
        https://git.kernel.org/coresight/c/e96d605a66ff
[02/10] coresight: catu: Support atclk
        https://git.kernel.org/coresight/c/7eca4399060d
[03/10] coresight: etm4x: Support atclk
        https://git.kernel.org/coresight/c/14fb833b8204
[04/10] coresight: Appropriately disable programming clocks
        https://git.kernel.org/coresight/c/ce15ee28bddd
[05/10] coresight: Appropriately disable trace bus clocks
        https://git.kernel.org/coresight/c/90b0000bd501
[06/10] coresight: Avoid enable programming clock duplicately
        https://git.kernel.org/coresight/c/5c0ead76597b
[07/10] coresight: Consolidate clock enabling
        https://git.kernel.org/coresight/c/f47d7f7da638
[08/10] coresight: Refactor driver data allocation
        https://git.kernel.org/coresight/c/7471c81e60b9
[09/10] coresight: Make clock sequence consistent
        https://git.kernel.org/coresight/c/d4cf59aa905b
[10/10] coresight: Refactor runtime PM
        https://git.kernel.org/coresight/c/2b52cf338d39

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

