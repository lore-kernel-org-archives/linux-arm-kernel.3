Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47E1C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9nLm0vidytMMr81fZUNKWpJSt91qJ7feSxKBb+QQwU=; b=h/s/2l3QULgVggLSTLNKs/qKC3
	YYpfcEKeDlO8v8oc7dAFzuSAKqeIPB7FSYSkwWeKrce6aYGWXqsNzzG2xYZjWnYcCRYUkUN3WFkiG
	E1YuSlF9FIhaaic3xZUAOaxPlgbIQ92Fj5/3I6A6rqcj7VLj7nYdGK610eGRixjklUxEWKIwYBBuX
	S6/NzQR2o2yJ9zTIjEQLpT+4bjUI2r+9tOvdXVzQ383SB9FRrvxloWyyB09XRcsMYmPBYQEehjr9h
	Qb0o0FMJxQ9SutgPqg7maTuKcG1pWAFTAPSQidwcHbBBiSDHSKmloXCQIiCX4nu4P/L61FPWYcu/H
	PGdMJKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEJT-00000006QT1-2Zsc;
	Tue, 08 Jul 2025 19:49:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZDNc-00000006Hc2-0qZK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 18:49:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae3b37207easo876373766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752000562; x=1752605362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9nLm0vidytMMr81fZUNKWpJSt91qJ7feSxKBb+QQwU=;
        b=jRHYxeMe9njduNCbspNXAmfqeM/9Y375D9CngmkjzWcIQniJJIDOvmzhnPV3bTxe7Q
         6HYDCE7NVaYPMyfGsVi2tHoGWOmzCfsG9+BmSToMd49IgI9AwVoBmfWeBe5Lq0M3v/vg
         3zJAJp/HiLrtI5wJgnxYCwzLS3+ySn+UejJiHUxN8T1QUyfs11TC4t3Prd0ga0Lq3zko
         gs4ZqJ8FzKBuFycyzWWDNSGXjH7/FmOoGinzjHsk6MWCMVHEVQp8n77ZCV2NJkUAT1+9
         lq0Koa6ZUsNScCCFAHM9OYNtpSPR1XV1hI5MCBWjfuEDNYxBJ0FRuPxfk0S0ieC/z608
         V83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752000562; x=1752605362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9nLm0vidytMMr81fZUNKWpJSt91qJ7feSxKBb+QQwU=;
        b=m+o59oXUI0095I4+Xh3sYkg9ttVlvCXDNJQS57NY6Ls+s4RkjwMvqb6J8rpJTFSWzU
         7cQJFlMvtIMkimp4aPdfdpSUk4pSXL10ZHO/apbAJos9k+0RuDASqGLB0T1K7UVuRdUB
         CD2gO6mCEftPrcazfZx8/KMXMnu4tSs4mayr4glHtL1AwacHnSG2KKvQmIGevvX5omoM
         cvTDVXnd8z3M6uKD9SjLwJti271upnfz2H6uNRIq90+AZcKG5vu+8nISUQXTej8PVNuX
         iZyqdTyb5NCyyk/6ARkMz8idDesXRlkTVPNZL/9zasgCvjc/4574IeYpSA6EX0nMWZlo
         R9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW5HIi0qdUONxNiyMh+lDmMOyqQopUG9mFOSM7cV3jvO81p+7uSX9xKW5la7INToe+2tOflvAEx68+4d8nsUCJu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+kNU8L7jHPXKA6RJizpxlLx1DoasrBoZZjmvfSagriq7sxhx
	B4G5NSdMbC4L5mQrX+Q8GLiPKWTRmg3U0b+3ibNCpeE0yvEnBRwKQH03ZvcicF0+
X-Gm-Gg: ASbGnctfzE3p/BaON5qViDvN4tMws7gS062OaZN0fKQWpBt/gS7DKkRkyaThDx0s9DA
	s3IQno6if6Ge4MNCUjXSEHRZZzEkV8qfHfeB8wOkox6AciasQOa5hpvHSjkS3lQyGDAyZSuYbsw
	apC3Xe7++AZ2J1mC/bvON1bsX+mMzQ9/bUf3xGnCakxxgMnUoTKmwDtZXfkcDe5VauJ9rXDIhr8
	V3o6Xg8+PNFMthRvEhat5x85j9Lni3L+Cm4rV92aWFAOr0xceW24ygzx6iVkCtCaozs+qZWgJiI
	DT1pnx7AKOS9zc5TxnBjvQIbzVWMcCjvIzMRVMtH1l7wq3Sr/iy3f4AgPw+GLwEUR4nne+UqSI2
	8LTtIZaVn0WVtlb6URkjHjTPp/jn8N4Rp51KT95B7Zq7CmBGG4GKexVawbg==
X-Google-Smtp-Source: AGHT+IG6bp8JI+7JW0u0eEdI3poMAzICNHShV4QrQOLxp1wBQ7XAkN8Mdy5tEI+rjGUrK6LnnHJ+ug==
X-Received: by 2002:a17:906:9f8f:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-ae6c6b3062cmr36468966b.12.1752000561441;
        Tue, 08 Jul 2025 11:49:21 -0700 (PDT)
Received: from Lord-Beerus.tastitalia.local (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6baaaedsm944884666b.173.2025.07.08.11.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:49:21 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Tue,  8 Jul 2025 20:48:32 +0200
Message-ID: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_114924_245251_B4842FDE 
X-CRM114-Status: GOOD (  13.68  )
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
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   5 +
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 545 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 379 ++++++++++++
 3 files changed, 929 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
prerequisite-patch-id: 7e8493f8ed01ee319f827119ffdac7531afbbc4d
-- 
2.43.0


