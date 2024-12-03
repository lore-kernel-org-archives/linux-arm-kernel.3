Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B26E64A8B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sx6hvXLBm2zQxfL2sV9fDDohPjXvcoY6L4jR7nMBlvM=; b=IYD1+kmh1ty6Vx
	zPO4TsvRNmbN8x7bPhOASdpkB2af540fyOUGrVs8/u7SzHiAfAhCn7vu4fEspFsbKxzM62wvWNIia
	KLU+T70RkHdVFpIQP9X4c64U5D+Iqfc079Cc0eKjBUaOrTBWjo/2P65OVg0kYd/FaiupOOIYWif37
	h9I47UJ8VX7H9ZktqmzJ+fAz1xm3R9zqMSNroDEp7vb8Z3mEb2lZosHDVnhvjVVsPmU85/WNg7lvL
	NxpE5I/y1oagCSNuew1mGW3umX2TG8zdZmLL8EL4Mi0ah5YhuYglkckqYMv2igyl2J9pAAPUANkPy
	6692cduE4gTE4CpWswXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISUB-00000009WMt-1FLg;
	Tue, 03 Dec 2024 12:58:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISK0-00000009UHr-2fO7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:48:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8F2EA414B4;
	Tue,  3 Dec 2024 12:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A49C4CECF;
	Tue,  3 Dec 2024 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733230087;
	bh=hUhkDJMd6hgc8nFH5J2k6Ct3EbWCpkiTzHeH8+7iWyE=;
	h=From:Subject:Date:To:Cc:From;
	b=noSR49HAbUT52tj/WTvh8Ly59C4mWU3tFJUHQ3EEdsg9VqsgTkyYgwnS5xjM/fyN0
	 Nn9kwAKb07OBTVYKkoFjg6L+6/hc93AoiLspBnwWqtxVJd+pLsyNvywsEgKLFCsT6o
	 HtIvkICLgR31xaJ+8zEFaqj5VGWNfo+/ISAyJBK6rGIaQ6GGY19LwXrb+A/iuGGIq9
	 8MiWmE5VKuL/knlywr85ooXupYKX0uZsE3TYZT8ZOv8pweIPUYXpPyMU6ivXs2GHDH
	 GMbEsEkRvlsDxdz15roDmfyupJU0/zG/hxPon7KdlYx01QESTUXdFCII1zHaNuyJoh
	 w62HF6ao68wGA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/6] arm64/sme: Collected SME fixes
Date: Tue, 03 Dec 2024 12:45:52 +0000
Message-Id: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAID9TmcC/x2MQQqAMBDEviJ7dsFKKepXxEOtoy5olS2IIP7d4
 iWQQ/JQggoSdcVDikuSHDGLKQsKq48LWKbsVFe1NRnsdXeW0w5WIPpxA7cNnA3GGd+AcngqZrn
 /aT+87wd6yZpnZAAAAA==
X-Change-ID: 20241202-arm64-sme-reenable-98e64c161a8e
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hUhkDJMd6hgc8nFH5J2k6Ct3EbWCpkiTzHeH8+7iWyE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTv3/XvODq4EdoPt4webzJUAwhfutXI2IVlatkT69
 XtSrsFOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ079/wAKCRAk1otyXVSH0Du9B/
 4q0qp5ZLV0GHKhGbpjQCdHNnjtg2vEXE3Cp0R7Fbk6Sf/1EnZ6BU523FIlFvoxB5mK2hC7NnYCSitX
 yWifk1i+AYKN84DAmX2zT0vubitt0lOlQ6CDi4klMJRhEWXXyR3+Ol6ta+3NGUOPX4oIEaBHq2wjFG
 i2kDjQAVEbwAbp4er7pguBjVj6vusJC/BjNl96sm4dQSkkegKgdFqwgAORyy6eR83Nz9U/PjQOm911
 8LH2kce+iQqqULpLSSqZqX4d+5QDwmZp8nO/4Jv2+BCHsfYEJK2Ugti8tugl21OGER251GQYeDk6bb
 Oats3tuql3BgX+fyDkBMFGq0yyppZb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044808_737157_A69A11E5 
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

This series collects the various SME related fixes that were previously
posted separately.  These should address all the issues I am aware of so
a patch which reenables the SME configuration option is also included.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (6):
      arm64/sme: Flush foreign register state in do_sme_acc()
      arm64/fp: Don't corrupt FPMR when streaming mode changes
      arm64/ptrace: Zero FPMR on streaming mode entry/exit
      arm64/signal: Consistently invalidate the in register FP state in restore
      arm64/signal: Avoid corruption of SME state when entering signal handler
      arm64/sme: Reenable SME

 arch/arm64/Kconfig              |  1 -
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 49 +++++++++++++++++++++--
 arch/arm64/kernel/ptrace.c      | 12 +++++-
 arch/arm64/kernel/signal.c      | 89 +++++++++++------------------------------
 5 files changed, 79 insertions(+), 73 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-arm64-sme-reenable-98e64c161a8e

Best regards,
-- 
Mark Brown <broonie@kernel.org>


