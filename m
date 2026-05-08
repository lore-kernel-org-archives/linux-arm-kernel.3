Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD96CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUIOucLZjiMznK+KozKCPhDzxswdKXE2vpO2qxWs9j0=; b=dli3FpXU05DShX/rNKYMMmxMNZ
	yn+AyDIs1jvHegw01kha2VfHGkkkrF1jnKBybyeMRftSp4iPVZBleNZA45H8cKrUyhjPzmCa7wn54
	SXZW00zOnHzXTWe6Y4NYPQZHUJ99WHimqitRjAUI1flGhRW7sdQRvXNQb9ulbeupzIvHyK2dCmDKp
	s/M3LRlHGlVzc1n+RZYI8VsTbF2u9E2vND+nW+nkbNg/rSNeIKRPrVIeo+gTrVQuch1NgmjFc0cHC
	c2XPkM+pUtVd1rrI7qN2tZVEfkRZTdjFIgCZdBbF+dHUO8XBKvIku+mj7+vtK46dsDrSMLldfq8eu
	F9J1MiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCs-00000006r4W-1Rjb;
	Fri, 08 May 2026 15:33:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCp-00000006r2h-264y
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kUIOucLZjiMznK+KozKCPhDzxswdKXE2vpO2qxWs9j0=; b=DjVn1fGYfqXoGmEQBI3t2CjYo9
	G36wwvpSZLtOqJvfx3H/9YJ9ir9T1pasY4h41ENZLV2h4OtEkcGA08/Yr7ShlaKxETSp9C3PiR0ml
	gAEPmAnVxlWkqCAxAMM9yWZ/mS7W60Ll8+G+t6JtHhHS7O1Cg32V6TtU03E77Nb/aviKDOo4Fd7Vr
	1mdzoJFa9HSAnWPW9KBRiXCCSHwTJLj+vvCgXsJ1i4Axht9veHl3Qchz1SYW643wcxgorTobN3KyZ
	L903kOKZlGSTo9xhD+i4fMJA0NA3pAYdBykFAEbpPfK8xVyQ4HkwMm2yECSaA/EcSZl6CNgkfGnJP
	Mc8pYA6A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCm-00000006iGl-1F7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:33:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24EC35A1;
	Fri,  8 May 2026 08:33:25 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E2F63F836;
	Fri,  8 May 2026 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254411; bh=WC1R4qV6I0MneBfZAXWbYrl3W9fg6IoQSFQXIfGStN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yy6ACcdHyLZwFPRCF5YoZsDdCuDhNbBt53WgsgTwkw5pXMphDJEm+JyJI2BoHwtBe
	 sUJIU06Ry2i450l66La1uIHRU+A2pnqmVqLQkQ/T3HFRMtdfC0O9IpZ5HJV+/ICqdX
	 pN015g+eu9rv8vr9PbbexLDueaXqzkVfgo7iEtjo=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 01/15] clk: scmi: Fix clock rate rounding
Date: Fri,  8 May 2026 16:32:46 +0100
Message-ID: <20260508153300.2224715-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163332_921369_38F5CE36 
X-CRM114-Status: GOOD (  12.80  )
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

While the do_div() helper used for rounding expects its divisor argument
to be a 32bits quantity, the currently provided divisor parameter is a
64bit value that, as a consequence, is silently truncated and a possible
source of bugs.

Fix by using the proper div64_ul helper.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/clk/clk-scmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 6b286ea6f121..b6a12f3bc123 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -10,9 +10,9 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
-#include <asm/div64.h>
 
 #define NOT_ATOMIC	false
 #define ATOMIC		true
@@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
 
 	ftmp = req->rate - fmin;
 	ftmp += clk->info->range.step_size - 1; /* to round up */
-	do_div(ftmp, clk->info->range.step_size);
+	ftmp = div64_ul(ftmp, clk->info->range.step_size);
 
 	req->rate = ftmp * clk->info->range.step_size + fmin;
 
-- 
2.53.0


