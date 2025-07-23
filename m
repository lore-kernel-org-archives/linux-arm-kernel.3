Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEDFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 03:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/eos1Iv+JJoIEFFCBL+Da2J2v0o9eRaLw9+DKJIo1Q=; b=QIAsKCtpS1dq51s97TEdyC0Nk5
	IyOZo2TU5LvKUAA5AdF17b2eAt+dNNp8eV8SgL8e11JIN/KjnCNFHEqQ6wR4+uJ77gSXIfZ/lw/4i
	ILO7KoJgvPWhzVx9XEdTc/7bbtWUdhdEfKSKcXzgOleGbFChGZW540i9+MJyrBRQXSgg8qIjMlS34
	g2vvvlcFepT4z7Q5n+4D8inDA/2SR1E1/lbj9G6N2vVJp4EU6PGR87DLZGKqcnZFE7M/nvFiJoU/M
	1Ja69yKcK6IEFqLwrS/JGKfX78Hwd8Fh2a2iE6bpze4+FY0emlB73U/Da1vnqyErUWxsuB8pLI0zS
	HxkhPcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQXZ-00000003weA-1LDP;
	Wed, 23 Jul 2025 03:53:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQNn-00000003vR8-24Io
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:43:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23dea2e01e4so75570315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 20:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753242187; x=1753846987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/eos1Iv+JJoIEFFCBL+Da2J2v0o9eRaLw9+DKJIo1Q=;
        b=INcGNegsK+UGbLyvGEEDL5ZblhTtTKb30yx+erMZIqLJVCZqOSm5N9bku/TBe2lxNJ
         ohS/EZwEu2iFUCfHHEc8MMuiDqEDKSMGmF9xkBXgjqRhDD8vS1jjGhjyL8Ih7tmQex6U
         ECq0+Z1jbdsqmdti32aJZ74NzDb6QAz9rAtpRHzZ9jnnXP8QOYBHUl0MEwKEqBh+N5Dy
         FsYBArWKCcMpIdatulYZrmRtH1MUTx5Ue7YoQKQrjR6saCiBRBUUbyPpfU31Kawc0oVd
         jaT8biMNdblP0Ycy8xvkOw6TVTk/1ujnqEjsATfTQ1DiKw5LkNl3VhBX/A0Ij+I3pkn1
         OJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753242187; x=1753846987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/eos1Iv+JJoIEFFCBL+Da2J2v0o9eRaLw9+DKJIo1Q=;
        b=Imf9jsJMFhZAKW0A0TguzIri77oodT8eFdXY7zsjXU18S+3Wuy6RpvuiBMH9klho93
         Geseb4YG2FRjXMA+daGu/kRzG63lQ4JpVtDmcCyuCu1uaO2J7g6yCtlWTwOpQQIOrZyV
         ona0QanVXQoDuI/IvBfIekjq+7cnGj+Nn2VxriC5sLvoZN8xq55jckwiasrjzNGZ35hF
         2/fod3eDGk07qPiSa638x1lXjc+f2rQq8IE15+BN8KdhkYS7IucTMcAQBL6syRffnlxj
         K+p5XRYselUu5cSlgKfiwicTZng4vKyColpmsXAsiM5iF/uXmvkOcIXQtAwFjdEYp+4c
         mR6g==
X-Forwarded-Encrypted: i=1; AJvYcCVuvdhdoERn+wzq5lzb37WbYZ/CiFj/8shLvRYqqFnx6Sz3lc1oz1y7Q0pzAaSJ+W1qWnMprz8Enphlq5cz7Nmx@lists.infradead.org
X-Gm-Message-State: AOJu0YyesMgC9CFirBMD3+sX+zPR4I2X7c2izoX8L3lepP6rJXnzTV9u
	QW01ZQSYzACG+mUBWgM/DZoNu8PC0LzUdPfjXFyu5Er+Z3zsLDMGrax6
X-Gm-Gg: ASbGnctACfUEm968MIidLbthAHJFAcqvSMkS+9X0Pn8ICRkjcdyaljVfJWFvy/Up09g
	18WzZu2H6pz7AhHw/5N4NRusNrHCx8rRqjV5bJ3KAdfgyyrUFsorH0fy5DJmwzg6CJsvskuUi0N
	AdBlIz3u98k6e1orQ+CG4uF9SA0E6IEp7X06XQBfq2NZd4JFtJIqsUGGum+aZryV8nogWmjQKJO
	SpWCClq7BHZ3qQMfQr1vBW1yssUBfQHAYX0Og5XBnTUkIUAPXhQGad32IXtE0O8w77biHOghDxC
	eC+WmjhbBNm+WrplhJtTq3VX6/Au1ssXQTT6IAt/mryrsPX4OIgcfbqY2XJVva6FMjoEbpl0RLv
	VByRTnRLIJ9F9XgVWq8AX21SdUl7StAPxid7BtEwiHFXdWxCTsGAcK2U9+YeAIJrH42g=
X-Google-Smtp-Source: AGHT+IFUs+bNPR/ApG847/dcTAVEW96jKv4IioRlAvKP8jVS3JRjCWVIBr79jzQ0RqfNHkVXPiEhNw==
X-Received: by 2002:a17:903:946:b0:235:27b6:a891 with SMTP id d9443c01a7336-23f981a83c9mr17116365ad.28.1753242186685;
        Tue, 22 Jul 2025 20:43:06 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d47sm86197605ad.99.2025.07.22.20.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 20:43:06 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Wed, 23 Jul 2025 11:42:42 +0800
Subject: [PATCH v9 3/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
References: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753242171; l=998;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=hi/PAdJ6bxER/R9rOhwjyW/uXI7cI32IlUrsv9ex63I=;
 b=kihku6zIwBO0LFNgqF1bX/J2ndiQu/2V21i0gTYkTS71k8iN52bF0HnmmT0NL6p8te3NQezO7
 BoSboi3lRPaC1P0FHR6xTZ2l5RtNyQzpo80y8WTx2j+I5p6SpBr0JhM
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_204307_541538_6CD9ECC5 
X-CRM114-Status: GOOD (  11.65  )
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

Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
description, enabling support for RMII3 and RMII4 interfaces.

Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
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


