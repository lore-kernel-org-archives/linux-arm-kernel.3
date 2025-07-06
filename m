Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA7C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 04:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTfGXPyjwWbwYggXhGjVsZrke/lrobe8f9NW1l4bYM4=; b=VNlb8wsaeacWevAuh6kOWjm6kX
	LC6koAVfRE6gFbiHwJac7gze1bDY5WUwqlD9gy6BEC/Ny5rL3ad8Wv+8CcAZb//FTPdIW8PzXLVnQ
	gUBMbZgV1BC0xSgVsAteKU0PiUfXoWzDnOLeYizJe0A2vJCgeX9QWgOE5MqRBvLAjPa4RUra14u+K
	rhQf2hAjjczK3qHx+pscP9YWg0OwkYr8IoX6cHTvUitF73x/jVaQhvKqkbFPHHQb2aZBM6vDHqqTy
	iSk+ffehfC9tikYdPrMs9YWb1sCGmLxzkTER37m/fkUWx6NgjfdggsJuNXlorpMnyihRzBvaQ3hC/
	dlbFiC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYH6p-0000000HMom-3dxi;
	Sun, 06 Jul 2025 04:36:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYGvI-0000000HLi6-2eVJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 04:24:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-747fba9f962so1570963b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 21:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775856; x=1752380656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTfGXPyjwWbwYggXhGjVsZrke/lrobe8f9NW1l4bYM4=;
        b=iRZ5GzAr3q5rRiJUkjRDo0LxudUTdJ31OfHcONPGuLKd/yfK6flRCNbVSlK8bqOZgI
         NGt8z8Zni0WqDqcecrOZvTmiz0jRjl2WhXSMft4lslIVNCTXzKYiUTD+hyfvxkIFx4JV
         fK6sfCz8bcQkq7olhmTHKKl6GVwdUeNT65YYaYxL3miOD0B8NC41LBv5CJD0DubZIv7o
         AxMibmMbxUfnCBSUHCDNNjvJGfRqhJvK7+PR5tbb1CMpT6A0Nd3QbEIGVZ/gvxkRmiRn
         qDlAT+Pr6scFlnq99ZdfIhoDaIqSNr1RvPTiAnHSrGGNsAh2ExvTuA+9yHzoqtR98BUV
         EpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775856; x=1752380656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTfGXPyjwWbwYggXhGjVsZrke/lrobe8f9NW1l4bYM4=;
        b=H6xZlFRGMVVrq6Guttrz2ptxHT7TTauSZUwzuyOGp9uDdsJ6CMdU2lhAZaqCnCE4Mz
         NhIJBNkcHE60qXCJpnpetcOL4JWXiPk1ggLWfkgeqYPRQ9yNF8CWLcuqxoXHMtk0h8YQ
         89H30p61IVd0CUhiCv7jwmpDx3fb6nvxf5cUsR72/BiFb4XRnuK1dnVxsIPLRTOAqwZ0
         bmPgZ9k52yw6eqky1PDYaiNz8W1P65/l1gD5acZbaQDybt8y76no7DX1aG4TdoRqkJPj
         Q/3HMJwk+WH1QqaotP6xnMaiDeS+QBmIy15pVo3ts18ruU5CgWlw0lWJ8+0Vu78e74bs
         9Vmw==
X-Forwarded-Encrypted: i=1; AJvYcCWye+74y0ScLpmH77eL236RTN7JwDYiuZn9zjuYQ711Xq9cSaZoR9g072BW6U2WiEDXXMDKyLtzGuufV10ubEAy@lists.infradead.org
X-Gm-Message-State: AOJu0YxCcVUn5Pn2cOegT1QfDta8z+iyp789JMqPCR/HSoRyjSkbYomX
	68Dn/81P5UocQE7TlyoOBvbOZY+PgTUrXIIMhpfEapyUdlbsf3cCs7Rb
X-Gm-Gg: ASbGncuaW8e9s1VqQoMLcWsVUOzVV0oYbh4GuJONB+GCU6VOj2Gi0/u1hr9rREYBaZO
	KXPVq0TyShtHOpzM1gCPEQNDerA+nknGv6BX//r3PcqFH6UfeuGUrA1bL08i0DDxCpbrF2C4GQF
	4gPcngZ2MD8Ae2VycGxht6zJ7OYvLVVMbUfhCvu68FgHmUbIz9+NTVH0rZ+ZT6SF0HtRgg3WT2m
	p866G3oranXJfvEkdlCcFL8y5gicizSL5EvR9ac2mjhM7gftSXS/utIgeD6XXcckLuOSGexfNzG
	Mf7M2nFCkUuqBZ2JnWcLgS4OVmVM9rgMy/GUGlUsCCOt+FpO7NGrSKfn7qrXTz0PfKGLPfVt7wS
	t1pCwtZXtzmdceBHFXN+03yLQ8jDGVVW3t3xTonM=
X-Google-Smtp-Source: AGHT+IF18DUV/d88jcrhrYvIvU1ums7AXMfBmWhfxadJSu8r9gEGoO1K989AmSn7ygBQCoB15CKQnw==
X-Received: by 2002:a05:6a00:4b52:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-74ce5f5fc4cmr10057178b3a.4.1751775855713;
        Sat, 05 Jul 2025 21:24:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:15 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 4/9] ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
Date: Sat,  5 Jul 2025 21:23:54 -0700
Message-ID: <20250706042404.138128-5-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_212416_671047_EB5C3347 
X-CRM114-Status: GOOD (  15.07  )
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

From: Tao Ren <rentao.bupt@gmail.com>

Add facebook-bmc-flash-layout-128-data64.dts (with 64MB datastore) to be
used by Meta Network BMC platforms.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2 per Andrew's suggestion).

 .../facebook-bmc-flash-layout-128-data64.dtsi | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi
new file mode 100644
index 000000000000..efd92232cda2
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/*
+	 * u-boot partition: 896KB.
+	 */
+	u-boot@0 {
+		reg = <0x0 0xe0000>;
+		label = "u-boot";
+	};
+
+	/*
+	 * u-boot environment variables: 64KB.
+	 */
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x10000>;
+		label = "env";
+	};
+
+	/*
+	 * image metadata partition (64KB), used by Facebook internal
+	 * tools.
+	 */
+	image-meta@f0000 {
+		reg = <0xf0000 0x10000>;
+		label = "meta";
+	};
+
+	/*
+	 * FIT image: 63 MB.
+	 */
+	fit@100000 {
+		reg = <0x100000 0x3f00000>;
+		label = "fit";
+	};
+
+	/*
+	 * "data0" partition (64MB) is used by Facebook BMC platforms as
+	 * persistent data store.
+	 */
+	data0@4000000 {
+		reg = <0x4000000 0x4000000>;
+		label = "data0";
+	};
+
+	/*
+	 * Although the master partition can be created by enabling
+	 * MTD_PARTITIONED_MASTER option, below "flash0" partition is
+	 * explicitly created to avoid breaking legacy applications.
+	 */
+	flash0@0 {
+		reg = <0x0 0x8000000>;
+		label = "flash0";
+	};
+};
-- 
2.47.1


