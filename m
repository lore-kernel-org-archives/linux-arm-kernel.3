Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC6EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ny+LUnu9xvKN0aD8BQK/iTR719SsfNqWnW99Aaj3GkI=; b=s9t7Qic/rSQ7xVAOspTuAHkQhu
	TbyYZreb9ocv4vKB3fVEmU2OMaf9plyHYF1VpmRukOVzCxNXpS1rzyhADVmGt+raVgvhR1Lce6W72
	fNKdtzoUL07XcW24moYis2777+/qlWWWhAGf5UYqSPuAZPRxblexT6/vW8/NnRPdjt4dByZTNti9S
	tTod8n92f88UF/35dxD2qwsLCvDss2Xgznc4wbLnhu2LF4Qlibxcce2aHY7tMP3aIx9CAbPtD9j8Q
	hauLUUgae7g4hm9JljTnQbo5N6lIF6Ylju2xBdOO8rMBLeKFYk2sr5ZxYJl9bbhXJM4F0mJsy2Sxn
	HWllQpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lhl-0000000CQAb-2ouP;
	Wed, 09 Sep 2026 17:03:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lhj-0000000CQ9M-00Lt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 17:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ny+LUnu9xvKN0aD8BQK/iTR719SsfNqWnW99Aaj3GkI=; b=RYVZDAy87N4jNfrdQLE2iPtUZf
	qWnDCLHR5eXdK/3Dn0/JRNexVH813ZRg4awAhtPlxtvy8++NJ7gQI9SHplhgpBzhbtffaDb9laFm3
	CPn2NpSFsLYB92hb26V0lgZP0WKbmqL5Kaj4cc6g3QACBau7FM2ijFITEDePL1JoanET98e6SjwLC
	jic2Et3WTSXexV3x8QsKQsOGyDa3XeuIOFQtug8tam17k8vmdwM2Sn2z5yAliltmxZWTDejI5fXvD
	elwTGUqGCoZUIr/pQV35zStIphM1lfR3Nif+fVvMwRRDmfFr0yHCblbvV4hxGQjcBCYjH1gsb3L93
	QkcooMTQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Lhf-00000001T8e-3BBO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:03:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37F6A1576;
	Wed,  9 Sep 2026 10:03:13 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B54403F528;
	Wed,  9 Sep 2026 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788973396; bh=512p7lSBvw7xCoQBN0yV7GJl74kb4lk+PPjU1dHXIlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTwgjEGog+sjhQtxbp4isbtd3o4wjAB5zOfu2pnJ6izw0A6Zy4yfUfF+WLSy8gwWU
	 p0mmuqeUyga+mogdErUqUJcuVQH4Pe4yDzpEdp4KcwKvNJVezDJ9YqA/wHXrR5bG6A
	 ZxsYHAoHzYR703S1v95m/VGp7yK/HqbzAqj7OAyc=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 12/14] KVM: selftests: arm64: Only restore SPSR_EL1 and ELR_EL1 if they change
Date: Wed,  9 Sep 2026 18:03:12 +0100
Message-ID: <aqGRUD_UdInNyWik@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-12-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-12-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_180320_063160_9674A6B1 
X-CRM114-Status: GOOD (  21.93  )
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

On Tue, Sep 01, 2026 at 10:47:10PM +0100, Mark Brown wrote:
> When EXLOCK is enabled for ELx writes to SPSR_ELx and ELR_ELx generate
> GCS exceptions. Currently the selftest helpers unconditionally reload the
> saved values for these registers regardless of if the handler didn't change
> them. This gets in the way of EXLOCK testing, making it hard to generate
> contexts which will generate an invalid ERET since we never get as far as
> doing an exception return while EXLOCK is enabled.
> 
> In order to facilitate testing of nested virtualisation emulation of EXLOCK
> change our reloads into read/modify/write cycles, suppressing the writes
> when they would not change the value in the register.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/kvm/lib/arm64/handlers.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/lib/arm64/handlers.S b/tools/testing/selftests/kvm/lib/arm64/handlers.S
> index 0e443eadfac6..367c22d61cba 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/handlers.S
> +++ b/tools/testing/selftests/kvm/lib/arm64/handlers.S
> @@ -33,8 +33,18 @@
>  
>  .macro restore_registers
>  	ldp	x1, x2, [sp, #16 * 16] /* PC, PSTATE */
> +
> +	/* Suppress redundant writes to support GCS exception lock testing */
> +	mrs	x3, elr_el1
> +	cmp	x1, x3
> +	beq	.Lskip_elr_\@
>  	msr	elr_el1, x1
> +.Lskip_elr_\@:
> +	mrs	x3, spsr_el1
> +	cmp	x2, x3
> +	beq	.Lskip_spsr_\@
>  	msr	spsr_el1, x2
> +.Lskip_spsr_\@:
>  
>  	/* sp is not restored */
>  	ldp	x30, xzr, [sp, #16 * 15] /* x30, SP */
> 

Ok, looks fair.
I don't think there could be any effect that would happen only for writing 
to the register (when nothing was changed), so that should be safe (as long 
as it does _not_ run in multiple threads at the same time.


If that's the case:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

