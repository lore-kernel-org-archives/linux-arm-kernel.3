Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72181CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=; b=L/zX0fCHDb2lk9ACfyxfEGPDBI
	FJdsw6wnExjO7lDwtUCYKPighEVsXuRmsv2165NP3mUQjwUQf5BvBfGmxJg/d5VzN98R8zdJJiPKR
	3Bz0ViWxB+ZzCpf96KVPTVyxFDsc8zS75RVZg2C67bQtLc4bHpXqDvPpppP7fdlLZEjxDXoctovIl
	1Buok6C38igMNv0ef8GEkcPK8KTybrnl7G1Jjgnd1Ip6gvTWQDchKZ6pbbR9b3hs/nUGJhic+FjPm
	ShALpvAbQBs15RBlFKzViX27G++fhnOmF/33Vq3rf49QqaIvJP8+Rh/j457SEIktkDyfHX3+nFITI
	i52RnvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaIV-0000000C6Ah-11No;
	Mon, 24 Nov 2025 17:24:19 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNaIT-0000000C6A9-1Rl0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 17:24:18 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8804650ca32so42003456d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 09:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764005056; x=1764609856; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=;
        b=ak2kC9EDxhjOdw/+XoRkHUaUi8G8ttpWtxFLiq0hpTA3VrkhJfcLAGdwhvjkBZ4h++
         USkAeP0woMGAVX+IYQ8takLE64xFdKzIeey6BESTruwnfmIn+B9rE6ZKG7nLCANEo/Vx
         fKQ61sBztYjs/wMPorJr9Wf10sGZFwsj/ecrXfjXWTiDjqZbZZy8L1Kw8omoo9p1TDXp
         AR7QARGY+OKfAtl8hSCNNLbEl3QHAHRX01KfpYEkBcnMPr5pH9mQs8Ljufqs0D12hW7c
         RrK2iUvZ97/lwDOv1QMGP/Ah9kn+naMRr7x1Writy6GhvYuA/2jQuh5fPW4WctvGQiFv
         HkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764005056; x=1764609856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwPH+P89qWOfRnemNosIIZCTQ+b7gKnqulQnrIBXs9U=;
        b=I5imPN+KtZNcHtEjtPB5VEnrAlAOaRhf5v3XeJIOaoti6yFKgVAaPsQ4cppWRK+2+8
         ET7u9P1ZHx+HNn96+5KFjBAG4tkLwzNFeB0NAqNh275Esn0yD3t8T42u1YvEBxnLPfgV
         q5Ctu3PW5x0qNzld75gDaxAsRi0aWa3FnSKBW/CDvmGK0bcnM7PYYx/UxEAPxaU2otRN
         urTFmZ6GuAkfz0wTHIURhey6RKlKoy0cp0oWxzEJbhiiSs//n35LfXPtyJXJycFK8+64
         R6HOd389jSq6UJeaUKpat+JSmhm/0yrqy2xlw0oCuUexOK1qP7X1c4oiagCtMscZVy+z
         jOVg==
X-Forwarded-Encrypted: i=1; AJvYcCUsD2uXCw0SQR9TymAoydAgosgPhIollXBAL9ds6zuLUNm8fimy9VN9oT/sZplIeJFOzp1Aos5jNHBcTHJHezKA@lists.infradead.org
X-Gm-Message-State: AOJu0YzRWXmLBgqHdquBO+QtOfJYVFMXtZcLe+tFTyKb+5FUlnIWMfrI
	B/qJuzp5bIQDexLQZgu/+B2XD8d/1pQTZOnkANqyQ5p5wO95E5hYjmU3kn7bpbEbRSoPTX6pi4e
	KCvw/anXeuph4yGuafPih/zOb3DKGa4pt2jq1zNBaH2ZZbl5Vgc88cXs=
X-Gm-Gg: ASbGncs4siiyyalRkj0Y/nZ6HKH2ZzBoeN2jjAoVFs3qUQ50Y6yXD6HEHYYAMAzP9Z3
	bvAOTrkxGtmT2R05bhJEZISo2xwysgUUQn6tb9gGqJh8yClS+CTOv27+1nXQZPG1nDTfklJet5D
	oiRDveGbn90cBh1VDSNeB/cRb+Okw0ZwR2W++Ol2NMxfef/BTrrKnGeaL/BYzhOULydD6/YvcMj
	FVuG2h5Eku6fjsXuakbqqMrjKbgRAu1LsoreRAvgxuMmwz81oNG/0/O5Bdf2M7xnHetKDk=
X-Google-Smtp-Source: AGHT+IFnvdWmjJCRzYLrbPvZGNPiEJ5Q839vHfC1gV/jBx6hNY1xoYFkx0yUuNsyMUDPM1RLCsF8HVzcVzBbZ0/NXV8=
X-Received: by 2002:a05:6214:3286:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8847c52771emr181588346d6.49.1764005056039; Mon, 24 Nov 2025
 09:24:16 -0800 (PST)
MIME-Version: 1.0
References: <CGME20251117073605epcas2p19eac6ba9cf1d4fd2e866e5de6a843802@epcas2p1.samsung.com>
 <20251117074140.4090939-1-youngmin.nam@samsung.com> <20251117074140.4090939-6-youngmin.nam@samsung.com>
In-Reply-To: <20251117074140.4090939-6-youngmin.nam@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 24 Nov 2025 17:24:04 +0000
X-Gm-Features: AWmQ_bkGzF2wniRoBjZTDbuGXNp0h_ztTCTVOwPYyYiq_8xUg5WYRfFqZfMc01Y
Message-ID: <CADrjBPo79HCUVsX_pv6EZ2_C5qB=pFMS=KMkMz8xkageuFvmAA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 5/5] pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com, 
	linus.walleij@linaro.org, semen.protsenko@linaro.org, ryu.real@samsung.com, 
	d7271.choe@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_092417_388758_B99341C9 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Youngmin,

On Mon, 17 Nov 2025 at 07:36, Youngmin Nam <youngmin.nam@samsung.com> wrote:
>
> The suspend/resume helpers named gs101_pinctrl_{suspend,resume} are not
> GS101-specific. They implement the generic save/restore sequence used by
> Exynos9-style controllers that have EINT filter configuration
> (eint_fltcon) to preserve.
>
> Rename them to exynos9_pinctrl_{suspend,resume} and update all users:
>   - exynos2200, exynos9810, exynos8895, exynos7885, exynos7870,
>     exynosautov9, fsd, and gs101 controller tables
>   - prototypes in pinctrl-exynos.h
>   - definitions in pinctrl-exynos.c
>
> This aligns naming with the earlier macro/doc cleanups (e.g. using
> EXYNOS9_PIN_BANK_* and describing eint_fltcon as Exynos9-specific) and
> makes the helpers clearly reusable by other Exynos9-like SoCs.
>
> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by:  Peter Griffin <peter.griffin@linaro.org> (tested on Pixel 6 / gs101)

