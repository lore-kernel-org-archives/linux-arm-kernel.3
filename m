Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384C7C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=; b=qSvY7cVBJPfIJHYmGZiwFAYD81
	qOnYDKYGFv5D+xzpEB0Zs4RvJ+r8m+Jyn/r+laOOVpDCTAr0gE7Oi11QD4h7yDDAU9vSlQrtDdtRz
	/SI1bmVWUnCHr1gp6l5/XGccuZ/3v6bpZy4dkoSRm5YdxbZYkjCamHpDksuy/3PCSvBezh2+BQ0v/
	Wyd7bpo0KpYaAwgfuqtP6biu2osuPawWGkUsdNuiGcVSb015+dtrWX6yCPe8sd+V2pM58y6AXwl2K
	ZlXrpRd5/Qc4XJaBYQH3qdsiND+MkQu7BMT+nGo5FqK8nP6EFnMvkqI18UtQfGD/fQxlMXA/0YULX
	rBTpdCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYQd-00000000u1T-2HpD;
	Mon, 10 Feb 2025 18:22:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYLk-00000000suN-01Cb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:17:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5de849a0b6cso2299000a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739211458; x=1739816258; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=;
        b=kKN/YAFlsATaCK/XuP5QdlbZmRkNwUU2oCEQS9+6bYcNTyJcBJjBE7LSxFpLBkCa8W
         9UiMM09diGep3gZ3T9WQLhoSB6WmB2ei0OhhHSG9kSHXYyus3qKmnZdlw8Qv6EwCTBi2
         M2/qEZnM48nDGNbtnqMn1QcjDsl5plk7/KU9q2CD/9htyVPGoLbDr2XK6lmZNBD+hobj
         rnPrXeoYtcmbiLN6U8erksS0Yt5hdgckgc1xkOmNqxWI2bNYw3ij5V3WCdGc83vgA6A7
         NFy5oCpxrrBCxeiNfICtMIylHEy7ss9r4KcsESsj/A6f2Z5h/AKVEK/K2oEEjr7Q9LxJ
         +y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211458; x=1739816258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHaDIsqj34B8usesjY16LwOg4JnnE1Cbsm7V9RJsdE4=;
        b=Z+RRTTlaV6aNK9tCdfR8ChOPi3r7KWWAsvytMdfUjz/fzdp/B3t7+NKsEHaDgk7ZOd
         6JdMj/Mz1SKEJY7IGt8/KbPw6ojCAOBt+QmqvR+WUmnPgNumDSqC9s2J9ZBFyl2wJNT2
         5RZs8LcimMt81d13BEM2Z0kJYm7t7KaUubu9MCJ0dYM9ACjAm/s2wjoc1z5zD8QUbDQD
         9BcQAsLCmocceJNLZSxxD532V4pEukDhuKdfZx5/dsHulI1AwBTHzpIC1qo9NTYr9arV
         4JgqTUky446WBTMSlKHdmtYClyiz2sVaUYQxKdcCaNCdfDPprZQ6UbB6M+SHM3Ud5h7q
         IZhg==
X-Forwarded-Encrypted: i=1; AJvYcCVFAa5fiBiO+EIhwOE0jCYQrQzpGRLCDayTPobVZCPF3dfYj7KEOTq8Eso2LSzrbbZMmv3Rnb/RhBerATgBh9aU@lists.infradead.org
X-Gm-Message-State: AOJu0YxBA7wVn0hkbKvBvl7q9KaE276sqwCn0tTksoVUNQEjqMA7hTuJ
	WKFHyRpQ+hikKhL1LMUpWnJDGweToqERG9mOr4BOVjHpW4kFSmZ4HzDQiMa1aRQRj3+0jSjA6p/
	d
X-Gm-Gg: ASbGnct/fKQhKGsvHLxktjgU+D6BnseMNdFcHKwx1nyOM1lyzrcgwtWQfyhMsZdURQi
	GmYMXK5Awec7oebWubkZRcBAQQmYlZELOuv1xV6Kg9+32cHZZ1HAfJ3N2u7XfAPhQmKkkm37gDE
	XNQdB0yMAOPV0isXYXDcdbNaOE4F+900N1hNE7vDcKmkjI/75IU/AFIGZELuI8tstzrQAhinTof
	J1MC4zax4u2HnBqmk6JT7HqK2y812ml7jVHlMBCcRYkhr973KxeAl6bxowvjPiYw5qCQ4dwG0ES
	aMymp26TrxdEW1Lu88VcvCcX
X-Google-Smtp-Source: AGHT+IE17precGVn60p0mKS1K0f7v1etGQpp1R/N00rlHb4aVUugfxbIzoj2Q7spw41fxBN5V9dokA==
X-Received: by 2002:a05:6402:5290:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5de4503ff1emr15027701a12.7.1739211458355;
        Mon, 10 Feb 2025 10:17:38 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4690311csm7037457a12.60.2025.02.10.10.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:17:37 -0800 (PST)
Message-ID: <88c69965-ed8b-4895-ac99-11a6cddd1a42@linaro.org>
Date: Mon, 10 Feb 2025 18:17:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, peter.griffin@linaro.org,
 vincent.guittot@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, willmcvicker@google.com,
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org,
 Catalin Marinas <catalin.marinas@arm.com>, ulf.hansson@linaro.org,
 Will Deacon <will@kernel.org>, arnd@arndb.de, kernel-team@android.com
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
 <173920411592.476427.15574016492470186426.robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <173920411592.476427.15574016492470186426.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_101740_055752_B758C0C5 
X-CRM114-Status: UNSURE (   7.66  )
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



On 2/10/25 4:22 PM, Rob Herring (Arm) wrote:

cut

>> Bindings for google,gs101-acpm-ipc are proposed at:
>> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4

cut

> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org:
> 
> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /firmware/power-management: failed to match any schema with compatible: ['google,gs101-acpm-ipc']

Thanks for the report. The bindings are proposed at the link above.

Cheers,
ta

