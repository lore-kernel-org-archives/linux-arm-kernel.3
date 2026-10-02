Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF785CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hvfR2E8S9z+CTbBZW09MXt9M7UaQPE7GG6w418WJ7I=; b=eBcdQkRUAeIW1U+8ZWuNWqo0do
	AwTDChHnH/pdTEZnayPbwjSDX1FsBaHXUjG/1w7YJx7UED9NSCbl04/6r6/idKAbePszYOTfnFYnu
	utvAoiHUqiJW6pNM1cVXT6nU/VkFKocFH4eyeTGSg6B/Wk9JaIPKDMrkzkylflFm+bpj9QMy+GBIr
	82M0XILwjHPrB6AH499YTv6NgNNGijpsOBbJXscrwlIQ3gzNHaf+up40lRwVm1Bsdi0Tvg813WDcD
	OG5GLeW5Bd3Up0Br6AaJvkO2EUURUg12J25sJTe+7dBxuydzIu/uzsssupo4hGcCtuXkkrvRpX/sC
	NpXRt8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiSf-0000000CKG0-1ff9;
	Fri, 02 Oct 2026 18:58:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiSc-0000000CKF0-2tXX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 18:58:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28F722F;
	Fri,  2 Oct 2026 11:58:17 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4B5F3F86F;
	Fri,  2 Oct 2026 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790967500; bh=iTtl2dl5UCNDlwuqM2xPR046WVi8G4ViELSur05jQSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFowl8awamZz32Weo45bzjzZE3XvbdxWvLXA1wQVr26yrIXatyHfGYB41oNOAM5N/
	 zRvVwAQaB48DiLx46YJNZ06binXG9Pp113BYE8ugiqGsmicsbsof+Fql8g07acX/oz
	 Sm2BOf0muaOUMK3Wmj4UPhZ8CbA5RmtHA0JQNxPY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Breno Leitao <leitao@debian.org>
Cc: rmikey@meta.com,
	kas@kernel.org,
	usama.arif@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] arm64/sve: Don't zero the SVE state buffer when the SVE state is live
Date: Fri,  2 Oct 2026 19:58:11 +0100
Message-ID: <179096749123.2363044.5221430791699446886.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
References: <20260915-b4-arm64-sve-acc-memset-v2-1-14b7ab9c71bd@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115822_780098_6B46A268 
X-CRM114-Status: GOOD (  11.10  )
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

On Tue, 15 Sep 2026 03:51:05 -0700, Breno Leitao wrote:
> Currently do_sve_acc() always zeroes current->thread.sve_state. This is
> not necessary in the common case, and avoiding the zeroing has a
> measurable impact on some benchmarks.
> 
> In the common case where the task is not preempted and its state is not
> altered by a tracer, do_sve_acc() will observe that TIF_FOREIGN_FPSTATE
> is clear. In such cases, only the live register values matter, and the
> in-memory copy is stale regardless of whether it is saved in
> FP_STATE_FPSIMD format or FP_STATE_SVE format.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/sve: Don't zero the SVE state buffer when the SVE state is live
      https://git.kernel.org/arm64/c/d6ae12c900f2

