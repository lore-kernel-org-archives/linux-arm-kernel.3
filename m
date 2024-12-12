Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F73E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUJZKl6ex9Y6tnVneUNF04HScPdq/LgCtN2B23fl+ms=; b=sbanXW0JQssfVE7k2nFhK005Z2
	tp1LqxeaNbW28/fJMUSJ/7mJpUHLWDNL2ZnkBykH7kZbsxYmyJU3/6ePwxvq/0iHyUmU3+XEdT4yV
	ow/jyG0HD6i1B8JdilHMdfsjui/uKq+DPW1fIIpluWsqu7SufLbNgWs96c/ohSrRoKpYbve6j7QU0
	vhuEdXoSmbemYSdmSjPCJsvpd+xgMpdcqfCozQrSXBG5qpXlxV5exQ5+7wwgV0r/bg2cMly3IQl9/
	hEmdEqMdl5O9Iej+DNZ0rHF1Ocm05c9QD0QJyYuGFdfrKFETGq1c5UNWtBSboVnf9MKrff6i1T8YN
	b96H6ISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmcT-000000016Gj-2HKV;
	Thu, 12 Dec 2024 17:04:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlcU-00000000s0s-3Iyu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:00:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3862a921123so547961f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734019253; x=1734624053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUJZKl6ex9Y6tnVneUNF04HScPdq/LgCtN2B23fl+ms=;
        b=JPr69Cwx7O5nVuECF2tcMlrS3MrYUGc8s46nKjjr57JwKmEmfORBbWaZ0gZLaNmK6Q
         I5Ntr+2OwPQBKNPt6U8FEiIgCPs5+BzpqnDYy5gXypx27pjFColqXEUbYkNyBBQ10mJl
         4mY2UCbXUal/hCADGsQx+jhMsrpWGJw7bNB6Syhbg5VFb1X1ukCgoQFL4o8nI7UKPsj4
         yS6CAljlFYPmNxGuYNbVJk4RG/TeLC88KxFfiMeRn8BeV+CJEC57ZWD2AId58xtuZvYH
         FewT3P3HnqNEsFonLuunXqEZ/I2lStJeawuL9da89CyD2zlccrpJzY9SF8Bxctoe/vVd
         x4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019253; x=1734624053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUJZKl6ex9Y6tnVneUNF04HScPdq/LgCtN2B23fl+ms=;
        b=rlPDIMAWVB1jm5qMCITctswyo0Vsiek/7NeSCfBBX/KfDrbtNzjLOSRZYc/JMMwLTH
         GGDtfB++E4hJdEKMrvWHMQX19uzPGn1KG9GgjZfJ1zoRPGkVQbxypEYNhrNLdmX1uLMu
         HgJq7WQt0LYTCI7Yv+MU15iPHdJh5mv7egdjGrY/01uxk7UoqjeLganhQ/2knDAKePwO
         b8mKAOLnsDLhPtUGMJQIMcL5q7gdw+fXl//J7ZF6btwqoiNaeMM595fNvJP9fh2sRCtB
         +1oKEZEL0tm3xHV1tALmk8RkJj+CXzsBe7JUt7WI+gGCHKBhUJsDrnZgAJMJzhDAxlqO
         R5Ag==
X-Gm-Message-State: AOJu0Yy8K+qO++jtc2V7pLbyKlaWOv+nAOL+2aEct4LWRm3t/YazG+ap
	o0yklVaKnq+hrExcEje1FTkPBpedl9hOtdNzIz36c5DIVoCLPzMBomB1ARDo3Ng=
X-Gm-Gg: ASbGncsiM+bcnGGLBsksR49QaPd/MyzGkZHxIx1EjsRgO1CmSC2Oq15INq32az2WhBG
	sLcyzKvEL0vJ7z68CptnPGQCNd4hrtv0DyGCygPLblffsd+IBPwBUCwGiVFRKWZN81uY8hp3h5Z
	lKW7OLivjDyU7dU1RpF42K9jgKV+jcT4lpynx2oFPXLfbw2aEWegMclqp3ktXmVo43WjgffRiXy
	KusJLg2qqWDmO+V7Gl/GUdd4oM1sYjGEgic9/aWqSMuh4BjooTxEhauVg0pIWDfOwG0EmG72xyW
	p3p6YNN6m9s1602e1s18oQbcrifOVDqVow==
X-Google-Smtp-Source: AGHT+IEN5nwnyUkAQMvO2q9jKMCm5xWXv8+YOzw7jcftLoAsAmmzmAcKvyZSzw3KzqJ0H/b/wrjw7w==
X-Received: by 2002:a05:6000:186b:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-387877c98ffmr3397430f8f.42.1734019251001;
        Thu, 12 Dec 2024 08:00:51 -0800 (PST)
Received: from ta2.c.googlers.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm4462941f8f.74.2024.12.12.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:00:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 12 Dec 2024 16:00:41 +0000
Subject: [PATCH v2 4/4] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-b4-acpm-v4-upstream-dts-v2-4-91b7a6f6d0b0@linaro.org>
References: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
In-Reply-To: <20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734019247; l=1030;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=/C7bHQrkgGdLprOLUDNL1QPrbsGLOKte0YUezSURupU=;
 b=q/qMWb3Eov9H0T2BHl7oTCrCuPXOj90JVrh0cjnd8k61RuCnu1AB8+Cevc0d3x4+b2BnG9tb0
 ExoRQa94+dQA0btBlEStNmn/o64BWNR7SWxVKOt/i78pqHEKVU8gpwT
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_080054_832515_188FFCBA 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..91139b1cf813 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1378,6 +1379,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y

-- 
2.47.0.338.g60cca15819-goog


