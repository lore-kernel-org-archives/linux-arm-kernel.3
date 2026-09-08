Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2ECC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=; b=rt6+FObXKoxX/tAqOZWMp7f3iQ
	X8yxMxDfI2DbfLpDDzc3Y+rjEqUc3Sy8zmp2B8esdlSUMO+TVWrfwysJDe6wNG5EcgVl3Qor/r+98
	2HZPAWemUQ+6iBUo/AN/0IMF4IviCWeAUbUDCI5BdQHuBlQMmOSNZVzj7g6WawEDTqSVprZ0SaHQV
	W3iXIWDiSXlfz0+CA1lRGHmcnuvSSNKsfnylpACWOY2RXe9B9zayLpDXLkA57ee0b/vlrzPMvajbG
	rBfMmycKcL2GUqjm7WR6bCxNcQOT4KllKROJMEELoH7p5TG4r1Lol8mKzC/zS7E0hA4mo6DwXxVKW
	vyqNoE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8Q-00000008ZX5-34B3;
	Tue, 08 Sep 2026 09:28:58 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8O-00000008ZVQ-12Ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:28:57 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cbedf433a99so4150347a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859735; x=1789464535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=T9ZNo6KFBo7BPKGPkeCYm8BOumnqbOh89dH4/Dr5sVcWIvObMbyGglgjBRFfOcJryt
         ldYWNS8XxTP2Nn+2kVRY+OD/8PGJvZEW99WSQn4aJQ5b1JC8GgJL/9zLGfli/jpp7XZp
         wXnBBRu+Ua7UmEysFvp0n3EopRKeT1qhQwiKYOwP0/KSwb+UxlVsdBC8/Wh7YBWKVJyo
         y5iSd8mpRetHBIdx9dM1FbkLIv1fpq9Hzi7BzlcW6nZezSXm9wPypralzojR65gqzTal
         kukoZKRyW2qEphnX6rla8CN8A0JdtE+435lT0HQJOOXgESWMQRw4pbF81sgSSVuEUfAz
         1wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859735; x=1789464535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=cqqJqY3cGaaMRHHGh2lXjGQH3Y8/U+nUJyfQxK0t0bLFFhbMLdnmzKX38oKTn1UwZO
         BN4EaMwrdyXbBKuAqk2y+WzPjm0ucVy3rGZwFALnvK0SjELC5mqakq9piQSWgCYS16cr
         uTXzVlRAdmups8/Xx0joWGllcT8ehopAN47CWDdBWWDXm7MSjegsd1lvIkdWujsf0hvn
         IcqkCH6BwtXyGjLlo5kzAf4a0R++PfnK7X2NBE62OLtgWpJYUHiZ6J/a6CB/xeoY56+X
         A2D1A39au7dxhf8oQM8DOFsgiQV0A4SI2k8tLaZbgljPposw7KLPUXZvfQw6J/QOQozY
         qqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXklyS3/5xkduEGaWjMOnmx38oM6fQop2JbvpFpCyV04Edo3Hljwf3GFIpKDSfKwcqwwOS9pY39TUgjtRXTZeU@lists.infradead.org
X-Gm-Message-State: AFuF++lQR2mOnB3IrWJI/+bFB76VHEXAQkYwVwhhzCWZIG9HjjqSohz+
	g8O0/GFJHpq04TwIV7ppJ23FdLbNyuozPtJKcZXDDJMPKnTkE4fP6gzdDqRk3A==
X-Gm-Gg: AYBFou2O4mxdAdyoQUWMcD7vDDNJXWZC/c9zlibgJ8MKKHvJOxWsF6zcdXr3S6d+ST+
	HkEEX7hvjb0S0s+HM841e7tAdHJOtepTBOKV6qq9vCcJrtMlenIqJX+Zie90or7RwmCcCGDgiUh
	vbiSYrxFjsqY/mTWUAhLyM4n30rrHto0otZ+lQ7oyW7g00Iozpjw8yjuDjPbS4AZPbXJD8eFCyp
	KLhtcsWQW42+lGJssxy+VbnY/QwmJgeCUVwxA7jWb6q8AJ/GoznjIO3Vri+WqSLywbcu6WIhsHp
	PE6khLi2QIPi2plkIqE4wrkm7ob5TVOwlym86bIpBcDFYu001x1yasY3/1GLFnmbHzmxJF994+x
	vlC7mSFJ472vy3/bY1nyxkNk671H9nArgkY3/wSkWr11aWBe21y8xPOMdD6DHyxRG6BbH4+8v/8
	LnGli7muFUrFCUR7qEtIJQvrCtkfTVKTEU0G1NWv7/GmWyqBG3b9EFqjlkH6gAl7yZePQ+UiS0X
	ZvNV5pdMZP/nAzL9/aZrj0wmQnG3UBe6eItczc7YjIrrupFSPZVrb+f7ArfCAMy
X-Received: by 2002:a17:90b:4c52:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-39b2612ccddmr41681971a91.10.1788859735196;
        Tue, 08 Sep 2026 02:28:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:54 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 2/6] drm/verisilicon: add register-level macros for DC8000
Date: Tue,  8 Sep 2026 17:28:36 +0800
Message-ID: <20260908092840.225220-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022856_292018_046A5C13 
X-CRM114-Status: GOOD (  11.96  )
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

Add register-level constants needed by the forthcoming DC8000 (DCUltraLite)
hardware ops:

  VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h: bit mask for per-output
  VSYNC interrupt bits in DISP_IRQ_STA (0x147C) / DISP_IRQ_EN (0x1480),
  which are the IRQ registers used by DCUltraLite in place of the DC8200
  TOP_IRQ_ACK / TOP_IRQ_EN registers.

  VSDC_FB_CONFIG_ENABLE (bit 0), VSDC_FB_CONFIG_VALID (bit 3) and
  VSDC_FB_CONFIG_RESET (bit 4) in vs_primary_plane_regs.h: control bits
  in the FB_CONFIG register used by DCUltraLite for framebuffer enable
  and per-frame commit handshake.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635c..d4da22b08cd5c 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b390..67d4b00f294e2 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0


