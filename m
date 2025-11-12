Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44798CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YGhgYj3na3lBzf4w1UXosrLsby9qm0K/6mBJebDsWI=; b=r2T7lKLGuVRTZI2dHvcrlJAF5I
	zRkkSHCi9lmiddxKyhUgpJ+rrr6XZEMuW6uUknIQyFQoPbmSVPebuYiLQ6aFl/X01a3mvYlMpWBJg
	C2sOlhTuxHCy9RInxLLK2FOuMAE7SGQN8DNW140eRjxiBI7efKTScvxbzIkenDg1giGbJDOo3m6dR
	medc6CEG6wnxtG5o4eB4mOMC1oxDg7s3fj0D38USiOayjZ6palxT2nAjjvhStVFJqJfHai/gOBIIq
	X7FOUOFue8UvNRlwOAILb7luFOTmrXF238KSq+nm7Wepfa7PWctEnX7bRv3CNwGbHzk1g5S5p7c49
	P3xbmIAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAy0-00000008qqa-0d1E;
	Wed, 12 Nov 2025 13:32:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAxx-00000008qqE-40yr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:32:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b4933bc4bbso693372b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762954373; x=1763559173; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YGhgYj3na3lBzf4w1UXosrLsby9qm0K/6mBJebDsWI=;
        b=QDot5F0+tyYDY58bB1RBCXsQCLYnilwi+IZ8ymPJhDwn8lL5JMM/rbh0szYATHN4NL
         Hu48U9wVMbUmQnKlL27zoMUiQYvXjCxJ80RAYi3+pNpP0O7FPrIuZbwicv2w9NUJs9UJ
         7u+eouxWJXMR1FG2FHUPErXQLDHJ+USUSkyLAoDkEbZpNYKDglUIFbt0GjPsbNfaQCZJ
         P4D9B/GUkxftrqveyYZCY9XEbmpp59fDO/ukcAQ7QP/pKn9NezY27oPPfOaIOWrATbu8
         IikW19gnKAKY/E3I6hooBmeb2pp1OYmdGIqbW6AbAbz3RE9lty+NORWBpuzmQ+Mvxgfp
         VUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762954373; x=1763559173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YGhgYj3na3lBzf4w1UXosrLsby9qm0K/6mBJebDsWI=;
        b=LvKWLgrFUOBu5WeYv+vxHkS+XGNljOtWqX65brH/JuZRwjAKegDkl7rKoZf5mqMWDg
         4IsmCBMeaBZlkKZgkWnZAGPz/F3W52GV0gkxB76wY5+67+UC07Qwmtw8gT4Fb0Z/rwSF
         j8pdDhvZJG56lzM5B+uK1sRz6dri+pe0aEjZ0rdbcJmFRtr52NBhGIcd117MVxSUAFY5
         vzZOoNEPntgFREvaTOeHy0NkGl5WBH9GwkBwGk6P8CnI5+8FWT+1XK4/Mr9TbHNJhDnk
         KisatiBkWdU/cAdIRI4xTqOLGy++QOFPzEW6JckEf+bsNVRa8PscEyQ2r0iaxdKNrU8K
         t4eg==
X-Forwarded-Encrypted: i=1; AJvYcCWXCIvzHGEQbdyTTMmKRDLXlTCh/Qzo//b/hnApuW+ErEKJSmzx3BwCxUcpH/tbwrtlrOrgt0eiE1acx3y19nEn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0+eCabdnKC7u797hyDsIoFtjrUDjQ30ORhE0723Pd1nntf3gX
	ABi3I5FwqcEXeEFE1N92uOGZ2w7euJnLudlS/3QeWKugGao3FL+7Nha4xUfavprvb5de1nmwsLR
	71dWjC+FuTYYpp9CgM/UN/kE8rvc0guk=
X-Gm-Gg: ASbGncs8Qu5x5y0PY5g/DQxLcl+I1tTOSbrAYUOulJON+CVC9gw9wY8i+Aq2A0Y6cGn
	NOOE8W/DC7VpnM2bV5Ey4dyVNsITkWvtS6qGDrty9Kgz6Gsm1G/wC2vDhCwkVs5EljtOrowuShC
	kjKeIr5eJOWYcEWb6uqYqxOvxx7DBX0meXQ+/bOFWrPxSJGHMglWlnc5kYp1fh5ixkD/1i3ITCd
	zp8GPxFauvn/U/Ih3z5dQLIvmVSzxIC0KSmp8P7Nusp4vy+S2lkT3R7MNFiwmFQqVfl
X-Google-Smtp-Source: AGHT+IH0s1R5FFxg23gO4NcrxeoCruOm0w1P1EMsauVWBqLInIEKMlkyeUh1Nk79roAPnbvPjJADnE2pjL0vjVVJ+WU=
X-Received: by 2002:a05:6a20:430d:b0:2e4:3c9:2ca4 with SMTP id
 adf61e73a8af0-3579b7a2f1dmr9348903637.16.1762954372919; Wed, 12 Nov 2025
 05:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20251104203315.85706-1-shenwei.wang@nxp.com> <20251104203315.85706-4-shenwei.wang@nxp.com>
 <20251112125741.GB1319094-robh@kernel.org>
In-Reply-To: <20251112125741.GB1319094-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 15:35:16 +0200
X-Gm-Features: AWmQ_bksp5_b2fKuYqlFUSD5X1hhR6adsSbKyYke1gTN6bbO51U9xJrjNuoDAyM
Message-ID: <CAEnQRZB4ymvSERKhJW=PAk5xA2JYD=i4wzkbumj_g5S8BjONjg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_053253_995413_5F0EA9E3 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, Nov 12, 2025 at 2:59=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Nov 04, 2025 at 02:33:13PM -0600, Shenwei Wang wrote:
> > Describes the gpio rpmsg transport protocol over the rpmsg bus between
> > the cores.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  Documentation/staging/gpio-rpmsg.rst | 202 +++++++++++++++++++++++++++
> >  Documentation/staging/index.rst      |   1 +
>
> Why is this in staging when none of the drivers are?

I guess that's because remoteproc.rst and rpmsg.rst are in Documentation/st=
aging
and that's because when converting them from .txt to .rst the author
didn't know a
good place where to move them.

Would Documentation/driver-api be a good place for these doc files? I
can move them
and then Shenwei place the gpio-rpmsg.rst in the Documentation/driver-api a=
lso

Daniel.

