Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C6CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=; b=k05dY1qXuldQ2oXErZRbc90gCU
	Ih/QODOcB03Ul2UmtILaTHbcPF39nIwAEFBDhgAdn/INJIEypVRb+A7WK+Q2/2c9hBqFtniRnPHL/
	1L99QSLL4mzj5deoTXcaXn/pkwcUDN8On2x6vNwajrh9LGt/5vqBFXYvauYpGJ1OfhrEvGfXY4OZN
	aBfng54BykgewBFB95YwWcGln6ZZcaFpmNDT2SQCJnXO2yV96jUt4rnzrjvdI61hbSLhjXyocfFlp
	CXYIMtlxxehuz7vy71DnVUkUg+Ed7rggtm3kdoYmtkQT75CSJLL4pN+63YXQSU9Fzfk7un8hvCmOk
	PYxJA2Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8t3-0000000DPPA-2dre;
	Wed, 13 Aug 2025 10:39:17 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8LW-0000000DJle-3ggc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:04:39 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6778396a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079478; x=1755684278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=VoM984j2uhzi/rPgxZh366xsXsLXSY+caWrfGJc2lwzwUAKRwMov1xFqpFVOMkGf1D
         VAnoYFAuwtgwv1bwTuSom1QovkNgRjuhy0GfAx0KdE6pcsp+lf87arLs5LnkiR9Q2e1E
         1g9KF6jdPfmq2XID+L7LAnCSnDhRDrH2sRgCyrT3Ps5gSXpkQM4y6cEbWZMqAynuY9hD
         mxzM7qOvdsjQ/K1iEOhEmYwcmEVWsdHOWLxTosHNQSUs35UzjBnU3pnzvca6XTG/JAjB
         z4Q6LBYg4i/IFoxwyj4npf9f7+6vIy46IYQHiLBB5WY/aK607UUOnY5+cP3mRXLuJ0CE
         +tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079478; x=1755684278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=cRRg/iEG0WCcAVFJpMzYIyCOjRVh3cou2KuDCkt9o6+3ryRL8gcSs6BPOnYOFCsa7/
         KSEMAs4KETlJ78tuHsr9hYCsNuZazGn5wfheEdN5ZVtlB7Sm+L2bpCpsBMJBfrrDzZdM
         iyPB8YsLAoJ1xUQhZrcT3j7aOt4Ese2E0TVeh3/xMUikvNsJPzYlqCdg4XOiDg8DgC9G
         FhZJRjje7pZVFvEbd/9C6C0yr233GNgfzbXmBwR97y/wDYBXkxNvKz7f9zuLvJd6DAUu
         xmSodRHui/dZ9WfxbBjRa0ESafWUpBja6SPj0ca6VqY4L/CElVnEZMMx+LREVEw0HIpQ
         a6pA==
X-Forwarded-Encrypted: i=1; AJvYcCXf4M9+LHmG97b09ySIbzxGgEM9rWMOQ4iYIa8SPqNoAgiJDSUTRO6hB0EDF2OnPEiDPPLAeF3zgO+LhT7suCjq@lists.infradead.org
X-Gm-Message-State: AOJu0YxKt4JZJZmGKbujZ1oFsswJV/TeU0y6PQeN5P+Vkt6BobK9QQIk
	PyV8xW9ZaiTBlmwQkmOLBExHmIbKuPz3JM+0pfo8JuQ4s4jcytVxCgd5
X-Gm-Gg: ASbGncv6Wueh+sVXBqiJd/KNUl8bD3MBqrb4wXdhmAo5oZMQBkbT1Y4kdF1K4Y7+aLo
	tgXiTV7y4UFXpvfFvRNBMIvHa32pmT3NDggzg37zEjyKJPFFYZmkB3wmj9P4SG4rTPBfhUxeEYC
	D1gO0d2ORkWshYoitx5FWXZ29JVbZkcnFiMljmvv8N1HJ5YpFMdiW8oJSWo74o1f+L2YkfQ0UH0
	gOaakDQFKc1TD1r750VgxLmzLmGw74F+GQw3wJuw7/1/6z6u34IVWZwPfk82Um9qlPWmPBQxWe3
	/0D4ekYhFTkPhjxhl7vNAvlhSLrc0W1FcXJv/t0Ct/hnP4mCGiF4u+qM1y6Gn1giqWz7WSWhdZQ
	w2EkLq828P9Kh/me/Nqdp8cntfvZjO9U3ykSnU4FuefuZAM77ew9fsFo2afvxxTW2kpw=
X-Google-Smtp-Source: AGHT+IGelUIMCLH/6tAhQk/cnhctQEprBN0ypo3UWDci9hqE88+bnh6T+CG+4JKD4zlV0xkaaGYPMg==
X-Received: by 2002:a17:903:11c6:b0:240:48f4:40d5 with SMTP id d9443c01a7336-2430d1f5b1dmr36623355ad.39.1755079478041;
        Wed, 13 Aug 2025 03:04:38 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:37 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 13 Aug 2025 18:04:14 +0800
Subject: [PATCH v11 2/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-2-8970d41f88b0@fii-foxconn.com>
References: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
In-Reply-To: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=992;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=0XkYbizVBKY9WI9Q/nF7gZY7Z8IkaJEB3NQ1RTG/C8M=;
 b=8NFtXkhvEhwb3LTNeWPtrGrZ06tX2HEIza1oBDSY7eNjoQ2OsAiRGn59mEA1hRRXYdfeWDWQA
 ZbyFDG6X6W5B39BS9ytnr++zFZ1s+ftnxvGHxAqw2LcuGQB7yM2bFgn
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030438_921968_07598B3E 
X-CRM114-Status: GOOD (  11.52  )
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

From: Leo Wang <leo.jt.wang@gmail.com>

Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
description, enabling support for RMII3 and RMII4 interfaces.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index 289668f051eb4271ac48ae3ce9b82587911548ee..e87c4b58994add33938792f732420ade7ea5c23f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -412,6 +412,16 @@ pinctrl_mdio4_default: mdio4_default {
 		groups = "MDIO4";
 	};
 
+	pinctrl_ncsi3_default: ncsi3_default {
+		function = "RMII3";
+		groups = "NCSI3";
+	};
+
+	pinctrl_ncsi4_default: ncsi4_default {
+		function = "RMII4";
+		groups = "NCSI4";
+	};
+
 	pinctrl_ncts1_default: ncts1_default {
 		function = "NCTS1";
 		groups = "NCTS1";

-- 
2.43.0


