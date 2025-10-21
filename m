Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A50FCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=; b=QERBPV3o1d/zLAgtDmVi8AI4Fm
	p/ShN/ohwwjCfNSHn4Mod0WpkyfoCa0XyvbUlQ3CiWhUAKSZfaagpQLEdMM3L1Ss11+AyKUw3Z2Qz
	mTiRS1R6KJWyX8LYMB7QjmkDzIKzokMGgiAB9LH1d6VxcWuJtmwTRJv1Af7FFpNejmw6cnAVRr4y1
	0/rrZ6TgpNrj1mFryIGN3lcZ6lXT8273kUyOIZhCvwItAHMP9NVQayTs93weQ4BMXkyKWdu7qoivu
	g7c346XN6ppXXjg7WRJ2PdUkl3CQr/8TY1b4t3HSGp/ojLn0SytDQSyiQ831Cb5Fhb0YV59OLnzP1
	+HMbNY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0l-00000000Trx-3JDk;
	Tue, 21 Oct 2025 19:27:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0i-00000000TrQ-3DNQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:27:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42844985499so374163f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074827; x=1761679627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=;
        b=uUzMQLGvR79VdexKagZyMi7DFany1a2uhB0GXTHgnk/0TWy/kym/L31ujhmoFNTx5q
         WeG+Z1P55z0JR9eEtDvuxNUCHp4l8AY6oUB2fRpvTmsZWekfVu0GgiF0NEsKbUXzAjQ3
         1aq0/ISuoTCHF11kweob4fZd3m9dOZXohK0FbfFsRHf/1aUAnIlh5iLwAlNlHm8XhAqb
         khEwlE66mGiVhD0PaxEqAtZrNF6ZR9belWisxjBpx872cIufeZgG95dw3QdayJy4+Rfd
         SJomONYHEeP8xykfwsQOWqqsCcFEMXdRjo7/CvsKIsjd3nYeTDJEs5gyzuUUL1UBtW3k
         V9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074827; x=1761679627;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ibZxuBONFvP6tEfHo6ray/hwM+JhW2wvVnRgxqq2YE=;
        b=UyIlbpztuWUbrtMg+FSfeBSvgPbrffVhKYopHAKOXHxy2Ib+EHfW2aQHx2eRP/h8J0
         urjLp3OQfydiASQTp+rAw7+e05LcVkwjVFSSXH2rIaYJLlbzgPfASCApNU7XMA1vSWGI
         l1pFTlDgkReUeONO06Fh+bwvL0hN3j20j7Bd4QWsVATcmmUeyKE/BjN3icbE8FDlnZy5
         WEmVykWa2c7oPW9PchmcnuP+DYuS0JzQzbha4xyZnHTgcezqW1hL8a4/pXRuD9nrs4Qa
         N8jTG0CA5wWJreTRXmIZtlCU6PQCrQI04fcD3S0WkFC98HxR+k1v0o1Kw7DL56ZZsrm/
         dHYg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ey90LtaM4EWYp4kq1rTaZbpUXEZ/ZVnRnbjgKuDSmi7C44R5s8PG5P0xgsehiba2azyxH7z04DpJptHZJTc4@lists.infradead.org
X-Gm-Message-State: AOJu0YwK2Ucc7KbRquhqKZvOCbNEg/LCXH8V3DVc5iSznDXpvG0ljgVB
	faXTWIl7Rkaikg4xVadWK6AXr3O/srvaEwAUhPZj+WJcF6ZIxqcyaZAAozLKMaYiJ/0=
X-Gm-Gg: ASbGncv6iX7mVwnF3X04CJS4iVd4oWcx31TwTjaAjDtYF+qypP57aqKU3s0XG7bK3kE
	VnqBD7aM1d9UL8alwjk+fjkeNbePYdRMgT2GjIv9j9O+p1ssWyXeSTUlvYwwkjqxpIuvAdkOso2
	Fgu7r75mnWzq5nq5mHqKxbKX9dF7OJVM+qthUrA1jIRYRDLxOMfoyzXh7VU3szmv7mzRJ9BldeN
	40faUXtu7lgpIO4cLQ+45FbJJfLlJuiYz0HECiMAtNPLYqIgx5pF6gE9sspl/sU1u1pVDqoWKbs
	A6FCXqwiXkmmJp/aAXQzkGca8h6AFWZxsspFkYh5W4PrRCkjYsv7ZYb6NJ3M3WoYa6bWfcrmm+d
	ooUybGQ2im6Ye/khKI/jJzMzP8EW7LUwefgFKY88GQ5OeehqYBOTZlwH5IopPOLgwfATkr58Osx
	C7t4qjLEtMXIinSDBiY/n1VCT7atg=
X-Google-Smtp-Source: AGHT+IFxRo7mh1kCIiwBlgFSzvscGIsov6AOIfRYcDiKlEW/2CZnKxnmXX+fOq8J1wvQblUD1sFg2A==
X-Received: by 2002:a05:600c:3106:b0:46e:31a1:c07d with SMTP id 5b1f17b1804b1-474942605damr21467615e9.2.1761074826918;
        Tue, 21 Oct 2025 12:27:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-1-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 1/9] dt-bindings: soc: samsung: exynos-sysreg:
 add gs101 hsi0 and misc compatibles
Message-Id: <176107482513.33931.5052547244710731509.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_122709_009350_F0A99008 
X-CRM114-Status: UNSURE (   7.62  )
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


On Mon, 13 Oct 2025 21:51:30 +0100, Peter Griffin wrote:
> Add dedicated compatibles for gs101 hsi0 and misc sysreg controllers to the
> documentation.
> 
> 

Applied, thanks!

[1/9] dt-bindings: soc: samsung: exynos-sysreg: add gs101 hsi0 and misc compatibles
      https://git.kernel.org/krzk/linux/c/33fd5a7103959113ea3b60389a7582ec0cc2f15e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


