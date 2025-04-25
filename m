Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03EDC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=; b=e1hazWXXSGe+ejhiCD5ZeHbkJj
	vbv6vA68y5mbOixcGKI1bi0ysOm8EWkm63kFlkOMR5FHmXuWTCgdGSKjk0KiKrq8k3smAMeR0rl8M
	xWa1oQ4d6CWDollF7UbKR5iuJpHdAmbHHz4vq1rwKrWELt7CGrRC9z2ejsjw2FAZNJSJcOTY05SI0
	iEe6p9gQY9GGc4swo57ycWILPm7QiTbqfOi8KmNUJkyLjw0ULO6YTmnqWEhuQiFkY1cQvJGmmSjcS
	5vTggABhOGM3Q1TREh/GXQ4s92KhvcpVJMOZorr0VJDqomD/ZGi9N/xLppaasLxyYAWsPn70dJWix
	ATvWgYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gi7-0000000Gpp0-1En2;
	Fri, 25 Apr 2025 10:55:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FaL-0000000GalZ-08H6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:43:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so2198355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745574183; x=1746178983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=;
        b=up2YL0I+hUcTJVJeXWWf0mrujbVQm+dDOoQ7i7RpjLTej6+wpg61glEoT+mCSSS10u
         wXJs4NfF1YrXkRCa/XPklJNkqLm3X+WNNrxU1eDU76FTZNMy3AOKdMwsiVKNFBD8gjAF
         W6X8gYYBJXb3SP/ueyCX5l3K1sZPMRYoSuKXYtP4SaUlNh211SPnobAuJCQCJa1EiqgW
         cfVNbymnNSD3CbDmIPDq/0HEeT040XDLxSIDyrRmiwSvShQYMKUBRUa2hrF2oP+9arQB
         xMEt03k4EOLf9d4hPt2COJUsV9GeJR/iM/OALkZnHr4fkSVyAwo0zt+askU2Zt458KXq
         mTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574183; x=1746178983;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDp105elx3apeSKKADmSSqdqJbinr0IUn9mnqQkF98s=;
        b=kGnHYOQb+OSnc2+JLh2g8TPVHKtvTtAXXwEjnC61yN2YAzXO+KaV9pIu1Or5EQSULF
         dqlh1r7LjCDHCUZyS7Vrq1tlURyiZiGtb3MC7fQPk9HuV8oRX/YP+GB3/zbaCOe8LXoI
         e34IwQVD12SCSB7QgNUnHHIUv7BU7txVSen0QVBOV/z1VxkLFc+tUzi6jlAIBmX5qQLV
         zU0HH7DM0HXgttHjiYlRZ7jPLucw0u9cox6K9v5k0Jx+9/kZiCY1soUeUDqtOFYL1TyZ
         skAmEazYVid6vXsRtrbdcQ50/ltbI6Tsad0znnNWPsxDoPmrr9cNp259+19f2QNhRmPU
         V2jA==
X-Forwarded-Encrypted: i=1; AJvYcCVTeXHJJk93qWDdLj++L11mtfj9Ogi+T3cw4pGvjmV/xuIkf4zI5s45S7TyMJy8ektxOTB7rikQJMXNHg7Ay+U/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7EuD9WkoK8YyHu1F0peP6kmoFXInqKnzhyaBaOrlQfzUX5gAf
	AMJwLdigwOp5pW1MwS5YGG6eMxzIDEh6NQ9qRRDIWCKoj+6Z3TjZ9tSSy3fwIqo=
X-Gm-Gg: ASbGncswjWH/X+Bwe73TjO6QIFxDQTOJFFSSAKF162AQpCzDzMOSPwv0XHV61iC8zIU
	jSr9jKXo01wFjLJ45dvA+U3JXKXMENBXg+5gmp0DP4U3g8FiphStL1oZ2se5fM4UnxfGWuypunS
	Elx7WwVCt2D+jtG7/xKaRkQ3jFpW8653h4RNPmq0uPdq9nmskIRxksVAQHA6PSuBdajKJ6FBetF
	hrLeSJQ7brqhJ6513CglZXNR7o7F7ymwrcMsnmIkvko/XxJGhIDbXbARZ2lY1WnH+JX5pFPZCZp
	ZDlj9mAEuCvhxKh7EySp3I5syIDAcQ9kqzZArOvDIJD32B2hmzy7PJqXoSI=
X-Google-Smtp-Source: AGHT+IESpUAhFZOOS82e4GvGIHokl7WEd11AkZbPGij323CqMMkH0yOxQl4M55ja81NtzkvTeEUUHg==
X-Received: by 2002:a05:600c:1d01:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-440a66c250dmr4935225e9.9.1745574183356;
        Fri, 25 Apr 2025 02:43:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm19441395e9.2.2025.04.25.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:43:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
References: <20250424203308.402168-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: Correct kerneldoc and use
 typical np argument name
Message-Id: <174557418225.69534.7174672611109460880.b4-ty@linaro.org>
Date: Fri, 25 Apr 2025 11:43:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_024305_080487_A3A2CED5 
X-CRM114-Status: UNSURE (   6.47  )
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


On Thu, 24 Apr 2025 22:33:09 +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc warnings after commit a8dc26a0ec43 ("firmware:
> exynos-acpm: introduce devm_acpm_get_by_node()") changed the function
> prototype:
> 
>   exynos-acpm.c:672: warning: Function parameter or struct member 'acpm_np' not described in 'acpm_get_by_node'
>   exynos-acpm.c:672: warning: expecting prototype for acpm_get_by_phandle(). Prototype was for acpm_get_by_node() instead
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: Correct kerneldoc and use typical np argument name
      https://git.kernel.org/krzk/linux/c/2c2e5e908ea2b53aa0d21fbfe4d1dab527a7703e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


