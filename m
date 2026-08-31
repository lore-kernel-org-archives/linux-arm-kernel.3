Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B9FC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kABR3d14T2hX24+Iq8Rghe1MFpuB/gfE4DOUA56gUPI=; b=AN5uK9L4dRbKr6Ruqlt2hyGl11
	5xWIiZVlWsH5j9n5glFYg1ln4Z6uRXdTfBrm+jT7fHiHqSna2CDPCoKSnsbsCPCTcveKCd8xZxu4Q
	guhw6+hSKwN6lH0YxBxAq9SL4gzWewL+6ruMX9L1yR6C8EjXXRuf9BckHAvf50W52edU92QCHizHu
	ZzHRMnEK8+0p5vzgaQEjGvdweLt6Spd6vE22HPAfsSHbRmcMg0rP/KowIAWj2a67DjjAa5ZYqynIw
	UQ0nvyHcCXXQ9YS28jWuDLBN8/Po74MiMlLHqOAcxOE9wC/wQ9qaN5CXZAMPSNotmnBkvSTbogYwl
	QSG6MPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xHf-00000008rk4-04Wm;
	Mon, 31 Aug 2026 08:22:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xHX-00000008ram-0cbt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:22:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48433f36a21so1046237f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788164537; x=1788769337; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kABR3d14T2hX24+Iq8Rghe1MFpuB/gfE4DOUA56gUPI=;
        b=b9mM6oUGmjpEH3U6O1milE050xhBoT0UV27vm9h+bhdSBXAVm10MXL3mM2yBBLuuGk
         TezeSKDozO7zW0ncEBUiQnkhMFb0/hxyFNK9GILpRIdQdd55d8ZLqa4N0y3mJKQNWgCa
         7i1VpzVs7opm5Iag1XSJKayroSVQEe+pYUi6UNSoX7eOHwGSxxSy20gnMM/Q10ITuvSy
         tS8RKP5yI8H3jHsDEPCiZ4fpmCxRqDiUDatKVS0w0LzYLd/HZp/zvUYMMcxTlYWjQXc8
         le00LXh9qt6+65DP0eV3+hGW+m2EvcE4NmgYjBzbPjFWHMOKkh47Nz66C5Li+UMAvND2
         O1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164537; x=1788769337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kABR3d14T2hX24+Iq8Rghe1MFpuB/gfE4DOUA56gUPI=;
        b=PPAX9UBe1Wr9/+uW4Q0bsMEhbGoZzokPAxRRUVpIIYnON5vlxtjTHhrvm6FsjsBDWW
         hKoo19KuEDhYv7QllNGqaqLwJ4YhSIwkrSZVt3BcSj7DRuQMt8thWtMMcTB4j9l1Yqi2
         K99uvFUZirnK192qhNtH/eMdGcfolCf67N7XK8FwRcLrWa+KeRnAu6U7AKm1/U/t16LZ
         695bHu0HQ3MMaoZ//KNape/veFF04ByvKojTs3tED7qgKW50lxC5qw5vTcJkF08SohFS
         YcRG6lwKJepJ3embWtC+7lnHqLjxdlq4YNqgAwxKp8jd47ZQNbue4xHY78vGR9+3t4Zs
         tXZw==
X-Forwarded-Encrypted: i=1; AKwUvBwYR85GLG8zr91ucu4P8szezPDdr8OMtYNHvGEy7rb0N7KyS6jRBefMsAEhrlmAf2rNvY6SvQAE4RHFpiNXwYrs@lists.infradead.org
X-Gm-Message-State: AFuF++nhaiRGE8hW1JTfCksQ1kVCgRsr9RgYAY4n/8jJi5Bv0rD/k21W
	T0GRJx6VKrB9+jtkTGSVyLk9G44PMS95Eb9Om++fp79a6R3fptl9yoTTwG+2JABHjf44tDV1zpT
	CqlEUC2E=
