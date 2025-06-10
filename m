Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78EFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=; b=3+WS5tHjMqz+aoeKu5Fp0uqsU3
	fdGviL1xUTbH141Qdv/d7DQr1SIofM2OKy41TuV2/DsHEJbO+/hhULrPZ3j/+GlBAhPSq1LPTQZQN
	U3di3BaqJ/V2l3lVH42qI9gsZiLU7C+2f4SaJeBZIBxl4KIHrqZNbBQAfF0e4A/3yOaHtuqhWpwAm
	MJidYrLdepF4jCEomQXpl51ZZ0xlZRmo1015wolo42mA7JWSZ0guEyxA9QnVKE9M1AD8S0dC09ce6
	+e7RROYMISlXyAdE+9e62XpYCSw5OQmQEWhkZWcyWr0l0BEVReEuiLtBcrbTZxT7jjsPzjFN0jatv
	7xttE8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubN-00000006DLu-2XyF;
	Tue, 10 Jun 2025 08:45:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuGx-00000006A2h-0Yqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a524caf77eso685439f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543833; x=1750148633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=;
        b=nnddaQHeAEmyXAercWAAUqWl5dw+p/JmTFxLOE33Wvo/xrJKLXEDoBpz+iEy1wNTSm
         JmyA3Qa9CuTAXCGFF5a3NPLKD37dxeTmWrcfqKO2SG/cmCASxFpFzkNgSfbqUalT4+Tu
         cYMeqytzn06vs7uKAF2ufc8Edw5FnOACmbnQR2OYYMfI3N+H+FiphxhQ3vTucaV+KDcC
         6WZCNyLm35FaBa0BimgGAApp1PZyaG+VZJzSlEbAcSO1tNxREyyuiysSwoomCCSkaf+7
         5/TtMvJIepKrVDpIMzL+DaULuQGiZvLMhHpyuSGcHlWl0Z/gRcSgpuNuO4p4O7Q8XWYG
         tFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543833; x=1750148633;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBxAXQ4og37PvO96w1vWDExmrp8j/q8vrTsgZLWvYOs=;
        b=KqQO9cwz/9xPxip0YcTlOOUaWnGDuNeRmOjNxRnEFawxAxsBdtm8QDGt5Y1bmSCPxU
         yDcDkzaTvt35LmWtIYZcFFJy4+BvhMuyUFyewoLt2xm0jfu065O8b5kH4t28fHVufd2/
         hr5vGcDxqsyzea9aLL6X0biwf2kQXbjMXtJjoWda6TGH2TOTWzg4v5lPmbuEyY4o+0Sj
         o/NDOY6YxnERCGLZKAJSWr0h0QpyYldRC8kCB0dmOBVdu+OxCOWCoxjpg4Ue/1GuHOmr
         X6naLRJD/LSb8YHyX7J0sa7fgK0O2LKl3O0TwigddANQpnBT19KfKZ/hOUzch+BehuU9
         8NAg==
X-Forwarded-Encrypted: i=1; AJvYcCUaXvfnnvvsDZQ9+dO0nUHi09nQDLaLTc8YD54YdKbDviubaFHc14nEHsd6wJwulJcCDu1y+BNzu6NnORkc0Yts@lists.infradead.org
X-Gm-Message-State: AOJu0YyWDY47I63W5C72/ON071KgLCwbo+C8EjRJZrWSyo0oITJOM7w1
	kpBIfBUxVCAWVC7hYdQ7lx9X5/oKlUaRUECs+6KXhDRg7bNK37oU2Q+0E05wXcIZolc=
X-Gm-Gg: ASbGncsLgpFS/SZh+Bi/6vx7MQ2SFUWOlalsFPP3k/qkj4d/Ndeca5PQZVJmuv6SaS1
	AdNBvIQw1SCC6wZunIHPrdgIPX2OXzjgCuJ2kizMyCodSKZBVyBbX9o4KKGrtRbjzwrhRsaQhKV
	7l+1YxQUnkiqPzQtA/x6R2K6LkX+iQT3s88CDvuKvK1CtD8O4jrPw3CkluvjfiqhcOWSej8BEUC
	VC/buS3TJt38TKpHozAMSY96+94BpEoYKO07IvgO/1vNI6XHJJW5F2UGXzNVJnl9cgGw1WLgLHM
	C7X6QmkFnwXdc3WQqv6m/kYc1oBWN7Nbj5xvhuu5Z0JKEZObcoy9VZhx9iOYEVKxlHsNvSojDDd
	H403nBw==
X-Google-Smtp-Source: AGHT+IFLwwa37CYbsr1MbKfJxcmnYwF2LSIesmoDBnoKTLnOhdfLiZoIbrImjdVOaLG8nyFXNzvzeA==
X-Received: by 2002:a05:6000:4020:b0:3a4:e0ad:9aa5 with SMTP id ffacd0b85a97d-3a5331930e0mr4884181f8f.11.1749543833624;
        Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
References: <20250606-acpm-timeout-v2-1-306b1aa07a6c@linaro.org>
Subject: Re: [PATCH v2] firmware: exynos-acpm: fix timeouts on xfers
 handling
Message-Id: <174954383237.117835.15219836024392160650.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012355_181703_55BE520A 
X-CRM114-Status: GOOD (  10.24  )
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


On Fri, 06 Jun 2025 10:45:37 +0000, Tudor Ambarus wrote:
> The mailbox framework has a single inflight request at a time. If
> a request is sent while another is still active, it will be queued
> to the mailbox core ring buffer.
> 
> ACPM protocol did not serialize the calls to the mailbox subsystem so we
> could start the timeout ticks in parallel for multiple requests, while
> just one was being inflight.
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: fix timeouts on xfers handling
      https://git.kernel.org/krzk/linux/c/8d2c2fa2209e83d0eb10f7330d8a0bbdc1df32ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


