Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7297E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKQ/KdPjRXHrR2fzFO1pIdVwIMyG+67hfBNPWoSG81I=; b=lnk7fFgPlIHD6u2wQ1hbrEWwN0
	qAe86/Vf54R/a+cFrmudIPtbRRECxbWqu0zWLMKKy4k8bzyhDhAYcZftmPNIxIm17qZWtOZctZQfz
	iwHI+xoiOQiq3KqUbABE+D3O4AcVPzDiJUB4FiU9F5FXwLZRFg2XMzqY9xKaSxfE5fSUmzjXC2MPL
	jykBbWGbl+dnlAPWO66s5FYPS/y3Jd+3FgDa1fJqy5yS0RL/35vs/RMAekIYV1HC1KTmYCow/wpf2
	LllGzvRUJncZuKO8sevISQX18ldcaqgQGNVKkJNAZaTCF5g+ecGWXwMRLi4GXbxq8t0Q/cGfL9DyP
	EMvIiH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeKt-00000005D6D-2QM2;
	Fri, 20 Dec 2024 14:50:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeGO-00000005Bhn-0u1R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:46:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-386329da1d9so1010296f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705959; x=1735310759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKQ/KdPjRXHrR2fzFO1pIdVwIMyG+67hfBNPWoSG81I=;
        b=hnoE5vO05unWy75Da6iJmk+LuvHSRVzzZz76gexe8twZFDBw82gIypvtrpO3Y9dWl4
         RR15PGDRgdcRBVImu16voHv9btwYe+XHNdSeVBzoS7vmxiFy+ftL8hOtcXGGp42UO2LG
         Ma8d7JNoGU17+BzUGupZU4goPUJj4ky23odzLi+ZOgbkT2fye7iLcpbJFIctSoOwmSP9
         O0FH1GHKPAQpXANpmvKno7hik+gFLfNJbwDKWb933qStkFS6K8Oix+RQI70cw+Go4ZTT
         xw/p97Pr+LWudO2vLvNFz0SGT5Ye0jKblLQlFxKLGUh9nbGvv6SEJiBeq1k4k3+3r8Se
         Fwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705959; x=1735310759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKQ/KdPjRXHrR2fzFO1pIdVwIMyG+67hfBNPWoSG81I=;
        b=uLEttoYUwhTYir03W1m1pwbXPqk6ns4Xe5j+ovr1XtaUEqaVV/hGyMaU/JpY1OFeHh
         /6qkb0MZYmHN4tFkOq13OYQBREPejcR/XTur7lE58bOhgpX+1dZwRmj6vkJQmgjbvSEr
         ou/HPov7tHov3t23SNsNcQDB4dcPA74H9oxutz3s+E6ul7yuj1DtmeTS1hpI/oUeZhAE
         CjufhAUHPZv55rimRw2c8pfz4akvHmH56fI+1Pb43eexLodssXwRrdozw+9Q7+k4RE/M
         TxWGU5pbk77DUe0RnRWdvrkCQYAJMlQITQr6zjIHwKfYreM3HvxbFsIPo6qSx9gqyJkZ
         BfjQ==
X-Gm-Message-State: AOJu0Yy1oQvThyjss1tGZLZjluLeC0OrSKircjpVo+WeRpjM/qrPzZGe
	Wvij5TSxpg8TsB52iIM4jmzG60hBpBjRiBB85ea6SYkdUfJcJVe9CHPcYAgQdBs=
X-Gm-Gg: ASbGncun+IjUSerRj02jlRC1NhsQtgsm3tKtW6wDcMc4Ng23P9Q+PAmNcQ0CvHoBuz8
	1NPShxUkqFiWMHHy6f0Eei3mOdVuNDAEzgMqgvnaH9vDk4r6LMVX5ZWshD3yxNK2lus+WkHzOlp
	ONFdn62lpsMIwq6JXnMO0ygQq+n0NbW9pkYipgoX7pAbq01IBTmUdA6a564Dy0sWuuQsW1rRA2s
	BQnCUr0r1vCk+WEZGN2RCU5Hevqm8hcOwNP7A+ZzWBNVPsKc9mnhKRYien+ofVZCgzv84MUuMv/
	KqN2eYva2LtegJUjMvH6JYIJyKhyVquTBauz
X-Google-Smtp-Source: AGHT+IFWQfXAdgrp2CpXQA4+qHBefpesptVUa8m2vkPR99QjdXggEQUhIJHg0NNIDARz74yBnc6WSg==
X-Received: by 2002:a5d:6d07:0:b0:385:edb7:69ba with SMTP id ffacd0b85a97d-38a221f2dd7mr3456323f8f.1.1734705958949;
        Fri, 20 Dec 2024 06:45:58 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4227874f8f.44.2024.12.20.06.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:45:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 20 Dec 2024 14:45:46 +0000
Subject: [PATCH v3 3/4] arm64: dts: exynos: gs101: add ACPM protocol node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-gs101-acpm-dt-v3-3-642d64daa5d1@linaro.org>
References: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
In-Reply-To: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705955; l=954;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CBzsQBj3NhXJFNW+TyilZZe0w8YWT523Ro1ZD7fmAyU=;
 b=5jgeHxCZtkNehocgTdpWWxI1BFfmy+Ek5KEUu9MkENxqbn/4qWH8mQfu4WsTLzhrUCirUGicq
 NoWEoR6ntyqBhnr9L7E1KZzxGh7p4AloJBMqd66nIZ3q/kWZAkmHK6G
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064600_261599_640A5D9D 
X-CRM114-Status: UNSURE (   9.52  )
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

Add the ACPM protocol node. ACPM protocol provides interface for all
the client drivers making use of the features offered by the
Active Power Management (APM) module.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 6947dd081a0e..681ea775ba54 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -277,6 +277,14 @@ apm_sram: sram@2039000 {
 		ranges = <0x0 0x0 0x2039000 0x40000>;
 	};
 
+	firmware {
+		acpm_ipc: power-management {
+			compatible = "google,gs101-acpm-ipc";
+			mboxes = <&ap2apm_mailbox>;
+			shmem = <&apm_sram>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;

-- 
2.47.1.613.gc27f4b7a9f-goog


