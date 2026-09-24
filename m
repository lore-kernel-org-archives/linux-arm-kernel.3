Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C887C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mDX1YWZgv2v5Sh7tItNyghYlDCdlCLpMr/PsN3YN948=; b=FMkj9dM9sx7qv+vD5220eP/nvL
	kY37+BQEc1rrpYQ1DojDO1oni4cnLCnEi/wwnmcx4YoVg6q5RL0pQWlhIAeQgGq3m15GEIF64vQ2i
	96d0Mu2DvAmO4TrCDhCkuCyIBSzLdxLVfgc3J8hEQug3klv6LKXewGvly2m8CFMGqRoKtM+ecck9i
	Bh8f1ZlTf2jC1hcoNlpwh7ykCYvazorXu35W6Ljs/uJ36vZFVcEV5WugBPzYiYcGO8E9W3t65RhG/
	2zRJwhw6AaH39EE6GCRG24DpR8ymdRo2fPA0k1rtUCeeVWS4b47w7fkFU2Z65iuKUw68wCP0mCpzF
	SHofR8cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dmK-0000000AGkc-3qtr;
	Thu, 24 Sep 2026 07:22:00 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dmH-0000000AGjU-1Ugo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:21:58 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so9334355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234515; x=1790839315; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDX1YWZgv2v5Sh7tItNyghYlDCdlCLpMr/PsN3YN948=;
        b=U0XaUOLzKzsVh51kGBV83GwEwo6iysMXTlcgn+SqsHNq+Yl6PVW1T0XpnTJ0d7QLUK
         ArWBsXdxMIYZCDvDKnRzYn9vAMxJZZtASTzFo+ctCz+cReG8bPPNQyqBmvSAQIHQR0HO
         MPI8MVpzz4pBe6hvCbPzAJY9ryY201hh2UYa+m84VzlYZZQXomMcYMH28nr/wC9yYyDU
         jUrtU46bvX+IrmEsd74tWqR2qnPBKfcYXN21Y7jeocon5AUNui89mUq6BLKoxfLvh3xH
         lcIz25ZS7M7wD8bJcDC+WHXMvHNwyyqzb14ePqzW//HbV+ONOP+bxscWvHQrs+jz1c1/
         1Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234515; x=1790839315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDX1YWZgv2v5Sh7tItNyghYlDCdlCLpMr/PsN3YN948=;
        b=xtcN1tFgBri1nZFhbVa1Jvm434FwIbIFwJ5xQU7J4qPbmuA47iXvmlW8Rc0+65QvXd
         acDecbb1Nzhq0OxNtyLKWQ7QTvbhsoVZSosEVMY60Qi+sZVpfEquOksx5Jfj1R8UblFb
         ZSQEPFc/fAj9pt03nCXG9zWleRDVuZZtx2Ki70QVKv8W606N2B9vZg1F+M0szpWA3MxI
         FJj0mdkLpJ5qaG1jq+rsvpa0uW7PzWw7u0zwoo8mOAm7ra332ZZSyzONfwvrtvEhj9BW
         a4+EmudWjHxQR/NpgbMXR7QNpDLFUx2iOT5A8QiS3y9PKxlz3jKO3/GAkPGNEeqrTyw4
         2spw==
X-Forwarded-Encrypted: i=1; AKwUvBwsCHqHVxh0WITveO1kdsdXHBU1BMvwqr3NqpFpx6I/uvOF4gfbl/fvpVg/1TIv01vRDtjAFV2qVVxkgOF9oZK9@lists.infradead.org
X-Gm-Message-State: AFuF++mx4PmbpTmSDO9HcfJS1UGSVWM443aD2X/SpmmRuUAIb9M1KqxU
	3UNot6c17XFN1V6ipstsxw/y4lHI653Kl41xIENXTJmpeYXhmKFpZJhGm1BligZUIsI=
