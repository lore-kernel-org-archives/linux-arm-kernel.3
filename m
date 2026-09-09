Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B6EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IVGNbjOGRpPw3H08VWW1qB2tpMVtFhtvxOuvQrtYFmg=; b=VnhVy7PJLfCGdiwRk6BIAG9xmc
	/wvZV0VZrrQYQTay2i8xwkFSOyLhZ7QF7S0LAXqJ/h0691rSdONMCz4sdZ8sPWl+4POLG0d0eY/zW
	rfD4VPqISRWgdUNI7I8lW+QlU7EzQTd652wQHTV27itpnRrZMnzR9XMgau3GtVyXJV+mzp5lQt0wh
	tdd9YYN1oV50olagP5c9vYoacPxmg2mSl+5BDjiONq+0d/gSjHsHHnVuLiWTkLyr/yEl7Tf5yq/T/
	Yf/4YQV08LSeVTPMnjBdN+IlZCadwsAVmpSZSNoYzUJPuRH5sTaxJ4lz0n9Chcqw10DUcwH2BCwPs
	Bkht2u2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3C-0000000Bv22-0U8K;
	Wed, 09 Sep 2026 14:13:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4J3A-0000000Bv0Y-0pt4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:13:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4869b6f8629so6828f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788963198; x=1789567998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVGNbjOGRpPw3H08VWW1qB2tpMVtFhtvxOuvQrtYFmg=;
        b=n9PYVhjosLXsOQsqkLY/fFbLyPIGIIRk1c33bNkt+sbfiqBvLkhmHo02N8BQ5kg60M
         KWSqqGbhzZyWJbomu0Lhj3q/1Vcx2mFVYtvH871Ni1tzOwhApvWUgiV/fULsiE6RsztC
         kKWx7sSCC6edSSWlMvjG2skiAN2qiBe+inWCi2vdMO2wQI+hQSS+Mh0+OueH/wWRtAAu
         4tzK2Y+YNumAhjDekJlMU5AubHkndipOHv1bZCsCiDDZ9AfluwbkqlN39+5vsgkpSdPm
         AS1UKv8EtZxhUc6ybgX7uXckzNEhX9gv1Xen8e87hW4l75r+SqHDDSimULRq751rke9m
         NPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963198; x=1789567998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVGNbjOGRpPw3H08VWW1qB2tpMVtFhtvxOuvQrtYFmg=;
        b=VDwJbzIAjCl4ixEuUbKx35BWLVunJR73kxbWMkrQAtFA2KtTioGB36Nbr6nhqC6dj2
         euJPCyj3qPjdFhzotULcHxqLX08lgojGVQxX9R2PeErhJf0bEXOf72suf+bYMswpuvom
         n0JMVjCq4rquKzPa3hInISqZDrpoW9BRVG/96FfzqgBEs14Vz7B45AN8MLX6kpEZl1tC
         kAFdcGirwHJPET8H+e9zUoN1pMbWfdV4abyBY5f/qkQ10/+Pg/JQoRLHyFh9wFCBER/N
         JkD5MFiyASkAKllV1PFP0P3XTe0Ws9/6UE7j18a/FuSbQgJwIaK/Aec55aR/QvgfenQl
         qRsA==
X-Forwarded-Encrypted: i=1; AKwUvBzSc0AulnWpfSLLzw7Rj6Seq826U21LSVW34fgH6C1XbtUdffjEbg1FOOLFkwEm4dXobVWihyNsvte6thoPmy5I@lists.infradead.org
X-Gm-Message-State: AFuF++nJxbnEUvbJPs4EVul8+CmVC+C1cLGAEYgszL3DG5x0BSqFfwo1
	tKMdt5t3d9N6FJ89z0mas0IhaNkBiG3HRPela/Gv2l83RKq2gQSi3VeW
X-Gm-Gg: AYBFou0RYccTU4MLkl6/Hr6HZXmi5eJmT70Vf3gunr69DPQEEhvKoYqvJ1b/JFLunP+
	I85AZxUMTV1icr79pFsMIJGONEn0VXL80j0M6xP1WVravKaxtsQljz91XO0pNBYutZhH99vL9vB
	7+qiJ6bNlOeQ7XcT2nnP6Yu4MCyqnHfERzv4J65cc8mvliE9qBVqovRF9BPEi+hjxVAdNPWxxAU
	29IOkPTXj37L6D6g+/3pc1wnTFWuGY0pYu1W+libt8QeEyA/vTzVX9SSvW1gkM5LoJ0PDJBp3Hv
	njmSc6vz0JgBqJK9Zo/6oRpcqLxsXy+Z4gdfeqek4/+1TLxe8fL+4UtNAwvYktc6AjciKy2T9Ok
	JOtBXKZ1JSsxCYqDMNP4FR8B3gbQsJ7TrZ2uEf6x/jiU8CY1O7m4ZXe/z1yOfL/h1I/znsFNfaj
	cputK2J90qk3uHb6uR1rLNixu2BIs7+2IV4mxehLXEaH28tRkJkOpg8/6M0GQmXYN9sAt25QHLo
	11w61DDnvrk7sgpw16OhQTpEaOMubf/UN0lPI6p5IECByNRgQy6oBeCgg==
X-Received: by 2002:a05:6000:184f:b0:485:b148:aa13 with SMTP id ffacd0b85a97d-485b148acf3mr3046846f8f.40.1788963197769;
        Wed, 09 Sep 2026 07:13:17 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm43273521f8f.23.2026.09.09.07.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:13:17 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH 0/3] Raspberry Pi 5 RTC driver
Date: Wed,  9 Sep 2026 16:12:57 +0200
Message-ID: <20260909141300.1368790-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_071320_256989_89AFE128 
X-CRM114-Status: GOOD (  14.06  )
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

The Raspberry Pi 5 has a battery-backed RTC located on the DA9091 PMIC.
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C/SPI register interface).

This series adds:
  - a DT binding for the "raspberrypi,rpi-rtc" compatible
  - the RTC driver that talks to the firmware
  - the corresponding DT node for the Raspberry Pi 5 B

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a formal DT binding and moving the RTC node out of
the /soc node (it is not an MMIO device).

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via device-tree.

Testing
-------
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

Jonathan Bell (1):
  rtc: Add Raspberry Pi 5 RTC driver

Sander Speetjens (2):
  dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
  arm64: dts: broadcom: Add RTC to Raspberry Pi 5 B

 .../bindings/rtc/raspberrypi,rtc-rpi.yaml     |  48 +++
 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   7 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rpi.c                         | 277 ++++++++++++++++++
 5 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/raspberrypi,rtc-rpi.yaml
 create mode 100644 drivers/rtc/rtc-rpi.c

-- 
2.55.0


