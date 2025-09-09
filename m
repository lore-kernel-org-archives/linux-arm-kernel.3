Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C6CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVXnYg45I0wjVZ8k9NxY5XgJHRKx2rHyeQRfJ73gbrc=; b=ouKjDTrJfOx8FyHsBUB1bszyxn
	4X9eI1ieTeXlMHCzxFe6yVIAQzUfd6k75ZMQ86agGpRvZrZM7muIo47Tnd+ezKOJt54IFBg663E8n
	cj3FPgU1T4g1Rk5pB0NCL+FjHUxGeVhobv+n8u3khmYqGNArxtGr5RNWhk1os2fWSMF+QaaYdIQgq
	Ic5metlsJ0K8H9nllfZq6ddl5qsT5G4vrf6dcs5ZYtpfNenWPbhhFrGl9itthHWETboydP4Ua27uH
	kI5ELvpuXu/bRXEohMHSVT0UVzAuIgtXqn9NetJPO1hXSeTb3nKMCxiqDszFvmTHWOsDQRJ+7BOaG
	0PRetDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvulp-000000061Tp-2uWv;
	Tue, 09 Sep 2025 09:36:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsnL-00000005AMB-15yI;
	Tue, 09 Sep 2025 07:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C817449E8;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 123A7C4CEF4;
	Tue,  9 Sep 2025 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402978;
	bh=VdFf4gK8OI+xzT6h3uwJdXQFG43m8vn/Jt66A+K1OhI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XQwNxFTWA/dDsH9e48VAHeXRxDa/spqK5t3LaBcEwWkJnu9Tr39fMDZ0sq9azFWg3
	 h0NyMcIWwIp8CTeNK9EgPnwjuDx3fSyhIWuykTiqN0gpsN2U69U1CtnyOfhazaZ/r1
	 ZY29qB96gM6eKGmzk9t3DpV4RN2uIg2CZ5iF+3058hFisIYzlpB9YdGyqiWpFWskiA
	 chxxs0Y4InzHJQOBL4KBOJOO1u4XkVG7mf80NNKa+Zs5/w6Injxmqcc+G/sSQJnaSN
	 JnXNnWlx0fwAQa+/uMwZh8V2GV+AuaO+pfiQxzTKlXaT0l1cGcxN4a1wos1hAd1IdP
	 HGFqvcbURn0Ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F252ACAC589;
	Tue,  9 Sep 2025 07:29:37 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] clk: amlogic: add video-related clocks for S4 SoC
Date: Tue, 09 Sep 2025 15:29:10 +0800
Message-Id: <20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEbXv2gC/3XNSwqDMBSF4a2UjJuSpyYddR+lSJ4aqqZoCS3i3
 hudCEqH58L33wmMbghuBNfTBAaXwhhinwc7n4BpVF87GGzegCDCUYk5VNZWKVgXK9M+oTVUaM6
 4RFiAbF6D8+Gz9u6PvJswvuPwXfMJL9d/pYQhggy50heUelrgm+raWAdzMbEDSyuRzQvM9p5kr
 zXRXHFPJGJHTzcv0eE/zV5QxIzEWmi58/M8/wA0WCiRLAEAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757402973; l=1370;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=VdFf4gK8OI+xzT6h3uwJdXQFG43m8vn/Jt66A+K1OhI=;
 b=VqbrJOceJlc/Q2NatDtM8IYSiB6c80Qzc90doSqPAWs5h9HtoADXKA1PAXlWHugPJQNONaby2
 WNjm62jEbQyDJ/Z9+9A/Wxx0CTEbzXU7A8PNFgDUer2L7djydKqW7T/
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002939_383764_95992144 
X-CRM114-Status: UNSURE (   8.24  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch introduces new clock support for video processing components
including the encoder, demodulator and CVBS interface modules.

The related clocks have passed clk-measure verification.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v4:
- Add Acked-by tags from Rob and Krzysztof.
- Fix compilation errors.
- Link to v3: https://lore.kernel.org/r/20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com

Changes in v3:
- Rebase with Jerome's latest code base.
- Link to v2: https://lore.kernel.org/r/20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com

Changes in v2:
- Removed lcd_an clock tree (previously used in meson series but obsolete in
newer chips).
- Removed Rob's 'Acked-by' tag due to dt-binding changes (Is it necessary?).
- Link to v1: https://lore.kernel.org/r/20250715-add_video_clk-v1-0-40e7f633f361@amlogic.com

---
Chuan Liu (2):
      dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      clk: amlogic: add video-related clocks for S4 SoC

 drivers/clk/meson/s4-peripherals.c                 | 203 +++++++++++++++++++++
 .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
 2 files changed, 214 insertions(+)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20250715-add_video_clk-dc38b5459018

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



