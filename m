Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A415CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3K9HF74mxQXiOLLFFTSuE0GixIWTnEsWf8ibJCzoHw=; b=xruhFnpuiWSR2O/whzBCFFHBtG
	29tvADvMBcZTB1+I7Gu5zMK1dKkprstPcWw6D4P/bp/tpFlgPbxRUIjO3R2AXz2AMmRWyb7l9r6iQ
	Zr0fpGneQ7TeHN17QAwOkCcnxkHej6jZ33LptwYEnb1ySZSh5l6tKgb6q1S3Up/OB4r8xpSgw/gaq
	5jvTrcZJg0IQRzJrkgdrQzKZsun/qaECmhpZnU4wREtv2N/ZXw3gB5GnzQheyjo/so6+4bA9WFwez
	t4W8Na725vRYO/vY6pc1h2h727xZ4dThMQ6X0VBceXAiiOowWOEKY89bNvZGSEw4ubKdM/9lcvZJF
	lLPIkNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXD3-00000008E7G-2e1U;
	Tue, 16 Sep 2025 15:03:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyXD1-00000008E53-0ZDk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 15:03:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so18486475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034985; x=1758639785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3K9HF74mxQXiOLLFFTSuE0GixIWTnEsWf8ibJCzoHw=;
        b=joMSh8RLd2Ux0W2Epa9bpM+7WN38TI3U8Ri/4DiXH7dCMrbPcegjNwnIeCNjwc+0Ef
         45F/oFLbe6tAhQ++5xIyKPJIftP/H8V3atzAbpURX1vwq1HD3KpmOyr2qtBcsiUUlPnh
         rCW/SPxgBOp8YLOgc49DlZl3RYfFmjUUeFQonfVP/VrXyirIcT7H+y5hW6kdPfni97er
         gB00UyVBfaWpNK81USkne18RYVG7NtvgvRLywzDp0DNkIOw120MfGvBX8xzU7pTq1wNf
         7s5kLW6Pd8LBD1/yaLQcFu+njumjyWvpy6BVAnnsTEXPR+Zl4ObVvnsHCjZSNexEgcdZ
         GWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034985; x=1758639785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3K9HF74mxQXiOLLFFTSuE0GixIWTnEsWf8ibJCzoHw=;
        b=b5XlpG5L/h85ra0t+3NpkjO1zgCIvSFawWNXqJSpEKYHB6UxOcWYL4UZiBqSQWNgD5
         U1JeOJ2WLlZhwfOLGFFd6I3gDIzBiWal1HrucdaehgtnZt6eKp+2J7NSWpauVa7NgXZb
         BXYtkMNlYNhXS99X59Eq99VCD0OeL27IvPNWEGHvhMtqR6Pw7w2G2nwwFPAud3xXSKNS
         q6jILqdhAmm7FILV85mSXjBdKiOyAEjykUc44IcmwB3YzL6nUw2U/xRYsftmtamzvukN
         993j65PVORgXJVcvs8yCRNINjloejim+Qh9tthZA+i/Sk4QexskJc4bAKVIwLQ4m7wnU
         yIsg==
X-Forwarded-Encrypted: i=1; AJvYcCU7t+6H3wh00ZUuBbiXpwvItD6CyA7PO/LKNpxJ0Qk8dPruDq70khPEztVQjTCivSt0xS7gRdG2vQN+80J7FPtp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw49GY1Z7M+z6bLisXmirN0oJytsMWKfcuM4M/XSflVoM4unMeK
	18CWpiupJRrRhLDnOsa6cVp09wilQPJJ+7745o+1mGp62ylFQVlmZzez
X-Gm-Gg: ASbGnctTQr45pzpgAPkw07eloZpo1bJKPaqXAd/LQb0IzdfXVKDftnYAPRjoxb9m0x9
	3WDEbGlUl6TViTDOA/kd2IIrjxO9KGr9z/l9CLTwFXVEglvdBSNS7nvyUSKGfIiQi0Y5dKjn9rc
	AesafcL5ecr5x0j7vJJeNUogdeaA4M/68KHHoqoEjRLP0ffF1yyYuQ0BZCg26AXiiOvNnbUo6Jj
	M/EhKJHd8JpNECgWBf3CWKLzugUNG05yUFG6H/ooEaGI+uves67KJDiuR9SJaV0+qGTDbXQH516
	o81PdBaj1l73+/wLUJDQHGEd/KSINLPNpEUCk3X3QtMGSdZwXJ7l1YHv2pzXC6bV9F/j9YvEEe9
	OCUwp32MLeqW2QUGcYg2PjLg5qGW1g3fCuybosvPpkDlPJPyx/anVgiRzs2uv7vHXhjkENDZf5P
	C2aA==
X-Google-Smtp-Source: AGHT+IGjLufNti220Cb2/jo69dHoi79tKr9fu2kHOT12ewBTg4Sxo+8fUT0WB40XsjZIq8dDSZz06g==
X-Received: by 2002:a05:600c:5487:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45f32d49432mr30917625e9.17.1758034984912;
        Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
Date: Tue, 16 Sep 2025 16:02:45 +0100
Message-ID: <20250916150255.4231-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_080307_188169_91A0C939 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 69bdb56a3d9e..14356d40f42f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1650,6 +1650,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
+CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
2.43.0


