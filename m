Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B243CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/aFkMtgPYOPppFdVq9p/DTaP+xo69rwcAOuFufICWt4=; b=xpXWJucRCSt0raRPANPzVmvfxt
	+Y9yGV46jCUp0Vm035aOxzjlwQLG+40BPihVOy+ZeqoqZAL+xXOcxlQCI2nR7R239gTTpUsoCGSjX
	IzL4O7vOE1nRA6H/Gqge8uyxT0+dSOvwpp1MM84qF/RaLow5vKX0AXYedBhbvR78T8h3WKvv+kGub
	xW2m9u/OOoghrOQclgGcR7KC4bd+JxOG5n+gqK7Jxk8qwRWoI2p/mV54MZEs+x5p/8IBlpWUAW8QD
	XmwdeCGRID18+JJjgdJ9nawbpPKTJCHeoT/vzCT+x4NjOL3oTHP02BxUZEt+cDh+sCqLY5Jt6iSEL
	pfUDYVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyL5T-00000006Foi-45vH;
	Tue, 16 Sep 2025 02:06:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyL5S-00000006Ffw-0RCi;
	Tue, 16 Sep 2025 02:06:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45443600B0;
	Tue, 16 Sep 2025 02:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA2E2C4CEF1;
	Tue, 16 Sep 2025 02:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757988388;
	bh=9kK68Xs+KCmxOIP2SAhilPIrfTsceTJZcF5LekB7CjI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nlPKPcqCkuRy7II+o0WDa1b/voNXMCByVg+5KMOKTd31IcKDiHP6Fp5VZuYA3W4ba
	 MxTnUbhhMwKviZzvE9pJtFkD6/Z36AGZdR7IPMs0fH1HG24wbDDMzp+yWp3RMhCxUZ
	 V4zAXVjJgU2vY81WZ9E58T7dGwG935ilnEJHr7kflO1RdBwG22+6Uym8IL3JjfLPkV
	 gPDnIXRgZdlmdBHZkNrK9qr1Q3ec5JBw6oX3pFn3tbfwzaKPd2wXaiidQ85TOlV0zI
	 OybKc0txpzF34+ao2DDBQ/ztUB8b+Wbetll8x3/8ik5JmBNws7vXhQuE1OOIchgS8D
	 cISqLjBEi0bpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7199CAC592;
	Tue, 16 Sep 2025 02:06:28 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] clk: amlogic: add video-related clocks for S4 SoC
Date: Tue, 16 Sep 2025 10:06:05 +0800
Message-Id: <20250916-add_video_clk-v5-0-e25293589601@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3GyGgC/3XNSwrCMBSF4a2UjI3cvNrEkfsQKXlVg9VIK0Ep3
 bvRSbXV4bnw/XdAve+C79GmGFDnU+hDvOQhVgWyR305eBxc3ogCFVARgbVzdQrOx9q2J+wsk0Z
 woYBIlM218024v3u7fd7H0N9i93jnE3ld/5USwYA5+KopGWtYSbb63MZDsGsbz+jVSnTykvC5p
 9kbQ43QoqEK+NKzyStY/GfZSwbcKmKkUT88//Rq7nn2woMF4niltfz24zg+Aapg/Y1sAQAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757988387; l=1583;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9kK68Xs+KCmxOIP2SAhilPIrfTsceTJZcF5LekB7CjI=;
 b=nkaxWwNE5fra2bm3s9BXD4almurc1c50e/MeIIel3z6gjw+9eMM/sYz0NEoQvw99qUNoZiwcP
 5xi9b8BjZ3jAnCPUugGo5SfS5d6mXEvuQ+pT7SKmPR3u8+p6qYRjGZi
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
Changes in v5:
- Add Acked-by tags from Conor.
- Remove unnecessary flags as suggested by Jerome.
- Link to v4: https://lore.kernel.org/r/20250909-add_video_clk-v4-0-5e0c01d47aa8@amlogic.com

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

 drivers/clk/meson/s4-peripherals.c                 | 206 ++++++++++++++++++++-
 .../clock/amlogic,s4-peripherals-clkc.h            |  11 ++
 2 files changed, 213 insertions(+), 4 deletions(-)
---
base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
change-id: 20250715-add_video_clk-dc38b5459018

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



