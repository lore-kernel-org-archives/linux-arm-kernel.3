Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD6DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY/bZ/DOR4fCv4k7FYfsaKSLi5+VNzGncLisVOgV3Vk=; b=gF782wtro0F4XAHcP2UTPfWOts
	fyMcA8kcfwvBQZ6ozgNV01l4EbeKxCUXiXvxFO2hju8XeO3aZpQDAaD3YXokd5y6NSkYKGNNRG7Xj
	LJ5mRf4M9kHU84G3gljqzN59Gc+UvTZdFxjkd02r2n3ILbTj03Rnjh2VmgbVpRNUAMwTIsgGcIzev
	OmtCLTqIisepFaRGhc8ZEJV7a6WaVa5Glx4K+PogRO+rv/AkJtrvVnfqQnNgvVnkoa7jvPgHF3ERh
	Xk7BGaNvxy2jaA2CBbrdUadRoUkVVj4F2JH5sPLLzm0JV7VizUfXjla8NvGG/VUi6pIEFkFdUCwFu
	/iO5WlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26F1-00000000dOa-48Id;
	Fri, 26 Sep 2025 11:03:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26F1-00000000dNS-2MeA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:03:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B043D61D2F;
	Fri, 26 Sep 2025 11:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C95C4CEF4;
	Fri, 26 Sep 2025 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758884633;
	bh=oFiQWbwuMiUmrHeiM7kpOIvvMtVbg4RkhQvdzmxPAVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ1Qi3j8r7Sw7NeiAHv01bt2HBG1bcs26+uNQ/74PK0QKJTt369rG6rnYDb2RxKH/
	 3S/28UMPQuj7/BLCoqO1ODHI8g4ckMJHk9kMeSvoKhd8fEpR/jlm385+GF2F94kZ9c
	 z2DNYVGxwKVGZvzpR9S8NxNfe5ooEkhqHHXFN/spRCCWLT789OmWbr+NsfisJeouFk
	 DIPDjZYlMVRaPmSf1ui68j6d5lAFvxVurq9A91LcoMMcVa2SQqsZkeKKH5zWIFmnQB
	 8cINIstdLtIFoguyo2dx30CgnqDtGNVETeH3ftBjG32lJSgDplPcV84zJgGHucvrnw
	 wo9yXyrA73pUg==
Date: Fri, 26 Sep 2025 12:03:49 +0100
From: Will Deacon <will@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG] ARM64 regression: NULL pointer dereference in
 arm_smccc_version_init+0x90/0x1ac
Message-ID: <aNZzFabuivNXCenZ@willie-the-truck>
References: <Z5tuaxgDyFJPAvR0@J2N7QTR9R3>
 <Z5uTCnhfKo5D-_bV@NH27D9T0LF>
 <20250131124103.GA29766@willie-the-truck>
 <Z5zWMU4M_L5k6kII@J2N7QTR9R3>
 <20250204100014.GA777@willie-the-truck>
 <Z6OWxUFxkK9plrm0@NH27D9T0LF>
 <20250206131154.GD3204@willie-the-truck>
 <Z6TqBQKSILZUnYbJ@NH27D9T0LF>
 <20250313220835.GD8101@willie-the-truck>
 <aNZssv1cA_KIMvF1@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNZssv1cA_KIMvF1@stanley.mountain>
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

On Fri, Sep 26, 2025 at 01:36:34PM +0300, Dan Carpenter wrote:
> On Thu, Mar 13, 2025 at 10:08:36PM +0000, Will Deacon wrote:
> > On Thu, Feb 06, 2025 at 05:57:41PM +0100, Emanuele Rocca wrote:
> > > On 2025-02-06 01:11, Will Deacon wrote:
> > > > In your screenshot, x6 looks like it's retained its poison value, but
> > > > that was the register being corrupted in the initial report. Maybe you
> > > > could share the diff you made?
> > > 
> > > Sure, please see [1]. A kernel built with that patch crashes and all
> > > registers retain their poison values.
> > 
> > Okey doke, at least it sounds like the firmware isn't taking advantage
> > of the broken spec, then.
> > 
> > In any case, I think the right way forward here is to use the
> > out-of-line 1.2 helpers whenever we can (the spectre mitigations can
> > stay as they are).
> > 
> > Will
> > 
> 
> Any updates on this?  I guess it only affects gcc13?  Clang seems to boot
> okay.

I don't recall seeing a patch but we should just move to the out-of-line
SMCCC helpers wherever we can. The inline macros are fiddly to use,
especially when you have to pad things out with zeroes at the caller to
prevent registers from getting corrupted.

Will

