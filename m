Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53218CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuCTw4yV6Lx+mbqkhVL7mJV07b2LekonyidkurcSnFY=; b=qoZC5FSZ9NfvHPztid4CwepNTh
	zAxa3kjWp5mFE16QWQAJNdobzF6l+BVZ+D8Kkkg3MwkgW8j9ScwsfQAT+qE0dz8sZAK77D54hnYG3
	RC5ON5YQ+rzHds/d/Y8gPOp1BabRVQsw1OzA5Hkiy2cSBy3ZnvV2QlwmQqrPrHIrjPKbWRCUCx7Iy
	e7JmCxd0qbK0ZjdopwZ40Yvf2YzWxPTYyC8Bisefakg88MqlFt+IXzvU9ISE3/psZwMDCagMnmsHg
	YqzbuGaFWvPXqtDSh+bZXi31KL7slQY4/NDZwEf57RJiY/6NTGaYpbQvy6SftqNqR3jnAoxLKRBlI
	LZA141Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zyK-0000000D1kn-0Ug7;
	Tue, 23 Sep 2025 10:10:08 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zyH-0000000D1kB-2d84
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 10:10:06 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-62184a28eaaso1033341eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758622204; x=1759227004; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QuCTw4yV6Lx+mbqkhVL7mJV07b2LekonyidkurcSnFY=;
        b=TM4NermM6p5xrkn6XJ6mtRaBZitsrFZ99xDnCJNh2SpqTD/sZXW8xBWUxLn9CxIR/i
         qf2X701Gm2oZbfRRWHgD4ewaZB3bEz6dwOld4pCmsr4EFel92jqRXob9HRrCbq5bQSj4
         65N8Rb2iKbqzYTajujPSTEoKmaaVa4mFqLHLo0agwNw9hwbFudvQ2WQALCk158clarYG
         +fjr1fNWnO2SzErzzttLlJsWlVBXYZMOHGfYsuUykM14lC4/ORBZB3fB86xxR4jW5+/Y
         FIVT38wF39UYxgUyZ2K50XVIQSjQnoUDPj0+qvlub2HwB5hxOPkZD+eknJ16s9ZjrCLq
         koxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758622204; x=1759227004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuCTw4yV6Lx+mbqkhVL7mJV07b2LekonyidkurcSnFY=;
        b=MOURYzx6Cg51mZzZEK+fAlfLloJKbuPDYScyV5C3n5t4YxFcFGNCoukETVFS1ICqie
         +krXOiec3ZtWsRQO1xLjf30BBZwrVMvmOCZyNgpY+V0fZJFbOR8yE5AuKgTy8UXGtznA
         BIndjTFIVlgolbLJHluVY6T4FkVtBGzozby47/21Dy0xrEoy+paQEr7X4pCfUelx3Kgp
         ZzvSLL7vCMSOULEsUQckMNatc/qI2+4owr7G8wh5hf+aoVSkJYcPDOCCfdnnXBBkxZRa
         0tVVuAnl2ecibJTN4HOEynN9uavkmGpjMu+pLaZIna1rXWvmomw/WhHNZhXo/ewOWp9u
         948A==
X-Gm-Message-State: AOJu0YweK71dpScVGbdrcZyLmobkI7G6CAE0Au228WWYug+Az5OM6fi5
	I6GkC8kpKZgJQ91jyhBFHwUwAGN2jhAEZo1IRXcU+S8jTRmRcouBgb4N0WDWr9Vpe6DfvTtfWqk
	DQwnb90tL/bjbRjvyyBpi1Vw1D9LhmKI+tVtXmHjx7w==
X-Gm-Gg: ASbGncs+zIbhIZRIXXSdcF3wq2PyIkHm6lORj7O5nWq1tt6SPFQGynU5pi9ptS8w5OQ
	IVDGQC9TFCXZnnOUXk3RCQ0mICdP2QGsEXI9UlA3GRHSFlB6nOk/iol2kx0yW/tNkCoz2cuvMC1
	F20LMVHonLCW67SYwBd84Ir0f6G+WDFyiozuRr3KUn0IGLuD2kq/1WuPgipC8Mj2shCcply7Kom
	63A17s=
X-Google-Smtp-Source: AGHT+IHlyhTrDpT9bOGms9MVcAbGBmh07wgn5vpz8u/HkSK1y5dEJI124GNG+UXQ+XT2/QrTB931J5v0hRlkByi3RVI=
X-Received: by 2002:a05:6808:10cd:b0:438:27c0:f1dc with SMTP id
 5614622812f47-43f2d45a7bfmr683558b6e.44.1758622204146; Tue, 23 Sep 2025
 03:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
In-Reply-To: <20250827102645.1964659-1-m.szyprowski@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 23 Sep 2025 11:09:53 +0100
X-Gm-Features: AS18NWD1p0hcePHVemPfV1t10goYXuv2LnsuxG6hiqD1cQfraZwIk9uBaFkxjm4
Message-ID: <CADrjBPrJTKSLd4JCR1MF6UeT1-O0EP3dSg3Ba3eibsh-u64eAg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_031005_683778_5F1C403E 
X-CRM114-Status: UNSURE (   9.62  )
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

On Wed, 27 Aug 2025 at 11:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> For some unknown reasons forcing percpu interrupts for local timers
> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> flag only when driver is compiled for newer ARM64 architecture.
>
> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

