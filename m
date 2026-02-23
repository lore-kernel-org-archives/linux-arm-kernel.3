Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE962EA4FC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxYzimuJUPEidRiJMQ+HmOdyz4ofi/9h4aHUin0J/KI=; b=Cz6y8W+aAIkNVEE8KICLg8aR5L
	iwYPyVDg57zrAoDv5P2NTOi72jlUJtGNetcE0ZhGERHT6wiIFa9mXqjHLAlTbm6vFLw0/vTFymrT8
	9QeWmw8Qyux2QeTQn+nL10mFLdoHiMDagi4CmDbTmbH8vB4Izb5VEbwHJ9AlS5emx3/svG17/cqJ7
	UUCXdLNzj7oZjYA6GurABrKUwRqHRnrmavNnEZ+5GNIzRR9Cn5c9D3Au6q4NO2ZUC7Vea2EM0qiyx
	H6IA8aSNohn9FElfgOe+qnIOgCI4xeiySU8jlpGFGNRZxsXhfQRgpTkhUlBuTrIhy7rauj27cTX2J
	vam2q1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0g-00000000TdV-2c8r;
	Mon, 23 Feb 2026 14:34:06 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuX0Y-00000000TWS-0tAd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:33:59 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59de8155501so4342218e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771857236; x=1772462036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxYzimuJUPEidRiJMQ+HmOdyz4ofi/9h4aHUin0J/KI=;
        b=ODC93E0IQ50+KZIVl6BZP/gwx6q0byn1ykN0iP2pXxjKt/sorfdrVg+NwhgPFP2mxW
         8t8XFuP/L4kwvSDtRyXUdnJ0D5uALdgiwtSnIUkKd73tx9329x9C6Zrq0x9rpuWyoG3D
         GOB1MSuUj5mICtnoWSXYycczJyDp7G9KE76UVRDuPwv9uSJKg9F5FKNrP82nsRf+jW24
         s/IBeecZT6VYdahj/kzmF7o1QgRWHluMLA/OeW1RgOmESmSEjVB2/vSysx+tGCtvGr7B
         1RmGJB/USN5JfV9gHAn/4tk4s9if+bN25pPjYacCki8IefxYeBllaC3ch2ipZ834AUse
         YR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771857236; x=1772462036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yxYzimuJUPEidRiJMQ+HmOdyz4ofi/9h4aHUin0J/KI=;
        b=Kxpfhtin4jagX+Img1QNFFS5BxvZikjpYXjxx01GBTAHQcnOFiCzY1KTRxpL5kuF4v
         WxEBXAdNpZcguKCr1NHX/bOgMcZYVCUwixh3P7JP5SRLbbXJdtWJXpHbJD9PILvrRNhq
         qC0z44K/fPAMG+1Qm/SbdkmImuPtIIvhYqnVTYzvojKm/gMknOXw+z80a+LgRpGkmAY1
         N/ju+xExLHLYA25vg13hTqskOOPMpEZyA754alQpMwDeG4ZMkGNirYufshKwDE7a3JqQ
         EIX4wOtxeknRH/drQ/pwoh+Lvu3Y1lEd+WWFCLmccvr6MqScQr338CV7qniA8//bDX/o
         SkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCViPEWZo7tNoAcEGRDxibsHVK/dDYNDUPh8E4MqkT60kNYPcO3LyZPud+LDGFyVwcWhTb3stD0vsPQxcpH3dTB7@lists.infradead.org
X-Gm-Message-State: AOJu0YxqvqB/QKKVbE9eQ7lzw5oBKZVApy3OUtJFrwb4WiTi3pU59T6Z
	hbmUgNM2xUEecuy14Oi5EYdy0YkEhdXfRO4V3rPUu8kldf4MN6otK2w3
