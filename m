Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1721D64060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9Y3TvlgxTbzR8lsrz1QYjtJnn3bhJFcC/3I3u70PTo=; b=mYqCiCbYUPiiCzlL0WpetBDbT5
	0/5qGhGpcB7pYaXaFGEGuNHSWVTAOOMCXBigLXZrJXp9FIGeNZlf/HpTVmirXxuf9AxpVMWvbZ4ND
	CGomuiV/e4ykXdwKdr/lhc7Att9Yt8NR6plQs4NGm/GIUq3NrSncf4t+V6W2BVZrI3rLPIBx/xjzN
	CS6uqlGHDkexifGamp99bwodRGfsw7U+wW8N23dyO2Cyy4+Qtn02bSyI9NC92FhRN/VP8YCLMhMP4
	boXdDNPUh2TsmFxuYcLRsEtqNIxIfs0S16t8a2GFv11aq0wM1lsKZfHHgNSKY5Ebe/xpuIhmPVa7Y
	HYFfFjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtn-0000000BDGZ-2jK1;
	Fri, 08 Nov 2024 16:31:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qru-0000000B16L-1eaa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EF085C5B90;
	Fri,  8 Nov 2024 15:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85218C4CECD;
	Fri,  8 Nov 2024 15:25:48 +0000 (UTC)
Date: Fri, 8 Nov 2024 15:25:46 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Fix printf() warning in the arm64
 MTE prctl() test
Message-ID: <Zy4telEzvU1DGih1@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
 <20241108134920.1233992-3-catalin.marinas@arm.com>
 <4bbc179b-73b6-46d7-b414-f3b14079b489@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bbc179b-73b6-46d7-b414-f3b14079b489@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072550_537008_01D5F981 
X-CRM114-Status: GOOD (  12.39  )
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

On Fri, Nov 08, 2024 at 03:10:59PM +0000, Mark Brown wrote:
> On Fri, Nov 08, 2024 at 01:49:18PM +0000, Catalin Marinas wrote:
> > While prctl() returns an 'int', the PR_MTE_TCF_MASK is defined as
> > unsigned long which results in the larger type following a bitwise 'and'
> > operation. Cast the printf() argument to 'int'.
> 
> >  	} else {
> >  		ksft_print_msg("Got %x, expected %x\n",
> > -			       (ret & PR_MTE_TCF_MASK), mask);
> > +			       (int)(ret & PR_MTE_TCF_MASK), mask);
> 
> Shouldn't we just use a %lx here?  Casts tend to be suspicious...

It's more like the ret is actually 32-bit and should stay like that when
bits are masked out. But the bitwise op 'upgrades' it to a long (in
hindsight, we should not have used UL for the TCF bits and mask).

-- 
Catalin

