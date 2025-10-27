Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E02CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N0RklZbmwkn8tuI09mtvTbzPIkOPBKf9i2aye/jiFz4=; b=rridj+PA02XIkkCddScZddmnhb
	mOl68lqYw+i+ZGneq5NDZcqr1rXdx7rDOfT1Q9QPLrLpl41C/0MURw9scfDfSuqrn5UyH0Qks8cwT
	ziMwBheN3yvw9t428F6Pgl6CcUVAOwBbA/8MJ1VrLuNs9hPZGC5a7xqdkD4Wou/tg43rNknUuz7Mf
	iUS+Z3GU//WSlzEUxEYLX4C7dT5jxJsSFZkqwsy6Fj69Nun9eJd839diPt4FiJ1Kmeqc3IM1N8yvR
	JLX5JOIb5rntE8SO7fz9Y0QzUCg4f68I4c1eJ05KW9rUYGdymidrjgPngwQzKYriOskA7iaIv+SfF
	Mat5nnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMAl-0000000DsWZ-2cGQ;
	Mon, 27 Oct 2025 12:18:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMAi-0000000DsW0-3yAm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:18:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a226a0798cso3679193b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761567480; x=1762172280; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0RklZbmwkn8tuI09mtvTbzPIkOPBKf9i2aye/jiFz4=;
        b=McpCenUu67QBsoPjNrT0i6Jaoom2MRLvCjs2o16U0gLRH0mrM9uIagLXmqND88SW3f
         h7YUrTKCTTDCsHoKY7WmuKWlPkIkbFTpuKBEQ5/nAI9SbwUjsukzYKnb8riLzGypL5PO
         +rBJ824ya2mef2MUazp8SJjf/riwG8TRMjuuAFjx1PdY61PekuEuZLz+8koOym15X+DF
         mw4JTKOFw5aadyflcoBNidoEgh40MGVi4225jIrgDI4tsGXmgTtTVt7l7gQ1YST9l/XU
         5okr0UqYPvCwFghawGvCjKfRBsSlzPykBf6FVkUFoT5TwHzvvUtIpw3MQCqddwyHht+J
         8AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567480; x=1762172280;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0RklZbmwkn8tuI09mtvTbzPIkOPBKf9i2aye/jiFz4=;
        b=EupC3rCHQkDjcOpUJXxPy/DV0X5nHdGbAbqs17FYdCqIQobmp+aJeSZcjEMxgtaa2G
         XrqKNx505tnGzYFuI8IJCFNHOfHVR/p2VfjS2MPdvY+p6LoNWv29PatVTT5VtGlq6aAm
         cfMuxtavp/PKb3+Sd+v6wNP2H3GXf5OZra6NgEaNtN111/UL2W1+FPSdBJj6X8N8RKMW
         llICbL04kBS2AocOdOm/5wWP8xuIOCk8e+rRcE84cFedfHPNJQF11amTNcRHXM/zPWlS
         kElmMfyGWBYMICGBYGMuopm8+SR5uMeGCuBptWd4CyIUKuj1nd7o+3M06Ud/G3m2ZVAi
         2lKA==
X-Forwarded-Encrypted: i=1; AJvYcCWlfeLEt69gktLMMosvLTVCCdMDdaOLIS2HG6taFxv49V01+Vg238B2iS2dNODiCOivsjlrWw40Eqm89xxn4rhD@lists.infradead.org
X-Gm-Message-State: AOJu0YwLiWqRlBuK6yViy+VW29p7aoiHZnR9vIeGOzhbaGlG7SO27UIH
	3jOpSM9nYqT1AbY6xyRUDJj+jEqaEcf0l8CBCrcyTQckiIUdm7Dt5hEu
