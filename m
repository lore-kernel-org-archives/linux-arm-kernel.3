Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE87E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=; b=XFt+6zZZ4Pi1BNaBIFMUkI2OMk
	7/5vNY2MkAzbHFWYgRQK73W1l5Gi7gs1UWumV1g5t5kciZ/USX7Hk6a0d2jX/lBLX3EiVKM7uRphs
	pHVmPf0XIGRvgRPrEOPOBfv9kNEdpQ7NkxemgzmQ3ssfmc2sDhtGFm27gOReRVQKu7x/Z1Hxybbz1
	AMUIqd1/5gz5F22NqyYmRd1gMZLlMM/NhPCTtS+n6massjw+4zuxKhM2TkuP6M0AzrQfyDEY2NKOj
	mOsZUYqjuPc0qcE1gbx+H6mvxT9PyWtTguQhsm4bZHUAyfaQh05mm5nQ3uzj7D4kPSLSoAtDb+UAq
	jv2AMHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTypX-0000000EfQm-0vhL;
	Sat, 04 Jan 2025 07:44:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTym5-0000000Eeyd-3oOj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 07:40:46 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-218c8aca5f1so228763965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976445; x=1736581245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=;
        b=D9xqgGEgtaKBp5R2GVDtlhUZvSD+7pXIUXsdiTuMWp6rbmUHrvigI3N0RFq43NPCU2
         Q96R3MAx3U2zz0Dy//5E7wf2htql0Aj2pFNe98sDy1NmitYwUKC5P3wnzK/UarPWCTTP
         vEhjqhrSPToNkAEoAilOafWcvRKMvTb+SQObc8vhJU1+XsmX8l7o4Yfqyfu/RvzNPJeI
         IhekfHYxi8g3n2Z4IBv9CViwx3qWAn1+j/Igd8hI6++duCADlV+TWOMF+RbwAlBrWj/w
         zlRlhdnIqpScnRcV/zzwkSQ5wg4svKSlS785iHHLpJSyb6D7Ae5qz2vga8sSM7bj4tNS
         iyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976445; x=1736581245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=;
        b=fMMi4JypEDxdzqWgAOctBcZ/+qQd0yNGTxgObyCBQ9jS2ibbnvkrCef6jRT5GYbm0R
         YqqPPOtaqj6VvglPVSEYn4TT0NC6A1JXqu2WPzWlra+iyezVQYc2sLdHv8ZTlUHWQ4s3
         yFMp+zOR7dI3qZB7UJ0EfoquvrzNXu5LJa8mIbMeYU5OQMA2Mp2J41kPFGT97jpFhJbE
         1zsCTH88odCsSoHXQPfttCSkjsKOHuhEZmAxrLsFW6yesvq7CJVMRZYBl9ZQezFrDJs4
         q8UZVe51DQxrzPwNcFDUZTI9HevZvAAVOcQ7MehpkGqVJs3W6mvi0xgncUardSqNeRwB
         stbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/b3CuKA8IzTfgsICc17uNuLQPvm8wDZcd4rB2C966qoW5UfUqBKO8a+Qdq8APtWtD6uWnPVHtZMKfa5XFX+Yf@lists.infradead.org
X-Gm-Message-State: AOJu0YwYu6F4+vq+PSp7pGs9dEllKqN75AIDLgIa9Sj7MKQxDtqnzafE
	Q8thTaZa6eNTOf5bgnzM+Fm9uqd0rxeeb5RL0IMRKuYTyC/f3Y2e
X-Gm-Gg: ASbGncsmNMfNNnN37HbXelhqWh57pfj+2KCtVtp+jgc4ienmWox8x3jCEhvG0srz43n
	euqZXQ9c0mys+451lAO01x3DrJrWNvIrV+s40ZvoUPGp+TMsDKzpfkrRnoZ0wlp1e3PVCq3ihbU
	+Y9dL57l1uCWZa+mjPGvF3fH15ihfCbP4b2iMRxOERXoAI6bzdi55GthzG5mudqWza6X6McNVpK
	NXbWjYmCj5+FQAYJYGzUF7bNh+aOkqw4VfmvtniOxgz+z5z5A==
X-Google-Smtp-Source: AGHT+IG0CS21q53dEVGA2oPLK2te0e5w/JAMFEKzZxo/+YczSEWdTkdKuJD2Fisbi6FzS2oAnAex1Q==
X-Received: by 2002:a17:903:32d0:b0:216:6c77:7bbb with SMTP id d9443c01a7336-219e6e9fb45mr689469915ad.17.1735976444999;
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 2/4] clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
Date: Fri,  3 Jan 2025 23:36:58 -0800
Message-ID: <20250104074035.1611136-3-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_234045_945519_D4036440 
X-CRM114-Status: GOOD (  11.09  )
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

Drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL.MIPI. These are now
defined in dt-bindings/clock/sun50i-a64-ccu.h

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on pinephone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index a8c11c0b4e06..dfba88a5ad0f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -21,7 +21,6 @@
 
 /* PLL_VIDEO0 exported for HDMI PHY */
 
-#define CLK_PLL_VIDEO0_2X		8
 #define CLK_PLL_VE			9
 #define CLK_PLL_DDR0			10
 
@@ -32,7 +31,6 @@
 #define CLK_PLL_PERIPH1_2X		14
 #define CLK_PLL_VIDEO1			15
 #define CLK_PLL_GPU			16
-#define CLK_PLL_MIPI			17
 #define CLK_PLL_HSIC			18
 #define CLK_PLL_DE			19
 #define CLK_PLL_DDR1			20
-- 
2.47.1


