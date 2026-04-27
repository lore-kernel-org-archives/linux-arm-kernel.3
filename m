Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AB0FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DqvvzMyEmlrI4hcnZylLcd63cTIDSd35dumXUI6uHPE=; b=uq2qOcPmovD4sfN4zCINB/Q9Y+
	ONZOAAeEd+VcNd+vlZ+RQ/uZuewn9XeQA+cE0qK9PH7DDamgM/IkyNkYfLGE8vdKH528oDBVUfQaH
	nLH5rTbv0YfwqbKz0/OmvlCJNrOFsFp8Po6c40C6uwMA++2lpOfJS3MdC17wlsfdNoGBRSIKyr52O
	abb9U+VDmUdH+MpLceoF2xNx4u908vWIicgtZTpr5DCzmSBGcosLkaMVASlt+vBqigU7jG0poNdeF
	IDRm6d+nC8pNIVgIJoq7ZHWBQzFzTi+lc/dP+SUvGGPuENHWTOHQSdFu3zbqogmLGRdzEiNK/RLDu
	jR3Z0L9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHzk-0000000GXeV-24FR;
	Mon, 27 Apr 2026 09:11:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHze-0000000GXcp-404n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:11:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c796163fac5so6071592a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777281066; x=1777885866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqvvzMyEmlrI4hcnZylLcd63cTIDSd35dumXUI6uHPE=;
        b=C7VfZE+TKUX3gujFjbXXAc4B5fB9erqq+J3v02nTdOg6BwkggJAbToNTg9Sq22Gbf7
         HbpuNLAdmEx60N7UkWBL35j8FYIz+0TjCN6R4D3Yk8+GIrRWqy62SHlx+ugVY4gQk6Os
         ZOtHOH/fBqIiVec36KYIBzAh7N5jJMQ2MPHpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281066; x=1777885866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqvvzMyEmlrI4hcnZylLcd63cTIDSd35dumXUI6uHPE=;
        b=IehVkeHrCnFnsHIAIfCaBXwsgno9I8P15mLgPLZjlVXEQ5nHedP1W7lxr/4in9gmKg
         IKShlTMH9gtrE6Q0RnX8kgduuEDB5t77XeP1xL2DPdoARhlfhz/wVwNH2smJ4CWv1Fhi
         H7hE54fR/FIy4PnUU7PrbG/uyOWNDuImf63/eZM6EWpHwC312M3n0QRo7QGPuAAom+SN
         w5rmIh/hztO95vQ+HganK5PaJWGBtXmYODjoeZua5SUtjs6WX/fZhEBa9LauHWzyCUzY
         x1A9Na4fb4TJn5mw9y9Rp+3P2vB9795urJfIhHb0d7zztFxPog0qOVqcMuWCoSd9T9mR
         TXRg==
X-Forwarded-Encrypted: i=1; AFNElJ8cdmqjtVD1zobgbcw72q/zR9ijqXhVR91yA0zJtDqh+gj/e7UMxD6ebjhWf14C6o4t+P4qMf/TdbKjQJf57xUH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3PtmbzFDgKwoTC7cCeDuikVe38xkHAYDPSUGmmLdlq3voL3cG
	pkW7YqUWkO1zzwB4mwfOZI5hGcV9DtcpkaiaL6q4D3vNZpVyWtI8ZGcdSM0Mkw0CbQ==
X-Gm-Gg: AeBDieuWTT4GtGF6/sy9bIYyfvz4f05fY9Bsf1pBT9qKIdDnI6zn8GO9pc4dCDaxo/I
	PsN5ij3Hq5cuhsYuucLS2jHEO+te8qoZesOK7MGaeyB1YO4c3hu9sIQDY6P4qVlRlzOkpRx+QQk
	879ynptl2Wz80+rsFZ/HBAuChN2UM38ww2C7HW7fu70Vyr8cGS9j2kXE6fUqI+RhU5iSkTuffyb
	HCoyplhKmSnZb0HF/TcpssEbiWSlgLrOwhAf2hJ6MLeX7/BHocj1JCYFu2E8xbFW/DuoPmOfMJz
	qkf3wUNEpjeUG9cd5xK0PqLUtajV5Fljfbl4WUfX5wRQ2KSQEXdSDP0EKJEyDGqI8YeiykS+kRQ
	NfM8sT1ONCMnzmmhJMxoR7YOImDj0hrg67V9Ndaw5U/Zdx880fVRzyWO7p+EOPxLmNylyDj9Mn0
	4a6rjUw9cc1g4F9TzEBID8CutgKVpfKgDyb+8OB1/rBKyobOecBHLwRbDYWYc/ty2HlAwv09NlM
	bmV2DixaPOOTTMguqYGV3RkmAMFwA==
X-Received: by 2002:a05:6a20:3c89:b0:3a1:f82e:b009 with SMTP id adf61e73a8af0-3a1f82ed0d6mr37644556637.18.1777281065928;
        Mon, 27 Apr 2026 02:11:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm37820011b3a.55.2026.04.27.02.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:11:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] firmware: raspberrypi: Change dependency to ARCH_BCM2835 and COMPILE_TEST
Date: Mon, 27 Apr 2026 17:10:57 +0800
Message-ID: <20260427091058.2669812-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021106_983586_FB3ACD5A 
X-CRM114-Status: GOOD (  16.17  )
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

The Raspberry Pi firmware driver has no compile dependencies on the
BCM2835 mailbox driver. It's just a indirect runtime dependency: the
driver only works on a Raspberry Pi.

Change the dependency from BCM2835_MBOX to ARCH_BCM2835. Also allow
compile tests. This allows drivers that have build time dependencies
on this firmware driver to be compile tested as well. More dependencies
are added to account for build time dependencies:

  - depends on MAILBOX for mailbox API (not stubbed) usage
  - depends on ARM || ARM64 for dsb() usage

Also make it built by default if ARCH_BCM2835, since many functions will
not work without this firmware driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Added depends on MAILBOX for API usage (pointed out by Sashiko)
- Added depends on ARM || ARM64 for dsb() usage
  (build failure report from kernel test robot)
- Added default ARCH_BCM2835 as Florian suggested
---
 drivers/firmware/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index bbd2155d8483..bcfda01c2ab8 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -114,7 +114,10 @@ config ISCSI_IBFT
 
 config RASPBERRYPI_FIRMWARE
 	tristate "Raspberry Pi Firmware Driver"
-	depends on BCM2835_MBOX
+	depends on ARCH_BCM2835 || COMPILE_TEST
+	depends on ARM || ARM64
+	depends on MAILBOX
+	default ARCH_BCM2835
 	help
 	  This option enables support for communicating with the firmware on the
 	  Raspberry Pi.
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


