Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F46C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2kSA4swe/lg6VGJyxz++5WQSZ3QniLrfwj6wBmltY0=; b=v6v6wm7ICjE//+
	gZfJu4672HbrqGoFvS9LWYwBbLjE7cRAAJ9QuZAZdvzhD59PaOXR3mA/YnBWg8Ov5BAmjHQcKAuW1
	Fs6bSlwuLSrMHjGPHQtSNwDUzemPKNH/TjG0DMDMfU1dzVArQl2ObAMdtjtF9BnMLaRb2HdDReFAS
	FWFvjkCe3uGVuSehy6A76IfpoghUmPFzAGCRTAFeF8xSgj7Qs3swqJr09SS4I3JPs3N7h0+z6FryH
	JxhOB2CALErFHSZUH5ZMlAPO5CJ5pkv5UB0rhtLnIQ6WnUWoM6Upv+lVHWiTUt3l3AalWUlUa8bIl
	ezyM85dODHLrDOUTElTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuDX-0000000CqgW-06G1;
	Thu, 26 Jun 2025 21:33:11 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsnW-0000000Cg76-3MoI;
	Thu, 26 Jun 2025 20:02:16 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7239A25DB0;
	Thu, 26 Jun 2025 22:02:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwtKvea1B_oe; Thu, 26 Jun 2025 22:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750968132; bh=oLEQGcXfmwkTXW2635WHw9QtoP6OjHr6Fdq+O046/X0=;
	h=From:Subject:Date:To:Cc;
	b=QvPbf8YbZqK/yody6Z1qtcnZxwQlfA2RV3+DKL32vyJwah3Bf17Pl8q+iPF7Z53Rf
	 vGg+fQVTJjmXffgBWM7zFDm7COawfFwQ4AeEpigJMZaOFWG3y/CevzfmaVw+nXUF2t
	 4zSwCEJ4ZQCT0n31YKCCnrhJLpJfIHjak5XoxUQx2vaB5CGhpUASUeSMP71CZmMlp7
	 occC0/HOJ5MvN3GmKZrrGoYT+DQjzSGY6AOjHL3SVIkxkiZmEjkj+oTq513ozQ4VPO
	 o3yoDerMQka7mUGPqWs2R3s25GfyYNE9Kz9Huf8eXSb35jbiN3yEQob3MEbs9lem+2
	 EgYS36pjHq3tw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Fixes for Exynos7870 MIPI PHY support
Date: Fri, 27 Jun 2025 01:31:53 +0530
Message-Id: <20250627-exynos7870-mipi-phy-fix-v1-0-2eefab8b50df@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGnXWgC/x2MQQqAIBAAvxJ7bmEzzOor0SFyrT1kohBJ9Pek4
 wzMPJA4CicYqwciX5Lk9AWauoJ1X/zGKLYwKFKaOqWR7+zPZHpDeEgQDHtGJzealkmz6wdLK5Q
 6RC76P0/z+36p8aziaQAAAA==
X-Change-ID: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750968126; l=853;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=oLEQGcXfmwkTXW2635WHw9QtoP6OjHr6Fdq+O046/X0=;
 b=l22ARppv4FdNrrIxIPioB4sYgrfvPuIUVxz3PSz9MWQNbePyQ/HGHSZf9esAQAadMmMpw2lkz
 hhA6aww7qUjD17J5bF2XGxVfjdolANncv2/o1ygEsRwSTYz71O0SV8J
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_130214_980924_F2749699 
X-CRM114-Status: UNSURE (   4.48  )
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

A few issues have been realized after Exynos7870 MIPI PHY support got
merged [1], this patch series aims to address them.

More information about the fixes is provided in respective commit
descriptions.

[1] https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (2):
      phy: exynos-mipi-video: correct cam0 sysreg compatible for exynos7870
      phy: exynos-mipi-video: allow skipping absent PHYs

 drivers/phy/samsung/phy-exynos-mipi-video.c | 102 ++++++++++++++++------------
 1 file changed, 58 insertions(+), 44 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250625-exynos7870-mipi-phy-fix-73e05ef89d0c

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


