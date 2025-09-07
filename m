Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C98CCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=; b=rRSvfPt6yXOTHtrrYc46H4qtZx
	UOc/2sLWlV2acd0qPzFx+p94Lw8wyXNOdhP1St7nqBOm/OC3c8hIyLQO/K0EEu9t3QyOze6ekPMv4
	U8rnrIEZhV71xtIBozr3v0vN30kNJ8vAbyQfLhc+4eHvNGfksq8+5MVqyzNk46x9ZptKUNXNNO1OB
	7WRqUqhr4PAgBMo3oj2Ev2eof8a3dtHkRExXl4uX9ZdyORck1YtOBROm2E/QZOL9JbrIIIoccItVt
	NfjQDYrGAgNsFyh3FEpkSPQgbbd6XCqzPyeBJgL1Qyv8fAq12TBT7Wqwd35ryfSpep3QRoKAH3A1o
	ccXezU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBZw-0000000ANv8-09fN;
	Sun, 07 Sep 2025 09:20:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBTL-0000000AMII-3zZS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 09:14:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso348805f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236446; x=1757841246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=GrcnwUXoXrBbJY6K+UJkPQ8Ja139U2isHv3CgFteiSADQfefLuWRnrcJc3gMOob98P
         a3dvbWNFCzu8JdeBcld7koaenMIiLigUfhd6udk7dmW4mgOPz1ATW8ju2rHPEr01suLR
         skYe0eiuR9f1jP+nwyFkZCBhH7a9dgYBtm9Cq6j5LOJhCMPZ2rx/KswaY3dImli2kjf1
         R0RPy4xRUlGtbtEaEuoe9QtnG96bBfFYjvr1iqgIT62pc6CeJ8jic6O+x5E+kySDpktA
         iPPgsg+WAegSbTcvUnta8Ggr/KI/wGApFON/EvlC81GrK30N/xfI3lnMTt91ONgTelXk
         XzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236446; x=1757841246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsp0bK/nuIonUnBqY9AKagtiSrgSRD7fcSEn1YN+5DI=;
        b=FjOjh4Em52bfj5Omw8lgivPRoEQ7QuEHdY9zzMsYOgq6GO7gVR6jFcMIeNlwIar24U
         8rUNpN1xxLIXZvK2xVEwMNnELdYZJWElYbetCw9GE31X8kdNs/YLZMsEVF2TJfowy22+
         +l2UfknTq1SHKBjZmOXMeq4dCeh7AFKtH/9QelFoVINbafdwoNmDE34nqPp+mmdUog6o
         YyC2Ng64kHEEXeF1tM4QnaN7PQKl+YShTaZaN/PQIdmsvAX9VuiL+a4qU/qGn+3VZbve
         L5d1dUPJKnBNzyi4WBzbx3uc8E4i0RmUKsbQXcfLv2675fOMm91avAlh/lnvah4FUhaS
         E4gA==
X-Forwarded-Encrypted: i=1; AJvYcCXgCtuPiQ9jzW145Qp4+hl2ZUMl/MzvGh0GVCjPemPa2ig4XZJ+oaoCw7jCwgh2mSbaB/AZ9A3+v88ItMffUv8i@lists.infradead.org
X-Gm-Message-State: AOJu0YwKcVsF6klAIRgOacLe65iSV8fw9aYhe65Z+8Xbp50CXZ/EfR++
	wupdFbfQ9tPuoZVLWyE6m8gfwT3qlh0j4QRIB3tLwbkTFMy/TtqkkCHcAWWV5yA6+OU=
X-Gm-Gg: ASbGnctzRG4T1nxwJ01hb4fdwNcqmLbuYU+exQpR+BCQxGq4whVpUx/+ll8NXB4C6x9
	sIiL7XpkEWgw6HixVlSayMnOX+x6eI8qSC/+UysnM5/wwVaZvW7qxEJDjcMSw+tsESmZsogikzf
	vui3Ud5kaiBdV1ZX/k/1h5IUV7YSOTjDQsF+P+hlXpgVG3cDJeNxVEOJqSdvLuJUJg7NfANb7Yo
	EROW9gZndY00HUhWP6GXjGlGGa/aTrk+kk0FWWwYMi8vThNuayYcDTlFS+Oudjsk6vr2Z9XqlLI
	P/BO4iREwn8SOEUDQnjDqzHlXX9/qkmqYYcjFbyEpoZneYS5mS0OP8Pr6gBvhqlPdzFMY58B9G0
	0YkMTjtGtE1ctlVd/zIHjwBIWYs3fT7vFKKfE7+Nz/PqaPPwbfw==
X-Google-Smtp-Source: AGHT+IFQImOn+iq/yUmUyBTZk4IQaF9iLgVYYsVIQC7hi6Y7Hlt3FPdtOjJo41ClE7NuPr3IM92ZKw==
X-Received: by 2002:a5d:5d12:0:b0:3d4:6abb:7de1 with SMTP id ffacd0b85a97d-3e63736f694mr1567362f8f.3.1757236446397;
        Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:05 -0700 (PDT)
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
In-Reply-To: <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-3-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: exynos990: Add PERIC0
 and PERIC1 clock support
Message-Id: <175723644487.30719.10030399153447295312.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_021408_009310_4A98758F 
X-CRM114-Status: UNSURE (   8.86  )
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


On Thu, 04 Sep 2025 14:07:13 +0000, Denzeel Oliva wrote:
> Add clock controller support for Peripheral Connectivity 0 and 1 blocks.
> These provide clocks for USI, I2C and UART peripherals.
> 
> Some clocks need to be marked as critical to prevent system hang when
> disabled.
> 
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynos990: Add PERIC0 and PERIC1 clock support
      https://git.kernel.org/krzk/linux/c/b3b314ef13e46dce1cdd97a856bd0250dac8feb9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


