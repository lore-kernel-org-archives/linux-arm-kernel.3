Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DD8D609D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=; b=2Oysu8iHTIzq3yGGPN6kq22B7G
	cE7r9Sx7ygsKLu4ne5BqhDAnQpo9nOXhzZ5lkw+bPxT5KOjxXGyNM4C5bagszxVEfzU8KokCdFDkY
	yNjCdnUpT3T/NhcezD/pQzYBfvofZAwYuE8nPtqm9+/Df3WBp5RDggWEGDzLf2NPOcx0aXQmfSaLr
	wBQx5Ztwl34/ZS5yA9SVWLj4/LeNVMZA2QCrS9RWrq/LZK/InNHYq2zldnlJtA518RZV3VwsqBAEk
	QsOKVgz2V87G0icT8KA9jfmnNxi0k7cfGn4wjZo/HeJjnIaZSQfNwcIw5GhnSv6Y7eak3qLvyZZdv
	DgZN1P4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFwk-0000000Cxl7-2Cy7;
	Wed, 27 Nov 2024 11:11:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFni-0000000Cw16-2zio
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:43 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa532dcb470so266317666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705301; x=1733310101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=;
        b=y5bmkp1tnY8Mexgi2r5QcvRMKXBu0WBxEGUE2mXNW+bzVP6wb1O2bfd9sgjhIwSNKL
         0VhFiBTxl/pyqxX7RxtB3hEzY/xYigELbrr513MUkckMCLHl0DyZXvTUgq+1oFrGkR7U
         OVuwqReJHjgsiYgqIzM/D4wmo7waY1L9KlnAX3nOXpyb5XoqII8ZgflfOc0eGsrvDRD3
         YkZ1wHwKB6oy1pgP11d695GFomy/bqigoX1YEChrrMcRzi8pmrNxNvWH59SUeGpCmiGk
         7W6qSZWXqth6cGtEsKSC9e25P/ucQyrjSyH1xzNgjTsL3RnuiByYAVtkipklbiVNGrww
         njng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705301; x=1733310101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VB/ikfiNeJLME2Jkz2PKwShANoRD6KN3KhS7opfVViA=;
        b=Px0HlBIF1/po3XXWJ1MB6fd2f/cUUq4hVY2hfeBnK8nbN9VUCApp1fIamB+8BSTyR3
         N1jvVMHF7jXs6fPGQ3p0w8iKb7Tfift3E4JhtJkm2pjXWSY1h6NOOR5fjqfYQiov7RvM
         CqfZZgpu8+lAoCEOkwLQ2L5yrK7ENeBNw9nHBPpUAEZeSyoS7uXd3+wYgVcoSImdHgfk
         X91JU7aQWOnnb3L97Y/TZwTvr/t6plOesd6nJsk5H9nnQ2WWQeWvp0veLAtw442EOZWa
         ZugdGFQB9i3D6MUt1eMDTlN/G3i9duRpBE0t2qj4kGic6AG+JiCahCKe5j/BEjpwJ8wF
         k3aA==
X-Forwarded-Encrypted: i=1; AJvYcCWWFT5dGn65ypWaPZetW77OAYuJtmx3XLFIf+E0nwtA8EinfG3Bx6RDZjfQ6Nz3T0LhSWv4BlA5hDSBSXtuQP49@lists.infradead.org
X-Gm-Message-State: AOJu0YzLj4qLVIKzWgsJyxnkVsFq+mFPu09QPb95Etl8JehZ0KIpQnTf
	91oPQWtaW5ZH9EH3FoIh2pwjpV60oiyklSZFV24EN6tDQ0CdgalpqWx7sLMt0/A=
X-Gm-Gg: ASbGncvKubBIEsEvMPu4U4PMgbyCB1TUs7HsuhLDXqhkyD5VH0lHuWT6gYrF+eBIeaw
	nfpITNh93S0zjBz0ExgpXzvez/4LQWfUwzyDXlT6rtWZoKjidKDEUKnMzmt6T9JYNh3jkTWPsSD
	C5UKn+taLClt1raLgdHJp2WKV9/jeSiPi1ArX6//xAeyzya4Pvc4Fq/4w7/DS2DwVYtzgkDsw2s
	HGA6KvgXRBO2FPeBeHCKpoiwkmDB1Ipc49Pgdx8f2X7H3pXWtVX00/eSWUM9ujt1qJYH/AknxFE
	l3bethVB8fVHXpxGF38IwaR/Ehifd1gVqA==
X-Google-Smtp-Source: AGHT+IFomp5IYrPwtodVx4NfkTQ1BU4IT3aD00OknD9fip4RuVHiqXSHZTCSxH7nkJmeEnB3wrFv4A==
X-Received: by 2002:a05:6402:1d55:b0:5d0:88ea:6560 with SMTP id 4fb4d7f45d1cf-5d088ea65a4mr876701a12.31.1732705300646;
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:39 +0000
Subject: [PATCH 1/6] arm64: defconfig: enable Maxim TCPCI driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-1-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030142_747262_D46EFDDA 
X-CRM114-Status: UNSURE (   9.04  )
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

Enable the Maxim max33359 as this is used by the gs101-oriole (Google
Pixel 6) board.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..5080fe2ce776 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1121,6 +1121,7 @@ CONFIG_USB_MASS_STORAGE=m
 CONFIG_TYPEC=m
 CONFIG_TYPEC_TCPM=m
 CONFIG_TYPEC_TCPCI=m
+CONFIG_TYPEC_TCPCI_MAXIM=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m

-- 
2.47.0.338.g60cca15819-goog


