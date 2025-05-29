Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E73CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=; b=ZfYBlbG+a+6Fk0e4JLtYl1lDX/
	tOxjW/H1YtJSyMJgP/ikSF7W6DjGbfNidr56z39KRF/DXWd6eLcr935nKJob7pEDSmQlA2T3wa2oN
	OoSNKD5Jwx9Kmx8LHfVp2YaZAm3FFXWRdaiKrEAglnuAUMIfNa/yLYLy76eFo9dKmsyU1fZx0z9Kp
	z9FfdIxepU/GBpf8SsVOSFD5FINIiyaeBTOljL7OGn73LR2mmqvNnMY/CXmAZCbB55Pg9+8P71m5Q
	j4IQb99izJotlCRqn26UQgLoqCo2L0U0n0ZMAmKRLAN3gzO43TYBcP8maZQxypi73dThAQHLenjj1
	vawRgarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKf9z-0000000G4LT-3rtD;
	Thu, 29 May 2025 15:27:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKeMP-0000000Fz0F-1PNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:35:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ad1b94382b8so166560766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748529356; x=1749134156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=;
        b=fsGXM04Il4vAJ/ZJ1W1pSfDP3Zvua5RUDoNWo+dRDXSPqm6C4NTFgFlBNEsFli2D/s
         SwnKgiVIzvor6gSqvdEUahCnUTk6MKRYiLvryO0ztbRCC/QiTvrfcZ+2Tci0Bqib5xrG
         SQDXl9Aoga0R8KnFcDcK9mU32eQfTAhz8zh74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529356; x=1749134156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkvbYTVTJvU7EjQbzb6YoDEjgSySPh9u6IORDwoh9j4=;
        b=WfE/2cM543wLg6HYPvS7067U8QpFvAT9AbKZPTLILjrI7BpdzLU+TyKIR1XfqR9HHt
         68VwglwSX/8EqPMZ7D2KcybkteCsrRQjO+ZQFnvo5qsERJBLmjsHha34GjaG/fw+vYsU
         EI4tR8sHyhuTv5jbAn45bAqXu/QtSAXcgfl8Fr+dAdoIh0W3cD/Fvn8M8zQo8RhXZcPD
         ZwX9OKpsb0MJ8B8shcot94a0Ku47XPFZWtRdbceYQbbWk1tNbpt+I2HP4YJlvaBzvuh1
         wfSu+XRAD9AvLGUNxvt2O5wdIo3yytfDQR+etukOC6OT+EjgM0R6ABns4odezMu4+LvI
         S0eg==
X-Forwarded-Encrypted: i=1; AJvYcCUPV8E+mKf7MGUliDSD1i1i70g8GmMqOuWk7DYeHiTxJqr2+tEGtxstYDji6LFicgMzgeFW0rnddxu6ZZIFBNBW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4AtkF1yB+wPlHuirjiyxbtwor1KJEJ36M54GsmkFoIFaQtLld
	GZ1V2s63dw4ySnS8RMKZWJIlBteIT1aodxc/Jq7dLKaucNF+vY9TD1YBGIModakSBPE=
X-Gm-Gg: ASbGncu2FM/SlwFVwvVVxz6wHTvB6RUPSW0h6MKsQxHd8TxB67nmBoCXkP9pInwEfXq
	F8hi7ivgt2yGIMyMUXyTyRqfTZsVmH6i2apIefP671oyrVvfe3mFQawM31e5+d/ty9XXTGYTO8v
	fSTSYRVTsv/zlIRr4M02mM+zDlFcN+Q2ulnNAF598mB9IFb2sp6g3xf1x7Ou7BCz9AHuKp1poJD
	jJYFKuydce95qXzNQdt8Ad7FskdXFcM1be1sH5tve/PfFXJS+eSIvGXev0JV2mUf068eiIgQ8zs
	dN7icagWeUF2dzhucIrD95QEUT/ujAAjP+V907lTYV1xjcvyvSk6ldjWqBQlTjXC5Rjf2ZwhBH0
	Glj/8+oynHrFNKljr
X-Google-Smtp-Source: AGHT+IH7hMfCJ++G2vbyG6z3aDCBiHFQjVGVk7csEQiSuSaeqRhezGzT9pf16kPHKXh10/ID/WoiyQ==
X-Received: by 2002:a17:907:3f29:b0:ad8:8529:4f73 with SMTP id a640c23a62f3a-adadf2a1046mr245445766b.49.1748529355765;
        Thu, 29 May 2025 07:35:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm154305866b.37.2025.05.29.07.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:35:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/6] ARM: dts: imx28: add pwm7 muxing options
Date: Thu, 29 May 2025 16:35:09 +0200
Message-ID: <20250529143544.2381031-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
References: <20250529143544.2381031-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_073557_372215_E8FFF6D0 
X-CRM114-Status: GOOD (  10.25  )
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

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0