X-Gm-Gg: AYBFou3tJZnISftv6CpoCVIiXRXtANzYh0YFnigYtgdCYlHOccvLaYNlThC5iNZLmWn
	5v3+DwjYkSLm1R54s9ZJHdIDe/afekopjJGdsMfVcds090qqItr3TjJAXkQOP9Sdc1qRFKtFIRr
	FnFGe5NPTGlYUYYVHpc/3e1z8MffUCVqoEQICbuKBauU/1xxW/El425mIRdUjMEnGCrWN8pEilX
	bBPjMyjfRXs4xPRmpdw5bqIgSxhXTsjWvLsiJK+l+VZkRxikbj9BfVU4NWSQ89XXDxgTPQqD+sM
	geI+5rVRqrST4/1GcZbZ+PCEeXR4u05SvbRorUqcHqIiG8dI5oftbT1/LvHJBNXw1DArW2+IxU8
	XxRRMHxuTX//2zDmE+Wus7htZJGuzMIsXheC7k3wCX7Il0AVD9hrgQTjcxcsTaa4KTTCMUO+3ft
	kLoyh+w1iaLMT4pyJBP+Ugc/+vctDTL/D9IoNQ+J3OjkB73xejci6kmYib+Hdb7NarkQASCk95h
	afwZK2TOA==
X-Received: by 2002:a05:6000:481b:b0:484:3600:35a9 with SMTP id ffacd0b85a97d-4843978e680mr12223716f8f.3.1788164536876;
        Mon, 31 Aug 2026 01:22:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48435b024fbsm12098269f8f.29.2026.08.31.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:22:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 10:22:14 +0200
Subject: [PATCH v3] arm64: defconfig: enable the necessary drivers for the
 Ayaneo Pocket S2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8650-ayaneo-pocket-s2-defconfigs-v3-1-bd8ef3322632@linaro.org>
X-B4-Tracking: v=1; b=H4sIALU5lWoC/52OOw7CMBAFr4Jcs8h2vqbiHojCLOuwfOzIDhERy
 t1JoIESypGeZt5DJIpMSawXDxGp58TBT5AtFwKP1jcEfJhYaKlLWekautAyQrrWZSHBDtZTgDb
 gmTpIGg7kMHjHTYLKyaosTF6XTolJ10ZyfH+ltrs3p9v+RNjN/nlx5NSFOLy+9Gre/ZHtFUjID
 WUWFdbO5ZsLexvDKsRGzN1ef5gz9YNZgwKHuTRUGG0kfpnHcXwCgFqUPU0BAAA=
X-Change-ID: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1961;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zy5HflWMSJKpdEDAhcS6LMg6T9VvkVh36wf255mMT/E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlTm3FFYFQlpBKjavnp28Ebf4fBNU8FaZ1HNpDJqn
 K7jLNIaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapU5twAKCRB33NvayMhJ0bwDEA
 CbHr4DskqKJW8GD0DR8UWpdnMYQc9PSFTbTOGqq2xy/NfhJAXamcWG+TKLr9aGSMmVVGaruo4G9BqW
 4+V5G3GqFQudmsRzLQPM/XHNP3XlhhsDl7kvqfQUx8qEbAX/yB1w9tcc0+TmTN/dFkgmE0e+J9RJuX
 244ApS1ohgDzkyb2JzZTdjyB2qTyBPXF61Fxua1U1sUtkbEsouR2fFS2A7xs/CoO1xblEFCCMvlFXT
 f3LVkldH0AN3E0aQgtMxxPn9W4YTaaIE7nfkQAjjX12Nfyo6IDCity2sAAH//MiYjKCzW+D/ntSpcS
 4OBxIpQKPwlM7m9lNAMkQniOFkyw09TZbrUn0+stdB92L2s61IWhiriTlyT+TCiojLkUskm8NuXpne
 GEv1CZPSL5ObyPI8ch0WZ0R0ujfTbk602ax6Us/MEVUqpgxb+eD55qPZmz4ScDrF27Pj1+1d9o+lSo
 QfFcz57gxBpOYuES7fxYdHyaQwRXmZlDBDh5EhlaDNJVCHTzmsHciu65z2ou7PAKHAEC/16oPMQqIe
 LzcbyUxLyyZVM6M+rY6gH3wbSCGybYK3CuoU81B8ccFX0insZcqGQPpavJjnxE0cNLETAniqwNHK1Z
 C11Et2aL2WPX8dJaOX+fJEenwCEZsfDxSqflsqZo7apgslRPeEcp+6tPgUHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_012219_237954_990C4E2E 
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

Enable the SGM3804 regulator, SY7758 backlight and Renesas 63419 panel
drivers as module since used by the display on the Qualcomm SM8650 based
Ayaneo Pocket S2 Gaming Console.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Fix subject
- Get review tag
- Rebase on v7.3-rc1
- Link to v2: https://patch.msgid.link/20260731-topic-sm8650-ayaneo-pocket-s2-defconfigs-v2-1-fc409e59290c@linaro.org

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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260728-topic-sm8650-ayaneo-pocket-s2-defconfigs-7f07659486f1

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


