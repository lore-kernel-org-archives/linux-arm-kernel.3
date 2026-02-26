Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1CCFD8FC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8v9KGUdN9vhC+5Sfj+8HpfyMGxxSUWxCRI9OZUNdGo=; b=BLJcOuIpNy376xqeVI1v5xVYv7
	c5pKIavNUwlqrCpTV2i5bcZ1zSuGtXCUYmQs7pVrWhWd+kvDfnu4mEVFjN0Dl5C4C77qZwZ2whhZT
	RrPdnjevUadwC7jjU/8rEJUxPh4Yt0yK+9jQu/g5dHgVicTOlm5kbrrw9HIyDRCgxLZzGqK/ApxJq
	u37qjWhAsfe4S3WDeThHxaqNxSEVRMWln5yhhTnZUT30It1JJzClkaCiLWgz2MP9kQ04Imfxh14py
	6oP9MK1H7l5+2rGTPr/tOztCqMAG92IFWP5/f8yAQwBBCnKj2UPA51GD9jUXmFaiL49z5HQLZdBob
	Cvi8HVUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaQ-00000006YFc-2xgS;
	Thu, 26 Feb 2026 15:47:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaE-00000006Y7W-3VBY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=k8v9KGUdN9vhC+5Sfj+8HpfyMGxxSUWxCRI9OZUNdGo=; b=cs6NPEqcEkyaCQYKZd53LnooDu
	U0wXpVWSA7IRvHfwENeyAWkDTaRbaYsFKNBiiQk/M+ftNJiZy0xWRFBGv5mh/bBYY6UgOUkVff0AH
	xpyXRNtgWr3L2EVNzcZFifTe18vQ0WuDsJhYZr9CoToSBTj27R28VGbu4vnbhWmU2ZBsATrGaTmI6
	o4uZfRCL3C7F4TYZiu0ufKr7ctGkC/pMS4w28gV82bIZLMwBQdp7nhhBjqfEycqJMA1IOYtArsw6n
	gbjxi0S6dU5AEyS/QDuyE8ttQmXOvgEsdgu+SI/GAsq/WJESCVvROwa19YXlo9W5i2jashASwEHKI
	gXoo4DSQ==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdaC-0000000BN0t-07sX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:47:21 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so12028785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772120838; x=1772725638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8v9KGUdN9vhC+5Sfj+8HpfyMGxxSUWxCRI9OZUNdGo=;
        b=Yt24J/+FgA9l0CvUEnYX5yEZcAVmxVNB8KsGsv4VFnR4+iU2TLFsG5ueVrUw0hFa9T
         1YvIXC/+wbnHB5A2TlwuATNWF26eVVgZrcj9vYCA8JUDU2B/K3Vmrte030EHHa0xF4aB
         O1kX6UoJ6Ez/lMriRDZYzsyF+PMK7/kU7OWotaKFC/x2/eYNzaM88WjWiH4WQUAjaX1E
         MRrUZtxFUatPmKPMXB4ytrWeT2+Kl7c2kTfoUvTSc6PdJ0php6R9KGCocjwRbAMMKC8D
         qlYTM7CAW+muAfzNvUDje+5pyqYsY/X+a1oSAX4wmPLyHlN3izp8+z6JHwXAZVs1rS9u
         mXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120838; x=1772725638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k8v9KGUdN9vhC+5Sfj+8HpfyMGxxSUWxCRI9OZUNdGo=;
        b=LeqmsRkYo/gJN/OtFdvfdVWD57qoM2mMn3yy6Ud1/pBnZCBZ0SWzD8XQ0PBmBSxPTd
         nFVSvYizjzZ83FpdfXu5Aq3po2JNClDKz3817FoMCusla0O8uKPu59r/XSbX4bbCFln6
         2WScHwtJmk9gYJxx+h0D2ujRJHmpiPZgwJiZBXN+WWhHOMEmR+Kx6G8eALgCagyRansP
         U7b3DIoCFHvA1q4QjSHUxgbxeCZX+mby5rHFZhOU4a2EovYofVpjR+lXZWfA77nHG9Q9
         7CiBfIX/90ezgU3afFqV03SfegzmeKVOuS6ZuW/lxn8Jz3w4Fis+uTwdWToQQBY5BUCf
         lcGw==
X-Forwarded-Encrypted: i=1; AJvYcCWMX7He4RSNN3oaXWeMrt1GuRM561vCdQTxcuSDmX0PIz2jA3ve2iHiwLHRHyVSb3uluY0jDyvs/db6mqsuZIkm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5zV6P7n7+kvj19t+pLgmYmyQMbiqxJ4jBuvRIQDeg26zVVmZG
	dous/38lEIAeOLVB6pbrBnvQESIaS5tJ8jgwX/Zf8SuCkE/zYoVey6CjFnRmhDsvY+k=
X-Gm-Gg: ATEYQzx/B6JyNjzUJny3BZ2w48vRdZzbqOthpvs3gMLtQKHTNSK18qaxCH4GAKbvw2b
	2GfV5GKDj8IZO3mgljAZ+5orPCGu98rhDg4UpZu8kyHXVzZLjr8o5DWN82TTPXf+W3oLMncVPKH
	gFJ46JOn2i4K9KD7gKpe96wP+4LYQ+BT07sVkpaV+AbfzuZ+KshANgdLqeDTtJMukqC3pI2+rdx
	o22Ne1Fy5anTabE2RNSyKJxl30fVTSBWPxI34AunndVi84T6cy4z6W3qvXjScC3noq7RGw6PT4E
	nmyfFD6sQEP+LxRCi0Wg0fIBphQeApXELipbBIz2Z8l5w10zgoBZCP+gFTVy+4DBlYJmaBh65Et
	uk6qbNp9U9+gqcH4B+sEXRyvd+K5Iriw93iXIx5lzhPPm8iXj6s4LwB+oX9qGhtLUrIN7WaBOo1
	v+pFv2FHtkCTLaM7hGrzQLlPRYqXva0EzQZux3lHE9Rd/mTtLffy3x+aK40Aioc3SnEYE6N1Hgg
	BxJEVNg7rmHda0=
X-Received: by 2002:a05:600c:a009:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-483c3df45e6mr52290595e9.31.1772120838328;
        Thu, 26 Feb 2026 07:47:18 -0800 (PST)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b4410bsm56007365e9.6.2026.02.26.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:47:17 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Feb 2026 15:47:14 +0000
Subject: [PATCH RFC 8/8] arm64: dts: exynos850: add PMU interrupt
 generation node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-exynos850-cpuhotplug-v1-8-71d7c4063382@linaro.org>
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154720_135533_B93DCFD2 
X-CRM114-Status: UNSURE (   9.55  )
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

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..e3f4fe6ee118 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -211,9 +211,15 @@ gic: interrupt-controller@12a01000 {
 						 IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			samsung,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";

-- 
2.51.0


