Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4A5C3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=; b=Bp/6X0NdUmg2N5FNJDw7rJ7t07
	KnhQ8G9uTyhb3ItQLBb6W8PfkU6RRcMsFYL69JYbDrTiLzgeURx4AFI7M4R+WR6Z0GiCrYdQuymFK
	HcX+uJh5QkJrguqClbBpv91kLRfSvHMFCx1e1+NKHpk8Pbva/8M0jKRfgGQRjxVFcAOp+s8zK2Qlz
	Otd8QC8PS11jNRarbXxUyw+ZLY5aHjOLVVNBDChjtYIS6P5Mw0HqPFO2kUmpzv6BQ+Zxzjj4AXcdq
	NZbUUr+RUQpJfwnsIG0hPkTYCv75ddlNdnqbvitLYnSI/2FmXEuy4yQnWm3bMztPghThzGBrY8Omt
	0cgq+cnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9liw-00000009toa-21uU;
	Tue, 29 Apr 2025 14:14:14 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lA5-00000009nNB-1g05
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 13:38:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2963dc379so888542166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933891; x=1746538691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=;
        b=GUSkSAkG/RhD90csKbBFjaQNC+JuwOv4o7WqzOitBdlNpgACs39jeHb7CS6XY4kRlT
         jr85oS60x3Z9o3c66sZQzSyxVNNZSfE0ANE5dHhapM9zsblMOnnzUnxUuzqpvgnbZkGz
         P9lPPqNenLo7//o60kG2y1Grxw8G4ldlNNTsocCNazhVHXKiqpv2UARbWTjrEfN6rKjx
         TzWW5+WVAnowbr3AVFV3Jg4k4hkEa0CWhdZqyIWQwtpsyfL8caEpRozdjTY3PHlfHniv
         AANIwNBSLMKgsVuooIT0i8VA/h+Ujv23ZxkG2ccQmISFn6DQp454OK7sXtBiHsDDVWKZ
         QPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933891; x=1746538691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y26J0iAJoKCmJNS38dntVfyxrAVGftlCnn+OgGntO2A=;
        b=Htuo0ErYZs2Pr8BeSjXGgyhCIt8oqzzhLnh0fHCoH3aMeGKU1tN69BqssxDlp4RvMg
         Iaj0Dm8MjzN5pXqk5WCk7VTTTh6o5I+4/YwsSOeAExXWkum4/RtwmJKT0ZpYqnea2t7o
         vTZpGzextg9pkl5Hm6XY1aGqW2oS2maa4/yR8rnAluwJHWuoyFSL7CBic2tIlC//fNpu
         5LWHIcvIR2vPZbLPw6x65Aipfb1slQ0UWLDRQsF/tXxJ6EidOz39hg163YwyUH/L9ovi
         K6Cq60HhLhV+ZKaky4c73Ikib6YVJSL9MDOza6vOYPStjIVenqWjycr6Ze6nkVCFhlag
         fEpg==
X-Forwarded-Encrypted: i=1; AJvYcCVE/emnkqNs87hg2aOQ3JNYsgMngv0YgZbfYe+4VpeMJDVePKhovhHU3BZZnVZC4GS/0tEtl7BVX6UyuoZxTKCE@lists.infradead.org
X-Gm-Message-State: AOJu0YxKiVul54lfydzTyRvuMpV9dk81sU/xgQwUWOvqO2b4mlgDh13P
	4ZdgxibvcsfOIyjF5bvecRiAFNu1EpvY5teDRvTwn9tctrmBBTzh
X-Gm-Gg: ASbGncvAkRSGzM0BwYYCgvkOdWJaAi2TR5VtKLnb9FM9n3Mx5Q8hqGMhw2pnTns9OwA
	SapfYamUkDf7wppyA93OopJlG8oX8B7Vyd5WJEsxYrI9QCN6WailXv6eeKFncCpdvQ0DS1Iqmm6
	jsxPbtLCX3jUFrpgwNaKFY6L5daJ3APYrnxbfVRhCVuy9nT0S2DZfgNOC8/BIk6ueRr0KwsR+xz
	I3kDPVTtM/UAthQtpiUYRhVUBzSWSu3LeDcv1eoTnyZ7XG3ef6WLA0LZoeQJSi1jmtLH40xScHy
	ruPcVQAkCwwB6mH5ooATQwmynC7ctXkcawOPi3TZlhBucwBkVXxe7+A=
X-Google-Smtp-Source: AGHT+IECDUUSwqdQe+jFeZC4zccITFBfdZlwb9V2S+BXUJyiLooaUiYpAnL5q+y3JtdKb9LMa4l5/A==
X-Received: by 2002:a17:907:97c9:b0:ace:63b0:6f70 with SMTP id a640c23a62f3a-ace84b71607mr1146290666b.61.1745933891105;
        Tue, 29 Apr 2025 06:38:11 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6ed72826sm778242466b.154.2025.04.29.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:38:10 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:37:27 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 6/6] arm64: dts: imx8qm: Add Ethernet aliases
Message-ID: <aBDWF4-63M60EwX9@graute-macos>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-dts-imx-aliases-ethernet-v1-6-15b9d5cca611@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_063813_436443_ED0DE666 
X-CRM114-Status: UNSURE (   8.44  )
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

On 25/04/25, Krzysztof Kozlowski wrote:
> Add Ethernet aliases for predictable names and for firmware or
> bootloader to fill up MAC address.
> 
> Suggested-by: Francesco Dolcini <francesco@dolcini.it>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Oliver Graute <oliver.graute@kococonnector.com>

