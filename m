Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC82C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GwHv2aPcEWoD0loupYwRcf7PKkvnDo+yTNth+u2DuQc=; b=w8nPpOKs9Gzy5O
	ux+9kCiqYtBCTKUpXoY7fFzQaIP+VtsI6SWb1kafGJ759eTjCO1P+wQAzp64RhWipgq8PQ3XvM7hc
	HyhZun85SVs9ilVOggifrRID5lksK1906x7T00xGd928yAaieAxM769TPzlxFYITXQroAWuc2zlEI
	WNMnlPUdImcVZeFwgSGQErlHgScUSEmPxBuL59s7J2b6/rL/vwazU+prE7alu0UCPmT7LG95W6/ev
	kt6m7IK1lojValJviJ5k0Ed9e5phyNXjjJ1JToO5VjG3GUBIdFFG3fdKMeJdEhzeiw7QEzvbn+s8V
	jPb1G+4NkQ8rylOVZ+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXwJ-00000009viQ-3inT;
	Wed, 22 Jan 2025 10:26:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXv0-00000009vRh-3M6Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:25:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4363ae65100so73532565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737541505; x=1738146305; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GwHv2aPcEWoD0loupYwRcf7PKkvnDo+yTNth+u2DuQc=;
        b=ZwgtNup5OG3aBVuSlfe0iMRxB/5aIGyBjbPdk89prRACTVb7V6fF+XE9XLFDmOLPwP
         3PvjQJ6gShNJgY72caoMVxIIToZ8s+YzYZbOpXKVZG43Sy0576uTkxLEAG/jOK5TlN2y
         DIy0g8k+sCLdqD9W7hl3QN0F6HSJncUTJBnjNYNPc4Y54hOArz0JIhHa0EnlYcPS2EQC
         uJDhf+RxlZPJzt/ao4acspC3d62noBYBFO1Ue28aFIQmjRU4zlFqf2iH7UQoQvXnUqcM
         k/vC85cJ13KzOaKTK1WS4g8dpBOHrMqdAWFenggBhEtxhnASyu0xpHUibAMPG/jkdLCL
         1bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541505; x=1738146305;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwHv2aPcEWoD0loupYwRcf7PKkvnDo+yTNth+u2DuQc=;
        b=T6x5W91Kn0ODTzdl4o88xy7eQCl6nzqMYEPo+/Y6bxDZFCQeBmEn5DmtAQpQIegWO7
         3sC54MbborAOszazaWT6QegW681ASUzuxavtA1YdNXnx5nxwvsCWbLM5iKZYiM7fLWKF
         LE6piXj7o6PkK+E0ZbqBepE1N7QIpS2oMkVn47Kw1/o2h4MdTZZ48rSUkZTtBEGAhA0/
         FJ3vjpMzoaOQ7u05/iFz8yKMyExHr7iXxSbT7FYBzknSMdd9kJej4UK1CczQBEIMTaGB
         T9g67Ohxsj4Z/vEF/5BRJcoqiiQvKlvwgfzeH+f+4C3tR67f6LQOKwXsyVyqpQnAPVLg
         XpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX75RdeUyVLVmr3cPskbMQPldQxroL3m5Va72YXQQS9V9dS4UvOX996lFFpJ7dfQjI/7CUBlioRQqZ105jY6O8u@lists.infradead.org
X-Gm-Message-State: AOJu0Yy28w211Z+wDG4Pbxlf27qhiSVQPD17AXUIpqvO8hwRm4PGGfAO
	traGmLgORlnG8u/Gn3dA0bO0Lg15mHD4fXegXRbTOYLm4bK9wwnYnJCpUkBiQuA=
X-Gm-Gg: ASbGnctVV18Fx2x3SyyK825hdfmfVPtos4U/BwDYYBY49OxZJC7HnToLxJmNaeqc+rK
	qyfYboBE8bSNIFaclkUWBR7l66nJGKO9KEFf5rCwM28EhiFivasT9z0tn4ODG58bECz4R4TpV2i
	IeT3bVqWVBx4fzrKQnzFUfBTSCHkNw5roNYvtJvaFgpygJf7XDd5EPMdUsQ+q5Np1CAq0FM2psE
	12Wcxn3E+Ho2dMiUOtSb/2iaIo5z3WGMMDZwjqHRQiBiIholfnop4QRrX0ZJ8+H/fE=
X-Google-Smtp-Source: AGHT+IFpt/XXXccsHvEFoIG6ujz+wEELGcCf+5voltza935oFhduQAAvS+EeH/1myB8fiPdsB+lIPQ==
X-Received: by 2002:a05:600c:4e06:b0:434:fddf:5c0c with SMTP id 5b1f17b1804b1-438913c60e1mr196869015e9.4.1737541505222;
        Wed, 22 Jan 2025 02:25:05 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a934sm15536132f8f.42.2025.01.22.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:25:04 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/5] arm64: dts: ti: k3-am62a/p: Add ddr-pmctrl,
 canuart-wake
Date: Wed, 22 Jan 2025 11:24:31 +0100
Message-Id: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/HkGcC/x3MMQ6DMAwAwK8gz1hKAvXQr1QdUOxQD01QjBAI8
 XcixlvuBJOqYvDuTqiyqWnJDb7vIP6mPAsqN0Nw4eV88LiWRSNOfwrIK9phsWTcCP2AlFg4uYG
 YRmjBUiXp/uSf73XdhXy2d2wAAAA=
X-Change-ID: 20250121-topic-am62-dt-syscon-v6-13-6fdedf036d64
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=msp@baylibre.com;
 h=from:subject:message-id; bh=eLqqISzAEibN/RsSoa/Ahf79y4yOwqmAAtxfAfv+ph4=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHE++crjV/ZzSpBNu9+45S91fcfHphpfTs4WScv40B
 x+bYHePpaOUhUGMg0FWTJHl7oeF7+rkri+IWPfIEWYOKxPIEAYuTgGYiJEvw/+S59yzuHsky9NP
 a35r2OBiczEt+iZDsPvG96xeb7n+zWRkZFjvGh7Zubg5/+OunepJK84vdVvyZsbuTbc2hM2v/iW
 rX8wBAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022506_842936_1D01C8E4 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Hi,

Within the wkup-conf register range there are two register ranges that
are controlling specific other parts of the SoC. ddr-pmctrl is one
register that control the DDR power management. canuart-wake are
multiple registers that control the wakeup functionality of the CANUART
block.

The series first adds the dt-bindings to syscon and afterwards adds the
nodes to the wakeup domains of the am62a/p devicetrees.

First patch is a fixup I noticed missing.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (5):
      dt-bindings: mfd: syscon: Add ti,j784s4-acspcie-proxy-ctrl to second list
      dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
      dt-bindings: mfd: syscon: Add ti,am62-canuart-wake compatible
      arm64: dts: ti: k3-am62a-wakeup: Add ddr-pmctrl, canuart-wake
      arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add ddr-pmctrl, canuart-wake

 Documentation/devicetree/bindings/mfd/syscon.yaml        |  5 +++++
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi              | 10 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 10 ++++++++++
 3 files changed, 25 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20250121-topic-am62-dt-syscon-v6-13-6fdedf036d64

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


