Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2BB10A88E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DJjEK7p/gD4AhY5fHVgHOxoc+DoCfDYK2aGxJdtPis=; b=Pbr8Rwkryz+5Jzng0BC36RCPaJ
	FPPAj9FTeacDBP+X+KBVz/NSGbLISqwFS5jmlxjbsaYbZHwSgWy9fz0yWFtqfgjOae/dBlSMmer4h
	280EMascf65FvzLzBRyyn3HymbExBVCL4uWlua4pHXB+3hD379wgg9XGhZDXU/ma892SQhP4QgmDq
	1KEUlc4T4jY9KmDAzIdS7QTwsxMIzwaFvUU+LH+WAFPV5mDNzXwwvc+WoZT9XrAEVABNmTD55jyII
	oWq5rMXTBbCAQElSNKCzld2WN6PUj13ZEJtWI6xsc4VGk6/0ZykyOsrb3MgFboL5bG/cq3nYfYkJw
	xPq2Lt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mjC-00000005ksJ-0qQZ;
	Thu, 26 Mar 2026 15:34:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mj5-00000005kqQ-1LZm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C5DA42A52;
	Thu, 26 Mar 2026 15:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F806C19423;
	Thu, 26 Mar 2026 15:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539266;
	bh=FqheqJk1lL6/P39LtBNTxi4+TPbTmvmtoB118+COPRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N/OddXjaNt/vGeELtgAtqyNwf84ftpgYLToGk2lM9YUjVXbDQ26QaWoqsaHAKCg1t
	 l62qEQyUv7WIb7v7+q+t8uxvqCXLRGVzAqm1J7uh0Dx6vkkTpB93R7FIZ/ijB51bYv
	 6xVXVRvxxD7LV6jMAsY8O1f9dKPonlWuPZs6rH2ztYRbbgZJkcDJKvMiK1aEVxi6X+
	 NvNUaPq6Cttxvrl6hh6d3P0BpFu+Zkg8UYMv5xq+0QZFwqLpgFY/XcpV96KoHb/AIo
	 vbp+0UiGSwASXdhoxT9kZh54qR3QMdxSLosfbaUN3P2AMV00APxkaeoOPinwNQ3qPu
	 iysrfvQmRm5wg==
From: Will Deacon <will@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf/arm-cmn: Fix incorrect error check for devm_ioremap()
Date: Thu, 26 Mar 2026 15:34:16 +0000
Message-ID: <177453861968.567299.14799580759740118541.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326090856.644136-1-nichen@iscas.ac.cn>
References: <20260326090856.644136-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083427_379593_9A3A6D6F 
X-CRM114-Status: UNSURE (   6.62  )
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

On Thu, 26 Mar 2026 17:08:56 +0800, Chen Ni wrote:
> Check devm_ioremap() return value for NULL instead of ERR_PTR and return
> -ENOMEM on failure. devm_ioremap() never returns ERR_PTR, using IS_ERR()
> skips the error path and may cause a NULL pointer dereference.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf/arm-cmn: Fix incorrect error check for devm_ioremap()
      https://git.kernel.org/will/c/d49802b6617b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

