Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D6DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sRu2JDPnd+KPGNqW7sFeAghfeumOeGPFi0g23iNWPro=; b=VQMYMT8T2ep+aRCoX8cRsIm7k9
	MlPhx028f7HYE1HkwfrztMdsuImK/ehllCCyMb8lpesgFLH9KTh3BPZtk9KeuQHlTZx8oUGdnLmiq
	gBsjc3lqDaIB5Gwu9lQFv8T38DQAjwD+3/6Zz3I5SfgitAgBuQhlztpkHMvKOGxKiV8HrYdthpt/S
	K1AJlSs8V7xBeI28qGLOQsogj2AKyrENKTeBxZeP16u/2vmeFUe/HpKamjYh8cth1k+cqjmLhsNUe
	b5jisZrdu0fOpGeiX81Tl2pbIEKji9xnVloQj6X0+j7jpni/Ap8IAfv9mxidHjka2YCAO/rI/LjD6
	TVBmLNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZfD-00000000Qeu-2mYn;
	Wed, 08 Jul 2026 21:18:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZfB-00000000Qdh-2tQJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:18:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493c486f012so4999115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783545515; x=1784150315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRu2JDPnd+KPGNqW7sFeAghfeumOeGPFi0g23iNWPro=;
        b=MwqlZBKyIrDeQ3dIcoRt3NibVyI51wGo8uHEUceYI0D/bLOdCk4stH7FlLG3MnUrNF
         Ive53XVm817stZIT7h3GANWcfJAMOvz+H6N/wb/w0Jhm+aKovznTmwwiBFKo8MupyhuT
         poLV7jqRpZcYIalOU0Tw3pWRRPS333CU+9dXY6rALQQzyoKJ/mK4xfgfGQhwGdd/qSaR
         CB9iZ1w5brVsWyfShqU2ELPX16W0X8pN50bfo6hJ5pilrQW7WFM76hcR4UEdsBGWbYP3
         fGFFyYzRfQX2ItgsN/iZApKE6NKF/HXsDVnLkV9npgHq+ZWMGUL3A0zVvmLK+F9OmRed
         FvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783545515; x=1784150315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRu2JDPnd+KPGNqW7sFeAghfeumOeGPFi0g23iNWPro=;
        b=L3zpqO8PT3qRn8d0EJEFqO0sA1KQTB3uE9+iWvIfNZjME2a3IB46wq5ppWI2Fyu486
         f8iIdvTEgoBNvt1YgAjYHGPUqwHuBlPbi0xG6+ISVJNEucJ/HsbZGfcO1Uk0RdQLKedT
         03jAxvNhREc0VR4m4ZA7pufxqqbI7gV08Ms0CegKn0d3qHd31kqvF0MeFO0SDqsnxvdT
         K6CW13QvHCAABNLN6tx1l8+f6xDpJb/Sab6YvGL1lt9r5gLDwa2rq/fUb0Z9h6FIy+EM
         +ruTbJ5ZCTX2xvnOJjrZb6mje6Q2XivrVXe23B5MzbKObgW3RbpdFz6BDVFKRMOpCCRh
         FduQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro858aeqJVQwJIdVJlJb0WPpx6iSykR8D2bmt474+cW9CNZ6ZVORziJOSH7rNz7QZsdB3vkwqMKeaNXkJChWie+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbp9Dilmu8sblh7hp1XbEyF5juuCZlT9yWVNt6Cz8ohly8CpX3
	AAJOm/Zpx3pV+CSfNJddV+SHk0yKXf8a9j3kBA0RuMPEDljWg5VZpwMN
X-Gm-Gg: AfdE7ckmcnf3Xtj6tAhNqHKESnbgfrV1pPsgJQHb6azBL46ylQtr/Hy+acAGlbn7wjt
	9WE8jKu3u78q37i2hnCJ0EWeVbJ5fHhn8UkC2Vve29UjYLcuALGAne67H5M5S/80HNgZhze65KH
	S5o0dE1taBdCO7O0gVIX7ZDcyfMcvgBGRpfB2YFrnWhnc5p+3igMKL9zUzQPRUG9OQi2zBKRO1b
	gJFElcBt+rkz9IUIYTiKnPJko6Z1TbMUhjD8z0qYUBynbXCIZDN702KeoafB4dBTit7vPoD6XZI
	Cecc2RmtHLsV5uZZ5mNIChE7D/i2RejrVEhSOVRhuESFFUqLxPL1KQkx3sZ9FjPfwY7Lqtr3cOD
	VDpXStd/18wTcEGui++HRthya+VmFhdVo1dtD6XpZEews6SLxmcynQOSVniNv7opgT3Pv+BL+gT
	idIAx0StJnYeJz/v5BcV1ckKSvWjhH6+DMbKsKoT067xbYIyRUQo6XAkf79YJmVSRcmSEIr8zBC
	ug74Al7a7OOawBHQ9cCu1HGyaU=
X-Received: by 2002:a05:600c:1d04:b0:493:df58:90a3 with SMTP id 5b1f17b1804b1-493e68926bfmr42265745e9.25.1783545515083;
        Wed, 08 Jul 2026 14:18:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm68494175e9.1.2026.07.08.14.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:18:34 -0700 (PDT)
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
Subject: [PATCH v1 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Wed,  8 Jul 2026 23:18:24 +0200
Message-ID: <cover.1783545241.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_141837_743019_4A163666 
X-CRM114-Status: GOOD (  11.69  )
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

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 545 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 491 ++++++++++++++++
 4 files changed, 1043 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3


