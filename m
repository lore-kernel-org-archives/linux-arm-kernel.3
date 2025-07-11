Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4310EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WE+IOp0gz3myzml1robE7AcvN3W7ZGy4gHZpbzrQ97I=; b=aOixVC/jihBayFm9VmZY22Sj+8
	Yo/qyqTtO6deWB67vUFt2lZ/NEqV6HJ6INug2P/duTjVY62/umwfJQYH5qOC8VuhbP5ml/z2vqYQp
	OW9OsS6eJsu9NZXpdHJYvgqJ8k4MPg/q3B8ki6xg+d2EHn2annyx+VJvx2K1ouUC5BIesuWnGF2pL
	QdlKNotw/kZGqtuFBRsJDw0tfCeQpV+Bv9KaF0UU+d97UcGdb/UNVb29PEW9dPDmdBHUsrk5L0iQ0
	4CEv60tAZ88+n+X7qu3T7VMf5xes1pWh0lFnTkvz6Lt6UeILQT5+YdGT/mLDjjmNm5eSu+EQJsvHv
	/01K9uDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaESj-0000000EzsD-0R6q;
	Fri, 11 Jul 2025 14:10:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaENo-0000000Ez9M-3lRp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:05:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-acb5ec407b1so383703266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752242747; x=1752847547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WE+IOp0gz3myzml1robE7AcvN3W7ZGy4gHZpbzrQ97I=;
        b=PLutObxNaMM73WDzKeZcjUx3bDAI5y4AN4NbHOazZe9tqRR/z4KBJnsYy3WfL7VEC2
         a8FYvDS9oAbgoa7FBsK+KaW/iw+Wg7yFj6D0tnzTudIsxMOua5hCxgCtZJMVWNYNe1vW
         grThL+NcvwifahFXUnataU45w1zZYd29yOzMaXbjW6hJV+/4KEDWhC/vJSS8R4rLjZP8
         VPEabvwVPrXZ4vIMD+kVoWXNjKo8boxC0TmhVe1X5dLGVevSjXrdl8rQ2qFEdFq/Jzy7
         xxgD7v2jpJ2RErJwcyGKOp8q+JZ2Bb/xGCwzpvcjz/35svQEhjELyYklGR1f2rIS6bSb
         9J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242747; x=1752847547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WE+IOp0gz3myzml1robE7AcvN3W7ZGy4gHZpbzrQ97I=;
        b=EVlp7tasj2ZZ0GEmoI00sz/jhzI/iorlmwbf7QbGrk2GfETSSKByF4hIFGWu+CHfNq
         c0O5coP8OPNCCosM+bHUD9P0LaRvOsxvHb4WCt2QKgE/31+hL379IcTmhCUq+6eDo50r
         ZbfByEIkt8m6DQ6+8JHfIktqyrg4ljUPCPNp/bLXmwFjOzehzIDqVRXfcdo4Od+Q7gKB
         SVAKINRuCsERlLTZSKOlL9/xiotDL0lGsPGYqsunkf0Fl9l5FdVxYlzS7hINr/14nf3Q
         uEuj1/uHPmv+Ll5KqTqAA2Z8Im8BH/+9KMkZPQi6PEPz4TbqP442B4HPN+MV+QkKQvbj
         qwUw==
X-Forwarded-Encrypted: i=1; AJvYcCUlcxgBtugHrV4eEaNxZ3ipThTQdhpMwjXLJkjOCCmnvaJ65q98GntnHsDuYPnFPrq7Nx3Uz1pTj5H2E1Gfvwp5@lists.infradead.org
X-Gm-Message-State: AOJu0YyKHU5c+lTILSENjHi9os4vW0KxFyCt44ZIEGW/X25cg2rTsim1
	48e/XQb7F0qykVu/VicT0tDRqyvC0pJm+Z+z90tO5btwI/AQp4iBkQYl
X-Gm-Gg: ASbGncvs2VWe7G0xdEaxl5I72moow9LINTiIm3ywZj+cGncGemPrFujHxl+3gGaBZCL
	x8Z0TGnXbrou2FK7N3zESrLbU7s1NtTiDfl3iynKJe0qsJD2L0373XDtMe5qpmA0nTBMFen5Mbf
	udrVNj+kS1ALXRnxufB98MmGROmMMpn+pP9UHTLvtzWCcUoTCE6KJ4kckE/B+i9cNmzDncA1FVU
	3Xl8X5i73a7PEchqfsA5OmStf2Ql74WECcs8+yzJZlFJE4tsTWp8x9uTLzSCiBVsLBMuWV27tJ7
	WjHRxTzHVZ16lhODBTz0rICGCH6n9dMRhlu9Gu9bDsXhm7SMIQK/spXHxCxuDbfg9d7nvAxNtoY
	IRkwYNW8q0OF713OS6kr3xSI6bm4ZUNfhbUCk/R021kPxnheVJd8Q/QyPz9QJ6BZrMPF473j7XG
	D5Da5+Ig==
X-Google-Smtp-Source: AGHT+IFAK2oK6DeRRLbqXQFKOkQdLjirZ1hHerSgv3MN1KO3ZnnEdCiHyEsNz5O5pHHIDXGQX5buSw==
X-Received: by 2002:a17:907:1c1f:b0:ae3:75e5:ff7a with SMTP id a640c23a62f3a-ae6fbc8a3dbmr382722466b.19.1752242746462;
        Fri, 11 Jul 2025 07:05:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294bd9sm303435166b.132.2025.07.11.07.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:05:46 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Fri, 11 Jul 2025 16:04:55 +0200
Message-ID: <20250711140507.17574-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_070548_931742_00ACF48A 
X-CRM114-Status: GOOD (  13.45  )
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

This patch series adds support for the Variscite VAR-SOM-AM62P system on module
and the Symphony carrier board.

The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
peripheral interfaces. The Symphony board is a feature-rich carrier board that
showcases the SOM capabilities.

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern where the
SOM dtsi contains only peripherals mounted on the module, while carrier-specific
interfaces are enabled in the board dts.

Tested on VAR-SOM-AM62P with Symphony carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
  arm64: dts: ti: var-som-am62p: Add support for Variscite Symphony
    Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 500 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 408 ++++++++++++++
 4 files changed, 915 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
prerequisite-patch-id: 7e8493f8ed01ee319f827119ffdac7531afbbc4d
-- 
2.43.0


