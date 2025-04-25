Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CF2C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4FZgopI4ZxsIka7o03SUx90lerW1gBB6Q7kNKaQ7xs=; b=MRijhOi3s2BIYCzkRJb+4Jwg7a
	iimDkNyQFgeT747ioMIWYzeIRabvL4gIpImi5X2dOUQZPwO0X/mXKxqm6Kvmk9ZP/YFVY+1ctNcqk
	2xzY3v7Qz26FnFOu394QIXoIiWtI2S/UJx3KohB9tt20KGDrZF73kwd5zZdGoNBr3EFbSPGtc8kWV
	HqczLgDH877k7sML7HdsWVqOwN3NgwYuCLQjgGlhN4kF+9dGsxRL6LoT2YOBIHcIEvw5jTmmROA+1
	RLhbTtpCVbat68j7ddEsxY0Ad6VdFDvM1QqsspvUYuKJCVm0NZHWQWrsZgIX19PeWV6WdhKpZMoqK
	I+G0ocRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Mkp-00000000NQu-444L;
	Fri, 25 Apr 2025 17:22:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lrg-00000000Cbp-1zZb
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Apr 2025 16:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=K4FZgopI4ZxsIka7o03SUx90lerW1gBB6Q7kNKaQ7xs=; b=NV6B0DYXoH7L0KK0IsSsxl9JJT
	/k1eppGuaS0S4hRGehy/SnVVABkDSVifQh2qoeos1JV4Z6DmRDObWK8hyhIhq7raEv0ezMpeqGNZA
	HV5Cqmmb7M88v3Bk0PjwH87AbU+ibrBOHMtRm8QveujwtIQFxP50KbW9b8t4cyeqcZehc1c6QOuak
	0oxwEgR4U5GLeTrFbkXEILRWtIDdNLpEWq5yE3csNHCoaJIFci1X0P0+/RQe2FpAXD7w8odaXOqNO
	XN1FxPi7wDGhDNHYuLVj2sqHLy5CD3jYiWyuw7FD8RCgqoBrDmIPP0mT0vC3upU/2oyO+QckooWYC
	IUzHP8CA==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8Lrd-0000000C6za-03Xu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 16:25:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so16524605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745598317; x=1746203117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4FZgopI4ZxsIka7o03SUx90lerW1gBB6Q7kNKaQ7xs=;
        b=XBDNSgLTqEvuRU0oS1Ai+zHUUiuSGAiL7fK9jCFaXF7CC61bMwLsBzgsrOz6FdSUaV
         8+BYQtc9jMAeAyP7psIF9Nu2/XjNs1Xx4pjhhCptOUJs4cDoi8mzV+TGD6yAjUu0M4WL
         98SY/pnFl23F7523tEDvQrZ8kXURFY8s3tflhXrm14sKvPqnDO8+szsPgZMcZS9oG7n1
         uPmNj9UbBxS3cjvkCa3KgTB2PcJKwn854eBjFja0HW4QvLfuoGm6SJAmg1jvVDCFsEuA
         QCKulb/T/9cx8AqyzchY37RWk8WrnpMuH8nMwvzkMWTIG0AnmXs6jPJVKDWqez02SWlP
         t0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598317; x=1746203117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4FZgopI4ZxsIka7o03SUx90lerW1gBB6Q7kNKaQ7xs=;
        b=JkhhF1aleUGlGSz1gwAifqn0qPcqFTJfel2DAADM0uNCfhSTch29FgfI+KRwdx1oGp
         VRcUMKuE2rj+XmD/8gBwaKEXEO3CU05IMH3vPKJWUkA8ApKPo2lIlNsvtGW7UGlZ27iq
         qkPiE5PCDTC2ae11RQIwrz7lxWmafN30hIw4oH42WDS1X/Tcp97V0u5KRJYB0vTGrvna
         UHs4/hfHWRBzI0Nru5Nzfjh1UkKkvTrHTRQ+NM50gt8Tb8LHxMgxZWKE/pZhaqzkrKz9
         pOw6iyKAqStBkIQjnWCuyZmVTGy18XnsQEsptHtePxhyEGCx7rhS/WAImtZ4EnpKb6va
         zh/w==
X-Forwarded-Encrypted: i=1; AJvYcCUvM5KAMLywt2jUKjI8rrZRRRkiFHO7VHdGfgJ0y23cGS5it3Gd1HYLYHHvO3CufRVliwmnbJfF1uTgG4kjk7wJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyls6VenE/fDe4Bj2UOYWjr+riKONl9nmT0XVnnX65RCZZAUTry
	ooagJUKbI2zqOEczZJ0/m7qxqBLn4E6O3vQDc4KXLCyA2fXoC7KuyYfw8VUzNTI=
