Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11799C5AD2C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 10:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0pxYO8gQFiI2HEdK45sM4L+A370G/lMJ/6AjaRsjoY=; b=4QqS/FhNXHJ3BJmTXwRJsTsEU1
	H+oRqnfHH09pxVCCJuk80CWYTInofynCUXCsm1/8z+tBqVtaeFsR6YOlz/YOtQ9TN4Tr6JIIdw42c
	sD1hCYM6hnDh/iv72zKXaF1h1zo858BPGoyig6rFHiR3t6R8u7tPhFLPirVYhyQeMcxPxgzOpc1Bb
	fz0B3KAg4jc90OQuZ+yMU8SToMdTjCP6fclizZNXFkbp9YmX+IAEUY8IQ67fuvsGWZqtcrLIh5YZr
	wMmYKjX/75cKhWfQQn9CHRKUDvzh7v6/dGvZUToCq9KCVilIQ22OBjFF3zR7C+0NajpyE9O0auXUU
	dcyv7xpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wselA-00000009IHC-15Xr;
	Sat, 08 Aug 2026 10:58:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsel6-00000009IGp-0S41
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 10:58:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso299005f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 03:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786186709; x=1786791509; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B0pxYO8gQFiI2HEdK45sM4L+A370G/lMJ/6AjaRsjoY=;
        b=QzWEjnwxxN5cTEIXMm5NuGNErtfMXbQrp77c2z7l5VvCLpsM5WM9v04zKcZYQfRoSP
         AznNahq3nEBN3A/CuRuNmjrtYHB05/obykObql1P0Chi9RWTnBM1SPqtEJbUvKi9mN5P
         dHl9MjE26aaY4WXGJ32DmsdDcImoLKm9cKWQC3L+SRoeeABmi9BRS5yFDkS9NRWa6GGI
         dP5BMa++391kqgZQGNXulRqivLJsjTwo1RqOywpcSJHE7MENImBC3avLHkoLKqwjln6w
         YKw88xzMbs5V58sToJWYJlBOujm94lPnNRv4/S6UGr9Hq++gTQZ9rUb6ShN15KdLnXah
         DsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786186709; x=1786791509;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0pxYO8gQFiI2HEdK45sM4L+A370G/lMJ/6AjaRsjoY=;
        b=N76whO+wYnXy8fEJMV6N6vc4RexU2pA0u8bjWL6rsyHpT6XOeZNOeSvYeClu8mzt2C
         jfvLrNFbhAAOrh2038b/kTnyB2D8wRMlxoDiotCt71+9Vdm47RaQBtbA4k0YfJiAZDsW
         HFzAN9Ul2bDMpk6+dYi6tNYG4pYK3lG1NVlHn8fjlpVC2ZzPz+U+RdsZ2X+3W/KWOrJ+
         2egzalpvzqweIZr/mAvSIUqOZ3b2bbWmmjtQR+qHJDcUY759pAMS+nRHQgxrSMdwKoq5
         g2hycItJyLnx6fjfF6uffisbaCNwdKLZ13L4vqr9k4MkWSqnlAzztv4gQF3r+uof4j2K
         W2UQ==
X-Forwarded-Encrypted: i=1; AHgh+RorIIxCWgvX/8lm914u6BNsBjXjzBwbIpjE1eMtuxFPg/2Fsc/r0/z8qn6+FhNryydb70z8t4F1/iFt6MpSUb3M@lists.infradead.org
X-Gm-Message-State: AOJu0YzLD3q8SsI6v3Tl1J35zyhZxNtWpR+Vpe4bXcSmSwMBY8wjmaLM
	Jql+92+rXQ8QvcGKNBUUGEBAyWjAssRM+jPIg6dSsK34el6Tuh3wxwUWBYI0Q/HIEqc=
X-Gm-Gg: AR+sD12LSK9U3MC0pc2yNCC/htuJtX6a2jUDLHI1E0fZDtIiWVndwyBu9pgdEbvPy0q
	qGsY9SB4YwHvflZwv4hVl45lX6Kwp5FKVEI3XR5UFXNC1LJ99eXgoCK6kSkqhfUXoTgrzRY/5wl
	lC7k76iZlP1NwEFRGKrYWb274DEb1IQ5g2otBzrKN6jVwQHqe4kAKh+MKOrNQv8hhOWMzX6Mlha
	oKgiSyFE/2sWpYCA7EcN/HN8P7fwfPEeT9LaDwMVKpoc+PLuk3wW2GKP8dgYjpP7L/3mBby8tpr
	0+1G0TRk5vU3dclkgfbntcw9jR8cbWM9btGKCNfD4pyRTLcFgQ+6OBoRijZH8A4hiTXsys7QL0c
	qz3ASHetunPUoj1XVw4kxVwfUPG+32xo2+rZQPfzLSa6dYNBE1EKo3vjVekktJr5NxKxBVFqfBz
	nMED3wPWMA1eMcxr55gZfsVbqwj+6HePPmLR8wIuOqRGSS2HLugpt6J68dAiUijDitkd+4sDTvs
	pk=
