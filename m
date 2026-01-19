Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670CBCCF2F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lathu7eoQ9hnN88L9AXE9/ZDnozq7El9GXLKl/+ubdI=; b=HT0er+Cx5bb1IkfyFDCWl4tOAL
	tTKyYvvBBX/+fPs5JyXQyVNzKpky0WfaI+HDkWsoouQvsqPDlBmhMC+gls5i091qcMZIwLcxsRpdU
	3nWm9p2eyNQwzCZZIh4XSsAG14lXAOIZEtArfuBXa/6Wha3oc+k2fALepxCPUTy0qqhO5mtcQynON
	mhhIsCSd9LQelujs9oWQcj6Egqi3UwLcAgJqpR71v4bJ9Nzxs/EnYAI5eJ9urvNf550K8ntLOkYy2
	SmMTbMiqROd6HqQ5GS84RtSFWoZy66xM866ab8Jl1Mi6xYvfMJahk48mmt+/giiAGEscFvmXCWoYR
	cpY2PexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho4N-00000001xZs-4AB2;
	Mon, 19 Jan 2026 12:09:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho43-00000001xTf-3b7a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:09:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so3730052f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768824538; x=1769429338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lathu7eoQ9hnN88L9AXE9/ZDnozq7El9GXLKl/+ubdI=;
        b=DtUNgqA90pTfTexefcd+4fD/JwdVdHzm/DI3zeaZxG2AqnjLbyj82zge8WI+9DnpMX
         CO4aPjDcO2BoP958Uu0FCDyOMEWNsmvVwDTtub/bCwdNn1Er1A0/0jEOLxMFaTbesCrA
         p9WFpYfNmZWRGksC+DKq80/oLf1tbUvZWHtJFqqiRiEdKCDVejyQ2N4TjnmYgXC4Nkg4
         uvT9rAFXYLU94Slz+ZakPdVaIBiTD+X8tdAx3hfxD4T70L1U4EiMPkz5qEPkLxEeARmy
         KtduXyapuNCGTKQGorUcfMGL8izB24AiX0eYhE2zMSQz7VZ6+ykQIioP0g4bGyZxTPR/
         NnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768824538; x=1769429338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lathu7eoQ9hnN88L9AXE9/ZDnozq7El9GXLKl/+ubdI=;
        b=gDCzxmAmBfkzVO/yOirPtnzeM+WapHrYcUVq5rdcVQFQ7nGrtWAGKz78OfLJCM8kv1
         zjLD9+gV4Ca2RsQ0ma8FFVzLAGxjOc10qDOktiXoRc2ykqbPxnkdelYZW/Q/dJDB8s7r
         ObZ4a4DfjV3GK4mJIimNCgYeqU+o75rizZ6MtgHQ4xbg3nPSCKITGMJN+fB/WYtdY6N1
         vcs8wlww1JwqUExG+SRTT1R87iXgp8FzdRFRgEX18IXpaS3HGRJ0TWj0qLJmUU2sE4pF
         ALZdAcmbPvJDgirUenKhsOK5Unt46IJYV9yhf2OYC5CYIFRSY4T+TqDsE0DY7IFg7mja
         +njQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVPOl3SmyEvRJrMijSrrXtuXY4K0r1OoApvwSUCMpwCYpzJdz9910ncZPsZjldc+TPSEIWPWCA21fp52p4S/46@lists.infradead.org
X-Gm-Message-State: AOJu0YwQYux5wZy0UxT926d/vkjyjrD67fbGRNwfnyFBB6wfCchil2Av
	PfQ8cvbyfZw9Bdh5lREfMrahZnvhajJhPLkidLR4x2i+H7ptGLvF2ViAZsJX+IVW6AM=
X-Gm-Gg: AZuq6aJAF03wzpxnVrz0Ne0qNhSkYwxkvf5OcZZjEaYKnVxH6UGeTkPJrX9x5KArp7b
	MpDQfGadKneekaKvz5PAd2U2lLPBDkEgoM17PfU8LaxG22tdl/CGNUgy2sauY2r65seP/gdTdFp
	xCUBn9kQjzdXpChGQUjI1wz57wFfQlx7YM+4/CCFuGwTIE+X6SQJuUm0/ycze51a2IkRtbUJMaJ
	plaI2VtDakOPtnlrLfk5jmPYKS7+s9MVESDyCbdzy/3ANlp56DGqr4UGq+JCR0N9BSVO20FS/Xy
	s4gFFXqOIKCayoQE4haFBKKF55hPD7Q6566vsiDhrZSHhDcQTvSUK/7DRr/4m0zJJWkaBcT86v3
	vEbVEP4+bCLaqzn9sVFu5YU0n2zEkHMrznxMCuL9W2dsP8HLroh2xy3tEot1h2sufga5zuuf4z2
	+eqncfjfgXropKYiSDTb7gZrriL0BajJk7QntH1fuGVDz2g/5p3B42m5HMNJcpKQx0WoYTTA==
X-Received: by 2002:a05:6000:144b:b0:431:8f8:7f2f with SMTP id ffacd0b85a97d-4356a07743emr11227404f8f.34.1768824538122;
        Mon, 19 Jan 2026 04:08:58 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm20698421f8f.30.2026.01.19.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:08:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 19 Jan 2026 12:08:53 +0000
Subject: [PATCH v2 7/7] arm64: defconfig: enable Exynos ACPM thermal
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-acpm-tmu-v2-7-e02a834f04c6@linaro.org>
References: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
In-Reply-To: <20260119-acpm-tmu-v2-0-e02a834f04c6@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768824532; l=868;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=glFQ4Oo7aFXvg4qCxUzDyhw63Eric2ZNI22jQtPmJhg=;
 b=jGWmIQ3VJe/OIr58mGBQinzVZCX659HJK8MtuuaHM01fhgkcacEuB8bWVtLq4hLL7aAt8CY7o
 ND/UZrRnDGbDYAMpf2MIYS7MwKUlOKLihzJnMnIfQ6vWHwzkx5s2HTQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_040859_958029_11CBF6AA 
X-CRM114-Status: GOOD (  10.09  )
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

Enable the Exynos ACPM thermal driver (CONFIG_EXYNOS_ACPM_THERMAL)
to allow temperature monitoring and thermal management on Samsung
Exynos SoCs that use the Alive Clock and Power Manager (ACPM)
protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..68fefe4bf49501500362fcb0b490a684ea469b26 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -752,6 +752,7 @@ CONFIG_BCM2711_THERMAL=m
 CONFIG_BCM2835_THERMAL=m
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_EXYNOS_ACPM_THERMAL=m
 CONFIG_TEGRA_SOCTHERM=m
 CONFIG_TEGRA_BPMP_THERMAL=m
 CONFIG_GENERIC_ADC_THERMAL=m

-- 
2.52.0.457.g6b5491de43-goog


