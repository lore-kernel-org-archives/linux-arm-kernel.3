Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368CAD2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXeBQrfMB1oFRh68MwNF1o5ehVrUHwito2tUwLJeF/Y=; b=Xjvg7vDk0Xd9sPo7E2FcCoRtTU
	BOcyJQ/tVbtjBC+JJE71vo2FzNrO2nyP3ty4NgMInR0zxCCSgDZa89fqryOq2i+HC/61IWpCIOIVi
	hIXsoVXbJE2kCy7W44h27BKpHLmUuRF0Ulit6tHRxXuA1z2M3+mQFCTC1jy8JFYyrc0DuVMODua9I
	5SiXEJLjZ2K9Kr24v4XssD6TyBzXfTv/4aBvnHptjwV+HoJzl2wLGXzEk8DVtIAFkMx0y4N3aMe5F
	Owbp6oi8w1TE/eRgX7h6q7GKe6vkzCg+zKFjghjnmxC10aKbo7yqBBAOzDTez3Z51GOqw4nttG5L9
	5KUQH4kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD4n-000000041PX-19OM;
	Tue, 20 Jan 2026 14:51:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD4l-000000041PP-40k0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 14:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qXeBQrfMB1oFRh68MwNF1o5ehVrUHwito2tUwLJeF/Y=; b=MUg/lq7llhn2Cdmd7cBg/V/2b4
	mEeqEBluu5NUicm2owDaqGtWtRYxLfe7htarF6LsvyeVaEDciGcsasm9GDtjnNlNwRLFiaRRPs+xr
	1UelJh6y73/uyXJuMsxzA/7YR4RErmkmh7cR2Jf4yIC68kOVUkOP3W3YXB98tphjZQyPmeN0hIrYi
	pbiMYWnureDqtwqztlca8h1aFzgRQ7nD9CebxRjsAK6gVh0qP2fY8579e4ViYB3x/cWxmcMmzbmRO
	H1mAObm6FNcjQ+1r8ITbLAv1ccCGBndmADs47qL8ghx8Xg5fjtcAlOetjahr4McAjptn+ePEAN8Oy
	VzqTDTZw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD4i-0000000EFjP-17UU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:51:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A344A1517;
	Tue, 20 Jan 2026 06:51:11 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B8C03F694;
	Tue, 20 Jan 2026 06:51:17 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: broonie@kernel.org,
	mark.rutland@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com
Subject: [PATCH 0/3] arm64/fpsimd: State management fixes
Date: Tue, 20 Jan 2026 14:51:04 +0000
Message-Id: <20260120145107.1278972-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_145120_569312_6869A878 
X-CRM114-Status: UNSURE (   6.84  )
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

Hi,

This series fixes some issues for FPSIMD/SVE/SME state management where
a task can be placed into an invalid state, resulting in subsequent
problems (warnings, kernel panics).

Patch 1 addresses an issue [1] reported by syzbot, which can only occur
on systems with SVE but not SME.

Patches 2 and 3 address issues I spotted while searching for similar
issues elsewhere. Thse issues can only occur on systems with SME.

While looking at this I spotted plenty of opportunities for cleanup and
improvement, but as that part became rather large/invasive I'm just
sending the fixes for now, and will follow up with the cleanups later.

Mark.

[1] https://lore.kernel.org/linux-arm-kernel/690a8dc2.050a0220.3d0d33.0018.GAE@google.com/

Mark Rutland (3):
  arm64/fpsimd: ptrace: Fix SVE writes on !SME systems
  arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
  arm64/fpsimd: signal: Fix restoration of SVE context

 arch/arm64/kernel/ptrace.c | 26 ++++++++++++--------------
 arch/arm64/kernel/signal.c | 26 ++++++++++++++++++++------
 2 files changed, 32 insertions(+), 20 deletions(-)

-- 
2.30.2


