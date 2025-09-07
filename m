Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531CBCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=; b=cnY0cfHjN8P5jQbawLrbgCDy/N
	o5sKvPRPyiOiZkac3Ez2LuQ3MAMSqlQMSiYqRxE0Hz8MK/txfoN1WW4vshzxug1j42wHS95I0GN3R
	sUxxKG4iueeoQKxYLJE2C63z91Dsk31Qe4A72P1KSdDd+aeIpbF1XOvL5XB1ssuBTyiVv1KhGhQfF
	WJdoKeU3IJvsM8VwokkvDUGU+YFLF7/PB8jUlaYe8eOQw76eG6kMOWPF0v5qHA/Ofb+S/KqgiDd2B
	y1PfTmBGGfsHNnNdK80uvY2torPXfUBYK0IYIeI6GbSsZ1GuhoFUHH0ljRgvHClC3Ps9rophOKrTP
	12hdyZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBXE-0000000ANEG-0n6j;
	Sun, 07 Sep 2025 09:18:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBTK-0000000AMHu-2W29
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 09:14:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45dd7583194so2594965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236445; x=1757841245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=ZEiKQQUF/iT7ynwOcdzigNuA6LlYd+P6SRAdU+vWSnikmtOw1W+uO5CpC3n/wr7zhO
         MRtLDd1BtPsQi98ZKauXA/toF/SlgmX2Fvh0OzYDGgHPW2U0ZCAOGy0jcEKB/FDbh20w
         MRYVrxuyKmXSVXESXbUxcnLHyiIFBPfbsN2M8x6vt4GeUHZLzbAaTr1lprmLpoBbW55d
         3RCNAyub3hSEnoA9v1qnrPBYAgI7oLjR/qZlrxDidBkHi1qYbuHk7LtJNKwr7jJxsE/2
         xDNbok1BzoPZPMglgOscfxuIlTO4kKY3hcet1KEZrTV8MxqiWGu8w9OwyVJfZYGzcpI7
         2h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236445; x=1757841245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=bh/a25zXX9eEMQhzJvBN1B6gXNrjVS/a9IfA0A2A8GjdbH/FlPfdnZOld4lsQ12tpH
         yOjdrOmMZuDghKzCM8cC6vjG8QMTCr6KisihTqJ6W8Kpij2lZP58uWhRmR4ewJV8AdX2
         K2/hA7ZqNRXsAZkrJAgVbAu8AUppr/hUkkyrCVhTO2LqG44KLS2xJui2eVPiS8nWpC7J
         qPLezqfB40tEcPR1Ziqb0cn7FOGhovfMpf2DnH7XamySU1EeRCFidJh5pCDMYkOjq/po
         lHF0W3dENyMCQfKjYY83kErgT7qvEGkyRmN/3BEhJVAD9LHGIDfDAYiQmPgyE8QXxwQ4
         y6SA==
X-Forwarded-Encrypted: i=1; AJvYcCX3JXquK3Be05eElhjKjBuwWOFSxFR5ddTQiEKgEKPkOcLy3pzfAb8zqX+lNQa9204s7P6I6ANY/NJAcNZX/7bV@lists.infradead.org
X-Gm-Message-State: AOJu0YyuP1mKDyENZmDoxwqISBi8HXtRwQJz2OQvpbGZbhGTlPlKhoS+
	55sH+8n7MCTALjZ8Oq/fm1xBcPPiCcE1kxxL2AGIv+PoFuYHo66vjjsgWGFo97RrL3M=
X-Gm-Gg: ASbGnctKxq1TexyFjJ90tF8SCZbxj/rqgCBdyTulMOtlpEovoXNjVh+2NqjXTB3u504
	NZcREh4yOUA2vgy9j4aVe17Vi14f/2jnghDN5aPpWu4wq6uKdfVdW649CdhbOH3KCpsGYW7kA4u
	JP6vAATJY+Rv5hd8LodTWptuPC3hN6YL0Rz2OzI2BKR/rMpT0/fgAe8GMGzBcjtqfvj+9Lj6MTL
	crjTdLH5pknhPD/UJ8RfVTNiIWvKZrZ5uxMHhuxR0tfkIGRc4TbpXFRMyvmZeddKxmSPBw+iQNP
	l/3ZudnEcmIrpBDSF9tYiKgl5WnD3w5hrrLe6SHhsWUuIc+EU8RYaT92YotLYQKlYYOLLVNI5yl
	Pdt1BGgYc9VsyCUKU8wpkSYk/UXl4YOFPoW+Msmo=
X-Google-Smtp-Source: AGHT+IEs+zHj+nZWtDLKO7AMy5vUsh2MOF4u8kwkXxf2nwQ+E1nf9C+MVn+vLhdElVbV4Wh2U+33Gw==
X-Received: by 2002:a05:6000:4107:b0:3e6:e931:b428 with SMTP id ffacd0b85a97d-3e6e931f97dmr1115038f8f.10.1757236444776;
        Sun, 07 Sep 2025 02:14:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: exynos990: Add
 PERIC0 and PERIC1 clock units
Message-Id: <175723644300.30719.16385900171586342437.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_021406_649988_6AD9A813 
X-CRM114-Status: UNSURE (   6.59  )
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


On Thu, 04 Sep 2025 14:07:11 +0000, Denzeel Oliva wrote:
> Add clock management unit bindings for PERIC0 and PERIC1 blocks
> which provide clocks for USI, I2C and UART peripherals.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      https://git.kernel.org/krzk/linux/c/43bd82eb33b2ac33232724a8ddb9e07cde492328

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


