Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1850D29C36
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qYf/PHQFWJCnIpSyFGqKWYMu6hZ8FKioOYMYzGdZY0=; b=Q/Y1UZAUtbRuFxo5D0AWkn2ob0
	RIxdDOIkaA/y83hlz8YmLX4oZimcT1p1GENfeNWID8jmaCyJUv8m+c+hX38PtfqL680PiTYRl/N5W
	NjoUBxu6ZBNWckRbkm4elNKf0mF686IJ1RNGdmsz61HAU0ycaWUcnGYtG7Jgik2LHYYlT2WBcZPLw
	kQzIobrhNLn6sExYQLWI4os8/yzNgK7S/FQIuBm7K8EDAuDecdcGxw4qsgHlyXTE08xTQp1BKVRgA
	BFsm1k5AObKJI45irB8LDLanctF+9DydmW+SYBLsyaIOqtLvk+n533UqVloVrp9NAIFhd22F5AwNT
	DknHosow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrGj-00000002MUF-2QNo;
	Mon, 19 Jan 2026 15:34:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrGh-00000002MU4-3PBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:34:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E946C600C3;
	Mon, 19 Jan 2026 15:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6981CC116C6;
	Mon, 19 Jan 2026 15:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836854;
	bh=EV9T2myKyHW3Va2uCiNnqCvAhEhltNmAw8tpzkkdAzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hnTPBamtcpdz1LcA6KzmSTKkAZ+TFdl7qyRNKWE3Akp48IOYXqvoOqmcFIyjLmtcA
	 j8slHUynBdR7vCN2o5vdKzJJ+AJPt2faLJ7NDN9kmc9vEUgolojkGLCFHaiaM8DGuy
	 ayds765ZMJhLuH/0dSdeAPclWKXpdn/ehgC1SI3hNTv5WrpcA59Shg2UVKLtjNiadm
	 3dnm61SJHT4FfTqP/Z6CuaT9OqoAvL95U62K2ZA0FlZNfEPAR9iEkfm1YIoieddOeO
	 r6fBFs3NruE+FS+bG+MFkqIqDe47vIrXlGpGOlIKd9ZSmW1mpyAJPmYXEWOH+1RsVQ
	 g96pudsYi2RCQ==
Date: Mon, 19 Jan 2026 15:34:07 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, catalin.marinas@arm.com,
	broonie@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aW5O714hfl7DCl04@willie-the-truck>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-10-yeoreum.yun@arm.com>
 <86ms3knl6s.wl-maz@kernel.org>
 <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
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

On Mon, Dec 15, 2025 at 09:56:04AM +0000, Yeoreum Yun wrote:
> Hi,
> 
> > On Sun, 14 Dec 2025 11:22:48 +0000,
> > Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > >
> > > Apply the FEAT_LSUI instruction to emulate the deprecated swpX
> > > instruction, so that toggling of the PSTATE.PAN bit can be removed when
> > > LSUI-related instructions are used.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >
> > It really begs the question: what are the odds of ever seeing a CPU
> > that implements both LSUI and AArch32?
> >
> > This seems extremely unlikely to me.
> 
> Well, I'm not sure how many CPU will have
> both ID_AA64PFR0_EL1.EL0 bit as 0b0010 and FEAT_LSUI
> (except FVP currently) -- at least the CPU what I saw,
> most of them set ID_AA64PFR0_EL1.EL0 as 0b0010.

Just to make sure I understand you, you're saying that you have seen
a real CPU that implements both 32-bit EL0 *and* FEAT_LSUI?

> If you this seems useless, I don't have any strong comments
> whether drop patches related to deprecated swp instruction parts
> (patch 8-9 only) or not.
> (But, I hope to pass this decision to maintaining perspective...)

I think it depends on whether or not the hardware exists. Marc thinks
that it's extremely unlikely whereas you appear to have seen some (but
please confirm).

Will

