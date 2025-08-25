Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87A0CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jA+TakLrLswEnKzwE110Y/lnrwYFveR3hSJusF8B4Y8=; b=I+NfYmtt4ZNrteL48XAl9PDvpi
	X32/UpVZMR0N14TLedqvHO2pN0KkjiBjBH/yz2dgyeF+24hy0wQ3h7p9bsge1Th5dfvsb2r0X9ckI
	qmiRnjEGWIkQg2/znFFb5BPI7bG5y+uxvlSJhXPa2AJ2uTOwM3K2/H3qX1raIcVMovFs/mEgtQc7c
	Bf77iO1jRErz5tU2Jhj0nPp169SFzK7CQaLaqAMMiEFZ5qKwmgJxxWcyK9Us7M/UlROv2qeQuiIDN
	UYjyNbrym1W4k8FMsqrDPfNslEwHbTI3WzzH1GLSPw7yE7/zjGc4Uebwr7gHl20AxB34R4o8+Ck0g
	hoQuKe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNcn-00000006nCy-1zQp;
	Mon, 25 Aug 2025 03:12:01 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNN6-00000006lVv-1ZNJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:55:49 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4b134aa13f5so47907551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090547; x=1756695347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jA+TakLrLswEnKzwE110Y/lnrwYFveR3hSJusF8B4Y8=;
        b=X0vYUB3cSv/Za86sY7mk2Bn245Qd20bwJG/d8TdOmPo/hg5l6yDgz/o85U0i4clcEV
         lsP7gLngRyJju/4OXbx87MJcYEggfWwCc/vXyQTsqS1LBAciIs/Lt+DBo34ct14cdePR
         KmDShBofuNnmHJ2/g1bGuGTrvgTWjRYb1MW+1gASmh4CH/ONY9WBKvUg8LYsznPd5Wjk
         f+l3+OxKqUe5jClIGcL4IUpJWEa82kQhPCbELl/lw3iz4O42mDC9hDX2YGfBqgGhufWN
         leMzfZ1DUJwUt2ckchfOgct1zegkhQ1spDOVhUR841YygNzZF05sQGHhqnUXDTqEfi0Z
         CpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090547; x=1756695347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA+TakLrLswEnKzwE110Y/lnrwYFveR3hSJusF8B4Y8=;
        b=NJgM47KUIutnnIfPhM60SZ+DII2CaKKBS3z/8qJViIlZLzPuYmsLVjYAVrdqRjYn9S
         Gfo93E0tEcgAjPNRRuyxlL7v5f9884KdnWB/s5BxlhoMGi5yWELFtXdgX4wQccqLs0eE
         Z7KFQBq7xgUBt5aB7tGLNlViiCvHnAk8OroO8voQoOkOcXyBwp5szr/ppw1JwwRozU0g
         kuMZj4WymyjaMl77ncFhxyNX1tQcippZBAzHsLuRMKy+dM4Cm2fGshOFxCswkGsEDhfE
         gs4l36sE5OuoramyqLe8M4ibi96zwWuIExoDJnHeUIOBLeh3zfPiOR+eu9k7O/xdqSh6
         VVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuhcoiPf9rJaTMdobAamQknqZ3+f3UAoQAsnhH0so56rzTlSeZSbbM3PqtCOUb64z4Zm5wRxxxvsHhHYK0Vhsv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0/BXi7VdzjsOWbYG5IRxNWt3eynMUcZUBqx9zw4gkVEjExdTt
	jrYYfszjuvbKD9Ql6/yJ9SyOn6Ji+rmX0YuMm0Qwcb+Z2eknVQtaflio
X-Gm-Gg: ASbGncvOsgNjiNx+hZp1VASw2i/VFmVP/b3voO2JDjKXOVrH7YHrLesX4ze/Y95Xktp
	PsxeJOMWRTdzXAtCjEC4KSA3FBbUcoSV9cW7pTUGyEwbtp7jMHWqllG73NPV7zd22w2sn7jfWa0
	K4skgtaqRaqk26Zsf3Isu80ALXb0mmVP375yPQbM/uwRHENIP9BzRc5bpBpHczJcf83WOcvGUVd
	GDmmyP3WmULTy7POleYskB3/WHVZ1zUdeIDfp+yNaWvbtj6JwUmu4joyRP/LDRtb/YEhGLXbEMi
	wn/2rNItldNlw9EY0FvVMVLwNht7oaHfnYOpf0zqaNY0cr3WRAbxerNijKl/raxWRInuyrgAO6U
	AgvlsCmX5RSLxXJBAlOoyXMF957oRrYsjGAUyXkb/
X-Google-Smtp-Source: AGHT+IEB8LkkByxeP/0D4VTkMH4oK9VBbuXh8LA9IpI7gs0m3mH8S9zuIgZKyx+m/BIIs1mN7idqkQ==
X-Received: by 2002:ac8:5fc2:0:b0:4b2:8ac4:ef5e with SMTP id d75a77b69052e-4b2aab06886mr107045661cf.65.1756090547250;
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 02:55:45 +0000
Subject: [PATCH v3 3/4] clk: samsung: exynos990: update CLK_NR_TOP for new
 IDs clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v3-3-8838641432dc@gmail.com>
References: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
In-Reply-To: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=795;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=2df2g9IN7oOC0sfykEjTkphnVetjockwFMLZy2LuxV4=;
 b=A/yVUUiKRVePKRaqXd47r5mm5InUjJcPlyuKZkCSUCkmKBB+9bujb4/eGiMGtpAzfM0nWZ6Ts
 ga2ux8v2jrpBIdllASi2JEYnDzBb7vl1f/5qwbKFRQmYdec4bdzpisJ
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_195548_417284_78AED07F 
X-CRM114-Status: GOOD (  13.01  )
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

The new clock IDs have been added and put last,
it is necessary to change.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 105ba0363..59b05ea55 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -17,7 +17,7 @@
 #include "clk-pll.h"
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
+#define CLKS_NR_TOP (CLK_DOUT_CMU_CMUREF + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
 

-- 
2.50.1


