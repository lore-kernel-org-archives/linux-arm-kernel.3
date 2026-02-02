Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170A9E7DEEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDSJE4EkTKFGGkPhn4SeHIi1SiIBeSssNODaa+nXt/0=; b=qsSO1Jp5GyUejgcfjrGko4ftEa
	KZs3Ec+gdnh+0qzthIrHwhdwgHckz9n1QrWVU9K6H1PtcP/KGW5TgaglTUoQXb/clSEhVIuH/GCdp
	zx16owwN1BRuPzWRarDxTS3E7EzLIUQsF/qFBI8iXrXd61sxOQ7e4npenF9pS+diKm3LBQEU8TwtL
	2lKBVKIqqijtKBxbBaBybJ+TFdE+xUGeJO5QvNMBdHPEDDkrhPFNLyuvZTQxyRR+bxa4yHedbd1QS
	PMHFsV0+N1TJlsUIiTZ/MHGSBWBxKrfFXFWDtco5pJ7DQnYpgHwAuQdYcMctXy9C8TTvI+SRpspL6
	Cdy5SQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvZv-00000005ALo-2yJz;
	Mon, 02 Feb 2026 15:11:03 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvZk-00000005AK5-2Sj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hDSJE4EkTKFGGkPhn4SeHIi1SiIBeSssNODaa+nXt/0=; b=OK3srajgyUf9c4eoWt+HpqmoeF
	zCW8TWlSyPm5QmnzBxjRM8Wx9F3ZpamTfBVahM5HHOI5XgWP29DS6PmBGlUf4qDn5gea1FCwpm381
	DoBFgexDF4X8Vd1KCovhH/Oed2GyXV3PAbB9JeAY+DyhJ8kdxKS5vw80qFKy0kmYC3gl4MUy2dflO
	Vb9o9dFXoYvMH3W9BYfKqALbQf5KqVPqk3HTnrZdKR8Y7Ftsf7f1KUcDmnPNKFc+26Y+TLygkRyzY
	rzH6MTrJJ+VgiKqGp+eoF1PA2Q4oyEurjrvFhB7c7KyLpm/9hXpoAUOPLP03nJYcfFdAdowBLokg1
	wAorNQzA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vmvZf-00481y-9s; Mon, 02 Feb 2026 15:10:47 +0000
Date: Mon, 2 Feb 2026 07:10:43 -0800
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Fix error handling in
 arch_set_shadow_stack_status()
Message-ID: <aYC-UhyMdh2YJSty@gmail.com>
References: <20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org>
 <aYC4WygNsqtGePnq@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYC4WygNsqtGePnq@willie-the-truck>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_071101_318865_9562256E 
X-CRM114-Status: GOOD (  23.29  )
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

On Mon, Feb 02, 2026 at 02:44:43PM +0000, Will Deacon wrote:
> On Fri, Jan 30, 2026 at 01:43:09AM -0800, Breno Leitao wrote:
> > alloc_gcs() returns an error-encoded pointer on failure, which comes
> > from do_mmap(), not NULL.
> > 
> > The current NULL check fails to detect errors, which could lead to using
> > an invalid GCS address.
> > 
> > Use IS_ERR_VALUE() to properly detect errors, consistent with the
> > check in gcs_alloc_thread_stack().
> > 
> > Fixes: b57180c75c7eb ("arm64/gcs: Implement shadow stack prctl() interface")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> > PS: This was compiled-tested only, given I unfortunately don't have
> > a hardware to test on _yet_.
> > ---
> >  arch/arm64/mm/gcs.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
> > index 6e93f78de79b1..efce7642b1d7b 100644
> > --- a/arch/arm64/mm/gcs.c
> > +++ b/arch/arm64/mm/gcs.c
> > @@ -199,8 +199,8 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
> >  
> >  		size = gcs_size(0);
> >  		gcs = alloc_gcs(0, size);
> > -		if (!gcs)
> > -			return -ENOMEM;
> > +		if (IS_ERR_VALUE(gcs))
> > +			return PTR_ERR((void *)gcs);
> 
> Why do you need to go via PTR_ERR() here? 'gcs' is an 'unsigned long' so
> can't we just return that directly?

yea, PTR_ERR() is not helping here. We can definitely return gcs
directly.

I will update it,
--breno

