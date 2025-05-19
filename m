Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69123C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6c6qa+D6VoobvrU5O+d8r8An8Vs59KKDiwqcJO73lPg=; b=4EgL9G0hsTQdNud4dxI8/W+Z4e
	HpAuJVkhjHzAnWPnUcJMDMTeH+S8mCTUcY388Oq3inSH0HCz4srYeKJckTwOPgqnKhPvFUPovYiEp
	2W70hVfNr3pkRTet4e+tt+p3WTiXaUn8eUw+QJxfRH5cmGBEq0+zaupwn+Ou0EhGBHIfL4Oj5hnSj
	WGn7600nqCfBP5Teo/r5VW+u7oTki29Ini5xq+kDw4WRTaCPq/CtBuLN0vcs+deQT0KxpdZUvGrsC
	6qrPTW0w4HxP5jBR68Sp2BCcIgcjosQwlqNI05wluUg/b1oFF7CanEcKyMOAHZbyEgBRKV79KzQOE
	280fAhrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyTd-00000008xxq-2BoW;
	Mon, 19 May 2025 11:16:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGyQv-00000008xeT-1khC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78A0F61147;
	Mon, 19 May 2025 11:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DF9C4CEE4;
	Mon, 19 May 2025 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747653204;
	bh=YcufbpuTBeyN+hUjFALoDwbhHl+o5XaWxiPAMRJKtWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo2IQ8kn9q53ZeZxv3v9t240uzKWkWH2oLFzQoVk7r1byOrUuYIUeKxzhg//cGkY/
	 wy4cyyD8eI1I2Grg0X2utXExDZo1glPtoz6OMFmuiLV2ElnVve1ZIXHTPx1Ejod5UA
	 1gd8fO4rxLGBsr1OiIxud+HZPbLakAEM9QqPDQS+DIZiBPU1ZF/HMd4JEz6qWVjDqL
	 pucPmz8bw2cCjkj010ZLLRKyoxwMM1ZH8OnYlQ1i+DMTQ58ZLlBLH4lJ0UfzI/PfPq
	 mWS80HRv3x7mGoBBGe5sR2I7Bd0JiIXjKgujzORr0+ncRkzldA1lVmRPP5hY2RKsTW
	 dRNEEIMfzvGSg==
Date: Mon, 19 May 2025 12:13:17 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: D Scott Phillips <scott@os.amperecomputing.com>,
	James Clark <james.clark@linaro.org>,
	James Morse <james.morse@arm.com>, Joey Gouly <joey.gouly@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Yicong Yang <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: errata: Work around AmpereOne's erratum
 AC04_CPU_23
Message-ID: <20250519111313.GA16690@willie-the-truck>
References: <20250513184514.2678288-1-scott@os.amperecomputing.com>
 <aCsOc7VeJTJFk-x6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCsOc7VeJTJFk-x6@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, May 19, 2025 at 11:56:51AM +0100, Catalin Marinas wrote:
> On Tue, May 13, 2025 at 11:45:14AM -0700, D Scott Phillips wrote:
> > On AmpereOne AC04, updates to HCR_EL2 can rarely corrupt simultaneous
> > translations for data addresses initiated by load/store instructions.
> > Only instruction initiated translations are vulnerable, not translations
> > from prefetches for example. A DSB before the store to HCR_EL2 is
> > sufficient to prevent older instructions from hitting the window for
> > corruption, and an ISB after is sufficient to prevent younger
> > instructions from hitting the window for corruption.
> > 
> > Signed-off-by: D Scott Phillips <scott@os.amperecomputing.com>
> > Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> 
> For the core arm64 bits:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Marc, Will - any preference on how this should go in (kvm or arm64
> trees)?

I think it makes most sense to go via the kvm tree based on the diffstat.

Cheers,

Will

