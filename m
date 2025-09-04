Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C0DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=; b=oJiGqZq/svKXIbvCYU3MzjLjXq
	V3rnyOY9Xv5Q4kEhb0SqMtAkhnz4aQ5XMu10AtwjKQE6pyk16mLZ80/N/6LAFevnxCjrkRYbiy1fW
	ZEHK2WU6C7nq15E5Ksr0n+z6livQaT6F8qsJ1bP0cWLvMBX2bB22091gEJxKnY3IPR0qbQKQRjvYs
	dqVqb7LYOYdOJnUWTMvEO1FbLHwnVHNEDR/hD0SRqeJybq5pPlDZgAAVnhq2A57igiMa/zhF447si
	UTkYRFbo8e5Nhm+j/LGkzNpR+x6eTSuMCi5EAgY/QGcEVsGA9U4pDZZqInOOV4gYJQPnHZ3BB5Oza
	jizYIvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkW-0000000DaiO-2oSN;
	Thu, 04 Sep 2025 18:31:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAJv-0000000BzXJ-0du5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:48:12 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61cafa0a38aso185222a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993689; x=1757598489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=;
        b=X6Ce2ks1B8Xi0AZ2XMWleYznZjK9xBXomBl9bwGiheEf9/W74zrkluiSUYAU4U38tD
         fdWC82OKQ2s77AFrrbneWyHd+hMtC+y8H5NK+cG0huKpRe0yHExZOpv5A77Q1bVIFm79
         Ev3QAbNYUPVkTP0PHynFint+p0HZfmYhh/88FJ/Rs/TMwQFge40rcqombOkiop40w1Vt
         0Ll86h+cK5ehoE3P1kIL7bSbmbm3IHqHBIiV2yYFmW4tIPu8JQgu2Q8aC44gRhU+fj45
         KhTNlRcwC8aMx5i7EIRWuhABxmEXN9rIlmoFiCX7FIWZV0oHpjCalpyB3PmRY9YHteiK
         TrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993689; x=1757598489;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=;
        b=Jx3OP64cFNiY2cc4SI9S28kfdGZHjSZohKmhUlKbYMM0FSvZm39HKn+5fsrQUq+Mki
         /FQEsdFG5YGWyr/oEhEmNfaCGQ0EIrtabDfg2sORJnmv1cyMzOenEC5ef0NMOBTpgFWK
         ara7HzSQoKYZemKg7Cd+wRr3i8iBCLgz5Q+ZX2oRpBLV8hND86Dyib8AcIeA7aVrIGTu
         +CgHEq+MR/7X1v4xHWSM/+9CGNXySuThO5SSk3XU7fRtjdBzMRpUuNTfzOmFI7lNQ9EV
         1uvQMvlJ+pVEgavujBVQRjaZ3Evd875FCfwdbid9ymDXc0Wzl3j0D7fmqksAX8xRtwvc
         9/MA==
X-Forwarded-Encrypted: i=1; AJvYcCX33lnIlti7g4zXn++VT0qn2LqHuvNbDdv9beiwGQ7oKCI8W150Q5/+SZ96Gm82LGAN/FRT0HirZMlPIO9Oj64c@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+stFzrkZn8zifW8z5ETBHPgOiby+oES0hhlGAc8KrKdN9BR69
	xO3HyiMOgbzP1hfUSoDNdzvg2Qp3xvaxMKXYN7eoJfvtH3Nnh1aIEtX3bjloCFB+MKk=
X-Gm-Gg: ASbGncu6sY+ClH/6YJba1LSUgcgYRmNxETclz3Xm2MI0th7Yryy9kl2D2+phQM6s1oi
	V7qJSWqaKXfcQFIEO8O8AIvw+TVsOPK7nJzTuFqPbfgjihke/U9z5yeifbdAcge5N5O9QWKzOWr
	kD52Lxun8n+o0vY4VZaI0RL6Z262jDufzGYkOaJwA3PUFIYUGiknF8S2vBhvNhXGwNrZc8ouMw0
	ZRZzsP1dZhQ7GwsbUHmZTpZj7f6LXAf6NiB+hHj+wcaYNynZo5RWDfBEKyyQDRjBnosKZHpc9EO
	in7Ocg/WXdgAh7tOzjQaSqp/fPSn0Mf+MLiI+MlIJguNoP/Alm6wLAY+/CCWYYiMcTjnG7mBGHj
	Gbr9gAeCTJcPOQpiNhqJ5p3U0jgDVy40YqZliATw=
X-Google-Smtp-Source: AGHT+IFXmHyLiRikp8i7AT0rm9igyDk82338TdO+dG49oonCsmp2DJJwv/hKJNb9HHXBa/ePNM0EKw==
X-Received: by 2002:a05:6402:354c:b0:61c:d7e5:47a3 with SMTP id 4fb4d7f45d1cf-61d0d365421mr10482985a12.3.1756993689530;
        Thu, 04 Sep 2025 06:48:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61edb0fdf1dsm4243221a12.18.2025.09.04.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:48:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
Subject: Re: [PATCH v2 0/3] clk: samsung: exynos990: Fix USB clock support
Message-Id: <175699368813.172086.8536010951360222334.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:48:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_064811_195894_A61B7A99 
X-CRM114-Status: UNSURE (   9.44  )
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


On Sun, 31 Aug 2025 12:13:13 +0000, Denzeel Oliva wrote:
> Small fixes for Exynos990 HSI0 USB clocks:
> 
> Add missing LHS_ACEL clock ID and implementation, plus two missing
> USB clock registers. Without these, USB connections fail with errors
> like device descriptor read timeouts and address response issues.
> 
> These changes ensure proper USB operation by adding critical missing
> clock definitions.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      https://git.kernel.org/krzk/linux/c/eb9bc162775cabfc4cf2b37cb0d3c2c2bf4c4b54
[2/3] clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      https://git.kernel.org/krzk/linux/c/d0563d320b6014a8d56170253fe0aec524658b9f
[3/3] clk: samsung: exynos990: Add missing USB clock registers to HSI0
      https://git.kernel.org/krzk/linux/c/f00a5dc81744250e7a3f843adfe12d7883282c56

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


