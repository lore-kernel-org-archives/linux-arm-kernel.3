Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A74CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qnaHPg6iP3sdYW0QsBnXSUt8PSD+5wSNEoRlE1Vdl8=; b=cHKATbKI5Qid6xDAozldvVrMqL
	dYiwGUXLPCvM99Mhq4jXvuoAJcZ4mm2fOlCFV0UMfgNSsYx7ooJ80gKW4YgwZ0K+rTNw/K6gPMXk/
	MYOy9GxOYuwHCfffbdEI0iZKdkQ3l6ZJ9Hv8EZ+Mq5WM2vVymvJmRubksOi0PFNfb6D++r6uTDBy2
	q2AlDp8WtPvdAt76N8t3X4ElHgW82791+yqdebrsCrp6jIqSZspWhTgjzYAOh5DXTCgCccNDXa8aH
	YN/TQl3rYXA2DQcYZdawHDF67fRu3NPp2ax7PiORQmqjxWy6YMraMwW8xGv4rqxS8vtZDmffi9zqI
	bLVB5ANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visDs-00000006uA3-13KA;
	Thu, 22 Jan 2026 10:47:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visDq-00000006u92-39js
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:47:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A09F1476;
	Thu, 22 Jan 2026 02:47:21 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B68063F740;
	Thu, 22 Jan 2026 02:47:26 -0800 (PST)
Date: Thu, 22 Jan 2026 10:47:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: broonie@kernel.org,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com
Subject: Re: [PATCH 0/3] arm64/fpsimd: State management fixes
Message-ID: <176907881408.3864218.7907664253309151321.b4-ty@arm.com>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145107.1278972-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_024730_831158_AD5E7266 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, 20 Jan 2026 14:51:04 +0000, Mark Rutland wrote:
> This series fixes some issues for FPSIMD/SVE/SME state management where
> a task can be placed into an invalid state, resulting in subsequent
> problems (warnings, kernel panics).
> 
> Patch 1 addresses an issue [1] reported by syzbot, which can only occur
> on systems with SVE but not SME.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64/fpsimd: ptrace: Fix SVE writes on !SME systems
      https://git.kernel.org/arm64/c/128a7494a9f1
[2/3] arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
      https://git.kernel.org/arm64/c/ea8ccfddbce0
[3/3] arm64/fpsimd: signal: Fix restoration of SVE context
      https://git.kernel.org/arm64/c/d2907cbe9ea0

-- 
Catalin

