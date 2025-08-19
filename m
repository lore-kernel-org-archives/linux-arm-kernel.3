Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E442CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYMdhxIUQ31/cy7vzWDrnpVEGbQxqOB4QZi3i8Wf6a0=; b=jrIVDkSkuIYVlm2q31yuM9oWS0
	O88SwkwEauBbPSrT+qWZuk75ETpSBvyoDiHpwEsin42jK1wKX97f8bHEvD/WWukipeTpBX6550Ga3
	uTFIq3OIvAkFPTSyQtDZd9wqXL5+uhw7WR5+oDqZD1cHXtDCg7BOrfkbCu1RUbV8Ye1O4uJlNjs7D
	KX82fzjHSKyKJ/y8/uRbdi9YB3KCgA2Jx/HndwyzDyDd2BQsm5nlD5dIRXgwtlIfqrA6jxR5P+kKt
	s8S21WBaERccnC6uGXzRsxxsG8DOSS+YyvT1rw6xniIBM7RPfE/MxgHi+jQumlMnOedoc+OtmQg9a
	0G+q/8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpt-0000000BCTn-1qZ4;
	Tue, 19 Aug 2025 18:13:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMDE-0000000AZIB-0UmL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-61a3a7c09d9so332034a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609434; x=1756214234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYMdhxIUQ31/cy7vzWDrnpVEGbQxqOB4QZi3i8Wf6a0=;
        b=zph7BAneAemvNiOEGXlTw8P/LAc12Tl4Txj+ycudyFAbS3JOku7Scy861iBQOJFqyn
         6dfbec4rG1e56nVYJx+m6HMwZGkxyEQX12j4SERXeohR4iGWSL+t41w+TbVYwYiDIXQO
         KLVLq8C55YWOPjRYZU3yIFIEO3sUaPWLGTN9kg3aDSy6jgOV5GD3MidW83OIHT/zuny4
         gd0Gu7eCWqo6lJQbPs6px52IIS39i19dPGlxxsRlrANdpKs++cbnqcdOyScwHc18Em+v
         KP9WaHreHSu1N4RUiJk0nq3MrCJAmLgWeiDC2Gc58qyHARf1CKlXPXiyX6iSxiXpcSUi
         lTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609434; x=1756214234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYMdhxIUQ31/cy7vzWDrnpVEGbQxqOB4QZi3i8Wf6a0=;
        b=UCB9QQFBzQDvKqn9ZI6GZnrBY9xmDrSfq2703Zn9OByqY6YzAyLmuZ/TMVL+iSS+xo
         /J7sNCTs94nePf4RqSeEJG0fqBnpOxPohefmBwXChc/2G46e/dCyrt7nb53xeympxKfE
         vrmDjUzp47+Bbmzn9eKOCpYyrUSleaU2/yvsO7CTu9Yh2Y6Q2qHX3mvQk20TVFqao2pP
         91ye7c1e6AskqYIMpiFDUyFzzqCv1ipKtTeqsjlpi/dMKiMuo0T9xjS8a+IXXAizcDxB
         LxzCmfTTsI8/gKU6jh8MSg32GA4TGKnpYfwLJBMlV+/bXNhk4hgqgz+AGoq+J3RtaQhg
         QD8w==
X-Forwarded-Encrypted: i=1; AJvYcCWt4SyESQ63sPpOiLyWoh1Z62NX9Sff5zd5E7dwH3uoP4SCksz7Z18XmzsAGOg5w+rnkkK10SoduD77dYZFEiQP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx12/2PH4zv0dof7dp1SMNd2Zjh6oP+NWj3Voeb4MHOvhAXYc0j
	D/8ZJ2vq9ud28Oi+ae/uZqs0Fk+gw6PKisq4TF2PNJD+scXWpe5MMmvjWP0uWsMAdAI=
