Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D580CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBCEYpPk6nDrVD/DXvDSlhdXPOYf8NnBeJJnqXSBeoA=; b=f6dE9VfmJ3mwPYGujwK1LJGpIO
	8Lno13pM1Fo8sPJ4XK06WPIYS+lqwOoxf1GEvZG4SmznbilM+Ak+S0TcCZfZ27AMwmFDUuTRV4oPb
	EVx6kuyLuZTxIBJ17aJSfcB0UnnCtBrM40YiE8PEO3Wc0KKakl7e6f+GdYJJXrBrZfNzR3gm9ogZi
	PfpWzZhLKjeVzHBMdac8e2CCGllF3ZDP0Yn+G3WvsW5vdUN+tb0YWVdAqpHw1z7kela/D4LqPI3Xc
	vLYbGO0zMELRrP3p5ns6znHJjBdCs7zp1soozIh3z9hzmNQyuER8EqsAQHo4qIwJeEqVD01XW2Xuh
	KFuryOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtZ-0000000DBig-1A12;
	Wed, 05 Nov 2025 07:25:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGXtV-0000000DBgh-3hDe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:25:27 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64093f3f7ddso835118a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 23:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762327524; x=1762932324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBCEYpPk6nDrVD/DXvDSlhdXPOYf8NnBeJJnqXSBeoA=;
        b=qYusCzbgnISpE1AwVWJPkHeI6k+RExJMvaiONnVeYFlhrKx8EGqiBDF5boyMaMA+gA
         uqWdiSau9cYn2uB6hLxhBs0zGYqTigvkDHk0WY3qgR8mUHaKtvWEVxUIbaKzEifpA9nJ
         ZHUxFznBAZav5pMyxUUFfb3G6AZh3QdV3DzhY1AVWUCXaWwLa7ZFNVOHtTZhDpnP93Ju
         cb2At8v4HqBJvZ+jb3V/3tK2Fcg7uYlG6IanY/QIdQMJTR/jnh+ufho8K1LyXVUMIM74
         7TM9Ego2G4O3D+qouE3yGHUUP13Y3iIEjeDT2GpYBDYR76tdELCIXWwI9QwbSNgBac4i
         Jo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762327524; x=1762932324;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBCEYpPk6nDrVD/DXvDSlhdXPOYf8NnBeJJnqXSBeoA=;
        b=NHP/LrjkXWNhq2JAnb2btpRW38gvnKSehSWubwY00tXV24a02wCIZaGnW/PLoidL1m
         DAY2o4Hd39u5kQag4u+hNzoA1FOTG7QeYPcaNrBUieBbeXx34gagy5E/tbf7P9sFOdZi
         SmDcNhXu8kl3MHAYEkWAk4rjlRA0R7TamIZ0AcUdSsQT1cLmNMQsw6ePe/CmtaqG4whn
         aJX5V1f1d4Ej/D7dKmacucHmAfm5Cd+/BHRjLQwKST5TMUtb7XuT9Aosay6LgHnG6Yfc
         Q7nN1tnfae7CWRujkhxIdrGGIEns8s4FaminYGeBByeFFAP7xnbny4Bzq2OAYeDXax1H
         IPdw==
X-Forwarded-Encrypted: i=1; AJvYcCU1fbTtzBmS+8xgfBsehTlxhAsBTy4aQTwj+AsK/R402vLJfUXm9rFFnT+YMIF+RI5sidmsDRXPPnNzi53CXElv@lists.infradead.org
X-Gm-Message-State: AOJu0YxswXKAsv/U7pnQvMgKbc2TIzfqbB+vjgPLIOU0ODE+ZO1Niapy
	kONLOIUYKns2t8ztSuFZQUwH06rpdtjsfeJ1G1JC5eLb+q1iW+zjiBINwb/RB5OnqCA=
X-Gm-Gg: ASbGncv62caQoig7KcWDlsen3q5OgR/Kh0diHhN3iSU37Tty0vQ/rjSFK259uoHfGTZ
	txY3/aDf/v9Gd5IG/4pOGxwTeDNYHpRZkucCZVNLeHPli/D+Kr+5A/0ka/my/o5ygO9AAk9gFDh
	53FLijW+VRrhczlA+2dwd5xLymBaj9EKrKlHMRQB+Xva5UatTd5V2R4FBjP+fwsASwOEIFJe/MF
	Ofhb4Abj2Zq/NDsUNJ9XQhsla/BLGPppSmWG4I59mmTJMFjk/VRSJoWTtotxnhuUJZoPIwGqV3E
	8f5gS3Gfu6BPDfiDrLG1Wr+iOaj+Qcw0ZpvCuhh3v8KZPgVBtNwL+r1aRbZr2XS26U8DNWF6tt1
	x1XztJ2zjnsfPkabdiDZKbrrRIy/dcATK+9pJWH6Sw6T59aHxAVLQ8BskFCvtT8bMls/aVon8Zh
	Sxuyh5oYhm2QXQEpWu
X-Google-Smtp-Source: AGHT+IEnjtguPuZ2sKAErgkJCvf8b73YR4c88V8qvFIT7wye40P43wR9p106dk24VUSPEEUbZI5zSQ==
X-Received: by 2002:a17:907:60cf:b0:b71:a627:3da5 with SMTP id a640c23a62f3a-b7264e1235cmr109681666b.0.1762327523668;
        Tue, 04 Nov 2025 23:25:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d6f8c5bsm411534866b.20.2025.11.04.23.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:25:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031-exynos7870-drm-dts-v4-2-c1f77fb16b87@disroot.org>
References: <20251031-exynos7870-drm-dts-v4-0-c1f77fb16b87@disroot.org>
 <20251031-exynos7870-drm-dts-v4-2-c1f77fb16b87@disroot.org>
Subject: Re: (subset) [PATCH v4 2/5] arm64: dts: exynos7870: add DSI
 support
Message-Id: <176232752223.13426.17010346252705230831.b4-ty@linaro.org>
Date: Wed, 05 Nov 2025 08:25:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_232525_929645_3B42D827 
X-CRM114-Status: UNSURE (   7.77  )
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


On Fri, 31 Oct 2025 00:50:16 +0530, Kaustabh Chakraborty wrote:
> Add devicetree nodes for MIPI PHYs, Samsung's DECON and DSIM blocks, and
> DECON IOMMU devicetree nodes. Enables SoC support for hardware to be
> able to drive a MIPI DSI display.
> 
> 

Applied, thanks!

[2/5] arm64: dts: exynos7870: add DSI support
      https://git.kernel.org/krzk/linux/c/fe02894a1930c85e542e5dd2044e6a3afcf717a7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


