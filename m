Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0627ACCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q3CP5zn7Y6cNQVbKaOF7ZpsB9KeE22S/HHDAZmbRxI=; b=dnjvlvulOTCQ/fMRcKuGImQSWY
	q4O/OeiDnEUVTo+iH7w0GCmokWtk2Ho/vlJJNrrFvg0FCCs18hLovb2O4HF8hvRuibFyS/hIk7Rvw
	fqJ6TzshkaLZWkOzk4ktuw7Ctva0SB33PwwvGH+npmxKHjZ78qHPdAXXeOCrKGECGLS8u/1VRaPfX
	6DoAw0MCKjh4WUHyCDGOIuZrVpmIdNSLidRarMIG1gqzPhh1xTTaFKk3XFP6Degz8J+6jnnp/ihsp
	0jUR3qwDaJUtfp87OCBCeJcC1LdvMk4Obwu8oRC4RB1jTazNItmfOP1kDJvGaNhslyEaF31lERSXN
	s/l4rlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86y9-0000000C1dx-38hF;
	Mon, 13 Oct 2025 01:03:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86y7-0000000C1d3-0ZwF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:03:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7810214dda9so350976b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317398; x=1760922198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q3CP5zn7Y6cNQVbKaOF7ZpsB9KeE22S/HHDAZmbRxI=;
        b=YHO4buzz4OsonzYoitQPy6mum87CGh8NEwYQnSb+v3wcGceRHoepoMhy14k8VLhWjU
         0XQqju3bMPcBFX8Ot3PLub7imcHEpeuuqkSojKO4f8pbwgfPxKjDDHgVfMd+hcpKYpul
         R2HCdzYXbXdiAW4qWleIS4owGdBk68bjxsDn/MKDxHxKvl9JsOqiPWyPH4vOqX3CW72Y
         GsX3wMQARk4xlXnNCTOYod6KvisIIM36dxTkrdqYyWn0KSgbrQ/Rb8TZgixNiMbwZfD1
         P/rAIWO8eJ6x6i8dD3PpBuQtPSWnBapwK8XDIV4UczX4z0nGx2GaaHROwZrfWPHDpMC3
         i+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317398; x=1760922198;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q3CP5zn7Y6cNQVbKaOF7ZpsB9KeE22S/HHDAZmbRxI=;
        b=QyVmLR5854ysayf0KG9cF3tFO/Vzrh/l0uH6H66C+B9ij0h6MNF7ADahosxhPjwh2N
         wzMLWR+FFD6lRS08xrFoDf/WGgkfHLIf0gKykOd/AKc7kMggLT8dKf1dzryH8SQjZb5s
         FImpIXh2258onmyi/2G5HdxTGFf+GrIAXuByqIfilh66GI9x7MeK92EJxVFolY4eisqD
         psr3uoijj9iAYD7cZnwC7JDR7kVPZjrmQe7uSeXazUXYXZ0ipckYRRGF91AfodCDmnvn
         ttpdB+MeU9EPUcxMPZsxN05NZ6y3+L9/h+k7IuMvQDw5j8GGzj7BgAAau/Zs9/fPtwCg
         u2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUvVKfUED9lvjJlFQzcmCebKWEnZk/IZ6LL1bcPUfI1rsmxnCjUr6nznbMFdrbAFgZBJvFFnArblP77nL6g9MFM@lists.infradead.org
X-Gm-Message-State: AOJu0YzhTPdYeY8WQoPi2ljQ9HtupkNAYL7v9xpGurTBLTSt7pFO+wRj
	qrcKsIc4AQWdk8XAIAcfO/Q+WydDm24Iioj7e9P+PMDREHOeAiKjlo/Pw2OnQbL1ARA=
X-Gm-Gg: ASbGnctWEmP2RlAzsma+frRXfPBIUfh1eMkiCeWdI5dY69me6EKDYNijNTFs9ZuS0+S
	fKwD0cKa9+08dNNWCqEGMM+AN/BHZhWVcbHLOWnFu16B69eHf5/aswT4hPC0EUOytF9bpfToHJ/
	YoTXB7jJxtvVKZ0BERzkDophrhg/PW3E3qMllL+mEk88HauUVSRJ3M+ZtVHNW2rSFMjHR1W/vD+
	BUcRDFghjc4AASzNpzW49BnI1ZXz+UNjwdk1MQ0DAeAXq8eWqukf+6pNoasOvKgsLf0k8ewzKfQ
	9PVZWfIxZJW2715fGtmO9wpU7oGdgX5IHoxhWlHnSxBNc7Iq55qN2lMaH60X00amc5l9zoex0eF
	Nagd8d1nJdDpLgKAnTqQocLvAMFTy7hojSektRDBcvp3yE5AJmZJXQM4ylsLQx5s9VVEeMJI=
X-Google-Smtp-Source: AGHT+IE6WFNgYRTp3UFY/txkg6RFy8uxO6N+s/y3b8z3DaRZJqgiRHHOA6mC60ci9MWpIr704MGPKQ==
X-Received: by 2002:a05:6a00:a589:b0:781:21db:4e06 with SMTP id d2e1a72fcca58-79382794da2mr11784375b3a.0.1760317398255;
        Sun, 12 Oct 2025 18:03:18 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096527sm9543527b3a.44.2025.10.12.18.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:03:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
 Ravi Patel <ravi.patel@samsung.com>
Cc: tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com, 
 kenkim@coasia.com
In-Reply-To: <20250917070004.87872-1-ravi.patel@samsung.com>
References: <CGME20250917070036epcas5p15db06286fc187651574b68ea4ebe5edb@epcas5p1.samsung.com>
 <20250917070004.87872-1-ravi.patel@samsung.com>
Subject: Re: [PATCH 0/2] Add pinctrl support for the Axis ARTPEC-9 SoC
Message-Id: <176031739107.32851.16814214532966258235.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:03:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_180319_179529_D99B0485 
X-CRM114-Status: UNSURE (   8.57  )
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


On Wed, 17 Sep 2025 12:30:02 +0530, Ravi Patel wrote:
> Add pinctrl bindings and driver data for the Axis ARTPEC-9 SoC.
> 
> Axis ARTPEC-9 SoC contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-9 SoC
      https://git.kernel.org/pinctrl/samsung/c/e671a1bb5d1cf9ca4dbab61b9a3e1e77579f99ba
[2/2] pinctrl: samsung: Add ARTPEC-9 SoC specific configuration
      https://git.kernel.org/pinctrl/samsung/c/3cfc60e09bdc95483875f0b63cfdc23aea67135b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


