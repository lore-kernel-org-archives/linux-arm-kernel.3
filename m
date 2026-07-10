Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE0FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1Zf4djkyVsGdqHiqgT2yCHA+1xehfGqV1emcYl1I6A=; b=Vvr9ihqq4Flb8MjwVjv8iO2VOy
	Y2qgHPut1UhuSTAzCdNCJo6zyLL/n4eVBgfr4sq/BhwsCd+Zeuhzm8eTohpWosQ359JcFHKeLwlVn
	iDn1jvYmSf+z+LWVHsHoAVJoToHp/LVzexa/KSWLNrT9DtuUJRNKnxQmOL7K2BK4VtUmWWEk/Mveb
	Nad9sZ0RmxwGni7xGzhTus4ZuIiAgaMA+vDhnP/N6CXgGHMs3U6Gcow+GIvOQQjOhIqOXBgUi0gRR
	RZPHE3K65o+NtglZnmCgsdcUxwc0oUjCB/QgZrVPexNjzEp/JGJC+qLgoESi52cZLfidtB/WOrGlW
	cfMWQTrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHD1-00000005d5j-2vmq;
	Fri, 10 Jul 2026 19:48:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHCz-00000005d5a-3VRj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:48:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 821FA43C38
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C85D1F01559
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712905;
	bh=r1Zf4djkyVsGdqHiqgT2yCHA+1xehfGqV1emcYl1I6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KHubEODI5OK2JjTzLoacd+Xr01Bdn2djdhyaYl/074SiQhy7GiltXk3uOVmqYK+Jx
	 gaIBB4JvCVLuVWPwYbajMX4wyLMe20zpe2yvO2E3Zf+M/jCxYCtOb96KZAZxJygLu6
	 LdIjuylf2OpzLru6fOiYnIeUqX4b1688vkKDiuc/Clwpgiu9XPvMV7U6eLhfHANeUj
	 svnCfvd5/BhdvmEos+dlaiaungyCXAz4FGHwtAWGlWWynv1es0W6tunrIph+PFAp1c
	 dy4llZLsfp/AE70Xrsxq5ev2pLwZe9Z+2hWF2+joPs1FeVyde3GT8lRFUGCmZxJcjx
	 plVtsxTqbfDZA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b013084dc2so1033019e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:48:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrqpMCs52IJAqhEHiZWJAKuwzVBeXBXZ37qvdlOMjazbVHuB7cXHBQkz3g6LTM4x6jvQw4gF28eRfaABgxgDG/R@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw6JZ7d0xtaNoOb6dws16Ecze+U4l5lnOk6ge1BrU8phCRHTZ/
	cRUM535wVfBgyWB7NDB/EXRHNWE582C98slmqyB0JFGgsvKumoNKC1CgBcqUlskImBPO3yCOkPo
	JCINknZRgeRdaPbfpUTT50zD2ihP19/8=
X-Received: by 2002:a05:6512:2c0e:b0:5ae:aeaa:140b with SMTP id
 2adb3069b0e04-5b0236a5c9fmr98033e87.43.1783712904103; Fri, 10 Jul 2026
 12:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-7-55b305833123@jannau.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:48:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKYrW3LzEWj47Mmi7DYL=cGZNLRzbF3w91GTs7FBCsjA@mail.gmail.com>
X-Gm-Features: AUfX_mwDu5nHkfrpKW31EzIHDBbQz-W_XVTsCEkvJgwgFKC10BW3wqwVZ3eoWUg
Message-ID: <CAD++jLnKYrW3LzEWj47Mmi7DYL=cGZNLRzbF3w91GTs7FBCsjA@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: pinctrl: apple,pinctrl: Add t6030 and
 t6031 compatibles
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 9, 2026 at 9:31=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:

> The pin controller on Apple silicon M3 Pro, Max and Ultra SoCs is
> compatible with the t8103 (M1) one. Add "apple,t6030-pinctrl" for M3 Pro
> and "apple,t6031-pinctrl" for M3 Max and Ultra as per-SoC compatibles.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

This patch 7 applied to the pinctrl tree.

Yours,
Linus Walleij

