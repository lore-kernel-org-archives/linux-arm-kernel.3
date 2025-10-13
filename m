Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E58CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 00:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=; b=sQ8oHE2o6w+QZh5oKs/D2vupJp
	bh2BGNbmWRqtj6/1McLxqdfoAT9uTcPJhsGxi+e2Epr38En06zi+SFD5oK4CLfmeMZY/1yJG4yinC
	cp++HNehINjZH0HRCL5BsatD3/plQCl8ceKpkLQfHaotIv3j/INft7R1P/sZVyrGnbA2WzoTgFsDh
	Cr47KWGJ+AKuMq/Tq2VNc0CKGRIXchGiw38AEjH88WytqM5j6hdXCaVkoH95LfSyPqs58PXo0E7Yn
	CoCGbaqSPhpGzUW1GhPzZxpTalhJCb+0zVeZ8kFMdmWQNMbcCguorMfusRdPcX7FsEqb7B3nw10pp
	ffa4+wjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86Kp-0000000Bz4c-1hSO;
	Mon, 13 Oct 2025 00:22:43 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86Km-0000000Bz4H-14Jq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 00:22:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-269ba651d06so5753015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 17:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760314959; x=1760919759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=;
        b=VyUG7pynvOJ/X7uu7Vq6OL6twhyp1uX8ihAEKSpqWpmCFOCG3wRTcPEJMt0oWnLS5d
         AWci4CfPWdAHgcf/CheoLrvChNT9SmWs+uoVc+WdIme8YX5J6L6S0QqHv0f0pl2CJQKH
         FrWSLWKSky2M5Wna5OGZrdUlaCXf2gddkCjHdOM79EV2Z/+ckuqEZ3rmNsUddk6UivMf
         3d4qYwegph43hzaePD9Q+g89iHs9T+0yOWTN3SBckkuGfdl8mo4d0Htl26zOcyOggsLb
         XcyxLH2K0TX4/fHgyaVqQ+441jW2qAvF0Nm7FLvoNlNZYnGtMdAObN73iQxeITXSpTp3
         z8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760314959; x=1760919759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVqRhIZigralax4KbuXiwcZcRbWu9Ae0Ahc/RkKiB+M=;
        b=nTZGiHk3bcEcahdug9WGxO9Qr+WI9ed9VAzSv/jVVfc2m+Uv7dpO/jH0rNHxNG28y6
         3mO4tqfGL5pxWq8cZcIhh/lKqqt9ew7flhC4PN3oUumrh5rqDDb9S7ki7QKFl/6D0BJj
         FRppvRNWGnWgdqP2GbX/AC9CSEzwVQ7+HuOY2YnhH4wWHKjlG08KV0OdZtQo1+IDj8wM
         4mYLKybzcTEEIpxBsVQd1SQAKKQWRXS2OH14MRnhT7PCKzrdX2rIbeAJzldYp7jGtt+M
         GQ+Aw5RhWK085Sf12PAwmePJcoa8XUvaZmZSiVyYGd0iR8VG+Q+tf3ybIVgafLM8xStx
         Qhbg==
X-Forwarded-Encrypted: i=1; AJvYcCV+atumiJVKJt+F02/HqMmUO1/UnZU1uNwkBepSDliPx/w3QYgbkYhJa6KuIxPGvz+WXgsS2gF++xaBHSUs80J1@lists.infradead.org
X-Gm-Message-State: AOJu0YxTwO4f5MORqu953ZuWuDbWBbW37dH+mZsNc3Z/CFaX6rUXG9NB
	FIM/FBUhaQS8gb8+n3iYWPJk8y1HHEHGBLebXAtKCXNRAOHNb2a3NgE558z3RHFXFpU=
X-Gm-Gg: ASbGncs1tvM1PuTnfUBW2PlhrQkVeFWh+0V07knWkI2r68Gglf5+m+xp/YIz1sC7pp5
	mOW4cZX+K2H5eeHUupZyXraB+SOmwuqpTHdDNRkoJRD2Ci74KG3TukKk2GKLmc5BZ2S8PiPd82o
	R1rvoe48zPB8brpOxikr4S7PCC3icMQOYYM2MW5uUn6Xzmd2YT35SnSfb5C805njbtJjVeVAvhA
	vHg9N3ZNfLU0JcRTGcCQRoZicfif5RWtneQnF0/0iBjWMISD2q5X3LOvRNO0qNB1iMGVl9Fj5yI
	nFQs3jVdM+CfrKJ/uMNbrcGNFDioTo3QCiVtzwRgt+Pg4cZjMMGtCIiEptuGQUops9q19e2+CZR
	ARGlGe78qOXaWlpjMfO1wtfVC5nMZaB6CFkvnZ041UnMtxhOKVdXarpa0+tcaB6qV4iNqP90=
X-Google-Smtp-Source: AGHT+IFK4ci2TGNbmqypL/3bygm/UTzER4LfBfP1yAru/4qRR98/cUW50Jp7i5jycMDRBEjIp5poiQ==
X-Received: by 2002:a17:902:c404:b0:277:c230:bfca with SMTP id d9443c01a7336-290273e17bfmr142190255ad.4.1760314959008;
        Sun, 12 Oct 2025 17:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f05bcasm115840285ad.84.2025.10.12.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 17:22:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: samsung: add exynos8890 SoC pinctrl
Message-Id: <176031495194.9871.10054397457165667570.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 02:22:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_172240_458552_FEF45553 
X-CRM114-Status: UNSURE (   8.84  )
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


On Sun, 14 Sep 2025 14:44:54 +0300, Ivaylo Ivanov wrote:
> Hey folks,
> 
> This patchset adds pinctrl support for the exynos8890 SoC.
> 
> Best regards,
> Ivaylo
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: add exynos8890 compatible
      https://git.kernel.org/pinctrl/samsung/c/9be3b7bb7ddd4e8ed466f41c6f43de34424aeb8c
[2/3] dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
      https://git.kernel.org/pinctrl/samsung/c/f416d35e6522f0c08d4e866e5d6930bfd504e645
[3/3] pinctrl: samsung: add exynos8890 SoC pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/5b6b7d39cee69373dc61ca22164d616e4faf60c6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


