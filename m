Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F62C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkZltZOQqnYsCEsxFuK/qAjYLT5r6t+NrYMqhOg1WBw=; b=Hj02+kSMiNP2JaVhvWr81LHpeI
	SMUGpWFUlMdwjHK+t9QhpaovSuC5QyIr7wRnO1+5TP7/LBYRMcSKts9Eb5zYgahD09BFbbnrGb8CC
	K4R0n3/mm51rmZLsiMZ1TJzKB5xkv7+EJJwzknqNI+3PwuFYbgsnNXjjkY6Le43GzIjoklBeP0LFq
	ZXPPVcV/CnSu9H/3gQlvzOetwqUYLWC8Hdomd5V/uNfoM2Yk4Wj6kgjBcSzo8Rz5QbPa58F9ccA2l
	kjA4hnp3xm0qwMkgQ7Tuhz3rlGhZKa60rxJPtEWcV5xCDS1vzleDovauFG6Uausd2oY4dLURMf56J
	Dz4jSvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuYy-0000000HRur-2Nec;
	Thu, 08 May 2025 06:16:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCuX1-0000000HRlJ-1fVz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:14:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so73114766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746684894; x=1747289694; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkZltZOQqnYsCEsxFuK/qAjYLT5r6t+NrYMqhOg1WBw=;
        b=OBmOK0pEIZfld6Jc/fWWGpGD9wGLJ9ensgOexH7LMgoULrhcBQWM6NBvlhgU4vCKbr
         9Y13Zd9d5wGCT9nzS5kqWv6/i+/iZbpAfLp67COo+YB2Wli7mxDvPX9rttvExF27JmVA
         A45bkKP3GdS5tmGcIjMmg9V8bxg2obFbiTtXY6RBAhBRh8WywO3ivSRkXy/6/LVgXqMK
         MWJXolOwjw3QOifZ3Yc8WdPAnNYZPawTzYeGwNu+yM8Ixo7mLWMfM5YpYQw2hjswk/jX
         u4vWSmPPTk6O4xNofYRbEpz3HESEepsy2vsMYb9KwCc9bsJuck4eUWEX5mhjhHcpbPDk
         Ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746684894; x=1747289694;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkZltZOQqnYsCEsxFuK/qAjYLT5r6t+NrYMqhOg1WBw=;
        b=sJXZSuypO7lEb9MD1cFWuuW/cR2xoK198KbFg6Tf66jSltzhi2fnMj4V+8Ff4E8QFg
         8saIrogYPq2YZ1Ss5+Olv4hSoGaDeGGCj8XbpZAF2BtxIiklYSp3DrI8mTXkhb6NtuHx
         f3O9hMHx9myPJjbnVI9M6xIvpdLmr2gc5QGm+ZoV3gsjU31qD8cTlBAaxMMVCsCeQ9Ms
         6d0iba966MXbOiZWgC8lH8P7RYB2EHU5LQcytLF6p0pbiZgtGhnwESy36GxQiGFjnV16
         4ypMEX07P9sEhr3Ba8OWmxk1DV0jsOCsohn8SMz2MZC+QWf67eLNY2dpGrGXs4Odr0kv
         O8uw==
X-Forwarded-Encrypted: i=1; AJvYcCVnCFGSwpBCMwdI0M2xcHwvph7l202OnQqyKJ6JJpaLkjLAF+ijK2EvI1dU8h+WYKaLOj8AwGi/fEDvw9cUCj5Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2nVU8+cPXkGF/FF0+Ole8rED15NIl7KwCaymCQTMOOcM9DCe
	9+QiV6wdliT8MshTA++TSUytZZpf6NS9Kprh19vc5NGYIibQgR2cFvqyhnCXXYJeql84T3QTQK1
	SFOlgYTx/1Jnl7W9YPl5+2cDI3bk=
X-Gm-Gg: ASbGncvJ1I+54Xs+DHGMCPANk9N8jsWO5bFEOxGhNku+uRU5Vm7YyPZeEOlWu02XRiR
	RhHbMfL/OfNTvko0qucXO1em00OUwoasYiVpnVg29DvcW1BLE7nan10RINyKpYXnv5YAedaxtb5
	YtJA7YkgaA/3Xby4rLGxSx
X-Google-Smtp-Source: AGHT+IHwxIKpfiu4tWWg3RXYDruBytSXJ3/SIIjPMara76cnzmnUoPQULY0baE/CdfVeC/fMbdZDia8dnddDyX35xNY=
X-Received: by 2002:a17:907:803:b0:ac7:e815:6e12 with SMTP id
 a640c23a62f3a-ad1fe83286cmr181604566b.33.1746684893426; Wed, 07 May 2025
 23:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250430123306.15072-1-linux.amoon@gmail.com>
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 May 2025 11:44:35 +0530
X-Gm-Features: ATxdqUFnCUlYgpyjo3kkzKj_fP_Vo0jZohWv6em6rAowUWUDTJ21AX7A3N5yL0k
Message-ID: <CANAwSgSXNuNFQ6RiqiLEBY3eCmxz2hQYfWTFij=Vi8S7rS-_TA@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_231455_435234_D2EDC63F 
X-CRM114-Status: GOOD (  16.53  )
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

Hi All,

On Wed, 30 Apr 2025 at 18:03, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi All,
>
> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
>
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
>
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
>
> Tested on Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
>

Genital Ping!!!

Thanks
-Anand

