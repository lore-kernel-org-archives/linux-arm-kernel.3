Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E31FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+5g381r0R3Gly5+53b/VNyTXs/xlV7IGrG5ZNJb+xs=; b=hFr5K6H1NehRT7tBUcbKlkEETO
	jN4Evn8ACZXtkqeEFWSuKv1IZF2x88GGtHZY374viU+KlgLyaKq6QDNIX7bBQhYToHodiCaaLX9bE
	04xfR8j1fGdRMF4iXUZkmDdf68jJ/zScgWKfiaCRImoWwYFJ7lWsvgyzb9xQyJggSOjnsh27OnLLP
	I/M1Vwar1O1CEvr+Mbkplyhr/jh7qxKj6Q1UyuchcZmf43JTi1j71ZxPYQxdyiWn/1ySrjmo+R/0G
	pZtTQs0r+ZVfh/1pmEijmwM7NZiFMwc2597iEKhl+T6UgbDByue4F+L8uGm0XLYWIQXszDCFcwZo6
	gZRGTbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNd2-0000000AnUK-1Goh;
	Tue, 19 Aug 2025 14:48:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLAe-0000000AO6M-1OWx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:10:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b9d41bea3cso5539735f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605431; x=1756210231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+5g381r0R3Gly5+53b/VNyTXs/xlV7IGrG5ZNJb+xs=;
        b=QtMksBqdnhGDvSB6RuqlipXAP80WLrnJg1P60XgyKSgSNtepfw/hy8bTvbojtIpk7i
         mr9XOVQEG+hdXjTOH12ZV40IDaPywxDUA5G8zRL7ahy3c9yYjMO6ZcjF7BmD3Smqtd+I
         LvLN1pij47ouzvakfLLCHJbC22W+QRlV6mCCKnF3/lTqjXg2Zg/IrohHB48eWiccw2iF
         zmIXgy+CLcdvlEnM+/Bbisd8xwweSLYbt6NTBSA4h8AVtFzCkRmkjLshAPho1rjB9xdh
         8U/DFvi8f7NokIE9kcYHOqp9fJmsogHLk5qp2u60mZmwyzX/G1Ksc+amCvmComTutmdq
         qJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605431; x=1756210231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+5g381r0R3Gly5+53b/VNyTXs/xlV7IGrG5ZNJb+xs=;
        b=kxEVjFzf4GdX/XTMkZcATWBIxgFgiHjt1Z56Dof8D8MhiQnh9bu0tXFJ71a7sKAvtH
         kaFO/yNutPp+RnKzotNWcHCQgGQe+Kabwb+95M1pc/4bmNEUkT0SSaArY5lfd/6rjf6Y
         fs4Hezr3nIfMSBCjYZKxFvEIHuHAnNFhcncYaPCoxeElYmUygkm38w/JMLEHcQ6PDf68
         6exgegozgPzySixmb7Q83tNanL1T6WNtn97+gBnB0ImAM2Nqm8XTJKehIylCNUjKUGvH
         IX9pnERw55H/wdYgZGxPKwyXuyg5x86Eog9X3g+3wcs4XJxT9LbQMH1wWeSk60g71iTB
         fovQ==
X-Gm-Message-State: AOJu0YxWXh1IUfpi19b5xiR7jGZTySue/43DAYtazlihuLRrwYzrmxVA
	4ZQj5x03RHQnummQUGLSsjgZs1hA/37ntcf0JNYTlxBF4uFt+6+e+lNn6B5IJNKzTws=
X-Gm-Gg: ASbGncuwfjqy/nzpIXSlOs3L7QXVXp2/NekNGcXiXAeTm87DvXLC4mQIscEott6ZXQd
	khw6KxWmBpO38OPtoog9dVx1d9VP+aXEXD2Z6Axws11r4lJM/qnBRlYfZQsz5b7oYANx0fdtk0C
	fWCn5XLGjUdDYVWjv/pd5FEV32nUOxtr0kCwHrDaWM6nVQve8tLT3akL4JW9Y0VtXl60Cilmmye
	dcxoBN7dKsl67dbjwKYiLuJJb/9bpj7hrTkMeECSwQNPK6q7tiweGwjrMNBzFdRVBfccwlKrsMu
	oWKqP7kAJkRV8xEz8YS9VDvLD8rT2OJSghC3os4Aijzzkk6ADHacfY3puyz0zOt0eja+IAWaktk
	R7KaPowatZTFRBYZ1AAzjIAUybMRUACH6mz/uVC/GiWEsEaxj+vl2ihsjpOASXxQtPg4bRoaP3R
	TPtm1hAGNuu2Ck
X-Google-Smtp-Source: AGHT+IFYmaZOIht6uOcy+7NKASZVqnp8ZAoXpwst8L2cyhAy9sor5s+Io2mLr0orWTwidMknZOnrlQ==
X-Received: by 2002:a05:6000:26cf:b0:3b9:10ed:e6eb with SMTP id ffacd0b85a97d-3c0ea3cf076mr1856861f8f.8.1755605430698;
        Tue, 19 Aug 2025 05:10:30 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:10:20 +0000
Subject: [PATCH 1/3] arm64: dts: exynos: gs101: add
 google,gs101-acpm-dvfs-clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-dvfs-dt-v1-1-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=844;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ea6fVOF/ZPzXpkLEtEhf8jo7+yKf1XzprUPMMimndVQ=;
 b=8NbHtnuer4XrqcxrU770zSH39wnsQWVoGXwzK2B/dmhKJyngAV87tT11N+xcYhCnrDVYTi6as
 xZEWhZ3g+nSDl9nwr+EDjC5c1libRfq5lZFXoXinj4P0CMBBy7et+BJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_051032_372711_0C9CA724 
X-CRM114-Status: GOOD (  10.20  )
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

Define the clocks exposed by the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9ddb5bbd256b62c66a645922ca74e..d010b8ffc4e09562519d6796691fe573c68b7ac7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -204,6 +204,11 @@ acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
+
+			acpm_dvfs_clocks: clocks {
+				compatible = "google,gs101-acpm-dvfs-clocks";
+				#clock-cells = <1>;
+			};
 		};
 	};
 

-- 
2.51.0.rc1.167.g924127e9c0-goog


