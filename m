Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA9FCD0424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FdaQqxDsHIc/tUDTanXXS05tkq7OE+GcHX/z6IjsVE=; b=eI4Q90NzfE7/S4Zf0FxFJfwtVZ
	V50sJxk0ccKdyBb27NzD5D6zrJF2abQlle3xWeIYQvmW+metanmiBBIEef09ZqTAAD7TwHQUwzuR1
	n1i+tCX8ZEPWIBL67nIE24EdVwolSBDkQwCkH5dR0OBITc4Py0ISLr5PStZKY8+QthN3ltQlTWh24
	7m5kVlslV4xfy1k3gJhgZPzzvoD88xAw9MJtu4cyyk2H/VTVmBySyLKah/5D+59B2AKCkzewchfTZ
	06n7qCCiuHsXfCXFRrA4WBkItnB8z60EG6c+Z5zXzzGblFoE7Gu5t+rwrO0At4wR0F/KrPV840IHh
	+Gj2z6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXR-0000000CCus-3oHP;
	Mon, 05 Jan 2026 22:59:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXN-0000000CCsI-2o1l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 487A743B82;
	Mon,  5 Jan 2026 22:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEDCC16AAE;
	Mon,  5 Jan 2026 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653937;
	bh=JFPOBvbTjmeMqXOwXhUAcaRqRs6h5mCTAz9J+WLFGV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vCKsMQy9EpaX08WQG2C4dwkfLcRRS+BH/zMGoHUv0EWLDweFyqvrTylCH4BCl1glb
	 O5usHNjvzbmnwACa4EuLZjX1K6H79oOmIOR+147TEGSzWYJzGYUetWWV7GmkF09h42
	 7P6hWwN+CqDEE2uWypmaQXMHYbgB2ih3fihvDjnUcvaVtL6uzDDhHT4QN9D6usTX9L
	 Sz4Q/eneWLGNws3wWK05aRvASSA9VhrTz0nLyZKU+iD9GgTAWG/Ys9fujsM8bpn1Ee
	 71VIOZMm0hjh0a8a76DSRbxcUP6mLO4VuBwpsAcQWnUnXrA66OSNQxl87tzvOaOU+M
	 3O3I1EpK/M8FA==
From: Will Deacon <will@kernel.org>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	catalin.marinas@arm.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: simplify arch_uprobe_xol_was_trapped return
Date: Mon,  5 Jan 2026 22:58:25 +0000
Message-ID: <176763137996.1384236.2783577028215975576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251126223130.216302-1-osama.abdelkader@gmail.com>
References: <20251126223130.216302-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_145857_732848_89F72100 
X-CRM114-Status: UNSURE (   6.21  )
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

On Thu, 27 Nov 2025 00:31:30 +0200, Osama Abdelkader wrote:
> convert arch_uprobe_xol_was_trapped() from explicit if/return true
> return false pattern to direct boolean expression return in
> arch/arm64/kernel/probes/uprobes.c
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: simplify arch_uprobe_xol_was_trapped return
      https://git.kernel.org/arm64/c/484626209600

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

