Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969C8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=; b=LZVhm8tD6qh15V8a8uOWXYYmk/
	U3vE9bHjUY1YnN2FYRrgnJFoKNinD9vtdOoU5z+QBwdENLeDH/Dw4grWeIkB9OZh11QFUPWQL1veB
	sP2eOeaq50WwlAe+WW2HAPhNjZLMvhmiiDb9ijr2WQ9Mk8EZM7uLgFBJVbhZM6+cwjGIjU6eGqIZG
	DXrF10SQHXoyb6Q3WWjUlZKf+KtDBcMJg83qS9INeZ+turVkVR9LsSidkAuDQt+UW4iGXhNSsSwvl
	SgNtaau1B4FOlMatR6OxT/rVLNK9Xy+JtH/QoG5+m0SReum/LhArZI4xLbH/gH38Ne5ERW01vN8Ql
	nvYaxi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp27x-000000008wu-3VqJ;
	Mon, 03 Mar 2025 09:30:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1nC-000000004WD-0nla
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:08:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43982cede30so4619975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740992932; x=1741597732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=;
        b=hOwSRJn+pZ9mmCpZw+PcZ1h79gJRMRVUVxLEZCxnf70S3WeyZWBnsRXfiRneK48Goy
         6Uy7HJp3h4UPwju6w/MBZfaPIGfpPgOdIndzbG18/cdF63y7rugJx22vP+HQWlHoR/ck
         jalY+ZcnFOsyaieCeB8KeM8KMN0BbaluoAiIca0zriC3np5KhfWqoikGs3q1m0qgvKwF
         DLhuNfJxLAlTjfFM2KDto5htVRNkvoxTncDgzON4FYsH+dI3B9iM5oN9p3AoX6EWoY9l
         KBusgrZc0urmbr+4CmlmZafgDVotUhGp/e9wol8w5RW63iG9Jq4BNrszET4vXDHyYb/c
         OYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740992932; x=1741597732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NArLzMGeHWTWmPFGPl0UFGh/ozAvnT/Ug9Z5Z8/7zE=;
        b=DxXiroZsTzmBc0VkU7+1qdDuE8RDSUInxMe3WAUkNXdGyWPk+V8/MYn7r4ISCRDQbs
         HfKSFyjbsuTKIPyH+mdsmvbcEuNE6LPu6f+MLELHsTRewniw57p2RHbCCk5OWQmIVeb+
         c43FnlUW2gb834o3Fe3qfi3QHKTzsbYgLMT4UAuZ+87fCAapmQr3DKm3eAftdnPxnYYa
         VQHYKoM7cjKVXXsR2fZErsBjOwnQ2iIXWkJcCOWNTiI54AQtP4ZeM1pWdITMFDWvuLK0
         sbMtshEkIkI4I911++kjRg0EPa9Dv6uClDVnOYdomBX1A2Tmz20JTCayoATPWZV8aYty
         EuqA==
X-Forwarded-Encrypted: i=1; AJvYcCVXJ/AMN5QGhnexj6wqMmfRJ6o2hdpraeLFBLFqF4TMvXf1wYW0ty4XOJhmZbtdmj1dqeQZ5q2pLGtO/R7aA1w9@lists.infradead.org
X-Gm-Message-State: AOJu0YzBR2yYOzB24DulAD0QyBlT1+D7bgtL5DUyaS51I6bMU7OCwvLx
	Y18tJ5ee63VJ8mco2l8OGu3vcx03TKTNCwwozFHeWlT1w16wjVAtlCdC59cqivg=
X-Gm-Gg: ASbGnctW+i6GNDFmilQJIw0jQf5UXnrjhEHge677UxX1WDiii6S9qcvhsK5ueZcAy+L
	F+jDugHgO4RxSyvlAq1SrJojUvqC6R1l9y6IiCJkq32f0zevQBhs8+DpD8X2r8sdWEGHV3Wjusw
	WHlgJKMuE722jX1wXA3S/D7orE0YEy7BF41T6t+mPS+7myvgYtcAOrbdd7CbQWu18VotzAR7mzF
	o0gf/KQQi81a/Ftkb8xmKBkb6WGSyDBX+WPY5v9buDg/cRg/ForZ6z2oRtavDGjMWpCFUFDXuQl
	YpJhi5bEymGyZctZXuADEVWa7y6IP2ijSiXr4wPRctedXG7kTzBqTfqNCYs=
X-Google-Smtp-Source: AGHT+IEFwQNruNu5mTaT+/YMJCqOub6ua/xucOR8SE1iPMFTevfv7HuPeLZAAmqrMseXFFEcLiiaaQ==
X-Received: by 2002:a05:6000:1f82:b0:38a:8784:9137 with SMTP id ffacd0b85a97d-390eca88f78mr4072087f8f.9.1740992932006;
        Mon, 03 Mar 2025 01:08:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm14058418f8f.12.2025.03.03.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Introduce pin controller support for Exynos7870
Date: Mon,  3 Mar 2025 10:08:47 +0100
Message-ID: <174099291728.28792.4499836839323841404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
References: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_010854_232784_8108272C 
X-CRM114-Status: GOOD (  10.22  )
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


On Sat, 01 Mar 2025 01:05:16 +0530, Kaustabh Chakraborty wrote:
> Add support for exynos7870 in the pinctrl driver. Also, document the
> ALIVE pin controller's wakeup interrupt compatible.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/129bdbd05650f4c11fb8995f8b6e63589ce4cb33
[2/3] dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/c1ab2297bc746b07b96205dddc45979feac22f4d
[3/3] pinctrl: samsung: add support for exynos7870 pinctrl
      https://git.kernel.org/pinctrl/samsung/c/eb76dc973cef741f74ce17d3bba8a7c9f2cc6113

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

