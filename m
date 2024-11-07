Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E89D5D682
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2Hnw5ox00U1xXCU/znSyperGILMwISO5VJpOUqND8c=; b=k7um2Ua+3uaovfZ+2jBYzrE7EQ
	3SnupJquMYm2rFReyRnSREOIQlcF0YZStLd4oiBRNkfgwJwd+KZ37uaesbydnT7xsO6GBkCQLXdbT
	0XVfkuYVC6L6Vx3p2jhj6ZIRiQHw0M2gF/cBb55ORwfnBqa9QW1fYkta2eLpua2nlvEXpNHkZ08sC
	w88g4m8GE9ZR2K0qNZ6cbpJ0EJWSZZRwuxCGFupXFYCWHRHMTocr4V5lqvjCWX32kWs/sneFeHhnl
	iDNM3o2pdoQvWigX/pVvHPCBYXMzrRT5djXimJrUlWt0ibxBfo5Ef+ucoaE6tzTaCtmhDymUwmHdZ
	nSevXJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97Rw-00000007xL1-1GVm;
	Thu, 07 Nov 2024 18:41:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97QB-00000007x7P-1UEC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 18:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6FC8A4495F;
	Thu,  7 Nov 2024 18:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5FCC4CECC;
	Thu,  7 Nov 2024 18:39:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] kselftest/arm64: fp-stress signal delivery interval improvements
Date: Thu,  7 Nov 2024 18:39:50 +0000
Message-Id: <173100478595.985049.4978407619921174171.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
References: <20241030-arm64-fp-stress-interval-v2-0-bd3cef48c22c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_103955_477627_47F3D562 
X-CRM114-Status: GOOD (  10.97  )
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

On Wed, 30 Oct 2024 00:02:01 +0000, Mark Brown wrote:
> One of the things that fp-stress does to stress the floating point
> context switching is send signals to the test threads it spawns.
> Currently we do this once per second but as suggested by Mark Rutland if
> we increase this we can improve the chances of triggering any issues
> with context switching the signal handling code.  Do a quick change to
> increase the rate of signal delivery, trying to avoid excessive impact
> on emulated platforms, and a further change to mitigate the impact that
> this creates during startup.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/2] kselftest/arm64: Increase frequency of signal delivery in fp-stress
      https://git.kernel.org/arm64/c/a3590d71a1ac
[2/2] kselftest/arm64: Poll less often while waiting for fp-stress children
      https://git.kernel.org/arm64/c/161e9925053c

-- 
Catalin


