Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4ACC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=; b=Y1vHMwDl9JtJfLgFtm028imXex
	gpooCI2OflgEjxPT0pfWxOTWeWdE70VHMRZbl2zukgF+qmcCCDLJbMD4owFq7XofNZkydI90wJMQd
	3bA6mgv+j80hZVZE4WyTXRuWUDQoUVO1Ohy7bJw/vsEVMo+ngeLSAMHPn+ZYMwzGwPF8bv6KpA01G
	MeAur7RB/dtZH1A4bcjbVNfTwi1pHbjOsjVY4hTOdM2UI5+guJk7HjWkoh3Ger7i5vFdTdWjBxkIe
	fIIQKlrxCT37/7JhijSBLajphJDhklZbldYAovY0enYzBHJotcP52jqAdFqguVyMJAho3LIxox+oe
	gqSN+O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnsDk-00000009kqQ-37EW;
	Fri, 28 Feb 2025 04:43:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tns3J-00000009jkI-1ADT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:32:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-221206dbd7eso34954785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717164; x=1741321964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=YUEf94qpLwQsg1MUfpKHxbCddGS+X7MwbkQpMMLcHJWlyT5I2aNTKI0JNxPFVZ80Lt
         5UYq2urQPyObNNgJd7he6992cytshm5iRGGNoh9HvAk9fi17cJtSw7ThiePP3apL0BK6
         1tho40hQlcLXjWIw8gFYketeydfb6s1w+0wAGbr42QsoDH8x2VxeiHeU8vcEQwx5rzdx
         AEph6OBvsZDLMpGu4SMdvRyZs3O/VT/d8SXW+FagIc1Hjv3FPTZacsXAfS0wGLCBsgrD
         hIcSfd2bY8JL2xVVs5YzMb6UREmohCfMbivStH+f09owzntg47vFleSek1TX57PcQvAA
         nIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717164; x=1741321964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=jR/av4jRq8sNLkt9A5KVYdSul5gmzoTfNFXYnhseS8ts4IWZhyepVDs6YIZuNuboEO
         8OCTtbkQGBtFv3hARGcO2KLMxbhitbUYzSM5ySAEfwd9OoK3lnN/2nq7NMZ1qqfmImjt
         7tU45FjVovEOLn7dg6KYWi8Dz0jzesrxirTFZi1s1mH57cH0AbarU9axbfrcNtakyWc0
         6L+I2dKYmSjkHg9xf3Xa9hp6rmMAWudRpc0UJEp7gAoUqhSAjdW5wGoFWg3qqa/9/jl3
         7OXh159ENMPeRvpqlNXN0URrsCKo0WeM6Yg1EBJiroxAzKsy0hW/aKiXBTRtALAjcLCl
         sT+w==
X-Forwarded-Encrypted: i=1; AJvYcCXYwldcVuWArJGfcGnJM5aVae/yBKVZ1gnW6m5pcpGvsCksKWEbsPvlmyQUdzvB5Ww/ioikpJ9zf11ZayVtxzEc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0LgnIruE3Y6Lam0e7JFXs5OTEVF9Ndyc6mkTIEOfzmgv3fHQv
	5U6Wc2P2uQ2DCW54QXacCh7s6l6S/c2YAQS60e5F/VoI3oYUePBq
X-Gm-Gg: ASbGncvs9lFWL5mgFBCnptyWE7lcUSakYYd/c+HMOA6X1FJT6UNxz+lIU8fhl/Ohrna
	hHU7xeVX8DJlIxZshsawvO3/2y9KzFIq3z0Dh6t2YtncK9ZsH7aijuKDiXuW0oJNusuVyKt1Ge7
	rXf6MEl+3MYoBWY5rm3t15SzIda31pLit1lN1eKhMPMqnaizJaxfNN1kwA+maOqa4tVynj1BNgW
	e1NUroDrEUiDSqw47IiezTSxHrH+v1E7uONHXDmivJ5hwa2ZcfiWn5DZFpamWThSzm7xqdMcO63
	KkEk6M0rBaH9IQYr+Q3D+hZ0CqTc
X-Google-Smtp-Source: AGHT+IFg+5uSUdQKIcOHevPwG4gvUUQENF+9eyVR2fAjMayvJLeh1aOJcH0DAR6JTEfeSuEC7g5pVA==
X-Received: by 2002:a17:902:d2cb:b0:223:6747:f82b with SMTP id d9443c01a7336-22368f7b57dmr23171675ad.13.1740717164467;
        Thu, 27 Feb 2025 20:32:44 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:14 +0800
Subject: [PATCH RESEND v2 3/5] arm64: dts: apple: s800-0-3: Add backlight
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-3-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxhDOkEVgFMoHt2H5tos2j7LWBw/x05ZWAHF
 NRQYG5630CJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YQAKCRABygi3psUI
 JHhLD/439IiiPVawDXH40dmN+seX0BnrtlZbTnT4P9BBeN5zdSNzGHqHh94qyfcKmxmBrtq/bTN
 gW2HoumEraTXleq1xX4hZ96EftfEX2+5HNEFIkG91mHYm70hidQoUDl4xvnNoFQpLjOQgOuRvfq
 CoTwGW7MZo7ay3RBYs3aejti7nar3SahGDUsezigcbsVyy+8N6FnfZldKfR1XudUoRdIfuPFQqp
 LI7pmArkKbxpBckFFpgNZPBJx62yuVeHTux967NeAr9BrPb1zg0Jt/CmB1fdvbLY9U/1zP1zB9k
 PkiNrhb43ZkPbNJZkCt2j1E3pvkcAJoGn/WQPGAdYd6lMfnYD/BD0/JvrzeembDujbuvLUTw3kD
 6MwSJ3P0+s3xhwtfWtA1TUJeCo0fYBbwbX2E1ncAmJnnWYDkZniCrb9lxMC3sRiR6XLSb/IBIxA
 PY3gqhc3wC7pAKvDLtHTFDFt7iYW15i/+WQSWNNB72XT8g+uSKMSx+cW+Y33PJmVFX10oney8vd
 1Xu+mds8Y4zr4PxcKdANjx68nCq1p6he/Nmi9oPJHVYd7G4uSOfbGYQWpcJ/xyp0sVWW7Q+uE/6
 ctWq91Dh5IqIeHfYtZ586dPngN0B8mV/izNXOZu3J8yBYVKeLmoY+js8yu9mKJlU6oazQREuREQ
 4clw5j3mOl4IgHQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_203245_310188_C1173731 
X-CRM114-Status: GOOD (  10.09  )
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

Add DWI backlight controller nodes for Apple A9 SoC, and enable it for:

- iPhone 6
- iPhone 6s
- iPhone SE
- iPad 5

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
index 4276bd890e81b16f19b04e1716a55f32f9a371d9..cb42c5f2c1b6caed4ae04ca0b6173e23bbda47f0 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 2aec49f0da6467519aeb2561d00b14f46fe216fb..c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -91,6 +91,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,s8000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1


