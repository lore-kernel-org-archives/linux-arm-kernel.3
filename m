Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4081DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIetZtVvpEUX157Voy4D+ZB3t8P1w/c+ExnDxR/4ciA=; b=F329wZKR3PxV4UWVsY7WfDHeTo
	5Z+fe00455Ri9k7XES1NegfpK2auL1QFIuhyYU6y0VGvbsn1fkVKgDKCB1bI6qtns5CQhrF36YUaf
	rwy/JTujl+5gS8cUA6TEMrrtmattcGpLI65isrStjvyhftkOQHQDaLzMEczgcLr67wGjjcMg0Crmb
	F7wEacAWNE0mJhN9hdZ25HnsyR8FoGjxoFh4H5XgCjSzOjf0mcpumMn1WoaKLm5blj6j+TsLUOmcR
	AjEsBq4pMH4+uxG9WSDZ8M7mhFU9tyXaOmWyD7gs977Ygdk3S7QLCsHcsyMckFyxsjuELBUZELMQM
	0hoX/asQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd9z-00000005jHA-3cLE;
	Sun, 04 May 2025 17:29:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBd5p-00000005igN-0WRY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:25:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3913290f754so190234f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379531; x=1746984331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIetZtVvpEUX157Voy4D+ZB3t8P1w/c+ExnDxR/4ciA=;
        b=BXBFwf2YDDXFz+8zr3mu612xwXCwp1BNq9NuGiA59ciNbcws5iCTih0yOGNC/3sTdD
         xxa6f6ebpLpv0QGTsUXqpQCJGMBuDoFcwnvNTKd1S/OK+jajgM30ZqXGkLBPhUJ0DgHo
         q6Tg8ZhTDnobromJz6wjrZrT/dB6X9KQPomJx512X7RzlEtUiqP/q1ZwJfMGl+flLVVT
         9xYEMFgkv+Yzi0uq/EKw6+SY8aJMnr0OkFHH7Ypm2g8xIE9D/0guMUX3m+RhBK3Vsvsj
         51UvFKh16XKWQ/Gm4NZbPcsLQrdrwL90J61qhw/ENz+g57mUEZlr75oBW8Vpc6ZEk4LQ
         4HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379531; x=1746984331;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIetZtVvpEUX157Voy4D+ZB3t8P1w/c+ExnDxR/4ciA=;
        b=iLi2sgbPgY5gTgYGf9jWTpLqDtMmEal+9hBZpX5AuewYWvLfnxBFMSsUB4z1aqaf5N
         dhkMrn/GaAZzr8q4LiX+2BCfkUM+JnSXZg9xlrElCAxIKI+nCMygQA2Hy1g3a71MSfZM
         GhapI5Lp/XfUDBydDX7QeC3c9vyRM7cfdM9FWoA7o2+jn/PTacXeQ5jkhIE0fPg2B32K
         PT7Q6wm4/HXP4y5X7N5tMXRHbUtS7rRbqqyOWP+jU6FlPnBohPe9iKNqn1w3n6oq239i
         HuE6ENBV4pa/QL3dg1D148JIbvtxKy/wqf/hN8tzYmu4I0CdNfjC4BaDJvC4W8Z0LW17
         E3MA==
X-Forwarded-Encrypted: i=1; AJvYcCVTcjPNlrOrg/gNuXTBK9r83PY0X3+YOpHTSujyCxOz6FYHbSjUHHPJLuVwTx22yfSzhRMiWzxJti94Umu38VdO@lists.infradead.org
X-Gm-Message-State: AOJu0YxC6pW1tJXVcXfiiHlPqJF4ADmJEjmZnhxIBz7sBPlz5MOFAW/+
	b1eH6uZOk/pildYS+tfGfNFZCDEWpGHnNblGvxrQ5gyPQFr2+31aTyP96ss6pmM=
X-Gm-Gg: ASbGncunxifS8n6ef3xs8DILVt5id8dx3wH2eloQhQchV78b6sMfFEcaiOHa8IL63rz
	bUeIfhKhkuR+/AS0b4dP8Pg7RSO/zW4b29YuMaFv0vn0a53OO3fv66j5noLkADnGx/dPFiA3Jgu
	1ay8VBYB5XdaXA5PqIZBTlweU32u0noNFmWZMPONxjVZtngIt472Ud0tZ1vPq1+SKB6nkpEkjJi
	oF0w3XqxrOrLWf/iUUpeBVT4o+klssKXzqShjizbiOgARCmXOd6XxSKbQgfuHdmdPd6Ry0t53i5
	ygQLj/Mb/VjvDlrfjPOAO+ef6ryMpEdoPkBHsxzma+OQ5oBodL2HQQ0e8hg=
X-Google-Smtp-Source: AGHT+IFYaZEBx5yqoumH/FiWwmOzxWN7aGOeGNL5Ypj10vpFzEjWkb0gKejuM1ERKGG9RC8IhnyXsA==
X-Received: by 2002:a05:6000:250e:b0:3a0:99a4:e53f with SMTP id ffacd0b85a97d-3a099adff15mr2242281f8f.8.1746379531418;
        Sun, 04 May 2025 10:25:31 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm7896332f8f.71.2025.05.04.10.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-2-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-2-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 2/3] soc: Add VIA/WonderMedia SoC
 identification driver
Message-Id: <174637953030.102764.839474842803768682.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_102533_164689_6B33CAD9 
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


On Sat, 03 May 2025 15:52:32 +0400, Alexey Charkov wrote:
> Add a small SOC bus driver to parse the chip ID and revision made
> available on VIA/WonderMedia SoCs via their system configuration
> controller's SCC_ID register.
> 
> This is intended to select appropriate sets of on-chip device quirks
> at runtime, as it has been found that even within the same SoC
> version there can be register-incompatible differences, such as
> with the SDMMC controller on WM8505 rev. A0-A1 vs. rev. A2.
> 
> [...]

Applied, thanks!

[2/3] soc: Add VIA/WonderMedia SoC identification driver
      https://git.kernel.org/krzk/linux-dt/c/6cd47734da4af93cefa1cb3d8370db57cb5616e8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


