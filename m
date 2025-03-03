Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA8DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y10UqnkPqz20q2Pbz1bkKGi4fsLDf4W3rv1EHCpRRsU=; b=vyqgmNptom6Of7vE0e63kPepR/
	ZTg68wAs1Zqm8AagN6jRAI3vtG7HvfXfn3k9P8BOkbN0RgYInEVjjFeG0mp2NaPitO7R6qmQ8lbTv
	yP/yin4q4zroiBezjtLLHh6YDtdrLx4XTKNdGKOYnfmyA/mhLrY4TgI3j2oNkYGrNzLsuhrPCvvNr
	UieKPj4XiF/jSyrWBc3dRw6OWBc63DXnKpmjhTjh4NdTrJRr0suKwmysa8zdcPwbdEP1tOEzuq2c2
	Pkmaz1V3rpwqSXDCGS4j/iHJUR8a3eFRRo1H85o9GgxbADQf4wjF3yxg2dxIgjdRXAUBduZPhrJVP
	EfWTvXZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp26Q-000000008cE-3C6a;
	Mon, 03 Mar 2025 09:28:46 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1kW-000000003y2-1kxM;
	Mon, 03 Mar 2025 09:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B3D3611E2;
	Mon,  3 Mar 2025 09:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EA61C4CED6;
	Mon,  3 Mar 2025 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740992767;
	bh=+9m8RepECu3KdDR/xyA11+0D+ttRfCLVaFx8rNaHNQI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=jOpYp0VYLTlOkN/XKt+X6OhLpSnc9AFrJt/Or1YazKO2uvQImYmQ7PCg6F2rZqI+Q
	 yFDFcLOcrC0FGn+lO2YyynLp8HnXZElVc8olj2FwV8mijSbiSkEM15cqpaPzknooNO
	 66NSHK10jhj0hfAEIed8Joeurtu3UxTRFN5Z8wV4Vx679qy/5FblwoU2ABLrEpl3YY
	 lKGYO04tr4tTgQ+/g7On71CfTbYU2j2YEOX12R5O3nRAlY+a6mKK7ZfvwwdqV3r65C
	 8BVQQcIgf2DNGWoi5sytV/TNiZDcSl9QJyZQoiASh1rRIh4X1k8ry2+z8z/grVhLG2
	 FFNG6B1xtwfmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E38C282C5;
	Mon,  3 Mar 2025 09:06:07 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 03 Mar 2025 17:06:05 +0800
Subject: [PATCH] pmdomain: amlogic: fix T7 ISP secpower
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-fix-t7-pwrc-v1-1-b563612bcd86@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAPxwxWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNj3bTMCt0Sc92C8qJk3TRjYzNTgyRDS4PUNCWgjoKiVKA02LTo2Np
 aAPHs9UBdAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740992766; l=1171;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=rJx19Mccy9v03r4IPzrydNTt9cu21guWRk4PdtQnj/s=;
 b=uqesClxVofnbW/ynh5d/bm2c3Kt2QwEI3r8qy7137qIkThIhcwEJ5t8Lm7peBNEKl3AhmZ73V
 TB14yRL8lI1C2wcDWE5UOeddEEODPuhesytoihG1QQQjHR9llVP55r3
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

ISP and MIPI_ISP, these two have a parent-child relationship,
ISP depends on MIPI_ISP.

Fixes: ca75e4b214c6 ("pmdomain: amlogic: Add support for T7 power domains controller")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index 42ce41a2fe3a..ff76ea36835e 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -221,7 +221,7 @@ static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
 	SEC_PD(T7_VI_CLK2,	0),
 	/* ETH is for ethernet online wakeup, and should be always on */
 	SEC_PD(T7_ETH,		GENPD_FLAG_ALWAYS_ON),
-	SEC_PD(T7_ISP,		0),
+	TOP_PD(T7_ISP,		0, PWRC_T7_MIPI_ISP_ID),
 	SEC_PD(T7_MIPI_ISP,	0),
 	TOP_PD(T7_GDC,		0, PWRC_T7_NIC3_ID),
 	TOP_PD(T7_DEWARP,	0, PWRC_T7_NIC3_ID),

---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20250303-fix-t7-pwrc-f33650b190ef

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



