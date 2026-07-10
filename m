Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8911BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkxXpxlyoJyTz9+xOjOb/cHlUPzYmumvYwxldIGQL7U=; b=Az5NpAsZauk+CM9PAL4O4Qsiuy
	zJVgvPqbd9Tp8GWzARILQo8ihb/mR8Ly0WwBVTuaJxHB9Oq/XjgNkSDThwrA3fnk2hmCXYHeSMWpb
	NeDMdts9kwIT0q80a6/SfSRisQOfLoCSn8D9rVKLoyRfkNQiZFgFOdZhjoRIekrfF1FwLQtC7ZXuW
	fokXbt3imO+5/yZwKkihimQK85CqY1qvldFv25+klQUd9Yr4GivED6JGQsYg5K2I4uqFJ4RUFc+QF
	ZoOFum6wPFJ3/u1j/qCfZXdoXd3zkCkaZ7lM7fb0+bGCB55rGtRQprzzCkynoUJGG+rpWYKtsCMCz
	DiTTKUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAgU-00000004whL-29Lr;
	Fri, 10 Jul 2026 12:50:26 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiAgR-00000004wgU-3PgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:50:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493ec555a26so6103455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783687822; x=1784292622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkxXpxlyoJyTz9+xOjOb/cHlUPzYmumvYwxldIGQL7U=;
        b=M31AUFPruxQaUraLsevMqMaRsUW5Rv4BsG/rCB0OM/vEx1RpiocHXG+QqE8VP0VLhI
         6V32YmSoxZHmpFlBEXwOfCrCpv91dg5xJb9DMrPX6A/+U6yB0P1Il0oJPPu5Xn2WQ1CR
         P9GpDHmSKtvE84qZ+A0STRl2bYqvva3tsGqZq1oOkBbbbsHicc/HGFF1sbXIZWpnJmq6
         FNAcsYdIOQBL6hSx2uv+NhcbINGsM4OdHlHyXIUeLbGp1iBtpw3FYjOmaE3Umrp6oUN4
         vu5uibuhSxlnY14kS4UsreSmOYXwDPx19gM9WHcIW+YvnDNYjyY2S+uQYwR2MxH/xSy7
         ahDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687822; x=1784292622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkxXpxlyoJyTz9+xOjOb/cHlUPzYmumvYwxldIGQL7U=;
        b=e7ytb5cHXN5a4GyEkyCwPA/cmm9JdSDNcCTQER7X1PNdal/gD5tQkE99Sn5BzvAxqr
         JppsHRs1RnTKxEdFNwkwYrEd02dO1U2P6FGC/5mT5fbACd/cn7KjhNHoUU4HrDOqTuvv
         nv6L7ERFA/L4HkM591iTe3vcxqIB93rMZtgdzUPMA8T7kDxNdj/aeMXKpAW1IsbOOtJd
         9Cu+/y79r6QaootFiv0OaimZJd3W5TBN00agv2k3mJAYIsQlMH6GPDO2AHOzR/9tItQx
         6AjnnAekJc9Gw2U1MzamXXEszKKDzqrXs9V+qXbLcAIJYd+ORy6ujmmXsRKauJ0j+3xj
         xtDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRE+BpURWA71AZ/0/Wy+9bNId6X9Lhe4HBNbNhrchuNZ3i1o20i5oeEjxy6xFY+DuPzXeO9qKPf5gLQxy8xAZ8@lists.infradead.org
X-Gm-Message-State: AOJu0Yww9/lnuX10g+fb2vw612EPPi87RBPcQj7CIGZp+DNvzYvc5JG5
	xcL3YDyDLL6V2Dlww6i4XYgY5eOLmCpu8Xn7UGJCPhWTMT1dm6cJ8hbO
X-Gm-Gg: AfdE7cmD0v+YRDdO6e68BaXhfUyStqWUnWpVfva5rbyZvtX6Vq2OGHIAsvQMjajspff
	6+IiV5Wc0HTHRgo7+RCIk+1ga8EIEMj/lm2VecKEejgXd3g8gMVT/HEiGRP1Kxav7/7Wic9c0Y0
	CK8hJa/9Y5bC1/KmQjFzNWvaCL+vPzWuWX4Gx8A01fvty3KPiJIDUqeKTmVGAqL7LDM/cpWZgPH
	EFOBowGGSnZNUrSvJR1lFSGkTD+T8pYnv246V/Qto5BnPWpz8gJaFxa7tkUAU3M1w+D+UmqpUy+
	etAraeqTJoKQDHvlvOlRWWmJQDumWumXjn7rolBMeQe1S7wGMDV/TAiQfD5RtmdfFPVG+x/Gs3/
	bzN0AGV6M3OIgcJoxOsjPbVMjT2n1h6yl3QiEidbhzQlHijOWeWHeFf5vcW0kts+drabjTmH35t
	Ym7/AE1/HMOfozly6qlVdInAT+u1pccC/4Qw6KYI7xoxODROjWWc/I
X-Received: by 2002:a05:600c:620e:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493ebe7afadmr74080665e9.15.1783687821335;
        Fri, 10 Jul 2026 05:50:21 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm61218665f8f.26.2026.07.10.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 05:50:20 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add support for Variscite VAR-SOM-AM62 and Symphony board
Date: Fri, 10 Jul 2026 14:50:14 +0200
Message-ID: <cover.1783687321.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_055023_869892_5A0A786B 
X-CRM114-Status: GOOD (  12.11  )
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

v1->v2:
 - Fix AM62X_MCU_IOPAD macro
 - Fix OPP table comment
 - Remove reg_vdd_mmc2 regulator
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
  arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 552 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi  | 487 +++++++++++++++
 4 files changed, 1046 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi


base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
-- 
2.47.3


