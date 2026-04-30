Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6B3FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8uLan5B027COPd/t1lMAqUL7IL3uFTazUIilUlFaa9w=; b=3wYrFIdqTNDYcv55VoztMMPPIM
	SwSVFF3HlgjmuqRuUSuIMBh+PTKvzbYTJlG11unMLFD+US14VcchHauSZGTe50YO4POifteutPOlS
	d4ggQYa2ekYPtkH8tddIPZQTZFTrnv5pSOxmDGvldcloG9a2Yp+4im8NFWQPwbIsfW91HZKFFY4tD
	VMVeB2mqJyRVNcs1VgYhqVBz837hdk8RMIp0fgm6zGZHgN5NoDENuAu9Pn1i05l1FZ6RWw+lNBpKJ
	5GJnt9nljaet9l5amYvcf/8InOEzXkVuj/oCIKXmrx5Zv86m46UgFcG+ubkFbwdDEPVPekx8u8F4I
	aQ+ImNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPKQ-00000005KmF-1YPY;
	Thu, 30 Apr 2026 11:13:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPKO-00000005Klt-1Hvo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:13:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso5769715e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 04:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777547586; x=1778152386; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uLan5B027COPd/t1lMAqUL7IL3uFTazUIilUlFaa9w=;
        b=SAxHiQnSh0skne+fJRCF77HiOGcyqqIDiYKgbW/aA4qgQGYHGhHGG4iQs3+UaIoliu
         +BmhS2J9YSg3gyyoBNqAFA6uiUc8MUXLhxHNAJj+MfDVJgbtd5GJTtsmJ3MN88g7pcTR
         wG088IqiMU3dOO+PfQZsBHtMl9NtKMyfflijw6Phz36Hm05GEJneaduxGb4uR80OkFf4
         R25z1El+DRUdaOpzkJ3S6TZH5NsbTKERHohcv+SMasWs+QDNH/OhdBCZ26ItyiJbQ5Y9
         TltFnGoSnKFytq8NZEcMQbpjUEP1XrzCGYuLFULpjjwk2K0FruspWPmJQdAQUANRuct/
         LACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777547586; x=1778152386;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uLan5B027COPd/t1lMAqUL7IL3uFTazUIilUlFaa9w=;
        b=PtAJcyZZcmJRfwn1nJUJYQPw5l6Fgus/UzKw6akWGb6DYo7HVyeT0dFRADcOjw+jcE
         zTEQ/mZK6nJvMxOFqxUqjDDdUdEs+q5M+4PPQ38IXaXyKKH9s4WwGhYd8J9GgRxoB6JD
         Br/9UB1vOv42KTbRsut7SGqy1n35w36C7nR13Fucz3K9c38I/Vjhh6Vcp6lGa+NnrBfW
         4csSzL9pRrmQaKPWkf7M6Tj3Y+bOsc0YnXSmKlpqrqyqNn05NfgB1Bx1r2lNe9CuNVI4
         YFIWJgsKtsa8vHFimQxkeJBBT46R0L69XwSu98RvN2MX3S0+BHAQ53LF5OBUEwZSby7V
         bN/g==
X-Forwarded-Encrypted: i=1; AFNElJ+xiBwpnHIAhAqFHoW96rr/eOWJp/ZyH/i0ddunbCDLsUud0fv2vrj3G2EhgU5pQ7e9miH3CQPVkNc6uUtCuBTk@lists.infradead.org
X-Gm-Message-State: AOJu0YwuQhW4vLKK3Mh2ORyCAUKfLZJKA3Yn7DJpQNq/HiGBPMegzyk+
	EfN9x28OULSCpjljI/DHaV7sOgcX7FNL7eEKTl/+7McTYihLIvarPyI0rfno+tCpu9k=
