Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B8DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=; b=IIXF79i8gdVdcXrm3Ir0f3567Q
	2fnFRkXGlFL2mN02GskZkFJ0oBz2uWT1F1IGWiQHuG9Ra0PSY6jhdFdBMatEW+gS9GqEQGRJj4ZH2
	QWsrm5088A3FEDRr3sjDWCPcrjXGZVwJyDaTO7f9p18lC+zQfCypXOfcxI2KPv5dsIL1DfsxKQxli
	9DssD4fW49CVsoRe988DFN8E7dX0KjcZ6ZBqBU7B4BEjnC/kwFhtvYxrzMHMaCZ4Dx6FRFwFH+oAu
	Ul7Zw99UA1m+wJdrHJRevruwjh/I4zepEj+SrMqCiU+iD6icG+KHxFZjTpFZbeA0rX8fUGhJPECD/
	Hkkd+ITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2BIV-00000004i5l-29l5;
	Tue, 08 Apr 2025 15:55:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6P-00000004fpq-2u2J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:43:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so38941075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126984; x=1744731784; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=;
        b=QkaQ/s7AHNO1b2MG2F9XT955sRwMAmcBUGPLj4LGMl+nAb4EdfhAo85g96MLHwp1H2
         ncUs/mExXePLjOsBKzt7gNKU6Gwez5T19+h/LEpvx2CrG56on88/SKVoh1kzbenzeCUP
         YVfNERBYd7M6uqgIVZurB6jD+5ZORcNanbuVjU8WTCGoVm+bp0oDE1BEGkICGOWpUdMq
         LlRzlzjqj9JrtqOHCc2oJ+Y8t+2IVzm7cJ43+xCxXU2b7t3RPDUkEcQ/YYlbKy//d+um
         Ibaw/l96HCdpHtFXwhJK3jhdxr1mDDBKn3KXsYziLLeQ778OGFNX5qRI6XV4cud9EJoo
         Wn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126984; x=1744731784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=;
        b=LhO6eavJT5bN+w4+k3nl3NWAoh43CtSKamgGqIDlZdp1qchlXTXITemYugErH/tmnh
         IGR8GBNMfnzb++5gKHECItAbWbQKSE9aN3y/vBNsO3/+cBUifIX/pBxfCqierYlVUTEw
         izlyCEXjBTRB0uRPnha3S4Czj0euIWe+wdX9cRGPgPi5i0VRh2MlInOdqFfNkom3gh21
         UHuy/ftTnrjuYyamOxx1voKnmShffmp6sar9OZAI2o0Fq/IENEAY2PZY/KBC8OdtZlxr
         kdvPOyPK/uqVUL5vSlqt0BV5D79gRWhs/4OdgaUkPxynbBuKZLhY0AmCCemkYRXLht88
         K1ug==
X-Forwarded-Encrypted: i=1; AJvYcCUCpBzR3ZD+F3sH4Ct9yFsTxcJqle/pDJo3EZC+ELQpgnXpbceK9PkgoOY3tDxF5tjl9T05TBl2frlFH1HWGI1R@lists.infradead.org
X-Gm-Message-State: AOJu0YyTd574L8QB0KKN3jK/O+ukMRHNWcsqmeb66EBGWe4TQZeXvo4x
	uaY3sI5rNxXi39Y7yGf4t1impO4be00pcBE4kIKHqIy+dPsW6Gq0
X-Gm-Gg: ASbGnctQ5oqS+foXWXt19tj07XDGfNpavQQoH3Cv0M/FUn+LNe8Izb003MLcN4xb04t
	fB+N0OkEaXP/2ZPx9C+qvNUohxuKoSDathIrSMac50o3xcRrvHA7SmoHYzFE1KW796UyCmYfzpU
	Pm97cFKSKrYC6sUIiN6KoGJlcMQlXrcrsyImDgLynZGz9r1G20t7XffZIURtwLogoyRKgeM1JDc
	ne6/pfDzfacQ5z7EWTEtqVrHO1Atg7R18Xuf/EDF2mzAeVTfuAGcmerGhI2L5RdYNE5I15cQ0q/
	a4Bwj7gsswWV+GJayU8YyuQlMOJt8QvCbFQW7Y6MaEf4lySLA1Iigc2do1qcwbyA7eOPvDiINbB
	IXvDLb2Y=
X-Google-Smtp-Source: AGHT+IH2pIjwLHd99OaOkEDJZzV3BxzBXMBL7iQPz/Uj8BamXLBLhgF6w37q7JaR9mEFlWaWbAKHNw==
X-Received: by 2002:a05:600c:3489:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43ee0617025mr127689295e9.7.1744126983675;
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  8 Apr 2025 11:42:36 -0400
Message-Id: <20250408154236.49421-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084305_730499_E2D5B77B 
X-CRM114-Status: GOOD (  12.22  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..f0f0ff5edea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


