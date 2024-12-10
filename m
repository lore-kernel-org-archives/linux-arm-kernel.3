Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BBFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlBtkKSg8lW3ti58LJrV/UCgxIhql3nGtlnngu9OqW0=; b=lkV59LHYIAv9XGxZUAZ7Pgwxkv
	WD7+VgJNl5cNuqwRd5UPWVKLQoTbJr1LMVLyweH7tUpdC1Y7BuolRcVmMeat3+6h/hD23pStBP+Bs
	SW2+gNo1EnTViTcOQwjznGO04IHTfvJDHqSUQhiojlGRHP4Md0/+INYVmoxAQhprGqbesg8Z6gIp4
	jN/wUccHuU7DVOe0V/YW1Sc2kAmJFJC0LWZ48isV+jMWLb3/A0mCWJcy5jNgiHFYzqlOc9h1Bcrax
	NYDQZDSny+1t2k/yV47ka7mHrajppfoWD7E8ExZW3mDkPsKOcIzXY1ZBQfVETTTdSetlz23GcAq2Y
	ZH6lXTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL56W-0000000CPid-24PH;
	Tue, 10 Dec 2024 18:37:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL54T-0000000CPJX-1z1A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 556ECA419C1;
	Tue, 10 Dec 2024 18:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4695C4CEDF;
	Tue, 10 Dec 2024 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733855696;
	bh=vttEYAubWNzS+Rst5S57Guvga5iqDX/eDF9eIn6/hlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ug9DywyUt+XJD2W5ydcCPZZgNmDmDbzoXt0/YweBsgyVW3DGK17RVbkbdlg3es8l8
	 bfit4n5isKRh4RU+fZx140TotLElvirchWqlkk4SgdvPxtRxcJOGuv3bjqruHXGhEB
	 NCxC4jx9nxWyRgvBUkGtb12fqvI3uLHneoiRcrCNah7ueVM2AE0JBULiNs9igKiuXh
	 3O5juq6ewRDvjid3UTsEHkE0eenBiA/HPomYgzlEyIL8P7ZHOQKbA+6vLfdGM2MYVB
	 gWyZj0ubA3pQQSU9knizeW/QyMlmF2WGpLWaFZ3k/TNP3QTazq9se4SdkR3I3rYccz
	 qXxZO4WB7bC0A==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Ensure adequate HUGE_MAX_HSTATE
Date: Tue, 10 Dec 2024 18:34:43 +0000
Message-Id: <173383046649.3808051.6059989869125290793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241202064407.53807-1-anshuman.khandual@arm.com>
References: <20241202064407.53807-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_103457_571358_DEE828F4 
X-CRM114-Status: UNSURE (   6.34  )
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

On Mon, 02 Dec 2024 12:14:07 +0530, Anshuman Khandual wrote:
> This asserts that HUGE_MAX_HSTATE is sufficient enough preventing potential
> hugetlb_max_hstate runtime overflow in hugetlb_add_hstate() thus triggering
> a BUG_ON() there after.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Ensure adequate HUGE_MAX_HSTATE
      https://git.kernel.org/arm64/c/1e5823c8e86d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

