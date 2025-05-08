Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EEFC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltr3kPU8Ou7XLMkgW3sKce+SE31ag1MbahmNgvMMJHs=; b=w6mIMuB7hCgYKfmRbXo0UVjJ/9
	QEOarQmfmQCTJvL5D8N8nfueHHRVME1sni0Z2DLgtw7m7BVBhHhC0PSerxjckYFQMs8kMf+Eh3OAd
	WMfCoQX9XYsHMvZfZ9NOxlYNFeC9pUeItB2ZA5WmO1quVu6xqIQyycotCUkR9sivEewGdQUgXAVBo
	apnN9nW/+BX/oSHuubAtXi5o7Rqo/sIHZ+/ph7JYz+abHaEkGt0r16wAZx4IroWII3Yl7MlVrFVa1
	0udJA5EWSefQ6FxQYQj4h5skaSkIuA0NpaZHc4hayLd3Y0Unxw2USDFGwsznS4v8DCUSwfhz1eOg8
	EnIifj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzaf-00000000VVd-3tHg;
	Thu, 08 May 2025 11:39:01 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzYO-00000000VEg-3L8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:36:43 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so202351666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746704199; x=1747308999; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ltr3kPU8Ou7XLMkgW3sKce+SE31ag1MbahmNgvMMJHs=;
        b=dDSof73Pi6vk8QrxnS3MfUjvvMLFBkA0EEaGauLBTnTWpiY02gPZkM8TKnZbcDbuI9
         YUzRy8DqOqBuTkwxZ7gRBup5GgWkeprz6tTaCG3aCLVFwRTf1eA4KJ6Kw7HNc+KCpupO
         A5cOKK/2h2xu2Lkk096Su37uq9PWlL7r4Ruj+HSUbuYGNgQARpslXfVJrwr2T9uYPGkv
         UgmU4gdLaF3xi4dutFo8+yW4Tsyd8taZv+leMRiiMgTLXPY+v1LxzagpPdG7qwy+pUbJ
         eM8QppTQFUnAB6b81q5XkpSaI2VmlbpKKtQScrJqsSrCI9zxR4dm8NLqYoRTRksF5MzC
         pXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704199; x=1747308999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltr3kPU8Ou7XLMkgW3sKce+SE31ag1MbahmNgvMMJHs=;
        b=G/Pis1T+sKl1VzWr6O4SthfjvM6qlWOh3pYAyjw4Vf7+pOcn+Dl7T1CFGQNczFWiHx
         xk61x909T0TfwmMj4xXmqaWYEunzhZyAXCFqY12duz5Gs+iVjv0Ii57bNEhoKhtfsseR
         lyOJWIb6cXDN2QkB3fc7IWX1y1SKeWbdcud4KPg3eSCJk+AYLPLg4QtJ/nEeZk9PUsLM
         hAWOXe4tL5pXRms0zU1E9K1qZBVK+kPTNKwt+bDau3NG/EuNoUgy1WFaR+APO/S2p8i2
         2TCfrBh02ZAHXVJxdSkKTg3f2cZedFIL/4A7QwblfbxnHdpYHAuT0/NWQ/EsmGW+in+m
         cXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEh5kCo9086gtkIEokt5J4RLNHkhVjieLPgIeR6WNlZ7k/RRuj8yI8wSOBmbcuRQiFkMe173rth7RuvssnAPT8@lists.infradead.org
X-Gm-Message-State: AOJu0YykpphLveKxdUyiTaQblQ608AEDeZTni7t9qjYgK3WwbQJJpCAS
	E/kTUkUhiAWaQ363GH5Gk1MjDX8m4wDV+4r8Mi1RwO9AKVQlXLnLYcquYymDRf4vwkufEg6wMfH
	EU73C/1fDMjJfVfn0/viMoeab8Bc=
X-Gm-Gg: ASbGncvK7sPTR2SJgW/EdxGMcKF0U5Pv49Tp4OyjN3Zec0uH54pCb9AYw3ZylLK99QN
	wTlz152tvFSVV0DTW8AFmSqkgeJji2NT7GNdEua/ilZStsQNDuCkkTQOGVcq49JOQfqIxp9etgN
	Q7wjiBPsi2K7NwrUU2xyyo
X-Google-Smtp-Source: AGHT+IFRb+7ScKez83qOuG4N6t6qIMEbVcI1rTEw0gYhc/qxLVO0dIAsrm1I+vwoVva6auYEZdGL5jWG49v19xFXQlM=
X-Received: by 2002:a17:907:9715:b0:ace:bee8:ae0f with SMTP id
 a640c23a62f3a-ad1fc8da3efmr281177366b.1.1746704198687; Thu, 08 May 2025
 04:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com> <CANAwSgSXNuNFQ6RiqiLEBY3eCmxz2hQYfWTFij=Vi8S7rS-_TA@mail.gmail.com>
 <97cfb30a-daa5-44de-ab29-f20b35d49d72@kernel.org>
In-Reply-To: <97cfb30a-daa5-44de-ab29-f20b35d49d72@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 May 2025 17:06:22 +0530
X-Gm-Features: ATxdqUE4hoONrfJ6klWGqObf3kEkWmvGg_F19UdLU4-d5Z7kZ2HdPSVuUXBp08c
Message-ID: <CANAwSgRLAydhpsF4kASBjeSw3QEVcCBGYk_tSgLAGHGSLQJcRQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_043640_830885_D20DF215 
X-CRM114-Status: GOOD (  23.45  )
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

Hi Krzysztof,
On Thu, 8 May 2025 at 11:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/05/2025 08:14, Anand Moon wrote:
> > Hi All,
> >
> > On Wed, 30 Apr 2025 at 18:03, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi All,
> >>
> >> This patch series is a rework of my previous patch series [1],
> >> where the code changes were not adequately justified.
> >>
> >> In this new series, I have improved the commit subject
> >> and commit message to better explain the changes.
> >>
> >> v6: Add new patch to use devm_clk_get_enabled
> >>     and Fix few typo in subject as suggested by Daniel.
> >> v5: Drop the guard mutex patch
> >> v4: Tried to address Lukasz review comments.
> >>
> >> Tested on Odroid U3 amd XU4 SoC boards.
> >> Build with clang with W=1 enable.
> >>
> >
> > Genital Ping!!!
>
>
> Huhu, nice. :)
> I make typos as well, but some typos are better to avoid. :)
>
> Anyway, !!! are exclamation marks and I think it is very difficult to
> scream at someone gently. I think this is contradictory to itself, so it
> does not feel gently at all.
>
I did not mean anything harsh with these !!! marks.

> Plus you sent it 7 days ago and you are known to send poor quality,
> untested code, so just relax and wait.
>
NAK - Do not merge these changes. The original code is in better condition,
and the proposed modifications introduce issues.

> Best regards,
> Krzysztof

Thanks
-Anand

