Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D3CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq0s5Fnw+sl1KkCos0qnvK+qJgK2ecEAIWYMksk++nk=; b=qjIpITr5TskNQR4iMtremGO3jO
	bwRPQaoY0nSJPN4p5ns8lYZ/HbzoEyvZA2UKEJmTkKpI6lTx5+MTQ9OP846loRt4DaAkXdd++85zS
	Gh6A24a8OoSiCqOPhM0iibB6P1cePy/0dV243TOLVr3rolk33TrbcGtHse1Q//H25liAYZ9j5V25K
	RntnUGx+Y8Tn2jz0UdeE+nHXS81XMUHHr7VFqzhjSnLlPqiWZbtpAI4FDtbve2B9CvWmxHGryTGBa
	AYTcyU7ip0a82SNZzt0Tj14qv4lWzpC0bk8/a9RBUDgaaz9MsYznRHgfse2WrrZh5YBmF69Xb3ABS
	HKg6g/1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOn2-000000001A5-2HlM;
	Fri, 07 Nov 2025 15:54:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHOn0-0000000017U-1hkO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 15:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC34161913;
	Fri,  7 Nov 2025 15:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCD7C2BC9E;
	Fri,  7 Nov 2025 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762530853;
	bh=sDHvLVRjvkDnU4qYqkoNhTswWRcf8/38VCp6BJVNsss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d0r+vnfjnLbi8Q/AnZ2Ue3FbPBj8Su3koMzDbjgoJTuSYnztZdDoXOYsMAm+Nt/Qh
	 3BxT22iVVGYfosnHBPE7d02klR4nDJ0MhuQ/E8DepSsZFvuERXd/z3qpAPpIbfl3c2
	 sjwYdeH21mA7o3wD7AJg873KEY3hH9RpUvk7rC0PjZreR+94zf57WsJE137WZz+H29
	 DguKiiU3xnFJgyDfwQ+0pDWOGt5L0ZKd8MtIpP+V2cIz7LVdZ90u3JwKi6zhI4mA41
	 eu0Ti4LNqIYPTQBaRj4IfMaYQKC789MqO8MCje+tQ+QXitlkk/GKw91+LaLGU5wwry
	 WOVPCKW4BBnEA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	punit.agrawal@oss.qualcomm.com,
	Yang Shi <yang@os.amperecomputing.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: kprobes: check the return value of set_memory_rox()
Date: Fri,  7 Nov 2025 15:53:48 +0000
Message-Id: <176252582270.594123.5776451852146900691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251104214947.799005-1-yang@os.amperecomputing.com>
References: <20251104214947.799005-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 04 Nov 2025 13:49:47 -0800, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), __change_memory_common has more chance to fail due to
> memory allocation failure when splitting page table. So check the return
> value of set_memory_rox(), then bail out if it fails otherwise we may have
> RW memory mapping for kprobes insn page.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: kprobes: check the return value of set_memory_rox()
      https://git.kernel.org/arm64/c/0ec364c0c95f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