X-Received: by 2002:a5d:4b52:0:b0:47f:ebe3:ca31 with SMTP id ffacd0b85a97d-481310e8ef2mr6693136f8f.28.1786186708859;
        Sat, 08 Aug 2026 03:58:28 -0700 (PDT)
Received: from white-mocha.local ([2a02:168:a773:a:eadb:61e4:c328:9421])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm13535902f8f.2.2026.08.08.03.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 03:58:28 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 02/12] ARM: dts: aspeed: anacapa: Add EVT1
 devicetree and point wrapper to it
From: Tan Siewert <tan.siewert@9elements.com>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, colin.huang2@amd.com
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-2-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-2-5d67e0efa6c5@gmail.com>
Date: Sat, 08 Aug 2026 12:58:12 +0200
Message-Id: <178618669276.50041.10651670181152112668.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786186707; l=34689;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=Y9TkkKEtfp8Olm61DMuAibQTNjvBLKVv5itWq/4yx9g=;
 b=+4UxNX14JsO2NWISZgY8BRtpiQRFlY+nQBqXQ6xDeNor6sNIR49pgY2RDynXuqF1moKbrsghg
 vFvb4WMcuQIBGF0NHD5hIX0ZXvvcQ87tJCkdEBAhELwwdA701rD/mz1
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_035833_158400_7BDCBC79 
X-CRM114-Status: GOOD (  12.75  )
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

Hi Colin,

> This change introduces a development-phase devicetree for the
> Facebook Anacapa BMC EVT1 hardware revision and updates the Anacapa
> wrapper DTS to reference it.


> 
> A dedicated EVT1 DTS is added for revision-specific hardware while
> keeping a single, Anacapa entrypoint used by the build and deployment
> flow. The top-level aspeed-bmc-facebook-anacapa.dts
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>




>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
> new file mode 100644
> index 000000000000..a095be48a3fe
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts

