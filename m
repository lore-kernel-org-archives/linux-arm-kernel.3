Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AB1C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=epNZNJmaa2R26IKCzTP9dZcBTM0skQ+Sc7vmDCNKLq4=; b=tuQpk0AIP7Jigf
	Plp0Fp7eBkHmYhLSYmSlt/k4AAOOhOgtd5h1597FexwRsMJCVSMZK6de4W4DLxbbbRsTEW97IahcX
	sfAg59Q2TvhD35P7+xdtvNYDUKDMehpLXVAkpmp/wBTg0CUSnurjaQixz++HBq4t3AksXzHLG4WwB
	HDi7dFWzO2DrZCdAPyl0RO85wCDBwCl39rapeWUf4TOln3/NxDef0Fphm4T8mlK/SgECRm0p2apBK
	u+6AHSLZbCTJYzBWkQe2A8qhnbjiGI6dn46uhZeiiAYkszvg6ju0oCI7JPheI1z6g+9Qu4A0mhS8X
	K1fBk/RRHXEEHhljvOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSym-00000009Vsm-0xwy;
	Tue, 18 Feb 2025 19:10:00 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSgM-00000009Qwo-2Ynv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:51:01 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7CA7525FB4;
	Tue, 18 Feb 2025 19:50:55 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7HvUdC65Vq9; Tue, 18 Feb 2025 19:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904654; bh=BXcSZpx+Le2bntwbZDzn7we6IloI2TDAfbSfncDltOE=;
	h=From:Subject:Date:To:Cc;
	b=fXFaJ5OqeuwDC+WuzjXOs8vW1foiisKEEffYVOfdFCplENol26rGMgwcgm9iWa8QK
	 M54UNyaCsDfiOpAuWDGFqXfmTeW717GEh9NGS3dk4uoYoMue19ZM8R9ezgywsMeZTh
	 q8cqsAUXZp4JQrQuhnUXc2ZsZlEfJxFQw/N999cw0g+NDNGP8KRl+JSnuLYT04WaSl
	 Nrc0Hpdzp43xmUH3n/Yd2olo4aCeAckLJ/hVBukDyJy2ECW0o740F6S9nDfJ37XCTc
	 Dg2u3SVa3uoNcK8sXwzq68SuPo2sTNulczv4uhfQ6X9n0FuIXmD/EUwM6RqDyIPn8z
	 4ebmQBV1Aqzmg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/5] Introduce support for Exynos7870 clocks and PMU
Date: Wed, 19 Feb 2025 00:20:27 +0530
Message-Id: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPWtGcC/3WNQQ6CQAxFr0K6dkyhklFX3MOwGKBCozJkigRCu
 LsjiUuX7yX//RWUg7DCNVkh8CQqvo9AhwTqzvUtG2kiQ4ZZjhmS4XnpvdqzRTO83qZ++vqhpsG
 KCC8W2VmI2yHwXea9eysjd6KjD8t+M6Vf+yue/hSn1KBxhISO86rKqWhEg/fj0YcWym3bPpfOA
 Fe8AAAA
X-Change-ID: 20250203-exynos7870-pmu-clocks-d0b330970ea7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=2379;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BXcSZpx+Le2bntwbZDzn7we6IloI2TDAfbSfncDltOE=;
 b=y+09pcC11CL24RvdlKFlTZ5Vaa3GKfmOCyi0Gb2s4Z00xUVnohX3SmWiXy06QZHlM5mdsvlPd
 yKsXXXEXbBZDiAi4h7BK0P6N12/Z3juZq93EBiWLWQIs28Fyy4TzBwk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105058_795953_F20733B6 
X-CRM114-Status: GOOD (  11.82  )
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

Add a CMU driver for Exynos7870 devices. It handles the following
clock banks:
 * CMU_MIF
 * CMU_DISPAUD
 * CMU_FSYS
 * CMU_G3D
 * CMU_ISP
 * CMU_MFCMSCL
 * CMU_PERI

It also documents Exynos7870 PMU's compatible, and adds a CLKOUT driver
which depends on the compatible. The CLKOUT driver manages clocks from
PMU_DEBUG.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Fix incorrect versioning (Link to v2: is labelled as v1).
- Fix formatting issues in clk-exynos7870 DT docs (from v1).
- Add myself as maintainer for clk-exynos7870.
- Change clock name definitions in clk-exynos7870 DT docs.
- Fix line wrapping in commit message of exynos7870-pmu DT docs.
- Change a few ordinals of PERI* clocks in the clk-exynos7870 driver.
- Take over ownership of patches by the co-author, upon their request.
- Link to v2: https://lore.kernel.org/r/20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org

Changes in v2:
- Drop all patches from v1 except:
  - dt-bindings: clock: add clock definitions for exynos7870 CMU
  - dt-bindings: clock: document exynos7870 clock driver CMU bindings
- Add patch for adding appropriate PMU compatible.
- Add patches for CMU and CLKOUT drivers.
- Link to v1: https://lore.kernel.org/all/20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org/

---
Kaustabh Chakraborty (5):
      dt-bindings: clock: add clock definitions for exynos7870 CMU
      dt-bindings: clock: document exynos7870 clock driver CMU bindings
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      clk: samsung: add initial exynos7870 clock driver
      clk: samsung: add exynos7870 CLKOUT support

 .../bindings/clock/samsung,exynos7870-clock.yaml   |  227 +++
 .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    3 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 include/dt-bindings/clock/exynos7870.h             |  324 ++++
 6 files changed, 2386 insertions(+)
---
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-pmu-clocks-d0b330970ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


