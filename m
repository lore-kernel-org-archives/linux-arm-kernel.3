Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E18C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SCJ0pUE2LwQE2TDd0hXt9uN83Fn/ucHR2/2/GAmZHY=; b=bQGaiWFUjxEVOfGZIMOGN4E9tM
	zfh7fO4gM9vls88jqQg/bH1Zu7yLSOxuXlkR3pZucJdpf6H1CdM17eqqgRZFAp/os+dBJR3d/XXyR
	CBXCFsRNwPqMB+Qpek/cWhCZbHQYjD/d56QH1mbhDyHNe7Nmj3ycG/eRCxUVVQ6V1PwM8jkq1MxIW
	liLSzj9UKlY4arIvn4H9m7okeHPOAJ7SjiBctxBGs7xtbuhWLBUqDwGuR4RsC3oJj0WDL1GJv9JrV
	mjlYulvK1citPlYikQ/AcialYx+5ZwjsWYvcrpVuxv2XS9gSgdcqYOXUB3Ddd9D3M1xi3tyvf2Sad
	flthGH7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6kf-00000005kLK-2jYA;
	Mon, 17 Feb 2025 19:25:57 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4UD-00000005NOj-2kul
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 17:00:50 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso710488166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 09:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811648; x=1740416448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SCJ0pUE2LwQE2TDd0hXt9uN83Fn/ucHR2/2/GAmZHY=;
        b=jEp8TvkMOVQ5mwlzJBOdVu9ZKOfCWGadibryoo2RDHlA0cHvhgjXqzflmSwOESHCpT
         kVKywGtvXrO3YKGz0OkLA3FQu6FLkcLRhQNlLInhkMtbP51s9YZV7CBiMdOKvV9loP1g
         PDeU5hhxF3x5Yyoc5orR1a+OSmjs0o2jDT3F86efmAMH5oUpU6qtq1HF8AVm8nGgpY/5
         bt2xPf1neIeghuPLq3KO3F6Qj4eim5LcU7gunxbVZXcYRXWaY8gOgjkKXKhKGdJoHmjd
         XwK14EqxSGebG/uKLlNjscc7pBU5/a3pRC3CRdb4usl8wHrHhEgPm6Cw+Xfn+p94aFgB
         T6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811648; x=1740416448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SCJ0pUE2LwQE2TDd0hXt9uN83Fn/ucHR2/2/GAmZHY=;
        b=i9jYgEV94fs5BoSyP+YWJIjXrz3FE8qfHh13ntksKbaV841F62SVXooy8xH7LjHVzl
         mo4z/0sT9u71qeDTQDiGZGVp7Kdb+pYZfR9KHLE/C9Em6423vXb2SiZtZnM8Ov5Syypa
         JTODS4B3zlDU5poQdY3OmDlPVanTTIMUyG+lgPnKUPREcyMkMWzcwqpSlapvF898FS+o
         W5iN7AwT8Smi11Xha4DK+IeuM7Y7lY7B13bZPhfimVBFIArKPfir568Zv9vF7J+pOLfC
         SjzkaJlDZLE7Jofzv/IDx/DvX9TuBPHAcwxkZPovtNcEcBRyZCmKU9r4w2AFnRlDRoW5
         t/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtDlV0jab2hnDrkDLY35k6/e40iuqsiOT+0ejXLCUE5iEN3ouJOIK/Kvm7a0TfyhmF+dPcD+b6S8W7+Z40crwP@lists.infradead.org
X-Gm-Message-State: AOJu0YzE1rfx5uVdCu+VkL08c/E7l99XTGhDxIU/+x3FXN/gQHL4KdHt
	x82FazqRg/krnrtK4luKrUTmILHJM/EGcUxxHMfELjaD+dduh0VI
X-Gm-Gg: ASbGncskZ7gjX3roov3eiu/b0ICNSt66NWF6vZw86IUJWFkbs8AnldE3erZOp05Kx1e
	ufo86Zj7Wbz4yXZc847L6Kz8vXBGlLSkBaDtsVdUl9dWhG4l9bvJ47Uz560JXsSseZ1STsEY6LG
	e/31EgBMjN3FD/TU0HmJtUScdDKAcbOw4/qmO1x0qTePEehy9Ar7y/URADWVDI74IOslkpE84Dc
	XjmLx3ZKENjFT2Vc9UOCJahB4yECgKqpZp0BLrXfoxAb/Woy7Wyo8u8KsjuSa2/HpBG6OBS86LK
	w3ufvi8czC9HosYrEg8zxrsgSPj1b7+Ti7e5pojG+Uek7OoRqMS/KA==
X-Google-Smtp-Source: AGHT+IE8uiVGrKUzV55CQFqCJ8GrM70TxsS8ElrSoepZMqDoUHx4Rfw20qczDxgzE3AFyPp76GMMbQ==
X-Received: by 2002:a17:907:9802:b0:ab7:bcc0:9067 with SMTP id a640c23a62f3a-abb70dd72f8mr1224609566b.40.1739811647800;
        Mon, 17 Feb 2025 09:00:47 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:47 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
Date: Mon, 17 Feb 2025 11:57:16 -0500
Message-Id: <20250217165718.74619-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_090049_693203_2846E87D 
X-CRM114-Status: GOOD (  11.68  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP and OCRAM_A modules from AUDIOMIX are clocked by
AUDIO_AXI_CLK_ROOT, not AUDIO_AHB_CLK_ROOT. Update the clock data
accordingly.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e0618..775f62dddb11 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -180,14 +180,14 @@ static struct clk_imx8mp_audiomix_sel sels[] = {
 	CLK_GATE("asrc", ASRC_IPG),
 	CLK_GATE("pdm", PDM_IPG),
 	CLK_GATE("earc", EARC_IPG),
-	CLK_GATE("ocrama", OCRAMA_IPG),
+	CLK_GATE_PARENT("ocrama", OCRAMA_IPG, "axi"),
 	CLK_GATE("aud2htx", AUD2HTX_IPG),
 	CLK_GATE_PARENT("earc_phy", EARC_PHY, "sai_pll_out_div2"),
 	CLK_GATE("sdma2", SDMA2_ROOT),
 	CLK_GATE("sdma3", SDMA3_ROOT),
 	CLK_GATE("spba2", SPBA2_ROOT),
-	CLK_GATE("dsp", DSP_ROOT),
-	CLK_GATE("dspdbg", DSPDBG_ROOT),
+	CLK_GATE_PARENT("dsp", DSP_ROOT, "axi"),
+	CLK_GATE_PARENT("dspdbg", DSPDBG_ROOT, "axi"),
 	CLK_GATE("edma", EDMA_ROOT),
 	CLK_GATE_PARENT("audpll", AUDPLL_ROOT, "osc_24m"),
 	CLK_GATE("mu2", MU2_ROOT),
-- 
2.34.1