X-Gm-Gg: ASbGnctspNdPfW3uxBzL+AeUUSJxMKTxPSb0f+laB1DQr8mwsqu6jWA56Hr+NM08I1d
	N8KJ3RzawKYWfeKKE5VjtPbJkHAd4hSnmK7IcZy4LZZ5IhaFNdxgGp6ctm1Y1LillcN4jnnOdpS
	d1d9AYmq4RVjHMaHiOW4mzpd22SVbD2T6XP5pByBDPjfDcA61tSmXipjlrHxHPRhEv3WajfJQMl
	ti463wVb5Y/1qYZRERKMuINl7HFI3cmRMVf6F/0PlCNL5HPl9oUJ84FPOB9/ZRRVSyD6mXjpC7J
	M2P19TrBMnB8YrkerrOdeyRN2YBB0G4oxePBjyaJwkvUDsYTTNzSatm7kOqHSGPsEyv2HHgL
X-Google-Smtp-Source: AGHT+IE7ewBSCz6dzufilKElwVeNyis72holw0eLHnudpdGIGazAAFQ1AmdNEkWTEecjXbBaejzS3Q==
X-Received: by 2002:a05:600c:3b21:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-4409c454190mr75445305e9.3.1745598317573;
        Fri, 25 Apr 2025 09:25:17 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8976sm61263715e9.27.2025.04.25.09.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:25:17 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Apr 2025 17:25:08 +0100
Subject: [PATCH v2 4/5] arm64: dts: exynos: gs101: add pmu-intr-gen syscon
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-4-f1530de9da42@linaro.org>
References: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
In-Reply-To: <20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=jDESTeGPU9MDLye30mmLZd33SKlSNdN1HChVExfA0Ho=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoC7dmiFG7JA9zR4w4g8O+Mf3kIA2ug0OV3qoly
 RerRUrFIeGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaAu3ZgAKCRDO6LjWAjRy
 uuLFEACboyto09agjXazlVIPElvgbIw/iF+OL/uSZAjKui7VXiW8ji4ucUcGMwBJYiW3/txfy++
 HJXuHFc6rFsji0RVualvxQ/vSzhmLCvXxQUHi9YfmTlDMQ8WNtNeVZkV4UvXzfwFEbhOJlyvOU4
 YJZbS4neqerGs9C7IFj0u03iACJn39mc1f9r5yz6KDcvgDK1C9PY306Q9loyRj4V+nx+SH0x9WR
 zFz6257An3NMYIQUaabn+RFBbrWrTb093RARtNDrKn376Mj93e9RzvD7KaDCpZNiV/xFUGjtgNj
 iPQKx7CY9+IoKWdSiIH3MyXavtov3enz8VP2F6hcCBPVlPIQrFn3YjRPiWCrrudawPkEm8s7EIA
 shS+OuiTssGF05d5yUCp8ydlc1OjSYHZFc5aN9+pJKsjT4ICVs+WIr6M0UsOAvDCJ74fFAmbmq9
 E7QL99WqeCvQME3q0KPipGhUVY7hYgnOMb3tlY6yspCIMfV4ruK80Xmu8Z8kq4o2s7LtreJ2H9i
 p9rpHNFk29AXz+VgBFbFGkZpKesM6jBxZmZ4bhQfk5f2MmE0z5oM/HXtx80xC+NNPuTnoi22VGc
 PfRimPPExVI7uyyKnjWhLwIUgyHqtarbgcbUx2TfJzoLG4txMZ4sWkn9Dz9q1VGZ0HzGFw118Wk
 7ufrcVR12LHnfGQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_172521_243984_0A43C3A5 
X-CRM114-Status: GOOD (  10.93  )
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

Add syscon node for the PMU Interrupt Generation registers.

Additionally update the exynos-pmu node to provide a phandle
to pmu-intr-gen syscon.

These registers are required for CPU hotplug to be functional.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Model pmu-intr-gen as it's own syscon (Krzysztof)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 91cda7758020563b2c5b5768d8921e87b1f4231c..48c691fd0a3ae430b5d66b402610d23b72b144d7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1405,6 +1405,7 @@ sysreg_apm: syscon@174204e0 {
 		pmu_system_controller: system-controller@17460000 {
 			compatible = "google,gs101-pmu", "syscon";
 			reg = <0x17460000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -1434,6 +1435,11 @@ reboot-mode {
 			};
 		};
 
+		pmu_intr_gen: syscon@17470000 {
+			compatible = "google,gs101-pmu-intr-gen", "syscon";
+			reg = <0x17470000 0x10000>;
+		};
+
 		pinctrl_gpio_alive: pinctrl@174d0000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x174d0000 0x00001000>;

-- 
2.49.0.850.g28803427d3-goog


