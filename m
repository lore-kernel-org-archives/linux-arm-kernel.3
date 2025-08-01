Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA491C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=; b=UWfxEjyKe3yi2ZI3xKK6csZTnf
	BgS9gkOwUNXuUrcS5mppejK9/pIWE56UDOgIyIva3GHSZ3x5YAkHORvejDRyjt3+caWZb9bo2vH9J
	a0RJPOlu9kRAc4AAffewJqYSlhgoOB4G8aCBgukuleHF3BVVu7A6+aXzHTC1QzMrsxhx8cJGf52yX
	zxPXC8yX7iFnbLhvhTJJd7R95Ck5w/zCIIb6TEOdE4hdTX+m3l35k09RK+HIE0vDCAmAZipC9lXtG
	mUUVDn17AsnxTXDtTjkV5nuxtJVhL9ZjdNyWR5tT3puEqCf9wOv9CgmxvweuiYPDL4j9ThaeSzB/a
	pwkeRj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlMU-00000005H7A-1fbk;
	Fri, 01 Aug 2025 08:43:34 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl2v-00000005Esr-3pKH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 08:23:23 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1191090a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 01:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754036601; x=1754641401; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=ZJ1S9MaCZxkibZKHX7OzERy/Lw0OoAU3i9TYe3cClumc4sy7ZSmC8Uqjsljfwbd0ch
         IQkV6ufA5jypPXPw9MhpgJzMMIiVyUcGtob4zKd2pJQ9jiZxiwDDlagCZNUtWqYzH4/5
         k/76rGDEz75Hr55K+pr+tqZob8iD40pKJhO2g3lYSqeFwnle4Hq0VnK//StLlFG20A8g
         oAlXImi5n59pMiyHIK1dW/hpDmnL9AaGHwHTNpkn+ydeOzV2WVUxB+b48A5HcSIqyBVN
         rv25WE/lP+TkDHe8DyvWGbf9lOpyDMo+6SMMIpBKnSTPhFoUO8QABDkqhjgigYF1DSNN
         t/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036601; x=1754641401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrW+x1kwa+TliZEBde/ju7PT5X6BHW9feGK4JCdzymE=;
        b=kC08OzUlg8LV3rI4A4kc5o0AK3vmrr3zjPSSx/CtY6zGCGilUb3y4c/Jk+XyHua/LI
         IIZie7gWW0Bi2YgXSKaQWY3JU9byEZWVvtdQ33nxQPAVgVBUAMfJSLeVYTORvlcEMG8m
         4co4vpW3w+h3GglMiBlTbjxFzwFAIeqLo7Ts0R6vU0es7vhph9UCK6NI5IPchoNcv41x
         VI2gv2roNIb6DeBKM7GdEdJsUbu7RbcuCuFWg5QE85i1/A5s0WbgCfqKswFKQASqdVA2
         o2mgCiNInQ9UcCt+mfGse21IZnbs7bLZFBPw4WfAdsbRdaW4/XH6J/w+PYtSAwQ/FEPf
         P+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdO+8gn67PhlkP3i4zrqTz1bkTxvluOySGxpO6v/GtQRRfJKMDUF8/jJLXGqw/kM7LB1DX+0y+EfZuObnAOPnG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ERcbZgYsIbekujduzRdYwl2eGar8nsGAt9TC4jmacdMeTxd0
	1BSdhmEOn+4ad2YMxv0SCZOoY7V6HrwwW7tkK8wPbhb1MNuuKQ9SyaDb
X-Gm-Gg: ASbGncvMv3a5gPheH7l0Isw/QTc29Rh6SZDAwBcEdzq4fVlcaMNOoL5dgq84hmvVjmZ
	luIZxC92224hLeT/PGDnzq0Zocmi1+isn1re2bi7yAaxtMoPXpTcB3oeY5CgyB5WoNHlhN7vPuh
	G8KOXdkYoH+/4vZ1ENMkrWVJTZAfAFiYUxQS/jYLmIAfyGKbR+Nf9/uXUrhI3Q73iKplqzZVuI3
	Mz2xMAcTd1UyQczuKYZNeLvSJVYVhQghk8KgQFEXpcVNtYJtCG4lIhFBAltaptIPQPrw/Gkn0Mg
	jhhxHhvvt1+vGvixPURvA0IvLwgLn+dG9IB4iQrVw2/R2YXaHjHxk3V/bY0oGnoLgTAscV7oIA8
	D0eaNbljZJfCEvEVI6k/wEVWxhwq2nlDdIiT1xA+glORNLG3mcugDRv/MGYS+hfwnBKM=
X-Google-Smtp-Source: AGHT+IGiIL2eH39WyYmfW50peWzdYWtx0H5u++yPtj2JON83tXPpf3wufQnRVFpTduqX8zM5mjgdBw==
X-Received: by 2002:a17:90b:388a:b0:31e:f193:1822 with SMTP id 98e67ed59e1d1-31f5de4a5aamr16005459a91.28.1754036601052;
        Fri, 01 Aug 2025 01:23:21 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a850417sm3992725a91.35.2025.08.01.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:23:20 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Fri, 01 Aug 2025 16:22:49 +0800
Subject: [PATCH v10 2/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-add-support-for-meta-clemente-bmc-v10-2-c1c27082583d@fii-foxconn.com>
References: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
In-Reply-To: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754036588; l=992;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=0XkYbizVBKY9WI9Q/nF7gZY7Z8IkaJEB3NQ1RTG/C8M=;
 b=yT4zUHaZRPVLgHM5/hrcwMugrlznwdbZhwsee67hhcUXifJSdMZLLxnZUJ4mD0vXlcKfTLteO
 f/3PIDkjuklAKPVwCn+AUPDVPBhMj6vPhHZK3iE/k848ZOE/ZZexxd/
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_012321_956899_F3454BEE 
X-CRM114-Status: GOOD (  11.70  )
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


