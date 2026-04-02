Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC548CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=; b=dYdW7Fj+bymoZhWuVX9VvG/ApM
	B3X1QfDQ502W7qc+6pyK5efUqbL3eW9hB2/Irawrv5VwBWPKNa3On1ugZvDvTLBtIvn148Sguqmhf
	JITp8R6AB6R2AMlgIaUFist048lQ7gEGAAHt9lSRCECowWbU0u0jYZ84XRzxuvVQTVH+qyVR7ZciD
	4L4ghKYpXavsFugl4TPVNr6d1fAqirOf9dBi92v6rNx72iNbuGGdBx1Nh/MIUIB1NTf1riVXNe3Ai
	Mm8dyCyvvq3aJStHNWMtYpjEb/HN5SJCUoIJjA7RlpZHU3cBm+DFw4BH1FSlSwJfehcEQeNoCdVNZ
	7J38M4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dh9-0000000HCcW-3Kde;
	Thu, 02 Apr 2026 08:46:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dh7-0000000HCbc-04D2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:46:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486ff201041so5454555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119587; x=1775724387; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=ic8ASk9QQUucfrCGobRJ2C7nyULwb9f1wTjPuKfTSLYS6pUz+4V7izlPDfPwaFN+SN
         lqkXE0UUthOHQA4BKhX3J3pso/SG6PjBEA+27IauCgMvdRwaw11c4wQ82A/JHFFbTpyD
         pnevGEYB5fx9p2Na4T/PVmTWS9iinkMzi5JUIV3uMkga2EkJYeZURRC637t44xjRN0Kh
         ZKV9uXdVglLE+TEn8pjnxc01/b9lJsU/Z3arKX5S2s3v+IlX4V35IEKTU4zVg3tUy86Y
         E3RiOmC9nxOV6YPm2FM8I0iTKClQ4NEeAlhlrOaQSiJ6IOFOUxFBprdZFMhHi8wgH+uA
         3flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119587; x=1775724387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gczMRuZ2fsGRpoCXUBhl7NeVLE82+ehtyW2OQrB7AVI=;
        b=lqp6tNDUccQFs6B8hC97V3FNzZM5uD3x/mYPq083C+RcW+L2sGkT/rXq4+Aa2AcMuX
         Fthz1JhQnXKhQGSGsNT4sHqpur3hj/Ag3MBp3J2q/XgnFy0AiSHNG8bOtXaNwh1iPDfF
         HFZNpoytfcRc+qYB4VPuXdGofPlZK8nRI6ztgypI/nIRZJJsyKCTo7SwjnvxUX/egQVF
         Cv67PhSkXrEzClZEluG5JtuxnONw2+hpBT5e0HNHHrbwbF/DvfKihijL6GbZnJRPAqb2
         3SR7JUcXBPMpmzvK8ij6CDFiNp2WdAA3JArQW2pghJ+PI8EMtcpmXExOs4+Sa8qJq0fv
         CxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZe/LRVzbPZR8jriLogV5t8XUCkCcju9sBZQ2n+QrXhgQc1zvXSNBEAUw6+G3RTPXENlmUOrX4eC0SKd1DfNMM@lists.infradead.org
X-Gm-Message-State: AOJu0YyW+L7ksdF2J2TiUCgoga82EqGyrIuJS27wKCV/pZ94hEtYFeOU
	SFAA+yaJJS9eKcx7iEiDT9qQ0O7T6UmNuKWohh1kD4XW0KVzev5BKI6jh0Ysg3Cnk9Y=
X-Gm-Gg: ATEYQzwISV6tHPA8QOIVzMTynNYG8yciHbp/tDP+Hqe/RS2tVFgKDpYwN0XmqL/4bi8
	sK5bhLcnyGb7ji3PxMwtJCuMQdjuyGuhAKmgYR9X8vqd/2spZvBzzM2rLpDud3Zt6xlF7+BHeps
	lSpndjkfW9cNL62hcUM1q0zupt07sA6Ehe6AdpesOp93AQajRhScgcV4u1xEJvuPWijb3JreQkl
	33MZ9l8pUuQQKHCUd/gH39PLPPwZIxYijidjOJ6U32qLDrHQUMMlvC6jpR4IK4J4+U0Fs39IPlc
	9HoFun/PcAiH233Mh7SP16Xl9lldimY+f7XMeusGTc2UOv8sKeitbKkqO2B2nnaY+ge5S4LZNt2
	AZdWjEfmwZRL0MRWPpYet/QZH3Z3P9tguiKd98S+o9CENzlRY9MCi0hNdWhmdVAKvHXQxZcs8YF
	6ED795UOc6UNNh6J2MAgg9MoMLSbzoEjQ=
X-Received: by 2002:a05:600c:8708:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-4888b6d4fdemr41857485e9.3.1775119586975;
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e93cf2dsm161779865e9.11.2026.04.02.01.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:46:26 -0700 (PDT)
Message-ID: <55953d5d-c4de-46a8-a9e0-8ff952707234@linaro.org>
Date: Thu, 2 Apr 2026 11:46:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_014629_120619_BD1E63F8 
X-CRM114-Status: UNSURE (   5.47  )
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

