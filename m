Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACFCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 06:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=; b=CkZ15fOMFvjgbNja/7/CmJZIDj
	8r/KKys7clUq8MHPTx3PsXcqtkqi8Pty7Iz8MtYG4HBFmjOqSkOlzSJctG4nqpmsQi8uroo/h9wqd
	OyhyzNzuQZKjnXdm0q3vcQ7i/AZBycug6NUzxPsxdELzG6vGJH1l6TaZxyQNIg6/HRDPNvmSwu5SU
	iP0vCb++QkcbUw6rHNrX0rlDmg7GjwVcOHUc9xb9Hyfau/0HaOVYz8fpPLQXGmjLmTJCenegefkDK
	OUaQeaJoZGObex2JmEF0ZDGdx9yeEzoJWmCVsBCqGtGQY2JMFPRM9AmZ/F/vLsRN2//XSaTX+Iis7
	ksw/6/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDi-00000003FDD-3CMa;
	Wed, 08 Oct 2025 06:00:14 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NDg-00000003FBv-0EFF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 06:00:13 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-64a207e24e8so860767eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 23:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759903210; x=1760508010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=;
        b=zhX/m/vJWQ52fRtz6IzAuK4Z3RmOukki4xdfFRr4cM6DB0wuDymZrOpjTN1y75i6oB
         zrjwRUwTpx2UnXFSxGw+knSZiKjzF3k4ehhsYsTb5LSaLspGNgSujTf2GzgQ54VON1O0
         AJPEmqC3WG1ReqpuNMgN1PHxVgD7DWvfcsbbrHAfS4hHZaewohMYgWJKL5vpNkkS4CZa
         OAPQcxTJ6pccxr1BrzvctRIu6kI3dzb96IxsupG1JaNw1Pho0n/cqd7iiksHlR7nZ02v
         2DMHvl1QrtcsmZBRYo+h3VMh/PNXVvco7QBjh+BGoPXTAX7szzyJu83xINeCtTONi3UC
         0xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759903210; x=1760508010;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AP6DiX2vSgFvsuE3fKRpRDJbOdj4dqy4q7VW/8dnF2Y=;
        b=f/jMlZSnyRr4aLemS2rPTffhIQW82ljADlbC/ScZbMoP8R4vLbgrtN6cvziXmGqTJN
         kgYR6VmwhEOCEUj+gfUhQy/I87L9KvLcal5QcDGr/ENiMLk8egbuFPCA4wlkliy61wkg
         X8P2DjopzvRpBaUmbn8Ar+D0Ywokyje5+Cm0VpjQ/VvCJIK2a9D3uLcvol4sikm0DFfb
         t8QdB7IXGe/IgPf6VMIOdm9XlYR4uQFHv4yLVkLMg/3MnwbpnhNOzzuy+PIwjDR6qB9V
         cYOOHsE8HhuxRB5p8zmfWvsvOq2DWZVP3FCYQ/Sss89L01cYfRrH4slxT3rqcbL8uz8c
         tGVA==
X-Forwarded-Encrypted: i=1; AJvYcCX5YohhMWcdvqM15xn26jPMKS+X6Akx8hADInxr49BaLyexpEJK9rMatyg1KAKZ8Q5N2PuQFagtkpvozGErlChB@lists.infradead.org
X-Gm-Message-State: AOJu0YyPHSlvjV8mxCDFBTVRXta0utNMDF2C4bxlKJT0YnqbWn+AZ+GR
	QeZkpG43lkiugyM6PrA08ZEMeMZofZg/K9ExMmrwqfmOxfCcSxUXLi8cBnc65bXXE7FF52y1qCO
	ZOLXRQA==
X-Google-Smtp-Source: AGHT+IExUaS0sEpy2tAXscJ/2X+pom3EjFHo1AYYt3+9hKmXEYWCEaP2JPhBawFpp4MTEQMwGSBBqKvOJGE=
X-Received: from oacoo38.prod.google.com ([2002:a05:6871:4526:b0:331:9a49:4dbe])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6871:2b25:b0:36d:287c:694f
 with SMTP id 586e51a60fabf-3c0f80edcd7mr1302345fac.30.1759903210532; Tue, 07
 Oct 2025 23:00:10 -0700 (PDT)
Date: Wed,  8 Oct 2025 05:59:56 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008060000.3136021-1-royluo@google.com>
Subject: [PATCH v2 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_230012_122988_9474A705 
X-CRM114-Status: GOOD (  13.69  )
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

This series introduces USB controller and PHY support for the Google
Tensor G5 SoC (codename: Laguna), a new generation of Google silicon
first launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/
---
Roy Luo (4):
  dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
  usb: dwc3: Add Google Tensor SoC DWC3 glue driver
  dt-bindings: phy: google: Add Google Tensor G5 USB PHY
  phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,gs-usb-phy.yaml       |  96 +++
 .../bindings/usb/google,gs-dwc3.yaml          | 145 +++++
 drivers/phy/Kconfig                           |  14 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |  10 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 8 files changed, 1150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,gs-dwc3.yaml
 create mode 100644 drivers/phy/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.710.ga91ca5db03-goog


