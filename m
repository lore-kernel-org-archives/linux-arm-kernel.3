Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7936D26D7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCn5hj9eWHpVImCtCq6gsgMUqg3ESuc40pmTiU/JMJA=; b=Q7rAUOo1qVmCh50CU9MIo96wzM
	fgVso6Ts5ABHVBWVDaX8FOplyuYIgUZqo4Tm02OrMnFc/aKr91ednvmqsVF4F+h34WIttmLvuXO4P
	xnki1AEyJ/lK78OU0rvOUqTdrbE8QY+SsaoPGtdIngSDr5x5kQExnFpiJw4hAILvI+mL/dCk1zOeK
	bbZvi0QmvFbfZ41ddmz0yqO9SPDECO1Rjhzldv6xlEa3IMXTlJwRzu/kNJAY1ikZO23WCG02Stq3y
	yMmG+ACRYnQ8CW671ebCUXcRLQ+qyWPsK6NWPBjdgVRJUZjXZbRfOQlKazpTA6wRqDdgDAdFjGk3j
	CzelEF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGnF-00000002rXb-2ZpF;
	Fri, 09 Jan 2026 18:01:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGnD-00000002rWt-1osf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 18:01:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EEDBFEC;
	Fri,  9 Jan 2026 10:00:50 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A458F3F5A1;
	Fri,  9 Jan 2026 10:00:55 -0800 (PST)
Date: Fri, 9 Jan 2026 18:00:52 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: rafael@kernel.org, pavel@kernel.org, will@kernel.org,
	anshuman.khandual@arm.com, ryan.roberts@arm.com,
	yang@os.amperecomputing.com, joey.gouly@arm.com,
	kevin.brodsky@arm.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: fix cleared E0POE bit after
 cpu_suspend()/resume()
Message-ID: <176798145230.2606771.17247725038196582505.b4-ty@arm.com>
References: <20260107162115.3292205-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107162115.3292205-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_100059_516296_1B38873E 
X-CRM114-Status: UNSURE (   8.36  )
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

On Wed, 07 Jan 2026 16:21:15 +0000, Yeoreum Yun wrote:
> TCR2_ELx.E0POE is set during smp_init().
> However, this bit is not reprogrammed when the CPU enters suspension and
> later resumes via cpu_resume(), as __cpu_setup() does not re-enable E0POE
> and there is no save/restore logic for the TCR2_ELx system register.
> 
> As a result, the E0POE feature no longer works after cpu_resume().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: fix cleared E0POE bit after cpu_suspend()/resume()
      https://git.kernel.org/arm64/c/bdf3f4176092

-- 
Catalin

