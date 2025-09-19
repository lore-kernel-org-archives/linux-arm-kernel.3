Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A65CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vtPW98rgBsi1AXsCtSgCobaGSpH9VMGiOKrsL1cwC2U=; b=Tma/la95B802XK1p14K9iBOK1i
	x+4kSk6n57U8WiN1YDezYd1U4jGVlA8YzBV6TTXE5IrnZ0eUI4H1FTJpBHD47ZaFlBFdp1fgi2Q38
	V/JmstA6c+xWpKu9Ew0VpZUEQon146t1IUMeV3fpmenqMXaeX7VqNhyJCgb6hojRM0BPyjyPe6hoR
	U3DHBh6urBv2+ryriQ4zPHDBMp2KeI/pPSsLNSbJJ3x9O7AZd5phVKaOQbp7jsJhkKWM/j59zHOng
	tlgZuRKb5Z8pr+wvUwlE3DB/fP1qeeU1tAoHgihsFkW8ZZn3R6qge7YCD0p6SkoK2Bt+N38rcpiqI
	CM9mvOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVE-00000003QpT-09ME;
	Fri, 19 Sep 2025 15:58:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVB-00000003QoB-0NTp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:58:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1355822f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297503; x=1758902303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtPW98rgBsi1AXsCtSgCobaGSpH9VMGiOKrsL1cwC2U=;
        b=d6fu4bhbtzd3D5UCuNBGxlAjmS5cdTB+4oV8BjuGBJ2eKScOG2TKFz0ssdT5+CN37U
         VvAHyeOiQOD4Pn8aqtgLnmuDlWD6ma95EVHZtPk5TdAJUHH27+hJCCU4T+Xv1JM0mN0f
         D2w+3vszP+ElN/08GXeGNMo5Le9QkZU/57WiqhRYNQZFQ4gFjeJRAaPXi1MVs2lsKJFU
         vtBjGpc7xsyzegaOwetGg9hO+qm66TIc+b/IuRXkF8jknOJpXFUtagF4qfqsprZUJUMv
         EyQIrN+dJ6nZShAKp1Lj1wZDqrjcSJEFsvD7pa3D0Pw+eHfAZzYJzU61Ac/rU71aoymB
         mZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297503; x=1758902303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtPW98rgBsi1AXsCtSgCobaGSpH9VMGiOKrsL1cwC2U=;
        b=MIC1J4jLEZCkdVdthJMThU+GKWv7w8WEe1uVGOh5zAJhDTSuq4GzQYmI+jnlTCfZi2
         bs7m9Jg4LZuRP/rIoqLBIYRs+uP7YtTHKBTvu9AHUOPZai4ZPTNUQ/vNv8zWUM7/2VpE
         6e40J7WtSUbv+WZI9sRIwP+MrPPfDEt1ZEUxc8AyQXCZLhw+zjXruQFwwSlNUCP1N9kK
         nVzmvnFwY2hydk52kEiRyWstxKYLqms4B6xEDgAP6Fl4I4JUHGfq/yUr8Flxg9w7MPuU
         6PoI9K8VD8l+4oj1mJQAF9rtDnTgReiH+WN/zoGg6lmXyl22hY4W89xsfV0jk+qtMwqG
         A4ew==
X-Forwarded-Encrypted: i=1; AJvYcCXL4MSyVtEHgZVJDY81uaAGFSrsDaA/qUWiaeziceTFbgt6/s4m75qvkEnMGO8Uf5F82wAblp5yPn7yqTjCdAcD@lists.infradead.org
X-Gm-Message-State: AOJu0YwpOJiga47EvoPXtls9P+Kr1WRelAJRq3n5OOWHPf20hAg9nQqX
	yeu4i1oVh15pMFLa0k7I0tmKwZaoTpkE7PFNefy150wSnUfdRGeqlO1yIFwu5pAwRiI=
X-Gm-Gg: ASbGncv0dh4dP/eDMkGvKARf8RRZvSw/hsezc+0JUteYQMtm7aG2fj9Tuo9UpfJHjZi
	OmyT8UDALXStdoiX/vQ61A5e9ysT+cjRJsoYop6Hb7nhFGj51VONoYSGmY8LAeX/hrKUNoPZs7k
	XXfZaUtFycoB0J+P3Ay3GT45nU6vAIw6lZEoj1m+dlBqW4BQ8e9JiiND5OP30WK0sUTxO8dTMS5
	yCMN6tMWtk70+mFcFYJHpf5RtcTYraqQADDk1lZlJ4FezFIlhexo3Kks4igpzCn7Gw3V3C/hpEr
	YmOa2XSLnQOJYuebx26OS1CccIhN9kxSfXngaz5yHKpgH64kviT6eWJ+24cVDnD15vZr6SJiFWO
	jtI9r2jzNtqeRPQv9KOkLMSp4Ksh1oSo=
X-Google-Smtp-Source: AGHT+IFYUaAn9i6Eqk0wNZqPapSoDfpti615G8HPJJeCq6Zt6cdqWx78zxKqOQok9+7kvdNqxLGyAw==
X-Received: by 2002:a05:6000:144b:b0:3ec:3d75:1310 with SMTP id ffacd0b85a97d-3ee205def16mr3262070f8f.30.1758297502881;
        Fri, 19 Sep 2025 08:58:22 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:9dd0:62bf:d369:14ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407fa3sm8367224f8f.21.2025.09.19.08.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:58:22 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
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
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 0/4 v2] PCI: s32g: Add support for PCIe controller
Date: Fri, 19 Sep 2025 17:58:18 +0200
Message-ID: <20250919155821.95334-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085825_146350_77E08A51 
X-CRM114-Status: GOOD (  12.47  )
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

Change since v1:

- Cleanup DT binding
  - Removed useless description and fixed typo, naming and indentation.
  - Removed nxp,phy-mode binding until we agreed on a generic binding.
    Default (crnss) mode is used for now. Generic binding wil be discussed
    in a separate patch.
  - Removed max-link-speed and num-lanes which are coming from
    snps,dw-pcie-common.yaml. They are needed only if to restrict from the
    the default hw config.
  - Added unevaluatedProperties: false
  - Keep Phys in host node until dw support Root Port node.

- Removed nxp-s32g-pcie-phy-submode.h until there is a generic clock and
  spectrum binding.

- Rename files to start with pcie-s32g instead of pci-s32g

- Cleanup pcie-s32-reg.h and use dw_pcie_find_capability()

- cleanup and rename in s32g-pcie.c in addtion to remove useless check or
  duplicate code.

- dw_pcie_suspend/resume_noirq() doesn't woork, need to set child device
  to reach lowest state.

- Added L: imx@lists.linux.dev in MAINTAINERS

Vincent Guittot (3):
  dt-bindings: PCI: s32g: Add NXP PCIe controller
  PCI: s32g: Add initial PCIe support (RC)
  MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver

 .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++
 MAINTAINERS                                   |   4 +
 drivers/pci/controller/dwc/Kconfig            |  11 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-designware.h  |   1 +
 drivers/pci/controller/dwc/pcie-s32g-regs.h   |  61 ++
 drivers/pci/controller/dwc/pcie-s32g.c        | 578 ++++++++++++++++++
 7 files changed, 787 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-s32g-regs.h
 create mode 100644 drivers/pci/controller/dwc/pcie-s32g.c

-- 
2.43.0


