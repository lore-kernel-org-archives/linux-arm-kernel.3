Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9AAC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GNTtKuo/BgF6mYC1Y9daW/AtQJUyZsBrVhnEirUr/Y=; b=G4+ZsYeArS/SijGgRaaz9Ew82v
	XVYOCPfoU+OizxtYIsmXtILYEFDwCwhOIY1EIokYqeH/vhZ01Qwljd0n83+V8QVbWGH0ONvJSYVf6
	JLgqR3YQVVIlwT/gpmZmaHYVNfixOPI8LvQV74B1IBADqgV5Qra1XigMzQC7OQthwPcLFkov0+QI0
	9hphOhr8FZ7leKvpmMbyJ21C1Dqn0mDm96+BIDILg+4alBLSgOQBMqhwu3Ih0wNMnr3P9LGV7ZWUs
	fYZxiPRPoWae2R2keHMmCKxBBhwBptcHoIHqdL7OOgWJcCX112Gipnhmk6s/O1La8oxNbVDyFxg4U
	HfeRHeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfGI-0000000CZ4F-2Xfh;
	Tue, 14 Jul 2026 15:41:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfGG-0000000CZ33-1Wex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:41:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso2628947f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 08:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784043690; x=1784648490; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7GNTtKuo/BgF6mYC1Y9daW/AtQJUyZsBrVhnEirUr/Y=;
        b=HBvk+ixjMzE4orYy9HO/H3ch4RLti4yMGMX32GBLJ8F8b5iDxGuyJQxSIweF67y+CM
         IVFgNOtzCiPIKzF35Fgwrr55A4kutXk8A7bsx4vaWrm3c4omgdJxeE0fAG4069TIS/NU
         B4Yp1ximF98MnfSm5xc0/MuxShXFKgV+ElM49Pu3P45dWzK/fFTuVaWPh6zqfaA5yt8t
         W4W3vcRG9x3i4Jm8dTCa3H7HQIBBHnUCL0DbeCOxdr8sm+9+oqExgmgIIh535FCUUFsp
         PPN0rVQRzS3hou4zkHWeo06uuDROgugN12IG2k9OVAYDvp+k6tSvjtgDa52R4ZJuQWsK
         QAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043690; x=1784648490;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7GNTtKuo/BgF6mYC1Y9daW/AtQJUyZsBrVhnEirUr/Y=;
        b=mXCWirWFfaE+t9kuDNBtkhhxl1DcQ2gFt8BooLuN9WAeVQzP5U4/WVLm9MrXhSJZ8m
         5TteFYa2v/TlWtY1Sgs8utBXgGjnZAV6TtPnlikn+Bp6kzsq6VlZGBK46EDqqmtAglXY
         TRfQ0KBLvESxRhHCX9xGs2y3yAdLso7BqSSpLDA7rrQFobLxl7ltOottrEHqgWw3rulb
         3GcGSPA4OPekOc/h8Ok01Ih+qEE+bm9/DN75Jo0sO5mZ7CM8g6Kz+ERAVxxb97vsglW5
         3hNMLZ+G/1GMLkfvLlXYKuRmnNLWv29sS/6wy6haSeAkSbnhaEbuCep2xK3KgDPMHoLr
         MzSw==
X-Forwarded-Encrypted: i=1; AHgh+RrNojcUmeZlxSmxjjULC3VmcC9a5Cpt5MOIIVWebFTkoymYWGOwP/IE3UrKGeYg/iXkc+dH1EBGHB1ANhJBBp4D@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo5XhmiXvihyYuqM/jmlHW5mv8tDB9VhWgXyKIBbOqXEHiI0yO
	XCvmGpFF+9QgqZXk+9R3FjT5qAZpJag1meSxMu+pzLl/NtcFsUOKOjcI8LtxRYzP3qU=
X-Gm-Gg: AfdE7clv2eDycnn/Hg5jITd/JnyDfrmZXHVhGLCSb8GujoVZEjExr6Z3chjvJVz7pwz
	m7oGlp2/WOgUwMqmXqVb6nVdfqxqmaRqDsIfrnV58WdRUHlXW3hEehbcf3V5HSQhjS4bKG7GP4i
	XB3Y4Vtp3trBjyU9zLOd2SkskRFPEzC4nmjcTh38Te9vBoD+vQb4p84jYhbRpqfuib5M+M9HKUT
	PrBcUJHWwx8Hvdjfsqt6T7RWnXJygJIba5LK371C+lbCflu1l8m3p6zMEbIhXITVsCCn7hcdv4w
	fwbgZrSpuhttZUvyvAt5pqDMw4kG9C7tYnX6wY+I60+iaxepoiiKB64KjjrWoni6VxZ5CF6KL1q
	Q8uuXG4yHix/rQ/BlpbXjxnHA1z0Oo1MJsNzK5hlc/PKWBUgDLQmpZ7BzsQf7mbLJjsllE6bykx
	NNv+3ZPyBh5jdb7cR9kVx4uizlx+Tt0y63ld8EgP6i5Itom0yBnKpvEKKfvRANVHOwPkKQFxzOK
	EI=
