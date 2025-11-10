Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA52BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r2C8iSh/mmguYKh31or4+/W4HMRgNBJ50++4n75uDfg=; b=SUxdYbOZc1LtM7
	7/zEHZbkZJCpj25NoQQxnBIp7fCfVf7XxyvifMQL/W/7O5rYCImceQ8tAYpzJk8TsYbqa4Kmd8du7
	HqwwK7VK/+9OFJVOPfRPdvU2v8uNaeJ/imvHAVLLSQTUulEtPVQWop7lFHseQ9EUldlKeNbdP+Zb0
	Q0B3rTvdYp/X573GgJQD6AerITnwE5E2Wfbq+54c1vI6o4RpKRdbVXmzmnkF4UzToo6wPYvD7DCKk
	UmTy7Q9M5coVsxgEQ8mi7C6bBFhmZYUVLhlhdhU80ryQ+kjriJutewLctcnlqLDiVV/s7xdrxfgUS
	PO3hlLqvLqv0ddqTajdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUl7-00000005nI6-0UBa;
	Mon, 10 Nov 2025 16:28:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUl3-00000005nGh-3aKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:28:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B49402B;
	Mon, 10 Nov 2025 08:28:35 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 510CF3F66E;
	Mon, 10 Nov 2025 08:28:42 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/2] perf: arm_spe: Fix trace disabling for invalid
 limits
Date: Mon, 10 Nov 2025 16:28:30 +0000
Message-Id: <20251110-arm_spe_fix_truncated_flag-v2-0-a629740985cc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK4SEmkC/42NWwrCMBBFt1Lm20iSMiJ+uQ8pYZpO2wH7IIlBK
 d27sSvw81wO524QOQhHuFUbBM4SZZkL2FMFfqR5YCVdYbDaotEGFYXJxZVdL2+Xwmv2lLhz/ZM
 GZQjb+mI11dRCCayBi3XEH03hUWJawuf4yua3/pXNRhmFiFzbq29J473IZ79M0Oz7/gVHBGY6w
 gAAAA==
X-Change-ID: 20251015-arm_spe_fix_truncated_flag-1a5b3620a3ab
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792122; l=1249;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=9qj+/Tmhl7LZo6Iri04G9/1be9SzjZcpr/NFCxaSF8s=;
 b=QPnGaJt6VTtGLNALrrNz4ryCFP7P25/YrHn2ARSpS71fbBCYa14eb9t0KAoX5HNJCF185nL/F
 rCj04qrE/0ZA350MgTnck4i4/8EmBl2+CkZVhfJKMuOov2IbYmMDXB1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_082845_933819_7E02E1F9 
X-CRM114-Status: UNSURE (   9.98  )
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

This series fixes trace disabling issues that occur when failed to
calculate a valid limit (E.g., due to buffer overflow or insufficient
space during padding).

The first patch improves arm_spe_perf_aux_output_begin() for failure
handling, ensuring that all failure cases set the PERF_HES_STOPPED
flag.

The second patch applies the profiling buffer disable flow in the
interrupt handler when the PERF_HES_STOPPED flag has been set.

This series has been verified on Orion6 board.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Added the patch 01.
- Did not rely on irq work for disabling as the disable callback will
  skip operations after PERF_HES_STOPPED flag has been set.
- Link to v1: https://lore.kernel.org/r/20251015-arm_spe_fix_truncated_flag-v1-1-555e328cba05@arm.com

---
Leo Yan (2):
      perf: arm_spe: Correct setting the PERF_HES_STOPPED flag
      perf: arm_spe: Ensure profiling buffer is properly disabled

 drivers/perf/arm_spe_pmu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)
---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20251015-arm_spe_fix_truncated_flag-1a5b3620a3ab

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


