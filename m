Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70ACCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz0QOg/akzSjE/H2JWtFn2TjUHHbmNYxDvqdiKH5wjY=; b=AkC2cHwbSmWogbo9FsItMoALZ7
	BzVYVs1G5x3/xOdoERT0vXs45L//ilKOqK26d90CRMJpiUj8NdruKpdqZgJ6ac9VPHQhqK8BKzGEu
	WpJAWedqjTv1wFaSoTKfliKsaZZT/twU5oXHIxCukW2hCa7aVWh9jg5/sF3tXtEWsLMrtr3ZGxCJ1
	0maRGxwdy0c2I7NzLOzeZrgVHxjWDlwuuOX9aS6V3U7I5kUlBPSxsBzokwY819yv1og8Hvt2EbX6Z
	MCJg1sM971UlzkpuyrPOaOgYlBQKIKEswtzwMXXxV5hbapDPDxnPIV4+zGP4ol2zexIw1jXf8WMO2
	/6XeAlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOeO-0000000AwMh-3Ykq;
	Tue, 19 Aug 2025 15:53:28 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLss-0000000AVLZ-0Y83
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:56:15 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f901b229so41241511fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608172; x=1756212972; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz0QOg/akzSjE/H2JWtFn2TjUHHbmNYxDvqdiKH5wjY=;
        b=hrylFOT20yC6tfXm/MeB5PFA/SeyXiUv7lETIxlMXiZnrLitkOtneZeKs6zjxt+VMk
         80GYJYC5WHqIPeD9umieIQ7F97a30lSVKAinX9cloB1rvenHQrz0HhtH/bqUp3oiHbJB
         2bmRYs3ZhX6Ba7pm3t3jExZRNkWZENotq6NVkV0MgKoQW0JOgGFvizGtv4KyOjoV5etD
         T4ovU7Xtph3sSeWqZC7tQlBTrKDxSHL0brFY5dSSDuARNg+GVbqkSQM2ZDWk5s+2GRfk
         wy5ZzFhKtxN+eMUIf+yoF1ouknNwtxtaGkTnd5II65rM4Q2M8EBdzr9gZnjKqEJ1VUKd
         6w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608172; x=1756212972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz0QOg/akzSjE/H2JWtFn2TjUHHbmNYxDvqdiKH5wjY=;
        b=RNPfhzZHRmCeqeTZGQLtoWrE9ERYuMNTAFG9cMF/96mY/ks4ay5Pltd90Ribx9uz3p
         O+t+BG8ojQDYFvNSR8/qUAlYquKVcN1oB/wMripDplon0QzE4ol5BWH9gfydW8XYGbkM
         UtSwWQuowox0q96w+pzmazSYmPA1gmAUV94PDj2PpaRQuTMswT/R2whIbec4IsLybA3U
         MQwdJkeEh7Z/hDj37ZmnTbH8W5hzBXkIWqVekXWF+LA7we0Gd2WKceqlBC9AaOIHIExi
         fN6fuIGklE5PLOV1mI4K1M6Swmiz+F/Z6A3qnR0y7b6WI7yNU8asVtP8+lKud1mL8hxN
         d/1A==
X-Forwarded-Encrypted: i=1; AJvYcCWSg0QZS9FLOYwjwGdWU/UqqZktCs2KmyCJn7gMPnA3ZtcU4kGuk6RZ37LMBu6dcB0Q8vSGBykvWFamb4tv7F+t@lists.infradead.org
X-Gm-Message-State: AOJu0YwjjGjDPehSn/9BW5SgMRs9OBXSkGqxI5gdKviKsr/HOCthZ/jB
	rxQ7/SZlXB19RcL8eEheo41yBki9yuJygbx9pCiSgCHCPS9XUwH741mY+PZ77kvl6oQxeAmM1lT
	THjBXvn76DTeHt24xt1TaSfs3tfDlqiuX/GpdaST4QQ==
X-Gm-Gg: ASbGncsRRPWVnlE4rVQcyJ8Hrxm4zQFEIxYRYuKjlBM1gHG68Hq8owgl77ztzPL9nXp
	6O38FGh8vOCs8PeGfbVRPXIWx6uDDJWe7Ccncb9cfSdmZ9XpuBcamd6ry/gJgZFuHHD2n61w6bl
	Rvp2COyz2ADH1A+iEdLbxiwgyDki4UK14aLD4Oz0dTbLht4uoJvFRyWuA4MyfK1i4OprtJb5/Uy
	gLBhqgmSYRsn4W/1Q==
X-Google-Smtp-Source: AGHT+IFUdE20zyrUEk40f2kUzg2iU7WpPNLkuJOKXQXp3DLrjB3ncJifjSzbF9DsaL3zu7uLvfHfbMV3X1spc0EVxok=
X-Received: by 2002:a2e:a594:0:b0:333:7e5b:15c0 with SMTP id
 38308e7fff4ca-3353050e1e0mr6448301fa.13.1755608172324; Tue, 19 Aug 2025
 05:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
In-Reply-To: <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:55:59 +0200
X-Gm-Features: Ac12FXxA0aTHF_AbE4XLBFhBLRwXcBfdoeDod62FVE4dAtkrcQvpYv97-QS9ik4
Message-ID: <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	xiangxu.yin@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_055614_178722_CB2D7862 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, Aug 18, 2025 at 6:41=E2=80=AFAM Fange Zhang
<fange.zhang@oss.qualcomm.com> wrote:

> Set PINCTRL_SX150X config option as a tristate and add
> MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.
>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>

Fair enough!

This patch 1/2 applied to the pinctrl tree.

Please funnel patch 2/2 through the SoC tree.

> subsys_initcall(sx150x_init

I seriously wonder about this. It feels like this driver should
be a pure module_init() device. But other users may disagree.

Yours,
Linus Walleij

