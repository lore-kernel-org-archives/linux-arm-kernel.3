Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA72EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 03:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=veBnxh0z2nVjaZ7JNoW8CQDGVfl7vk5NK2E1mwe8dWk=; b=JIQgSB0Tuxnbu8
	eToXtWFTJRKDr3sMd3b52ZXmGjyc205T77N5+uIvPHvewvcR3oQfIblOGlMt3oNl1Gi3ha5vxlYUI
	3twEYcqBGYV/QrmiTic0LhJ2WZYI1IoemxmrkHrD1teZQXRqusIUwSmUgvWjgX4MmbwFchjq6a1Aa
	wp+MT3j54BEfEr3rijJEaznUVrMDLEMe1rYKni6/lBY2z5D5dNvnXkL2eFF3/G+qf8+5oRavPk/zY
	iRwfESodglEkiuWwQ+Fqjk9ke3Q0FMOfSmId2JeMxaxcHCouZ9v42NIH5I6DeTk5iwu9HmpIM9dfF
	0FZgtps9F/u5E0Bxaxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toE0W-0000000DLhx-0rk0;
	Sat, 01 Mar 2025 03:59:20 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toDyw-0000000DLUG-27V6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 03:57:44 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 63C7E25F0B;
	Sat,  1 Mar 2025 04:57:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-yxFxoy9gdi; Sat,  1 Mar 2025 04:57:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740801454; bh=rEHaf4maxyiGGOMN1IF2sOa3FpT4ACpF4a9JkiIWSt8=;
	h=From:Subject:Date:To:Cc;
	b=Em96SsLLK3JE0voTXKEtlh2B1s35FP/WwdY8OEFy+JYsArqkr+MlBGDTtjD4ZsuJO
	 3PnuYqNR7CYabtK2nP0UPImD+xOIhJEBxb5e6imz2MNd56nWcgbjc7N7QGirJp9Rmj
	 GAHsnOA+Ggf+E7qq52HQ4rRhjqkeoNOzqxvWj9QNO4qKrRZcHxSdqIOPJINGvf1Vph
	 pMqtDs+sO7/ovusCmZM+49Px0zkXTRJMw3TIg4X2dcCIJm8ixfiJK7jq+5ImMgIg6N
	 Exsd4XxFlqAvzo6azbKBN+bV15x9uSSRwIOKi9n7hRSUrNDueD3avU+FfEesUXLjBc
	 oeMGgH8mOLnQA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v5 0/2] Introduce support for Exynos7870 clocks
Date: Sat, 01 Mar 2025 09:27:11 +0530
Message-Id: <20250301-exynos7870-pmu-clocks-v5-0-715b646d5206@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJeFwmcC/3XNQQrCMBCF4auUrI1MOg2xrryHuEia0Qa1KYkGS
 +ndTQVRkS7/B/PNyCIFR5Fti5EFSi463+WQq4I1re5OxJ3NzUooJZSAnB5D56PaKOD99c6bi2/
 OkVswiFArIK1Yvu0DHd3j5e4PuVsXbz4MrzdJzOtbrBbEJDhwjYCgSRojcWddDN7f1j6c2Gwm/
 HJEveRgdsAKqoSkmlD/O9XHQRBLTjU7RySFRoA16teZpukJ68xDzkwBAAA=
X-Change-ID: 20250203-exynos7870-pmu-clocks-d0b330970ea7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740801448; l=2719;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rEHaf4maxyiGGOMN1IF2sOa3FpT4ACpF4a9JkiIWSt8=;
 b=UoI5gUYpp/4io6yU8aYNLdhMOhmNT64JGVnwQXQ3FZWV6ZbYTsbxDzPz5RstcQpMzgFknW08c
 vkVYlaNEjwCCgcFk+h/SLVmnQH7NAnmqniUxQoZs1CyylIE0U3wT0Qt
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_195742_982417_29CD2B31 
X-CRM114-Status: GOOD (  12.54  )
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

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v5:
- Fix dt_binding_check errors and fix dt example.
- Link to v4: https://lore.kernel.org/r/20250301-exynos7870-pmu-clocks-v4-0-0f3e73b10db7@disroot.org

Changes in v4:
- Fix clock dt-binding description and ordering in properties:required.
- Change filenames of clock dt-binding and header to match the compatible.
- Squash the following patches from v3 into one:
  [1/5] dt-bindings: clock: add clock definitions for exynos7870 CMU
  [2/5] dt-bindings: clock: document exynos7870 clock driver CMU bindings
- Drop the following patches from v3:
  [3/5] dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
  [5/5] clk: samsung: add exynos7870 CLKOUT support
- Link to v3: https://lore.kernel.org/r/20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org

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
Kaustabh Chakraborty (2):
      dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

 .../bindings/clock/samsung,exynos7870-cmu.yaml     |  227 +++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 include/dt-bindings/clock/samsung,exynos7870-cmu.h |  324 ++++
 4 files changed, 2382 insertions(+)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-pmu-clocks-d0b330970ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


