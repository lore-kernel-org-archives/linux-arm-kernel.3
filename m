Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F5CC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=; b=vrOzO9fKYa0UeM6r1R9r8Erd1U
	ixau5LklKJgwDgjrj9vlURb0BYZ/gClwYY+U2ya0Cra3PCZSbGUZhjAsidpRo+Nfv/TvLz/v47q5R
	1bfBSvYvmZ5f8jVVZXBxC9a/76d5Z1JA/GwTOUnk3If3lqOq+RzwXxKyuxhaPLasVCdd4Lc8imyxw
	SBy70j00V7jD2RCpsT8HZRpdOsbw83azYXjdKeyLxaUPWMiOXdiIefWYz7wJGGPSCvKNfTKZOC4bV
	lAgmXYv2mgp7twJx1L/Qkv7XHxnnUY+t0IUhGEpMAIFTZeKnSnVoD5aJlpkb+KSaHCugX4uibYYE0
	/ZevaZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF70u-0000000EPh4-2exS;
	Wed, 14 May 2025 07:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6yj-0000000EPLr-40Jq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 07:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=; b=CJYX9+fYs0XEFI72eiPB5Y++T2
	mE2GiBQBWjhsTFLW6JYkhyhz+K/GVDCZxgi2qYNYJYxAWXeKaa2sAKAJsWlZublRJaxKzye8Eg74e
	z8stgwqbVLcwjRBQ6wOHcYvuzBnB8Z6nKKtrY8c2UX/ECaaJmrPl2OAsfrqsdv/JCPGpGn3HJrCD7
	KJbcibORZTTsAQnKSSYZ630hrjYKnCW2yYx2Fm1DbUrYH4gSpQYBAGzRBXoqUh/yL2VdMZ+m1zwt1
	QEDycaarZRHaCgvlhWwSiDG631yCsGOhmElKRevwoBZ/flK1MPEXGqzQqkKhrBgzTtZcx+GauUQf8
	YH2TRwWA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uF6yg-0000000H6sS-1lf6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:56:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso782744f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747209392; x=1747814192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=;
        b=j+OReD/uJuigITQYRyjGwsUJn9IB/NgInOPeZrwSmbnbdx3iKe1Klwn+myP+YNKMkl
         fcqmXdYgs8dkqbumJfaaPUV1TL8CmEVkKylDyLZlwt1cc6F9uqO8Ei34LvqOBjjiVUb2
         NaQgv0Ap9lKSHctyjdcv03u+shhuTmYZc5ScNwduwpdUtronYX8N0ZazsxSFDtvS1PTu
         7UzwvUsjOfQYxy5wV0XBx8EVZLyDXnybwAgnT1G+X6mgL1kB4v24wc9hsTC9oRMBK8f1
         PZq2kwsX770FVE326bObL4WFtmPErOghz2PfQXUt/t2dMEoxizecatRq4NLnLUiJm71+
         gt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209392; x=1747814192;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzdTMooCqa1ypmINEmlgL2G2QWjmPcr5NoyztBa2Ur4=;
        b=kooiYOxcbm5baoAwdtVyNoCySLf/M/6Q3Ir2FeREGeTqVecRisItM8clLXxTu4DOIc
         GPM70MimdTtHBJA73evgkLpYrU6lyrzak61XjWpDCHa0fMQ/GxfheCkYet3vVigJ32am
         M9+9IP1hVa3vgalg3ySCqxVik2iNKToDS//F9KoYDCNLjAtBuvkSip8rkowPU4zsPRO7
         TJblA3ZDzu39fOQBAN0NdsUV+GAsAGvzjH7zTzuVQk46atnWKD5gEPcEejHYiaSzCYN1
         e2Aycr6FGjH/jjrlmVLzHzi1zeI/+mDo5wuri0HWVikeAu2X7jgflWC26N1zCX1JT6kZ
         h9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX8/lu52jETHXOtHllndT/1W7b/pEvImDVfMMkYH/9mpGXjAZ6WzqgTgTaDg/aNJWFmyEH9f9w68P9X7Tq6UQxj@lists.infradead.org
X-Gm-Message-State: AOJu0YwjzZuHAZABO+r3ri7AraHbVgAnWVRHBjcnl9ETRAI4ysvJR0bt
	S2txdZnSgvBwJjVCO6iyY+3anVeYsa8r6uDk/cZbBtfscxq5sc9nM494fjU/iwNgNH2BWl8+G7w
	iOrM=
X-Gm-Gg: ASbGncssc6jgAP0eb7rw6/yNAplyBgAan2jT+Px1MJ1rUyhvYo8dHfVDv6HEKRf/kJ8
	JsiU8t2f+MdI6Q6ge8+XzCwoKPMmYzNXgvlwfSLKRq4tQA2VzS+/2vyE+2udUNjxzIjIrSeFeMr
	JxFQc1DPhvcIyTT1+ri8LDPCUhibgKR2ZNQtZLHgYN5HryL+9dletQIXqr2GQfNABmtnQCMouEG
	M9lRHQa3HVqPBspGsS2LO5eEO7ZdgikvG4FXhMHJrHQ92AuUqVDjP0aDAxl37GYtTFdCKv8PXQe
	0HiQriidr8021RnAyxqu4MAi27Fnm2dsRt6vPakh3g76uiTbRuuxjVJx2x/E1UV1drlNrpajQVx
	hfzRbjzXsaWzbeC6kow==
X-Google-Smtp-Source: AGHT+IHHtmTfTDqpI8/MhLKS2/FzVY2p3LpVRtEE1jaQ17ol8rPj7ZAtenjeKA2K6/4xZEMzO4yRQg==
X-Received: by 2002:a05:6000:4007:b0:3a0:75ff:2d94 with SMTP id ffacd0b85a97d-3a349699c5bmr668843f8f.1.1747209391885;
        Wed, 14 May 2025 00:56:31 -0700 (PDT)
Received: from [10.61.0.48] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebd75sm19067112f8f.34.2025.05.14.00.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:56:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
References: <20250513-stm32_omm_fix_typo-v1-1-5b90ec8b52e7@foss.st.com>
Subject: Re: [PATCH] memory: stm32_omm: Fix error handling in
 stm32_omm_disable_child()
Message-Id: <174720939065.5575.14505161452787178403.b4-ty@linaro.org>
Date: Wed, 14 May 2025 09:56:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085634_753815_A3FFDBA2 
X-CRM114-Status: UNSURE (   6.52  )
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


On Tue, 13 May 2025 17:34:31 +0200, Patrice Chotard wrote:
> Fix stm32_omm_toggle_child_clock() return value test, we should exit
> only on non zero value.
> 
> 

Applied, thanks!

[1/1] memory: stm32_omm: Fix error handling in stm32_omm_disable_child()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/388d0cc33cc6fc876e053644d6af694b9d5c639f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


