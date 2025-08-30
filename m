Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26784CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18xNVcTt+Ut2Li1HIkvZ7r0gYk2tthQkOl8QvQYyxWY=; b=sG0u9nZ5pSCmDDTz8LlNyNot30
	GPK4EPKKzbQzltv1kWooaMEJf4Hc+I4J88yxGkCO09QRPxNpO6Yjq0vXcIq5XRmNBlaIPKaKdO8Ur
	kNw3BYOVNu/eACU3IHdGCXGK8tZfQFOuiYOqZrmi18+/p4SjCXJm8503Zk4ejaQBDbi0wYuebOF/K
	E8EWC28yuaD9mXZNM1zqhdtb6W+10rQ8Q2WrhabX6M7ZLJKLKBe0FFNDFnaxJN2ZxP+tZqc1+mM73
	uHR8lYaMGsshft8OTYLnEIldwu/sj8zjfqs9iO7P+5UT6+HUdV+WFo9Gv8FwuN6Y11L9W0lLo9Gdi
	4I0zcBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usI0K-00000007gCV-3JQF;
	Sat, 30 Aug 2025 09:36:12 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHkg-00000007fCe-1xDt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 09:20:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ce208c7505so410323f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545601; x=1757150401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18xNVcTt+Ut2Li1HIkvZ7r0gYk2tthQkOl8QvQYyxWY=;
        b=pLMJL2+qzJAAqDhh4SkhnJpPBngqxuN0b6Mcxg5gvHL53crUeyPPCWh4GBgFhPYtlu
         vXBRZYQvdTeyN2KINyAAEd6yxO3LK1nZ2XwcHr6GSaAw4TrnkEh1/sT3/BHrRbs6TR7z
         4h295M938BkVbFepIZ78b3I8iVFGpLP0vadNtCu9BTCDpIxtwt17AvZmnMiEsp/TjAE+
         J9BGshKCIzzi8MWlMO2z6mMeNfamyiLH3jVLVDX1J4+rbY3+V73WOs86rytt+2QwDOuW
         cZqG17u2bhXXdObzY747A02bSpIMYCjXvAv+lPjaDW1T6TiYLIPhskM3B165e4f3JYiL
         VmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545601; x=1757150401;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18xNVcTt+Ut2Li1HIkvZ7r0gYk2tthQkOl8QvQYyxWY=;
        b=dbBhZhWVwek+Yi0SSq1nWL8tjGPXvggbmnTyW6Rxe1O8DrBb0MMzYWc1n7QXaRrvCT
         uelUKVKOT/Bm9T6d3W7tazGZZIQAtabZnYVhVHfizm80AZ1fPrpHIsu887/EBaUgRzuV
         /e+z/hyRHpW4qsZTYFkrGko+xaGMihKgu08D6OSNGk/OW/gYaIeyrHOzZKTg+2j5wXkD
         xqS8QXYVS29KVhtqYcQmtKHr28qPaK8fvn5TDxu6LI7VCIpJfIdyeeTs4Tpp1BpFuq/u
         NJLBISOPkmDcKGb3VOvEqducYFLjMqiQ33ado7l0gKBqE/rLGujq5fczpqmdUSslOHoQ
         Y8PA==
X-Forwarded-Encrypted: i=1; AJvYcCVezvENCjsfovzSeWihxXKBt4ww0vIX5VZfN5rzidKTXjLpMJgJmyeNw2JRi9boUHrt5nX8iT9N8jD9gUA12B8X@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv2Fz0hyyNp5jHlwTRICA5ETmL18nbtM3ed3tV4L/n52LRtdnh
	SGtRUU5UGAsU7DjMBc2+QCdp1UODRUTgZJyhI5dYjywrx+QtwqQ43sJyWocnRZv/23Y=
X-Gm-Gg: ASbGncsd89S3eEDxBZdz/e31lSGmOSJMSdOlpEuhoBD58BXgRzeQyVyYy6iJ5Sj8wAB
	aMFatrgkA4xv4J36IrdbL9QMm7j0mlgk4ep7dyYfQLNBnwhDmwOJJYpxeZVBXxwJGIwcLkh1DcS
	jLuF4vnRRjXwl+9uOQ+yiwdDjEqXbgP7BjpdavawSMQ4XkbAe4NbMZTsrwQDdFcBgEAR0+xGeZI
	j6d2dZ1dnfbyhKoUI7H/Hn++RQg0/4x09K8owcHyKVKOSMfKTJ8p3TdlJ2fXrAe2jj1q+hs48il
	QSceadeNOp7FkE3kdmCBf40pdXOIYLOxXowRdTgJNzAFrEhiF+HTHUt2CS4mJyS91391q6lQ6r9
	mmwpHf7keQMYkdBFpafOUJpCi97Lp57ZTvXR55VgSF7zGFeJCwg==
X-Google-Smtp-Source: AGHT+IHwLu3eO3G/g09J4U6BQtf6Smm47bmXXP9dfIdI1vYcv6TcxL9zbzWeDgmZ0/d3DtuvTitzvQ==
X-Received: by 2002:a05:600c:1c9d:b0:45b:75d9:2363 with SMTP id 5b1f17b1804b1-45b8016df84mr21110275e9.1.1756545600887;
        Sat, 30 Aug 2025 02:20:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:20:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
 <20250822121423.228500-7-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 3/4] arm64: dts: fsd: Add default GIC address
 cells
Message-Id: <175654559953.10738.12020984387702262826.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_022002_518576_E89A1414 
X-CRM114-Status: UNSURE (   6.73  )
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


On Fri, 22 Aug 2025 14:14:26 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
> because GIC interrupt controller does not have children.
> 
> 

Applied, thanks!

[3/4] arm64: dts: fsd: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/a874b387213bd80b1288884aeb427cb7599eb5ea

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


