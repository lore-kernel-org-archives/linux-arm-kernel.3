Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7248BC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 19:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6ciHLBQ7v+KERtVpL0VN+WVIHbN2nip11tdXEkw5/k=; b=w3VvZjimsw4y9PRO+mdtgyI8T2
	+o1+Vbi7D8y+1LP7Si6wRMFPYEjbbNCD2q67tDyzyzvCZbHOXcfOeYtWR7kBhnB4d3aQfyolQ5qgP
	5c9sXPvbUkpFL9AaKwHUEuriodSb2fAFijOigUjVjlm7p49nT1G4kIktZf608/P29+xsv2d5woc7t
	xVK6nkx5yQmjMWppU6cTB76nIjFl+Ou5TWqTSh4gxlOAX89aKliHzHo6cNxhbMzNSz5Z5mNTAoK/A
	fK2C6VGHobGuhzh+ivwU3Qy7e6WVUgx6ymQ1xnDFZobVwYRmfxktBMe8Zjr5LxPxJ88yTpo6aVUbZ
	Hr+0VxOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97eq-00000003vfn-2Ztp;
	Sun, 27 Apr 2025 19:27:20 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97ct-00000003vPC-2Dni
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 19:25:21 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f76a47549cso210486a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 12:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781918; x=1746386718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ciHLBQ7v+KERtVpL0VN+WVIHbN2nip11tdXEkw5/k=;
        b=S42x0m/qo5FDH3SOy1gUPqmiolXqJdFVMr+XYtw7mltdsaW9r3UYWrSc3eg+QX7mt8
         npAWN6Qw+dnfht4BBP/kJynDCuc3puLy753lIfan0BCMk7D8nT6KSFMRXlnBnV42qP7D
         /FllG8muOfvBjwzDRdmL6SxFaEYdohEDF3nbftPuXUboUglarknNUpFFylIFkWEKikRT
         ve/o4O8xw2rGv6QqshVHMZgX28Qp/vpCl+bn+YwQ3asNU2slXJ/Mr3e9SvkxGBf6m4IG
         /9h4/otFtw0onc4ZoG7OJIQp0riN+JVADNBc8rkZsq4x9grsbndj06Z3+wrUTs1Jasj6
         sCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781918; x=1746386718;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ciHLBQ7v+KERtVpL0VN+WVIHbN2nip11tdXEkw5/k=;
        b=AttCBfGcTUdJAa1FSQIY3b/+sn2nLdYLdpL8YBs1EEJsWpNlIq5LzzdXMMOP0hdd9S
         4W73/gA0BAr0/iSIDDVyOjQpfkNXKGwpZZDJO9BwV088IzFedkNfMrsJx/8BVR5Loli0
         QsJMtDGEMu8pIHgthQnXuDAB8hJOrz0AactJSAdrO3eHljOzlDg0Li+JXoaRe3dCSVQJ
         9CTKjAn6hssdSv9fGkYz3X92kMdS9AcSYAXU/8UbbIuQaVG6haKm6KJ95cqxkBIuQhty
         MGEQOTBR17clwdlAKLUPO3TuXdLJ09pwyei1YynwdKKyJLLp2yQCYWS/qGnfWY4IAvBO
         Jm+g==
X-Forwarded-Encrypted: i=1; AJvYcCW+rDxIcRRW2T9irfgUiPtoX+Dgq6ks0AqVBFOApl3aKJthX1LZJdxAiCIeZuLFaNuBjZTDnTWa88PElOXPKiYt@lists.infradead.org
X-Gm-Message-State: AOJu0YxQU7ltpS3/CXw8e/9j0YUcauIoibe9HJ7x/DElEzMovZk1TgF5
	mxfIPTZmH5pGW2D3xymuRXjU5zSlNq7VetEI//tHi7gJw/pYU5Fd+6N07UGcdmTsTXh4ohVmaWP
	U
X-Gm-Gg: ASbGncsDUDfNoRKGv4ni+YivAit5+U5D1hwwJPc+4RRhkd93J62EwutDbZdX3dWxp6s
	MBoyZhhGdnzS6L5O1zy9842S/qTuFtMkKtEkmu4I8SJGtvjrPW+MZKR2eaQqlIQBX2OIxtUeTxp
	WPUrJVb3x3mhjVSU2VHhhQt1m49HEqhHS9RtZAX1BTYnCU1OjbnZgI9qpyQw09SxHJu3xgb40oK
	MB4Cq+tHt+0xPGdABYM/uGKYABRIcRih+ahgy1rtObwZP8mwfRfJxYJSz6+q/lBDxkDOhhPz7K6
	5altWmxWtt4yKwYl/6zFV7bmtAQeP7y82yICHwZTTWGwVpoLGuDJBOWu4ZY=
X-Google-Smtp-Source: AGHT+IFKU4psDf5PYHdZCtkO3pzmjbu/DFKLJPT1981+M/z6WVOmTWVD+2jCO8pEXGfM0N5n5sGArQ==
X-Received: by 2002:a05:6402:5110:b0:5de:ce71:badf with SMTP id 4fb4d7f45d1cf-5f723436a14mr3052840a12.6.1745781917715;
        Sun, 27 Apr 2025 12:25:17 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm4650196a12.46.2025.04.27.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:25:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250423044153.1288077-2-shin.son@samsung.com>
References: <20250423044153.1288077-1-shin.son@samsung.com>
 <CGME20250423044159epcas2p26a4d07552b5646c7e076f3989d8ea354@epcas2p2.samsung.com>
 <20250423044153.1288077-2-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: clock: exynosautov920:
 add cpucl0 clock definitions
Message-Id: <174578191521.47282.12191544954441136681.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:25:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_122519_736844_EC9759A2 
X-CRM114-Status: UNSURE (   6.98  )
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


On Wed, 23 Apr 2025 13:41:51 +0900, Shin Son wrote:
> Add cpucl0 clock definitions.
> 
> CPUCL0 refers to CPU Cluster 0, which provide clock support
> for the CPUs on Exynosauto V920 SoC.
> 
> 

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
      https://git.kernel.org/krzk/linux/c/e2642509e3d60dc90b74d27b47e36cea71a96186

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


