Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8FDD3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rm8BK0uAln/RMAZHBbXqzd3kfEXu0sK1tEB93lCjSg=; b=X6/KsdVgOExEzKzUaHlB5JK6vg
	MLljdQFAmmvx5VvVbWiQEDfHAVLKv16q1Z1ckzGxP+EQwcLByQ8RCzph7sfzzKPgl8ig+DSq6JazG
	TOtICE8o4Unnu+orE8r3GJ7cWnm3fu5ewfkrwjHC3bOLJbx5qhp9uNrt+d26LQS5KCwtxLYZ2npBO
	Bahb9ucW1tz4dlyGdHauWd/1c/VJb3rujxjTonUntTILQVJTF3GASPUsiWbArUTeIeaxxBqN0lzFn
	UeRKVIbtQXpaszFODFCZfBLPw/ZdNRxeqOWuy5kuWzyu7NjyhZ1s+6DTVuh5MZTkzK2xAKAzYeiDM
	7GS/i86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5soH-0000000Fm9x-03ga;
	Tue, 29 Oct 2024 20:27:25 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5skt-0000000Fl3W-1F2R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:23:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d7351883aso532412f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233433; x=1730838233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rm8BK0uAln/RMAZHBbXqzd3kfEXu0sK1tEB93lCjSg=;
        b=asN70WQdsF2rL6hW49T46Nyi3VXrr/SWFLEoeUq5Nool0tRGobJ12igqVn9WGQiaZM
         ESzF2JwHggWfLIjqSE8gCYCSvs5dpO0JvTyNufGChOGDsyLRYbcNJjbJCIsX+y/DLrNB
         9JAV+nJr5paA3lG1yf/MtfWRUKLzNRXXc/2l7jvramXI2nCaeBOk1wypB7aC0GQ7zdg+
         P9L7xUMsejt3xjqA1VJbeYcNF2X6twlgpEi6ZdFS8ypt3JBX/QYNNU+AbzPwpFSFNNiz
         /WT54Q9VjatxHNAFTeH6BAeV3OWM7EZqQsv7EaGH3O9b9uLVyilImq3P5w8FZhzWqRkJ
         q30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233433; x=1730838233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rm8BK0uAln/RMAZHBbXqzd3kfEXu0sK1tEB93lCjSg=;
        b=rZV7wpCQYwEiUjY2P/NK2Sso+HPbZ77Mzd4HHjxR8V2inNRDGpBSfPWhcA1Q0tf3sX
         RaEI534TVDEHDcgFpdAtTgJzVYQwpHHmcXO3HCNHX3pO6FnKxJbB7PJu6ulOxEUh2rHC
         nN//YWYRXoyq7Cjb4zgRxXgxLMvO3zL/sLiDlI9eQ3po43AXUrTPe9IFs/nwF2rQpS/E
         p+1bXHuFiIHJ8FYmzfeh1PQ25tm9I3+6ZREgmStOORyx8czi/Jk/2T8ke4T1B6Ob4Z8l
         nju1THQ/wGPnGy5etbmLIRPkWexzKaBBhdq3JfsTMQvTMOOM7L8cELKRxXisEN7fzDEx
         eHnA==
X-Forwarded-Encrypted: i=1; AJvYcCXCArZseL5dvdtHIKKyzPHlpPzLiEqrM86hGQRWyWEZDAVKzwrl82+MHySlUlIktsv0dxPiaHRqUGCqnhUEkz8H@lists.infradead.org
X-Gm-Message-State: AOJu0YziK8n8aZ5/UikRU27RLlp12Xa7pfYjPs+HtQbyml5LxrvVuFVT
	XQLusWXXLr8a4e/zWIkCmLSyjtFbsWRrGHLTUvBG8U6mWfbSzfFK
X-Google-Smtp-Source: AGHT+IFAOSYhcWWlGhxWeEteuXlA5hTA/tp8gk7Qdph168pUN4cvZcDVaf+e059elXUz5M5LLZtYDg==
X-Received: by 2002:a5d:588a:0:b0:37d:4aa2:5ce8 with SMTP id ffacd0b85a97d-38061206f90mr4581741f8f.5.1730233433082;
        Tue, 29 Oct 2024 13:23:53 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:23:52 -0700 (PDT)
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
Subject: [PATCH v4 01/23] ARM: dts: socfpga: fix typo
Date: Tue, 29 Oct 2024 20:23:27 +0000
Message-Id: <20241029202349.69442-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132355_360194_F90FAF01 
X-CRM114-Status: GOOD (  10.81  )
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

A semicolon was fallen off the wall.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index 6b6e77596..7113fe5b5 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -169,8 +169,7 @@ main_gpio_db_clk: main_gpio_db_clk@74 {
 
 						main_sdmmc_clk: main_sdmmc_clk@78 {
 							#clock-cells = <0>;
-							compatible = "altr,socfpga-a10-perip-clk"
-;
+							compatible = "altr,socfpga-a10-perip-clk";
 							clocks = <&main_pll>;
 							reg = <0x78>;
 						};
-- 
2.25.1


