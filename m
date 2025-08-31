Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69304CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s3qXwIOFHOBVJZsU4pjXdZDp9jSucFH0f3d5lu2OlG4=; b=AmA6IPfmcYY11i
	RuDg8fIeozERTbQb+J5qHgi4dbUMyQRBuzoSb+WiHI6+wNpR83dHtV1IF0/HkUYG1c8PcsCuXvQ3B
	gnoaRUeZIn/3LmHsuAFJaew/viNNVgbxfloRnGsEI+HUuFQ5Ac+GHYnYBUR5FXe2CBP7938zPpBN4
	HR+/ZFbAu0KOPDc1COKU+JHKwDR/bC7t85TIbvP276IfIqcNwgFCz/r+kizzxP8bsAb8ymEs2zcb9
	2mwMlR1fT224ha2Uzho0bJoWJkQDpjVgLJ+suAhnyq3PJ2oCHpLp125s1DlXUYUJ58UfuDdpjIzdG
	SNKx8PO+dQNFzlOxH8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgya-0000000A94d-2lun;
	Sun, 31 Aug 2025 12:16:04 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usgvs-0000000A8ko-43ph
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 12:13:18 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-70ba7aa131fso38830056d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 05:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756642396; x=1757247196; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s3qXwIOFHOBVJZsU4pjXdZDp9jSucFH0f3d5lu2OlG4=;
        b=fIjMaDRPOrgZc05Yhye7TGYwxkn3vttXqT9YuT4qZjGKuun1j92liDvGROxHK0aHcl
         FOSJjcmsXZR60aRJr2VultPn/A0FXqAMuvnyUtx05i80A6Jw1kmHqid0v2IE5RygZY4A
         UjDbHvfiHbKViJXAU74a+kNolf4qDx4B3SvWz9VseQGf9kIpUiTY/htnZASLVNdd6qat
         +7ZrooRdgp1zMuSXbTmOdrKa0LamX6q/pAjH9H9t6mS0hzGzCrCDOhQxXWbGLN+9llao
         /LBhZaHgDrRNGREsgKZrD155eNpbw35K0rJ1zcBbPShia7dHatotDwRxr6JDfCsjzrrt
         AyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642396; x=1757247196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3qXwIOFHOBVJZsU4pjXdZDp9jSucFH0f3d5lu2OlG4=;
        b=uv0mX2FAvg/SUwTSW+9bgvySD09xSy+FYNhT9HmLfuFOxcL8/12ENyzgkuYa79ztY+
         uNLlSKoM4WX3Svm767ZqwTg+l8G8b0RD3w7R3A2fG6aadjkOMiyfWnPL9gkDu0P3eFbs
         7ruRA632fJNGFJCm5pOpjnZpmhL3R8YBF7gkmVkEzprxJhKHCuTg9ctGA9Dt/mCT9c/a
         EgMrRcx7IHXwfRF20qxM+Wp/uMyoGH3udY0A5Nsl4bPZ570XxzW3wSMjoImXYETas6VQ
         bCz3pe8WxlgNjB0H7xiO8udvy/+JuyRgpbeq14qA2IVS1OJfQVkRGdhknsDDGrJOauOb
         l/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUpEdFxg60qL+9FHORkEo1MAvOZH7r3xKCG5pbvR0nrYD6kI3LnOULhbWTiUDG6vRpN1SoD2vEen9Det7wpoSTE@lists.infradead.org
X-Gm-Message-State: AOJu0YwYd/XQnVLrfDw0GtqNQTuNeQ6btpDWm2AF2m6XGH9awIembyug
	l19KAQwYvVkOUWKZ2Ar6Pefxvxmc66TV3KyCrpR4RM+PzJY71BiwqvXNbHbzXdV/11g=
X-Gm-Gg: ASbGncvJCWWCUFs/oEfnx3tFF0aot+lBGWgOfJJfrsExZAMa3xjkolGQItT7C7faMt4
	Fd+p50TeV7ZOz62XJCnK6ih1tyNHdBy3ekzC4ave10LJiPBXscospzWm7nokz6vdU4DWpAPMDaC
	2Lqyx4kaJCWVBSDMaw2FMwrDRSNr5CFAjd4RUr5ZAHTuXBGwdoKFFdTIFAV0/WYVccMD2HPksxV
	paPUjy1ogtm56IDi83fY8kliPcAM8l7TarpkFpF54yvC/AXeehqS5wYBVACT/dsrJhkWf3M83uL
	hCFZeok2JqsEV7pJHuThEa3uKyEPgH3zrBWNn7aaWFUslG4nDFLPkDmsC/zxLw8pDO0HjTF6mJJ
	sOCMufJqBxTxyUKfeA1wp8L/RHvfWzdJhXShZbOk6CA==
X-Google-Smtp-Source: AGHT+IEcejfsOll0uj/k+IQ92YJQY6CEW950O4QMdMtE2aAH5qbhTjPSF7OjZma48BPPr9XkxVIrWQ==
X-Received: by 2002:a05:6214:622:b0:711:9196:adc5 with SMTP id 6a1803df08f44-7119196ae49mr32548776d6.47.1756642395693;
        Sun, 31 Aug 2025 05:13:15 -0700 (PDT)
Received: from [127.0.0.1] ([135.237.130.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70fb289f518sm21163776d6.56.2025.08.31.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:13:15 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/3] clk: samsung: exynos990: Fix USB clock support
Date: Sun, 31 Aug 2025 12:13:13 +0000
Message-Id: <20250831-usb-v2-0-00b9c0559733@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFk8tGgC/zWMQQ7CIBBFr9LMWsxAg1ZX3sN0gTC0k9hiQImm4
 e4iicv389/bIFFkSnDuNoiUOXFYK6hdB3Y260SCXWVQqDQOPYpXugk7uF4rrx2dPNTnI5Lnd6t
 cx8ozp2eInxbN8rf+fdn8LAUKVGQ1GY0HdbxMi+H73oYFxlLKFyLvon+WAAAA
X-Change-ID: 20250830-usb-c8d352f5de9f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756642395; l=1070;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=fuxHW4rePv9EsV3Tpzc5KQNt5HrwUJa1W4L1YzEvEwM=;
 b=2qNTorBIv+2AfSMWxkIugjFdXaCRccVnUwZK9qE3D7n969WZLJ42l1NR/OE0nOTECUgx4J2wT
 HfMs92BHwp8B2k+AARMqQpuiaEV+2CMSQvl5PfIgP+CwXgfGKMQX9aE
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_051317_008511_A037271E 
X-CRM114-Status: GOOD (  10.48  )
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

Hi,

Small fixes for Exynos990 HSI0 USB clocks:

Add missing LHS_ACEL clock ID and implementation, plus two missing
USB clock registers. Without these, USB connections fail with errors
like device descriptor read timeouts and address response issues.

These changes ensure proper USB operation by adding critical missing
clock definitions.

Denzeel Oliva

Changes in v2:
- Removed fixes tags and stable Cc

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      clk: samsung: exynos990: Add missing USB clock registers to HSI0

 drivers/clk/samsung/clk-exynos990.c           | 8 +++++++-
 include/dt-bindings/clock/samsung,exynos990.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)
---
base-commit: e0edfc39b62e35dfb6d669b1189fa268147345ef
change-id: 20250830-usb-c8d352f5de9f

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


