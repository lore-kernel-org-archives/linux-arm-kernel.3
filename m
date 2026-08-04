Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3C4C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYbbqjWngEpE/AeQwnGOGwW8Q/t20SmBx/XPZzicJVA=; b=tquB6I9l4MhqRNkropQ+wpif+T
	bQUNB7aMVDi2F/uyAg6hlgb6Zzvv8BjymnJ8NjaLdqu33gITfFZT0nEiLmyvKZeUJOhIeeVp8KCdC
	fDtceB1e2i9Qt3yt+HVIG95rxTyfdRJno6mYV7UQ9ywd6KG26mF/f0qjMSEmN9sxNygD1mMcDVvLj
	55w8AL/s/2GILE1XUzA5Cib9sAVJcSzURv8BZ5CiDGPT47ROUimrUyaT96nHBgtCnEpynYHOEtKL6
	nLabD0Pm1rnB4soXFy/Y7haDUKZDfVYveDUduzsBJlUXZeel/Aqe3ck1fXSF3rZ6as8O2DkXLnt5+
	l8F7ZUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrH4N-00000002DUU-1u4t;
	Tue, 04 Aug 2026 15:28:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrH4M-00000002DUI-3k2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:28:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E41D60A83;
	Tue,  4 Aug 2026 15:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FBD1F000E9;
	Tue,  4 Aug 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857322;
	bh=ZYbbqjWngEpE/AeQwnGOGwW8Q/t20SmBx/XPZzicJVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DQcZs7cj6Xljp/HiJ22bJWeugENk5fcBDjxnsDDQ150tn3JXQX06FFoODTG0IfZeL
	 GhwWK0t0fklziHtUVyTFGzcgkN8bFKNdLTRT1yn7kJqdu+I5qibr4EE5VE4IeHT8ke
	 HMIZzVtM8ztd+K0Cpa+15v1zkibxJ4dR1jWw+QvcDviX1/L7j/d51J7vwMhwRcxsxJ
	 uciEPhg1kn2yapVcbShN08Z7tbROB1NXZFazicizo6D3oTRP9Cbt/XZZ0Vr+I2QCp7
	 FDNNf+QRPnWm6Y8PsQmzTeiDLFJdVfNdcg7DOHA4+jwzCsIMnY1gwbI/1ZcxEKXsas
	 j5L+Fb0pGo38g==
Date: Tue, 4 Aug 2026 16:28:36 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <anIFJJ3H-pHWhuL5@willie-the-truck>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <amE5bX0jey6WS0U1@willie-the-truck>
 <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
 <amzKZgqrqqM7E_9Q@google.com>
 <90d1e043-22bd-4396-9661-7d6bc09c577b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90d1e043-22bd-4396-9661-7d6bc09c577b@cyberchaos.dev>
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

On Fri, Jul 31, 2026 at 09:32:04PM +0200, Yureka Lilian wrote:
> On 7/31/26 18:16, Will Deacon wrote:
> > What do you think about a funny sort of hybrid approach where:
> > 
> >    * We have idle=, but it really only affects the idle loop
> >    * We have a cpu_errata entry to detect (based on the MIDR) this CPU
> >      and then avoid patching in the WFIT instructions (i.e. don't detect
> >      the ARM64_HAS_WFXT capability).
> > 
> > I think that would solve the case for you, as well as giving others finer
> > grained control over the idle implementation and adding the infrastructure
> > we need to handle a CPU with broken wfit.
> 
> The idle param portion, if implemented like you say only affecting the idle
> loop, should be rather uncontroversial.
> 
> Getting the other part of it (the WFIT in the delay function) right is much
> more difficult, but it also has less of an performance / efficiency impact
> if it's a bit on the conservative side and we can find a good solution
> independently of the idle param.

Thinking about this some more, why isn't the WFIT side handled with an
idreg override? If we extend the ID_AA64ISAR2_EL1 override entry in
arch/arm64/kernel/pi/idreg-override.c to include wfxt, then you can
nobble that on the cmdline as well.

Will

