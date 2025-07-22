Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB71BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GJQH/hF+xiHb5wpOlNLaNq0/n1MDfFBc0fOnEVl8MF0=; b=tMBiabZVZNPWUil3gFSEoKzsCY
	nSAH71kcDlLJMNJXkT37IAtBs0iAj2ocv8weMGwvsVWwJeUfLoZBRK6SRhu7Yl2YcBL62CeCmVr3X
	X5oYJuwgtB42drWvDKxGv9IAWlSZXWbYFgx4Xx8Rw6B7mhLaLOd/9+FWHMazf1/PXvPKQRXfUp3i0
	Im5v5BI0j+RUC9XmqVDDgX4jAneeyf8iiQfzDIOIoHblfKcsrtV5tZ1kP4E/3mOaPt2u+NiTrD2va
	X79rSEAquuDQ0xCFoE03k+hcjT/XaLA2d/hjV88YcogjU6s2wzu7RvV06HW0FHRwrFGmwLX8mSMAl
	gky6TVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueHaD-00000003Ebw-2G0N;
	Tue, 22 Jul 2025 18:19:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGRU-0000000368o-27Qm;
	Tue, 22 Jul 2025 17:06:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-748e63d4b05so3468051b3a.2;
        Tue, 22 Jul 2025 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753203974; x=1753808774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJQH/hF+xiHb5wpOlNLaNq0/n1MDfFBc0fOnEVl8MF0=;
        b=UzCrhEF8BVi2jftHuNi4/v1ODCvSt8R9bp+4+/VgEcOwoRgmsr4+Ia+rWOMxMpWAO0
         sFrJ+cocwLPU1SLag5gATbGSCvbqss0auIj9mOVljff/rhQdLpT+86G8zXDHbZqypFsu
         hJo0+6yap2TXQq69UQO0z7o96zJ+DiAwVheQiaZs1m2Wz2h4GHh1LJMdp0ZRP8gCy1Sk
         fetSQ5jO7t8PrFb+iBQY6/3rySkqC4fOzUuC3Ia6nAM00rTwzcCFePjvaVe1fJ4GTFK9
         lrTAD2XOnMlL2Ho9EkKzs2rS/pxbYsdxWyzKRnGtrdM8cncxvOQ6R3Fy4vquiOc66QzH
         Q71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753203974; x=1753808774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJQH/hF+xiHb5wpOlNLaNq0/n1MDfFBc0fOnEVl8MF0=;
        b=sFSaTWmSbZmaho+O2AfrTssRgI66p2010jBtKERVIW3CFEcLKbS271rArkbB/Stf8T
         SLBhpIsZtZQeRnK4Lr70LhZMtzbYmCD0C/AZJoQ3RV8xXVAaqHx+CAEDPaj4bO8ksSg6
         4VfSj5fgm4Wj/sShL9ly+nIJC/Qv24Qt3WjAJ9UsRt6eq4FbMpsG+tceKbNWHCoSoJ1x
         3hRNCy5wZNm/MY6vGaV8a8oadD0OEk9uJjJ4cWsERP9M0fZgjgrv8kROcbcCE4B9M5Fi
         dZ/t3feLJrb5LwNsNTK3MmaFMtkz1bb6vz6pG/b94/P+J+HP6ylx406k2E3pG0o7D51v
         4ofA==
X-Forwarded-Encrypted: i=1; AJvYcCWZCtSeiGgJfsZbZ90lJa9fA7cnSnZ6VAgYxo+3w1zcdEU4gEd8KGxOibaVOWwUVTivstz4gPLKYco7G6VixGTe6w==@lists.infradead.org, AJvYcCXVE8WIXxRjd8tIUbc9GB81grCcHcQWDOwylKF65yubQoXNlptjq/BSYO0s4tue2R/tbSLVSAF017x/o1sM@lists.infradead.org
X-Gm-Message-State: AOJu0YyQwhjkjs5aES78QM7ngq9hpaXGct3ONRUrY5XNAbwBODchJ2cV
	PejQqYOg4lA7CqF77HUzK9DGT6OJc7pAhxOytEKxExB0Q5oHAbnf6rGuWDCudNcBsTE=
X-Gm-Gg: ASbGnctRNDt/Uw+YbCJ1b9x+4k+siSN91xuDV/jWsrHTAsEBelXXo7O0vcEPh8dI3dA
	C/gNsjjXZdWienxHfFgKRCcZ2oX4NNgVzpuy84guUUFf4EJ1euHIAvWVmcifjzViEdMqlsC+NgY
	klHmZ1PRZmFIz1cY6reiDnCZFbm9WCTZWfS+8GcKw9cSIhL3TB1qkjAv7BoSwXvLsHmldr7FAtT
	5mFpZtYSdYMvQUqRG5bPFcu6CY/eq3dN1/5xwlMi00KpyHpY6P+so6FdrvJHS6XnqJgcauoSM8N
	YQnZiLakLfKN4mSwB9zWwfj8mQqc+UNkJwgMZf6bRBZWsw4KTxUewUUbFkWJu1UhVsQkwCKFd2O
	eeq9ns12RGxTeAUoDNUdnRjKDuUS/23Y=
X-Google-Smtp-Source: AGHT+IEkw8+Vtk94z6sfnq2tvcwIOwJg956iq0XweSQItS4GP7Y0qaUNiQVwgOPzwgaUtt2BcOqzAQ==
X-Received: by 2002:a05:6a20:6a09:b0:232:6809:d41a with SMTP id adf61e73a8af0-2381244da0bmr42904835637.14.1753203974225;
        Tue, 22 Jul 2025 10:06:14 -0700 (PDT)
Received: from km-host.. ([49.207.192.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe63065sm7350732a12.15.2025.07.22.10.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 10:06:13 -0700 (PDT)
From: Sanjay Suthar <sanjaysuthar661996@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: ribalda@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	Sanjay Suthar <sanjaysuthar661996@gmail.com>
Subject: [PATCH v3] dt-bindings: cleanup: fix duplicated 'is is' in YAML docs
Date: Tue, 22 Jul 2025 22:35:13 +0530
Message-Id: <20250722170513.5854-1-sanjaysuthar661996@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_100616_547033_FB4EAB86 
X-CRM114-Status: GOOD (  11.39  )
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

Fix minor grammatical issues by removing duplicated "is" in two devicetree
binding documents:

- net/amlogic,meson-dwmac.yaml
- iio/dac/ti,dac7612.yaml

Signed-off-by: Sanjay Suthar <sanjaysuthar661996@gmail.com>
---
Changes since V2:
- Corrected the subject line
- link to v2 : https://lore.kernel.org/linux-iio/20250720182627.39384-1-sanjaysuthar661996@gmail.com/T/#u

 Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml      | 2 +-
 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
index 20dd1370660d..624c640be4c8 100644
--- a/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
@@ -9,7 +9,7 @@ title: Texas Instruments DAC7612 family of DACs
 description:
   The DAC7612 is a dual, 12-bit digital-to-analog converter (DAC) with
   guaranteed 12-bit monotonicity performance over the industrial temperature
-  range. Is is programmable through an SPI interface.
+  range. It is programmable through an SPI interface.
 
 maintainers:
   - Ricardo Ribalda Delgado <ricardo@ribalda.com>
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 0cd78d71768c..5c91716d1f21 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -149,7 +149,7 @@ properties:
       - description:
           The first register range should be the one of the DWMAC controller
       - description:
-          The second range is is for the Amlogic specific configuration
+          The second range is for the Amlogic specific configuration
           (for example the PRG_ETHERNET register range on Meson8b and newer)
 
   interrupts:
-- 
2.34.1


