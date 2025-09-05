Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBD9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TYEJs8l+A6y+Lk7SmXaiErx5NO2xctbAE0J/5j3vzz4=; b=yhnhd6XM2enYG8PEAtOc6hG5jc
	AP6acNvfKdI1OAy9bTqkohD1TrlvT3AXv6ALcy8APvFRuMbCLXfAU2qqlbrHT3AsB7hY6tU4cwxjn
	YUdm49mR5vjHn6+jOn9mwXuNagU7VePcOP1M4lXSDyCHk+UGmSQk3HisKbP9fJFpx4VxwFVXTLH4g
	tm2jSh3qMPat5+CH0JLHTsE1R+BFE8GliwLqzIec2KFbdOejH/YzM65PHPZYt/uFRPAuvaabu1R+E
	jLRYVPXbFjSlkxcvWB4wYlF/fBIy+UH3gWvvSsKp8DRiSXae4nEOfbJXFDvj0+Ue1vjI1srZpKy+m
	U9PDNIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUU-00000002JKw-467h;
	Fri, 05 Sep 2025 14:32:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSP8-00000000bQx-3gfq;
	Fri, 05 Sep 2025 09:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0500844B63;
	Fri,  5 Sep 2025 09:06:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF243C4CEF7;
	Fri,  5 Sep 2025 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757063205;
	bh=rRDRie+arRa0yqYYOTsTXaDhoR4vLQdygBET+PjEQc4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lUajUdKgwY0Sq6MDHOLTnDF4kPjjkA3IujfW3bUn3lPncE/df3YKTc1oh3sxBDGoM
	 +DSOcAV/jMRaVkHfCsmQe3Vu28Z8ocRHLIDMs0drHPr6rFzRMtkknHLjFxPgyjOU+i
	 kq5XfePVWzDAo6ahRBU/3U/ZSzuShOupUHAmrW9zoncX5vxh8E6BcGM24gvtdukniV
	 VNt/y3gwKLWOtwEwgyOwKUXG/BhfUNrTh2vkVak2Y1jJ9QZFdYxocuPy/ocbgSed0+
	 YwS4X4cxROLD0XNVlnI5gyP0S/KzOImRt37xeMPq7N5MRgHYeTbrt/GNcfY2h8DwTB
	 kpbR6jCIX0nPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B663CCA1016;
	Fri,  5 Sep 2025 09:06:45 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] clk: amlogic: add video-related clocks for S4 SoC
Date: Fri, 05 Sep 2025 17:06:37 +0800
Message-Id: <20250905-add_video_clk-v3-0-8304c91b8b94@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6oumgC/3XMyQrCMBSF4VcpWRvJ2MGV7yFSmqm92DaSSFBK3
 920G1FweQ58/4KiDWAjOhULCjZBBD/nwQ8F0kM39xaDyRsxwiSpqMSdMW0CY32rxxs2mtdKCtk
 QWqNs7sE6eO69yzXvAeLDh9eeT3R7/5USxQQLYitXcu54Sc/dNPoe9FH7CW2txD6+puLXs+yVY
 kp20rGGiG+/rusbnwRNkuwAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757063204; l=1186;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=rRDRie+arRa0yqYYOTsTXaDhoR4vLQdygBET+PjEQc4=;
 b=A5m6cXJ2nTGuUrkU0tNq1RZdcImPw4PhYKxqStuGNEeMeM0a3mwpAAbZEQzsDgZKfdniWS/mU
 DiNGQWNB4/XCv8eTNRvpCwrwuj7O8iIi4HFlBLfNIOJdFd7J13M0+Jx
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_020646_944656_D8F8F5F8 
X-CRM114-Status: UNSURE (   7.53  )
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



