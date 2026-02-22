Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEACC636C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DV1g0YpwB/hE6KH8OS+6OQvyTYSFQ0UrSYX7sQhRMfA=; b=Gy3UuUHkZj+OtcmN7v0Lhm4hoX
	47zN014oEplg3t4J06u1bK2CbtWGxNRFi+HQ5LxU1Uc07RkSsbNF3nsu2+6yYqZpP3ZaOP9JRrZG2
	HoQU445sMdnHu3yP8mCQQ7YSaEK3NwTwjHLNpJnCmjWxnqyEBykYkg4JqrY0isXcmBT9ICPLGmgZD
	9b9cAQ338VDB6XVP4yLW05yVtKgvZdcNEd5MkGOkwxrFyeznlq3GzRTZsjVWkg1dfOrPhm11v9Zkl
	BtlP+XbVKzrpDDptl9KKzejkx13p5h2nr083NjGpa1bPDRTjl0zwabKgiyvYAb7v+xS/FU04VW9QZ
	Gbzts48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuHak-0000000GygU-0S4i;
	Sun, 22 Feb 2026 22:06:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuHai-0000000GygL-3035;
	Sun, 22 Feb 2026 22:06:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5DBA76001D;
	Sun, 22 Feb 2026 22:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B60BC116D0;
	Sun, 22 Feb 2026 22:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771797974;
	bh=4eFrB51vniyDERNmsKInct9htMUnpN6fsZBWfR52QiQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Cn8vgPj4mxX/Ll0NNxY1rQwyJ2pusRMOvLr6phG9p6gsGRAzlf4/BqZMz0IR1eegO
	 nD41Y1xg/GrK6J+HZQBAX4DqPTDV6jWZ4b9MpwmBVQHs7wsv2oY4rqo+x7wAzQCHPX
	 d7iYEf131h0dO4lq+ddQLExi/dcglJM9/+SlLW1ZF8dsMTPgM3V6WAWaV74e1l4jvB
	 WizgJtcqW1z2zolPD8uM9Bxdc/FMrhvx/JSOH3lz6ZLEn7AUWZrHbrKYd3Krd/IYhT
	 8rLK7nnQmo7/XHmBdPjYCnMTO4jL4vyM+aJdRTEhlhm49QCigwEgT/ZvLJGqMJ3w/G
	 HdtVVrM7tMQqw==
From: Thomas Gleixner <tglx@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
In-Reply-To: <20260220090922.1506-3-jszhang@kernel.org>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-3-jszhang@kernel.org>
Date: Sun, 22 Feb 2026 23:06:11 +0100
Message-ID: <877bs4wi0c.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Feb 20 2026 at 17:09, Jisheng Zhang wrote:
> Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
> is a pointer which is set during booting, and every irq processing needs
> to access it, so it sits in hot code path. We can use the
> runtime constant mechanism which was introduced by Linus to speed up
> its accessing.

The proper solution is to use a static call and update it in
set_handle_irq().  That removes the complete indirect call issue from
the hot path.

Thanks,

        tglx

