Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E998C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 09:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/eZmxzIpGNpgUy0UCsUKXVORhgaRE/LnMc2HiVIjjg=; b=wwYKxJqhYlEnurhO4dUTx+D6bv
	0LjGp1ByEBdkUgjm+BC6lFl4m5fzwyPi3zZSePYShbz9fXWJN97GzU9qtLdA4FTc1Z+IbGpp/FNeW
	KSPpboP+QsQlISHy5tJ6HXspMyH+P5sJwClCNsqFvNnW2uUDNxr0JzJLoUK6kQ0ShPW7pYz+ypv3l
	7KqNQAtLFtnWpypSqKUL3/acbOMQCF1fFlDIiACH9vHAPze4rkke+HzBJreK5Mxuzfnx4T09Du9b1
	Z+KxYDRIMYNDsBdLE4lIILyr3DPrDcuo5AHa51B6XqK4YkJPswA21VZcEaG9QXVRXZkB3fRfz3idn
	OKC13SOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyuQ-0000000BFPy-15rN;
	Thu, 20 Aug 2026 09:18:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyuC-0000000BFER-3Sv8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 09:17:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-499b02fc590so7411095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 02:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217467; x=1787822267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i/eZmxzIpGNpgUy0UCsUKXVORhgaRE/LnMc2HiVIjjg=;
        b=i4wruHbBCwyMxHZ08Yc9jb+Wi1Y6Fx7hn/cifBNLBm8InLBE8kexCpY6YeqsnF9TXg
         NJBBdwGWaCFa+P9JRF+zVWftvYgTsoTEMkK4FiSAz0SzAeNK07xopmMzKDL5wQh5TxvE
         JazmJ2AZOGPd0ItC2MO6nY4a0XcECg90Thtwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217467; x=1787822267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i/eZmxzIpGNpgUy0UCsUKXVORhgaRE/LnMc2HiVIjjg=;
        b=ix60gmi/kcb6mbE8qjaISqID7tt+7vMsDQpd8BP9IldsKbxcvLtyQ/O52wa8xieJ+N
         pJ9497c2+LS0uWxF39TNg/XgWsSzAq0uCevbPVNiZeNB46UwZyeVUt0ybc8Ug4nNJbfi
         Q2ZmH1ZCf9ZRJd0PXx4qOdHnJRcUCiLzgKPogZnb8tM6fqbvw2gKUoxHFR//XAnA60U0
         kaxJIOtERvyFBoDoP6Kdf64mnZ/GoV89cHgA2DKWBnhQj10gFanTGik5FegcTb8L9ZJF
         wfuawNQudVNwiwrgNnKrYVafL2nLUAbiIDnyh2Fx0XFn7pesmISWq7TzpNV8JIQEQPfE
         qE+w==
X-Forwarded-Encrypted: i=1; AHgh+Rpw+Lv9wTINmCPNkDkLqhgw/Y/5XabnEfGSzuglqVRy1bfVjYgQQWTxSjsDZwBDtvbFJOIeIBZ0lR4REdpjTqiZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCcfwcXQawzZyQPPslI3lCUO++9t194k54qXlbNyO9+778uxRH
	yU3CpAs3/4qW6TW2gNZgyan7oBlZMclmfjealzX2PI4uW0An+HHAl7I84n1AvL0bey8=
X-Gm-Gg: AR+sD13RKwYKzFD+tkzb/IZJzUcuuZKIIVIb5zZ0FdFelkVpfn6KF+YtUhOO7q+EQUo
	kGYw6e1ckJd6HyGop5QuznNa47gPAGJJZjBai2hn9siD62xaUAzDBZO2/yH+sZJ08FiuD7UcioQ
	LzMM+8vAO1YP25E+Vb9DVjijx2wJEl9B7QymEHI3Cpn76qj3H/RIWP86vC56WAQCdw6NM7h7EcZ
	mYh9o4wqvM8PxIR9P0AxSES4x+QyGL4aGEuXhq5wMh/GtnMHmCOWeVdyAzAMs6hMAAKehnuYMSL
	0Z7ZYfyfPkpo1rGPvvV1eR46kFWqIbHsebeCB9UuA9j2RXyIhTf/fwWw6mXAPBqOgua95TpF0YZ
	b1Hwy1CY2u31eIvJOS+YjM44ZGIIlx2IdVsC+dMZkzINg0DHaW2u1X2ujjAH9mEAMvUC0oOuPlW
	EPyC7hNkyvC7FZ9tdOz+xzQ85YeKSGoMGVh+gXl0Il1t4prH9z0rcN2J+7yLH2+VDgqFNtzAP5r
	FcoszNu3Zbmej5zw2yHChKCz4GMAIhFRWJFLokFa/bYdjJ/F+0d7UBEy97p8Er4b1Amu7c24Ob/
	HxoWypcXIfNtZMW9MTtJ/RROeUS/C30vHJgeFx9nmVXsYEDNqzVX938FW+CWCuXnjnVRDUnd
X-Received: by 2002:a05:600c:468d:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-499aa1bbe90mr167976125e9.14.1787217467091;
        Thu, 20 Aug 2026 02:17:47 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Michal Simek <michal.simek@amd.com>,
	Sven Peter <sven@kernel.org>
Subject: [PATCH v8 16/16] arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257D-RMM
Date: Thu, 20 Aug 2026 11:12:24 +0200
Message-ID: <20260820091652.43541-17-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_021748_884348_351F99F6 
X-CRM114-Status: GOOD (  10.82  )
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

Enable I2C (touchscreen and audio codec), SPI (display configuration),
DRM panel and SAI (audio) configurations required to support the Engicam
MicroGEA-STM32MP257D-RMM board

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v7)

Changes in v7:
- Switch CONFIG_I2C_STM32F7 and CONFIG_SPI_STM32 to modules.

Changes in v6:
- Update arch/arm64/configs/defconfig to match the current upstream defconfig
  after merge window changes (no functional changes).

Changes in v3:
- Drop patch "arm64: defconfig: cleanup the defconfig"
- Rebased after dropping patch "arm64: defconfig: cleanup the defconfig"

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..f6d3d94ab7db 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -636,6 +636,7 @@ CONFIG_I2C_RK3X=y
 CONFIG_I2C_RZV2M=m
 CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
+CONFIG_I2C_STM32F7=m
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_XILINX=m
@@ -673,6 +674,7 @@ CONFIG_SPI_QUP=y
 CONFIG_SPI_QCOM_GENI=m
 CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
+CONFIG_SPI_STM32=m
 CONFIG_SPI_STM32_OSPI=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_TEGRA210_QUAD=m
@@ -1018,6 +1020,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI9806E_SPI=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
@@ -1120,6 +1123,7 @@ CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
 CONFIG_SND_SOC_SAMSUNG=m
+CONFIG_SND_SOC_STM32_SAI=m
 CONFIG_SND_SUN8I_CODEC=m
 CONFIG_SND_SUN8I_CODEC_ANALOG=m
 CONFIG_SND_SUN50I_CODEC_ANALOG=m
-- 
2.43.0


