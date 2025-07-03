Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3DBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=; b=lHW4UajoGpy7d2XfJ6JP5NRM2m
	ODKFUlXWLjh72GDmZOmt8nwn4IOlAkHhSQnFpv00sw1Wwaw5jW25QOCQsQWanHjIXEemniUMdW+HE
	tmA7626HP9OIN0SwJ/+PBocYKvRaw8f5A4ecOuE7w96gK37Zsrvt5qLyCjZ0ht9Fz6TJUQJ1DyS5W
	O3RTR8OYZRIRP/+f955XA38VfacEPdGyxEPyFfenJfKGu2oN89SCRPvYS+o+xALu5eTlJgeQFX51J
	fL4yp9vLD7HUxS45ylbSaXh2WiSZ3hKI+tSM3JdMkrkh9vuFGGIfhDrUuLXZyvl+d4Tb8gksPLA0t
	AtAFvQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJI0-0000000BMtZ-2T1x;
	Thu, 03 Jul 2025 12:43:44 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIGj-0000000BBVe-3Z5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:38:22 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-874a68f6516so681924539f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751542700; x=1752147500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=;
        b=fVs3S0I1IdoVLESiaJyrQxIpXey4YkaDhOfWRI7c2FIVE66qW2fS/alDNAvoCfLaKQ
         cZaTP9uQjB2Lm0IOXBi0+P9PFro7CaYdKOq8/e3/yzSo5fslkXVEZSNMvuYCofKNM5Ii
         pcQ0+CaTvDqWHAiGCwDN9UYtwL/g0hwYi9LrTPCwcBivsL6Jxsb2W1ORERDtPYM2bLeR
         gg3gV75oh66TwIPLNBDz2vcjkZ0RdGMY2Sq4IF7QoMoh/fPpl85YtTxAkp1blMMX9kkE
         KEgWsuIDGeRZDdTe/obu1TAfc8c9AVMyKVXdoScLgzS+3QxYuYa1xBI+Ey5gS9qCvWGf
         osuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542700; x=1752147500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=;
        b=wDW4rD/+g38hgMqNCSMYA1wfOFdgVBWN9z9mgQiuxVR6YZI+egI78U6PlWYeZgNH9i
         HCGwjgUn4F+k7Hy+QWNi4LVJMuE1DECX9nT9PLOfGh9ZitnI/aEQ8CV96ghQxEcEjGr5
         OyDDZAqm/4BDlx7DT5a6FaFIRcqCtUUp3qKGmWslZzmeegIeynBAZF+hLeTJYgZ145hq
         5TUGdA1mgUtj+wBQuiJ8adOT9RKOnsaezJ3NpDopH+t/0VD5lTkZ0ki7NWGIiH6dDQJQ
         OxH+lNAq7kdECGBX4v0vQugf+nNnQPGngyYnGZLCCFD+vrCrjrz7UhURj1rn6VNeqCyA
         o3fQ==
X-Gm-Message-State: AOJu0Yyb7DSaMg+wsrdlefn3fnm5hjmOK31aanJw8yzu5FUpHVJBDElN
	96MqNlhy3LHLRvcu7VqRtrM/T5Afdy/Zu13hQBJ3bbyuFV8wRwi7qxxTW/15WA==
X-Gm-Gg: ASbGncugugSx3PKGkg0SFBufxDYJl3wD9X0aD7BA5Xc0irvmcVqJlmtvy490n+Ywc9L
	pL5Tl40C/mVSxWcXo/ypJGitDbHN0taG1gHltDqSU1ivOzt47QnAXE3UlmcAwh/tfOqOeFl4s+v
	JggXO2nSFK/NPULW7o7OJIqDvEE65txNNzOOjh9qlsxOZB96mhTsprwovqadQuLj9VCDqWx2/Ro
	ez7ZFipD6P+uxRZ1t35W8fkGSJzmJOnQIC0Xh+eisGFIPFIlBLWYsowoLY15dBKrZOyjmqYRwYj
	2PZNbdEccGvWtzAu/ZhJ4zoYQEbnhHOTvg5aCZx+KD2y2dKIk23I7QvTNUIcwQmpAAK3bz8jtEQ
	9mTC+R8SSz11Gh0X04/EULeK/Sp9oYsstWjf1rqU+CvFBrhY=
X-Google-Smtp-Source: AGHT+IHog5B1MQo5B5fqSCOuRreuMqfrr3E0s/Y/+iP0IZARhEP16EmHsjUPLaXR/JQcDkES5v7T1w==
X-Received: by 2002:a05:6602:6003:b0:876:5527:fe2a with SMTP id ca18e2360f4ac-876c6a6fd54mr836261839f.11.1751542700238;
        Thu, 03 Jul 2025 04:38:20 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a57456sm3483544173.72.2025.07.03.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:38:19 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Date: Thu,  3 Jul 2025 06:38:09 -0500
Message-ID: <20250703113810.73023-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_043821_886056_8DC6F158 
X-CRM114-Status: GOOD (  10.00  )
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

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recommended to not use the DMA on the
console. Because, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
V2:  Fix spelling errors in commit message

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cfebaa01217e..ded89b046970 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -915,6 +915,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
 						 <&clk IMX8MM_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1


