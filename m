Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D92CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpIf6n3gJRaiDqGUbmFy1IDlUxfl7GTbYupu2odIzrM=; b=aHwXDEZllyQzxGEcrGNNyOu5we
	ylAi4rNVICU64uzgi/tzBAYe77Y9azMcOE5Z+3PA2mzoSKFxUWAdg+EBkC2C46CWtDs2ag4bQPo7g
	2gkxGtRxJFhfCZUBTWcOijg6NLamztjReuR4dpTa6gx+rUs7optWbQAsF10rqs4emysu1AIsBenI5
	tYsm4I8g2NQqkhwRWvY/EHXlhACzd2qvJY0NY7FR+xgh/6L6RMGdyEh0ksD55AmjUoFoOYK7yY3hK
	2DYIuMgFtoSzjS0RYWlSlG9AhJKyE0Lx9Pv9AmIxXAQ/sbOruQDcN7Rat3VilPscM1bokoge/KDsm
	/7KW9D9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIuoD-00000007jHk-2UGW;
	Tue, 11 Nov 2025 20:17:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIuo7-00000007jFI-1W2K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE7FE40769;
	Tue, 11 Nov 2025 20:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FDDC4AF09;
	Tue, 11 Nov 2025 20:17:36 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Li Qiang <liqiang01@kylinos.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: add unlikely hint to MTE async fault check in el0_svc_common
Date: Tue, 11 Nov 2025 20:17:29 +0000
Message-ID: <176289222849.1642362.17670796678986309614.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250919033327.1942730-1-liqiang01@kylinos.cn>
References: <20250919033327.1942730-1-liqiang01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_121739_453223_7288773C 
X-CRM114-Status: UNSURE (   9.46  )
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

On Fri, 19 Sep 2025 11:33:27 +0800, Li Qiang wrote:
> Add unlikely() hint to the _TIF_MTE_ASYNC_FAULT flag check in
> el0_svc_common() since asynchronous MTE faults are expected to be
> rare occurrences during normal system call execution.
> 
> This optimization helps the compiler to improve instruction caching
> and branch prediction for the common case where no asynchronous
> MTE faults are pending, while maintaining correct behavior for
> the exceptional case where such faults need to be handled prior
> to system call execution.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: add unlikely hint to MTE async fault check in el0_svc_common
      https://git.kernel.org/arm64/c/df717b9564c8

-- 
Catalin


