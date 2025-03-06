Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100BCC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77LEyUB5P/fKu/IBcJvd+QCzhbabA9R1jqKDuYpByGA=; b=by/BX4w26SwfPF35op5N1Dw7HV
	8FS7odvCE9KgzyC8Qrx3dD+oCryhbR0M7sBf0q1scfo2sp/kParMNGmp/Yp2DKmFsQD+oBBm8qJ6i
	CGTzz4Nvxr1MU7hJB8eoCnjZnunBFmfttfO8owPvxQDX5hkzdqR3DUvO2i3km4zM2Qseb49hzWH65
	Aw8cd5VvMrAsqjcXctbW/XVK7dyZUgoIo+d8hkPQe4tkImvBY26OCmtDRnYNm7a2CvwlfBxh9Ue6z
	TxoHhoHAZXABpIcWCPR0uO+4/2wOi/KFVlq4zbBol5Yb+J1KxyUyNRbInyOktgOqbO+cPugO5An2m
	Q4uwS7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8KR-0000000AdNb-3eO2;
	Thu, 06 Mar 2025 10:19:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Fg-0000000AcCn-2gzj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 10:14:54 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so652170a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741256091; x=1741860891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77LEyUB5P/fKu/IBcJvd+QCzhbabA9R1jqKDuYpByGA=;
        b=gVQnju/lkJdl+SepChxsloaevY/80oAVrbObg17ldmaEMhwtt43u9Fb1n4qgLavtPG
         fnuOqQ9dh25WHcCHuH+nrFlLYu3A77wsAkf/ux+UwMgqswlr6pRRI3POkj6I/rWaFAFV
         W0L+sJ37vm2izgkH7N5S7BOeZg+uvAMRrEEdQ2fkDDzQyUumhogBt+dO0WvRLfN/2stw
         OlqU7yCFKQ3cZ8pjfjJHZUHPFAnoBnWkrsLwwHPrY1aThu53UsNuPU3arZKCe+5HfHTE
         6I6liNvKm15NfXl+/YnSde0fAs/XOxzUMTxJjK5lvYTBnZNqikT7Xreho3osw3S293Vd
         vwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256091; x=1741860891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77LEyUB5P/fKu/IBcJvd+QCzhbabA9R1jqKDuYpByGA=;
        b=UfJPLXoudFW82ej+9rl6CPviu1XS+ng6aHW1t6xl0xrj0dYvkvEkP+Gr0YRfxE5dpd
         uWhWZ2YPmhO5SDs7djkg2MAjvsWZHHA+l0B2RSgs+MoPOIjbTjl/Ed2mEVk9j2UY9AUE
         0gb3WMwcVbdiQgpu3QmtuE6eLs6fFZT8v3D5CaaT8zsN8RoSFrjuYg6VtmOrZbDIIAbO
         uMtZrO8UG2wJya3aja5o0WqCaBsoouDbcMj4TQppAHLjZ1p3ihKiOZ94HHTbEhN+KDsk
         PFTWSoVaGvh0GEeSlBHuf6b28DLzzmu371ThxIbv+7HhYwXfvsq2NLpe2RXSB9tqwJk0
         sBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDm7aLxKypsqlLcQuyKArU4iCoPjn61jH7FOadVkgBOy6CS/6E7NUImUuCdx4UTzwn+VUW/bmTlTKzcHZyKLNe@lists.infradead.org
X-Gm-Message-State: AOJu0YwBWTcjdYMheM7UyqdwPp4sNELJK0diGkzXg3H5/AHbAwitjP+1
	JC8naGFRlnlAkJGW6urTWKxw1ixLw7c7Gvp7wDDMK7ULAu6EzPdGZrcSBVG0LL4=
X-Gm-Gg: ASbGncsoTHLUDks5cBsEQPPRYrCequ6TfGEBZsiZBRJlft4ujWajp4SQ3A7iXT/7/e6
	lE9UEwkYRqs/V70UCrABzuDTpELeIhVJ7lBLgWuUs6rjQy+RI8Xpt9SZ9GIx6KOBbM3DiZpACG9
	3GYsZ1nqDKPFhm0O2jJ5y0cXMuddxKDtvbCkTi47RBcl/RSkSI1n2djhpPcRPW7XCivutP1pXqX
	oS1MLwAVsWaRy7YTWmsrtB5Zp5iIA3DC8D/WnnR1n5EGSUqjVOl4lYRusFlvcNgLQ2s5UOi82ja
	iC8RFYjhaaP97YDeCIcQSsyZBNrhs/9aK4bmNUPZdCT0lChT3epLCPk0erbije935lhI1NjkmfI
	3b9IvykUoF1C4NI1HX2PVJixJmQpI
X-Google-Smtp-Source: AGHT+IEjMRlKCm5Pe5LA1PCEOatZDZ7Iaa7e1nWD8ZdLZ5E256EnJO/N5BK7eyefycBEa/h/RFzPqQ==
X-Received: by 2002:a05:6402:210b:b0:5e4:d602:70ae with SMTP id 4fb4d7f45d1cf-5e59f4a3f33mr6101870a12.29.1741256090912;
        Thu, 06 Mar 2025 02:14:50 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a6af7sm708972a12.33.2025.03.06.02.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:14:50 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Mar 2025 10:14:48 +0000
Subject: [PATCH 3/3] arm64: dts: exynos: gs101-pixel-common: add
 nvmem-reboot-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250306-b4-max77759-mfd-dts-v1-3-9fe8b0eb8123@linaro.org>
References: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
In-Reply-To: <20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_021452_679661_857611C4 
X-CRM114-Status: GOOD (  11.04  )
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

Now that we have the NVMEM, we can also hook-in the nvmem-reboot-mode,
so as to have Linux communicate the requested boot mode to the boot
loader via it.

The two remarks regarding missing reboot modes from commit ae32b65c9359
("arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)")
apply to this commit as well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index f67fa1e84d994de4d40f29a2d437ab6401ac133d..41f63b4d93fd34e1c955d1f47039cc0d9fb4813a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -60,6 +60,20 @@ button-power {
 		};
 	};
 
+	reboot-mode {
+		compatible = "nvmem-reboot-mode";
+		nvmem-cells = <&nvmem_reboot_mode>;
+		nvmem-cell-names = "reboot-mode";
+		mode-bootloader = <0x800000fc>;
+		mode-charge = <0x8000000a>;
+		mode-fastboot = <0x800000fa>;
+		mode-reboot-ab-update = <0x80000052>;
+		mode-recovery = <0x800000ff>;
+		mode-rescue = <0x800000f9>;
+		mode-shutdown-thermal = <0x80000051>;
+		mode-shutdown-thermal-battery = <0x80000051>;
+	};
+
 	/* TODO: Remove this once PMIC is implemented  */
 	reg_placeholder: regulator-0 {
 		compatible = "regulator-fixed";
@@ -224,7 +238,7 @@ nvmem-layout {
 				#address-cells = <1>;
 				#size-cells = <1>;
 
-				reboot-mode@0 {
+				nvmem_reboot_mode: reboot-mode@0 {
 					reg = <0x0 0x4>;
 				};
 

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


