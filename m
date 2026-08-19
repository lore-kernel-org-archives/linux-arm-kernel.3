Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CE4C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSRKRvzCyqQeCM0NMBfVR2+qb7UnDkke/FO9NMIU29Q=; b=0TN7uZ+8og0SPGW8l9ORCi/Lya
	BxIekJdEoQZFlG2uXu/nM5GFLlSPdveEYda5JWGeFn/saawvypnOa2CV3bKLwRikzKoed5UKj4m31
	t1mwqcqPfZShs2I1N7XaodslHDanU9aPYPIiv4Ba6vz4Q9bY+OwtTXBx90p5PCaq2rVjzSbVO5uKi
	QqGq+V/YuEIRgR8O6hvRwlDkJHgYrqJKrrjGicYQVHWNR4uiWUjJnmckRlRn9A2MxrkqiQGdOqD8R
	rGWQEduCIINxqDROb2ZcKM1j6hRk+vJ3p57RvVwiHpeI3+KboKYS2BlYJeG6OlRkxTBF+BGeOzXap
	VYA7K9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjMH-0000000ACnp-2EDI;
	Wed, 19 Aug 2026 16:41:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjME-0000000ACnN-33j9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:41:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4E3414BF;
	Wed, 19 Aug 2026 09:41:36 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55E1C3F85F;
	Wed, 19 Aug 2026 09:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787157700; bh=25ho0NYij3g9I6d9bI+yv5urlO1j/m2cx5ybWXXuSV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+2MTGPbLA+b1cph9was2HgVwZ8WElXY7cms8edRNl9rxdj0ltIXLA3WHSA4/w3Ds
	 jXiMSUSdjYCgwGzjL1IXfz/69PJZVGcbZEXJ/3TikpNJ6HN5ge6WR5DylTTqhVw9aN
	 4o2cVN4w6k58AVK92Gzm8O2ENY3GKcCs5q+aXWZg=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 01/14] arm64/gcs: Ensure FGTs for EL1 GCS instructions are disabled
Date: Wed, 19 Aug 2026 17:41:35 +0100
Message-ID: <aoXcv8kx7x3GolaW@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a6fe8050-18f1-4013-8d6f-38ecc754c7e7@sirena.org.uk>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org> <20260812-arm64-gcs-v19-1-9105afd828ac@kernel.org> <aoWyeTx8lYGfiwYc@LeoBrasDK> <a6fe8050-18f1-4013-8d6f-38ecc754c7e7@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_094142_817009_82B1FCB1 
X-CRM114-Status: GOOD (  17.19  )
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

On Wed, Aug 19, 2026 at 03:21:31PM +0100, Mark Brown wrote:
> On Wed, Aug 19, 2026 at 02:41:13PM +0100, Leonardo Bras wrote:
> > On Wed, Aug 12, 2026 at 08:12:00PM +0100, Mark Brown wrote:
> 
> > > +	/* Disable traps of GCS instructions at EL1 */
> > > +	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
> > > +	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
> > > +	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK
> 
> > Which I understand to be the way of us saying that EL2 will not interfere 
> > on nor manage those instructions that let software change the entries of 
> > GCS. Is that correct?
> 
> Yes, the goal is to allow EL1 to manage things how it wants (there are
> controls for store and push in GCSCR_EL1 too).
> 
> > As for the asm routine, x2 at this point have nBRBIALL and nBRBINJ already 
> > set, and will be loaded to SYS_HFGITR_EL2 in the next block of 
> > instructions.
> 
> > Did I get it right? Is there any missing detail here?
> 
> That's the idea.


Awesome! FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>


