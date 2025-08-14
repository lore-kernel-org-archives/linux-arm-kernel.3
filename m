Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA21CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cCVi8Dj/IT6KMzvfXrcFl2leTsD0X2q4oUewgHdXngo=; b=uK3p1XKOYz0GqntUnkAMj9jG4N
	NvtLpFMIEd0q5O+t+6Cjj+a6S2LkvsmrlacSZPXSpiRyxtDYtwqVmRlb5ytlhIwB3/Z7PqCNOPnPM
	zLM0tg/ycShWgJs1q+VxCyqPGYfzwCsXimh+k9kLcMJjQW/05vYmExx76KAGmN1oHAAAJ/QevOpjv
	NuvNDkMvAF9GLJ8tSpBM3r1AlmVES4NiX3SMxeWDXbWNIYmIdkBm1dbZGHw/qltOFbNXjLABiUBQA
	oMOFn/s3eztbe1iLKu33ATAhzhd/UadrgYQZ4I0jxVhAoLyL0rOhWxTZmoHMzHo4rMENd2VOAxWcD
	kSc5iLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRYq-0000000FwZY-2k2Z;
	Thu, 14 Aug 2025 06:35:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRWH-0000000FwFY-3Fl5;
	Thu, 14 Aug 2025 06:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D598A601DD;
	Thu, 14 Aug 2025 06:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84191C4CEEF;
	Thu, 14 Aug 2025 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755153180;
	bh=xqoMW8XQ1IL75gw5lb1OBnSfzSjiDXCBOC9x4KnlLSU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ltxOYszwyPENTkWpH3lho4Bdhhglu0MEvycD6ttz6Bga0lL/91rXsPKb+T5sGoI/d
	 NZmfiDWBkr7em9POsifhRmfwG3XQWAjT+Q8lIwKB6niA+Y1jUC5VCUOeS1A0MDOQSc
	 DzX6YbEW82W6+2ioXMmaPN17z+zw105AQX9lJRbwuEuF9e1xtN5CEU0s8ozeEMmmf3
	 noj4IwjWMBxEH25HGRhYgDgzOpOuSQhp2VNiIBMT/UFZDIZTpZCGuUtKY87pAjQs4s
	 53UISIos8L5S3NfUKv1wHFoVXmUc6g4nxYi+jw5vMb9ZnngQnuL/MalM9wWXjQrwNv
	 oce4e4tgSCLeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70860CA0EE3;
	Thu, 14 Aug 2025 06:33:00 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] clk: amlogic: add video-related clocks for S4 SoC
Date: Thu, 14 Aug 2025 14:32:43 +0800
Message-Id: <20250814-add_video_clk-v2-0-bb2b5a5f2904@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuDnWgC/3XMQQ6DIBCF4auYWZcGRNS66j0aYywMOqlKAw1pY
 7h7qfsu/5e8b4eAnjBAV+zgMVIgt+UoTwXoedwmZGRyQ8lLxRuh2GjMEMmgG/TyYEbL9q4qdeG
 ihfx5erT0Prxbn3um8HL+c/BR/NZ/UhSMs4pjY2sprazFdVwXN5E+a7dCn1L6AgvXnoqsAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755153176; l=1032;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=xqoMW8XQ1IL75gw5lb1OBnSfzSjiDXCBOC9x4KnlLSU=;
 b=E9qwT/Wglp5klWxgaqu55zaf7kslbuWrgnxDSlI5uC6A/jiIeb80gLHO4L7bEWyWkeHO9fg22
 wVZO7UoAtatCXo0rYwDEQWepfMylL42p3Q3Fq2yVcudVVZI1qkWbJ1e
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
base-commit: 8a65268500b00ecee5402ef9f80618ff73f30707
change-id: 20250715-add_video_clk-dc38b5459018

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



