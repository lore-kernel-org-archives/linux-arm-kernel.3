Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE09FDEE2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AhxSHKWr103/E1Abi9BgceUMalIe2NtUsSb9gyPNW6I=; b=oRZmKHsn5hcdUe
	s6c6Q2nSCF/mJVhj17AXypNCapW89iZKOqHAErzWzejJq4AET/PL4X9+f7Um9bimuxw/R1x9X8FUx
	PuOBXnOBgX7B24aLcAU+ZlXotr471PI3/SVcX7NwRKqU558WvJoVkvnn/IHV0AFbx1mjCniQ8s+St
	67cTzzb6EGngKHGJ4V1fT/k3CpESFuCt6+G1Nl2lsB+xVXncc/TTIAT1p39YAhhwcgjTefb4c8dl8
	F5ckkn2Hz3LdOIVUU80qaxX6N5e1eIjYkicib1fqC/Wzx+gPsRWod3DyP1b3SfHQKFYxLvIw/YcLT
	XC1aIM4E5/9M7Zg4TICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmK-0000000C2KE-3Cc9;
	Thu, 23 Apr 2026 17:23:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmI-0000000C2JT-1UPE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D4A642AC9;
	Thu, 23 Apr 2026 17:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613FCC2BCAF;
	Thu, 23 Apr 2026 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965029;
	bh=PBeU3E1iY6sycfyztxSJMPW0WRRpkbfBh6dm8PLuH3Y=;
	h=From:Subject:Date:To:Cc:From;
	b=axPiaa2W3QYjE2pfu+nW6DAUUtZiOUiNXCB7p3Ed9Ko0V6pFweAK/5IOYDAl44LD6
	 ry27AkcvZbSVaXAvSFoR+qkfpTlDaciA+2DDBX3TY5B05dJEjFsan6GqT0MoPyPA2H
	 XEvSUtsS9HVVZDW2k0JJpLLravkx2nm80lgki7oxDuFPnN51DAmB6LMDR2VtcU+F0h
	 8jsjEHLr4pYBhrQBUh7VJQn5a82MOmXYfwiYPkeAqXfbo6zMRvMjFq4VzkX+YKTM6m
	 kVqswg7tRFbwL2Xl/q1uI3jmSGaYiWlix6u8Bkug/kGbXOW+JPpSTislvHKInCssOU
	 lx9cXOj6abZhw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH 0/8] firmware: arm_ffa: Fix cleanup, notification, and
 discovery paths
Date: Thu, 23 Apr 2026 18:22:50 +0100
Message-Id: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG5V6mkC/yXMwQ5FMBSE4VeRs9akWizuq4hIMeVYuNKDSMS7K
 5Zf5s+cJAgMoV9yUsDOwv85IksT6kY3D1DcR5PRptS5scp713g+ICp3vbVeA6bQFPsl4B1iXtW
 fZWsndOtzQNd1A79pojRtAAAA
X-Change-ID: 20260423-ffa_fixes-4ad33f0ee250
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102350_436964_06A0C046 
X-CRM114-Status: UNSURE (   8.93  )
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

Hi all,

This series fixes a set of issues in the FF-A driver around init
cleanup, framework notification handling, v1.0 notifier lifetime, and
partition discovery.

The fixes are all small and localized, but together they tighten a few
important paths:

- fix the early init unwind path when RX buffer allocation fails
- align the stored RX/TX buffer size with the size actually mapped to
  firmware
- ensure the framework notification handler always releases the RX
  buffer correctly
- validate framework notification payload bounds before copying data out
  of the shared RX buffer
- fix the partition lookup used for sched-recv callback registration
- unregister the FF-A v1.0 bus notifier during teardown
- bound the register-based partition discovery copies against the caller
  buffer
- reject FF-A driver registration without an ID table

This is the outcome of the self-initiated review of the entire driver
following the oversight of Sashiko’s review on one of the patches that
was merged.

https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Sudeep Holla (8):
      firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
      firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
      firmware: arm_ffa: Align RxTx buffer size before mapping
      firmware: arm_ffa: Fix Rx buffer release in fwk notification handler
      firmware: arm_ffa: Validate framework notification payload bounds
      firmware: arm_ffa: Unregister v1.0 bus notifier on teardown
      firmware: arm_ffa: Fix sched-recv callback partition lookup
      firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies

 drivers/firmware/arm_ffa/bus.c    |  4 +-
 drivers/firmware/arm_ffa/driver.c | 79 ++++++++++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 23 deletions(-)
---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20260423-ffa_fixes-4ad33f0ee250


-- 
Regards,
Sudeep


