Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4BDCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5BpttAHpJbHjU5zlElKTAX1nmzmhusdG1v06go3DFc=; b=NP0XKG+O1jIcvJT+GfYRl1elU4
	6oCpTKmvOuQutf97PTTEDPIExPKo3FcNcK9DgAQ/R26m0rFYjUIEzndPAURpChNquXYJ5krskmPrP
	aaE0SZV8EMdR3XrsurX85t83UquJexcR5+lUTjCJi/q5mb6KZLE0v8EqxT7Gpn15RgGJhhkwMq8w5
	N+OaZ1iotaNa/4JMXxzYlUqVXwZ2zf38VTzIpS7oOUjNUC0CDPQDK/mgNbO9A/9mjjudE18aEs6v3
	Z6wX4PjwNseKSBA2vP2tFWKOrbXp08/ak89iiF/otv3duS+aKqLr7wwBoVuVSutK9L2jAh6UO2wDQ
	CcxurzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfN3-000000012mX-1AFe;
	Mon, 08 Sep 2025 17:09:37 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbT5-0000000HDG8-0qvD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 12:59:36 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-33c9efd65eeso12773801fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336373; x=1757941173; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5BpttAHpJbHjU5zlElKTAX1nmzmhusdG1v06go3DFc=;
        b=g3XRc5r2mUa+/fwBX+fXeFjvj+Ygr9TI8xgNgYZ6ZVbgzdlkL3CjjLHpLEOZ4NuMO+
         sTB40aO0poX1IUSGAnow+r2t6H0U8KJ42ASHCZc3CSzqTzO7TyHmMQv3rTmALHbM2Gt+
         zRNkaK+M6TFFewe8tt5u+RA5CO07DfSbvFrVXSvleGI0a+ghINpuIC0ZRS5hefHBomNT
         WEDvtYLoBH/HYPOBl5LXFqkISMU1TJZlyX2IHqY0b58wvsQ4G5LeTsbCCWQ8W1zeOUd2
         pZ7vRDAzZz6dc+7A55PJ2lChg6Ow4AVh/kkRu7xYBCIAQmWmhN4Kg6Vz1jukM58t1bxD
         5PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336373; x=1757941173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5BpttAHpJbHjU5zlElKTAX1nmzmhusdG1v06go3DFc=;
        b=uROm2q8pKtWRNeMunzfbuxTCCURzotgg6m2+7ajELNVMIiA4XB1GT9OnR74l9zfwzK
         JcoTBsamqjwWF/C+bTPk0nzkDmFh/cwbhm2UfJUL1Z4AUOQ+z9qZVWGqOz5s0ASGWktp
         nVvkWtKvg74zaarOugdYWGQJLJASCv4AzXoNY4fX5v/AAOEXInz5sNJNXtolkNxF4mcn
         pwbKlhDRxhFBBXk5MItvU5Gub8XHUuYURNWpR3i3NGJqNSKZevM4BxUqRBq7VH3UiuXL
         BiKriBaUz5OQcgvTRBMdzw8N4DBEImfZe89Ak237zRO8NPaZWQGEBw1/9sOyJgYPyhqn
         tocw==
X-Forwarded-Encrypted: i=1; AJvYcCUk3WhLFdFEg/tiRvWKrocVFXeCPJZKUdo887WY2GP88vHe3hGuSLY3xtrLgF6oHjsx1akPyZKU/m2KCxQGV2nx@lists.infradead.org
X-Gm-Message-State: AOJu0YzyMEdileGiW1OcfGWb5noA19AI4eCi9zfR16sp1AMx+1OML82B
	hmXAdR0xlVmh2809g5vuE38nLqj1PkLFwCYMX8WAV7cz5KNJZlNU8GPiP/BmEHaVHxaOtr/ARcB
	ngB99yzFn1kwDQXVy7N3q8ASuJ4BPUoxmzhgWIBTlet+csiGPdtGV
X-Gm-Gg: ASbGncujdu/3v7ysGKlyn+BIBzAC1kLPH4IdcfHdfplGVwK3DokFW8nzZF9SEq2NZRw
	WueAn17vCZLIkZ/eg/jU/5lNmT9Agi19dqEZcWNNBRiqLfcVrhX+pIYQ7Bzn2PNlDyHohBX965x
	Ag5hu33SZcMZzPSa2cG8+b369vW4xebunBlYca4KnXARCpQ9g+5I9qPNMUmPHCVL0P7CXw5fIvy
	ExI18Ir/YpJKfAQlBALxKQ3vnEJ
X-Google-Smtp-Source: AGHT+IHxkO5Trw9x8IQx8FMGDMwnUY1eThHnZXuMivELDVJEriHgjq/E/h355l8gaJCNCLOfPlh87yQTWfxAaUQ+yRQ=
X-Received: by 2002:a05:651c:542:b0:337:f84a:6ded with SMTP id
 38308e7fff4ca-33b5fe33199mr21312101fa.40.1757336372950; Mon, 08 Sep 2025
 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
In-Reply-To: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 14:59:21 +0200
X-Gm-Features: Ac12FXwB3hkNayk_jKlRJHBwnE7MZt7LhknFIIwvxH7yn6EzRdVpugXhQZOilew
Message-ID: <CACRpkdbzEmZN=-FPvax4z_iq7u6pHyHGJ213QtpxqFL98-Ou5Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in rockchip_pinctrl_parse_groups()
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_055935_251156_A40EDC50 
X-CRM114-Status: GOOD (  16.38  )
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

On Wed, Sep 3, 2025 at 9:49=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru> =
wrote:

> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
> "rockchip,pins" property will always be present in the DT node it parses
> and so doesn't check the result of of_get_property() for NULL. If the DT
> passed to the kernel happens to have such property missing, then we will
> get a kernel oops when the pointer is dereferenced in the *for* loop just
> a few lines after the call.  I think it's better to play safe by checking
> the list variable for NULL (and reporting error if so), like we check the
> size variable for validity further down...
>
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>
> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Patch applied!

Yours,
Linus Walleij

