Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD931D66B9D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 00:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=; b=A2mRGS2bCmun4XgVgIdBMLY1AM
	qGsnxwkcoASLFPx9vREZINcNcO1ddYRKXbMppvvq85ttb0fipYmC0Avr/CbFAxQIqnw8507G1Iv5R
	BGa1sQByFyXbBP2wBoCZVy2HPzL9WS2NeLvo7ZoVkC58vqbesQ3FTdr/soWoka29ksnUt3ldpNrzh
	b4VBIv8imvjJSolj9E7DqbkL1dqxfQJhHeAInN0ufDRBFAWidPytEVcoz58mAHMnRY5cn9WUMtvsE
	Enn5EIP9y8RqQziXOez2TEBg8kUlZzLUbLURq9Iv9hUq938xxEPWWJv5QOHtBQv3/RlsLuN1ZAF9N
	0VdJggFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG5h6-0000000Bvur-0qn4;
	Wed, 27 Nov 2024 00:14:12 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG5g8-0000000BvqE-2Q98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 00:13:13 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso72047931fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 16:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732666390; x=1733271190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=;
        b=Ci/iqyzV885XUane+ipcPvUAasIMTdlFcjbiIbV5HNMe7n5OPfQRwY0pSaLPWtDV5R
         ZbgfCxRXp/NwBwgSqAvRjl0etntisoR7TSEMn1SrcW2qpVFKM+uNfswNF+hBbAijhlwt
         jypMkX5EP1oNJvVyHGkA7rHzQ9TV6y5cEOYg4vxZXqfsF/BeRf5+zuT7W3LwGzl3f4tw
         W76aSwVFQ9pK5BWR/ehY4fk6eWoyEWV/hdwE+vyIVUdrRsKewR4NQgLP+TwBpp3/nSam
         gpemOqW07MdobLlbVr5/BqWulpcYlOblmLsjYAH5bd/Oy3wuPzTwowHbvbyEHkP/yauH
         LmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732666390; x=1733271190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=;
        b=rDuwrPFexQmjMZnAeQB4bBMShbgTs7AlI/BdrcXv261yzie07DWNZuxtfX/HSo3wA+
         lQDY2j9bdeVP0r1elFrNitFDVccca1i5j8BOqlY6SbjK3gSvW3cwRPckOwLZoZ/yNcRU
         wVhKhQ6xBB3h+cnkchal5Ma5Ugw6udcRE+NydHLhI62JFu4qbcDtVFYUjcrigmQ2q7fu
         TCL5SKe/a1mO5IMwUw2TS15UZRDLq6YGlBj1NMxg1Zp8endC/ti5R3wefRhIDmug6Cd8
         ntCCj7a/1y7X2HMu9DXFfen20u1waDCWM2f7U87d5aLSWpSMb4Lw2rUbAP8sFRIshyVj
         nsGg==
X-Forwarded-Encrypted: i=1; AJvYcCW1oU0PG2sXGMlLkFTdGrYAgOxbanTUJI2VvRKRVeuZ2lJhBE1+FyuDC132TQt2Esn5RQ88FaDOemdPRnISy1OZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsbg1HapstxjgnIYNISMiUKosc2LmJhSPnG20XMnhddWU9Hskv
	Yy8bvkPzngirxaXTJ1LPZvgL/GSVGalk4+cgc00LgeSzuSmETkyHXLXwwEFhyRB/hG9Kkl9LofR
	r8qSPsHjvA5+IK32fNZWjIhWGmJs=
X-Gm-Gg: ASbGncssepd27cPE6JdNJ8zLp+cVXQClgnLasrWTaBMTP7Y2ZbsnTcC3qpUdmc1T56p
	JWz+N91+fn+DA3tnL1wiA8I+KXcf8LfZHsaJMvgAZvFmOa/XQkgnOg0hBUvo9hKc=
X-Google-Smtp-Source: AGHT+IG8q8GRhyD6Rb04/tM7viMaskxhAL4cx8GuBAEbIRuca10p/iXJ1l1H05icicDUVP5+9Ae8JTKFG8Cdjh4SJgw=
X-Received: by 2002:a05:651c:12c4:b0:2ff:54f3:a91f with SMTP id
 38308e7fff4ca-2ffd60a5943mr4507171fa.24.1732666390097; Tue, 26 Nov 2024
 16:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net> <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
In-Reply-To: <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Nov 2024 21:12:58 -0300
Message-ID: <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_161312_616742_BE959236 
X-CRM114-Status: GOOD (  16.79  )
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

On Tue, Nov 26, 2024 at 8:53=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:

> My understanding (which may be wrong) is that being able to disable
> PINCTRL was the whole point of the patch.

Exactly.

Adding back the "select PINCTRL" line defeats the purpose of the patch
in Subject.

> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
> problem for good - I see CONFIG_ARCH_MXC in other configurations as
> well.

Good point. I can send a v2 adding CONFIG_PINCTRL=3Dy to the other defconfi=
gs.

However, after thinking more about it, I wonder if the patch in
Subject is worth it.

It can help reduce the kernel size for LS1021A that does not need
pinctrl, but on the other
hand, it will cause pain to lots of people who have i.MX products
running custom defconfigs.

When they update their kernel to 6.13-rc1 their i.MX will not boot and
that will be a very unpleasant experience.

What do you think?

Should we go with the approach of selecting  CONFIG_PINCTRL=3Dy or
should we revert this patch?

IMHO, the benefit of this patch does not justify the bad impact on users.

