Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556EACAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=; b=T/0uZCpstuLlg3KAAfRU2GzTqS
	iPTx1ZXUP/7dsrtoDy8EcvMUOxCTMe1BrEcY+zlsP9Sm5x9vaT5ZUmoa7ZzcbG0pA0KMAeNdIVvXl
	JquC64YrAnCv9iv4yAXcngI4cqjge058UQj6zXP1ZC4eXOm/OlwSg/PbUTO6dmpuKS0pBbP7JboCA
	FMXL12KP5ReEUQMAIPX9FcmrMvHW9YFGjOiOaSh3YKqaKjZ7TanWQUZWduufVoEwzds0zMAia+zp1
	DpYMfmV9xNOPEh1N6HLzVW6tuVT6ojiBfKQj35XqBndCZ3nT3s2UPB+cFAoGrNbnFpkzTp+RwDkmO
	ua1Lp+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0w-00000004gza-3p5d;
	Tue, 30 Sep 2025 08:47:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0j-00000004gos-0jKt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:47:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e317bc647so36092705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222019; x=1759826819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
        b=htP3DxUUFEgJzxbn0hoqacEBprMD+EirTlcnfBmDA9XDfTTfRD8MjYkzCB9vVmiw62
         CuNtTWOn1kZnXAI9JQVkB//DRbM4IcHt1TShCyhAe+QIrGj3u3kzbwwW7+ALvWiKN0iB
         +o3zvjGkiGva0LBR/+RkGPIcxOsRiKuTIWVHDdAH/M53gmVteaDGigi19XQYup1Ioy+P
         MUU3ywUt7iSXZ8yt7e8SSq0nZOKDoptACQnkvXTzYGFiIEuwjhDA+ecwqdol6flhi+Dc
         gg63P6KejRxF5nHZqe1Ulxt1wHgLOxn7xSreeFWT4Ey/P7BUdf+KTuUKG57Nx1RGWrLJ
         SCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222019; x=1759826819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkTVKKAKgDTt3rd0xPFa8W7IH6WaF3o91NFw0CHdy6w=;
        b=TZZ3LhKCWrzCMBxzhwNaiJr91glzd14OYxRpKAOFqB2mtAS+a25toD7bCjw0Z4FW06
         es8JJqMZz5kJi2tOKZ7CQqCg+EMyYrXq5sZjptsJIl9i3xHgfjj60NUESbWW8jDs1+NZ
         NiQZvOS3DU7QBsJvLqkaTTWMFASArpotX8U/sBQLa7MdiHcJJa0fS3brtLvycEyOj0BP
         UQmzJ4CAa63UaxWLO28ftR7NE03FlHdY1r5/ldhzTCtpK9HxHPNLEZLhvZ8hIoCldl4G
         Fhyq7k20u1RXIoxZ85hzt7tszdp9j9nXYDUQlEIp43ZWvibW09ktbjzRXplqkKVVxZRA
         eITA==
X-Forwarded-Encrypted: i=1; AJvYcCVLJNCfq5JxBQbkpsTgvGr+4oNmirot/dJTTCvYnF1+fLew4xvzvHwskIt3KYnbNgYlAC6GwKBL6IP+WwahvxS2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7q7mNT/BQ0lsc9dOpAXSuoC073EFamCAC1AJ3tYY5DHybMQln
	iR46TVdl3OLvLgBV2bHrqyrBHG0i4ljfhkP3l7CF1SyLZ1oc49Rn85fh
X-Gm-Gg: ASbGnctMwUInAvQHw3N0X62o6z7sXya//jYiy+SqQA25/+cm0xd6mGgv1FLH944h90S
	hnILg7nbYRrFAJxBBwCSP5BEqn+v6/jgb0TPaaUj6cYPkhF+qxHTyWYAaEeyH0mjlzluiivsFfA
	1pXW28tIA8lD8xFtM1f4NNvKotHGdza9yw9OSsj6r6TR0DUmBDUv7cYPYfwKZE/kzIQRjZjFegs
	5dhtX48GM8hnBBK9+O+B5LVxVpO2AIoDYhoRe21kqhI8prnLmQbwCLysmZZPE//lhFQmYMGP3Fw
	XgqABo3UY2qfo7K0zEao9RQlqVUI2ABZ5LgWTgIf6ZmiVGuB8GSDt1GgmPzaKd9TO/U4KmqIDwY
	5uotUpBvETX+ofR/JfV+ctZX9TO8oplM4Fe6HOWOTj6h6h2x6mJNmB0yqmU1JadAde8bOdVfO5a
	kMfI7rcl7LlBI7qDEVYDZ6VBvTrtuTYvTZSVJsCoei
X-Google-Smtp-Source: AGHT+IF8wHDDTceWxUz+RFjOgHkPZcIHe9m5mYQi6GvRX5Bpn1/rX4YugXhmgUIs5mTCb6j8tM/B3A==
X-Received: by 2002:a05:600c:3f12:b0:46e:42cb:d93f with SMTP id 5b1f17b1804b1-46e42cbdbacmr127109955e9.15.1759222019299;
        Tue, 30 Sep 2025 01:46:59 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e572683ccsm48034325e9.22.2025.09.30.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:46:58 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:49 +0200
Subject: [PATCH v8 6/7] arm64: dts: st: add LPDDR channel to stm32mp257f-dk
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-6-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014701_249953_E5503A33 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits LPDDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a278a1e3ce03..45ffa358c800 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -54,6 +54,13 @@ led-blue {
 		};
 	};
 
+	lpddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,lpddr4-channel";
+		io-width = <32>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x1 0x0>;

-- 
2.43.0


