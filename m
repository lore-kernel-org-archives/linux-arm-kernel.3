Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FF3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QYPHqMTKCV/4SepZAwfa5rvCiamyWF/H10RFWd8DrNU=; b=ThbtVc+cACfCb0teSuqDmoq5rt
	UXggfNANd0L6MjmbrdTpYhQRz+vvzFWnGkZ992PLEiNWHKsIXXKRDYdo11OkWTnHzg3m/wJYr9otb
	5D+ZxEnfyk7LA1SclLLBBAYoJLv4y7k5iyZvbwEGTaXNajAwDuphoMWuxxIDE1CX+FXWyZVcmDl31
	PX4FMSNcewL/tc8wPeq4Y3qA0/Rjp1uCxov43G96+KhBB5OLJKiSeKCJ3R1eMSRK4OUu3Lf2y960x
	nPmdGEQmG+cK7JRhqeoGn6vkUDZbSqDAb8bhdcNE1u2P30Q6CsJ6sM4rJkT7ylVJSbJKWXK1PHZQy
	GEz4gqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Xx-00000009mpn-4B6e;
	Fri, 12 Sep 2025 14:14:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4Xv-00000009mnW-47Fi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:14:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3e2055ce973so1117572f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686478; x=1758291278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYPHqMTKCV/4SepZAwfa5rvCiamyWF/H10RFWd8DrNU=;
        b=d5+L2Yd2pImH2NP24tdJDlMMWlwy3jPiY3WiiVSKWg5p3hWzAaJTc1+QNbbHjLuYSM
         6B5fRhD3MmCTHz57MetIGZkDJfAXvKJqDYk0q+Vv4p90mK91LITSWZwh+/ujJ6Z5JKev
         JL6flMhiby5UaM2ZBy6V4PiL0auRoXL5xYQOZ1Ubcqo3wqMubeVZxtuhGa667iuxu7DR
         FZr/rOoZ/dMn33XAAqgLTc+Ll8rk8o3F+9JFufkUMWZF3UZl262wulzhtzewpmL1qyIF
         Ur77C/RFdzVOcHpRHN5CdD2WEG5Vt59/RBOyMvIIBt28G4VTl/mURpT9rH0Bt9LSVY4R
         SLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686478; x=1758291278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYPHqMTKCV/4SepZAwfa5rvCiamyWF/H10RFWd8DrNU=;
        b=m98lZIY3Ate4eMholcG6oi255IByUCFi7SZjEuYrS2WuLzloW8fhCSHJ/QNWxIf7L/
         0a1t9NM3ktQQLfMkO3HxPTbW02hCWHQg1lT4YO4deNmhGorpcFdku4D23QQ190hQ9syr
         KlgP6xekT5Kbrwdbt07NLYoNyNTdVo/SufLrXO/KH6ZLfAkNborc781bsYM+eb06WRiA
         eb7k3tolx3EdHrE6BnK1rM6N0N5U6mMJEhcegMPBeI3JAlQ/rAqd6s/Lw/shLOx6K1ai
         kFmOCSaO28KkLY83sPRB7BPj+Qu00j/PVyVnRJzo67zIS8LEdSToe1Aw9ZKdoUPTUAn1
         YbwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv+/eAu4mZrHEiiyf6MfeRwX5wm7ZdrK5Qnr4uHAo9C8zckjw+DMskdDToTNz+8+BYo/gSQmrDbwYY8Ar5LE9M@lists.infradead.org
X-Gm-Message-State: AOJu0YzMubaZdemG5Wvwf18GXFDkFBUjnVjiKJyJ5TF408K2Yzl3oLj1
	soAkqrMjCQZGBDAXyxHDvW6LFRvz/kIwQU7Jy94+H768rPZvVuegoLXhG6oOXrT8E6w=
X-Gm-Gg: ASbGncsDiy/N4F2CvQGVoOEK5ZDc44NbNaeBBywDsqcRPOAu9BGavmaCxt80hWAv3YS
	WXi9IyuQFMR169NaXx/REi0cNQ3Gzmg2q9y6+1Jd4Rz8G7Zno56mYWRpDBpARR2Q/n4ZbRnjzZv
	ozOnEs55cKQRMuggvmDEDbXTnn83/JToe1B1yp2I3W7WlpL0nhNN/E5ansrSs/wtouZ2eVsrWS2
	gnyproz06IzQYKtEQO2CCpu9nlZ4K1fkh1OdheQYcl5rwl9dqnDoczsNJ+960xsXYKUlpHNPgF4
	ka0kbLBsjVX8OrPwKTKUrcMtWsbg01+Nb00KsPijrV8+YAotUa0jOMry9hFWe97h//aYAsV2E/w
	B6eCvzPwptlkxYA8mitXxceUc/LzuQQXN2+20LHOKpA==
X-Google-Smtp-Source: AGHT+IHmuQ4etOmxfxR5erD34BAIdfgntlZi1sczMbDFjFRnIdZIcAxN0Jzl68sTWuowQwjuFwFKgQ==
X-Received: by 2002:a5d:5d05:0:b0:3e7:46bf:f8bd with SMTP id ffacd0b85a97d-3e765793224mr2876593f8f.23.1757686477682;
        Fri, 12 Sep 2025 07:14:37 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:40ce:250c:1a13:d1ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd415sm6680739f8f.30.2025.09.12.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:36 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] pcie: s32g: Add support for PCIe controller
Date: Fri, 12 Sep 2025 16:14:32 +0200
Message-ID: <20250912141436.2347852-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_071440_024901_18A9A407 
X-CRM114-Status: GOOD (  10.59  )
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

The S32G SoC family has 2 PCIe controllers based on Designware IP.

Add the support for Host mode.

Ciprian Costea (1):
  pcie: s32g: Add Phy clock definition

Vincent Guittot (3):
  dt-bindings: pcie: Add the NXP PCIe controller
  pcie: s32g: Add initial PCIe support (RC)
  MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver

 .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 169 +++++
 MAINTAINERS                                   |   3 +
 drivers/pci/controller/dwc/Kconfig            |  12 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pci-s32g-regs.h    | 105 +++
 drivers/pci/controller/dwc/pci-s32g.c         | 697 ++++++++++++++++++
 drivers/pci/controller/dwc/pci-s32g.h         |  45 ++
 .../linux/pcie/nxp-s32g-pcie-phy-submode.h    |  15 +
 8 files changed, 1047 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pci-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pci-s32g.c
 create mode 100644 drivers/pci/controller/dwc/pci-s32g.h
 create mode 100644 include/linux/pcie/nxp-s32g-pcie-phy-submode.h

-- 
2.43.0


