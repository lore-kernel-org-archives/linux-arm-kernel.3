Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9207E7BDB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxYzimuJUPEidRiJMQ+HmOdyz4ofi/9h4aHUin0J/KI=; b=o9bAcFzDhIwMidr3eu7jWv1oaV
	1OVRmwNJ1rLlVSRGuvNfaOJN0Wmzbp3VCnlOFnMfWMyIpASW5M32Mkjj6XJ5e9tywHT31+KYeMovA
	QOQmieAZ+Yk1ep3MYuyAjMGaImYELtGt9LovzG8NnNOJ8NBrMFoI3ZREVZy1YS8+cOIqOptZtJ7tB
	XsA681RimzTUtbAUR5WnlaEGzAXsD8VNBDM5eukvluTCRE1k/dQ+vEAfdEnFOfUKTYPOcGLQnctL6
	WRwRi/syQIJi9A54CI8zEMxlpZ69IaIbZaLW9P3DLeDQ2naNk9hgByQXfIl8ZaM8WXEP6pZFEAQn5
	zsKzwuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxsD-00000006Wfv-1qMg;
	Mon, 16 Feb 2026 12:38:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrxs8-00000006Wc0-3jll
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 12:38:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59e62a3ee29so3247359e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771245519; x=1771850319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxYzimuJUPEidRiJMQ+HmOdyz4ofi/9h4aHUin0J/KI=;
        b=BqsFGjQNAKg2ct4Nns/9Pc4T8DTioNxunrVOQpJdfXp+FM5Qy/am53OSBBjJ9x4kSn
         ozz9vPaj+to6Bs38QeIJNNw4xPUBTxymxGD8LpoaOxWSp08nC4ouWGCeteT0fHDHsJsY
         SVEzNpQl1qMqWpKgyw2ZSiflSCMX/mNlFSaGQg5JxUv3b9unbND1bJGJrsHdB4eKF61j
         iC0YyzHT2lbTvgd5Z1Bo2XHzCsTcYq7Iov61dMKGNrWt6BAwplBeOOYReZfb07Vki4tU
         tdhvwBlXDN/2ysHaW030UDwaQSqrXoL6P2ddNdvJ1Bi4okDF33PXrDsCYwcSz/4e02Cg
         vfjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245519; x=1771850319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yxYzimuJUPEidRiJMQ+HmOdyz4ofi/9h4aHUin0J/KI=;
        b=JP02b2pB5uizl51y/pZIwYbIrq2Ew0fcHpSPgH4arEag7eis30Qxrjx60/Yxc0dPY2
         dKRsUy81aAOoj4iPXpZr6n5Ui/kzBFeP+P3AaJtoTb5miIPtfSy6ZYJgqEg35omy3UFR
         xbQdhs/tl2BcLNW1o99jojvuhgZwJAFZ1ZISQ/HSpDnDZlf32kRReeqyzucYZhjtPqPR
         cQYsBqYmw2KRsgV3Sk9ggcHh6ZBS9L0Yg9oz6pAc7WUm0mEbk2VXK8VqWYoiMIHGN10E
         hn1rDqB+iTh+Fq8OLXjS+9o08zuSn8X1UfK2ZLKqJgkqFUBEAcr7xnsZT57/4+Ptj9pv
         9ylA==
X-Forwarded-Encrypted: i=1; AJvYcCUdGAmHMUfkirAvdPN02TXrCeGTo2X5UrcTHchriYMp9TVdLHU+uDXjNDrqStje5KBBwX8O5HdQfg97tZRZvcqO@lists.infradead.org
X-Gm-Message-State: AOJu0YzjoFsXEikzS1yvakweVOYB0FUp+TXrKf9mKRaHfbJ6a/C6Et7U
	xOaE29GsW7PxN7RrKiHGyyiRgRxE6m4jDp1IAtxmSVHXZAEwaR4ul1Bp
X-Gm-Gg: AZuq6aI18qGlCV3P8yJWXud8a9IDlC2fnQ/W85jl+Ii6xyuhrDN5csV9cBKvLbzSDsw
	ZfXbqLARqbZuFoWsHQcBBj0ZYdZGenDFE0OkxLyBNrmMfNjJQCDmYEaOEXR9eaknkr+ahnHyv5d
	sERYXNfs22a4q+FxSz3qph1ORvJXaI2gnV5zAyU2LbFxXKC6HiregMHycp4PycGSPF33RYWsqbK
	mxw3K7LvPBSw8Asx2dALgJzWz0CJI9GMi91TBAVGXX0jiWKKu1KD9jz+8LUTX76KJ9boyPJYlQc
	E/RzFp11sj0pX8xx9aG0IDGDL3te1j+lEtYtN84Ca5jZnz7mX9fuDZgkRKpyZilXFlIwNiahRYS
	XnheZe0Ny61A2J5YXnBpi0MLRNIZZHxqmRDJK6xiyk/FVvvqNDz68noEeqG1Z5eZ2MQbVhZe45n
	9uBJ24RFa8Es/LsZruT3WTNKp4cQykFGsNPnUC0Kkw//M2BgNsI6UlxLaZ/rxbFzZ/eqcY
X-Received: by 2002:a05:6512:3349:b0:59e:1663:941 with SMTP id 2adb3069b0e04-59ef97e8962mr4718009e87.3.1771245518393;
        Mon, 16 Feb 2026 04:38:38 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b0577sm3175920e87.71.2026.02.16.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:38:37 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 16 Feb 2026 13:38:17 +0100
Subject: [PATCH v6 5/5] docs: i2c: i2c-topology: add section about bus
 speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-i2c-mux-v6-5-9be28ecfd7e3@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
In-Reply-To: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpkw/XbLu7lth7GLLf8U9ly9/S3XxpZEAm8IvRe
 sDkymr8Km2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaZMP1wAKCRCIgE5vWV1S
 MrCeD/kBIgHp5wo4RriNM3Ho5EKUx0YkZ0shf+c7g0bha3DjkzejasJNnO3nGwrZ7CfwD6Kjvbi
 pZOyi/Raz5n76EulZwQ2NyFUfqAQn+PqznU+B/ROwqxkQUL1sXVhclqYirKwJxQTxVVFM8Hnslw
 Cc3nYhr7rmnooDTQAAZ1CrVnGCTjfa26jHTbHAMG/BQx+G3G9MoMxy6ND1HNPX5c9MZVXMzfAD3
 G3dBar7nZD7Vh2q6gFWCuE3hUnpAWe/KL5ZjORVz+KLu2d/+2LfB+kQdB834cD4XiuWdI9GM+zn
 t/wMYtFwG3jbfdSOJB/Sgk4D89v31XylUqYxp0dn5sp41C+xt2wKmMgz0m3h36K4QzfkhnSbjaU
 UiFcZQi6gqJOR2bybnGP6lTnw6ysjHEm9XXxm7/ZN2vOzVXsNvmiWnOiJadCnOLzl6jCwl4w4Ws
 GF42Frn34dvlZVc5heSdQt5251OPVQSd1BpRqUz/mtmv1996ZoNq6jWW56KWB2dBf1+vRJzWIMi
 ym2n7LJcqR1Xt1xSwQRKF1c9zHFIxXM12eP0Xc7TiQhmqJHyBZOkQ8Lu6etwB3u799YsKc0pREh
 h+CZNcON10BgifHyMU3ZJ7aq+ftlqo2Iaw11Co+TFVrPbt/DrCqJB4L1830BI/xRXBWQtABLNLk
 w8r8L5jBMH6fE8Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_043840_996888_739DAC8B 
X-CRM114-Status: GOOD (  18.10  )
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


