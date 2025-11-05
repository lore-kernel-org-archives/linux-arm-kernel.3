Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DDECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIb/KYzXNYt0u1RpA2PEFtOULDEYN0eGfooGuJh8/ic=; b=YITM8Yb9gOQfxGgUO6gJ0wZ0Ov
	Ho4Fb0HJOwF3RY2bOa7nFOEKw7dyQh/+jaWI0eXu+eHWgxvJAMFJLtTfelaFpbIrfK0xTWpcOeyio
	R7CqIPbLFGMt7RE07cM38Kxn4rwtCTqxY4N7jThNcJLa1TAmEHbo/allGBQDpKa9IyuvImbtUueW7
	oqGDeSiJLs0WEBxCX0vOb3IKc+MK6fRWhE4fODP+tB87Ml6MvAfSdLBz0ztzqRSdTL+anFWm03IN/
	qyLp3/6v6ZXWE5J7iT0/E2U+z6XMyvdNya2ez37Do9+qdk/FQPG0fiYh2UW38bAQkfnozJGdYfFly
	RXKAp9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtX-0000000DBhe-1z5v;
	Wed, 05 Nov 2025 07:25:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtV-0000000DBgb-05Mi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:25:26 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-640ed7f26b0so260209a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327522; x=1762932322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIb/KYzXNYt0u1RpA2PEFtOULDEYN0eGfooGuJh8/ic=;
        b=UvFnWIm44lrP46ES58m/YvJmcPGlfHvWYTmb2wkdLS0Joc2HCD0NJJuKQIbDJVUWAu
         6axJvajvkYFQ+sDp4O5RPb4SLmwRpx2vm8wZtuI78I1ohKkePLdIgE4VynTMvmpAaaeu
         pq2n3TTTaclc3JQZmiddQvm+rIqJN3zUOQc5DKi4rGfzksKoTjpVdjrzmadnJWDwb6hv
         k7KUJdssIc++bQZERedtCZn1XkPQ8pH8YGL5zjbiLImWWqOc+NRL+HE5h1tWVZJY2Ejr
         BboxRsVWUwkJdTEnc7pMpS71qDddan/jYFhnrF+tMD2ZYOqNBltn0EuE7/tugMAI4FWw
         /kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327522; x=1762932322;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIb/KYzXNYt0u1RpA2PEFtOULDEYN0eGfooGuJh8/ic=;
        b=ojsv8WHPizGUJfTsOczLHR+FqYFvJ5mAPsgHg2iUzoEAVe9FdWcVXnmzWppHapa2Ws
         SUaxpsFkoL620cVy0dQ7crD0vu9vgynwIoc6Fef6H48RV/nEDgdtlW+Zho9jsMINqcWK
         ZfJV94BKU8hwFNz4nrhmwKJozMY6OlTwdZsv3n1+R4x4NUn832+scACxqcWY/eooO6WK
         7uiIZHGcvRTHtuNZBw0SlG3Bw6PVtt0Ph5ELGmU4I97VVlEg+e7q0zTdqnYCHVbnMEUX
         YI2islVGSJIPesH0Qpw1DFdK8IBjAw9bj1LabRLtTwM7EVdpQS5i5qPkbSAKXsfK1+Vb
         oRcA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Mz3PWGmMX/ZNh1OB+MH+CJAS2cllAtw2WZltpKYlEutbLZBCKyIqONLMbVFF5xidR+ZkMpFUzMCirFTA0zbd@lists.infradead.org
X-Gm-Message-State: AOJu0YwVyhgl/w0CFqhVG3XG82pZpRd9XXqXCDoYkXIgmY06l8f6sURg
	bZoZ5MLsi9e9BrZ7oDSb74lSG4tBT5ItACmswWxSaxmHd02w7SjP8+6jc1s0Z91lYVI=
X-Gm-Gg: ASbGncuH6cUib7xkGhxt2EKG8oxeWqS84umcO/0FRt2x4uhYbX4tLElhoCj18Ago8ly
	QxOOpVP8pn3cw6RdaYtLH4x47meDxEIuUW0AVxEBmrGFd4vb/LCL6y8YfjycUnIJdWozKzThQzU
	ga1DsiXk/qMjNMv5bjSLDxzweSgfgpb8ZQ9QtYya5M3VV1Tykd2BilcWS6Xwjhn4hbsQ1BCGun0
	KicBjVx2msMrbCGypvcog1dJ2vPDkjYOI+H+imZ6lKDL/zC/hyPPtBuIW3RI7/msyKNRkzCrxwq
	HjkSp8lKdK5s9UByYl5DmrRt3HtBTG9XSHCVepTa38NIThTpLLE4yNf6eHShznbA+TcnBO6iY6d
	fRGYcF3nLvEnJG2/32TJhQsSr4Xc3Yb91eI6Jh3O7Z6V4rdGVgebDJ1qfnw478thTZaDzvGdhI3
	rVO34p6Em63TmFCEoD
X-Google-Smtp-Source: AGHT+IGzPFXwhqPyvOn8ewQmtIhpOZEz27+6Xn30YUvZx2NGtmHf7a2VZK75fukyF0zZjg0re8/YsA==
X-Received: by 2002:a17:907:2d0e:b0:b70:b45d:d9c2 with SMTP id a640c23a62f3a-b7265687d2amr98936366b.9.1762327522067;
        Tue, 04 Nov 2025 23:25:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-1-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 1/5] dt-bindings: soc: samsung: exynos-pmu:
 allow mipi-phy subnode for Exynos7870 PMU
Message-Id: <176232752047.13426.3419883403605615740.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_232525_096499_07ACE8B4 
X-CRM114-Status: UNSURE (   7.49  )
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


On Fri, 31 Oct 2025 00:50:15 +0530, Kaustabh Chakraborty wrote:
> Exynos7870 PMU is already documented in schema. Add Exynos7870's PMU
> compatible to the list of nodes which allow a MIPI PHY driver.
> 
> 

Applied, thanks!

[1/5] dt-bindings: soc: samsung: exynos-pmu: allow mipi-phy subnode for Exynos7870 PMU
      https://git.kernel.org/krzk/linux/c/81280d39a2f9e7dc12056db889da52cce067b1b6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


