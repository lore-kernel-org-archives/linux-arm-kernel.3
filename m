Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0DFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 20:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u02uUVeQNiyNbJa8Rg079QEnS1rD01ZKD/7Db1qvEMA=; b=jIBteKSVIuNUm+xgYOKYDg5fXk
	lNsf6WudKOvqPFR+tAxuJ3Vte2Av5nC7DjdPKHpuoR7FamW8wiX+dliPzbyVDWw/HqhTlri4wkzoo
	BqMrV976y0rDPidvhlt96KzOojnsJQCS3rXcybM1gtnt1mdPf9+uoXBu8CO3qSy/CJIakzrnCFdiw
	yQ8mXEfQNGLE+VU9vFkNlbtQL/yXIJIBBl1X6/TorXGE9hGmMcmdCAx6dga31+7cSQLTZ9zTyZNxj
	oGEnqnR03h0++5+7lXU9O68hlqqB3SSxIMvGXohF1ZQWNvYo6BNGZrzMDNTtJesQNy0JTQTw6YfMt
	LLeMHqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyG1W-0000000EEx8-1Xne;
	Fri, 28 Mar 2025 20:09:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFzl-0000000EEjl-3E7k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 20:08:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9466EA40CDF;
	Fri, 28 Mar 2025 20:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFD5C4CEE4;
	Fri, 28 Mar 2025 20:07:58 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Keir Fraser <keirf@google.com>
Cc: Will Deacon <will@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64: mops: Do not dereference src reg for a set operation
Date: Fri, 28 Mar 2025 20:07:55 +0000
Message-Id: <174319246799.4193737.16793512862638162147.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326110448.3792396-1-keirf@google.com>
References: <20250326110448.3792396-1-keirf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_130801_870965_476D4FFC 
X-CRM114-Status: GOOD (  10.14  )
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

On Wed, 26 Mar 2025 11:04:47 +0000, Keir Fraser wrote:
> The source register is not used for SET* and reading it can result in
> a UBSAN out-of-bounds array access error, specifically when the MOPS
> exception is taken from a SET* sequence with XZR (reg 31) as the
> source. Architecturally this is the only case where a src/dst/size
> field in the ESR can be reported as 31.
> 
> Prior to 2de451a329cf662b the code in do_el0_mops() was benign as the
> use of pt_regs_read_reg() prevented the out-of-bounds access.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: mops: Do not dereference src reg for a set operation
      https://git.kernel.org/arm64/c/a13bfa4fe0d6

-- 
Catalin


