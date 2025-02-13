Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EAAC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXickYQ5xAEYt94NMMMnFRp+aeEMQkVX/WoesWHUNR0=; b=f/c8wIacDpUqyWRVF0B0jL6Y/f
	+F3G4dGUIZg5v7Ib5yBk+F8t24+jMklY46JJTmMFkUiI8SRHuH6jIJSNkJEuVuBK72NSgLoFSuEmk
	8CSkFuSuigdzd4fUIRHsM//m5bfbmIbIOJ3KHSsCDtvlj/plytL1XJiKmuVgRagqwRBGmCo+QbiYe
	0sEx2SEbid0wUXr2/BEtHxI6weY8IpoJETg1MHH6VzK4rHNZDDuroUtA/80sq0jiw4fAeuaovRnM7
	dz9xTuP7jXZ3GaWxDscC2N6lxKe6STmQhAw16BScKXwGjcWhZc2QWjRELVeeZrXOjFOK9x1zZHPe6
	huZq70sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1P-0000000CZQq-0v6T;
	Thu, 13 Feb 2025 20:41:19 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqw-0000000CDES-3FBt;
	Thu, 13 Feb 2025 18:22:23 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so391367a12.0;
        Thu, 13 Feb 2025 10:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470941; x=1740075741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXickYQ5xAEYt94NMMMnFRp+aeEMQkVX/WoesWHUNR0=;
        b=Mix2zqwUtCknl/vVmh3D+HOeVblZASiECf3+/7pVNfIpZI/g+rEqFbbv6f1DVWLahe
         Y5/NeR4eNUgtRSFsBl/UosI0BZLrcA0VGNFXK0alP3x1iSYq3JnbYW2oRmYAuNtXHB37
         WAq4cL+WzY+le+N3sULLbHqKmUSZJC1otcuv1E2rooOrH6wSiDLHcxNTR1P5ga7/8C+O
         CjOwcTGytxmlBi6CWZLSNuxnqwLM/2fsWzpfWMumxNm7sR1/YbsTf5On60G4eqMNDtW8
         ArhjoVCmmN6rHdtBGVtvpE4FJnFBGCtxbV3Dh09Ero+DxMGFqH0ne69G4u1Q4fRT0i0H
         q2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470941; x=1740075741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXickYQ5xAEYt94NMMMnFRp+aeEMQkVX/WoesWHUNR0=;
        b=JTgeMXriL9ugrYu+V4e6pve4c6vglUxKLZiNFiYzgTULJmkJzS5glzcyvWpVUAUDmS
         c13Sdmupsgk7cruam0APyk5JDNUoD03UW6iIz+c061eTNY23Qqo23JWYPo21mgSz17ms
         aIhWWvAZcxG4MYlg8qodkJzo0S/LfqoqyIbcbD6NmfUvIA31aSHUDy/TzfXmvCjFXHrl
         z9+EBZ9Ac4/YtIlzJIEhEAb0pQBoHmAnTxAsuy9YEoOx8JgBtM1nLasSyZ9Fll5gj0Ca
         qyV+AvjNcy8/mivVrO/qubZvzTun8x+hIOM2fy2NXmZP7b7y9SXE9aYWerSoPTMdIB7R
         /daw==
X-Forwarded-Encrypted: i=1; AJvYcCWmLoZiSoEa2eqTBUSfTAP+LL3t5AxpEC5Xz2Q2tAIk2MXa91ec2a4f2/10HinE0susWU5rqMK0zKdFn0lcVtnp@lists.infradead.org, AJvYcCXEs6r9xBHTvDYrK2jj0ovx+uAVZIgDy86pXfAl0QO1ajQpFir2qXciJw1ppXyrhXT3rwk6oubxDwbevvA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlFTHGn5Z4w4ahguczKP8UWKl7vW+P9sKZ+eIVdMizxZZRzy3c
	EkhfzCyW+9q2qrTbQgZW587OZiViDMeyCrKDfAfJ9qvcIIJdOaHt
X-Gm-Gg: ASbGncsqvZ9O3SJ8/B+lFNsl5OrovNhZzoifq6Xc1+QHEB6RSt2oNBMLeTKuUt6TUsY
	tMayF+bp5vIKdyzm6+ssJDNBjTt9vTXlqoiSkuzyWKX7EojpZAByvgyMYjKs5kJPfxkb1ubha/m
	3/ISWu8wXt4+Vio0D7HBUoTfHpDZXz8t6y2LiZyKOj1KZRAUHfwm7Gw4uHMuyp3MQUSMVBpboXt
	U1w9wEL3+6XpD0EK5d/X4acf6U8ClZxykzK+v7w5M8ZNocGiJ+P7GoKGcUbwaXLCmm7kgjswOjL
	YSjef+pMI7dgOK/mpRu4L4s16k/9
X-Google-Smtp-Source: AGHT+IFaVkiJMnj3VgvIn4KY0EMAfKgQjPIsRKUFGlioLk6ajpy6xkcQn1ZmvcOwltCu8C2Fpa2fIw==
X-Received: by 2002:a05:6402:1f11:b0:5d9:f21a:aa26 with SMTP id 4fb4d7f45d1cf-5deadde79ecmr8166783a12.24.1739470941293;
        Thu, 13 Feb 2025 10:22:21 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:21 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 7/7] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
Date: Thu, 13 Feb 2025 19:22:08 +0100
Message-ID: <20250213182210.2098718-8-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102222_814761_B204F9C7 
X-CRM114-Status: UNSURE (   8.09  )
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

Enable ARCH_SOPHGO, pinctrl (built-in, required to boot), ADC as module.
This defconfig is able to boot from SD card on Milk-V Duo Module 01
evalboard.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
v3:
v2:
- moved CLK_SOPHGO_CV1800 from Kconfig.platforms here;

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..5680b8fb6b12 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -66,6 +66,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_ROCKCHIP=y
 CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_INTEL_SOCFPGA=y
+CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_STM32=y
 CONFIG_ARCH_SYNQUACER=y
 CONFIG_ARCH_TEGRA=y
@@ -650,6 +651,7 @@ CONFIG_PINCTRL_SM8450_LPASS_LPI=m
 CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
 CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
+CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
@@ -1398,6 +1400,7 @@ CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
@@ -1517,6 +1520,7 @@ CONFIG_QCOM_SPMI_VADC=m
 CONFIG_QCOM_SPMI_ADC5=m
 CONFIG_ROCKCHIP_SARADC=m
 CONFIG_RZG2L_ADC=m
+CONFIG_SOPHGO_CV1800B_ADC=m
 CONFIG_TI_ADS1015=m
 CONFIG_TI_AM335X_ADC=m
 CONFIG_IIO_CROS_EC_SENSORS_CORE=m
-- 
2.48.1