X-Gm-Gg: AZuq6aLN6CQ9aWSMAOFTbBHiHoBYX2Xl2gpAb4AK3GveCdCrBcSftngkwgwvmirGv5R
	FVKK23JO9aXkD0FLHgSDFjy7HO6/hDWxLv9AFcSi9mXyQRVSjO2wu3lm2LD27MFwoBa2XBAFEbL
	CxEZFE5O+NLq9LTLVgBcXW9/9nU5jLyFGEC9oehVtM6c8FOo8wJNDUHHY6q+TKH8N+opAi1Zp9d
	1ITDNbKPBdS4FcPVCxbDI0IDVGLrmWtwBEiKtdsgo+S5E056q3ywvjPKJOAeOW0yEbBUuO9lNmC
	DWN8PjPOgHNzgRxLGcHsBOHQOs/KbMNS3uTkfzgHC+M/Jk47+W8Af4KsQptUrDY5sa5fpLiRSiY
	mmL1xicn+1uiYHzm9Ku9Rvj8wRPVJtWBZvDlayYUX+t5rGcRRf5IE1JzoUmticspKG/bXSsB2+i
	8v9NJ+8UbaXs2kDH8b+jwm3Atpp4iw7tT8vGNRFeYAKGYc0n4imGmvUyo7S0WXmld+uCE/
X-Received: by 2002:ac2:51cb:0:b0:5a0:f49d:1802 with SMTP id 2adb3069b0e04-5a0f49d183emr741484e87.46.1771857235661;
        Mon, 23 Feb 2026 06:33:55 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb16344sm1631709e87.37.2026.02.23.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:33:54 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 23 Feb 2026 15:33:54 +0100
