Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64863C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FUNH5OV+WC/QzjXwldloXCvwJvNBFYqSY2qbuibPXTY=; b=0jtezeZnQRaRXQ08oj7ATAZ1Az
	MqFRK66llDl2sUZq5i0xFXl5JD8LHZQe3Rha/GmkdpdPeS3Nvm9QJuQ84xyCHyI517A6wiC5+2/Gm
	VOMo/sdNWc3AhGkPOrhDrcoMV+yMm3CWgIggBspRH+13kHwYb0cVhDM/SabylRpU68Idt8h0naSoZ
	KAy9i2DcBcYgEQ0iWwsLGs8btR55K3h7csQnoSG4C0IRJ3EM7IuYz2svXNRyaSE4cYDMAlsIf12Sd
	Axjw4icoAx7QApIaEbPgmETs1cedoAm87cpfrJP6jrjhrhlZxTJDEAyliwgaSh5+/QKXL5OItJiko
	4FLVVkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtts-00000005uJt-3LMQ;
	Mon, 20 Jan 2025 15:41:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtra-00000005tw8-3Vrs;
	Mon, 20 Jan 2025 15:38:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436281c8a38so33064965e9.3;
        Mon, 20 Jan 2025 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387533; x=1737992333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUNH5OV+WC/QzjXwldloXCvwJvNBFYqSY2qbuibPXTY=;
        b=d2FY+L6pzvDmVoa3DNz8becx6ZpDKfu3cKsCp00cFjP0Bu01l9uhOeUbSFbj396R6K
         CAoImERvSVO2mh47dh5+LFyh904qdkpGWjoJhWhQUc8SXuvX064Pm2ZXAI23jjtq195B
         67FRtG6XhzPZSrDktwFS4jtWMPKvUzfKDHFy/Z8OKkCNJRgIw3hqWSakK7lldTmb9UPl
         aCZZDAONM98iIyJNnQoGrhBusy8/YZeU+KUwk6paJvQxw3KdXuNsBwQjiSvAAkzqancZ
         tZSWF3wpsZ80TFuMIrlnx4EsvKQmiTRbf7B54tlqYDUEZoaCNl7997ksy9rUoeR1zTEY
         UiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387533; x=1737992333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUNH5OV+WC/QzjXwldloXCvwJvNBFYqSY2qbuibPXTY=;
        b=bI5PQ/culMmb/VegVWFuKqtxeW+PoPBBvjrfVOmLK/DBg/CidnIySmkeIprbpoAi4o
         AEGjQ9zp+PaNgzEgSGJyJyfkFEH58JKZ940USdX3bCzuIAWojKhMbpwdHdR1pb50baE+
         g3JbckWJ4QB+FoDdGxpuChXHzcOTZ44wD3qk0GMOq1x1M87dDchx8rWgfsU7z66bucKo
         gDpj5Bssa3KrskzrxnZ3my5emB42vL0Az/NrPgVcYoAxdmD9gsfNomNHG0lTrfLTGT7g
         SqUPlLhOKf3tFatqyoeCals/+PWkWZItVAzlWOoqfdsnRT2DpJhfCQ6maZhMnqQ4jfOD
         e/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUMlLJQcb/Pf0Ok3kdwvu4NfLLCS7M1aa7V6CCvPa3jkXOSQL/kG2vBtypkKNkTOarjtEiy7iYQ60/BrgBPVxoF@lists.infradead.org, AJvYcCVBanPnm141dg6P1CLwYZghcZPgRfBUjzuyrRNZKckIHeA923d2bPozUHA4PVP1hSn3m4Egpd7Q8r4f/xBJUjY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/p4fQVgW0i+Fcrh4cyVV2NFlZdpvBEz5nxoJFK0WTTX9XzlMW
	kiA9Z2a+Zb4DGSSRSisvlySi1iCUbhhNpSCO0GOtnbUSd5evyBZz48utsg==
X-Gm-Gg: ASbGncvsX1peiRI2GRkHMvbckBo6rcNvGDbOA4p7FQBK+Wh7Nwj2sOVRPWJXBD74vqM
	srkmbsCr4G/pEOEKClWrVCu53oaSpjbYLkDWHO6Z70UwkzYS9VAt+yQl9hOtq2GeK5KphUJnoLP
	yR/hUIGAIIWqhRzzcm4oXtEluiqkvY8hwg7cKKX7NndSK7kwv+vqXTiwuJ0E+d+0gOl3bEh+4fW
	AVfxd4BmyAomP5QDOggsG37yDSAlzeXBpt7evyNvAozl2xUb9Uy3ASUOW0oC/4rFNN5i04bCPSm
	m8uesL+9IXY/vjIb6BhfoYh/nDPPC+kslEfWJew=
X-Google-Smtp-Source: AGHT+IFq/N1M/Fzfqtl5Tsax6f2eFNQebWQPzXxA/LFVpMMquGf/Nb5tqY6jgvqwOtRwfXgtC13vBQ==
X-Received: by 2002:a05:600c:4508:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-438913e1c00mr147505135e9.11.1737387532941;
        Mon, 20 Jan 2025 07:38:52 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438904084e7sm144141375e9.6.2025.01.20.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:38:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pmdomain: airoha: Fix compilation error with Clang-20 and Thumb2 mode
Date: Mon, 20 Jan 2025 16:38:09 +0100
Message-ID: <20250120153817.11807-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_073854_876030_FE15D551 
X-CRM114-Status: UNSURE (   9.77  )
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

The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
hooks are inserted via the -pg switch.

This is a known issue and similar driver workaround this with a Makefile
ifdef. Exact workaround are applied in
drivers/firmware/arm_scmi/transports/Makefile and other similar driver.

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pmdomain/mediatek/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
index 0f6edce9239b..18ba92e3c418 100644
--- a/drivers/pmdomain/mediatek/Makefile
+++ b/drivers/pmdomain/mediatek/Makefile
@@ -2,3 +2,10 @@
 obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
 obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN) 	+= airoha-cpu-pmdomain.o
+
+ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
+# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
+# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
+# hooks are inserted via the -pg switch.
+CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
+endif
-- 
2.47.1


