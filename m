Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD3C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DyZj8nPcPoTnFMccEZ4zeJr7vJzNSB8EdaxDKX89cNY=; b=cOcdWmvmD4lTh5em/Z5P/Ufnsd
	PKDfAyksHbp6m7Mhn++Kngw4znuLH/XB+BeCRbx0iYRDO0NhGSI+TXub9NtJrusifG0N7DJgMm7pw
	HeD+y52k4I40xW7A4iFL+YfK4LxXFayKH7JBZEBqZb8L2A/bG5PzdNSKfIrmA9yxJQJgYjNkx0gr/
	EQ3qQdxw7yJ6d5/+PLrNeP4xtC5XXKArd4DMZCBg1/yVjzFdAOF6xEs1oguD5Pq4X9ZYmfXUAIW0R
	3bWP03AItSAA9H17d4/EM5NGEid9uJEC9ERHXV7U3bdxr49Zqr5l6nwCCM50Zh48MRqBmU9IAUCNI
	D5BRWMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8YR-00000001OtA-2H1n;
	Mon, 30 Jun 2025 07:03:51 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8Ra-00000001O9J-28Bs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 06:56:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-606b39b19b6so794372a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 23:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751266605; x=1751871405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyZj8nPcPoTnFMccEZ4zeJr7vJzNSB8EdaxDKX89cNY=;
        b=NJKtUMNi6BLEgk5m/Ju+yXcbt4tF9mRPx/mLbwiTHsbeUwd3NIeS0Yf1MrkZ5gqMAO
         77nqhi7+bdbCh1IQ/uHC4MjmsMWh5I4FVwkoP6HdJQFiNhIHvZkPANheCVfzKzubtBJI
         Co3IMToHnXvMH+uS6iZjnENqAJ5F3I/SpBA6n5CL62WZj4YtC8JZUURDIqJqOZlwhWLR
         Q6fpEF0cWGIU9Kvr02CLxUX97QZfWMIPjmJ4VcjNgWGlNf7qBgzHHKSV9HMfTn2FGcRm
         OX5qRQG5KW0xgz5c5xztGsEoknOiO/7Rt0yKfZCjuwTiIIcWyHJzNSEKcXzxdlVr0tpO
         JXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266605; x=1751871405;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyZj8nPcPoTnFMccEZ4zeJr7vJzNSB8EdaxDKX89cNY=;
        b=ogmO8W7dpUiSvnwL3CZmjIXfXwyeU+f0Hnf4Rpu99LWFwVSrcTZ5QnoY4pjmD5b2zv
         vrQAT+jVR1n5AmQtJWQjOuwSVx0wtprWjKGb7uRbKVem7rqwwUp8T5Py+lUrPMa4+4Fv
         d/BZIpOrh2VItRX9ncwe3qStyF0yy33GkzORAggj8UxA9+oHmeIQ4aAcl/vUbRmeEF4E
         6eFNbdte8YnMpCq7qEgNJRXJwph7g0qQQ9bGfqIXteyfAOp6vYJz/C2sQPiC6/2iYr89
         VGbvObu2/CoN42hoI2Bg2Xh/fDHmimelJN4CrH6vj2qI3rEeOY7TwRMt69CpUtL9XCPV
         reNg==
X-Forwarded-Encrypted: i=1; AJvYcCVLLr7ZRIPR+gGAA3y01dTxAnSg6kHirspzl5NAkSHKDhoLCSHtWcwE8lLrt9+uYuZBQh9KH0VTE+xd1/MuE6PA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdww3Od9G0fMnEfhvs53HQL6pImn6c8MO9oziT0dnztlSwNcC4
	yL2kxyFs2W4JxqLI8aA+VK2pY9yN44YMqDK96/9lYfTSS3dWlEWXfsV+ZF9l1KqfXic=
X-Gm-Gg: ASbGncs0R3x6zyh/vDP78sC+Yu8OM4V/3tz5f2h5cS8fNy8Yhx5VP+UaNScZp0SITxA
	UfY8RSqebYa/zNEaGLwa7uBQbklK4/FV05gg2dTmdIUOApLn7ivzIzfisfCT1xQBzHqhPYxHFA7
	T7rAcuc5ujbbzuXOIlFUQgJoiDurZ8mfG1+cDCOwJOD552fSwBXciVRO+J08Y0lHAdXG68MU5NG
	hs8eMKX8b3tELZghHY2NrJPussxdV/GLYl1BiZ9zjAeFxA4VcfshnOLUr/xc6RiJFJQxeA9ZnTL
	JDdBgJ6KyGSKci9oOPPd7KRnKSFs1PHz3gAV5hoSUQXiRZGoHhze9OtcUguAjI+uHv1O9l5Nf8o
	w
X-Google-Smtp-Source: AGHT+IF0+z1owk+fQhEVA2fP81jzcJuC/IcoagGIIigKva5Af1N3s9aozT65e1qAq00izYhFRMUbUQ==
X-Received: by 2002:a05:6402:3490:b0:606:c63b:e330 with SMTP id 4fb4d7f45d1cf-60ca3e0fd25mr2340236a12.11.1751266605105;
        Sun, 29 Jun 2025 23:56:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb118sm5368960a12.2.2025.06.29.23.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:56:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250627-gs101-reboot3-v1-2-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
 <20250627-gs101-reboot3-v1-2-c3ae49657b1f@linaro.org>
Subject: Re: (subset) [PATCH 2/3] arm64: dts: exynos: gs101-pixel-common:
 add main PMIC node
Message-Id: <175126660357.23797.12999014695836191870.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 08:56:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_235646_546484_279B426A 
X-CRM114-Status: UNSURE (   7.32  )
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


On Fri, 27 Jun 2025 14:29:31 +0100, André Draszik wrote:
> On Pixel 6 (and Pro), a Samsung S2MPG10 is used as main PMIC, which
> contains the following functional blocks:
>     * common / speedy interface
>     * regulators
>     * 3 clock outputs
>     * RTC
>     * power meters
>     * GPIO interfaces
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: exynos: gs101-pixel-common: add main PMIC node
      https://git.kernel.org/krzk/linux/c/cb98b8a8d6e2797f1e4a0e433a20c57492daf783

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


