Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BBDC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=; b=YDhlog1o+u5jFPfsjQXhid79M/
	4ERj5cotkIXcmOkJMQ6tstlY618buG+T7M1Z6yp6julZvq38VYVqf4DvJtj0yp6gQJDgwWcJ9e7ai
	a8CZiY8ihtHwe7GJZuhKjoBFpEn4KVuJ/rM4IQ+KQfLWRM8KpbuFiSQYoVpCekAY27C2TlsyfdB/m
	YA4xRoG6HSTwp8T+LxFjVqqewKVXBcO5Bya8cU+z5mpIO9u1k8asfVYo5fdJP10wJBWakOE/Y0QQ1
	TwKL0dMeiCLC4IUXtiYLkAm/FfUNpW7q2xgcQr7JlXcpJRxYIwrvG9hJDe0bpj2isvcFy7PD4Caiw
	TGXi89hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lSx-00000009Ncx-3mxi;
	Thu, 10 Apr 2025 06:32:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lNg-00000009Mk9-0Ak2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:27:25 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so449275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744266438; x=1744871238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=s3VeZqDeibk5eDgw06lEMY6Nw+ZUGoRRUH8lV29g+UKqOChjBUJBtB9d2uB+79TR4p
         BYJcRWRJm/+lPhYjX0A1nHkHYD16oDCjFijTomfAYqlNLOSgsqfdBpW38Kg/llvh3N2J
         UgfLA4NUWGPr0Y+fYJdHvrBW2hOyGVEhEOztGwGcW7TjGQs64rPaW86rHqwya1B14yiX
         KUrVj9wMPziWcktT/JhDE/l0NMIRHjzDJnDFVMtbT9DaivtPxYvL7bgJBYw9jDShISYY
         rLwUsLwb8f8se1hxeT8YbsTwCRCTz9WZKfr3i6N9gLVwtqU3/aQmg0f8IkkNii36Jw3t
         no/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266438; x=1744871238;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=rAheN/blPfm8H2Mp+S3ebt5a702doa96SN8E45olTIenQ2s9hu1Ps/FPE3WxqjIzPx
         IESDh+ts+1TlJMI4VdULt92K+HV4zBGvPWWG2WRLEP+o3A8pAwo80eRZq7AVtxtqPTHw
         /U/ekdR72pMTc8EP5J3OYBKNGMpKaIqnHyvbUj4QZMsHfdExoK2RiifuRrlpnq2PvGys
         uDjCYgnWJ2vY/+NJs/G2aPa+5eGRos/RV/6i9gknNI3dTmgSsRGbqmBELmmqS9/1mvLF
         t8UfS5aR/ZUkIyTvPCUW3rOInWu8ffhTQ7rt9RqfK7VZFU36Zqi3xFVB9LofV7y1f5v4
         Ne9g==
X-Forwarded-Encrypted: i=1; AJvYcCWvHzRsKvpKVXJE0/vFhhbyRUWkCqg3bGqb2ftEFQoz3qPCAGnrkJ6wxge+exdU3bwgqjfrqksv5RmDjkxLjNpT@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc83d0GU4RnA/NYJYDIqS5bpiVXmndXQuveae7UZ1e4bSre+U8
	mJsuZB8TslnzAbAh3rWfOEuOcml63k0ukd1nIgbRpiaxOV79UvrGyVztjzm2++o=
X-Gm-Gg: ASbGncvaJhGbrcK38tQnmi78hJHwUktKfPng86mJquAml+kaL33aMmKKZL5oX/AJFLp
	cIqoV7pKfPHyze/k5n+J/Zz26n3N7cTL4LIBpmw1JIg5QFrM/qp0rEkTWad8unccqQsGoTDTaqP
	uS0pWK7M4QUXXNUPlwVGs9ubsuG3NE2SEzdOi5FVF8RbcbdXTgf4HS3dJTzOetNNTlBlyLF71OO
	Pma7Ec8/AOISTILcEWc9I7lcbB1Y6N5xEON6zEJi5wUGxqp9n2z5TGZNjIkFrPo2bbTI2y0tzC1
	4ZweA8UmnWcKyYu5aZuO5F2M+EUuW0UfMa5DYA1OpZI+4FSFpnYYjP0SvZk=
X-Google-Smtp-Source: AGHT+IFVRI+eHYzRePN86bPROJmtppmFeI/4qAEBjgxUHImff0Q+A3BjR9d8MWHmWJZEinQXV/yX6g==
X-Received: by 2002:a05:600c:c87:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43f1eae40f4mr18061085e9.0.1744266437939;
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm39520695e9.21.2025.04.09.23.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
Subject: Re: (subset) [PATCH v4 03/32] dt-bindings: firmware:
 google,gs101-acpm-ipc: add PMIC child node
Message-Id: <174426643614.15856.3555538804191184531.b4-ty@linaro.org>
Date: Thu, 10 Apr 2025 08:27:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_232720_097453_0EF6FDE8 
X-CRM114-Status: UNSURE (   8.10  )
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


On Wed, 09 Apr 2025 21:37:24 +0100, André Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
> 
> 

Applied, thanks!

[03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
        https://git.kernel.org/krzk/linux/c/935e5bd95df2c79404630a691caf42c3d7bc3a93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