X-Gm-Gg: ASbGnctiToGm2OZm6WI6qfZpgUYIEg2WEdjkN0kgkCEYEab3a4R9CX2sLtZ+PPTtPce
	L7ygxPrC76jR2t097OxLIsbvKLozu60jGaaVH6tjuwsrM3Luy4kpcHgYWhIj+1Xs0hhicpspnpN
	LAq/cQjJUvqkOTBOiyIWpeCs7zNngXORsAYYEWTJUgIedvfiB2rmmTZwENNkN/8U5b1ajCNK4d1
	4SXm6s/adBLPDJixwBHhhrum40zmMkVNKLrM3zukjeSf1w0VEUmRYUPJT35HjjgVPSv+XUY0KrD
	I+GVCHAlrQyePHc3DWbykzAD+nZ1I0C2IDq+BuBfh5ibO5SasBaonOxgRDGo8ZpgvKRiFYapWKT
	x6Fis9G88nCdaMSAni76EFGZ2ZxSgcjI4EadOb9UizUWuu5nkkrGQro3fpIXxfL8xxATS4Dx1Bi
	6MTB/ITk8CvikRHoOpUDI=
X-Google-Smtp-Source: AGHT+IEwkXBY2OMy9ASrensu6jMrPB9Ho+SulT3M8md5DlEm9/4e426KOKOmOaSVBvx4B/22F0kseQ==
X-Received: by 2002:aa7:8096:0:b0:7a2:218c:962d with SMTP id d2e1a72fcca58-7a2218c974fmr29088665b3a.3.1761567479514;
        Mon, 27 Oct 2025 05:17:59 -0700 (PDT)
Received: from [192.168.0.8] ([2804:14c:490:135b:9fc5:9b54:db50:756e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140978dfsm7943873b3a.69.2025.10.27.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:17:58 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Mon, 27 Oct 2025 09:17:53 -0300
Subject: [PATCH v2] arm64: defconfig: Enable i.MX95 drivers for pinctrl,
 Ethernet and PCIe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
X-B4-Tracking: v=1; b=H4sIAPBi/2gC/42NQQ6DIBAAv2L23G0Eg9We/EfjAWHRPSAGrLEx/
 r3UF/Q4c5g5IFFkSvAsDoi0ceIwZ5C3Asyk55GQbWaQpVSilBW+l7RG0h7Z763C5HU0aMmZMDs
 esWkf0g6qUq1oIEeWSI73a/DqM0+c1hA/128TP/t3ehMosJamptqpoRKqyyVtab+b4KE/z/ML4
 OqBTM4AAAA=
X-Change-ID: 20251023-upstream-imx95-smarc-defconfig-8972db535918
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_051800_989174_C7E2BB7F 
X-CRM114-Status: GOOD (  10.99  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Enable i.MX95 pinctrl driver necessary for booting. Also enable the
missing drivers required for Ethernet and PCIe functionality. These
drivers are used on i.MX95 boards, including the NXP i.MX95 19x19 EVK.

The below configurations were enabled (listed with their DT nodes on
imx95.dtsi):

* CONFIG_PINCTRL_IMX_SCMI for the `scmi_iomuxc` pinctrl.
* CONFIG_CLK_IMX95_BLK_CTL for the HSIO domain clock controller
  (`hsio_blk_ctl`) used by the PCIe controller.
* CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
  (`netc_blk_ctrl`).
* CONFIG_NXP_ENETC4 for the Ethernet controller (`enetc_port*`).

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
Changes in v2:
- Rephrase the commit message to clearly explain why these configs were
  enabled and on which boards they are used.
- Link to v1:
  https://lore.kernel.org/r/20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
 CONFIG_FSL_DPAA_ETH=y
 CONFIG_FSL_DPAA2_ETH=y
 CONFIG_FSL_ENETC=y
+CONFIG_NXP_ENETC4=m
 CONFIG_FSL_ENETC_VF=y
 CONFIG_FSL_ENETC_QOS=y
+CONFIG_NXP_NETC_BLK_CTRL=m
 CONFIG_HIX5HD2_GMAC=y
 CONFIG_HNS_DSAF=y
 CONFIG_HNS_ENET=y
@@ -615,6 +617,7 @@ CONFIG_PINCTRL_IMX8DXL=y
 CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
+CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
@@ -1349,6 +1352,7 @@ CONFIG_CLK_IMX8MQ=y
 CONFIG_CLK_IMX8QXP=y
 CONFIG_CLK_IMX8ULP=y
 CONFIG_CLK_IMX93=y
+CONFIG_CLK_IMX95_BLK_CTL=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_MT8192_AUDSYS=y
 CONFIG_COMMON_CLK_MT8192_CAMSYS=y

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251023-upstream-imx95-smarc-defconfig-8972db535918

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>


