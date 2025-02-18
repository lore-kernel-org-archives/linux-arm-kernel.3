Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD82FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUJcd7I38heggXEJkasSpkVFtCQp8NrCY3kgSxyMWNM=; b=TDRbm/wd4CI48pxknWsH36Od1V
	j/UYWWf3GHLDvlrBYwRHEvP8p5jL6gr6ZITdWDw5eY73fe5IeptMQKxd1appGl0/hCemVJYn5hXTi
	tuN/GN9t0Gfkkk2SkdhR9dLYrbUrczXbvo47QPv1ScJdkhIRkniG1M1diJHR9cBU8UoQI1JaT0Hl4
	1bf3lZ9Sv8Lspw8rGe0OLK0iiRi+aKTFWHGnVy/zxnRvk6sWr6IGa+wAZKUEFFi06VOyEG6QLYvW7
	DMfuaDwIHIBI36semKpzYLUNT7afGw/PkJUVMiDWN/8s+xgiMWxacfcn5Dg6/01KD52Bbcp8PuloH
	qdSlio1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT7R-00000009XlE-2fCR;
	Tue, 18 Feb 2025 19:18:57 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSgv-00000009RAi-1exC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:51:34 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2C17725238;
	Tue, 18 Feb 2025 19:51:32 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf0up5s3SQFp; Tue, 18 Feb 2025 19:51:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904687; bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UplHpz/lNdkdG5iWDlvvSkHfsOV8boPdkiMoa02+tFheflLeVZcdKur+A3BJT8P4x
	 lz7K3hqiM5t5J9gQ5Mj0kijSLPIJL6CGqbBCsOmc+Md4xv6fkGDYr9QLzJ5f+Oehix
	 T37umopUao2Je3IIve3keko17YjI26YotemfExmzHX5/sCZ/UQFngB3dik8la5+5p1
	 vIt2awlFC5RZ+0dH90jCUUFTpqfwSg+bPv/AImCn6oCEiL8h17WPyqTUdCJrR1FX5/
	 cSI4rV29+m1IOwcXTKA6RpPXF8kgB6iw+m42wE0wCg+ODraxrME4i22nhlGJBr2JGq
	 ozRo6jfKCYoEw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:20:32 +0530
Subject: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=841;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
 b=R4UsGuQHOnJi5OrVwA2SQghzy7AexOBZ3mXaQzIBNSBHoCSV/gvsQ1xdHkXcPqYIhPvXHgpYX
 sy1SONeTq0uAcWDivRJCVJD/DmZn75uo024qiNmA9ncVjMfZN1Ot1wD
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105133_571058_25F5D4BD 
X-CRM114-Status: GOOD (  11.12  )
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

Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
compatible to the existing CLKOUT ID list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
 	}, {
 		.compatible = "samsung,exynos5433-pmu",
 		.data = &exynos_clkout_exynos5,
+	}, {
+		.compatible = "samsung,exynos7870-pmu",
+		.data = &exynos_clkout_exynos5,
 	}, { }
 };
 

-- 
2.48.1


