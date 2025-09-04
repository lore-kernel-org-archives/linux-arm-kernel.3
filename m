Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6754CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JL/p+y59YOttTU+SYXHVuBaRBr/sjf2d5XYpAYF+/sg=; b=jW/X9+KAH2evCWzaQoxUu9x5zx
	QGnYHBvxtTNUAOgaehDPrIx6CCpn5UTMLQzWDS6rt0So0ot7vri2KFDeq3VppK/n5AgWz/4rRIkNw
	xGv5NWIhGH/nhxsi8uKmrZ4nUTCFM7OWXvus0F6QNWqZsg20wbg2dPzf9mfPQ/vU7lu6MZFwPQ5Bu
	Ta7ydGGEFzOYuKc/wh9jeDIOIwM5MJuSMy1dW7sWOLoJDOjtc/K7hVXbFAMhqxEs6BOcEdlGFsrES
	P9XfptQMz06ITptncqoQEy02U70LklRyUVY+HqoIIZZwWdGWtzLaxbyfGt9SaYTlDBkwlVWGp+ir9
	0N+FwyTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCno-0000000CuOw-04wm;
	Thu, 04 Sep 2025 16:27:12 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9vY-0000000BrBl-2dvx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:23:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-61cebce2f78so2042188a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756992179; x=1757596979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JL/p+y59YOttTU+SYXHVuBaRBr/sjf2d5XYpAYF+/sg=;
        b=UfT2yRvjeO7R2mg8oXnyZot0H9cu1CslfWBsKKCfYdRhuvbx7iPagHDCh4h9WcDbWk
         af3+lZjHCodxioY1gTA6BmzoQ+/W+BYTmoDJbdn9rvJ/4LDjg9YZ1OVwoN5W/lIk9qf2
         8HUnLOYqhPufm7XWtHMR6LftkZOCxaJxsXKuE7nWVB4bw0hkzTJXfiX8o29lO2BAX72p
         9+5wPkqjdQAVK55/8CLEjj9SmvFQJYQPEmQPMsZrTlme1jydEj4z1qEBrADHEf2Y8OvV
         qhtMa7CTT2imgTIDraFCogBvXuPBKbIlQU/klRYOO3EYpKzPaVArlQifrWKRAxByhweH
         SKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992179; x=1757596979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JL/p+y59YOttTU+SYXHVuBaRBr/sjf2d5XYpAYF+/sg=;
        b=Ot089Sv1OESwVaJwf9cfLKsDYMNtgBsgL84Aw3Tjl+OQMtfbTRdQlWIAyUWwCBDPkR
         iwXht4DqL/TMZCdEIiOcweFFbANa1ssWGdzo3L76gAJNrr2yFhWM9SDd8R+IUfB/WpAn
         bZoYNdp6ELw+sTxY/mLoEspKRdQC9qsGISpCGW9UNeAOS5l9Tqnnlb7VBcPEnOTJlqcJ
         ijxL9SME8n6OO9OVzrVmd+VVWqpdH/vw4DEeE6Ez5fttQYcneKvQ5SbXj0LUbMprnucF
         rU79Lv5r30tiEqbLGs5nIfQSoOoSZJ3HR8+MDt14LftJcrab+sbkYK9GlznaKaTwHZZT
         XmTA==
X-Forwarded-Encrypted: i=1; AJvYcCW169VmEyTa342IioXV4L5yTI1TcLIKMukINJqQphKsZPW3mC2WvVX+/4l6Fqlqn57fRsYw6Se/0lVZ9CG1Unex@lists.infradead.org
X-Gm-Message-State: AOJu0YytbVsLMFlbK8+gD75XmlonWhInLJPrNQ2sPqGaUG2y93jPPn6X
	WXSAZboUjxaZvPxJeF6+tU+G58WYuqN/zel17p1vpZrKrr8ngumENZ6c
X-Gm-Gg: ASbGncuYx1+mPCIYs5sR3A65dmOS4PBTLxkA00wiZXwfBKRMsycFkHo8+4kE0208yJP
	KvXi9EFKhZV0/aig9sxhIAnqnA57BojSgGQ5V+k20AaU7jsS1dShVVp+L0kho8rk8VKl5aHX0PS
	pzC6kr3zszFtM6dran+QjhyJudmkrz9NVykGJokj+lRij84VUvVcpvvHiVQrLxLzc62zVRC/+ec
	wDfgPLVQMKYNfOPUCOcN3fTa1jgXoqCYLYafj3ioL1+/pFMPpC/ygcs2PnzgKYpubqSOxu5GO+1
	z/eRERmRkvG2Dm+3o7J2HM74vye7azbM3pLSjmqdTOrM4FvVaJ2hBO9lTY1fkwCjVQRwdrmzF0q
	dvs5yRiPLFMRQVs1uOAWRkm1+0Y57b+4a+i+b47oC1fi39IhrZEaP0chY6oBBm56JA2atCMk0R6
	VfTM4cl/F2unO9eUq3
X-Google-Smtp-Source: AGHT+IEf9Sjz4QRUX/zyMVbMO4cyCoq+6iO0CcgNuyalc7VAtoMVCq7+gNaZykhi7k3Jogv9bTV3sQ==
X-Received: by 2002:a17:907:9409:b0:b04:74d1:a575 with SMTP id a640c23a62f3a-b0474d1b166mr491622366b.62.1756992178469;
        Thu, 04 Sep 2025 06:22:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046d0b0135sm372121966b.73.2025.09.04.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:22:58 -0700 (PDT)
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
Subject: [PATCH v6 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Thu,  4 Sep 2025 15:22:27 +0200
Message-ID: <20250904132240.36819-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062300_665723_F09530D8 
X-CRM114-Status: GOOD (  13.66  )
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
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 385 ++++++++++++++
 4 files changed, 892 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
-- 
2.43.0


