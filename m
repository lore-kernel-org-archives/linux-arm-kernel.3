Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C9BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=; b=ZQZCm5gIBJ/9B5mpVQ8EJxE/Hw
	y7qiMPLq9Ms87S3RHUW7gfidzX/XMulST1cna4ASRXeEP7/Mp+KUUgDzJvQttFnFavYhP16+xo/Hv
	OFjVx0gPJretO8o4O8Py0if50IUL8NLltTaAZNAFZUrSZOteoYr4cxy3nQfU9Q7zBkJyozUgAqQY7
	4WkBoe70g1iU9HpNIMnpRaEw/IHr7U7r6p1lIZyRwuA3sh1UD0VW9sEp1dyjURdDPpBt4kkBdOFtg
	LtCkbqQ/Aqn1z5f1xQt+UVUCSBJUC9C3/qCkdObWIpq+S3HdRElAm3/bwIPoL1UHVH09d9/FCau5I
	mk68OsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlj8-00000006xpK-1xLt;
	Tue, 11 Nov 2025 10:35:54 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlj5-00000006xob-11Ts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:35:52 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37a33b06028so35208961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857349; x=1763462149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
        b=h5H8Sc3DzQ0dYNLpWgQJfv3x8/uPZ2wDNDlNrlx1kdk+QW5fgEoKuRQg9nqHWOsw+E
         Fwxcwg1TOMBnwXkCzH+BZnYaseJcC7NjavYWR5WoTpuJ8fr3xOOc0pXWq1s/55Y3qZZy
         Z/0+4fyT+UyBUVGHvVtXbfi6uUPndK5cX2lPa7XPFI0zEFpN0K0Un0Tn8SXFT3M1Usws
         EDpkV9hitDuGrfuy5VJdbT8nlfKWp7tEqJzwPJo2DaeQw9Z0nFk6GmnlpPREh8piXgnP
         0NX26XU9ol3/G11bKtJmmx0XV0FI4DeHob8Lvh2bhkliNEbtRP+OmvFNArD3Q32s0/Ny
         mHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857349; x=1763462149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
        b=SZdJmEtWa2HlC+dRUollWQ4efSQfyT89SLB9gPrclX/oIZZbfk9SLp7XpT9uLZ59Zj
         oBmVuZnswivnlycR0FgkJpLL4amGJm04qNw2tC47f4Ig38kdypPRF6VFODKKcJwhjJe/
         8QBtpgm9tMUWx3Fvv5jRZBWKL5ABubsimtehBzuYFBq3Q94msu/D66HqcDrjQ9Q3p7cI
         RH4qGRMRVN85nfLWGrzJRep636Yn2tTqTYlZHq9+koHXk+HS96x0UkBQWfAMVxWD3Sa5
         IkjKIBPSwt/8Vd3cB7NXa0knvqRLa06yYEPUyt6YcxXwVjAa4EX43MAq1KuHdV5hptqj
         kO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwe1f8QMa6OwjSaZOAM1B7QYm1j21dlutYL2fq1TKsWUF5uQk7gZL/aLhHgUlqrAqE++zreJbNoddHe8PWk8jt@lists.infradead.org
X-Gm-Message-State: AOJu0YzzJYwMAluewnVqwLVvzPfDPVXp3DRA1wF9IWV6xR/kdA27t/9g
	40SO+373U1R7zgMb7Nj2gDLukKyGQO4nui3i3+d/0RJYTBDYUOD7yQSW6unqgsstpud4vuU9hvv
	FW+ZVdlkzn7u2CV4PxYyW0SQsvStIg9wL2EzCFrr2KQ==
X-Gm-Gg: ASbGncvwTo+1RKtPQl4sUXQB1FUDFJ0dd9ICTdr8jZ1hSKEc7/igNxesrZ/2lvYBKHW
	o7A9lS3MrD6zuo4U0A9bSI/J9frcg1k96+RS+je/rcbPDNLP8eQGOeV1KWvAWhc+tXLGCmxSEUT
	k8sEmt6hOq69fwm+tu3i+M3tZBAP4EeAsMYwPj9p9q5Adm1yAdL0bLe25y3Qx6/F3UbB3+fjDhC
	MgAaDTyTnxdwxQccVNIW7uz1bAkvvGGSniBCetaF0HnGc0FyOV02nBVNWj/Saokwt/N+Gc=
X-Google-Smtp-Source: AGHT+IHiG+EjsNieo0IH9vKGvPYVnnnJhmFUXHoDPqz54BHP96ylxBdjlT/JInKjKxLz/khK4ncylVpRxXU4D16MeYo=
X-Received: by 2002:a2e:95d2:0:b0:37a:2f0b:ef24 with SMTP id
 38308e7fff4ca-37a7b1995e0mr22288641fa.16.1762857349004; Tue, 11 Nov 2025
 02:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20251104203315.85706-1-shenwei.wang@nxp.com> <20251104203315.85706-4-shenwei.wang@nxp.com>
In-Reply-To: <20251104203315.85706-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:35:37 +0100
X-Gm-Features: AWmQ_bnM-SUasW3cn2Gm4EW3aePYZpGnjIZZVnW89VcDCfJSgNXVTHUcuXdKqUo
Message-ID: <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_023551_299632_380559F4 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Shenwei,

thanks for your patch!

Also, a big thanks for working on improving the standardization of rpmsg
so we can get some order here. This is very important work.

On Tue, Nov 4, 2025 at 9:34=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:

> +- **Major**: Major version number.
> +
> +- **Minor**: Minor version number.

I'm not contesting these if they come from similar fields in other rpmsg
devices.

What I'm thinking is that the driver will eventually have to quirk around
bugs in the responding rpmsg CPU, and there will be bugs. This can end
up with this situation:

major,minor =3D (1,2) NXP implementation, no bug
major,minor =3D (1,2) Sharp implementation, no bug
major,minor =3D (1,2) Sony implementation, ooops this has a bug

What is the driver going to do here to work around that bug?

The scheme kind of suppose that all vendors use the same codebase
and they don't.

I would rather have:

**Vendor**: Vendor ID number (such as the PCI or USB ID)

**Version**: Vendor-specific version number (such as SW release)

This will make it possible to identify buggy firmware and apply
quirks.

My apologies if the rpmsg community has already thought about
this.

Bjorns input would be appreciated!

Yours,
Linus Walleij

