Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0630CCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kk5WeVX3WZidjw/Ohoo4baVD2n02pPZGtcsCU88fulQ=; b=BK41zB0bej4xi1b5/83D+qV4kx
	zA+0IQ6jGokhQ+knExXkmSViQyfzPxz5VxRzfoEirEEeF/uKGNHxCtUdxaXNMupK2IbNKR/Xgr50E
	m77BmxdJ914NuFj/iY4hi7e19IKSGFAfpRrXWS4lKU7u6ozda+wAIAACnm1oCqAmXU7kXs8J+dq6w
	zg4a12HPHi2gQosKEnY3xLTPHrh5zrHOYLWqQ6XWFdN50qyKj7Im/3Xe4ROB0NHOEKZu2Aeq+icpM
	Uaxv0foFb+oLUS8SiWx75rvzuYXX3AFjE/zfXgjkQgChzGFIqlwBRwcm1R9w5nafVKGo8bISAAj7X
	MNqUSSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrOS-00000009YVG-21J9;
	Mon, 03 Nov 2025 10:02:32 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrOQ-00000009YUq-0AIj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:02:31 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3f5a6e114dso62810866b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762164147; x=1762768947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kk5WeVX3WZidjw/Ohoo4baVD2n02pPZGtcsCU88fulQ=;
        b=JoZAAtOG8ba6eeodP2DBmaP6D0EJOk/3J9Tsd7JyjsVm+rlrAEhxMPoIqABScE1psY
         mgu6CUmMbyyG48pHjAPj6oa/22WWHkFeTdydaI5NwFqAytVVw+nkQkWl/lqlbEWi94JD
         c3AcEaN8J/bG0cvJNwDPd716qJTIi91O+tLX2eio/1rXYz1j9LQq90caDYb4NZCLFZjV
         Xi2ahvhkcx+d/k7v9SOVtZu9nKNtups1JkojcZISsA0Lp488cg08iMvndJJhSnCSWCjZ
         Enn51KeQ+o538YZ/8tzl4OiB6GU5gYu2HowxG92szPyLTupeq7ntzk0RJAjv4r7EtFE3
         IYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164147; x=1762768947;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kk5WeVX3WZidjw/Ohoo4baVD2n02pPZGtcsCU88fulQ=;
        b=QsBkErdkS9mPtU1mPyB4m7u6U6+595VtPatItjuFXA84L3mHvSDL/PtnTC2ay/M0TI
         EdmQIIYaE9hszop4ggffn5vjwpVNtQKjGkMxrGpkZoWjxokpcZC4opPBi9HgELcdDbwQ
         oG9+Q5pg8+7VUyfb4pom9QnyveIlAT4CT1Q3YP+W9ZE2zKJPtpczMJ5Dg69TvzjQVwP1
         o/9qi5kK0fHGmgWlaMEwQPql/QTVfYy7r2beC4m4kj64fca8Ni0HowGnppLC2mARCa6q
         zsR4U+bgAeJZaYWTkktjtto7yDSYJncyniXMQXWGg9G4ABe6N7gjBi4Ye33RH48j9TEE
         /8nA==
X-Forwarded-Encrypted: i=1; AJvYcCUnhEK76RTZ2OHoZDn9KwvoocTshLGHZRxGPzz6s+Z+mwR+jv9O+JLPo3KeYJRhKNNu2VM9t52TLjod0HVrcnjm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjh1puOjO+HVxddr0+66h9Vb1GWX96QswTLTxAvtPKpx2tVulQ
	5ajXt23AeCnEBdTT946uPEz3AEX+JhP/SB5jOhrCpwDa7oVoyQKS8U0acqJufrZkCy8=
X-Gm-Gg: ASbGncu2Ust1pOgM/r0XcHuYbwvorgFLx1Mvv7X+WSt/gSUQ1Ulhk1rI90h3Fdqsghd
	JdDihCfJzNchKFu0Yjp1Yu7Ze6yQ6H8VI8vPJd7qcybocMeR7NezsQMMkCYspd6zm11hjlUlnSO
	AuNX62txOFRv3zS8NgAXi8DwIspka9xQo2mr8pzSkc7+tj+EDRUtJPP9pnietf6nOYeMtmWX/EC
	Evg8Q1MCfnhV0h4/urMY9BGpW2w31BsOwpIm/ViccWO0UIE1ASqHBAX5VducPnmv6SGUVATpIrN
	IaAzI5IbCz/m3kgu3njRURhpwwb+miOPWTpbn4vOKwvYlrZ3jrNC8CDvE/AkqNi7VOl7FLpuoJI
	rMgNcgFYYMsovA1p77nTo1QijcrY1/HLKxQxYaJt5OJNIUocHMVqRf96vqhh+9Tw6Y3pDaxdSKJ
	vj1tDf45A2VOTjC8Wrve6+52HNH88=
X-Google-Smtp-Source: AGHT+IHhQd0Z7HhWjALB9oj1UOU7TBdJPgOnwuPH3RM+AzCngFPe/MvWD8B/RttW7aRFtZ4rAovK8w==
X-Received: by 2002:a17:907:3e03:b0:b42:1324:797b with SMTP id a640c23a62f3a-b70708ea28bmr632326066b.9.1762164147447;
        Mon, 03 Nov 2025 02:02:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b1576c5fsm433340966b.43.2025.11.03.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:02:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251031-gs101-chipid-v1-2-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-2-d78d1076b210@linaro.org>
Subject: Re: (subset) [PATCH 02/11] soc: samsung: exynos-chipid: use a
 local dev variable
Message-Id: <176216414543.27448.5786220259949366154.b4-ty@linaro.org>
Date: Mon, 03 Nov 2025 11:02:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_020230_114951_CC008F23 
X-CRM114-Status: UNSURE (   6.71  )
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


On Fri, 31 Oct 2025 12:56:01 +0000, Tudor Ambarus wrote:
> Use a local variable for struct device to avoid dereferencing.
> 
> 

Applied, thanks!

[02/11] soc: samsung: exynos-chipid: use a local dev variable
        https://git.kernel.org/krzk/linux/c/bea18c67a0ec75cc602aabc523d726a4626e1341

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


