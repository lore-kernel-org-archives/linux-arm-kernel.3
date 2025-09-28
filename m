Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE45CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3c7FouKL5skROTw/0AZy7/egEPuFd8LTlkjIptlo8M=; b=tzkF8Wq6ce4re1icxmVrlpvlai
	Ly5wKRxb7//LD0nRbQJ3Tg+g5YK+4uRJxbo95FGrB3oY+zVivQJPOpWMCfDpwSMlLC4Jm1KuGRrnL
	Efchia5WENfUJQoXiGTpIRInFazuIqbxgtTWpsv1jkLHEmZbAxIAhUIHwwwZHFURVh1ppihc1hWVE
	LRmOmqYeq1N5Csowi3CPAs1TNdrPJOunhagH0cJFUHhi5oMWG3N+Hy7lOTONLOsDxGq0oqIHgho1v
	fSy4hM3TEI3FH8jvXJwEublYrCHVLadK/uqUgRt2E/hXM+auF0i8HECrc5NWcg3BSnYXxAoGQIRM5
	JWri5Sbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2m9i-0000000E8OH-37ev;
	Sun, 28 Sep 2025 07:49:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2m9h-0000000E8MR-2C8r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 07:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5B666210C
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 07:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA5EC19423
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759045752;
	bh=j3c7FouKL5skROTw/0AZy7/egEPuFd8LTlkjIptlo8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TH0tUPNWOXiE9Yp0HNfjHiCRzHo6Xl8G3gaMO4RDp2sCiKLgFUhIt0HG9LxAgmfQO
	 U9ppC8IzQVY/xYHAoNSHkRqF7Rp+07O4Dc6/pVAwVazYaxKkV96kIrMP43Vkml2VGS
	 3TuHYQi+n2bHCe41nLm1h1w+yBMGnpudw1aoe3wHOVkwueF92loin9Yb/z0Ctbf5Oi
	 V2vcZ7tk3RQ+35l3gbvR1p9MzopeJ5fTad16AiYYUibvnzLUp8m2ctMdz0stJSfKFB
	 zbV4FQ1a4kZYzyop773GUltVKgLn8jMoRTbo6p3+qvvRUf9I97KZpBfrwlbDf70kXi
	 9QDa8cSECKbdA==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2680cf68265so30731985ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 00:49:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRKWuEDgrXDyR+fMeHXdqnINWxLVTidpzlELqdVBAqbe2VcH7X5NmxlT/wL2HqxYv5zxiiPs5uQq1l9Ii7jLOv@lists.infradead.org
X-Gm-Message-State: AOJu0YwAdGsezaW1DsMeiMa3wTSb2Xyx7vUhwZCfAENQmC6F8pAAqVW2
	YpwzJS3X1vXay3yqeXXo1tyg978nx8/5UTw+XuY2+1zbhOuZGVc9vIoCUD9GES3cODAhzhUM8Wu
	yC5R4+VfvucoSzA6jn1h/FWAKBo9dkWQ=
X-Google-Smtp-Source: AGHT+IFpUdHB/+CVUZHfkEdJ2POKP1ak1+lRPx1y5PN9kbJW6f15ZFTm715q2PK5y2cB/xO4zd6cpfsv/m5ADSjkezo=
X-Received: by 2002:a17:902:f708:b0:27e:eabd:4b41 with SMTP id
 d9443c01a7336-27eeabd4ef9mr90231205ad.7.1759045752063; Sun, 28 Sep 2025
 00:49:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250928070419.39881-1-make24@iscas.ac.cn>
In-Reply-To: <20250928070419.39881-1-make24@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 28 Sep 2025 16:49:00 +0900
X-Gmail-Original-Message-ID: <CAJKOXPcFzHYV0YWmWqA_ZoMBFyNSOjizBJi1-qLR73dPO0-qtg@mail.gmail.com>
X-Gm-Features: AS18NWCp5rbiQcjWZ6kRZR2AsSbwoNU0TngRkgKvQDxBcN8z2LXAnpJLBfP7Ulw
Message-ID: <CAJKOXPcFzHYV0YWmWqA_ZoMBFyNSOjizBJi1-qLR73dPO0-qtg@mail.gmail.com>
Subject: Re: [PATCH v2] soc: samsung: exynos-pmu: fix reference leak in exynos_get_pmu_regmap_by_phandle()
To: Ma Ke <make24@iscas.ac.cn>
Cc: alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	peter.griffin@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 28 Sept 2025 at 16:04, Ma Ke <make24@iscas.ac.cn> wrote:
>
> In exynos_get_pmu_regmap_by_phandle(), driver_find_device_by_of_node()
> utilizes driver_find_device_by_fwnode() which internally calls
> driver_find_device() to locate the matching device.
> driver_find_device() increments the reference count of the found
> device by calling get_device(), but exynos_get_pmu_regmap_by_phandle()
> fails to call put_device() to decrement the reference count before
> returning. This results in a reference count leak of the device each
> time exynos_get_pmu_regmap_by_phandle() is executed, which may prevent
> the device from being properly released and cause a memory leak.
>
> Since Exynos-PMU is a core system device that is not unloaded at
> runtime, and regmap is created during device probing, releasing the
> temporary device reference does not affect the validity of regmap.
> From the perspective of code standards and maintainability, reference
> count leakage is a genuine code defect that should be fixed. Even if
> the leakage does not immediately cause issues in certain scenarios,
> known leakage points should not be left unaddressed.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the typo of the variable in the patch. Sorry for the typo;


So it wasn't ever built. It's not a typo, it's lack of compiling, I do
not take such patches.

You didn't respond to my review, so same comments as before.

