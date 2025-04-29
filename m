Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F9AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 20:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfuj549p8lQy8pE7QvfsFMSx1xQ/zrdmAofJp1fea7o=; b=ZbJOPiGyQ1YG7zpe/oSNXkssmB
	jC6lyG+8y5MYHbWXpnXAiuMUT34bveXqIjrUXe5W7vfNPFtd9A3lvqAI6aGrLlSVi3ZTculHD3l/k
	hFEz5GgCwd58fkG6KYa2NSHWvebKP6iXXEF1sGh7Nz66AxLJPp7fBsed4evesd4BgZEjblNvggOu7
	nX6KvmxVXCzNS9GSoBUJiuKLZhEtbDb/0QNi2E9SW5augILxqpJUnyklRAZ+sgKOKwn7YoZtDBIOf
	FX3vP99E+vHfyvu3/Ci5deqNnvqYs2TZiHh6MirlhSY/wEFbCVxLx+DHgl0ByJ3i8PyuI4J6GumoA
	9P78ASQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9reN-0000000AlGa-1b5G;
	Tue, 29 Apr 2025 20:33:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rYi-0000000AkSM-3ZAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 20:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59D32A4C0BA;
	Tue, 29 Apr 2025 20:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EE6C4CEE3;
	Tue, 29 Apr 2025 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958483;
	bh=MQH9dAaTaIg0ur9/5v4Mb+xBkI4AfjNQQm26Qr4pKTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcewA3nQGO44qEhUyevWkkgOdZVEYyYhO1BiKNX5pw1i3V5LHIhomBcwitEj22tOv
	 MjjzT2mvHqVNcrXKbOZIZBFil/KBxEDxiS7+oGh9mfect+tA4VeJ6IWqhGVg1f7rcQ
	 KP3c953dfFRxJF7uLa9LIiKyYv0TNhTe4bY0lMHS/3fRc31EOquDOQuJHOznIa0Syd
	 qSEjOAAfpuOEbICz91QTUYXsD1mcSKfIx9xzLc/How3KxqyJL6yWC7jZx7lGZTdzVr
	 wFpfC+9DkBkuCcQFWrTsmdxdqELQmzG08qcr9K6hk9ztSEW5m+iLgh813OygCFut+H
	 8ARjgUeWnyZ0w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Bartosz Szczepanek <bsz@amazon.de>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	nh-open-source@amazon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Extend pr_crit message on invalid FDT
Date: Tue, 29 Apr 2025 21:27:44 +0100
Message-Id: <174594023826.474412.9245389283026480521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250423084851.26449-1-bsz@amazon.de>
References: <20250423084851.26449-1-bsz@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_132804_955007_4578470A 
X-CRM114-Status: UNSURE (   7.70  )
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

On Wed, 23 Apr 2025 08:48:51 +0000, Bartosz Szczepanek wrote:
> Log size in addition to physical and virtual addresses. It has potential
> to be helpful when DTB exceeds the 2 MB limit.
> 
> Initialize size to 0 to print out sane value if fixmap_remap_fdt fails
> without setting the size.
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Extend pr_crit message on invalid FDT
      https://git.kernel.org/arm64/c/83a39eccdf2f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