X-Received: by 2002:a05:6000:71a:b0:465:81cb:bb20 with SMTP id ffacd0b85a97d-47f2dcadd2amr15226174f8f.9.1784043690339;
        Tue, 14 Jul 2026 08:41:30 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-41.alshamil.net.ae. [92.99.174.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635aa34sm8423240f8f.15.2026.07.14.08.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:41:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 14 Jul 2026 19:41:20 +0400
Subject: [PATCH] phy: rockchip: naneng-combphy: Always configure SSC spread
 direction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-naneng-ssc-fix-v1-1-1c40a58061ae@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0MT3bzEvNS8dN3i4mTdtMwK3RQjSwtjA5NUCxMzSyWgpoKiVKAw2MD
 oWAi/uDQpKzW5BGSKUm0tACiDjh1yAAAA
X-Change-ID: 20260714-naneng-ssc-fix-d298304e8469
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2604; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qevuPbC3ipAlHnx/CLyUvELDYmFet0ftlCCOj1w52vw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSFRaxYI1zXUFp7/tEFLfUjJytz+9Y3OxVs9w5hb3Zdn
 LTDmel9x0QWBjEuBksxRZa535bYTjXim7XLw+MrzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOt8ILhn3aXaFhPz/bVMU8Sly72e5w51a8sv+OI37nVl/MvnT3yZxIjw9+o30K
 3T7cvC9U526nROT/Gcd2ej+JfDLdb/j2kINCwigUA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_084132_436821_4F1EF3B8 
X-CRM114-Status: GOOD (  14.92  )
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

Commit 0b31f297557f ("phy: rockchip: naneng-combphy: Consolidate SSC
configuration") moved the SSC spread spectrum direction setup into the
new rk_combphy_common_cfg_ssc() helper. That helper returns early when
the 'rockchip,enable-ssc' property is absent, whereas the equivalent
RK3568_PHYREG32 direction writes previously ran unconditionally in the
per-type switch statements, independent of whether SSC modulation was
actually enabled.

As no in-tree board sets 'rockchip,enable-ssc', this changed the behavior
at least for USB3 on RK3576, which now fails to bring up the link.
USB 2.0 still enumerates, but USB 3.0 does not, and the SuperSpeed root
port floods the log every second with:

  usb usb2-port1: Cannot enable. Maybe the USB cable is bad?

This was observed on two different RK3576 devices with a CoreChips SL6341
USB 2.0/3.0 hub connected to the USB DRD controller running in host mode.

Perform the SSC direction writes for PCIe/USB3 (and SATA) before the
enable_ssc check so that they always run, as they did before the
consolidation.

Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/CAKTNdwH_ZMQa-97h+tqdsWqXKtorkFF9wHAMn60-8ZGKuze_Mg@mail.gmail.com/
Fixes: 0b31f297557f ("phy: rockchip: naneng-combphy: Consolidate SSC configuration")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
index 2b0f152f5470..7843356a4dd4 100644
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -452,9 +452,6 @@ static void rk_combphy_common_cfg_ssc(struct rockchip_combphy_priv *priv, unsign
 	struct device_node *np = priv->dev->of_node;
 	u32 val;
 
-	if (!priv->enable_ssc)
-		return;
-
 	/* Set SSC downward spread spectrum for PCIe and USB3 */
 	if (priv->type == PHY_TYPE_PCIE || priv->type == PHY_TYPE_USB3) {
 		val = FIELD_PREP(RK3568_PHYREG32_SSC_MASK, RK3568_PHYREG32_SSC_DOWNWARD);
@@ -471,6 +468,9 @@ static void rk_combphy_common_cfg_ssc(struct rockchip_combphy_priv *priv, unsign
 					 RK3568_PHYREG32);
 	}
 
+	if (!priv->enable_ssc)
+		return;
+
 	/* Enable SSC */
 	val = readl(priv->mmio + RK3568_PHYREG8);
 	val |= RK3568_PHYREG8_SSC_EN;

---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260714-naneng-ssc-fix-d298304e8469

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


