Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF9CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=; b=hNDWW317v0ykpgLfkTpF6QMMlN
	GVNq7TwTIOs7Moo0zwlSOb20VQlZwe96Kaum+GgouqNslY9I+0xDsSYoD0SCYXU7FUxICjbWGhSEZ
	0MPzHNZWb5qF9UEEEvhJbPvqYjCOKaInLeWfl3u33yrLorcMolXpBvt7l3tyOyyuNdhD8Pchf/au2
	dKjzjtO7usT+C8LCr6uWUqELV8a1zK6o0LhtvebmzRoWNoq80kbgyIdxPrtLnGZy3yRLk85y/iOma
	fjbM4mi3qojeR+VO3n9nMTw1PAIyi5sDRJja7KxfW71wH5wfdcvhTnVmuQaHZww92xForwQ4EXbDL
	iWPpTMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzRi-000000038wg-3Vax;
	Mon, 16 Jun 2025 02:19:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyiu-000000034S7-2WOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:33:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2366e5e4dbaso9217995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037600; x=1750642400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=mSJN2TaxvXSYnTPUC4X5bKAnkfExIfk5l7tp8FfIPjAUs8RONDV2PD9GoC1f9o86rA
         Asdt/DJ9Ik+k74WqQ8/FTBAVRZG+nSw/qaZ25GfH3iUFVWhXs9tSC3TqSHvkJcFum5ec
         gcZaGAEU5qNQwX7Xf9yKxprixAyDZtcWh1IC1Rf6n+drVVaEWy4nIN8NjczM1jIwEFG5
         J/vB8ve0N4scZohn4nPJW2K4mNN8xLatAOwAftYbXhgfyH9X531+JRB3IOP2IGGL26Po
         paK0ww71sTDMywaryUtIJ1szwgjVRxpF8ikA0wcTT/NcHZnuW5/3ZgjbGH1BaAtVeQzM
         h0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037600; x=1750642400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=vgrVCeui1NoPSECDZqNytv220K/dr+2yHX+iPergg6HAlK0Z7uOXMdj/nm1Rm5RrwB
         HwTQPdbVqnwoD/FODNuUVUmkGIFyGWtXyKygSzzW7IEmCe9FZdtEeUZKP0elMfUXLMVJ
         +c0oZQhhT20AZR0q/nAtnM4oGYfFglm7mruu4G5pZzAbn0sHcGfOZi2wX0K4O1Wh0Oas
         kkd4CugaSYZCRqOnP8YboK0/Hs2UvxNXIOBcXW2hrYGeH8NrnagWe9ZF9Bj3UsS/vA+Y
         NEbN2Q8H9gpThN95FsW6P1x8tNRQwsj4hNLKie2t+vaPT/c7j/xD6UwbYrT4AEvt98xH
         87rw==
X-Forwarded-Encrypted: i=1; AJvYcCX+i10DxSP5n9BTqi/v0/NKqEmeE0CuPqvHPKSqvYpZNfLwjv83aMOGXU7f0NuaNzlOoDWv0PXUyY0DJYrO+DpR@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgAQ/Q2el1ESghlr/bRWTk5yI/IJMDabbu0iDJpHQwSJnVuaZ
	2LYSQbuPEId9J57sDtuqspOUqitTrNi6pEwniZnAcLNlesSW2pvGEHlM
X-Gm-Gg: ASbGnctukBaNLFUWPDxJUPJZAnUfL4WvnPezPHVzR3V+EBqrJ5fc2DPY36WFtrATLQu
	WMh1SRiIT/Suv4ITAtVsbT3qZXN+A3+yAwAOslMBrdPgFlWV0KvDmyNc7koStNj20WOSo3760G5
	vmVMyZ720d70+pAwzGyVYpt+6WO0qZmfXalhE8C/0VgQ1KkqjsSygXhtEfhTWUh6cIgxDEOPmlN
	wPJAma5dlAT2Hwdd8YWa2n7PvZvk9YNq3Jcrn1FzMlrTSn4LYwbeioWMfMtAiijoWZJNn5bCUpM
	AVZVxuVuNjpzJcBKlai78wBgfrDckDeVQcjQ2A0xuqhpw6wKkj8S8JkQ21oy97KyrsJbFLNFxMe
	hRH0=
X-Google-Smtp-Source: AGHT+IHwac9QTGWxlkC1rzZ2SMHVmAjfvFm/k/YvsDasORNoNjPp9i3crC4psW6aNolqCYQjKg8vrQ==
X-Received: by 2002:a17:903:98d:b0:233:d3e7:6fd6 with SMTP id d9443c01a7336-236678a6edcmr139967795ad.19.1750037600015;
        Sun, 15 Jun 2025 18:33:20 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:19 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:09 +0800
Subject: [PATCH RESEND v7 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-20-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3Qa6p1xENFWuaERQyHsdefacxc1lUVxttion
 +igFpn0Z02JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GgAKCRABygi3psUI
 JEUnD/9OsHCyPEKi9IsB1sRFkIFSwMCnJxmhxXbWNlRkpOPFr2HE/5NldQtqGVk5ePzKhwmAMD0
 RiL9IyxqhyYXU0zWo5aAHBilDRVIBOHWOETE9PyFhBtpJd67OMSzCfRHe1i9yUm7ijtX+gEaWsB
 QWl+G4//yilBZESoVxJJg29wAGDw89dgEVh2di6N6vaQ4rQFEjBlTv+M0fvnkcYipZteLo75Ot5
 xD0qG1fGN2q0JKcsZrfLB9TLxQbZAtUL8T3N190LSiYYSrUBe2LqHdG8MlF6C2eoAQC5RGNARj/
 R7EuIEqyA29pQoBsk5VWBnmQfnv0gOYEP2orq6SGF5obhrgSLQhgwMfmWNPjp/RS7jUiS9gmgzN
 SwWuCuMo6iB0k3KnIZs7gShT7u5jwlazrtSzknn8VHRrQZJitk2hnL7K1uwN54b5u+lrSM4P3Hx
 dOqwYVM/fmFRmldcL2Udf3MVMvFFWTjEe39GJcY/STrS9p2GND0JpNIg0G0W8RmTSTZbPZXWUmL
 /8l7ctLDuXyy/idnrADdgJD29QE01H6Sf/ZnkbgOWtOprWiuSj/3fbzTedrLMz6b6/eHsjGY6lA
 LNokQE2Jzrs95Bz84eiZQIbBk7KO2o9HDecKYjKmJ4oqcVIRYU59pIl50hZLG9AykMmeU0eMzTi
 CSizSVKXhOCwUig==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183320_645283_78F39ADC 
X-CRM114-Status: UNSURE (   9.46  )
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

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0


