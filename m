Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B857FD3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syqLQEEuQIy2cda968KqPmvPAkdMXpl9TyM7P/fgr+8=; b=eElfpJRisS5rFG3HJU11SbQ2UU
	Lezuq7Q5nF5yGXUaGihBfi2Howverg3KJErQdWe8W3j3JhdV6/qHyWMYbM6RtoSxJguLjC1wmzrL/
	XD0TrBdhZqLbABhb6IhMuZyJLMMmrpRs1tIosapKL1E34qCEJQn+5pycIvF3ruKYqxzfD3oJsUVD8
	+uoHySpGTN5VGhPqukIu9b8L/khxQuvPHjKHXzy64cIUVz1YnMCDsDJCmrYH3ZQ57Wt8wGc6MzfPP
	GT3cyqfNYARjLYUYoHo/oGewUHvWBdWeJytJy19TpgfCAu4L5yhtHizxgtjiLLaxt55W0w+ed6236
	XyNYv8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sy5-0000000Foq0-3BSO;
	Tue, 29 Oct 2024 20:37:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sl4-0000000Fl7a-0WIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d432f9f5aso549004f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233444; x=1730838244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syqLQEEuQIy2cda968KqPmvPAkdMXpl9TyM7P/fgr+8=;
        b=VyPZOf1uc0olVsRqHfHymmlaHClkWWOTrhrOqm95wOQVu/4ODyiS3i/X0osgWtXCJP
         4WIjI04hy2Bj49e0oJE1R1ckFU/Ixe+sx9jLcoqYdO8MseLaFkU+oROvqzP/a/8Jn16z
         ghqC+fEFbPlFy9NNAXulHpGk9M3EjWDcm5zGJ53y+oQjihUgJtHV+G6vmLdmdKl5/AQM
         jT2nPso0h5WijUfDc/AdL4SBgMDmLK9P3FWovN02dk8YCVnfpRsUcAzyyYHJx/J5VY2t
         sFtlllrPdOYiGTQmYXxeM+W40OKgOKZ/oX+LHXvLvPadJN7oRkazWdxxo/Vut3e77Bng
         a6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233444; x=1730838244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syqLQEEuQIy2cda968KqPmvPAkdMXpl9TyM7P/fgr+8=;
        b=R2WyTR7TnmCWI+budeVIId3rFPhhj7Mk8szvGxg758AoBVKeZOOf7Coj1DeeJlpNqt
         8fxX7V1f+otsu+brhD4JXUDur1dMRKJKntGrsxIZMECei+11WfKqSn7oOQOv5I+HSeeX
         RgGcpquITsblpPcGYcCOMu+A0RuenwsXu/OmP2WDYRU1LuB1g5oPaZ7E5HKK+yhTTdXM
         u+t2F6XgBGWQfHPQVWQxtoMiXeTtAWwqRroT1da6D49XrvJ0xItVVic9QveT4gVp30/D
         nDLnVcWQdRC154vvRUkZ+SxvjnYEWJ2fjmxUSpXuZv/hwHiWDYhDAMvimOdT2JrJJD9A
         Y99Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgalpeKoBDe/AAVt4abxfFR3A/MnuMB7cnHmMLNYpzfekHL8ky177VZK8ooWFSmHXMZY2UdHwPYymVGapdaHgf@lists.infradead.org
X-Gm-Message-State: AOJu0YyD17iZRE4yyoldA5JVxv3vq2qW2H/dknX20FgSFt0V87lcd8F9
	fcBRZTc4SkoPFfuQcPJ2NgPpsfd+D2oa//eJcvf2y6hvLCNSMi+3
X-Google-Smtp-Source: AGHT+IHGVFfyqJqlmqeKRFFKcmhj1OyaAu/znhSmRzQJTc6ZYgh+32XL3bPFTzuO8uUces3IhKZcmQ==
X-Received: by 2002:a05:6000:1446:b0:37d:54d0:1f15 with SMTP id ffacd0b85a97d-38061231c59mr4689734f8f.7.1730233443892;
        Tue, 29 Oct 2024 13:24:03 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:03 -0700 (PDT)
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
Subject: [PATCH v4 07/23] ARM: dts: socfpga: fix missing ranges
Date: Tue, 29 Oct 2024 20:23:33 +0000
Message-Id: <20241029202349.69442-8-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132406_197115_DE35A650 
X-CRM114-Status: GOOD (  11.23  )
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

Add reanges, since by dtschema 'ranges' is a required property here.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 4b19fad1e..65d04339f 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -81,10 +81,10 @@ pdma: dma-controller@ffda1000 {
 		};
 
 		fpga-region {
+			compatible = "fpga-region";
 			#address-cells = <0x1>;
 			#size-cells = <0x1>;
-
-			compatible = "fpga-region";
+			ranges;
 			fpga-mgr = <&fpga_mgr>;
 		};
 
-- 
2.25.1


