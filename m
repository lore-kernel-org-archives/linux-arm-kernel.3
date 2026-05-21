Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F116CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K9f2mxd1DgZ9YJqr1jtxIvuLVJ0t0dKcSC5XT/L1G3g=; b=3Wx7zqA2J3qijW
	FjgMQ+8qw5Zu82JgUHuUTIpGxl9kZOttKpm+FKkx5/tpToo4SIlj9XfIyNnPLViWqFt+yfVldKKy5
	xgYreDJXysNStP5TOkqjix/AZNPOVn62nvO4SXuzMky9dlfj/vDYxq9QcTbS9THSlYSLj6Kwjqc6n
	2Ua9RwbSDOAPgJulHIyRO+K3Xw3asjEBRFab2LN3Ih3yCrOhjNN/RnAvF6xBAS6sM784D6CPa0Db/
	0K/h1KhcmLKTeXsRm4d60BkmPsGyHezf9EBCPEHLW6hduVCm8HtjVJ3PJiyWpqj5I0aJCp8ZQNGZb
	31yi100m6WWGzVTKYx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvh-00000007LQW-3A1M;
	Thu, 21 May 2026 09:43:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzve-00000007LNk-0WCO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:42:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9308D35FA;
	Thu, 21 May 2026 02:42:50 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78CE53F7B4;
	Thu, 21 May 2026 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356575; bh=yTM0+DachRaCQ3ebv/mHdvMi2slEK32jyYhH6IjaJYo=;
	h=From:Subject:Date:To:Cc:From;
	b=NLzjKvd5a2IAhkUSgTaH7C2PWB4xTFB3K70YzIecWX7WHwed5bSwwNUYElaDPsLDy
	 /IxicyTg2W1F0j5y5i9rFEfuTCQq6CmuqC46GsCVWRGJaKW5ocQV5Bzwktpuekfsee
	 wQPMPo9+F9oIN6/0LVvsYxCQ75oTsiRpdmRvACHk=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Subject: [PATCH 0/2] Add test for atomic uaccess with permission overlay
Date: Thu, 21 May 2026 10:42:29 +0100
Message-Id: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIXTDmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMD3YL81Pi00pLUCt3U5CSLZCMjczMLSxMloPqCotS0zAqwWdGxEH5
 xaVJWanIJyACl2loA1xxvRW0AAAA=
X-Change-ID: 20260520-poe_futex-ecb8c2276894
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779356574; l=2109;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=yTM0+DachRaCQ3ebv/mHdvMi2slEK32jyYhH6IjaJYo=;
 b=Begn8OO91VuooXMu1nVZlMnRiQRZqn5y/imnFZ+PLGkJm9SjzAqYH3XvSDP9g2EIQeQait2F1
 WpdFPES8KxEDraFgHWpF5gelz6Snm0TDrx5tDbzoPXHs7Me+xiDiut2
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024258_256187_3FA97B70 
X-CRM114-Status: GOOD (  10.93  )
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

Permission overlays are not currently applied for memory types
configured in PIR_EL1, meaning that even if POE were enabled at EL1,
memory accesses would not be subject to POE restrictions.

A patch [1] in my series adding page table protection using
pkeys/POE [2] enabled overlays for all memory types in PIR_EL1. It
turns out this is wrong, as reported by Sashiko [3]. User memory
types must not have overlays applied in PIR_EL1, otherwise direct
accesses to user memory with privileged loads/stores (and PAN
disabled) will mistakenly be checked against POR_EL1, instead of the
intended POR_EL0.

To avoid any accident in the future, this series adds a comment
above the PIR_EL1 configuration block, and a kselftest to ensure
that atomic futex uaccess (which uses privileged loads/stores unless
FEAT_LSUI is available) does work on memory mapped with a
non-default pkey. 

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

[1] https://lore.kernel.org/all/20260505-kpkeys-v7-3-20c0bdd97197@arm.com/
[2] https://lore.kernel.org/all/20260505-kpkeys-v7-0-20c0bdd97197@arm.com/
[3] https://sashiko.dev/#/patchset/20260505-kpkeys-v7-0-20c0bdd97197%40arm.com?part=3

---
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Kevin Brodsky (2):
      arm64: mm: Add note about overlays in PIE_EL1
      kselftest/arm64: Add test for atomic futex uaccess with POE

 arch/arm64/include/asm/pgtable-prot.h         |  7 +++
 tools/testing/selftests/arm64/Makefile        |  2 +-
 tools/testing/selftests/arm64/poe/.gitignore  |  2 +
 tools/testing/selftests/arm64/poe/Makefile    |  6 +++
 tools/testing/selftests/arm64/poe/poe_futex.c | 62 +++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 1 deletion(-)
---
base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
change-id: 20260520-poe_futex-ecb8c2276894


