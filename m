Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99184C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iArDif38+fZWZHkgSuOxfgSy+rEDqBvDc+u/YR4aXK4=; b=4uogeNG260b3r1lD26shjbR9xd
	GVo/4l+lPQE/hWowcPLbl+O5w2W+tVK1K18F6IzXyC85wp8mHdE+/4Fg3RC8lS4BjlVIl/8s8p3XT
	mTtAVb+YffqdRWjlijZHWet3sJc3yZvtxFaekV0Aka68xRulez9+2xxuFQiyEesMmjt1ExvGO/5MW
	KRmUn02tDfGfTuWmN+fVUT3gjLINYiMTuvzvrwAFuWBj7Z4d2TtFheUGlZuNZBRMoj5hrch8sAKlN
	mYbGyvtDCLQPa8pJeHE/JEgck/7DWOS7YZoVCImxBROKspd5EhbiGin2RvzSTcXztvdhpEtjgY3gW
	eJRDewCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZJ5-0000000EYCY-1pB3;
	Fri, 07 Mar 2025 15:08:11 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZHS-0000000EY0Z-09y9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:06:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3912a28e629so66615f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741359988; x=1741964788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iArDif38+fZWZHkgSuOxfgSy+rEDqBvDc+u/YR4aXK4=;
        b=CBFIqE/908LPqkoCGoPMoOtp+yEyfJTYzBAnyqRVIZnMbnDzmxmrwqMERknwyDsC1H
         tNLsUJNG3bSmVTnDskM5MctKhUwBcsfroBLp0oEkWolhvcl572vP28v8bQCgJ3ezImog
         VtBid6dk6lw+5/iv/5EFHV1lPYTrQs10MY5enoMIXU+sVNlI6hEdTvUi6wpkJIsKIDl9
         ftUtD2TBxJaFCP3SJ+5sBVgcvGOM683Xv2KNhO6IKi9oiu9g+aVgvFaxS9YfUY7YlEJ6
         LOgetwUezpA5fGYoFHp1VhTsjCc20fAkWSxm2Q0SbRqIki7ieBuv9wHQEz0GzVRcBdeH
         Svhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741359988; x=1741964788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iArDif38+fZWZHkgSuOxfgSy+rEDqBvDc+u/YR4aXK4=;
        b=ZvfIRlBYbBv1+FqibBtw4S8/I0IBh9MBpl0GwtTOLvbzN8VhvhyGqTdAGqmhCXISIG
         lYU3R05730aozYXnNMB+DpUvDsfA3OHEw2R8t6cGTzTA7yf9Z843ujurVcGmnZYknIbv
         cusTlfnCj7ntto8DOvg2lqbt968tQ917cJ0edmMHNuZltqf4L45YO47jGINwPMWf1gFQ
         OJjWo99S+CmFxzWTV67DGRUw/iIsgV6mE6y7UtiDMh52dbIgrJeuGc6pw2mTjoN6UNmC
         N/aK/6EjFHkSCTDAaeOhRdbii9GtfjTNkTWp04Ca/kHedL01W09VaeTP0RS7aYMv3hE3
         D1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUqoWgITLUuV4dFIoumLCSXnQgjoKL8rNrn5rhHPHtQXlyeuqi9McJj15L3UtbeIqD65LyKCcxvyYlun+qnmRF0@lists.infradead.org
X-Gm-Message-State: AOJu0YzXmzkjOkAc/jQL9pq1MxEXd5BVvWlch8t5Ri8PL9QuEuHKeQ2H
	FD6cBwkmmtKRolc31dL2G8EHNs9WrllMtEmlIG8RpggBvZaaAjCx5ZdUZ2MV0f8=
X-Gm-Gg: ASbGncshUN7X7cc29f4f5IzbyDiypDC7PKhuhWqDYyC7YUVcvoBdyH5r1zFoVaJl21u
	JvirXmEz4obeIaFHVr3rYa+FmLUH8YsmdLTB/b/sPu7jTcG1rXZnZLeAhxNtVP6Ik1i5cunComD
	xFYkew4YGxOJF0QdROh93RAVYQOZPRgXI+iqUZuj5QFGssK/oGyBs0RfrnwXhSRYpAMjAdbLdju
	82+z7ADBASCNA1zYgAVNIcjVkIVKPrN0jTtT08CkBcD2tDDG2FWvPHNJYzcRLymdfFMUZNitNh/
	bdBZshTFD+Kqk4VDhMpOEV5sfLKnw/8fRwMcd3vDeyPZNLFPNfoXe1BbD+30
X-Google-Smtp-Source: AGHT+IEepjQ7imgYoD7q4HWijAiTHHIHKB+RaF8r7Ya6WdH9B4Go9g4Q6bd0zl6386Q12ZEaV7KLTg==
X-Received: by 2002:a5d:5f92:0:b0:38f:2b3c:569e with SMTP id ffacd0b85a97d-3913a8b4205mr53814f8f.11.1741359988167;
        Fri, 07 Mar 2025 07:06:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e4065sm5694633f8f.62.2025.03.07.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 07:06:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-fsd@tesla.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
References: <20250219085726.70824-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: Change labels to
 lower-case
Message-Id: <174135998630.202917.16887190642980215810.b4-ty@linaro.org>
Date: Fri, 07 Mar 2025 16:06:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_070630_093760_EA172A83 
X-CRM114-Status: UNSURE (   6.84  )
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


On Wed, 19 Feb 2025 09:57:25 +0100, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: gs101: Change labels to lower-case
      https://git.kernel.org/krzk/linux/c/73fd2bb607387a77b2dde43a2c47db2b71c65a96
[2/2] arm64: dts: tesla: Change labels to lower-case
      https://git.kernel.org/krzk/linux/c/056106b030b73c7d53749469bd1cdbc89b4d2daf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


