Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99380C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=; b=BDI7lGZcgdGGn84V0w3+JEqdmz
	48XZEWmgAAzrJYlBjVaqulDNE83ja0BuKVXftOSBwjM+3Gn7y9DdaTmqgi+5DhK82HPMbCjLx8a2N
	xy42eb7Z7JQeX3KPMg+zIC+Vl3HHyLphRh3sFHzg+TqCt20Isckt2z+MyQzO1m/FBzZGMS7ss47/L
	3LEHBjnykf1y+2XUhRo7oLEtdjI1fL8mzCMd4RUyei2tvFd0WCbdYiKWKkgO6YKHp37pijzFZJOUl
	k01YYw0WBmeW5bgDIcJb2+dFrJfj+kVT7FW1tLMKDPnDoBqTHuJB/m9TA0xHcdZ/v7LKL1RktYr7V
	PpcEKyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTIl-0000000HSqt-3Ghl;
	Mon, 10 Feb 2025 12:54:15 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTGe-0000000HSHi-43aH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:52:06 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so3311336a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191923; x=1739796723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=;
        b=ykbnFGgxU6m++Iwp8Tl8G23opoj6KBHMRJn5HrCv8/SK4CGDZLhNOt4nF3FE4xAdNO
         Va9QRVCnkvIa8W7+GI71Ubbtan9EsLZS23uwtjSkYuBL2Uu3xY1q9N6h2T2Phq+xZI+h
         DZoW/la/HUtjkq9yRFeVaPZ12jFoQa7M/vtU9AwNjWQ80QoK79jaSJc47Qo+9iInA//W
         zkGOPNbfiNahRvZ2+ycFgRSn7nalV4yycqH0kkRpPOFiDFFgKLjpmsvVOfLDFecjp9qS
         qCXXLr4TpHkzHJ1qQjcXFxeAjNLQMJ9pOBryzZyBoz7LVHQMS2q/SR9h5TeXLdEESOIK
         uagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191923; x=1739796723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=;
        b=j0rgthptcLxxYClLemSkry8pMuQWptLM7+UWicWDd1iSmKemW4QZ+8xWeY70Cl6Waw
         t9ryZh2B+HyvrG1AdtmpDNd2I/IbrXiGTwy+5lNtnHRO2EfAwKAVhSJdWgCmNv7R1vjm
         61F9iYw5i7hHh4VHbEysG6abV483Dtei+tx+nzNomw+WpDGOHMTTSWvhxhFA1/oE4BCi
         8o8KodkigjnVj3XQ6Z0qCqfJOYftFiIaQs/VOH0mc1P3JMUx8vOKK5Ond8eXCYiuo+aP
         +5HIcMd+Gq2ti3pxomeQZOxQC5fKpIvMT0vxD+qPTAjvwxjxwQjG0/pXW7sU61iWwirw
         uY8w==
X-Forwarded-Encrypted: i=1; AJvYcCUbPuYWWcxEJJxTl6l6f1PvLdR2sJbhs0cBbt1yXbdgUtTSd6RmmUvYN1tJhLsc6ddvCLjDwscZWUYWxKcuQe2b@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2tt573AMv0ceCA13b0yBPIA4Lz1ioBhTERBtqW02E3SuYvooc
	nwG+4/ZF3FxQ/E5hKgUUD1Hcr4nv6jt7DRZyYo4e0SuN0D8e5nai5YRL/V5+MsA=
X-Gm-Gg: ASbGnctCThr97oRPulkNxiBnIPN3otWdYaFabSznK2sskKpGvKe9l2Nh7XQSQPGr4sC
	80uzyRNh99Mz92t/Iw68/2QxadTJM45TcCVip1JoleaUqIBGb3iKsAPULOPCKhqvUbQthu8gtqc
	+APfQiydgsh8cbmJl5d5ZZCCGQHGvaTzqICUIXCgHjsAMvIbGKCsOGudeYt8SZpMdjvt+IMJ81q
	Agb+gq9DzBHjG5jfkwkfcOw2fe2QBx1MMZbOpV0n/rDGRpoL3zeVV8Y7EiWApbyOWtgQrsDZDuG
	Ecmoit7u5BmI/m6ZnW1RtlCUykKXkGEFElAYpmNmNcmCIFDHWvM8XSO76MuN8Ya4qo7i9YPH40k
	=
X-Google-Smtp-Source: AGHT+IH+NgzE2gbAq1itQhugXDlHXIYig8ArxGegZBDP7bul7fijUmgra+TzZrMkLOQO6b5p+6Fjqw==
X-Received: by 2002:a17:907:6d23:b0:ab7:5fcd:d4de with SMTP id a640c23a62f3a-ab789c50af4mr1427309466b.50.1739191923425;
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:02 +0000
Subject: [PATCH v2 1/3] arm64: dts: exynos: gs101: drop explicit regmap
 from reboot nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-1-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045205_004705_59B2CA28 
X-CRM114-Status: GOOD (  10.81  )
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

The regmap property for syscon-poweroff and syscon-reboot is unneeded
here because the poweroff and reboot nodes are children of syscon
already. It also is deprecated.

We can just drop it to simplify the DT.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..e78dcd506a5c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1400,14 +1400,12 @@ pmu_system_controller: system-controller@17460000 {
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
 				mask = <0x100>; /* reset value */
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

-- 
2.48.1.502.g6dc24dfdaf-goog


