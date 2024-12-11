Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8989E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDZY2QeYHN/iyr/49RZQKSkzZE163jbKdkdUiW04MRw=; b=gfZzQwB7wbr9LfF/gb2xPZykKM
	Zl4DZNqBJi7NQWEYPlcEaOMh5XOla/co+89PD0QHNJMZhbp2kxeLzH9NhEpfvbnfTDutiYv5yEqPd
	cx3fsbOYpalB9RzoB6rzHb90Vrfj5kcrudkqYWo4Tj+C0iLsjyJkubfylMCwi0z8T6OzCH+foS6LM
	SevfBGOy4/b75T5FlEpk3/rhVcEx+Qt0x+fi4+9IyfJOLtvYW/sAlZHBFNqhDgFcA+MSSldiKj4V2
	Y1Gr+BosfF2Hp+Qz2NyMzyogalkZMgQpNmY3ik7hNzRjMEbX2D9iFHtIIhjZAWVY8r/c8Coy4cfJK
	eW4Phnhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLcI-0000000EnR7-2ZeO;
	Wed, 11 Dec 2024 12:14:58 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLbE-0000000EnKO-0rWh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 12:13:53 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3eb4ac63dc2so1738954b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 04:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733919230; x=1734524030; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDZY2QeYHN/iyr/49RZQKSkzZE163jbKdkdUiW04MRw=;
        b=gh/yDaPo9wqCe2PEiQhWkD0pOewi68RkXSqFlch5JBDbVwstftnQZ0ruvLp1ClOKrY
         nsUYCZuhCRH7t5uNY8WTWZkpq8kbnTCTdZyajV6UmGI8rc1t3rRVmQGv0jUZjZkuXSW5
         FLOSYIu65klIG6Bc8+jPaB62F9wJWlYium8JVdTDaJ+bZcbjs6zgxpjRBnfBKCtFua3z
         iiPjZQa34FMBCgwwVTixy+BF4D/NR+87xE2QfFFXPrOQwKuztLuNFZrOlvfSoDp6eIwU
         peHOJoFVHfNet8PE0u6F56l4CalhO8hR739cyd72yoTWv5nFDNVL+yeTlMqOyO4mBQrp
         ZlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733919230; x=1734524030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDZY2QeYHN/iyr/49RZQKSkzZE163jbKdkdUiW04MRw=;
        b=BNYx7rJwZnORVXJYbq5b5fuWQJKK+4kt/F5Q0I6NxAeavskSr939YUAabbkhKYZBbb
         cGUAs3P8/eTqOxIWjPg4EKKQC/sdkp/Lp4K90siW+gW7JxpNEwDpPfinAXTIWaCkQmXb
         LhBiiWS31ko2ltBKbJlEj99Z1MN+PoACFmEwY/VjLV4G2gA0qgXOruHflWOJdzFvvlvr
         bBoPetb77kCShh51F3H38iUHUxx5t3x3J0Ej5cXuJo8370n2YXqc+152OIPoVvt0cvpS
         1Ma9l0DYRUiUSOsVKAVHpx73g6WxuIg9Hd8IA/vdnzl3r/PI0sLhiUvKv9Ht8FWwtXFO
         jLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuKVmkvA6t2T8HvAZGlER04QzF22APGjqmSnU3DDhcENUyXzAnZxtbDMNGJxWMv1fsVSvSdA+o6Y9tPesuvAdJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyrcwBzzuoO/M91rfWxOi4ilzg85RJn+VK32759508JrELkP5FN
	Rlrx4dli3UHf/ND7aULs9gSzYnodV1jXig9Yl7+je3yDdBmWNynhHmmv3vhuU3zslXQkeOB5Gtt
	2Gw2+IzjsOTPgI47jK5sDBNxb5hT8XeFBLyGWcg==
X-Gm-Gg: ASbGncvJYy7WHNLUoxChLKXea4LTiyNdx7DNZOQPWA8O7o4iu+mb+rZttBW8/xCE6HW
	6dTvpKka0bAGSb8EnvfGOCOu4K2WkQWt7BHA=
X-Google-Smtp-Source: AGHT+IG4lAagFo6z1ppiAYrOC7C4TN5pY0zUDuuH3woRWIw4oGjlKvx5/ZHHH9rcjl/Kqtx3EgozCxAjSqTP69gAblc=
X-Received: by 2002:a05:6808:189c:b0:3e6:6097:847d with SMTP id
 5614622812f47-3eb85a8b199mr1689009b6e.7.1733919230314; Wed, 11 Dec 2024
 04:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org> <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44> <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
In-Reply-To: <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Dec 2024 12:13:39 +0000
Message-ID: <CADrjBPo_YmTuuW9c3LtWzMp7Sf4365e2bxuuYBUiFPPc42d1dA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	javierm@redhat.com, tzimmermann@suse.de, vincent.guittot@linaro.org, 
	ulf.hansson@linaro.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_041352_300731_4A74A9F7 
X-CRM114-Status: GOOD (  20.41  )
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

Hi Daniel,

Thanks for your review feedback.

On Fri, 6 Dec 2024 at 19:50, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 12/6/24 14:28, Krzysztof Kozlowski wrote:
> > On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
> >>> +# SPDX-License-Identifier: GPL-2.0-only
> >>> +
> >>> +config EXYNOS_ACPM_PROTOCOL
> >>> +   tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
> >>
> >> Given the importance of this driver where a lot of PM services rely on, does
> >> it really make sense to allow it as a module ?

Yes, we want the option to build it as a module so we can use the
upstreamed driver with Generic Kernel Image (GKI) [1].

> >>
> >> Some PM services may be needed very early in the boot process
> >>
> >
> > If it works as module e.g. on Android, it is beneficial. I think the
> > platform was booting fine without it, at least to some shell, so I can
> > imagine this can be loaded a bit later.
>
> Usually the firmware sets the frequency to the maximum in order to boot
> the kernel as fast as possible. That may lead to thermal issues at boot
> time where the thermal framework won't be able to kick in as some
> components will depends on ACPM while the system stays at its highest
> performance state.

That isn't an issue here as the Pixel 6 bootloader leaves CPUs at mid
point frequencies during boot. I would actually expect most modern
phone bootloaders (since the launch of GKI at least) to do something
similar as it is a requirement for Generic Kernel Image (GKI) [1] that
all the SoC drivers are built as modules.

[1] https://source.android.com/docs/core/architecture/kernel/generic-kernel-image

Thanks,

Peter

