Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59C5D3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQnRaKE3CWs3EWJZg8TyJXymOuu8Xu8+zwME5vygCHY=; b=na0tyGW48Tv/lFpkxIOvTQ4KTq
	/sCWgRcxlINWoUGFgPRWX2sXLzUAtlRZtbrRxmuwiE0biz2InIfWRvNtQZcG/4GdbHcGWvvfxU0+A
	1k5oUzhbRyiwcaSCSR9pc3ZfPOiiv3IzV/yzYJPBEtMvDoB3ETyCb3TpGSqDAUe9Xx2TOqTUR3TvM
	d0xo8j684v5FAU148r/Msaxpz1R73jP1NcUNcxrKbLPS5gM8z0QoTb69A71PlsBdUZu1xEc6asiBd
	zcVz3Kh4FLXHSCSN5mFj2KdnKquFhinNplUBW6/m+VNSrCNIUkGeOWQcPsjBubhIySnL+LdcUKQ6r
	bLzXIDGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5stA-0000000FnYs-1zYY;
	Tue, 29 Oct 2024 20:32:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sky-0000000Fl5v-2KCN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:01 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d4ddd7ac1so592443f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233439; x=1730838239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQnRaKE3CWs3EWJZg8TyJXymOuu8Xu8+zwME5vygCHY=;
        b=Opfcp+h4tm4M2jmsCDKF7jrRQUH5IwdvoQI8WtRQMCWG9kM9OZSX0GBk6TqsFbztSI
         QlzyUGV7Yg6UCZk/LKcN+8h76xY4ZOdNBK5AvDjzYmf/E0Zy/Uo6chWvA7kyqaQKdJFQ
         NpKuVz07MCge9mXh0vGPIA8VFB6SEzKQlqR6RR6YuMzMQZhKophbzEWbkaYxg73OsglN
         +CTzQGq27O7XAL2xUyD5zBsRjXb1tksGWIhmZljEP8Z5O0bm1MGM4KIqXUA4iD66Budz
         CteYQM8fORuh8v+BSJKMDODqsv45fETAV2ktMlaDBzE5UU0rV9OannkJCiIBoD2D/V9P
         LFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233439; x=1730838239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQnRaKE3CWs3EWJZg8TyJXymOuu8Xu8+zwME5vygCHY=;
        b=ECiFGYNDvSlXYIZ3sUpTp7zBJxZ8osQEevF705TKBbo8ocie3DAnD7YTqXJ2ExZS4c
         BnscppJ2vZaEnXbSlF60rFgBT8MtmKzc9xPiQxlDd6Ulo5yByEoyMBEpe3TJ5w+cCtfw
         voOdL0fLWJDt9ei8RG4aSTHfLBwH+4cCWAyUvG0P5N7Bv2Mj84xiMFTHKsw4f3CkuX3T
         FXXjj312jQjQhFKWP89SDVOmh4kRim+nnYtSdMcTL2HDbGkxy0UC0lZcwx/G7L0kLEIJ
         xgdtJ0IxwOQkrn5eUJOAvDNt9iT+F8UKtZGJ7WBHArxD+MmbHbH91TnEEQTBfj4aFPzj
         tpZg==
X-Forwarded-Encrypted: i=1; AJvYcCVfHAjIeezia80X1FzbU2twNAtmD3OmaywOzJP6RxJ2yNQmO8lF6M80DeqQK/q7BFjKW1659vBpvBUwJUyg/bNh@lists.infradead.org
X-Gm-Message-State: AOJu0YwsJAprMtUfEmFNbLvfUcV2W7PSZlXw5ynVjz6BEoAuSADiXpdP
	wI+uNOShL95Yc6BxlRFWj6Jj0Laq0uvgW3fopZjbkTP8DAcGOl7m
X-Google-Smtp-Source: AGHT+IFiCWzYB+aEmSCBowk9yZWznrjM4cZYnTvHKYnqO8xrzv6uwlDNRcSX/uRWMq3BlsdvGSQiQA==
X-Received: by 2002:a05:600c:19c7:b0:431:5632:448d with SMTP id 5b1f17b1804b1-4319ad76115mr50108665e9.9.1730233439113;
        Tue, 29 Oct 2024 13:23:59 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:23:58 -0700 (PDT)
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
Subject: [PATCH v4 04/23] ARM: dts: socfpga: align fpga-region name
Date: Tue, 29 Oct 2024 20:23:30 +0000
Message-Id: <20241029202349.69442-5-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132400_615749_585164BD 
X-CRM114-Status: GOOD (  11.68  )
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

Binding and setup expects to match fpga-region instead of old naming.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi         | 2 +-
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
index 01cc5280f..1562669b3 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga.dtsi
@@ -87,7 +87,7 @@ pdma: dma-controller@ffe01000 {
 			};
 		};
 
-		base_fpga_region {
+		fpga-region {
 			compatible = "fpga-region";
 			fpga-mgr = <&fpgamgr0>;
 
diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index aa0e960a3..90e4ea61d 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -80,7 +80,7 @@ pdma: dma-controller@ffda1000 {
 			};
 		};
 
-		base_fpga_region {
+		fpga-region {
 			#address-cells = <0x1>;
 			#size-cells = <0x1>;
 
-- 
2.25.1


