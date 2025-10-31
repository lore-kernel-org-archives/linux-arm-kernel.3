Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LI8bIiPiGdrKa8u7FU/JStfXK2j48QfKQas4QVWIkY=; b=O6YuIY92S24M07k2CsD/0d6uok
	HR5K4OF+wvvmLiiCP0Lu3vJ+i8AHh3xbYr0qRSR/vjMLiENvcpyKiui3wvDwl90lJArJ1LV27X63r
	YDi20fnmyVfAvVk8XdtsTLkTKZSnK9hsne7jV5KpZmaznLV0f01u2C6CyaelQoOwJ2Dz12c3SH+yK
	05T6U4nUsslIbDiXPiZ3J9UfaR9STXrpp9KF9wZYJmEjji8EXQb9wbWAR7NEiVhb0v/K76NV3yOf5
	aNYwthYzPt6zsqkiBH25MijUCqPpJmZhZtHqbaupS4BqpNSnnfm7T17+a9mtdybBYfWG0UXNo/NHZ
	YJ9NZBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVi-0000000660B-42cr;
	Fri, 31 Oct 2025 12:45:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVP-000000065qI-0XaD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:45:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4710665e7deso10483165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914721; x=1762519521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LI8bIiPiGdrKa8u7FU/JStfXK2j48QfKQas4QVWIkY=;
        b=OG16SYq/vrZlK5P9nkK5lxzNEZ3rJQKFZdTY0i6TXJxsLGPw88Fx2h6/n3DcMjywWS
         XVqG5JYU84NiAbzlFiCK1b4QGcJfR0NOKdJPUtStoDdbqK12ZZ97S2OgVZ2JW60HS8bg
         vnSvk49JvVns1yAIeO6B0ET34zbdEHSKpzSzZ0LBU2N/tbFKhqsTEnuSG9IWmb9t5h7D
         sUlkfGXA8i/YkvwPPXEa9t6sHNwsGCtrhvrhZHxPSPli72Jw3kLIbvRRlh8mj7z9Rl1I
         VjGxIwxgQqjmcBbZtLhE4M7ECHDTJ2XwAIAwKIgOWXELgW7iHRCQ3GdHn6tCGOqz52Bs
         ZL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914721; x=1762519521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LI8bIiPiGdrKa8u7FU/JStfXK2j48QfKQas4QVWIkY=;
        b=aLf17EQEJ/L69nCrBCIL07ANNyQadVD/nqob9/QP+Ce87WOdwpGXSd6WXPaBdYLxQi
         fmja0XyB3kjeq3q0eQflFLdg/JfDnLj5Fn5+c5sDVg1LEOFYLmVP+4SmrTITstRF7MvY
         OECFp2ZRQoUmEQfKsndporsflGuoPAMMHrVTjW26HfFDX9GzbFXU6I0F+fvIrAznByRX
         TAZg4ZaOACE07oHg/H7FF59JD30nK5Yj9/fGUcoMPCnoByAyUIxismSlcg4mma6fdufu
         3oTb4qGbTyOhJ7/HlDLObZO2EUVODSmQ9MbFPRmDYNxrWRIvxlFi8t5+kUkGb+yM3NLk
         vpmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5PfkLnviBr3vrM/s+mpQ5lAwXJHFp7Jy32eKqD6SEmOIEjuWm3yCr1biV8RGefa/h8Hlhq4hrzsFFRJ6ywq7y@lists.infradead.org
X-Gm-Message-State: AOJu0YyVrw7HAf+L+Yvloud2An5cyJ7pFVBP1fl4XVd04nTBKZUScfJh
	URQ6cbBQu5LrChTABqkP/p+OtJl3pXToAWO40Bo0ah6e6583oE0n+mdU0ZaegKzC2sA=
X-Gm-Gg: ASbGncsjPAPZP8p1x3clr56Ct0o1TRKJOn0CxiAQ0g3Q3GuElmwZZSuPxX6BGz8iS0S
	tu58hExSErD0Vf2+cmWapSEZoQ5HqJNDnODqZSIZvch9U5/tHl9QrVllh/BDQyW5KYxeQHnZGUG
	iIkXN62lI1eDbLta7w67U8+4GnmSb2MB6uI8XSn2AKfZAtXN4sDggKP0dg0aAxAoQzjb9TuN9Hw
	8qwkqvz4cuYDqZRUpqrxTEFnVMk2PwnmTw71Ian8p8/dTZRgVavOTWH2ztb28xp/UxbWfgVElUc
	k4+Q3Hoi53fO0gURcy9HFrcMeqeaYrIwBb7uvz2q5gZ5tS8Wd8I4+BWgkXC2rIIX6kMJjGmiWq7
	9nrK4clgpvDJM+TdsYFFdvBhe2H4FyDrdKBVor1snB1XSrCT+LGZBrmFyD8whNflONzia0TIa8f
	xKvwihpmrkkpasuG9hGNLCKtQvtH046KY6d3H2JTv1nOs2DvWOPru4
X-Google-Smtp-Source: AGHT+IHOR9o3pN2qjHmH3aj2ibwtFk8fBD1ANgqBkHALk2NU/zxtz1qYd7JTDoI7nz6jygMlz28LcA==
X-Received: by 2002:a05:600c:314d:b0:471:1d8e:3c4f with SMTP id 5b1f17b1804b1-477308aa77emr31810825e9.24.1761914721275;
        Fri, 31 Oct 2025 05:45:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:45:12 +0000
Subject: [PATCH 4/5] arm64: defconfig: enable Samsung Exynos OTP controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-otp-v1-4-2a54f6c4e7b6@linaro.org>
References: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
In-Reply-To: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914716; l=915;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=jbtOQh+KZGaronPKGSCjW9AW/6hcLTFo8o99haI6DgE=;
 b=anPmmraBvSuRYrza8lT7XXPyLkgmlAH/yyD7w1SjaBtSE3hCPJZEkgDHb0kPl8CtR+4Ta8bjR
 mEUElj9TnrgDeBa4TOQQUClCBg6x6jMhPpnKkx/DI+wT0L+NvF59rcO
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_054523_455474_AF1A545C 
X-CRM114-Status: UNSURE (   9.52  )
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

Enable the exynos-otp nvmem driver for fuse access on the Samsung Exynos
SoCs. The fuse block stores various system information (Product ID,
Chip ID, TMU, ASV, etc.) which will be accessed by client drivers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 646097e94efe7f1a18fb59d5b6dfc6268be91383..6433e3c0f88b892ce6f2ee190f866a6ab4889771 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1682,6 +1682,7 @@ CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
+CONFIG_NVMEM_EXYNOS_OTP=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
 CONFIG_NVMEM_IMX_OCOTP_SCU=y

-- 
2.51.1.930.gacf6e81ea2-goog


