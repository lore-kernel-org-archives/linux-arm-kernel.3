Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8B0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8OEOROS/ylUhCcTkJLvcG8rNXSrm9rHJ6h2jWRJDiRI=; b=LPC4cecmafZ61URWlEJ1uJoi1h
	S763lAUJYXT7gSOAlC8M8RhYduYTPcSRZPxB49k7rBnrCQ+NkN3H1msQiolniW3na4OXusDLgD94B
	A6VXQDo0AiOzr934Z+F+l+9x6PXC21evKc1/gqr22lxYAS+CcuE4h59Ql3o2jHzYQ9tZwaIihWFi4
	roZ6U7Axkn2/mFmBzSQvZsIBkdj93ioXlWm3C4ZFYvRe4Qsrjtf/hs3rCRntU+liVbZMI5Ty/Jj1v
	FAbFThNwtVPpdW+xe1xut9pyNY2iLppSysMHvfOosnQIz+cdp9vAxkq9xOgMRKIB1gY5/nP2mwMF3
	CVMt/S5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFFx-00000005SN5-3jDU;
	Fri, 10 Jul 2026 17:43:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFFv-00000005SML-1kmf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:43:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso5177565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705397; x=1784310197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OEOROS/ylUhCcTkJLvcG8rNXSrm9rHJ6h2jWRJDiRI=;
        b=DRqOKfEmHGXFE/GNOa8WMnAHEHsXCsL8Du/vwL0QX8+CL1kyaBb7Q3f92EUALTBiYj
         nIKposjIFbORX94GQHRURoezuAspHClbHrMeTrezG9hQYm/UKIA9f+Whtrt+Q3xOJTTi
         XI6M+/JbDVuWh+nIRIbrYMr9kh10i1FebXfV17NhLKI4rpQQg6qtRfzKbu/jOl0C8AES
         vEzPVrLmD85seQqzEQ+7pwRDmtfjwRgVb3W41bJIukKryP/o8hrIAenBHxJ8T1Pl/Wl4
         R7ZWFw1Lcbwc7l/3dNdex4zynUNb4ayqGxkDsDHyNabpY/aP6YNnxAYB77CXno2jMK1d
         lM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705397; x=1784310197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OEOROS/ylUhCcTkJLvcG8rNXSrm9rHJ6h2jWRJDiRI=;
        b=QPHvxJj9Z2O7hQb9ZqddiCrWbSSWl7Ri9H3klDXbAWfhB6cm1qUEN+dTYtH0lUorHP
         PCbJ9IAt0+g/xqxjio4gvOJi3uN6vOpMrt7g+50nvv8A7raQtvJvvI4iYwPN45lLFM1G
         o4cmTAYX149eMdtjdFemwfpXvUAL8uq0zQqItEv2GBtbphowgeQ/MKfc4geUeCN1lODV
         7yXbWvMFL4S0H12AvhR/cAWsOWziNiMAJZJKyFBajcSrDJQNarJKHm6VdtbguTrylWUD
         aoB061B5cIvtg3gIj2hzHTlW7JrMDfKv92NM2Vxac/B5JtenwQ0TBKOWOan6nd/ohUpy
         8atg==
X-Forwarded-Encrypted: i=1; AHgh+RrLt2DlOAaOw2OE/oA+t20IQNH7U9v2LESRVhk92/BEfAXAUBAz3jvDDcIb4geAdAeqHpLVx6DtWLUY/wYx9wT2@lists.infradead.org
X-Gm-Message-State: AOJu0YzjF3R7nDAi2twpHu//5BBHlLUj81sGDC0+QLOFzObBZFluE01Y
	5CKdNsd+jEU/AVZCOisq4Mwd9cvxAATb+GdUZ670dchBgGA97mzADROA
X-Gm-Gg: AfdE7cmh9kXOCq1GhiOd5OnSklT4iVMJFWqilpsA+uCsMODCIX8awMyzsuOETC6hn0H
	xaMFSZZuepbslcnWknAn6nKgxg/KrlKf0ml+CMAmmeGRTPlba05u9A0zqLnK2YN+3ZdXoqHIyGk
	yI+vNcp86klW0U3KlKNDTzcfUUaKOhKZNWKQaPe4eC8k/3mi8n5Mk9N8GqGMu1dnA7KDQYwW7ge
	hkLRlkrbJP2R32D/JOUpFM7NZwvkLwYZ2U/zdcXF3mWnNeSNfnMyncVS248KgUCR0JLSMJ05pfm
	j3EWdmW5IZUGyYnPldgByWZIHWMS1uO+dXGgUT7xmDB6RcsoZY/9kc3OqDH8dcX5q0Y4YxEcB0H
	4Yky4Wsq7pm2CpyzvscTRDEjhhVKkQmtv6E3aOpuUIrNgcK9hNoF+IndYUG8tKW0sqBSHtHcNt0
	JsCYQwC3Q5xWXDvZe2pUJh2X6TSiI9lhcKRv0VyspbmVZcTYqa8djH
X-Received: by 2002:a05:600c:b90:b0:493:e97c:10e0 with SMTP id 5b1f17b1804b1-493e97c10f4mr90835345e9.35.1783705397221;
        Fri, 10 Jul 2026 10:43:17 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm67170201f8f.4.2026.07.10.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:43:16 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Fri, 10 Jul 2026 19:43:06 +0200
Message-ID: <cover.1783689915.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_104319_491934_4FE59F8B 
X-CRM114-Status: GOOD (  12.33  )
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

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v2->v3:
 - Add audio_refclk1 clock
 - Removed pinctrl_vdd_mmc2
 - Fix reg_sdhc1_vmmc regulator
 - Add missing properties on pca9534 node

v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 555 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 483 +++++++++++++++
 4 files changed, 1045 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3


