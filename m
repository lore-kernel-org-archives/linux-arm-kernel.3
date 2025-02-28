Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EF3C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lozZiEWCEUjSkh7IrlTBayu0+rpvQaFagkAZHh+juyU=; b=ZebVweZMpwSRb1
	8HDIgcbw6fwDohEM/cVon2Vh9vaj08T3XgFe0RSb+DmWuXyBp/0meO2XBqd5jq9vX4M4IqcBTsCbZ
	iqhoTylLV5blbLXGHauwUaEYIGoqQ9oh0VpXz79B1whLVneYafylioEoD2fn7u5BUpwfMj0Yi1wvg
	7DI6EVAhLPgC8H/PfIO8sBBRPdFhZ44yA81pwSj/5DkJr59DF2nYMIOYHjyNofq/Rs/weNFUHi5h+
	DLeGVu5L3YKQqEp3gjqrZI9G3f+7ZY1f3f6/ZgrxTc8SIECHcR/bQ9yUKYHVGjmx8MesLavLpLsDE
	RCb9UY6/eo9CfkEJK56Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6LL-0000000CPg6-2n9a;
	Fri, 28 Feb 2025 19:48:19 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6EH-0000000COI1-2Q7p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:41:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4575C25E98;
	Fri, 28 Feb 2025 20:41:00 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CP8WZkex-2mA; Fri, 28 Feb 2025 20:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771653; bh=qU9iA+vOEzeMzvDuuOahSaEm6XWe+bK8zvzRf3k0HB8=;
	h=From:Subject:Date:To:Cc;
	b=E7yY5a1Q7oZfqavegTjbD/PLDQRnN6cc4E8ASgnqLVOSJ4SW/RsuiztIjb+/xqCVg
	 Jx4/rSJ6wtutrloYrYvAUNKZUWhY7epgvDfoPEh4ZxVi5MyZemazZfu4Ajx9+IjzBP
	 OLPnqPnJk3UIrRsHRweq+vHybMq7UM+kwDGO1Da7kp3aRRwHUvRHmEnWevvKP6DafZ
	 PepAH1Nrr3Uwme+dF0MtOcJCrsCQOaiZcC1EAPdQXrG0XsE/1+/M4DRLPEKZdodvwj
	 ZBYOUkq94KvtAUTMfT7g7qFzNaFzf963hbrWGrfg3BeWSzwyjvYAeu9n9RPZg8vrgU
	 98WcoRpQFrkMA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/2] Introduce DWC3 support for Exynos7870
Date: Sat, 01 Mar 2025 01:10:32 +0530
Message-Id: <20250301-exynos7870-usb-v3-0-f01697165d19@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADARwmcC/2XMSwqDMBSF4a1Ixk3Jw5CkI/dROkjNVe/ElMQGR
 dx7o1AodvgfON9KEkSERG7VSiJkTBjGEvJSkXZwYw8UfWkimFBMMElhXsaQtNGMvtOT2k46BV4
 DWEXK6RWhw/kA74/SA6YpxOXwM9/XL1Wfqcwpo05rJTvDjXR14zHFEKZriD3ZsSx+AG7/AFEA7
 qHmztjW+hOwbdsH31MVuO8AAAA=
X-Change-ID: 20250203-exynos7870-usb-9f3a5ed7ee95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771646; l=1071;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=qU9iA+vOEzeMzvDuuOahSaEm6XWe+bK8zvzRf3k0HB8=;
 b=HdyHH2oS4+fYxV/sBoU6KiRXywgEMncCSjxdSQ5dnur8HRqdnsL+GcHXAMImN9MhWfJuuPBNK
 CYqkKhHcxjJCvtXlpprtMcSWBFEGN0yGLvgEbPKTVM2NiVFnG00KQ6/
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_114101_753694_66E97496 
X-CRM114-Status: UNSURE (   9.40  )
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

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Switch positions of "ctrl" and "ref" clock names.
- Link to v2: https://lore.kernel.org/r/20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org

Changes in v2:
- Change compatible string (s/dwusb2/dwusb3).
- Rename clocks to "bus_early", "ctrl", and "ref".
- Set 3.0V regulator as mandatory.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-usb-v1-0-a7753f8183a4@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
      usb: dwc3: exynos: add support for exynos7870

 .../bindings/usb/samsung,exynos-dwc3.yaml          | 28 +++++++++++++++++++++-
 drivers/usb/dwc3/dwc3-exynos.c                     |  9 +++++++
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-usb-9f3a5ed7ee95

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


