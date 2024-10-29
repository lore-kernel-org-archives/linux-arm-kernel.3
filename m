Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9962FD3A69D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbnDXxocaCyheHFI8hTECOWKPKoXgfCmEGz3dctI1es=; b=PxRO+WP9mubgCsFwF0L06+MfOt
	TdmfUjobZrtkJBIHig0txiBSS77oZJwdMB77R3TtK1CQYl5/7Wkz4UoAg7dHwh6xVNdoOj+uPH5Fm
	iNmCeTX13iy/sJFN0eaNjEYgKaO5pnbuwpIItZjr0i7DpyW+xpxsQOebzlx4bqfrwFV6KGfJ4V/YX
	0DFIGRDJf4tlvbFFhvUkS5g+dHjBQxvsjIvGKqpHEU+WgAi8fk4g708FngN6qfNXQ8fq1kp6H7L4f
	poqsofjZpckGUVJHFu6e2SNWgbUePx4OdeMWDDC1jJbUZdhhWwS3VR4nZH1i8UB06A9PyC6VTS+W7
	/zxh0VSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5szn-0000000FpRj-0F8r;
	Tue, 29 Oct 2024 20:39:19 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sl6-0000000Fl8a-0BLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:09 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d5231f71cso685491f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233446; x=1730838246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbnDXxocaCyheHFI8hTECOWKPKoXgfCmEGz3dctI1es=;
        b=eeht5xLixBXhyCN5zVlcdJGi7SznogpzAyP2TxTBWOoeyZPMDiuNIn3mQFDPr57ani
         +z+VRVrAeJtCEKU4KPMLlpZFTMXv9tMM8qXKsjW46/lN43ou1q8DiEXYyj957V43q9yM
         flh+yqPN7mEEkp4eshbA7WGnB85HdKco8tKZJbVnJhyYM6Hsf9GTSz5nLrn6FHqgyM4A
         jmsN2kruXIB61uz+NW3LpS9mhFI64MclGz7U8ADVobBinmW0Rhi8LiS2WgzMWTK7wgz3
         1FrIQHMhUGlQH2UFBpa8wgMd9tjSjX+PWSj20kgphqK3rysijLjUeF9a2KG4VU8Pv8Ub
         sPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233446; x=1730838246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbnDXxocaCyheHFI8hTECOWKPKoXgfCmEGz3dctI1es=;
        b=ByxF8jCIfni23uxaHNzcjO6VTQsEtFdB2BYjWaUVdu1pJuo2DTbe8yalQGnMc3C6Hf
         e/mzg12JFatqYoBkSz2tAOwlELOln6+9MFs0ElyEJmQk7BecOreWZdvHEjdWaqhsDict
         +EbLh1PoL0qX7UPW2rf0v8mRyjSn2jGCsdEiQRoavV168iN7J5HAXrG/GsJJcy96pJ9g
         slJyS0TsRnzbntl5c6Jjo6JVurgwqqV/Do6STZJLgCf5khzYTRqdvUIfK0A908c23KED
         PfGuTLCUb37Dj0vEE5ZoVF/urS8OOGGI93j5UtU6xrC3TiFuE9/+aM1zrVwrgPOqn9/T
         z1lg==
X-Forwarded-Encrypted: i=1; AJvYcCUW/3RjLpbkt8YFKUuTCk+f8XI7jzCOf9fTrAZXZteEkETxfbVISZqy+WcI14xoosLxx651cVM6woLHelU1hgZY@lists.infradead.org
X-Gm-Message-State: AOJu0YwPnqcb+KHARA0rc9DcGKEdGpWiK6HCBkbC+FyVinL/N5hp1/Za
	wms3/7hE6wICghnx8AufWafaZERiw5AC0MxhoD4FfoRkoha9dEaPTJ9yHw==
X-Google-Smtp-Source: AGHT+IETpjLLRg+7eXu2VyfPEE1vigfdrCP6sTkEwWApr6Df5/fyHL5jVC/64h7dxa0Nz1OLwcuYIA==
X-Received: by 2002:a05:600c:511b:b0:431:558c:d9e9 with SMTP id 5b1f17b1804b1-4319ad24126mr50500115e9.5.1730233446109;
        Tue, 29 Oct 2024 13:24:06 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:05 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/23] ARM: dts: socfpga: add clock-frequency property
Date: Tue, 29 Oct 2024 20:23:34 +0000
Message-Id: <20241029202349.69442-9-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132408_115007_21E42D76 
X-CRM114-Status: UNSURE (   9.85  )
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

Add 'clock-frequency' is a required property by dtschema. Initialization
is open, similar to agilex devices.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 65d04339f..5f4bed187 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -99,21 +99,25 @@ clocks {
 					cb_intosc_hs_div2_clk: cb_intosc_hs_div2_clk {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					cb_intosc_ls_clk: cb_intosc_ls_clk {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					f2s_free_clk: f2s_free_clk {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					osc1: osc1 {
 						#clock-cells = <0>;
 						compatible = "fixed-clock";
+						clock-frequency = <0>;
 					};
 
 					main_pll: main_pll@40 {
-- 
2.25.1