X-Gm-Gg: AYBFou1H9zPx04QszWvq2hwIP60+xRDsXISG+Y80xGWvn0FIb0p3HKNQGCMANm5naG3
	yhgBsyxuhkBEUUX9oAy2pBb+lLu/h9CcSo7z0m+i3HsDqP4GUJ0jRX9r5+Uwo0a/5NkXRzMyKNS
	V434hmag2ahM7Z1SxdwadA6sgsHI2c2irx18l+V6QEchwjCHMbk+1TdQaJKoeFfIa7pIBJQv8Yy
	dKvML0k8PXXatmVVmpepetwE/FCf272urMQ/QSkQ4W20zoKn1Kpm3KnEilw8oCJi9x4GZpmymnx
	Kl4i0E0zmZ++BLpmFv4Rlqv/9ZsNzBn2AiocJLUJ7Dc5lOGAEWKbVo1AThh+TU31oQKNbaO/aUb
	UJ8SHX1E+SuiqGn1frgP+l/J7sO22gmmB5f+AiQz3RJL2qk1lmqAkFqqwGo9XIhEsANZmFiIjVo
	Ydo0w13Mgso7RRBzS3buOXi3X+BzN3jEgBh7w5xhN3PaLLUXn4OE83crslB7Y83a2ffFFSAOLHM
	v0AwoG/JGxnLkpC87w87uBMJ0GD7k1s906bKgtfFelbmu1itgALG2M7kQs/U3fsQUwOCEBgeIRK
	8Eh14vhxjlGgXJObYJWCYRdbzgViH2WH/DxJ9/ZW3KoA3j/++YA2pZoXEQ==
X-Received: by 2002:a05:600c:1385:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-49fe66fa5c2mr21450465e9.24.1790234514858;
        Thu, 24 Sep 2026 00:21:54 -0700 (PDT)
Received: from AHERLNXVDANI01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bb9891sm41051975e9.6.2026.09.24.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:21:54 -0700 (PDT)
From: =?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Michal Simek <michal.simek@amd.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: zynqmp: Enable crystal oscillator in initialization
Date: Thu, 24 Sep 2026 09:19:16 +0200
Message-ID: <20260924071917.80004-1-danividanivi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_002157_411109_04E7C840 
X-CRM114-Status: GOOD (  15.27  )
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

Enable the RTC crystal oscillator bit in the control register (RTC_CTRL,
offset 0x40) during driver initialization.

Although the RTC_OSC_EN macro was defined when the driver was originally
introduced, it was never asserted in xlnx_init_rtc(). On cold boots, after
battery exhaustion, or on platforms where firmware does not pre-initialize
RTC_CTRL, the oscillator remains disabled and the counter never ticks.

Asserting RTC_OSC_EN alongside RTC_BATT_EN ensures the oscillator starts
without relying on bootloader initialization. Per the Zynq UltraScale+
TRM (UG1085), bit 24 (OSC_CNTRL) is a static level enable for the crystal
inverter rather than an edge-triggered reset; re-asserting it when the
oscillator is already running is a non-destructive no-op that does not
glitch or reset the ticking counters.

Tested on Zynq UltraScale+ hardware, confirming that the counter freezes
when RTC_OSC_EN is cleared, advances reliably once enabled, and is
unaffected when re-asserted while running.

Fixes: 11143c19eb57 ("rtc: add xilinx zynqmp rtc driver")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Viaño <danividanivi@gmail.com>
---
 drivers/rtc/rtc-zynqmp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 5bcb7536e973..278705ec09f5 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -167,9 +167,12 @@ static void xlnx_init_rtc(struct xlnx_rtc_dev *xrtcdev)
 {
 	u32 rtc_ctrl;
 
-	/* Enable RTC switch to battery when VCC_PSAUX is not available */
+	/*
+	 * Enable crystal oscillator, and enable RTC switch to battery
+	 * when VCC_PSAUX is not available.
+	 */
 	rtc_ctrl = readl(xrtcdev->reg_base + RTC_CTRL);
-	rtc_ctrl |= RTC_BATT_EN;
+	rtc_ctrl |= RTC_BATT_EN | RTC_OSC_EN;
 	writel(rtc_ctrl, xrtcdev->reg_base + RTC_CTRL);
 }
 
-- 
2.53.0


