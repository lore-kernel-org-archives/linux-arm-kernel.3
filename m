Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E02D358F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1MaVol00ZtirOaVD8s5awZQiRxb5rtZJQIGYIkDlUXM=; b=ZSukFy29+HdNa9x7IwhExLwQe3
	oZw0DNLkWF602AdWg7PAXoO7CkSYnAhguzj4CW4EecF1ixdEcx1u/NmWMQNxwjFlnAqSb2HB+jpfv
	Ker43IIAYzU24abxm9HDkDDkZFIGL0woHiyeoB0ogrJg0eQAIe9/8/Y0Bsjy65Adl/8v1Zo6NDgeF
	5pfRN3B7fLoOj6PhNJUWvrBSLKtRESF/4JXc9iATOitE/sQqkR516DhoqgC9GVlzJBMkeOIN6b7VD
	0wX/hS1qTo3ep0U+ngkt31lxEEjR3LpVthquAjqbnhqDw9zF+MxasIAYgR/FXvGt1sWSkYzF1jLOc
	llU1n7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPaC-000000000dC-10DY;
	Thu, 29 Jan 2026 10:49:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlPaA-000000000cg-0HeJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 10:49:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-480706554beso8515805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 02:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769683740; x=1770288540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MaVol00ZtirOaVD8s5awZQiRxb5rtZJQIGYIkDlUXM=;
        b=XRJzmgseNF8IQl7recMR2kLVCofQfuX3ViRujzEBP2PfeOlxRwCHI1R4KJw96bzHkP
         4ldDT+YMtl2A5VNKxhSLFBJ0IxziO8rtqhLZ1w2a+RyvDYoQtp5BpGrgVKOrFL9tUVij
         L0hpTnKywfHOv0ellLqSrHDow4gzRywYwutsoAbOURyOZj39qbEy+8Gl4vbFzr1WXQPa
         ODWDsWoW3hPK2cg96DAru9rRoQ5kKhKaNgWv908PM7PDx8y6kf4jEPTDY5SB5TZPihiN
         nuWlIdFsRBq5C6sAIq/o0rMenCyl3tOrf9PIY6Y6C2jz424FSqRkCDUgPTaV9IgAXrMS
         VxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683740; x=1770288540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MaVol00ZtirOaVD8s5awZQiRxb5rtZJQIGYIkDlUXM=;
        b=iDtxdyLjaD0i7Jjw2tySNo7d3e9iFUo2l6xV0VwyN3CdgoXJuUQwDV36jQRrzMI8aL
         ReMi7n+xNk1pFVMp9OsMMtyc9BndItA7zxuh0Kfd/f1PlJGN27H4k5bgySq3xw87smYy
         yAVzMkQMnWOdJcpZLGQNiJOJLpurlfm0zo7fFIvCZnsCb+TYGbBapiI29VmreA+pRt+e
         UIvCM6m22mJMJRSeg2ovi41zXvZN/O4i8Qnvz7jqvNsdNJbu8ZaZvbT6Aebzz/Qsjn3p
         9jNA9ifsvdsFNpsVczBSH3zUji8A70mwNxYWLGeSX+WJ/QxpCCPE7wfByRd5Pg0b1QU7
         65lA==
X-Forwarded-Encrypted: i=1; AJvYcCVAOyFH6zHso4kzky2li+wQQGRYfVLPwlFpmK7cNuxEi1DUptLgIyL7JOq01OXHk97t2/hPRKaT1NvjhPGrT4ry@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0u9BKnrcjMMhLyrbGC1a2uxV/i9gYhM1RgC/LYjuOCMer3GNx
	POSQy4mT4VrLTZ0qm4Zpj5hj9leTuBBeX1LgzBgV2LcMgSjWjSR+ZGQq
X-Gm-Gg: AZuq6aLg2T9V65dXkIfY8ROf0axyX2KYYOyhS0bgwGjrpwU8MN0ewOgEPjVlBawR+Gk
	Vvcej7MPXBzS7TBOkm44PX6YYTXtS4vQUvIJTkWbhprfjWLiygr9UpKDbTKlOGJhuUG5hmwsX9I
	vGEmCbSNOOX+TaAxkeDDwhLUSBlR+gX5WyTvgkN27IAQFG3LMELEEtlxKMqFYvtzLvqmIBD0iAO
	TVHDIwMqfCKBWF7IYO0ePOtx94BHRWbinHpfcmNGYep7t8dC2uj6TlopztM/B2Xypv0wR53oHeC
	rfIav9FNycGdO0V65TLvN1JxCHPHgasnsdSzdhxzA1pWLc/BkGKjqAXzejdocdsQ+oTqcd0nswa
	kfxOM5DX0/R84jRyk9llRY5ltNRbNI7JH3bT9kbYgIz8YGUbAZu+f4AxJQyfoG3SrZa3W7ATRG4
	B2hCFa0rz6tmhrukf5IuT5OZc0XPIcK8ILNhRJvynVlFbCVovp3a8dxpVyQVuqsQkU6QK396zHj
	drMAmI0Zi/2XXMP/O7HDIZdu6vo9w==
X-Received: by 2002:a05:600c:83ca:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48069c1a96emr105858205e9.12.1769683739413;
        Thu, 29 Jan 2026 02:48:59 -0800 (PST)
Received: from emanuele-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ed952sm13365525f8f.10.2026.01.29.02.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:48:58 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: fix PMIC_SD2_VSEL label position
Date: Thu, 29 Jan 2026 11:47:35 +0100
Message-ID: <20260129104741.888670-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_024902_116307_99352F26 
X-CRM114-Status: GOOD (  10.43  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Fix the PMIC_SD2_VSEL gpio-line-name position. It should be on line 19
of gpio3, not line 20.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Cc: stable@vger.kernel.org
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..f64c05dc50f8 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -262,7 +262,6 @@ &gpio3 {
 			  "",
 			  "",
 			  "",
-			  "",
 			  "PMIC_SD2_VSEL";
 	status = "okay";
 };
-- 
2.43.0


