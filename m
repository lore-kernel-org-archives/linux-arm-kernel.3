Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C270CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=; b=ymYdQNYMQNZV39NJeuFHHXIPlL
	dEeU9UqZ31K6E7Xv7+iFra4Y+JpvZHvv5sEdREcFARqZUlLLsP1YYQZkHbXQpwVK7Q0bK9iQYHYL0
	ohDyyl9KsouAQWI1Puc7yzrTawta4CbZzFutFQemzIi76TimcnLC17hhK+6KWImiVl5EjdL537LZq
	I/jlrEhscdfWGi4wuCgGcF62zdqPbIrtFNcUA0Vm8zxEkIB1rXe+m8IYACRY4gmlQh/G+rxMIdthW
	MmTfTykG6m/ahqkiTpqoiaxtu5pMy/mdbfQ5yFA4dhQ18QqXowOp1bs6kHHnsGch+B/VwZlg1A55v
	rhu/L3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWi-00000000zpG-2uj7;
	Mon, 06 Oct 2025 23:21:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWg-00000000zog-3G8S
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 23:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=; b=Xf8eq6iIBOtMCQ9YR3IB9OeQ+k
	stklqna2hAFVxzPDHJPjL4T/eLj+2Ag4NcYxcfhsEr76ff/bEkL3B0NI4e0kHakW4kgmOb/I9syGP
	rtPU6YTZDYmu1DwWjDiuhKNiZTjVbdIJ2881ziyXex4EtntedbmrJMDbEetRuowjd/QBq3K/EbMvx
	n0vZ1MdeI0O3GfmGd/dEh0dFXldJRRm/Pe0NEs2Mwwc/H3VmW+G8dig1uS0UW6JTmSuNHac+up2fT
	HTBPt55MpFo21I1zQPUWx3j9qMwFiaSwYcPeyUzrx+aKVP5TSVKlhvyHXxKFfDWb2eH17/c1AHbPH
	uby/r+Gg==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uWb-0000000HFWx-3DG2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:21:52 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b55153c5ef2so3637431a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759792906; x=1760397706; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=;
        b=qYF0S9gxybaiX9Mfa96sr2iiTYYxHX9R7fTlcKmLqhiJ8yLp3cCizsjdfVF8tO3tdE
         V8bnjpsV2SY4NjK7OsafqIN7J93doMnJ+/b5FNKx/+pwSe4fnSO8LUu50L/AhjtLfqoO
         KGvTeyRVLUIjR67/VQm22//pUwTVRyeAeQ+pDuL6P5c57xVuhqQIVcQTSihz7WOGT6O2
         P6XsO/BjdnWOYba3VleqPdvQRkzfzllDz+4yPAIkIT1YL5yXXNIrPiaGcVaJLWIVb4/j
         iDahA1oUEuIyKDcWTpIWlRb6yiZlac5tpX7Q1e3CiOxYeu/+TBoLnkD5BNI4928NxHL+
         1oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759792906; x=1760397706;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzfK1528ICmc0tXAsZYoRPv5AMX4H8ddjdDCNZ7iAFo=;
        b=ecQueelz64GK2L19shX5eX+AaOv8bU2Qiq63SaeFYiiLQwoHpexpZJNYfv1yx+BmDv
         j5mPODe9v2PGH8wXbTwDdAOOdxkmRnWonhMkZpl/ITf5JltHwHdIw2L3mxRa50xhiGY2
         mthAgGOwMWhJoFZBH+imeJZzuYCtNlCKWl9MlXjzjh1fijLasPVvapxqglo37ytQzuiQ
         c3/KEqmz/k/U4V9KnwO09ltBpvvSgp1Ok4MwMVRl04IkatKj+zSoInW+5+nQvvXsAs49
         UFKLIbeowVM36Ztf1aiJNNoHpgUpOPfBNTClmRH6tOrOAStv35mcGwKWn1bjElYxrw1U
         YxWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNfDkerYqR3v4X+RPdOR9A2fYRkmTf5vQbyQQ7/AYcFIV9atcvekeNlxsfbR7OenyYXOu2Ee0NGiJmsnuLKHxq@lists.infradead.org
X-Gm-Message-State: AOJu0YyyhipQTvLKRD5yEpc1zYxtOrj2bWDsmIpcLxZuZLzLduG8A0Ov
	R3/awL0JYcFwuj2/nesZQnHfo/5J7ygjczTQvTknuERtUge/cMgID2kETjuTt3O5yBcF0wkYPxc
	piqBqWw==
X-Google-Smtp-Source: AGHT+IFQk/JRlFBeeVilrRKrIrWvH98VXOUhHqyPMmczUypQ4yLO+zGXFQ3cFbalFp6SbZeQtiGfVA0tVYA=
X-Received: from pfbgj18.prod.google.com ([2002:a05:6a00:8412:b0:77d:12a5:d3dc])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:99a3:b0:261:b20d:3ee5
 with SMTP id adf61e73a8af0-32b61e65fb4mr17776464637.23.1759792905892; Mon, 06
 Oct 2025 16:21:45 -0700 (PDT)
Date: Mon,  6 Oct 2025 23:21:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251006232125.1833979-1-royluo@google.com>
Subject: [PATCH v1 0/4] Add Google Tensor SoC USB support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_002150_049789_7876DCFD 
X-CRM114-Status: GOOD (  11.12  )
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

This series introduces support for the USB controller and PHY found on
Google Tensor SoCs (G5 and newer). This includes:

1.  DWC3 Glue Driver: A new glue layer for the Synopsys DesignWare USB 3.0
    controller (DWC3) as integrated into Google Tensor SoCs, including
    hibernation support.
2.  DWC3 DT Bindings: Device Tree binding documentation for the Google
    Tensor SoC DWC3 controller.
3.  USB PHY Driver: A new driver for the Google Tensor SoC USB PHY,
    initially supporting high-speed operations.
4.  USB PHY DT Bindings: Device Tree binding documentation for the Google
    Tensor SoC USB PHY.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Roy Luo (4):
  usb: dwc3: Add Google SoC DWC3 glue driver
  dt-bindings: usb: dwc3: Add Google SoC DWC3 USB
  usb: dwc3: Add Google SoC USB PHY driver
  dt-bindings: phy: google: Add Google SoC USB PHY

 .../bindings/phy/google,usb-phy.yaml          |  91 +++
 .../bindings/usb/google,snps-dwc3.yaml        | 144 +++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/google/Kconfig                    |  15 +
 drivers/phy/google/Makefile                   |   2 +
 drivers/phy/google/phy-google-usb.c           | 286 +++++++++
 drivers/usb/dwc3/Kconfig                      |   8 +
 drivers/usb/dwc3/Makefile                     |   1 +
 drivers/usb/dwc3/dwc3-google.c                | 597 ++++++++++++++++++
 10 files changed, 1146 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/google,snps-dwc3.yaml
 create mode 100644 drivers/phy/google/Kconfig
 create mode 100644 drivers/phy/google/Makefile
 create mode 100644 drivers/phy/google/phy-google-usb.c
 create mode 100644 drivers/usb/dwc3/dwc3-google.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.618.g983fd99d29-goog


