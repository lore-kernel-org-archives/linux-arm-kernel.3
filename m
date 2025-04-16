Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA551C369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39BxbZJxzOc2j51sx2qrVfV5Kq0/9tpMcS2gikzPL8c=; b=Fz2q2QDXJ4+U7g2EmpsNnjXciK
	24Asj/LGZbVvso8utZv+Ine0XSRvvPeXKs/TfQUI8MOQLrpDlHVoQZRCeeN9DsiDR6icAMXIM9Rc8
	GA1c8Z+Fn6gmzO3kGwR1RMqFrrhuzrSisSMNQs9MzpVH37mxbhrY/OIOi1RmVi2BdpCYVYFWPfLBs
	dLMO4vqp5TjnUvj5zxp+WqRRIM1WpdG6Sxcn/gM3EQSnQo3wjMv7RduJuakbU1RiJzs7tpqK8cF1V
	Ug5fFipEq6HNjbitB3uryZPc1hi4T5OCUhSOa67VhaIlTvbtDJxQBgkklVX+XWCO8TCx1R+MiY3QG
	RXKd6WUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56WH-0000000APSe-468R;
	Wed, 16 Apr 2025 17:25:53 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55v0-0000000AJnB-3b2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:47:24 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so7096485e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744822041; x=1745426841; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39BxbZJxzOc2j51sx2qrVfV5Kq0/9tpMcS2gikzPL8c=;
        b=gskAYVs3Yp+7+RfKfV/KiFxU4mn30E+WxCLeWjyNFjFKTYOEAPi6gb9y7PGe9mqh2q
         KfVlvsFfWoFJ4YpPAU7vf4+XOgg3/wUxcPP2FK9/3jVNYsSGA37f32vtsyHFkjHHKjx/
         GaqQnX+ido3fsWCsIoK4oOmBkjoOO4VQSQoxppKZXJH3h4XBk5Xncd5P71Z9aTXlDL4Z
         o44CHVDAMNh80Gnw9Zl7Tz0ofLYFW1KHwQeVhE1bni0iqKW+dEHSrQzzJ67BneezqrdC
         CSj8bpPZ53HC8iEG/xKwdxet11NwU86dYPOaG9uH77hYAZ4MGQ/qAmli8C1lWg3LLj85
         je0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822041; x=1745426841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39BxbZJxzOc2j51sx2qrVfV5Kq0/9tpMcS2gikzPL8c=;
        b=HZrmLluErT0t7R0qQsJsdZ6B/VMZp/bW78uKXQ+c6Ua9LwF+rBXZ2VjIIe8xn5kFIC
         /0tYeSvwEkBhNkRLJw2O1n30WOpCuvAh5U/hNdHh1YQWoLA/aEwMXKkgUnHkS7y4SguQ
         JPgGQlqIJPBrua+gHQDtsMXYjh2mbC4qRYWbydwREw6Gk6bltatlYHa+fcoMk7pAF/Kk
         Nxbo32WAqi5BxpGArDnwWSQYBsIcX4Zqqj4hmRISMxUH1s4lLsj5W54n3IvrnlB1Vxxp
         /P9eGgL/XOLLwpr2270EqpxQRoex/KdtETYOdksNGTiqvQA0y+mhcW1lyvgNzbGQZNyb
         pc6w==
X-Forwarded-Encrypted: i=1; AJvYcCUMsdTIvu01EqssK43hdcHGvzTeSWyUo/TbqLwMSyYRGMLg6/4AVmep+SfiulqvafIz8IYBYcHV6tiruRj8brvG@lists.infradead.org
X-Gm-Message-State: AOJu0YzqFCPLnimJcQ8mctQJNUv9LpbzZM7rEuJ0qua9EiHvWHIhM/Wc
	V6cSC7LxTRT2vQpuXn42//CJUkOHHHhi/WZhLMYsVeyCiWTiDYQ9FC8p6UHdSKbm3dQQsOkerIN
	DUyxOKRm688xvIskhDRH8Bsz6ySLSBw==
X-Gm-Gg: ASbGncu9TO7ox//14ZO+1hAaNSC5Yn4hNqDltL5xVbBlOJikA29lpaYqdsVtuZ7pKRb
	KFfwk3ZyRRhb+M+1cSmZcv45q5yah9k4XIbyVAaTQ+V0qt+OS1JDmldPDDPB88AHYhiMAmV4SlF
	IPBSx8jg95ddc1uI/QQ/ZH1T0rjfNSGp3+3tsBH0dYyJgQ4N2USpP3dJ/fkmG8dTAo
X-Google-Smtp-Source: AGHT+IG8lZZ6TzRpkafiDqZuJb6IdgkKcm718c9RVf9XNRQH9WAewHR/NAdfrRWL4fICzAbGf7ZhyLgzY9E0+gg7jUk=
X-Received: by 2002:a05:6512:23a8:b0:545:381:71e with SMTP id
 2adb3069b0e04-54d64aea47dmr805238e87.40.1744822040616; Wed, 16 Apr 2025
 09:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250414140128.390400-1-lukma@denx.de> <20250414140128.390400-6-lukma@denx.de>
 <41ea023e-d19d-40f1-b268-37292c9e15de@gmx.net>
In-Reply-To: <41ea023e-d19d-40f1-b268-37292c9e15de@gmx.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 16 Apr 2025 13:47:08 -0300
X-Gm-Features: ATxdqUGIOgXds9JKSX6cp4bYSDFF-AKiQ6t09fTbUcUeMyDb0_oZvm6DwfBTF4M
Message-ID: <CAOMZO5D+OZ6C02n4T3tJnmzJd9hTWtZA9o6-LXcFh-UmTdVb+Q@mail.gmail.com>
Subject: Re: [net-next v5 5/6] ARM: mxs_defconfig: Update mxs_defconfig to 6.15-rc1
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_094722_892258_51CA3338 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi Stefan,

On Wed, Apr 16, 2025 at 11:41=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> This is unintended, even it's not your fault Lukasz. NETFS_SUPPORT isn't
> user select-able anymore, so it's dropped. AFAIU this comes from NFS
> support, so i think we need to enable CONFIG_NFS_FSCACHE here. Otherwise
> this caching feature get lost. Since this is a bugfix, this should be
> separate patch before the syncronization.
>
> @Shawn @Fabio what's your opinion?

Agreed, your suggestions are good ones, thanks.

