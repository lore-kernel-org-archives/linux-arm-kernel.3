Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8978DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=; b=vhIrIFbn/vdz9KQ1j/q9Y1D0sd
	Uhz9y+VZ+JmLi3ROnHJyApMM9x+z9Xh4ZK2MnVmC3J1hzcNniws1zlRgSCxUCmefLs7U9oC/mNZHo
	QCrv+EkrXAYbk/y/K8M5biGZdDo5P8PVWoJuAHNYttTEQk+aMfym3Rn/IGPoTW5JWPWhF3NclAQe0
	OVWz7HCK651xEEQ8sH5I0migMkA53/YLWqyESdW6FaikNwKliXvLZIe9JoRa25uj/518iYGX3lOBh
	KF9dgudnll/3Ni1BI1BRucB6ydLsM9MA06d1C/tUXnes6i1tSg72eiSnGP9ATF49ljt/yN8mQ9gfd
	Sc36te1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVvb-0000000FUfI-3Xkt;
	Mon, 28 Jul 2025 22:02:39 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVt8-0000000FUWY-3W84
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 22:00:08 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3e3d2ad9180so12508025ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753740006; x=1754344806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=HDijcqgIFAmw1XKnQ8hC7cm5Tyltl97TkZgNlmTZmZ7FIOMcZd+sM1qG3kURg7RkGQ
         1vixRNb0qw5/ObHKWjCGOhMNMxT5Eyznjxu+ASD/66XOrRfHDIK8Gkp0xfOlihY5IWKX
         eA4oLTYMmPcSBbnJF2a632QzmC6CDEt4b9Zu0524Ew1pIc/0eVIhzouKs6W1kInphTXa
         O1heLTW8Drjes6mjBo32Xc/JvItgzJFboHFciG6/ZH7hTnTHghCv/FOZ0pgCk6ZYMkbo
         CZyzB8nkTpbm+JIoV7+0J2SUQwwYCpr/FUAQb5X0zHcH21ynszcl+JW9IYuL9+/fEHjD
         EEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753740006; x=1754344806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=r60BwksA2c5ybtbxGsJ2jDNJmT2zqD+53+qf/Ti1bsELpNFn0vVMUK832uuFhJS05K
         bVaEYZWzPzV5G4n9pBTHXkZWFI9ZjC6qWwc00wAaETI1TPZYB6HPiqH7VkJnbG3EKvXp
         RssstsksVvVC6dx0Ss2SSOufFVdmI1x/txquDZrS5j+4B3iEPd+ZEzvBpK4aKDRK7I3H
         F/K02xRTxi+zubyg7n4h3QtpK7/TmaunS5TgZaDN6U50BiHnHX8TbaC07do+9BnTelq8
         8AcKwzXAwr1oiSeGRopMM9mw3v6nKmvBFqeVrZHBHr0vx0PXyf8t4XTjYXMrIkdXkGbQ
         fDFw==
X-Forwarded-Encrypted: i=1; AJvYcCWvxc1ab4D1//Z9BmYth+8THb5yUjIy+4A3J+9xGbJyvIun2wjLtFMDFuQlHwDPJswkhNxtarQFAgJ4Ad77XqPP@lists.infradead.org
X-Gm-Message-State: AOJu0YzF72AagaTDr7zqid/E9oNmeqQQCk/KS6+bgpmdzDKQpG9APi1A
	IfUWEao1eIMEDx9UdxstLp0jTckMZEvSICywNiJRMJmY2yxMnhV6zwt02nYiXKl+v1M=
X-Gm-Gg: ASbGncsBXMM9e3z5e3OZkvotWeghf9MSAxO29bOJ/hdfcEnQejueEq2saJ95t9LjtnU
	Y/XnOS8E9v2Ouz2SbGjEZDoWmJDsNJK79hqvTuDeOHlfXSNzbR1aQqq+PW0AeyujJCOSavSme/n
	U40rQASluX1ymWhjSU1Bcj0YnrIEKZvwxXggtDZZa7v4mv8cQZ41MJdXgEbrSDepctx8jAUv+9L
	9FtLqSmYLBx2pg95imno/1WAdyL7+SFYHY9ZBKSkUOJqpny87+PWZ8i2JQZoshihoVl4R6V3xNr
	y+rfo/af4JrO2g87nPrDVbpVWL4KfG4OsXUTxdk/LcxCL0htuU/RGeTGpEOQ3AiZd/9I6p1TodQ
	JJxjd5caSY9lyZdAMxQomK4rvbTeoOL3XCJHjwwfPq9pS94rKTY+/Yju8Q4dHujpRQA==
X-Google-Smtp-Source: AGHT+IEInGF/Uihao86Df5Hh8l2S/n6kOMKGVWM1LdBNeEbSuGAD9Xt1OLU4ny9gFPGHVpMlKG5tfQ==
X-Received: by 2002:a05:6e02:1d98:b0:3e3:d185:9163 with SMTP id e9e14a558f8ab-3e3d185932fmr133375445ab.20.1753740005684;
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91c9fdfsm2167331173.4.2025.07.28.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk
Cc: devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Mon, 28 Jul 2025 17:00:01 -0500
Message-ID: <20250728220002.599554-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_150006_967056_E90BB23B 
X-CRM114-Status: GOOD (  12.19  )
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

There are two compatible strings defined in "8250.yaml" that require
two clocks to be specified, along with their names:
  - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
  - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"

When only one clock is used, the name is not required.  However there
are two places that do specify a name:
  - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
    compatible serial device is named "main"
  - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
    serial device is named "uart"

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
named clocks be used for the NXP platform mentioned above.  Extend that
so that the two named clocks used by the SpacemiT platform are similarly
restricted.

Add "main" and "uart" as allowed names when a single clock is specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..cef52ebd8f7da 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -61,11 +61,17 @@ allOf:
             - const: uartclk
             - const: reg
     else:
-      properties:
-        clock-names:
-          items:
-            - const: core
-            - const: bus
+      if:
+        properties:
+          compatible:
+            contains:
+              const: spacemit,k1-uart
+      then:
+        properties:
+          clock-names:
+            items:
+              - const: core
+              - const: bus
 
 properties:
   compatible:
@@ -162,6 +168,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
-- 
2.48.1


