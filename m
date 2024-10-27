Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7780AD13582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z43MNvtr+jq6zZy/Ceg3w8kHzHBw2gUNp+Mcx1ypN08=; b=P6AJ14VhpFvqg1UcifyV9FxF+h
	iXeKi7Yvf6vfLTEjdthptWO7jS+imeN8U4ohioBjMJj57MYQ5fPNzKPtXGwCZ3gHRtgVV+o2toLgb
	EXDtDHx1/pV2p7jnoktTyOYiIC+m5RUSpJKs9Xd2ghJ8tS0Fkm8JgNTCDnH/6pLeY+2CtiXi0YoZ3
	KKDy3lUXnbOFQ27VMexSzXi1BROuwuLm3/TRbdu5hZMmbG6QQrRHYA8pcdKBZ2ccmQ+1M2l7PyU/l
	vQFxuEtgnJyBLLShdD0BqZMTzIlQqqfpNwXEC+ohJ7EIgwq49SGSOSIfMyzlviJy3uXScR/oSwB7J
	LJMTf1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Sl-00000008n1R-2Trv;
	Sun, 27 Oct 2024 20:02:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Qd-00000008mQh-3OyH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:00:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43160c5bad8so3860255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 12:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059198; x=1730663998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z43MNvtr+jq6zZy/Ceg3w8kHzHBw2gUNp+Mcx1ypN08=;
        b=v3klYBQuofFbbShmW6OW+714ZPLbXL/AZQMicZ2xVs/U4JX+J0lSwtti0V3f9u+kL7
         GgEMOQiX6Nnw3GDBeFuGnn4rYcXxp/TdPCa8OM6ZhUElnVSyNmCQSJFJhmfqKit9mq8B
         W01d5ZHcxqjgocDvZp8Xbimzks5k8QBL1+O5hqlGJbvynjCE7nuB0tnJt2Os9idQPH+N
         q/q2n/MXcdaJwZYSAgs8Fb58t6rnvo6d42o5VZK9qfr99TaWXp+iEXCGo162dqwWQghA
         IBR8UDTNSuFJ0+ljRhNLT6JYhs2quhxZ0qXmrAriKm0dig64aHyuYnmXmV6/ksv7j2t9
         ou3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059198; x=1730663998;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z43MNvtr+jq6zZy/Ceg3w8kHzHBw2gUNp+Mcx1ypN08=;
        b=DXvom+egyoSxAAuLRPxhRPRfmb6fpIXnOI5DAv/FPkCnd4uHAJYaCD4108jm+hS6Gl
         Dv91LTw+7PIRn1eXkwpkW2q7WeHJeaIklz1YmCfrv/ppKVoon+8nqndxpARPzXP0bQ4/
         QFjPW8K7vcCxbYV/Vj7qtf5BZy2Ts/YJWvXRwQgqiEInPbmat6GxMp/WZd1vR0osGijJ
         N/EjhI/+B9BVkhY/KWDyM1msatT90sminHnV7xJ8WBEMfNa/v6+UxnAaeBdKPyXkZscl
         UGV9JTZqPv0luqtXwAU7LzTOugVaw/gXfw2cJD25s3FSh8NckGMVsUNuJ+Ph65afPiC3
         Eodw==
X-Forwarded-Encrypted: i=1; AJvYcCXiS3pHVNDlVsN1yIZ6+eCyPTLM0HlOQT+28PGzJCBAKVJ5+MIQ3Wf1PhP9J0UsF9J9y6+FL9yk65/2gdSmD2LD@lists.infradead.org
X-Gm-Message-State: AOJu0YzQG1apwbvfJRSO8Bivt/zEPPdt8sBX4Nk8JfNOeWiX5u9wl8w5
	ltOyKjPDhLBJWEgzyBQ719u3r2D2hgdkm8Jn/iRpREConCncKPBs9c+WypvyGyQn8y9OGvknlup
	xoO4=
X-Google-Smtp-Source: AGHT+IENeIZ6Q2creRcBv5NlAj4Kk+mWXSMXHI7UEuySjpU9jJIS4txaEKNvMA/dJM33aIeSmrHz6w==
X-Received: by 2002:a05:600c:468d:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-4319ad75782mr20378395e9.8.1730059196577;
        Sun, 27 Oct 2024 12:59:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:59:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-1-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-1-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 01/10] dt-bindings: arm: cpus: Add Samsung
 Mongoose M3
Message-Id: <173005919374.11546.17517915253250206692.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:59:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_125959_891626_F01B7108 
X-CRM114-Status: UNSURE (   8.32  )
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


On Sat, 26 Oct 2024 23:32:32 +0300, Markuss Broks wrote:
> Add the compatible for Samsung Mongoose M3 CPU core to the schema.
> Mongoose M3 (codenamed Meerkat) is the big core in Exynos9810 SoC,
> designed by Samsung. It implements ARMv8.2-A ISA.
> 
> 

Applied, thanks!

[01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M3
        https://git.kernel.org/krzk/linux/c/608c8f408dac3d1fd96191494f1a32ba2b1e133d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


