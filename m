Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8D6C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBp3ra3fmCT025uU5plL0vJAZeFepBpmjLKuIBhz+Uo=; b=PRDGqAlkCX3W0zX/9u9gxx5TzD
	FnO9rVZD8tPxud82BNSBT2C9DLtWImVHge4eUIhUr030wklOAsLX0baqLTOPriKiXqJZRJPi1iEn9
	hToEhGgfEhI9ab8vV+EbcEUkNrON3qO3QAKf1m+onlytlR8Uyercte99s/sPGtr1E4npnm8BEm8Le
	WWQi/RozsvqqCNLhR1R/XEtqvcmiUu0kO2gasxPwJ0nNnqDaA17xxmEp+MpPS/0gf9oSLfCf/1rn+
	2nziUqPL4eMtnVI3lxQSA1PxLoFfryoGA0CZCXpD/Gkis28HZOu1LkqkTyVWp+ytHekGkS9Di+UKq
	M/iJTXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Br-0000000Bvvk-3OBB;
	Thu, 20 Aug 2026 17:04:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Bo-0000000BvvJ-3999
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 17:04:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07F79153B;
	Thu, 20 Aug 2026 10:04:23 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D1393F763;
	Thu, 20 Aug 2026 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787245466; bh=MzjPfbXUBxp8rxesicfs3Tm8H0ScdeMdlbod//WyAiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OX3RjfuOP4Q4dR5jtZNkDU4QsH/FXs0HNn8SVT57ECA2JGEbrLPGuj4uEWySVjLXS
	 A4kDhP1zSOz8p2ODduOVRigYngb2OPdL3mQl0sPlV4ADQb/m+UsaV9slhRSo8wRr8t
	 9iudRy5Fy+Maxgr8LAoTWkRrdhP/goZnQ3UVkUvk=
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
Subject: Re: [PATCH v19 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an exception
Date: Thu, 20 Aug 2026 18:04:18 +0100
Message-ID: <aoczkgxXzqtotl9G@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812-arm64-gcs-v19-5-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org> <20260812-arm64-gcs-v19-5-9105afd828ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_100428_924732_EF4BC695 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, Aug 12, 2026 at 08:12:04PM +0100, Mark Brown wrote:

> +static unsigned long compute_exlock(struct kvm_vcpu *vcpu,
> +				    unsigned long mode,
> +				    unsigned long target_mode)
> +{
[...]
> +
> +	if (gcscr & GCSCR_ELx_EXLOCKEN)
> +		return PSR_EXLOCK_BIT;

Nit: here I would do:

	return gcscr & GCSCR_ELx_EXLOCKEN;

So that...

> +	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
> +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> +	// exception level.  See ARM DDI 0487 R_WTXBY.
> +	new |= compute_exlock(vcpu, mode, target_mode);
> +

we have here, instead (naming is bad):
	
	if (is_exlock_set(vcpu,...))
		new |= PSR_EXLOCK_BIT;

this way it looks more like above sets, such as this one a few lines 
earlier:

	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
		new |= PSR_TCO_BIT;

How does that sound?

Thanks!
Leo

