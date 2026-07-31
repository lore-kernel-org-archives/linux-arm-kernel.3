Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE635C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vCNkmuNJ+jyrMeSxC0r34tia/dGpyDz8rIS27XFQHTQ=; b=U85bajB58PzNKTaUTk0uay2Xc+
	fIceh3nVt/QEtaqcRs+9wvYnO2FSlxRlSdisWsg0DgBggMgiIjhmadY/Bx+euXYUxtZ0tbD9CGEJs
	Bog4aP7/cK8miUkT9CKWH8ZKqxAU5WO69m8US+/wiZeTkCpmesYlifdztDPrRtfeRV5wDKKTs4RMP
	IbaVnrIsuo6y8K7MPbBdTD99akQJdBfSsnh1gJi2993HNVPpuYbg90EvM/5cmlXFz2OQE2EF4K6K+
	YS149y6QuAbfKMP70LSMxYH/mrHyoRrCKpR8VV5lwYpmQ5N0ltO8aFtevdbJrn6GwMT7/nXRKv0FZ
	Dq9QkFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiNP-0000000C21w-1isO;
	Fri, 31 Jul 2026 08:13:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiNM-0000000C20w-2UOg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 08:13:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so630225f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485630; x=1786090430; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vCNkmuNJ+jyrMeSxC0r34tia/dGpyDz8rIS27XFQHTQ=;
        b=A9dXiCrn2fKb0xf7RFCuA7M+5iwvbyQ0qU/x6e4uIR6T/EMX2NY2+ewql+lAqhpNTR
         hJ4iTJAONbE0e1Hounr8PEW+MK4oQbuyWc/uY8zOtAkJIKiVIjXfpkhxx8lX+OVVekG+
         zzSA2wq2H9F6qWXO8hYtyHDRmSlQh6HFYpg30nsa8ZYiq6rQ2pUQ2kbzH7HQS7xodv2V
         TXdg0J4lroDtLrqxQyd1/hr8vVDKqayevV4IxTX8sCQtNm1LWW6K1PetX6c3MsRjSz/Q
         jDPg2B837O6t89AMdxRMbCuEdhDsn6SlxEmziX7yjynDW2nshFFUTtwJKlGpg6OOpWJ4
         2ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485630; x=1786090430;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vCNkmuNJ+jyrMeSxC0r34tia/dGpyDz8rIS27XFQHTQ=;
        b=qIyj901n0dMw/cxeUOokeAcVmpIkoYKEqd7vlmI6fgXeXJH2+VXLMqFNmm5vYD+izN
         FSftb2oHBzLuWCDyZGdQpCAbU8jCaDS8XsKlAlhhIC/OyQ1CRtqVidEWCALexvbk4JwM
         ptA2h47cUKmUs6fEDJNuECgiYsm6f8RG8hvmS2v4Wu5zqHhvDXtsyKhkgY4Jjsk72nMM
         kwPH+PcmuvTTpW+zz8KOPFGQvLVxIH2p16ATZZUgTVzFvjerzBRGO/9QhKOvSbHle0TD
         k1x20DwMTOzxqmfuqa/FrR2bEIZT3wcSR4CwaBgxt+mPuIzeWT2ykQFBPqYeQzg7N6qy
         XYCg==
X-Forwarded-Encrypted: i=1; AHgh+RoHZjZtEj2W6pJyqR8ZtrShLxoT4izs3Fuu/e76HM7HEZiEUJJoLsSVsMUxP/P4MY7vjFxVU43e3JDjstBCpdek@lists.infradead.org
X-Gm-Message-State: AOJu0YzT0MnGYNMkt3bu9jI/vPX3+GdmP3z8PUuiKP+b/zTNPsAMjj9k
	Tuxgty+XOfA63zNhTgc0IRj9cMgDHc94vc7hAqQm/r0Yr5oSlVpLIbEx+suua37zark=
X-Gm-Gg: AR+sD13SJDnYrhTS5Wy5AxXvOUi/hspEUeAtVYc5kbqLt5sCQuXtlVOyJAwFn1z2r3e
	YywcXr98im8M2KKJs7qecTMFuV3dEkxm0CujavQLkozU5pqQpF7S/FLJlHdq0c2cT7zk0/LyJzU
	EcWvkrij+zVPLHM5MPKEY/U+wZbo9vBnzC7Eh7sqga5tn7KXm2gJ/W5lPXYfk4gYpybF4EYE4nQ
	saD/dT55HNsrwWL/cThgLzC2mtSckpNftT25NkUJNWcWdJELJ1SK1hWQa9ZTy0rn/Rq6T7Sl96N
	os8/W0zwS2N0e0CeIhVdDsif8OHlDtzCsMoAT7N4UOTC0AD64OB0tx4XVH0j1B8XIpoBqsVz3q1
	QaDqJ4csjAar3+J63XQeFSWEYKOnjdeQU4uq4qD6agGWldFdSfv6aNfJt3w0WAvkx4PDGf8eydS
	SxyCBhC+q0dRuzjYM/GgsHXzmAkhdMVNjDv5TFd8B533xtKjr4C2Nu+Q16uyWMCsOmrfvt5aR6b
	Q5DmWoen4eKWzQF8xVU
