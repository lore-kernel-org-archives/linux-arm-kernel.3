Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbhTBzwlK43Es3YGDVNLfFfVUwlDoMr9oQ5v+m3+liY=; b=DuAfURNKh3VSFqe9/Om8h1GfnN
	wtG218/OP2F4qz3vbTXct3OEoJB2bbJxbDZz+cCaxxjccmxDw+FXhZUrmMfpNjEnAqdftMxpGVkDy
	GMKFVMdnAnbhVGxhkKqSD+ok7KUJzSwr+C4RmIBqcLdAaeS04NOth7WbdKdM9KQjXh5JBuj1lXjc7
	v3UpdHghhQrce8KgjdwhS4MsunKoamH7Po49d0ONs97gIh0YniHpBO2fEbjmhVHIg81TFZZkWNIT5
	9unASx+NMx5UsszmnYsdJ+aWXxBxqp9AJCMoQyDaC1Mt0s9dGYZw7wbnN8eLSZdR8eaoYxCEeN2vS
	CIpHfVSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qw2-0000000Ag7z-3sa5;
	Tue, 29 Apr 2025 19:48:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qu7-0000000Ag0I-3lhV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 19:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3FCDDA4BF05;
	Tue, 29 Apr 2025 19:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B34C4CEE3;
	Tue, 29 Apr 2025 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745955966;
	bh=k7n0GYFUyeBO0OHkm1Om5iweFSPZCM24//OydCY6UWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCyOz9fJZSE1wTBeaLCD5sHT8pjgFgH4bsqdmuLuLBu7VIXjnuRcfHpegou0VwVT8
	 1khn7sMDlAtww3YJXsS1ftW9+tjsTSHYZ1c3kx8bgqeM9+uCcjoJAyzNwtJoqh0igI
	 N4vGzOJ8CSDADwhr+Po0RS0TK+VWyJULL4sXAyZd/oJ8ek8YiEvthiKcuk4WHWYWXv
	 R8LXUoQtFIX5NH4uCXIvsshmdbIAh3RvEpoEMouxU4HUMLC4R5rTnsBjTM9bFbbNxy
	 ik3MHCw+40lgPM7jvbu/mRXbTBtIg+r7ikWbvd5EEx4kWx4HVWVXVGLtb+ryODxXnN
	 AEORaw9mpynxA==
Date: Tue, 29 Apr 2025 20:46:01 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, ardb@kernel.org,
	broonie@kernel.org, maz@kernel.org
Subject: Re: [PATCH v2 00/13] arm64: Preparatory FPSIMD/SVE/SME fixes
Message-ID: <20250429194600.GA26883@willie-the-truck>
References: <20250409164010.3480271-1-mark.rutland@arm.com>
 <174421878646.2870912.3802724291984766270.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174421878646.2870912.3802724291984766270.b4-ty@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_124608_006695_5E77EA7C 
X-CRM114-Status: GOOD (  17.04  )
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

On Wed, Apr 09, 2025 at 06:17:09PM +0100, Catalin Marinas wrote:
> On Wed, 09 Apr 2025 17:39:57 +0100, Mark Rutland wrote:
> > These patches fix a number of problems in the FPSIMD/SVE/SME code, as a
> > step towards re-enabling SME support. Additional fixes/changes will be
> > necessary before we can re-enable SME support. I intend to follow up
> > with more patches in the near future.
> > 
> > I'm hoping these patches as-is are largely uncontroversial, though I'm
> > afraid they've only seen light/targeted testing so far, so any testing
> > would be much appreciated.
> > 
> > [...]
> 
> I added these patches to for-next/sme-fixes (and for-kernelci) for wider
> exposure. Not queued for upstream yet, I need to review and discuss with
> Will whether we target 6.15 or 6.16.

FYI: I see the following warning from 'allnoconfig' with these patches
applied:


arch/arm64/kernel/fpsimd.c:676:13: warning: unused function 'sve_to_fpsimd' [-Wunused-function]
  676 | static void sve_to_fpsimd(struct task_struct *task)
      |             ^~~~~~~~~~~~~
1 warning generated.


It's easy enough to move that inside the CONFIG_ARM64_SVE guards, but
it's a little strange that fpsimd_to_sve() is more widely referenced
and harder to move.


Will

