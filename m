Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79675107760E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89zezr+cQG9hF/sqreyXoLTpHCyu41LIeqhsQyRbrO0=; b=tdhT61cCbU4vzNfAaOB9HKqOWq
	/9QoGQvq6O2qkSTyExCq+96lJQ3etWoH7TVI/pbYwDsjKf6a8t5FFmiL8yZARNDiRAboun2M5rqBm
	7wH5PpZorYpfH/MmUOrofTCjyraB4lvmxJFaiBL51u9Hy9yLVzact6x263H0hmXq1tTCDY4V28bcZ
	0mqOtZDmqO/gZ5OgBltJxw/+fbttbzEvXUnWAEIQI8Tc3/LzMCGpR8ZE+rIKoOKf8CPpREG8D36Hz
	mx8n7vruVymM1V5gZ54jN2EGTxYxPmku4wnCOX55fnk/80nm5iOgjc5WieKGqUwUq6A4KTxGyS0/K
	vlT5+b5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wh7-00000009F71-3a4X;
	Wed, 18 Mar 2026 19:36:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wh5-00000009F6e-3erV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:36:41 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-358ed696623so181762a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 12:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862599; x=1774467399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=89zezr+cQG9hF/sqreyXoLTpHCyu41LIeqhsQyRbrO0=;
        b=XiBf8wC9wh/g8aG3ijfLWUI9B8JP9tdMPVFjTT1D2fGcVoQXBRz3A4snChVMlS2Og+
         6VKMWyZ+LQDqJEfpOtYE/EWN78rJZzFiZb8d9D01r3i+rldLmZjhSmODHjyfzOVL5VAT
         izisaSNSomxF5/0OoPVM6ZcLgFNytC5YBMEROaJcnKc9BvqjK/A9nQsFTZ5U9mtI+0cZ
         xC0u7KFyXq8Zdvg8VU63pW8xbVaxzJR7o5LUlC5ww7OuwarnYsg28ReqhGgL+3PHj4Ga
         xCy/RNDnn3V8pkOtxovfNr/vOO6CyUoqDUuMEK5RnwvkheilOWBU5ELd4EI2GtjES+br
         66CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862599; x=1774467399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89zezr+cQG9hF/sqreyXoLTpHCyu41LIeqhsQyRbrO0=;
        b=IFzhC1uzoHBsvj48hCA/5sHBwqjWCe9BLcULFaYv5Z37JfkZB5PtbU46sacLxbITmi
         K1RN8dC0mQoMDT9DDVO+rt3JpX0ttoZoJYZAQbGfHvR5lrT3/uPtrMUFzDkYyV3U6AbS
         zAZz/npek5vpUN44/MeX3FSS0tMTEB1HCZ8Cjyy+PJxfxN24x7T8FqQ9/3S4zuXXw4xI
         zMfHoE7Tt5Z0cKmMWzZoQ7C/THSzNS878epozBE6+Bb4SjVpAAFi503cHu6lDeRbnZMQ
         0g2SjsKk3Io+8z8V4H2luzE6k4yik9rUCLBneEMkCxXbaLq3yARsH4ATVCP93ZtLlvOt
         WtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWNYgV+Em1ygyYKC7PQW+M3VG3mMx4xjpTHfuvcngyYYMwr8W7H6ymSCEa1lZB2odsPVtAxy7TcGkxIbBpBdfK@lists.infradead.org
X-Gm-Message-State: AOJu0YwZs4tqPo6O7Oz4WkkrNVEiE5pAyqzUzatvRO+cBOOoRgMfY6o6
	Kskpdx2ZaHObCAt+ZGzmsyq/jw67zzPQ/ANt+lfMn4wjRpkjNFmqrJUi
X-Gm-Gg: ATEYQzz1GVGmY7kaVD3PCpQBF5KpQ4F7fxHI8VD0D+6SLShdoIXfxtEcFO8Q6GSNUoY
	fNf68AwRgHrtU15IzaX7fU5mgFvayenzh3sYWxN+2CWC044oL7vJpEzMVhkTpDaaUEotnnInI0K
	sR6c++Naf5Pg278PGDll9TAE9skPBffCKDSSnyi1oqzSCggGNIpB0kvH4Zp4Pmrn0iEBIUD9Ron
	ziL9VrOschHX6AWmpMg727UaUTX4SXakHVnDJa2t/zB7VEp3D8QCRYUhdkUxGogydACLBAwGEx1
	gEXZcdMpPrpTofhO05c5w6G42qbCCWIm4XLaAJJUHjZJr93UB8A6ZxGD/CUQJVeZ8uWjVxbaJMh
	CTh31eQ4jZHuy43oFQxLwYBfJQnsGuqbTe2cMEE1OwhudSmh+fJ91oTZsIT0inTJdKcu3KuSs7d
	xk49BKmK2nn2Mo6eB1ZkQH7a6EQveBSxcm/JiFHqRRTeA4xYRNE0VFvFG+F74M91Ab+OVPVT3R1
	U96nHmjO2ubS2VvLWoB2++tTNcMULozDiW75d8=
X-Received: by 2002:a17:90b:3f10:b0:35b:a418:698e with SMTP id 98e67ed59e1d1-35bb9d6cb2cmr3852750a91.0.1773862598753;
        Wed, 18 Mar 2026 12:36:38 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (100.130.194.35.bc.googleusercontent.com. [35.194.130.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9ff59a4sm1521664a91.2.2026.03.18.12.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:36:38 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 0/3] nvmem: Add Nuvoton NPCM OTP driver
Date: Wed, 18 Mar 2026 19:35:35 +0000
Message-ID: <20260318193538.246853-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_123639_934594_DA4DEF4C 
X-CRM114-Status: GOOD (  10.72  )
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

Add support for the OTP memory controllers found on Nuvoton NPCM7 SoCs.

This OTP is read-only and manages two independent arrays: Key Storage
and Fuse Array, which contain cryptographic keys, hardware strapping,
and calibration data. Each array provides 1024 bytes of storage.

You can use qemu-system-arm -M npcm750-evb to play around with it.

Kuan-Wei Chiu (3):
  dt-bindings: nvmem: add nuvoton,npcm750-otp
  nvmem: npcm-otp: Add Nuvoton NPCM OTP driver
  ARM: dts: nuvoton: Add OTP nodes for NPCM7xx

 .../bindings/nvmem/nuvoton,npcm750-otp.yaml   |  35 +++++
 MAINTAINERS                                   |   7 +
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  10 ++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/npcm-otp.c                      | 129 ++++++++++++++++++
 6 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nuvoton,npcm750-otp.yaml
 create mode 100644 drivers/nvmem/npcm-otp.c

-- 
2.53.0.851.ga537e3e6e9-goog


