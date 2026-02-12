Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B68AEE3693
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S0almpWJIOmyEv6VSqYTcS2yRIN/gY920tBGs7TdzE4=; b=zclLvwKSI7Yp8cwxB8zQ3JbAKp
	f4xAoEPrNW1RAZzEimQLoJmR9R/0ejeFE9oRAvm4fLh4wV85GXpF/HCUrP+i4bpAen/f6OmfTOELN
	PE+lhr+63YY43yZhDHhAzEwM89Y8hWzinpgnswqXEoE0i0dyQixe8csOOBqNdCS/96M7Fsxu0CXZX
	SPOcn9mwq2HixSwpR40mz/dZX0OtTq+07lTw7KPy8bHPcFT3DUammNES7RjPvAl9RgIvpxi5gxmxO
	M5O1jSx2ZPVahQhoJPUeuFSP4EsD3SoabcuFJZ1VpxbZT8Vu/sak4IGGlTMJ6DHPQ5uP44TEz839r
	VTFHaVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYDG-00000002Eu5-2YRR;
	Thu, 12 Feb 2026 15:02:38 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYDB-00000002ErF-19Z9;
	Thu, 12 Feb 2026 15:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=S0almpWJIOmyEv6VSqYTcS2yRIN/gY920tBGs7TdzE4=; b=XeRW6ThWK0s3rjldMHx4Mkm4KT
	2leO8FJL2XjBjJxgKUcJuw0iFABOSb/uWJkvcBGXMiLP+LHz0U0vkEzdeDL6/0lSALyoZ9RVJST3b
	k/Q3c+HBFaUZgTi4okIGKc2Pyuv0ECEzk4aQm48Bi12lpg2jB8nNu9vw2RU+TxwHOuTKS51xPVBAC
	Dmc7hIy9rksi50QQFTN73WqP1xRswPi0iPz3wKvFrvjQjRYEoDz2Jh6xXUfI0RBIZPf1ngppV6hN7
	AWig7TQXo3Wpy1RBVTrLAhBo5Nm+3lG6GDIG4b1YCIfUMwYoGM/dAco/3aeNeqzKwjLc2YkFVV9Gr
	+PCxzvQQ==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256) (Exim)
	id 1vqYCy-00HZH1-0K; Thu, 12 Feb 2026 16:02:20 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>
Cc: linux-pm@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] pmdomain: bcm: bcm2835-power: Fix broken reset status read
Date: Thu, 12 Feb 2026 11:49:44 -0300
Message-ID: <20260212150039.67117-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_070234_412019_7A992D95 
X-CRM114-Status: GOOD (  13.80  )
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

bcm2835_reset_status() has a misplaced parenthesis on every PM_READ()
call. Since PM_READ(reg) expands to readl(power->base + (reg)), the
expression:

    PM_READ(PM_GRAFX & PM_V3DRSTN)

computes the bitwise AND of the register offset PM_GRAFX with the
bitmask PM_V3DRSTN before using the result as a register offset, reading
from the wrong MMIO address instead of the intended PM_GRAFX register.
The same issue affects the PM_IMAGE cases.

Fix by moving the closing parenthesis so PM_READ() receives only the
register offset, and the bitmask is applied to the value returned by
the read.

Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

Hi,

Most likely this bug went unnoticed as there is no in-tree driver
currently calling reset_control_status() on the BCM2835 reset
controller. Although I'm sending a fix to the .status callback, another
possibility would be removing the implementation of this callback
considering that (1) it's broken and (2) it's not used.

I'd appreciate your feedback about the most suitable option.

Best regards,
- Maíra

---

 drivers/pmdomain/bcm/bcm2835-power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index 1d29addfe036..0450202bbee2 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -580,11 +580,11 @@ static int bcm2835_reset_status(struct reset_controller_dev *rcdev,
 
 	switch (id) {
 	case BCM2835_RESET_V3D:
-		return !PM_READ(PM_GRAFX & PM_V3DRSTN);
+		return !(PM_READ(PM_GRAFX) & PM_V3DRSTN);
 	case BCM2835_RESET_H264:
-		return !PM_READ(PM_IMAGE & PM_H264RSTN);
+		return !(PM_READ(PM_IMAGE) & PM_H264RSTN);
 	case BCM2835_RESET_ISP:
-		return !PM_READ(PM_IMAGE & PM_ISPRSTN);
+		return !(PM_READ(PM_IMAGE) & PM_ISPRSTN);
 	default:
 		return -EINVAL;
 	}
-- 
2.52.0


