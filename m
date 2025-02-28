Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF3C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=; b=upkFiB7YnzaXcFXdEj6iCHAnVB
	74lBGIsszVlQs84porwhRjCLbZv1o1mQq46qxB/aIxuA7ANheoIT0FIOEbs9f7a6t0z6SjRSWs9Lq
	fJp1pEyw0nZhv1nmOxxlo/aa9LoaLSsTl23RmEP/6dqXtTTx08JVs1Z6etQfBKawwYZN1s1xZ1T65
	vdgQAMBGRYHk5swl0Rr8JgsCqY2aSYX9jqvHDb3Say15tPFBtk3y+YA4RzvAv3R7NTd1A/FVGLUYN
	IUOZWQgqtsFmeUKN1H7fcNIr16Vskg59T0q/KS3YUn7zM7T9ppFCcSrvcKzPKkhn71BPUPXO3NFF4
	dPSpRBVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnsAi-00000009kdn-20BD;
	Fri, 28 Feb 2025 04:40:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tns3D-00000009jiS-3CbP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:32:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22114b800f7so34043475ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717159; x=1741321959; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=CX11Rk52i8EjNLNxb54sMd2WqZI4tgYKm4576la84JVRyhzOwTW3VALt+nZSUT8tzk
         wW96q0/2GSKb2/7CGm0wudawM6bSb3Lum1WghEB8jhCCToXpLXYiAASmxsYnA4Rrwfh1
         xrRquvnkgrj0bLwViNI6ZqALkzGSyqyr6zvJuL1PwBwhUlVnlkdyBAtAFxpaO1IJ76RH
         LmO+vQrzH/tNgqySRGebIg+jfuxGv/7gQBUpCJdRNn+tJdgMcDrX7oDZwc16pmBCLnaV
         yJM8yYZMNkTx7WnOIZUBESoG/6v1/nG6axvKjVrP/5AfxaMr6M/ecOHCPjqJTyurO/Pe
         GMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717159; x=1741321959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMVlCD7xq/rs92dyB+px8zy2TgvRUJqxcNz228drEoM=;
        b=t4w0m/wwTi4a6T2SdvilM/3ZNLi0cdW+NBUbCGY8Mldzu/5Mq2JA6BIabUOaY5Wwjt
         ESzESaToZ/rCPiPNMJzgRpKz/hUonbCMB9Rdh2IaHq9LJ5+dUjDsnghymENX96GbaJfQ
         +qIN3B+bzUSYjbpbH2xbrEt0endhNOc4y5HQ0QaeSLgRvCyGjKT2wWlKYwxZ27XwFLQ5
         X+AoVKVMsnSMc6TINRceZLVJBxC2cPliYNOqUq5pnYqWaj7agld1rqs09yvpK4XAzHq+
         oUCxzAzMcPfApyHwca407k34FL+XazrAafe+kMcbw0yIMLC5+9BgAgpywR6PqNWExO/H
         fRdw==
X-Forwarded-Encrypted: i=1; AJvYcCUXSaR6BkNwRlDgPHAmtLx6X/1zyqF5HcvS6aVAXWAktl38XBcl9rumGh8mxSooDAWT+7BgBM1x++13fsvdsmV8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5GwmOc+OHQdX4/gCrKTK2XxwL6jDdvukMwzx8vOwfNrbsrOhR
	Kwb0FZGii6s1bLmGC5M3xj+jBD9xocZr99SXGFnB1YgNZL6gvPzf
X-Gm-Gg: ASbGncvEB6jJ5pmEW25GDtc/5ouFhUhWJqIDIJ1gwbGNhQ838x8a4+EDKI5LSIwZFhh
	ynTCYMyu19EW1ODQv3DXCvVFon0BldVtMputeDxwRSWAl8zVnuQaAOzlzeRyxrgFaEK9yLmtjGu
	bUL7MWUdnKvXlgskOm/m/9lgcUTGXQQEQFG8W0AsbUvygsd+DYU9g2/ybeYnX2TJMdtjnv1nAq1
	Jk/5b6hFvxOkVc0mOowRWyznWakLzsn43cAydwOq3JVWHiIA9WUVsRIOgMEjp9w3hSp/jj+QjY7
	2e/AjuhiRsrBFBCL89/dfpYqpViI
X-Google-Smtp-Source: AGHT+IHE0slnoj1dLL31W5pNwR3MT6F6XW45z1UHlyHXxfZwkoScSUmF1CY7KEGntHtKZdVlTDIAFA==
X-Received: by 2002:a05:6a00:3d0c:b0:732:1d12:ded4 with SMTP id d2e1a72fcca58-734ac351c0bmr3387428b3a.7.1740717159101;
        Thu, 27 Feb 2025 20:32:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:12 +0800
Subject: [PATCH RESEND v2 1/5] arm64: dts: apple: s5l8960x: Add backlight
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-1-69e450bc4bfb@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=BydltNMBU6F6QLU63AOuc0xk1HyAvUD4tBSVKN7rc/0=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxgSjorsYapWG/OMe21bzD4rgcuzKN59JmE2
 75tJQKHpzqJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YAAKCRABygi3psUI
 JJ7BD/9+XOvBJhJh3yhB31rFrSWknM4j1ymksznUPbOzne2b7fqk/ZGcdC1RrFaAx8fjuuLPtZp
 LUdUjBEGjY8LqLHaY65VjyMHUgufgBGtUx7qX5r/UagWkIbIkaMrDy2JcuPBCfzuh9fKkS+8Ukg
 s3Cmup+YltkNCOf496+KFezkmNhuhTGMp5bRFEf5elpWzw7BgHegt4NTj/oncRbGqV601wPNHhF
 iXlAWq2LbBwPVj7aFoV0rcB0p/FHNrdeqPcF2xzbE0A9OjdWev7fsVFXRgHMPZfZKtxltM9tp95
 yDyTmeLnKIQucBkP5H7+71OKD0mV5NC9/R4qLwEdQhNxEIDyfjUapQLNdeKh7OVoZkGqJUvFZfP
 iSsqYKRhIfkmc39tU8cpLxFIOJdRMw0cU34ko+fGKKLdMvGPorfJQnHsI51o7tFDEB+udyzhXtN
 vwrda2VbodwK+dTf+XShcJLtVMb7fiJlVsHwzmgasqrbZKlaQN+GYTbcRa4SSp9neIso64UeNiY
 SfoQabxVFpR+3x47nG5te3KaAJyupUsE25lhaloJQvbF7vDQ5h4rbvx2asXfTX+I3+kadmkyCNQ
 9N4xdkHyp5Um6EUin9rowOYdflZCtCrHgOOjmcLe/HULvST32LMARjHeotK3nVI00130uJc9slY
 ckOZ7dDn77pZS6w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_203239_796159_86DD3683 
X-CRM114-Status: GOOD (  10.05  )
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

Add DWI backlight controller nodes for Apple A7 SoC, and enable it for
iPhone 5s.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi    | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
index bfbd2629e206736822a157431ec959e1aa70f41b..8868df1538d68595cfe92c80b1fcecee42d348df 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
@@ -51,6 +51,10 @@ switch-mute {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &framebuffer0 {
 	power-domains = <&ps_disp0 &ps_mipi_dsi>;
 };
diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..d820b0e430507f681a5f2aa13a498be98080e1db 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -100,6 +100,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,s5l8960x-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1


