Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A308E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DEtOl5S+zY+lZKEyqIrjSVPMuNdu+YZJg2TbuGdqk4=; b=K0X1eDbDdsSEUcBP1TP4zgmpej
	XTJhUDuQl0M9GLjWsJqO+4WaKXp3sZ1X6PJg/ARSMEZput9W1kdBfMzLK77BJjn4DqRJEj6y9lDWv
	tOqGejpTMYGiJGabxuRGqMGHVWbzlE4Gb0O37LrMSJaUhfRNESTVa5ylcL7r0Lw18qyEMOWGAoaDi
	nMzp4O5LgWV6xpEOgpktS/L329InNneFuBIyfHjMcv0vpiXlC5LqanY4qqJsCVvS/Tt2WBLSH33Ke
	Rb2Fpu6DRx1wKHCvyg/bGKgF3g4VhrnJCfsxlFupw8rJcX+HbBfOdiNhfX0NMT8d/VR9CL51qtjmH
	+y7Sx/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJY2-00000002Nyy-3tOB;
	Thu, 19 Dec 2024 16:38:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJWx-00000002NoV-15Ho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:37:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFF775C58E0;
	Thu, 19 Dec 2024 16:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BECC4CECE;
	Thu, 19 Dec 2024 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734626262;
	bh=EDefhr+82fJbRgYXE5hYeauAAvr+YHKOyCh5/nvtES8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1y9GpGuL1fWahJnlbpJHQdsMRxJFEK4KZrC8kBjYXmx/0e1/SCdb29c4SxCZcWnM
	 55tiqWJBaClPYHQJaELNouhJILty3MQy2clsZJ3CsypktKSAUDn2KtN+6w2fKGMAo9
	 qTYmzXYVrYULvu3Q+W2apG9Kk/ecYfJ/DetIv9STDugdAak61GdBDQYL06qHnCWdUI
	 jt5qiKFB6CKlF4ja7JTsthcxeF2NYpMMyWfzsP+ZcPnXRqpIDENiTJSWytTRZTCMNF
	 1m4iMbb2lLn8x4L+iFtlc+bUFK+lRbStGdpzXxEkhgtOlBMdr/RLFuHZBXu05aQ70g
	 cUcSvhd1mifXQ==
Date: Thu, 19 Dec 2024 16:37:37 +0000
From: Will Deacon <will@kernel.org>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, catalin.marinas@arm.com, corbet@lwn.net,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [RESEND RFC PATCH v1 5/5] arm64/mm: Elide tlbi in
 contpte_convert() under BBML2
Message-ID: <20241219163736.GG24724@willie-the-truck>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-6-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241211160218.41404-6-miko.lenczewski@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_083743_338755_52AD5230 
X-CRM114-Status: UNSURE (   9.71  )
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

On Wed, Dec 11, 2024 at 04:01:41PM +0000, Mikołaj Lenczewski wrote:
> If we support BBM level 2, we can potentially avoid an intermediate
> TLB invalidation, as hardware is capable of managing the TLB itself
> in this situation. Hardware will either silently clear out the
> offending entry, or will take a TLB Conflict Abort Exception.
> 
> Note that such aborts should not occur on Arm hardware and indeed
> were not seen on any of the benchmarked systems.
> 
> Eliding the invalidation results in a 12% improvement on a
> microbenchmark which targeted the worst case of contpte_convert(), which
> represents an 80% reduction in the overhead of contpte_convert().

Can you run something more indicative of real world performance than a
targetted microbenchmark please?

Will

