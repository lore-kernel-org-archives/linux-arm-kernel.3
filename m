Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98121E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 07:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR5y5SI21qqr719CHt05ra6RVhCy3LYtwxpSH0rstSA=; b=v9S624yH/CXDLR/fv4Hcjz/tDU
	9mj30qTrHLX2rHyfntBN7r0cl+I9dMJH6tlYw4z6pbC1LbHN7JVDYmBLLXbvCKiRzEALdlwFcUt4Q
	MLUFcbOyEOwc7F7P/iZNK26EXoI8TIdI0AwB3j9BrDeBGUTKJaSqqTW4SsEREDoizTB7HTI5UjK+x
	p1ReT9F1fA1eXc9ZXInv14iQ/BPliWUrDMAW9WNM2dmXxXcnNRTjTOpXd2BgbY9UqVvjQpt3JYkf9
	JOiDdhzXYouY71TEveQ15oosdU/p6PU0gwPILkDZ6Zfgdh8Tx3xvcYl/HGb1Ar6XBav/X6OrcqhNZ
	0Pvn2n3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHV2-0000000E6lV-1Pbv;
	Wed, 11 Dec 2024 07:51:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHTy-0000000E6X7-1LBt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 07:50:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43616bf3358so1533095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733903404; x=1734508204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NR5y5SI21qqr719CHt05ra6RVhCy3LYtwxpSH0rstSA=;
        b=fs79geai2FIGUdvmKZnqJ/SfIiUbK2jBjn0Q90hGCKiP/M1IDZ+mlb/rH+5RWNhNbd
         9XGBDZWSaRSFwQ2BOUSYrd7yI6B7BrF7oqf11cV3tMjHh8sZj6AK3Phs9/RcqKNwiii3
         WDlhZA+JXqtG/EkAeVkbf4Y3FCKE3yLvBZyxlwTa4p16tuajQw8OrYeEXV/lyDlaS/jv
         Kz31hMaxUcGLNxHjWHqMouUB1WOh4NDHkHsKtNvVl5SHPJL1fe0xiVPrVAWVWjEqxkQI
         hDMLU7+DKsdWni/VXcMdrZlFX8i+KGBXnAZ9QU9pnG54y2TXgb5/q4/Obo7u+DU3PsCv
         Arag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733903404; x=1734508204;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NR5y5SI21qqr719CHt05ra6RVhCy3LYtwxpSH0rstSA=;
        b=QQgg5Zsyze4YSrod1SqR8JTnljpBtzcXs2l2fCE2SJN+2mO+LP8gQCscHquvfAheAe
         KjOCK4rOrQ/O0PF+aUdwICvJH3xjVujBFu+SbY6wGNhY4HpvNTBW3A8iEOwiBh8Md+oy
         b/fRKWOfzn0pFIiTJK4E5vR2dVfYYMJW+8qdE/plT5ByKSdDPe4hZQ+7Yp5m2//KKt/1
         XO36Uk1FVy+pxPuDebXNadiaI26FflTm9LFfjFlLFZK44mrL3X9e2XlO0CFwjn+tuwd2
         dcm/oeSDleW7L0w3VVuQ7ybn2UbvXtU5vn+kGwLW1OD5Nq2/D9rcqiUbGMJ206lLbG8t
         NYEw==
X-Forwarded-Encrypted: i=1; AJvYcCViO5uA9wG7YDWCKdYhW517G+6D/RWCND+bab84n/jpACZml9VsQMjYehB2zakj+X/LnI+fFOiIKCT7zN8di1za@lists.infradead.org
X-Gm-Message-State: AOJu0YzeaXzfPbge+DYZB7fcaJ8SGFbpoFlUMilY7YWxit+n2C3wc6zv
	SjoJDOU1LL6q6I0PAna1P6Ja/pQzONdHzfklfhk32OnK8JwCUr5y88dvAf2Hw5Y=
X-Gm-Gg: ASbGncsAjrLr5TTK9Bb4y/yss2Iy8V8YhaOtphOyLGOvWIzYE/rEiQSpiXflsJSozq5
	Nhuk3prCAQCe13hASXbzM3RL8kVry+cups4YTiW+i+Fz1O3d7Bsmhd+OklD82eWvl11IC4RRdLz
	u7EG5AQC0b9fWLh8FWlVjzkxjuHWBU2kP5PeCJjfv7Cr1QwhWboJlvXnfUGWB7OA/NvJSueRtJl
	I4KJ2Jkf1/a8D0/1bpN1NMsUKESffjnRbaO/qlOYhIeFS8DDjLiyYchnrNjTHg9HFfmmA==
X-Google-Smtp-Source: AGHT+IHzOkWDq3KGGPDZsVQbPi+YFqSrAVZOEWrnqAZJZ2wtM0+/RjpL+t5H9Or+bcHPIqDSNw5ORQ==
X-Received: by 2002:a05:600c:1d20:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-4361c441982mr4065105e9.7.1733903404111;
        Tue, 10 Dec 2024 23:50:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361b6d6ea0sm22222385e9.16.2024.12.10.23.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 23:50:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Taewan Kim <trunixs.kim@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
In-Reply-To: <20241206025139.2148833-1-trunixs.kim@samsung.com>
References: <CGME20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da@epcas2p3.samsung.com>
 <20241206025139.2148833-1-trunixs.kim@samsung.com>
Subject: Re: [PATCH v4 0/1] support watchdog for exynosautov920
Message-Id: <173390340180.16989.11837691973342827218.b4-ty@linaro.org>
Date: Wed, 11 Dec 2024 08:50:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_235006_364829_A72EC735 
X-CRM114-Status: GOOD (  10.48  )
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


On Fri, 06 Dec 2024 11:51:37 +0900, Taewan Kim wrote:
> Add support for the ExynosAutoV920 SoC. Basically this is almost
> similar to ExynosAuto V9 or Exynos850 such as two watchdog instance for
> each cluster but some CPU configuration are quite different.
> Therefore device tree, compatibles and drvdata should be added.
> 
> In v3, the first and second patches were approved by watchdog maintainer and added as next-git.
> - Link: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=bt.cho
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynosautov920: add watchdog DT node
      https://git.kernel.org/krzk/linux/c/41979b81b22a35322817733b15407167164be58e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