X-Gm-Gg: ASbGncuvvKT/7xFTRsTOdJgDf1vlZ/lKnC6BGNTDu1LXvstu6/NRWn1u+QVGmciWLn/
	X2UQWoU/5iaFER9DNUAYCXHuO/erX2fvhw4uH56ozaJ0U57KaBojgygoWE34XsXov7Xma/4+L73
	bDgQpbhb9vH47UXkG4NjvwQGzw6kC322AuHJ0B+kbNvXhgyitmdsr1Ppv54ZPb4fG2DEuRx469A
	yWOBFsWYWTzCTU+uEUDB0qR9wZO85uMEuPFRUDm6sri3kn/UPp2Q1qXT1sFMbrYpqnBo0IC1w0T
	gGDuEGn3LXIxmG8XX4Y9C8sVSQWv57qCLUaWCWrgTf0C+fSJLpxkJUXcTew5bzsu1c6KTBbnSlu
	ZOWFXIokHxk8+8/DPuwR85uL/V05vkGtQmg==
X-Google-Smtp-Source: AGHT+IGKdkV+1r589d0SVRi3O+feTSsj4hmOGvm3/y18TTqAWbPqtEd00j4EtkVL8S15WigaZDcifQ==
X-Received: by 2002:a05:6402:35ce:b0:612:f2fc:2b9b with SMTP id 4fb4d7f45d1cf-61a7e6d953emr1012321a12.1.1755609434365;
        Tue, 19 Aug 2025 06:17:14 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a92678f45sm129674a12.18.2025.08.19.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	=?UTF-8?q?B=C3=B6rge=20Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: stm32: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:17:09 +0200
Message-ID: <20250819131707.86657-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
References: <20250819131707.86657-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=CbjadNNNEe8Yn9p48OvNEAWuQJuq9CsOCkHrF+TBmzM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlUh9ijAKsBRMt2aMyQYJ9QM9JmObsPeF4fB
 AxubSnhgyCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5VAAKCRDBN2bmhouD
 1xayD/9T2Czt91Y2lD5WnyYHRP0t4bhHs/mS2Qe5NTJa2kew7W8Ij/MB5UdXtd0mQcNRTLa1RmQ
 zXdldkv7Q4qLc0e8j8u6/U+ZeGUQ0TNC0amXAXc1XbKOrQI8RmACzjSwjV7bueIInrNE+Wm3xh4
 JjHAbMbiTxjc5DFkVK33xKIzty0UwuTjB0GrFPdA5aMfnRQTrtyux3nG5b3BrlvheRM8u/iAB05
 YdIBZDyrB7Zp/W2+4lxfUuSmRrp8Q9LZX4mSCVQXPKAgKiHcWYQTTgKcudviMw/owCZrKDmfu8j
 Qyc3qwE5+zfAMMHEZGMMBjxd0eFcXj94nTyZET3KIyG76XwIbyuU82mc11GVAk5x0C5jrIFCwm0
 W8ogs68q1bM6Hj78EeyNLzdnVpg8l8wo9c9WIsJwvT8SALOtFSRGeyTh6Jxq5GnQF1HOJKs/TrK
 kUHl7U3aLmpMrPUtwTDtCSdyhIKxNBdfX6AknvtipYJ24n4a953GkS8UVw2FefBkvaCbt/scdjR
 tTYvQMz0UXez7T6LuMsDNIR9DuKvK0PXXcbn01XzwSaI9YmmDPpiSb+y6RnNHn2aoKNQ1FABysk
 YaI8qpT+itvR0oJ1W1chMdyl7JA5C5KpZdSgnK4kLjb6jjrv190uoih1k91q9q4z2S+Pgak9lV2 zSIyIDqwPENIr1w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061716_156502_79A21E4C 
X-CRM114-Status: GOOD (  11.95  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 836b1958ce65..4ff334563599 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -100,7 +100,7 @@ &combophy {
 };
 
 &csi {
-	vdd-supply =  <&scmi_vddcore>;
+	vdd-supply = <&scmi_vddcore>;
 	vdda18-supply = <&scmi_v1v8>;
 	status = "okay";
 	ports {
@@ -151,7 +151,7 @@ phy0_eth2: ethernet-phy@1 {
 			reg = <1>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <300>;
-			reset-gpios =  <&gpiog 6 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpiog 6 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
-- 
2.48.1


