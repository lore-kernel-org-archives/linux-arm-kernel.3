Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4040D3B9A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjT6rCtykdInfLpuZs+vi/KU6Wk3MfZhNuv+89OCLZs=; b=mQqS8dBKAB3/LMW5vWn00MOiA2
	kXd9z2q5oAPaVHNMN3vFTc+fR8be0B13BziY0136oTUxXu0xXDs3+kxCoLDaZolcomBQ79WYXztO+
	Dxzd9SXPtgeHALzv6mLgAeEAgy+iwG5ktFysbVLKnGGjFbagD53MERibKg5GecrK4h7qE7hE2dOlk
	d0v8yfaGpMr2xPKgH3MH1Ov9WxasfGN+edTb9Tw18L4VniiMPqvk28dYMK9c0txs42AZR1d1XLHJG
	2aDuvLqyKhTNgC9r5y4JV26EH5gnbP7jB/DnaPg9Hek55x3znD7vG/xnT0dQdi30RXJUIn+p0qcu/
	jTvbz4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxgX-0000000B2Lc-1iUC;
	Tue, 26 Nov 2024 15:41:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxfZ-0000000B25b-1x3x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:40:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A59FE153B;
	Tue, 26 Nov 2024 07:40:34 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F00083F5A1;
	Tue, 26 Nov 2024 07:40:03 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 0/3] Add support for FEAT_FPMR and FEAT_GCS
Date: Tue, 26 Nov 2024 15:39:52 +0000
Message-Id: <20241126153955.477569-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_074005_553070_C6BF828E 
X-CRM114-Status: UNSURE (   6.93  )
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

While trying to test a tip-of-tree kernel on a model, I discovered that
we never added boot-wrapper support for FEAT_FPMR of FEAT_GCS, resulting
in the kernel (silently) hanging early during boot, which isn't ideal.

These patches add the missing support.

Mark.

Mark Rutland (3):
  aarch64: shuffle ID_AA64PFR{0,1}_EL1 definitions
  aarch64: Enable use of FPMR for EL2 and below
  aarch64: Enable use of GCS for EL2 and below

 arch/aarch64/include/asm/cpu.h | 16 +++++++++++++---
 arch/aarch64/init.c            | 10 ++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.30.2


