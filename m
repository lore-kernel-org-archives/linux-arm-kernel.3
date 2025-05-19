Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DDEC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMUNo3ur3BtkEbaK7DoWUDLGY9YcSBrV6kb57/1cAM4=; b=xbI3522pbtfH1K+zkGWodoUtBI
	3BKi75xrZp1JsjOJpipZ5OirSjVSjks++VqpjYdUiAEyZfb8QSQjD/W8rrytTJ+JGXtkuPQSxHmWQ
	6QCxyk55+VLRq+Gii8GMlrcYA/ULMERPGg110sP5/ogwmni+4dlJBGuB0j2mKCtw5fVpTE6ptFEBP
	G294Wd35dArIkCyV0fzyUSqTSsQznXAyAViQOdzK0L2AakU9edGE9EmgjiorwgBlQncKX/KmpslAU
	xQfTibhYQ1ZzRRtt67zUDCpy4PzLKMUXwug+16Ugqeh9CGPNNNswY54uz5/0Y0Ka0WL0G2AZblyAI
	w8xuedpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyES-00000008v1y-2pzO;
	Mon, 19 May 2025 11:00:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyB0-00000008tq0-0mGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 10:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60C225C0EFB;
	Mon, 19 May 2025 10:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766D7C4CEF0;
	Mon, 19 May 2025 10:56:53 +0000 (UTC)
Date: Mon, 19 May 2025 11:56:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: D Scott Phillips <scott@os.amperecomputing.com>
Cc: James Clark <james.clark@linaro.org>, James Morse <james.morse@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <aCsOc7VeJTJFk-x6@arm.com>
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513184514.2678288-1-scott@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_035658_262380_3FACAE99 
X-CRM114-Status: GOOD (  12.21  )
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

On Tue, May 13, 2025 at 11:45:14AM -0700, D Scott Phillips wrote:
> On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> translations for data addresses initiated by load/store instructions.
> Only instruction initiated translations are vulnerable, not translations
> from prefetches for example. A DSB before the store to HCR_EL2 is
> sufficient to prevent older instructions from hitting the window for
> corruption, and an ISB after is sufficient to prevent younger
> instructions from hitting the window for corruption.
> 
> Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

For the core arm64 bits:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Marc, Will - any preference on how this should go in (kvm or arm64
trees)?

