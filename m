Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC3ED41D51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjdBwpEZCDaoTD/gAb2aAQf0i9Iw5k1DkhI9gffkOko=; b=f8ig/18qTdHsOXC44+D4rdJA7T
	H89x2/db6qUeMqsKg2ANdkTvabTXxvmbcWxRk0vkurSQLAYuukMJjJMFcF1cCTapXCqZ9lw3dVsOZ
	fIqnXba9/Os4abh0vrCfs/N+7IiFMRTjyp0V2IuLKAGnbLnvWzgggTTKmiyw7EoMwnizPbkHWr2zQ
	JJVdNY3iEMMotymFZBweC4UKmbBA9/Wt6a9RMIQ7CeCS/hCBrWabb+mTnSi/UyK9VhAgDXb+QM0ST
	GeYfopWjKyQIDX+cpM47H5XMaabFbBDjIYEWeEL5zsysyO/r+10QEJa/IMo6tLinpV/PqFl0OqZdP
	YDkhV/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAr3V-00000003bPN-1VWD;
	Tue, 12 Nov 2024 13:35:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqv6-00000003Yer-1jGs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:27:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADA9625E3;
	Tue, 12 Nov 2024 05:27:26 -0800 (PST)
Received: from arm.com (RQ4T19M611.cambridge.arm.com [10.1.30.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F62A3F66E;
	Tue, 12 Nov 2024 05:26:55 -0800 (PST)
Date: Tue, 12 Nov 2024 13:26:52 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/3] kselftest/arm64: Add FPMR coverage to fp-ptrace
Message-ID: <ZzNXnJ3Jc45CctCs@arm.com>
References: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
 <20241112-arm64-fp-ptrace-fpmr-v2-3-250b57c61254@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-arm64-fp-ptrace-fpmr-v2-3-250b57c61254@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052700_999737_E1652212 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 12, 2024 at 01:08:16PM +0000, Mark Brown wrote:
> +	// This has to come after we set PSTATE.SM
> +check_fpmr_in:
> +	tbz	x0, #HAVE_FPMR_SHIFT, wait_for_writes
> +	adrp	x7, fpmr_in
> +	ldr	x7, [x7, :lo12:fpmr_in]
> +	msr	FPMR, x7

Did this build for you? I may not have a new enough assembler.

fp-ptrace-asm.S:149:6: error: expected writable system register or pstate
 msr FPMR, x7

I changed it to REG_FPMR locally.

-- 
Catalin