`scripts/dtc/dt-check-style --mode strict` reports multiple errors:

    aspeed-bmc-facebook-anacapa-evt1.dts:10: [property-order] property 'compatible' out of canonical order (should sort before 'model')
    aspeed-bmc-facebook-anacapa-evt1.dts:18: [property-order] property 'i2c16' out of canonical order (should sort before 'serial4')
    aspeed-bmc-facebook-anacapa-evt1.dts:71: [continuation-alignment] continuation should align to column 31 (under "<" or \")
    aspeed-bmc-facebook-anacapa-evt1.dts:72: [continuation-alignment] continuation should align to column 31 (under "<" or \")
    aspeed-bmc-facebook-anacapa-evt1.dts:80: [property-order] property 'gpios' out of canonical order (should sort before 'label')
    aspeed-bmc-facebook-anacapa-evt1.dts:86: [property-order] property 'default-state' out of canonical order (should sort before 'label')
    aspeed-bmc-facebook-anacapa-evt1.dts:93: [property-order] property 'reg' out of canonical order (should sort before 'device_type')
    aspeed-bmc-facebook-anacapa-evt1.dts:99: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:103: [property-order] property 'alignment' out of canonical order (should sort before 'size')
    aspeed-bmc-facebook-anacapa-evt1.dts:104: [property-order] property 'compatible' out of canonical order (should sort before 'alignment')
    aspeed-bmc-facebook-anacapa-evt1.dts:108: [child-name-order] child node 'framebuffer' out of name order
    aspeed-bmc-facebook-anacapa-evt1.dts:110: [property-order] property 'alignment' out of canonical order (should sort before 'size')
    aspeed-bmc-facebook-anacapa-evt1.dts:111: [property-order] property 'compatible' out of canonical order (should sort before 'alignment')
    aspeed-bmc-facebook-anacapa-evt1.dts:116: [child-name-order] child node 'regulator-p3v3-bmc-aux' out of name order
    aspeed-bmc-facebook-anacapa-evt1.dts:116: [unused-labels] label 'p3v3_bmc_aux' defined but never &-referenced
    aspeed-bmc-facebook-anacapa-evt1.dts:119: [property-order] property 'regulator-min-microvolt' out of canonical order (should sort before 'regulator-name')
    aspeed-bmc-facebook-anacapa-evt1.dts:120: [property-order] property 'regulator-max-microvolt' out of canonical order (should sort before 'regulator-min-microvolt')
    aspeed-bmc-facebook-anacapa-evt1.dts:121: [property-order] property 'regulator-always-on' out of canonical order (should sort before 'regulator-max-microvolt')
    aspeed-bmc-facebook-anacapa-evt1.dts:124: [unused-labels] label 'spi_gpio' defined but never &-referenced
    aspeed-bmc-facebook-anacapa-evt1.dts:129: [property-order] property 'sck-gpios' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:130: [property-order] property 'mosi-gpios' out of canonical order (should sort before 'sck-gpios')
    aspeed-bmc-facebook-anacapa-evt1.dts:131: [property-order] property 'miso-gpios' out of canonical order (should sort before 'mosi-gpios')
    aspeed-bmc-facebook-anacapa-evt1.dts:132: [property-order] property 'cs-gpios' out of canonical order (should sort before 'miso-gpios')
    aspeed-bmc-facebook-anacapa-evt1.dts:134: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:139: [property-order] property 'reg' out of canonical order (should sort before 'spi-max-frequency')
    aspeed-bmc-facebook-anacapa-evt1.dts:146: [property-order] property 'pinctrl-names' out of canonical order (should sort before 'aspeed,int-vref-microvolt')
    aspeed-bmc-facebook-anacapa-evt1.dts:147: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    aspeed-bmc-facebook-anacapa-evt1.dts:148: [continuation-alignment] continuation should align to column 21 (under "<" or \")
    aspeed-bmc-facebook-anacapa-evt1.dts:149: [continuation-alignment] continuation should align to column 21 (under "<" or \")
    aspeed-bmc-facebook-anacapa-evt1.dts:150: [continuation-alignment] continuation should align to column 21 (under "<" or \")
    aspeed-bmc-facebook-anacapa-evt1.dts:151: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:156: [property-order] property 'pinctrl-names' out of canonical order (should sort before 'aspeed,int-vref-microvolt')
    aspeed-bmc-facebook-anacapa-evt1.dts:157: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    aspeed-bmc-facebook-anacapa-evt1.dts:158: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:170: [property-order] property 'm25p,fast-read' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:171: [property-order] property 'label' out of canonical order (should sort before 'm25p,fast-read')
    aspeed-bmc-facebook-anacapa-evt1.dts:178: [property-order] property 'm25p,fast-read' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:179: [property-order] property 'label' out of canonical order (should sort before 'm25p,fast-read')
    aspeed-bmc-facebook-anacapa-evt1.dts:186: [property-order] property 'memory-region' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:314: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:321: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:326: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:331: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:354: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:361: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:366: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:371: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:388: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:395: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:400: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:405: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:410: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:415: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:420: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:425: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:453: [blank-lines] consecutive blank lines
    aspeed-bmc-facebook-anacapa-evt1.dts:453: [blank-lines] blank line at end of node body
    aspeed-bmc-facebook-anacapa-evt1.dts:465: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:482: [property-order] property '#gpio-cells' out of canonical order (should sort before 'gpio-controller')
    aspeed-bmc-facebook-anacapa-evt1.dts:487: [property-order] property 'gpio-line-names' out of canonical order (should sort before 'interrupts')
    aspeed-bmc-facebook-anacapa-evt1.dts:504: [property-order] property '#gpio-cells' out of canonical order (should sort before 'gpio-controller')
    aspeed-bmc-facebook-anacapa-evt1.dts:509: [property-order] property 'gpio-line-names' out of canonical order (should sort before 'interrupts')
    aspeed-bmc-facebook-anacapa-evt1.dts:527: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:536: [property-order] property '#gpio-cells' out of canonical order (should sort before 'gpio-controller')
    aspeed-bmc-facebook-anacapa-evt1.dts:541: [property-order] property 'gpio-line-names' out of canonical order (should sort before 'interrupts')
    aspeed-bmc-facebook-anacapa-evt1.dts:556: [property-order] property '#gpio-cells' out of canonical order (should sort before 'gpio-controller')
    aspeed-bmc-facebook-anacapa-evt1.dts:561: [property-order] property 'gpio-line-names' out of canonical order (should sort before 'interrupts')
    aspeed-bmc-facebook-anacapa-evt1.dts:578: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:583: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:617: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:624: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:629: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:634: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:639: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:644: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:653: [property-order] property '#gpio-cells' out of canonical order (should sort before 'gpio-controller')
    aspeed-bmc-facebook-anacapa-evt1.dts:672: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:677: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:694: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:701: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:706: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:711: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:716: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:721: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:730: [property-order] property '#gpio-cells' out of canonical order (should sort before 'gpio-controller')
    aspeed-bmc-facebook-anacapa-evt1.dts:749: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:754: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:776: [property-order] property 'i2c-mux-idle-disconnect' out of canonical order (should sort before '#size-cells')
    aspeed-bmc-facebook-anacapa-evt1.dts:783: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:788: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:793: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:804: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:815: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:820: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:825: [required-blank-lines] child node must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:837: [property-order] property 'enable-gpios' out of canonical order (should sort before 'interrupts')
    aspeed-bmc-facebook-anacapa-evt1.dts:854: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:859: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:868: [property-order] property 'pinctrl-names' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:869: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    aspeed-bmc-facebook-anacapa-evt1.dts:875: [property-order] property 'bus-frequency' out of canonical order (should sort before 'ngpios')
    aspeed-bmc-facebook-anacapa-evt1.dts:1020: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    aspeed-bmc-facebook-anacapa-evt1.dts:1021: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:1022: [property-order] property 'reg' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:1029: [property-order] property 'spi-rx-bus-width' out of canonical order (should sort before 'spi-tx-bus-width')
    aspeed-bmc-facebook-anacapa-evt1.dts:1030: [required-blank-lines] "status" must be preceded by a blank line
    aspeed-bmc-facebook-anacapa-evt1.dts:1062: [property-order] property 'pinctrl-names' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:1067: [property-order] property 'memory-region' out of canonical order (should sort before 'status')
    aspeed-bmc-facebook-anacapa-evt1.dts:1072: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    aspeed-bmc-facebook-anacapa-evt1.dts:1074: [property-order] property 'aspeed,external-signal' out of canonical order (should sort before 'aspeed,reset-type')
    aspeed-bmc-facebook-anacapa-evt1.dts:1075: [property-order] property 'aspeed,ext-push-pull' out of canonical order (should sort before 'aspeed,external-signal')
    aspeed-bmc-facebook-anacapa-evt1.dts:1076: [property-order] property 'aspeed,ext-active-high' out of canonical order (should sort before 'aspeed,ext-push-pull')
    aspeed-bmc-facebook-anacapa-evt1.dts:1078: [required-blank-lines] "status" must be preceded by a blank line

> @@ -0,0 +1,1079 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/dts-v1/;
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/ {
> +	model = "Facebook Anacapa BMC";
> +	compatible = "facebook,anacapa-bmc-evt1", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart1;
> +		serial1 = &uart2;
> +		serial2 = &uart3;
> +		serial3 = &uart4;
> +		serial4 = &uart5;
> +		i2c16 = &i2c0mux0ch0;
> +		i2c17 = &i2c0mux0ch1;
> +		i2c18 = &i2c0mux0ch2;
> +		i2c19 = &i2c0mux0ch3;
> +		i2c20 = &i2c1mux0ch0;
> +		i2c21 = &i2c1mux0ch1;
> +		i2c22 = &i2c1mux0ch2;
> +		i2c23 = &i2c1mux0ch3;
> +		i2c24 = &i2c4mux0ch0;
> +		i2c25 = &i2c4mux0ch1;
> +		i2c26 = &i2c4mux0ch2;
> +		i2c27 = &i2c4mux0ch3;
> +		i2c28 = &i2c4mux0ch4;
> +		i2c29 = &i2c4mux0ch5;
> +		i2c30 = &i2c4mux0ch6;
> +		i2c31 = &i2c4mux0ch7;
> +		i2c32 = &i2c8mux0ch0;
> +		i2c33 = &i2c8mux0ch1;
> +		i2c34 = &i2c8mux0ch2;
> +		i2c35 = &i2c8mux0ch3;
> +		i2c36 = &i2c10mux0ch0;
> +		i2c37 = &i2c10mux0ch1;
> +		i2c38 = &i2c10mux0ch2;
> +		i2c39 = &i2c10mux0ch3;
> +		i2c40 = &i2c10mux0ch4;
> +		i2c41 = &i2c10mux0ch5;
> +		i2c42 = &i2c10mux0ch6;
> +		i2c43 = &i2c10mux0ch7;
> +		i2c44 = &i2c11mux0ch0;
> +		i2c45 = &i2c11mux0ch1;
> +		i2c46 = &i2c11mux0ch2;
> +		i2c47 = &i2c11mux0ch3;
> +		i2c48 = &i2c11mux0ch4;
> +		i2c49 = &i2c11mux0ch5;
> +		i2c50 = &i2c11mux0ch6;
> +		i2c51 = &i2c11mux0ch7;
> +		i2c52 = &i2c13mux0ch0;
> +		i2c53 = &i2c13mux0ch1;
> +		i2c54 = &i2c13mux0ch2;
> +		i2c55 = &i2c13mux0ch3;
> +		i2c56 = &i2c13mux0ch4;
> +		i2c57 = &i2c13mux0ch5;
> +		i2c58 = &i2c13mux0ch6;
> +		i2c59 = &i2c13mux0ch7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial4:57600n8";
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +				  <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +				  <&adc1 2>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "bmc_heartbeat_amber";
> +			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led-1 {
> +			label = "fp_id_amber";
> +			default-state = "off";
> +			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x80000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: video {
> +			size = <0x02c00000>;
> +			alignment = <0x00100000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +	p3v3_bmc_aux: regulator-p3v3-bmc-aux {
> +		compatible = "regulator-fixed";
> +		regulator-name = "p3v3_bmc_aux";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	spi_gpio: spi {
> +		compatible = "spi-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +		num-chipselects = <1>;
> +		status = "okay";
> +
> +		tpm@0 {
> +			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +			spi-max-frequency = <33000000>;
> +			reg = <0>;
> +		};
> +	};
> +};

*snip*

> +// AMC
> +&i2c5 {
> +	status = "okay";
> +};
> +
> +// MB
> +&i2c6 {
> +	status = "okay";
> +
> +	// HPM FRU
> +	eeprom@50 {
> +		compatible = "atmel,24c256";
> +		reg = <0x50>;
> +	};
> +};
> +
> +// SCM
> +&i2c7 {
> +	status = "okay";
> +
> +

Unnecessary newlines.

> +};
> +
> +// MB - PDB
> +&i2c8 {
> +	status = "okay";
> +
> +	i2c-mux@72 {
> +		compatible = "nxp,pca9546";
> +		reg = <0x72>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c8mux0ch0: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			adc@1f {
> +				compatible = "ti,adc128d818";
> +				reg = <0x1f>;
> +				ti,mode = /bits/ 8 <1>;
> +			};
> +
> +			gpio@22 {
> +				compatible = "nxp,pca9555";
> +				reg = <0x22>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				interrupt-parent = <&sgpiom0>;
> +				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
> +
> +				gpio-line-names =
> +					"RPDB_FAN_FULL_SPEED_R_N", "RPDB_I2C_TEMP75_U8_ALERT_R_N",
> +					"RPDB_I2C_TMP432_U29_ALERT_R_N", "RPDB_GLOBAL_WP",
> +					"RPDB_FAN_CT_FAN_FAIL_R_N", "",
> +					"", "",
> +					"RPDB_ALERT_P50V_HSC2_R_N", "RPDB_ALERT_P50V_HSC3_R_N",
> +					"RPDB_ALERT_P50V_HSC4_R_N", "RPDB_ALERT_P50V_STBY_R_N",
> +					"RPDB_I2C_P12V_MB_VRM_ALERT_R_N",
> +					"RPDB_I2C_P12V_STBY_VRM_ALERT_R_N",
> +					"RPDB_PGD_P3V3_STBY_PWRGD_R",
> +					"RPDB_P12V_STBY_VRM_PWRGD_BUF_R";
> +			};
> +
> +			gpio@24 {
> +				compatible = "nxp,pca9555";
> +				reg = <0x24>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				interrupt-parent = <&sgpiom0>;
> +				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
> +
> +				gpio-line-names =
> +					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
> +					"RPDB_PWRGD_P50V_HSC4_SYS_R",
> +					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
> +					"RPDB_P50V_FAN1_R2_PG", "RPDB_P50V_FAN2_R2_PG",
> +					"RPDB_P50V_FAN3_R2_PG", "RPDB_P50V_FAN4_R2_PG",
> +					"", "RPDB_FAN1_PRSNT_N_R",
> +					"", "RPDB_FAN2_PRSNT_N_R",
> +					"RPDB_FAN3_PRSNT_N_R", "RPDB_FAN4_PRSNT_N_R",
> +					"", "";
> +			};
> +
> +			// R-PDB FRU
> +			eeprom@50 {
> +				compatible = "atmel,24c128";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c8mux0ch1: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			gpio@22 {
> +				compatible = "nxp,pca9555";
> +				reg = <0x22>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				interrupt-parent = <&sgpiom0>;
> +				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
> +
> +				gpio-line-names =
> +					"LPDB_FAN_FULL_SPEED_R_N","LPDB_I2C_TEMP75_U8_ALERT_R_N",
> +					"LPDB_I2C_TMP432_U29_ALERT_R_N","LPDB_GLOBAL_WP",
> +					"LPDB_FAN_CT_FAN_FAIL_R_N","",
> +					"","",
> +					"LPDB_ALERT_P50V_HSC0_R_N","LPDB_ALERT_P50V_HSC1_R_N",
> +					"LPDB_ALERT_P50V_HSC5_R_N","LPDB_I2C_P12V_SW_VRM_ALERT_R_N",
> +					"LPDB_EAM0_PRSNT_MOS_N_R","LPDB_EAM1_PRSNT_MOS_N_R",
> +					"LPDB_PWRGD_P50V_HSC5_SYS_R","";
> +			};
> +
> +			gpio@24 {
> +				compatible = "nxp,pca9555";
> +				reg = <0x24>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				interrupt-parent = <&sgpiom0>;
> +				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
> +
> +				gpio-line-names =
> +					"LPDB_P50V_FAN1_R2_PG","LPDB_P50V_FAN2_R2_PG",
> +					"LPDB_P50V_FAN3_R2_PG","LPDB_P50V_FAN4_R2_PG",
> +					"LPDB_P50V_FAN5_R2_PG","LPDB_FAN1_PRSNT_N_R",
> +					"LPDB_FAN2_PRSNT_N_R","LPDB_FAN3_PRSNT_N_R",
> +					"LPDB_FAN4_PRSNT_N_R","LPDB_FAN5_PRSNT_N_R",
> +					"","",
> +					"","",
> +					"","";
> +			};
> +
> +			// L-PDB FRU
> +			eeprom@50 {
> +				compatible = "atmel,24c128";
> +				reg = <0x50>;
> +			};
> +		};
> +		i2c8mux0ch2: i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c8mux0ch3: i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +// SCM
> +&i2c9 {
> +	status = "okay";
> +
> +	// SCM FRU
> +	eeprom@50 {
> +		compatible = "atmel,24c128";
> +		reg = <0x50>;
> +	};
> +
> +	// BSM FRU
> +	eeprom@56 {
> +		compatible = "atmel,24c64";
> +		reg = <0x56>;
> +	};
> +};
> +
> +// R Bridge Board
> +&i2c10 {
> +	status = "okay";
> +
> +	i2c-mux@71 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x71>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c10mux0ch0: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c10mux0ch1: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c10mux0ch2: i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c10mux0ch3: i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c10mux0ch4: i2c@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c10mux0ch5: i2c@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			gpio@22 {
> +				compatible = "nxp,pca9555";
> +				reg = <0x22>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				gpio-line-names =
> +					"","",
> +					"","RBB_CPLD_REFRESH_IN_PRGRS_R_L",
> +					"RBB_EAM0_NIC_CBL_PRSNT_R_L","RBB_EAM1_NIC_CBL_PRSNT_R_L",
> +					"RBB_AINIC_JTAG_MUX_R2_SEL","RBB_SPI_MUX0_R2_SEL",
> +					"RBB_AINIC_PRSNT_R_L","RBB_AINIC_OE_R_N",
> +					"RBB_AINIC_BOARD_R2_ID","RBB_RST_USB2_HUB_R_N",
> +					"RBB_RST_FT4222_R_N","RBB_RST_MCP2210_R_N",
> +					"","";
> +			};
> +
> +			// R Bridge Board FRU
> +			eeprom@52 {
> +				compatible = "atmel,24c256";
> +				reg = <0x52>;
> +			};
> +		};
> +		i2c10mux0ch6: i2c@6 {
> +			reg = <6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c10mux0ch7: i2c@7 {
> +			reg = <7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +// L Bridge Board
> +&i2c11 {
> +	status = "okay";
> +
> +	i2c-mux@71 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x71>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c11mux0ch0: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c11mux0ch1: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c11mux0ch2: i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c11mux0ch3: i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c11mux0ch4: i2c@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c11mux0ch5: i2c@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			gpio@22 {
> +				compatible = "nxp,pca9555";
> +				reg = <0x22>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +
> +				gpio-line-names =
> +					"","",
> +					"","LBB_CPLD_REFRESH_IN_PRGRS_R_L",
> +					"LBB_EAM0_NIC_CBL_PRSNT_R_L","LBB_EAM1_NIC_CBL_PRSNT_R_L",
> +					"LBB_AINIC_JTAG_MUX_R2_SEL","LBB_SPI_MUX0_R2_SEL",
> +					"LBB_AINIC_PRSNT_R_L","LBB_AINIC_OE_R_N",
> +					"LBB_AINIC_BOARD_R2_ID","LBB_RST_USB2_HUB_R_N",
> +					"LBB_RST_FT4222_R_N","LBB_RST_MCP2210_R_N",
> +					"","";
> +			};
> +
> +			// L Bridge Board FRU
> +			eeprom@52 {
> +				compatible = "atmel,24c256";
> +				reg = <0x52>;
> +			};
> +		};
> +		i2c11mux0ch6: i2c@6 {
> +			reg = <6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c11mux0ch7: i2c@7 {
> +			reg = <7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +	};
> +};
> +
> +// Debug Card
> +&i2c12 {
> +	status = "okay";
> +};
> +
> +// MB
> +&i2c13 {
> +	status = "okay";
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		reg = <0x70>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-mux-idle-disconnect;
> +
> +		i2c13mux0ch0: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c13mux0ch1: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c13mux0ch2: i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c13mux0ch3: i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			adc@1f {
> +				compatible = "ti,adc128d818";
> +				reg = <0x1f>;
> +				ti,mode = /bits/ 8 <1>;
> +			};
> +		};
> +		i2c13mux0ch4: i2c@4 {
> +			reg = <4>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			// HPM BRD ID FRU
> +			eeprom@51 {
> +				compatible = "atmel,24c256";
> +				reg = <0x51>;
> +			};
> +		};
> +		i2c13mux0ch5: i2c@5 {
> +			reg = <5>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c13mux0ch6: i2c@6 {
> +			reg = <6>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +		i2c13mux0ch7: i2c@7 {
> +			reg = <7>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			nfc@28 {
> +				compatible = "nxp,nxp-nci-i2c";
> +				reg = <0x28>;
> +
> +				interrupt-parent = <&sgpiom0>;
> +				interrupts = <156 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				enable-gpios = <&sgpiom0 241 GPIO_ACTIVE_HIGH>;
> +			};
> +		};
> +	};
> +};
> +
> +// SCM
> +&i2c14 {
> +	status = "okay";
> +};
> +
> +&i2c15 {
> +	status = "okay";
> +};
> +
> +&kcs2 {
> +	aspeed,lpc-io-reg = <0xca8>;
> +	status = "okay";
> +};
> +
> +&kcs3 {
> +	aspeed,lpc-io-reg = <0xca2>;
> +	status = "okay";
> +};
> +
> +&lpc_ctrl {
> +	status = "okay";
> +};
> +
> +&mac2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ncsi3_default>;
> +	use-ncsi;
> +};
> +
> +&sgpiom0 {
> +	ngpios = <128>;
> +	bus-frequency = <2000000>;
> +	gpio-line-names =
> +	/*in - out - in - out */
> +	/* A0-A7 line 0-15 */
> +	"", "FM_CPU0_SYS_RESET_N", "", "CPU0_KBRST_N",
> +	"", "FM_CPU0_PROCHOT_trigger_N", "", "FM_CLR_CMOS_R_P0",
> +	"", "Force_I3C_SEL", "", "SYSTEM_Force_Run_AC_Cycle",
> +	"", "", "", "",
> +
> +	/* B0-B7 line 16-31 */
> +	"Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
> +	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
> +	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
> +	"Channel3_leakage", "FM_CPU0_NMI_SYNC_FLOOD_N",
> +	"Channel4_leakage_Manifold2", "",
> +	"Channel5_leakage_EAM1", "",
> +	"Channel6_leakage_CPU_DIMM", "",
> +	"Channel7_leakage_EAM2", "",
> +
> +	/* C0-C7 line 32-47 */
> +	"RSVD_RMC_GPIO3", "", "", "",
> +	"", "", "", "",
> +	"LEAK_DETECT_RMC_N", "JTAG_CPLD_TRST_R_N", "", "",
> +	"", "", "", "",
> +
> +	/* D0-D7 line 48-63 */
> +	"PWRGD_PDB_EAMHSC0_CPLD_PG_R", "",
> +	"PWRGD_PDB_EAMHSC1_CPLD_PG_R", "",
> +	"PWRGD_PDB_EAMHSC2_CPLD_PG_R", "",
> +	"PWRGD_PDB_EAMHSC3_CPLD_PG_R", "",
> +	"AMC_BRD_PRSNT_CPLD_L", "", "", "",
> +	"", "", "", "",
> +
> +	/* E0-E7 line 64-79 */
> +	"AMC_PDB_EAMHSC0_CPLD_EN_R", "",
> +	"AMC_PDB_EAMHSC1_CPLD_EN_R", "",
> +	"AMC_PDB_EAMHSC2_CPLD_EN_R", "",
> +	"AMC_PDB_EAMHSC3_CPLD_EN_R", "",
> +	"", "", "", "",
> +	"", "", "", "",
> +
> +	/* F0-F7 line 80-95 */
> +	"PWRGD_PVDDCR_CPU1_P0", "SGPIO_READY",
> +	"PWRGD_PVDDCR_CPU0_P0", "",
> +	"", "", "", "",
> +	"", "", "", "",
> +
> +	/* G0-G7 line 96-111 */
> +	"L_PRSNT_EDSFF0_N", "",
> +	"L_PRSNT_EDSFF1_N", "",
> +	"R_PRSNT_EDSFF2_N", "",
> +	"R_PRSNT_EDSFF3_N", "",
> +	"HPM_EDSFF_PG", "",
> +	"PWRGD_CHEH_CPU0_FPGA", "",
> +	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
> +	"", "",
> +
> +	/* H0-H7 line 112-127 */
> +	"PWRGD_P3V3", "",
> +	"P12V_DDR_IP_PWRGD_R", "",
> +	"P12V_DDR_AH_PWRGD_R", "",
> +	"PWRGD_P12V_VRM1_CPLD_PG_R", "",
> +	"PWRGD_P12V_VRM0_CPLD_PG_R", "",
> +	"PWRGD_PDB_HSC4_CPLD_PG_R", "",
> +	"PWRGD_PVDD18_S5_P0_PG", "",
> +	"PWRGD_PVDD33_S5_P0_PG", "",
> +
> +	/* I0-I7 line 128-143 */
> +	"EAM0_BRD_PRSNT_R_L", "",
> +	"EAM1_BRD_PRSNT_R_L", "",
> +	"EAM2_BRD_PRSNT_R_L", "",
> +	"EAM3_BRD_PRSNT_R_L", "",
> +	"EAM0_CPU_MOD_PWR_GD_R", "",
> +	"EAM1_CPU_MOD_PWR_GD_R", "",
> +	"PRSNT_EDSFF_BOOT_N", "",
> +	"EAM3_CPU_MOD_PWR_GD_R", "",
> +
> +	/* J0-J7 line 144-159 */
> +	"PRSNT_L_BIRDGE_R", "",
> +	"PRSNT_R_BIRDGE_R", "",
> +	"BRIDGE_L_MAIN_PG_R", "",
> +	"BRIDGE_R_MAIN_PG_R", "",
> +	"BRIDGE_L_STBY_PG_R", "",
> +	"BRIDGE_R_STBY_PG_R", "",
> +	"", "", "", "",
> +
> +	/* K0-K7 line 160-175 */
> +	"ADC_I2C_ALERT_N", "",
> +	"TEMP_I2C_ALERT_R_L", "",
> +	"CPU0_VR_SMB_ALERT_CPLD_N", "",
> +	"COVER_INTRUDER_R_N", "",
> +	"HANDLE_INTRUDER_CPLD_N", "",
> +	"IRQ_MCIO_CPLD_WAKE_R_N", "",
> +	"APML_CPU0_ALERT_R_N", "",
> +	"PDB_ALERT_R_N", "",
> +
> +	/* L0-L7 line 176-191 */
> +	"L_EDSFF0_PG", "", "L_EDSFF1_PG", "",
> +	"R_EDSFF2_PG", "", "R_EDSFF3_PG", "",
> +	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
> +	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
> +
> +	/* M0-M7 line 192-207 */
> +	"EAM0_SMERR_CPLD_R_L", "",
> +	"EAM1_SMERR_CPLD_R_L", "",
> +	"EAM2_SMERR_CPLD_R_L", "",
> +	"EAM3_SMERR_CPLD_R_L", "",
> +	"CPU0_SMERR_N_R", "",
> +	"CPU0_NV_SAVE_N_R", "",
> +	"PDB_PWR_LOSS_CPLD_N", "",
> +	"IRQ_BMC_SMI_ACTIVE_R_N", "",
> +
> +	/* N0-N7 line 208-223 */
> +	"AMCROT_BMC_S5_RDY_R", "",
> +	"AMC_RDY_R", "",
> +	"AMC_STBY_PGOOD_R", "",
> +	"CPU_AMC_SLP_S5_R_L", "",
> +	"AMC_CPU_EAMPG_R", "",
> +	"", "", "", "",
> +
> +	/* O0-O7 line 224-239 */
> +	"HPM_PWR_FAIL", "Port80_b0",
> +	"FM_DIMM_IP_FAIL", "Port80_b1",
> +	"FM_DIMM_AH_FAIL", "Port80_b2",
> +	"AMC_THERMTRIP_ASSERT", "Port80_b3",
> +	"CPU_THERMTRIP_ASSERT", "Port80_b4",
> +	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
> +	"CPLD_SGPIO_RDY", "Port80_b6",
> +	"", "Port80_b7",
> +
> +	/* P0-P7 line 240-255 */
> +	"CPU0_SLP_S5_N_R", "NFC_VEN",
> +	"CPU0_SLP_S3_N_R", "",
> +	"FM_CPU0_PWRGD", "",
> +	"PWRGD_RMC", "",
> +	"FM_RST_CPU0_RESET_N", "",
> +	"FM_PWRGD_CPU0_PWROK", "",
> +	"wS5_PWR_Ready", "",
> +	"wS0_ON_N", "PWRGD_P1V0_AUX";
> +	status = "okay";
> +};
> +
> +// BIOS Flash
> +&spi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi2_default>;
> +	status = "okay";
> +	reg = <0x1e631000 0xc4>, <0x50000000 0x8000000>;

Why do you overwrite the SPI2 memory size to 128MB only?
Even if you use the other part for the TPM, you should not overwrite the memory
region...

> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		label = "pnor";
> +		spi-max-frequency = <12000000>;
> +		spi-tx-bus-width = <2>;
> +		spi-rx-bus-width = <2>;
> +		status = "okay";
> +	};
> +};
> +
> +// HOST BIOS Debug
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +// BMC Debug Console
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&uart_routing {
> +	status = "okay";
> +};
> +
> +&uhci {
> +	status = "okay";
> +};
> +
> +&vhub {
> +	status = "okay";
> +	pinctrl-names = "default";

aspeed-g6.dtsi sets pinctrl-names to default already. Unnecessary...

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

