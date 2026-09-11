Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7349EC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCQJdO+gcDYaLwxsyj7iLgxjhNkJNg/NQiNWcjgUgJY=; b=2uLdMghIeABFVJmZTvGq+XQAPm
	T1KXjhu07VE3dpSxIkQhc9ooLGlWGsud9OlgrQ17J8mcot5Q+yDYY/Jeq0kRXea18jQMfgD1NB2Br
	kSNE8pPU3mA3oXG8mfcvbNQURs3jVsWKOo0390bz6YCCReZ3g40eFGHxwo5HUi/0ywSUZfokidglD
	gr7fpQmrKMvV+oV2ETQS8OHBkQjq5wz/eOEu4MeG9MB4m6hupSSSUWHbsh74s77mOVE6PNQMJUaUY
	J0ShIa+ZWcZr78Vn80A2LoytPnHijxto5y0xTueoZ5TO2DRSaspPdPmTFGUxNOjTQ3757CHTWJIlo
	Oh0wF4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z1s-0000000GSW1-3CKL;
	Fri, 11 Sep 2026 11:02:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z1q-0000000GSVZ-2YuQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:02:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1230B1570;
	Fri, 11 Sep 2026 04:02:42 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 429CD3F7B4;
	Fri, 11 Sep 2026 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789124565; bh=2BtxCMG1UX47JcL8m4ihOyCgKpPZe06qT00gvOC7j/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=obUGDoB5mO5ZapOGEOXwSu9TIw3WlzWx9awf9ut2JExQ8RhFeGflliaoHfZyd+u/U
	 IMlwzcDeztMq8+YNnw8RP8xsZDLDK5C2dWf/OiiRb2sxsjmf0YppaQ5RMniifYXrcf
	 z5ARdbhFgjGzNQwBNdc2PGQgUbIXJef0PVM8Syts=
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
Subject: Re: [PATCH v20 14/14] KVM: selftests: arm64: Add GCS EXLOCK exception emulation test
Date: Fri, 11 Sep 2026 12:02:35 +0100
Message-ID: <aqPfy3EkSodbANj0@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <da1439eb-8205-4ba5-b37b-7a9aa37e1701@sirena.org.uk>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-14-f31750bdfadb@kernel.org> <aqLm3qT755sXH_D9@LeoBrasDK> <da1439eb-8205-4ba5-b37b-7a9aa37e1701@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_040246_697283_16AB6927 
X-CRM114-Status: GOOD (  22.56  )
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

On Thu, Sep 10, 2026 at 07:26:59PM +0100, Mark Brown wrote:
> On Thu, Sep 10, 2026 at 06:20:30PM +0100, Leonardo Bras wrote:
> 
> > The part of re-running test_udf_exception() with HFGITR_EL2 set, IIUC, it
> > that part of fine-grained traps. It seems correct, although I am not seeing
> > any tests of the EC syndrome being 0x1A to make sure it's in use.
> 
> Now that I look again this isn't actually effective anyway, we would
> need to run the guest code at emulated EL1 which for something that's
> basically just a double check.  I'll just delete the extra runs.
> 
> > There are also a lot of expect_exlock being used as an int, even if it's a 
> > bool. I understand the idea of summing it as we expect it to be 1 on true 
> > or 0 on false, but is it really ok?
> > Maybe we could change it to int, so we just set it when we enter 
> > test_sysreg() or test_udf_exception() like:
> 
> > -	expect_exlock = enable_exlock;
> > +	expect_exlock = enable_exlock ? 1 : 0;
> 
> The conversions between int and and boolean values are part of the C
> spec and widely used within the kernel, we don't need to open code it.
> A zero in a boolean context is false, any other integer is true.
> Similarly false in an integer context is 0, and true is 1.

Okay then,

> 
> > If I got the workings right, and both above suggestions (0x1A and 
> > bool->int) are either fixed or considered not an issue, then:
> 
> Thanks.

Thank you!
Leo

