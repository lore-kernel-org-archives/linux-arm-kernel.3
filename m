Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B4BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0dclyfXIKRocSAia33SCGleDbbuwVJcVUZF3S+mKXRI=; b=LH3spE0SMjN8dt
	KPfAqwZci0nzD6214wXyZMMKM6B4tFUGvUCNLGLX7RjcV1d38h9u8tkazYlIW1H0l6Z1Mtp02Y3Iu
	w44YCU/a/c5jSa84kLfDMIDxml1c194s5NPz5kgSK8YGj7je0jURE72jx60KF/VUySvYrW7Bd0J4R
	IVKQHWSwx5KYzQGicgVeVZFDAVDp8fh8VYXaYcKg66G7iu/DomlHpDad53Hh9o7+4e8VuBirQYZ94
	lTjwlWCSJu1donaBfC0biD+Q+hWbqNzcHEl01Xhegm7bxIwZI7eFy0T4wUt96VTeyGVRWCLjPUn5f
	rFAh3XBeKbF+VI9C2evA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTG6-00000009ZXQ-0iSv;
	Tue, 18 Feb 2025 19:27:54 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkV-00000009S7K-3x3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:55:17 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A11C925F3D;
	Tue, 18 Feb 2025 19:55:14 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5LHm9JJqCpk; Tue, 18 Feb 2025 19:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904910; bh=BxR9jFPEiAwMiqt5QfVjfx6zF42bwqi4ug6psMIP9Ls=;
	h=From:Subject:Date:To:Cc;
	b=d93Dyk8Wa+n8vyZdIO1QSVsiuODg9kHdqbXykEq9cs9EgWmlIqp38Mgt2/I7a5kvC
	 pX6ehS9RyqbhpRjQNiZHBuYIlLazXWRrw7hGIScZOvtIEq6TYIdm18KrDr6DaguPK2
	 /ekKn0XDLWxqgSJc8TALoz8RVJNFYPeVDSk6g8d0xGYjBb8bLwgYpg3ZgxKYJI4wqg
	 Xte9vPq2Fkb/wtA61EbkJARftGqzD6PvXMAVhN5C+O7/t0+3MeiK9BqWZBQw7hL+4h
	 WM0imfqFQeuZKTOjOdftdmeS9Tu8YT5nvA4/bJWycCvXrvLtP3A4m2/SGwyorV/8CB
	 4ecjGV8PLA9OQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 0/2] Introduce DWC3 support for Exynos7870
Date: Wed, 19 Feb 2025 00:24:41 +0530
Message-Id: <20250219-exynos7870-usb-v2-0-1de41a89c9d4@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHXtGcC/13MQQ6DIBCF4auYWZcGQQJ25T0aF7QOOhtpGEs0x
 ruXmnTT5f+S9+3AmAgZbtUOCTMxxbmEulTwnPw8oqChNCipjFRSC1y3ObJ1Voo3P0QbtDc4WMT
 WQDm9EgZaT/Del56Il5i208/1d/1RzT+VayGFt9bo4GqnfdMNxCnG5RrTCP1xHB/ptOaYrgAAA
 A==
X-Change-ID: 20250203-exynos7870-usb-9f3a5ed7ee95
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904902; l=905;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=BxR9jFPEiAwMiqt5QfVjfx6zF42bwqi4ug6psMIP9Ls=;
 b=DD2ZhpEVbRcVE/PLP/ud3pf1ys+uU6rHRIfm3V2I8G99ZjAnCM7Lrmvc4KxOJ7/oFGSipmE/c
 tkZAAuXzt0XC3LZhemTjcrp0tf1oP7xnZUknXdr4igOhwNjiSUDVb0D
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105516_114071_B8EBE418 
X-CRM114-Status: UNSURE (   9.53  )
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
base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
change-id: 20250203-exynos7870-usb-9f3a5ed7ee95

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


