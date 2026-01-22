Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6E2D3EE84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0SpgQKDSTMdumq2nqWRW+00PRnLmGzlEu391tEJyo4=; b=A5t/snS7/0me7qCvAqsxoou1Jw
	VyLh1uqoiKDTlGGymw3IgKlHVUhsEx4PBWhU21Et70EGNjjUnxZQ6nR2XSFedqy95JavjUviO5EFe
	D0TpPqGWPoeNF6A3eeOSU9yhsTs5/GA9XAN3Z9wZbGHu1p0EAhK4E3GFtbTFFL2YkwzDkVwO2G3AC
	ShCkMTM0Z/sR+N04Hn20g5AxX4fLgvu+rPJnlTnoEvJbu7wZ4A8OuDQeA9hxCpnJwFpyCJ01XQoAo
	RgpmttAX+FGbkwfxex5uIHOg6TRdm3/P2E5QAJ6iTfGwGWVTPmHBNcfqURQGXMCZBcM7+UHUx1w67
	hrWCSFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy57-00000007WtD-2FSn;
	Thu, 22 Jan 2026 17:02:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viy54-00000007WsM-35jM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B0C7443A6;
	Thu, 22 Jan 2026 17:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C979C2BCC7;
	Thu, 22 Jan 2026 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101370;
	bh=8Di+d5LNGkQeLD8QHMF/2WgXm18OJxzuQn6e5pLoWSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGFZUicXfLJgtlq2ZWK19Hli0iSf4cGT7AXDv34CmVl85T4HWXWiRBkrN7He/TQrY
	 JIW8KRgYsXEQCcrDyUgDusbiDPea5gqLbz8wpkje+SKPSY+AkHW7pVZeEBEZbhveF4
	 4olUq5fAwTYeH6iyVcQGOA5tskAeUTwWAKLEFxM0MbTE/P+AzzPrg43snhKnSz19Io
	 cST22gK/10YNjAtUV1X51LnodAjX8Z24Yk1+eLKVf1CJLGtrGLwHBiIssKr922tVrp
	 unoW06EKd94S3n5XFwj+PI5e6vrS/6gAM9bG8IvDh81RdDQsa92lJlcLb/IMGI9wfN
	 l068kEHkUTHIg==
Date: Thu, 22 Jan 2026 17:02:44 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 2/3] arm64: Unconditionally enable PAN support
Message-ID: <aXJYNNmg5ZYdx-5c@willie-the-truck>
References: <20260107180701.2858276-1-maz@kernel.org>
 <20260107180701.2858276-3-maz@kernel.org>
 <86sebxc2qq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86sebxc2qq.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_090250_796461_8FB41387 
X-CRM114-Status: GOOD (  16.58  )
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

Hey Marc,

On Thu, Jan 22, 2026 at 11:21:01AM +0000, Marc Zyngier wrote:
> On Wed, 07 Jan 2026 18:07:00 +0000,
> Marc Zyngier <maz@kernel.org> wrote:
> > 
> > FEAT_PAN has been around since ARMv8.1 (over 11 years ago), has no compiler
> > dependency (we have our own accessors), and is a great security benefit.
> > 
> > Drop CONFIG_ARM64_PAN, and make the support unconditionnal.
> 
> Since you mentioned that you were planning to merge this patch, I'd
> like to point out that a related change[1] is on its way to Linus via
> the KVM tree for 6.19. It is also in -next due to dependencies.
> 
> Could you please place these patches on a branch that I can pull in
> the kvmarm tree to resolve the conflict? It really amounts to
> reverting this patch now that we are guaranteed to have PAN on an
> PAN- machine.

You can use for-next/cpufeature. It has these plus the LS64 stuff that
you might also want to pull into the kvm/arm tree.

Please yell if you have any issues.

Cheers,

Will

