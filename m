Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6A7C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=; b=cHh8g3Lte5GoDOVvdk5PqMM1lS
	MgZWj3QqfNukIAeDZY3EP7ZsdAE3+GR5kL8WYaKFIJBp8hUpGs4+HkXD2nYEIpRGrAGVMlJZRJucj
	NoDFrL0rhhOwTSyW0nhvfbduS0tbnaLpl318+K3HVEl0+OYJVaqDu+Yuow2RzTaF0Ju7OX8VJhGYu
	yhH84qUeRcrJP1Mk+YdgzF8gfBPSlt8xMr5DM91+iR9Yp5/K6Z16P+hlysAoYoMV1dGt22ixStjpM
	DSBf40x5wFNu+NTZ5/dQapWUZAQhogODoG0kYr04H5PSCRCAhBKHSfa6x/eFMEhXxevtA0uk5DNxT
	BJ6VN8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHU-00000002Znj-3OWC;
	Fri, 17 Jul 2026 15:15:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHN-00000002Zfz-1DFm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so7942627a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301308; x=1784906108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=SzIvW+/YtPug/5MbJGp6Sj9acb4AA25hnU2DvmYcSpWj9/AZdZL72PNx0swogSc6Bw
         +MK1zudnTgeFcKpQt4IORhnFBJFOgeNW9t/BBiIWgC9M+viN+tgQ4YmMhHUYntvJaFOv
         2BKh8YdiR4CUyJvHw0JXaJamV9oEGn5TFevEkQbTScHWkSJeYW89igcguIYAqeAnWunc
         vfEGIs8dB5XR3+07lOVrjEcYGNRxSEDwivwAiQXxTZhSmVUZr+Z5Y44SDbvjNF0y/QJK
         lSmbf/oCWB6eOY2DusjzScT+W5SiIODevU9FAhcCi5fmKHLoN+Hm8RlGXvhllUdsNfp/
         YfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301308; x=1784906108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnd4qpp2azkxFnT2IbU2aZLbJ87tRh7KRsXF70B98Xk=;
        b=EJC6KCrmDPPVQZ7g/ueAOgzu9wJ5a7Bc58Qpj1RhoKtYPgopFImpWbhlWyNtFoFyML
         7hrWzNfmGBVy+Jg+HIsf19L4GKKwpKk3PJ2p0G4kl67phy8B/N55K/gX66R+Em1Pjc9T
         nXASA9juPvvxcA8Z2w96LYg0KYhIN8CP5EoPMRhaynHsOmp4C02sgLaL1uwQbjNCuPCY
         WrQDOh6atKLKMhv7ry0vSwycvdsXo2ABf9dY9NGx/iIc7C64qX+PuEbEflzonTrHrVZB
         jVMhiLfDZnjJ0rCc5F8rraCftd6EbjrVUDyQyba9QKC2hsjG0gwIQyb7/jg/6Fd8uMJV
         +2tA==
X-Forwarded-Encrypted: i=1; AHgh+RrPJ4+EX8pgaGd1a2AqeWTQvJRIDE0otyKpBSUD/h2g3O0Vwe9Qrik+a0a2mr7BvjG51PlYcSowdlpY2f3qgXfF@lists.infradead.org
X-Gm-Message-State: AOJu0YyZKzJLvqHxCOJiVzoAQpUbyXpz5JB2n1pdSIv48yeOIdWV80aa
	7cnFrQoUiaE0+Vf9SukvJCtBRDDfSjZZQR6EH+q4fzo/juTlhe3iNJ86
X-Gm-Gg: AfdE7cmbWjYxEla+2oG5VdwfRqmfFgbiwZFCeITSab1sVEBktTMsNOVnPzb3+y03fbb
	xYG13/0xLEtYo8XvnLo5uiV6RH096QhrlYRliJYHcfH0zVN2IztnJLtRVWeuqiucrejmQXdzerM
	Nkxqx2WcajY0fXdqSqS/JyLLgZi1H1/RTp7Gp+riJkYfWScH+aNLkGXerAypOlqSybza7lrcRXD
	FRzpj5HucvRw9PwTdH33sXJPDYz8J3JAJiB4ej40O4AIQJwsAfKP6gxS8HCw4bq/zvpnKDWvMTp
	xXrjA11R9aLRq/qkuIEkoGXOfb66OclPdhZucqQCKX4JDha0tdXTCu4x3BqWmP6AfjF3ArxIZqC
	Qdstr3Ejg+ugmkHINQa164loIDQg17jpyb16JHwXkrZ5UFQIj2xo5vT0BjJT2xo7B15jr16IvIA
	==
X-Received: by 2002:a05:6402:3554:b0:69e:35ae:8af9 with SMTP id 4fb4d7f45d1cf-69e65272664mr1237776a12.14.1784301307558;
        Fri, 17 Jul 2026 08:15:07 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:07 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: reset: Add reset controller constants for mt8167
Date: Fri, 17 Jul 2026 17:11:11 +0200
Message-ID: <20260717151134.678839-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081509_344912_3EDC6837 
X-CRM114-Status: GOOD (  12.44  )
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

Add the various bits that identify watchdog and mmsys resets. IDs for
mmsys resets restart from zero as they are used in a different device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-resets.h b/include/dt-bindings/reset/mediatek,mt8167-resets.h
new file mode 100644
index 000000000000..85d2d0e99c68
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-resets.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8167
+#define _DT_BINDINGS_RESET_CONTROLLER_MT8167
+
+/* TOPRGU resets, these are actual bits in the register */
+#define MT8167_TOPRGU_DDRPHY_FLASH_RST		0
+#define MT8167_TOPRGU_AUD_PAD_RST		1
+#define MT8167_TOPRGU_MM_RST			2
+#define MT8167_TOPRGU_MFG_RST			3
+#define MT8167_TOPRGU_MDSYS_RST			4
+#define MT8167_TOPRGU_CONN_RST			5
+#define MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST	6
+#define MT8167_TOPRGU_DIG_MIPI_TX_RST		7
+#define MT8167_TOPRGU_SPI_PAD_MACRO_RST		8
+/* bit 9 is reserved, unused according to data sheet */
+#define MT8167_TOPRGU_APMIXED_RST		10
+#define MT8167_TOPRGU_VDEC_RST			11
+#define MT8167_TOPRGU_CONN_MCU_RST		12
+#define MT8167_TOPRGU_EFUSE_RST			13
+#define MT8167_TOPRGU_PWRAP_SPICTL_RST		14
+#define MT8167_TOPRGU_SW_RST_NUM		15
+
+/* MMSYS resets, these are IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */
-- 
2.43.0


