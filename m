Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE019CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E2mRYwktrmZtlfT2nFMLWD2hPCZTt5hXE/NuFZYD1KE=; b=HV+RUJANPJBWyLPXiszKTJgMm9
	gMY5qhTFNESqQDsHEIzgZJn2psdbNu88Hc8yaJGaX/pt4kbWXJY1SCSm2cXHctM4hEneTXp8RJLMG
	0nbyw/uIN9gMnRh8/oAhXQ195xcBiNGBavYaA9Tqpk45g+rR1tbhlUPxF7I/1MrFrz/wJq+mu/Z6l
	rAaTT9c7MQPtqQsbqxHe8cQ/wd0qIUuBaZGY2imChSEO9tO6m1VLLApVSEluwplv9vKUmIleI55rT
	sVFVdUSyB7FmPQuUtvkeyyX77HMBA8oBG//xokzfR+FBIoPurrhbcE2cN4SdgOh0w8JUjQ9nar+L/
	JlAmvPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42Pw-00000001RZ8-0iYW;
	Thu, 24 Oct 2024 18:18:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42Lk-00000001RAR-1oYv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 18:14:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso771312a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 11:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729793659; x=1730398459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2mRYwktrmZtlfT2nFMLWD2hPCZTt5hXE/NuFZYD1KE=;
        b=CErRG+q9YDCFv6sw6t7CWnQSkYWG0zgldqjvnvUWV/Oc5/suTmrNWiIptjR0Vw5gzn
         4E3f2LFXNxZVm9QdaEp/aM3dCoFfeQTxu6ZyVXXgDif+w60aLfhFqFsX/AdKHv6tpF36
         3EP5GzsjaWHaVw3Mb60iPkbRhDTgy4p5gT2slK9ccuBS7bRYNO1EUeP8H+KnyNS/MzXY
         vWx436wofuSKZ+p4OttEYDdaQV9OUU5noPmK4sNgfERTRcM0KxvwdwbDH98Wn9aGYBIE
         UdeKC7LKpeJXtVij0h9cH1WqG3TeTMu504HDf7ECffs76KcheLwxsf37iZERjTOq9HY5
         xQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793659; x=1730398459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2mRYwktrmZtlfT2nFMLWD2hPCZTt5hXE/NuFZYD1KE=;
        b=L6MZmb9NnVKcEfPJtf9C3WFEXYa9cXZwBKi2zxD8u11JLRQ9MUW49qMwMzvS1g9smi
         Ne4tPM2QNCgYGRZykLpFwxnaFa+EM/iYhsS3UZz1rt8dfG9vsxRp6Lc7QXZn7JB8f8Wf
         r6MKrfDC4qB157OOTJJ4mhGvLsLA2N0p2fqm0//Jml1CwjuOJP1Z9ZBGFKvOvVvbOujn
         wSekUESqfnlmM8IcUcCS3wgBxg2lC2au5G2mJg9bkfQNHxS92GWyjUZmmkU645cfNN0p
         b4SSlK3/CLcMEmEiqTq1YMkQg6ERitQhNDgp2XQlH3FCkVci4FIql2IJodmEJrNi1tr+
         qIvg==
X-Forwarded-Encrypted: i=1; AJvYcCVgFTpAUWQgBjXSx9bDjZ3+6qiQb70diQKJCybEs4C6o4iB3hKmEXK6wXzPb5FtLG6aOhFhaxggCHk9OI1/5KXA@lists.infradead.org
X-Gm-Message-State: AOJu0YxqNYneP9wS9ZYcLaTOUdt2t756X+yFWYfQTIzHm+TLxBw6XFEE
	xmWg3uHccuKUQJEj+0YjFs2Y4qQEmL1l8z3pPGLoqDTIymHwcpIt
X-Google-Smtp-Source: AGHT+IF15FANv02/HX5OJM9MTivD/8lQBJRNT9ZUddV/kotfU3iNdSgaePzvpQs3OCWOW5wJ1NIpAQ==
X-Received: by 2002:a05:6a20:43a7:b0:1d8:a3ab:7220 with SMTP id adf61e73a8af0-1d98976e70fmr3697478637.0.1729793658893;
        Thu, 24 Oct 2024 11:14:18 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d74d9sm8208171b3a.133.2024.10.24.11.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:14:18 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	shengjiu.wang@nxp.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx6sll: Fix the last SPDIF clock name
Date: Thu, 24 Oct 2024 15:14:09 -0300
Message-Id: <20241024181409.1461997-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_111420_496094_0CACEF27 
X-CRM114-Status: GOOD (  11.84  )
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

From: Fabio Estevam <festevam@denx.de>

The last SPDIF clock is IMX6SLL_CLK_SPBA, so change the last
clock-name entry to 'spba' as expected by fsl,spdif.yaml.

This fixes the following dt-schema warning:

spdif@2004000: clock-names:9: 'spba' was expected

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..207b193db3ba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -173,7 +173,7 @@ spdif: spdif@2004000 {
 						      "rxtx1", "rxtx2",
 						      "rxtx3", "rxtx4",
 						      "rxtx5", "rxtx6",
-						      "rxtx7", "dma";
+						      "rxtx7", "spba";
 					status = "disabled";
 				};
 
-- 
2.34.1


