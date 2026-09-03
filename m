Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62298C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRpxcHTybT23tsGpTTcr6sjQFQILQ8gOaqnkdcmha+s=; b=FcNgCfxCGQS0NcSHhVSkxbyRhG
	LvoZ1bdguiO5mxDnF27CpsPB76mpjByraGoIJBIniyTEHCj5tCdX+Yp+up4leaXPrIMlmyhXtusf2
	mjWXHmUanEryh1526rDcx/kjVkSE0++RStv36LaKQIrbjwJP9wBAM6IykQyAYvln5d5/QsoXk7z45
	A7fbtOiWRtwY7aKNxwORvwa6P72o+KwYXmrc6e9+9krgM+GQg/PR5xMdeujpOphLLpW8f/8h36e2Y
	bBbgfep05ZqFrnQCp2CYVVpEP0F7m9ZOBTSbqG6YYCKm0SD3tAAumADE9/KIcWh+g2K6eCw8gvHhK
	7VHou3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AUO-00000000Bm1-0Vs2;
	Thu, 03 Sep 2026 16:40:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AUL-00000000BlZ-0Jin
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:40:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60DB81596;
	Thu,  3 Sep 2026 09:40:28 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA2103F673;
	Thu,  3 Sep 2026 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788453632; bh=OSr2gscj+kDjyAWXtxyYR/gs/bwGrqEaiRW5/qbCIZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYFwU0f7t6o4OCU+/iylAHc5e01pAfXn4Gh0P5mqIl+Sb4zHG9QVJVGQ1d6dhtck0
	 L7K4Q4qXmw/xDige6jYLIjc/+39VF/2q5nlJpYLyPikD7Bny43n60HrtNgxy7sJZ7N
	 nCbU4IyZYpUdBVwZ8bPNza82EQkkJDTWxGsbwMSc=
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
Subject: Re: [PATCH v20 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an exception
Date: Thu,  3 Sep 2026 17:40:12 +0100
Message-ID: <apmi7HD54qGVVB7J@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0c1c0d26-4e96-4076-8863-b4e871e38e67@sirena.org.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-5-f31750bdfadb@kernel.org> <apmDRXBvS-XOi1NJ@LeoBrasDK> <0c1c0d26-4e96-4076-8863-b4e871e38e67@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_094033_180029_475A34C8 
X-CRM114-Status: GOOD (  15.20  )
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

On Thu, Sep 03, 2026 at 05:20:32PM +0100, Mark Brown wrote:
> > > +	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
> > > +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> > > +	// exception level.  See ARM DDI 0487 R_WTXBY.
> > > +	new |= compute_exlock(vcpu, mode, target_mode);
> 
> > Same nit: am I really setting one bit here? or could be 
> > more stuff depending on the parameters? Having an "if (cond) new |= bit"
> > seems more clear to what is being done, without needing to read the comment 
> > above.
> 
> The goal with the comment is to explain the rule that the code is
> implementing in a style similar to all the other field updates in the
> same function.

Oh, right, to be clear:
I am not questioning the usefulness of the comment here.

It's more about "new |= function()" thing, as it's not immediately clear 
what is being set unless I read the comment or read the function, as in the 
case "if (function()) new |= bit" I may not immediately see the condition 
but I know whatever it can be, it will only decide if I do or don't set 
this given bit.

Thanks!
Leo

