Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8C3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=; b=nvgfA6JbnGPXVMKFiURHoQpvFJ
	3Etr64fQrj28aVyrPZ0EBPesWyxUmFte6XxrPzCLhsvsEv1nqivJeJg6E7ZgdFPKDvE0O9OTuwM8m
	tPAfJB7/I05JgvGABNCRP7freSs3UAZyFC5NCUnx2XQxJIKX1rvSO79jCEzZpVxo019zyG02f4N9L
	WfDlN3DUB7/B89ql5vZ2XuSXTcB24iadjldcn7xnUSr04X0y5zswzXzknABEx4PZ44ReKgryBUqjk
	oh4ftKPx63KqBcuShf6vlxY1z1WW5tma3CLPtqU08Eua6mTS7hSM206BWZNDv92a+Kw+80tUE5raY
	awMagcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBZlt-00000005MT3-30d4;
	Sun, 04 May 2025 13:52:45 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBZjy-00000005MIh-0L3r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 13:50:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso3677785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746366644; x=1746971444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=;
        b=GwtZXB6ch/K/tI9KhSyLdKjXdlwxHmbaVo87IPPhX9gS5CfEHai1d/p33L/c8VpbZP
         2ibijwVf0EKydPnYFo5QJE3/FW9lxpI+P6V/6w9IBmZtzvVrwvSXPyqUoR/GVKccYji/
         7MbSAzQ8o7Iahddajvd1sNTThoXwJu0UIAYI2zWuFdVfRjhdOYQxL4MSpf23vxZOrZ8X
         NpSGqjKu7iRyJwSQbf4X2a8ts5MJnXPGyYxUuVXroz8LUZQwmpMlJjTdLqHgbg1xLxwA
         KoSfW3J2KTuYmnyUSqLNAqmJF7i5wxzKnvT2i79zJNlYWmpKhufCYNbcssPxAP6Axkr7
         14mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746366644; x=1746971444;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=;
        b=sGitEFSrhaUCBtD/Z78Al1MlPVArH2BRAuLdbY2EEeHPw+ghWHtxpuqC9GGvjNM7IZ
         63MHJkAXmpW8FcQR9lHnfGm7fnhqjbrUicxi/onFFrh+eFQj2ITRwyCk49sv54GYufF9
         2Ds0CigkWnE4490ci4FiJ/foQN/t6qPg58dRAmdEvqrZH2Hg7fxW+B7e0CQyWZzAtPri
         Dh28m08G0cHSqVFXRyX5X2aUkiQGiQ2NzsIDa3r1mmRu5MfuFMHgiQzETCY4tKR/Jvju
         6qbBb64HQKznSxyf8Chgmfl/1mH7gJyNherRFc69V754uWD2GUDRzQohcknI/nVXWFl7
         jU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXp1AvwWlVOOuqHfw7tTJZJzLjUu2SZwCa3ftOQQhQzoLZ8BwxdpWqLA1p/HBnLwYzNPv/KCggWW9SyyHNThO3f@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8hT+3zAidFJm/4P7kcwtjwCIJi8ILYG1NWjL8HKzTnUVchOKM
	cR2MNw0mqQol3E/T5wru/V/nT4pvknqPtHBVryTQc0cFhdW2tnP0onLXe1ct/9E=
X-Gm-Gg: ASbGncvCWKD52XU9XoNvkL7EbLANwo9ldLp6Ynw6hooIwvKo/9aCngzR1+eigcPnGu0
	phkTf4ZtreR6DsK1jCeqv6nvh73ezg4XBPu/xHwRpsN6ZfxtYVORi8PjAwMKyiitjbVitEQiuoL
	weuxfPDNXzANAdzK1+uuO+vR4FXPwTCScMRy9WYTzRT26z+lbc1xBRGJ7Jjl+kXL6S1eXMZl9YH
	DocOW0mqR+ZD6oQL/HkCJrwcc9nFlYFgDU9xHnqki/ZujVqSKtBcF/4GaIU9ZxnOUZh4ys/6Irb
	y9Ebd0oiFhN+t8GO6utsn+h6Vi5Zc6r4/XumM8VbgYWzn3t8PlR2PWjCoGk=
X-Google-Smtp-Source: AGHT+IEYCOZ+iY0a8P6rTepTPbdUWPxKR+5HMLJYKNnujHoa+RcUI4iTDfxw5wNiB9aCsPGWAf+6xg==
X-Received: by 2002:a5d:64ef:0:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a099af1f69mr2481210f8f.12.1746366643823;
        Sun, 04 May 2025 06:50:43 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7bbesm7343717f8f.49.2025.05.04.06.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 06:50:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
Subject: Re: [PATCH v11 0/3] Add STM32MP25 SPI NOR support
Message-Id: <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
Date: Sun, 04 May 2025 15:50:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_065046_166582_E8DC4BBD 
X-CRM114-Status: UNSURE (   9.65  )
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


On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
> 
> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
> the memory area split, the chip select override and the time constraint
> between its 2 Octo SPI children.
> 
> Due to these depedencies, this series adds support for:
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      https://git.kernel.org/krzk/linux-mem-ctrl/c/43eb1b288072641b7de8f5d5c15bde69e6e8589a
[2/3] memory: Add STM32 Octo Memory Manager driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/daee9b249992a88cb64fb6a67eeb333d359c6242
[3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ab455b75de7351a0277be3261af180e326b74605

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