X-Gm-Gg: AeBDiesbIKxODoWcUUIey+wEBFCWm3KqkTbq2QVGEZW2H1sgCr5/8KWvQ//atoIZ/uy
	CiZ84vmnh+vDdLhfI6qsI8l+bFvoBeF7FjqRV1vgEI11RsAc6yeVOpp3Ocsxuo8A+bBxokduSvx
	FjESt4EKRDmPrS4Kc7FmEcKfYxyigOZ8VkYvN34NeWMTm4kx2/U6Mk1Qb/tPL2VPmDlBTZ8UvDP
	7u/+AtsT70/brctHraD8S09KofjkqNf/Yvw2M5E5ke5frSENZlx8PjlocrcqmYyuSbYvbAskLtT
	87kdIy9JN1p1DboWn7L0LMDC4G3HbQI9dHEtEfJThf8MPYvV04gl3P1vC6ZNK6P5WJ9BJwSN0L9
	VLxGKNe7GmoDp6kPKBUB3q++spDGyUrwnoaTWFFQJOw9zVOs+aoaoxudSqGvCyszqU89EaXCQ54
	npERlQSsLsVWrFtVhS0s7N5RDq7JvC7XNHw9Ghn9FJuHZ9/D+L1IQTSAuqFIwYyG8aAV7bGALRT
	8dMyERvxdRn7D7/NuE09c8mCEFO
X-Received: by 2002:a05:600c:e41a:b0:489:1ae1:4eb9 with SMTP id 5b1f17b1804b1-48a84532408mr29885665e9.28.1777547586029;
        Thu, 30 Apr 2026 04:13:06 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm12966686f8f.35.2026.04.30.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:13:05 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 30 Apr 2026 11:12:59 +0000
Subject: [PATCH] mailbox: exynos: Drop unused register definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos-mbox-dead-def-v1-1-a69176b7d0f0@linaro.org>
X-B4-Tracking: v=1; b=H4sIADo582kC/x2MTQqAIBQGrxJv3QP7IairRAvTz3qLNBTCiO6et
 BmYxcxDCVGQaKoeirgkSfBFmrois2u/gcUWp1a1g+o7xci3D4mPNWS20LbAMVQz6tEYg85RSc8
 IJ/nfzsv7fk46BpVmAAAA
X-Change-ID: 20260430-exynos-mbox-dead-def-e019a9ccce3f
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: alexey.klimov@linaro.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777547585; l=1535;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IVpRtS1U7L6XGTbADqaORj5gZJvN+7IbIWKmL6oRgiQ=;
 b=RYbMiEzkqDTbkaG2gNr5/dC6VlSN+gT2TdV/n6UfLQQ4hiJECt/EuYVSbNhu+IPApG6hiTAMm
 yP+6lWLu3KNDlEStfAdWGKaWiRXVChjGbNuN4Z0EY1tWHfxT79fgfO3
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_041308_391524_EB9F0F2C 
X-CRM114-Status: UNSURE (   8.79  )
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

Leaving these dead definitions in place hides which registers are
actually being used by the hardware, making the driver harder to read
and maintain. Remove them to clean up the file.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..953e715a89b1 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -16,15 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define EXYNOS_MBOX_MCUCTRL		0x0	/* Mailbox Control Register */
-#define EXYNOS_MBOX_INTCR0		0x24	/* Interrupt Clear Register 0 */
 #define EXYNOS_MBOX_INTMR0		0x28	/* Interrupt Mask Register 0 */
-#define EXYNOS_MBOX_INTSR0		0x2c	/* Interrupt Status Register 0 */
-#define EXYNOS_MBOX_INTMSR0		0x30	/* Interrupt Mask Status Register 0 */
 #define EXYNOS_MBOX_INTGR1		0x40	/* Interrupt Generation Register 1 */
-#define EXYNOS_MBOX_INTMR1		0x48	/* Interrupt Mask Register 1 */
-#define EXYNOS_MBOX_INTSR1		0x4c	/* Interrupt Status Register 1 */
-#define EXYNOS_MBOX_INTMSR1		0x50	/* Interrupt Mask Status Register 1 */
 
 #define EXYNOS_MBOX_INTMR0_MASK		GENMASK(15, 0)
 #define EXYNOS_MBOX_INTGR1_MASK		GENMASK(15, 0)

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260430-exynos-mbox-dead-def-e019a9ccce3f

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


