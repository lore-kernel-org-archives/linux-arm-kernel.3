Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4248CCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=; b=sIvtd7QB2t7zcl08OzklZuWd+z
	cGdK6KYDmyHXJA5BkE21oQbBjfpePQRExMaHvJ075UJHguIZ6YAOJj/O3U/WYC9IF6nePYjGh8ftD
	Q8hd7DyCjdyLFKymQZ6dTtUw0bYEC42lxRSAxtO63ZaVvZQFfkb9cx/WuGaAUFqIbAI1rC6XSZYJo
	9ohhBvbTr11m6etV7Ds1vIR90E3QtOqZZeRlYUxvkT+WIQuI11Lokh1Mlq4CCatAnb0JlHFlDniOL
	yKg+ym0ttB/xSRk+REi/C3i9/lO6uyHO3CLkziwP/9AgpntPRgYx+cBAyMXpwfyTYaEGUU4jAzc4s
	JR8y/Trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXL9-00000005mld-0tw3;
	Thu, 14 May 2026 14:47:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXL7-00000005mkq-1GCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:47:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso86467065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778770022; x=1779374822; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
        b=zvBZyEv4N67XGScTMo2qnM6EDFgydjUWN9QsRtF3/gVRq+SS1a8S/VB8D2Icty8ehS
         g7W6tUm/zGOUeiC/KUv1g2UDVJGlq/3Dwwh7X3qd9gKQ8SNI9yY+gPrlcumeCP4V8ZsV
         a8nP1uIQXSmxqRELQwPT02UPIUXA2T14mXM+MdwWoq5CZ01PTDjqzUff3tOH249VmEZH
         ys2Pw3Q/soH2DpP/lhixuUMOiOY8di7aqHTOnTDiipRhK9RErepGjYmSaVg9g4ACln0V
         oXXF04BB73OfUCkVYjtCC6QQj1J/pR1vByqV1EB9RzKsKgTovYNtzpGfq7s52QC4TQmd
         Zu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778770022; x=1779374822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBgsJzzh1Igu9BQ6ze8gVJXAK3iTc1uKe+SPXuPW3Mw=;
        b=T/fgoQsaJ2AyEfnCQkySEDez6VvnlvhMAwjqRsj3HoQf0ANxQPvhFi6nR9WPQEGDCf
         ViHh35FRLt2QvzpbFnGamq/h2HE3JjySnh01yvOS+u2KvqVKIwiUfrxHdp9Ie/sX3WyS
         S1hvRjt6YXh4TgyViU9KGRcRNT9ubB/M2aTtuAbrCDgn83rjnlff3ATl4MHNo5vHSxfa
         hLOg/QoYcvmviM9J73BCYygPwp71mo2TDhcr1QD2pBo1uHbXFHPip85MFYNTQJXBHrtP
         ii2dEAQT4sFusrZbVhD3MYfPu1gT05vM+/T5MmuvOQLz4bDlUTNL01xbY5EgK6Hhf5zQ
         ILyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ktyo/DU/yQsq53eoJL8hFK0vy+HdTwVWmhpNTRYQ1phaB5FQYNXqjkfreRb+449pWE5D6h1VNlFyJxlDMnevb@lists.infradead.org
X-Gm-Message-State: AOJu0YxYuH7D/cYZgidzj89haI0HRlUZu5KTpYa+bWPeNacmSfjQRNII
	naI2qriSLH/6xahIXmS6+kX5OQ+gQkrKIIvbRGNqo7Av8zCuIcLjReJwz5W0sPfWhS4=
X-Gm-Gg: Acq92OG16h+CrjWyxYWE1+UW6GQcBuYC3qqj2nOpyjCsJy2xdwz0lgqsMefX8dnViej
	zndnwhJBFFOz42ASbWKTSb5VXtZT8ckFKbbVoJjMcRg6a+8Uu8Fc37LK9beDUbqLxq7ZsUzWnxz
	LsywYi7dXgRReF3dJEppZWV0Vsqiry8LlpIK3jEqKoA2rEXWOKz3S16AECAuuC1Rnxd9o/IM2jP
	C0JtcvxgmTnQEK42Y8H68x4LkoUpkJ2r5rqYuAYRePFoE+/oQm6G4i8u1fjK65vH3lh4ALKPP2W
	JgbbHmt0t/0L/BO7pAPXWAPckZT4HwihI3zRAFIySSycBxxRiTRJHKwCI6k66jLPtDexFLczR+O
	WPLQ61w3JN5EXJQBxShgyn6MJJtk7bvPOkdk0Qv8P7VPRGRHs9JGXdpbuofW9401zuB/ZQmsToS
	sjZ9ndOBUZ8uXOEuow6jy4cGkvyM0KPCzE
X-Received: by 2002:a05:600c:a02:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fce9d9271mr113000745e9.15.1778770021624;
        Thu, 14 May 2026 07:47:01 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe464e92dsm2595315e9.1.2026.05.14.07.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 07:47:01 -0700 (PDT)
Message-ID: <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
Date: Thu, 14 May 2026 17:46:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
 <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_074705_363116_D81EA221 
X-CRM114-Status: UNSURE (   5.89  )
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

Hi, Alexey,

Please check sashiko's review from:
https://sashiko.dev/#/patchset/20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433%40linaro.org

does the gs101 pmic constraints apply to e850?

Cheers,
ta