Subject: [PATCH v7 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-mux-v7-5-ec75b214718a@gmail.com>
References: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
In-Reply-To: <20260223-i2c-mux-v7-0-ec75b214718a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8169;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=srHk2JrYne2Lr9S+OWYkWWOBdPBDjyWH8AYFfVb4WM4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpnGVmfI/iyqEJtwfCGjYa/ktan0zKU2eHHY9M/
 DYuLBGkY9GJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZxlZgAKCRCIgE5vWV1S
 Mlc3EACpRNiY/EUkVtCG0Oc8jRcpzfZewydd3Pz0EzMarqemaE2gMsPLgbfI+prQTxPZ2aakp+L
 QOv9D+zAwYy0RexyT1ybojEaz3BQ3c75MgcPoVQdQbjhOpyfmlbc+97v2mMgmcufuUjrHxIGoBT
 PLR+ZRy4qBkGajDojKJAnsnX+lQGQ1xH9oIqjbTh4LHZhWARX5IIH39rOMkelfY5S6cW6X7SSzv
 3oshi3OlLkEKLo1FUSeuV2Z4wENVRq7J7S76CWuU9Xcs8aSar6vWcnAMm+uxbZkIq58OBBBVrml
 r4iurrVgAUz1W6CRbmMzk6V1WhcH9rPPvlnj3akBQ3Xv6aUW1lfTzuxN4rNJ5iY+eCNS2JF1Vyc
 fpXEDBdn4SobypFJyGp9MVYX64TWAEiFMADEvyIMKKP0eKJ1+H+eK4NN7Nrx25igLN9OrS/L2pM
 DND6r00lETYp8iE7SCF7sEMftYmC3pgvgu3y2vedZ89IK02fnIgCWNBGb5X6CyN3udrRHcK3zZA
 ySeDhBTYm9zlNzvOnaTTn2cfJfB88Ch99KxpeK6yoikS/8tJPuLNlAatUlCut0JIc9HKYYg+UpA
 D2ymIlyEJVGUb4NdPniZG6HR52uNPWYzetampZjleNZuj0y8fKwnanbwgIwifzZ8x4szb3XFk4v
 xwm+Kysr7HfX4vQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_063358_310142_E5BCC21A 
X-CRM114-Status: GOOD (  18.09  )
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

Describe what needs to be consideraed and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 178 +++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..24df553ca8c7 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -367,6 +367,184 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
 
+Bus Speed and I2C Multiplexers
+================================
+
+I2C bus multiplexers allow multiple downstream channels to be exposed
+as separate I2C adapters which also could set their own bus speed.
+
+The multiplexer itself cannot change the bus speed as it use the upstream
+clock and data lines to communicate with the downstream devices. The speed
+is therefore changed in the root adapter resulting in that the whole bus is
+affected.
+
+This increases the complexity of the topology and some considerations must
+be taken into account.
+
+Bus speed
+----------
+
+Downstream channels of an I2C multiplexer can only operate at the same or
+lower bus speed as the upstream bus. This is because the upstream bus may
+have devices that cannot operate at higher speeds and those will be affected
+by the speed change.
+
+The example below illustrates the problem.
+The root adapter is operating at 100kHz. D2 can only operate with 100kHz,
+but D1 can operate at 400kHz. When D1 is selected, the bus speed of the
+root adapter would have to be set to 400kHz, a speed that D2 may not support.
+
+This topology is therefor not allowed: ::
+
+                          .----------. 400kHz .--------.
+        .--------. 100kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |
+                    |     '----------'
+                    |  .--------.
+                    '--| dev D2 |
+                       '--------'
+
+
+This topology is allowed: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
+Preferred topology
+-------------------
+
+The preferred topology when using different bus speeds is to have the multiplexer
+connected directly to the root adapter without any devices as siblings.
+By this arrangement, the bus speed can be changed without affecting any other devices
+and many of the caveats are avoided.
+
+Other multiplexers in parallel is still okay as those are locked out during transfers.
+
+This is the preferred topology: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
+Locking
+--------
+
+If the multiplexer is mux-locked, transfers to D3 may interleave between the
+select-transfer-deselect to D1 or D2.
+This results in a situation where the bus speed to D3 may be lower than it
+is supposed to be. This is usually not a problem.
+
+This topology is allowed but some transfers to D3 may be at 100kHz: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+Multiple muxes in series
+--------------------------
+
+When multiple muxes are used in series the same rules applies.
+
+Transfers to D3 may interleave between select-transfer-deselect to D1, which
+results that the bus speed to D2 or D3 will be at 100KHz.
+
+Transfers to D2 may interleave between select-transfer-deselect to D1, which
+results in that the bus speed to D1 may be at 400kHz as the transfer to D2
+will set the bus speed to before the transfer to D1 starts.
+
+This is probably a bad topology ::
+
+                     .----------. 400kHz .----------. 100kHz .--------.
+    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
+    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
+    '--------'  |    |  mux M1  |--.     |  mux M2  |
+                |    '----------'  |     '----------'
+                |  .--------.      |  .--------.
+                '--| dev D3 |      '--| dev D2 |
+                   '--------'         '--------'
+
+Multiple muxes in parallel
+----------------------------
+
+When multiple muxes are used in parallel all access to other muxes are locked out
+so this is not a problem.
+
+If the muxes are mux-locked, access to D3 may still interleave though.
+
+In the example below, D3 may not interleave between select-transfer-deselect for D1
+or D2 as both muxes are parent-locked: ::
+
+
+                   .----------. 100kHz   .--------.
+                   |  parent- |----------| dev D1 |
+                .--|  locked  |          '--------'
+                |  |  mux M1  |
+                |  '----------'
+                |      .----------. 400KHz  .--------.
+    .--------. 400kHz  |  parent- |---------| dev D2 |
+    |  root  |--+------|  locked  |         '--------'
+    '--------'  |      |  mux M2  |
+                |      '----------'
+                |  .--------.
+                '--| dev D3 |
+                   '--------'
+
+Idle state
+-----------
+
+Muxes have an idle state, which is the state the channels are put into when no channel
+is active. The state is typically one of the following:
+
+- All channels are disconnected
+- The last selected channel is left as-is
+- A predefined channel is selected
+
+Muxes that support an idle state where all channels are disconnected are preferred when using
+different bus speeds. Otherwise high bus speeds may "leak" through to devices that
+may not support that higher speed.
+
+Consider the following example: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+If the idle state of M1 is:
+
+- All channels disconnected: No problem, D1 and D2 are not affected by communication
+  to D3.
+- Last selected channel: Problem if D1 was the last selected channel. High speed
+  communication to D3 will be "leaked" to D1.
+- Predefined channel: Problem if the predefined channel D1. Set predefined channel
+  to D2 as D2 may handle 400kHz.
+
+Supported controllers
+-----------------------
+
+Not all I2C controllers support setting the bus speed dynamically.
+At the time of writing, the following controllers have support:
+
+============================   =============================================
+i2c-davinci                    Supports dynamic bus speed
+============================   =============================================
 
 Mux type of existing device drivers
 ===================================

-- 
2.52.0


