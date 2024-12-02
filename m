Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA77D78325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFdTL5VEPeunnOwNpwyKpiYpCh3mlklnlXFkbGWKFNQ=; b=HefOmCjTgyARodCah9GWUG8sKj
	kZRmUXwXv/EdAss8knM/BLaH9C5H5hYjf8UR9YSL5w6hRr2VrwVdM5eIYF4wBokh+cupygHVaStM5
	50Ix6k2+ReEHZCuIzC1CHeLzCByjQ0vYJaML/9g/AKGPvDaxjtGigYCf0Z1EYRY/1mFGAjjMSWxsQ
	GrFFPmjUu5FYLumGVr0gDOsRiXVFdPGwHHGRTjkDJBaGAhT4Hw0TlWSwcpvnvX4RVJujlA50b0eZs
	b56xId3gmNNGp4T2yy8Z/8+Bg5qZJ1vAWTAQaIfz0Svp+AMJkcyd029FMLK+6Ow9hED74yg+5tJ/t
	HqUKNYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI72c-00000006M6F-1l4c;
	Mon, 02 Dec 2024 14:04:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI70C-00000006Koa-3nTv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:02:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434975a1fb1so3630805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733148135; x=1733752935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFdTL5VEPeunnOwNpwyKpiYpCh3mlklnlXFkbGWKFNQ=;
        b=QcgEppUXbEBhc//GtKCtismmy+LXqOFAugnmaeZ1dEl6EC2mZRZaj9NCdr+u2CEHb4
         a2MnIbmHdtNmevj0nS3CtzQ7qqP8XksarE6A5+5yb53EBkXc+jBRjhUS8bpKeXyXndsX
         mgY147MWyOxNxtMWDTxULfAEdg7Yn1EzVrZhQ9QyPj7y1TSrUOruhEwCHFo3S/J9rzv2
         nricW8pIoMzkte4dgAQkGB/oIYB6HEVaM7qzuOXV+Ftr7jH0o1sBH6bH/TuXJb9q05nr
         loyR2dlaBQIfbhQFMx72J75/4+3iU2YOU8sbxmEBF/aNjhAm/B148GBYvh7c1V7RgTF+
         sHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733148135; x=1733752935;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFdTL5VEPeunnOwNpwyKpiYpCh3mlklnlXFkbGWKFNQ=;
        b=boBngdzcLMxyyZFIp+XZ2EB6ijU7xvRcrB7qjR4xRiO2+qiLQTOblMykUaaB5aMwsO
         ltT2RCt8IPd10cnn5bqjs/ETT61SPEewdZVv5UNmqc52yBj1f1mp/Q9zsNFr6BcO4Dro
         u6Uh1xepCQqUG071EaYl/s1nJV1D/ePT6+77rtcfgWEclzJu8RyAxvZRPGV5vMRuKinA
         HoIiZUZcC7ZURRiSSvAvWXrkcwPCZp6ilQRbsoqzOsz3fLylJt7ebyWAkspQ79wjMnbE
         6Hf1KxdFf4mTfQd4+VN2ubHIPCuNONr/Ir0vkwNp28fS8H8WGSmkhn3Wf6oYZa1YI8Ko
         3fGQ==
X-Gm-Message-State: AOJu0YxLwLgsD2zt5V22y/qbi6fhY00VsPaWbER5x/nrM/Ej4qyCyJWV
	l8mhiYzwbsppyaJSTAZvFOz1J69uZzAjtsdTr6Bipl/ATRbajXFRUvqVkdi4QiY=
X-Gm-Gg: ASbGncu0Rvgmarx38Th16Z7asDJp+2KPu+aR208+3h5pv3qOvFbC18Oa5PTfLmx8+M5
	XgIc1AQCnVgx+LKI/dTIMIZY0eszZ4vjslAp74ndnfYdltoc0JA1MSfl+7SI6XDVvkkbuxyhPLD
	v7+s7ZwZLBgIW5FBnsBL29hautUVKUZCLEJSpNoLZhMl45PXMIHjQdDmN2CqDGK37Ji/ZiSa2KO
	FIgqI5PesCQgh3z3/QCBRpGLBkos+d6OQjv5PxwrW523Wz7pm7PGS9zxqYAmU7x
X-Google-Smtp-Source: AGHT+IGxwUtz2qX6sl87AP1MAktuEdNdgWw/JHxE62KrZvo42zm/39LbfbWZORwukdi9PptFej8bKQ==
X-Received: by 2002:a05:600c:1d1e:b0:42c:aeee:da86 with SMTP id 5b1f17b1804b1-434a9e1ce8emr81193255e9.8.1733148133134;
        Mon, 02 Dec 2024 06:02:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7691b0sm184502815e9.17.2024.12.02.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:02:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sota4Ever <wachiturroxd150@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241114143636.374-1-wachiturroxd150@gmail.com>
References: <20241114143636.374-1-wachiturroxd150@gmail.com>
Subject: Re: [PATCH v3 0/2] Add support for Samsung Galaxy S20 FE
 (SM-G780F/r8s) [SoC Exynos990]
Message-Id: <173314813121.47662.7729149107568659652.b4-ty@linaro.org>
Date: Mon, 02 Dec 2024 15:02:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_060216_944285_75EA34D1 
X-CRM114-Status: GOOD (  10.23  )
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


On Thu, 14 Nov 2024 14:36:34 +0000, Sota4Ever wrote:
> From: Denzeel Oliva <wachiturroxd150@gmail.com>
> 
> Hello :),
> 
> I'm a newbie and I started getting interested 1 year ago.
> Well, that's the beginning,
> until I learn more about kernels and the C language,
> which is important in that.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE (SM-G780F)
      https://git.kernel.org/krzk/linux/c/9163693d368f00c02fb8a07beabe2c2f18fe0a32
[2/2] arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)
      https://git.kernel.org/krzk/linux/c/706119fbbdff2f95a62d1665fb4234ebe4e9392c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