X-Received: by 2002:a05:6000:1ac5:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47fd2abab1fmr2508864f8f.3.1785485629851;
        Fri, 31 Jul 2026 01:13:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm1881226f8f.21.2026.07.31.01.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:13:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Jul 2026 10:13:48 +0200
Subject: [PATCH v2] arm64: defconfig: enable the necessary drivers for the
 Ayaneo Pockegt S2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-sm8650-ayaneo-pocket-s2-defconfigs-v2-1-fc409e59290c@linaro.org>
X-B4-Tracking: v=1; b=H4sIADtZbGoC/52OSw6CMBRFt0I69plSoRRH7sMwqOUVnp+WtJVIC
 HsXcAcOT3Jyz51ZxEAY2TmbWcCRInm3gjhkzPTadQjUrswEF5JXQkHyAxmILyVLDnrSDj0M3jw
 wQRTQojXeWeoiVJZXsqwLJW3O1rkhoKXPnro2P47v2x1N2vY3o6eYfJj2L2O+eX9kxxw4FDWet
 MmNsra4PMnp4I8+dKxZluULWEoTgPMAAAA=
X-Change-ID: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=we+DC/08M4N7EVgA6SraID4DmZkWSjnOzGNLaszNwyc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFk8LOyHWU3lJGNh3ljX/hFGdeiGirL7L8In2sy1
 luUHEsOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxZPAAKCRB33NvayMhJ0UUvEA
 CcwlLcfUWQv6VEdORKw+ZBSvs8/mpeRUzVNYfuoBqHpJEsTKoJG1HZUQ5TJJtJEuTcZn2wIgJ8aIfv
 TgbkzMPVttmlcJccgi3G8X4VVj5s07Qn1xFVIWJGPen35tM6X0q53zbtSKpVDNnUXC6kquwvzQrWlB
 cfd8d0/Q7rNExfC/NmATbCZ3Eu/Jwwru3s1rleEz6p0a7icDNNYHXYzjQ+A7sizJp+qPfAIwxSKNy0
 IXB6JezBwHbYTbb7v8hXtE5c8Yw/HCaQk6+Dk+svyhZQyZ4hsjfC8hLhRrRqWDK9B4JkFCwF2SmOqW
 OcamhNcNXSOT2F8cO2r5gXQSvaeYiBfE1YFVURvoNgoyVorMaAlxmYe1kaWHkmYOBYKvX1lpXNCSE3
 Epnom/1G9bF0JAcYEKlZJp7DzBV/D0OogYX5wOZBR8tKhDAidVA/Lf0h1sssy8D9lIs/4xyDErNPGM
 LivF2/ZEFKggUApfLpBL2meKd99Zi/jDer4tv8WTRAa4RWjSu0VlDSbjP8ELD+Tbfw73vsuP++HMUt
 i3E09uhWvSLKj2tYtZUAzde6Vv9EyiG0wHok5z/XIn0A0meyiDP32Ia2xVBU4+ZohXHuMSq0BimUrV
 kfqNC6ESo981GrL3Twjn27Wk7I09webpuwPPvtMs41ZTehODXBWcvBD9YwAQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_011352_676640_59F841E0 
X-CRM114-Status: UNSURE (   9.84  )
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

Enable the SGM3804 regulator, SY7758 backlight and Renesas 63419 panel
drivers as module since used by the display on the Qualcomm SM8650 based
Ayaneo Pocket S2 Gaming Console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- squashed into a single patch
- Link to v1: https://patch.msgid.link/20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-v1-0-49e3ac1c8ff4@linaro.org
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..87a6c50bdd14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -895,6 +895,7 @@ CONFIG_REGULATOR_QCOM_USB_VBUS=m
 CONFIG_REGULATOR_RAA215300=y
 CONFIG_REGULATOR_RK808=y
 CONFIG_REGULATOR_S2MPS11=y
+CONFIG_REGULATOR_SGM3804=y
 CONFIG_REGULATOR_TPS65132=m
 CONFIG_REGULATOR_TPS65219=y
 CONFIG_REGULATOR_VCTRL=m
@@ -1026,6 +1027,7 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m
+CONFIG_DRM_PANEL_RENESAS_R63419=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
@@ -1062,6 +1064,7 @@ CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_SY7758=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m

---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


