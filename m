Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABE6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=; b=WeACd+NhmX4+VP2OuQjB7tvxqL
	IWsw6DYlso6xIc2Ir5VhjCK3UcYYquajfDy144KHPTjs1bQ2wKq1GRZ/Gktl6+gslLBqE9K+X/LN3
	TW5T+advF0JFbXl9L4SVSuWk09Na5KVWmL99iVd71EASizzqdMVDcsQ1hbMA7teoBD/4HkCShx1Mj
	8fLkK2AFZ10nlQSYDwtgPt3+xpKFowFvkcbIUJTYtA62e7+Lcb5D2hYzJ/Zc8bxTgJHwhj0baHlDj
	E3/zxZqLeTLkGi060DuEN+o9/1cVXwasngmpYCEZVTFPQVEqbUGr4exy22Bx778fRBAmCChzZVlVH
	2CYF9sgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDN6c-00000003d39-2jWv;
	Fri, 09 May 2025 12:45:34 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMFM-00000003U5J-08t6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:50:33 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-326ba41006aso12592651fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746791430; x=1747396230; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
        b=tfVWhQOXIESiUfdpDyZCyOhpeFOi8iVRBmL49bPCOkV47Uu4g0OBOeCPHmHtcYZ0ah
         z/us4OViIqfpZ6vZdEjOrGdL0iT6S2JScZ8STEAUq0tzfyDbfE6kSbDowm4SZ3B8jnjR
         rXsyj7KJ1xlvjpD3Uw0VLpqTpOD+Vtj1sfIZQFyiB69UGDD7cANqnNl2zI3FSVU94SJK
         UMZ5IKrIJ/iE7Xa+4Gz7tZ39Kf1YhA6ZDWL3B+mQzlpxeNLGx+R5U/Ep5pTK/hICnYWd
         3JXwn/OkiORIiAXbJE+oOB8RAWnIHk1s59ERXXRilMC1tkExvv2LeZLMoiEQPgNhujnQ
         T49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746791430; x=1747396230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bSX9UNo+ut9uhyeztVWH22aZ+WPLHdTGC7kWwCUCXg=;
        b=ht1TmNtBA8nd102zV76dm4qRtlnZTWd5FBZ6eUzIPzvWBqRE2VUNKO8WrTOB+FnDps
         VO30LPjmZPZAY5Etoj6mqBAbvrDg4zNRoaCEBMru9ezOrdCNPkzfnTk2GMb+XIyUGQc2
         F+TGikNVmHVVEHtr/U8n9v3Nxq/yqaDsFSd+VE1mtTKOa4BhELdBJBU6bAXn3PdO+eOD
         e3mWP7KOq8jel4y1DeNQiYI8e5r+0PyC6wMg8tZR3MBEVVLywtAMS9CJeKJ8lRnUn2Vg
         VamHm+oG+ZmNgazq+M7dVMeVhWh6kDF6HQdQJt73d72rshh1YfOWNpIjIAwCU10EJoPh
         M+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW+2oXhxTYuezk0iu5rtxG/j9UcFBNeX36UCCV6sHZ9o0hlT+BqX2kutGcMK+/GD/x+YP6ZlDOWXMiW6Q90N4px@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+B7R+ElJAF29rEAKsx3k9JscVQCibmBVbct8uGd24z2J2dWB4
	4dBnf5jsiNe9p4Psl8cZ5HYZBACGm1Awiew6p/QHi2Pe/8O8OO4sBZsuaASWH2RbcIeY+0u4Btj
	uyFkfEZ/WqVuCD4OWV0Yf3cZoyVUok7BLUOBANw==
X-Gm-Gg: ASbGncvkrKZRaofy8nHZlum0eQoKfYo5O0mje7ztgu6HuCMITlz5gRCM3rlxsvqihkw
	MDEHIlbuAqgB3phdj+9PgC5HvapPPZ/X4MFyq9BwcBSiiqHTQSCQ/WkbzLOcqsdWDnk0EjF/xcR
	UsYj2JSemHrECctxjJ+ORaIQO0pzdvmm82
X-Google-Smtp-Source: AGHT+IE9OA/TgX88UK8wnm39DMsSy6I7xruaMSROXFg88YbOwzBbcaNlmJPRpQ8Ckx3l33XEBcNwePAgT7TtPdM2+0E=
X-Received: by 2002:a2e:a991:0:b0:300:26bc:4311 with SMTP id
 38308e7fff4ca-326c4575642mr10757241fa.18.1746791429976; Fri, 09 May 2025
 04:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
 <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org> <CAGb2v66a4ERAf_YhPkMWJjm26SsfjO3ze_Zp=QqkXNDLaLnBRg@mail.gmail.com>
 <20250425104128.14f953f3@donnerap.manchester.arm.com> <CAGb2v65QUrCjgHXWAb72Sdppqg1AUxXyD_ZcXShtkRSHCQBbOg@mail.gmail.com>
 <20250425160535.5a18adbb@donnerap.manchester.arm.com>
In-Reply-To: <20250425160535.5a18adbb@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 May 2025 13:50:18 +0200
X-Gm-Features: ATxdqUG6U2bPxTcfQiBy-oW1Lju29rGeV9-TYLkpQrHjbRn14HSqGi03f0yvO10
Message-ID: <CACRpkdZH+NnP0-GkLe+nHK-Oi_Z=FzPaM=k1U-gZddp+P2+DTw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_045032_072619_B28D4B3C 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, Apr 25, 2025 at 5:05=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> On Fri, 25 Apr 2025 22:35:59 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> adding LinusW for a more generic pinctrl question ...

OK!

> > There isn't any assumption, as in we were fine with either the reset
> > default or whatever the bootloader left it in. However in projects at
> > work I learned that it's better to have explicit settings despite
> > working defaults.
>
> I totally agree, but my point was that this applies basically to every
> pinctrl user. I usually think of the bias settings as "do we need
> pull-ups or pull-downs", and if nothing is specified, I somewhat assume
> bias-disable.
>
> So I am fine with this being added here, but was wondering if we should
> look at a more generic solution.
>
> Linus: is bias-disable assumed to be the default, that pinctrl drivers
> should set in absence of explicit properties? Or is this "whatever is in
> the registers at boot" the default we have to live with?

We have never hammered down the semantics of that, so it's a bit
up to the specific driver how they implement it (yeah a grey area...)

There are many drivers that are carful to not touch register boot
values but others who set them to some default, and people
have different opinions on that.

Yours,
Linus Walleij

