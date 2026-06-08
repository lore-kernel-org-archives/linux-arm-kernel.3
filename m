Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12F0CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbob2K3Ts2e5sRZZi5UxoNhGx/cdA/AB0mJwiP8BuPQ=; b=yshakULpjkVn4HsZn4+xil24D9
	Ipiq4Uxe0ZzIOgnTN12ZqzytxIsHO/GrK84eAsKXNFrRHoTzNaQADLZfu9MfhoLbBDTAYA8Oq45IH
	+vAeVFzeqtxht7Q/TFRl1IGnrx8HqpiP1DOke89EfeiyCEFpO4qR1n0C6dojI75xNJa19O+1luaZ1
	xDM0eNLux2rCxEj7r5iMY9pQ23Fxvp2EfxF2xcoKpMKVv2rgmdIqc043op6MKTCt0TourczR4+N9K
	17g34xnhsOoq+y9bKnHuxG2Of5rUiNsql+wLfvkXVceegjSGbsmqZvBfjJfthQlsvPm7LBPfK0hHp
	2cyVjecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaiM-00000003i2f-2rRZ;
	Mon, 08 Jun 2026 14:12:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaiL-00000003i2V-0SLw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:12:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 954C143B1C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716461F00A01
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780927948;
	bh=Lbob2K3Ts2e5sRZZi5UxoNhGx/cdA/AB0mJwiP8BuPQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Qte3Vem5qHkCZ/OeU02dUkzYzKXO9Beo3dLTUn+ODVud7suQf+ESdEjtBE+hQrdDr
	 DGYf0WwesCyIPWorZPnPjtS2APp4PnYp+eDN+yXvnnchEZy5vtAmfkVrSQYckLd+Bt
	 +xOrzDSNSME82zsHlMPzsJ95gmdEhiYtb5YGUxYb+UHGun8QLjkhg/JwsG/DPjjKW4
	 BKAd6cDN37/SSuMSLdjHEEWzFpSs/CIXxS7QTfqZ/ZpAnam1nUB3oSv0FSWLafBq8y
	 s12wE7HFmwXkTJ90OiOYfUXqi5Tz5YvBj8rCKiyFzoRHAQgo0oGQexH86m6IciKpBx
	 /PL5r1KagXt8g==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1363e78746eso4641491c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9wIxc68McZ8OmN8ersKV2Y259D/HtvAs2nBrzOIoj4EhbfbZLNA10O3owROIeh9Ay+mHw1lQVEgW/c2uyMI7C0@lists.infradead.org
X-Gm-Message-State: AOJu0YxkIvB9Q5R6NwLmo+0zmhaDHLHJp9KqVwFrb+rCJJQi3LGuD8b9
	Es0H8J3s7w8SwwipSoaLk3ciYz+nFkrsU1HL6+4R/J2FwdHVPYVl032TDHPmNAA3ztwZwE6pElZ
	PZopnAKkTqpWn70giV1zMT7YMLSnCUyya7IXDK5aDmQ==
X-Received: by 2002:a05:7022:b99:b0:136:b67e:93e6 with SMTP id
 a92af1059eb24-13806740040mr7144172c88.37.1780927947846; Mon, 08 Jun 2026
 07:12:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:12:25 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:12:24 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com> <20260602080132.3256239-2-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 8 Jun 2026 07:12:24 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc-61ttjn7x7VsVMt1Ph5ROsNZg=1g+DFcnJJsS4dmucg@mail.gmail.com>
X-Gm-Features: AVVi8Cck9OW-nRKCCNdyIfJxZ-U3bKbEAtBgDAOB4cLKxe6r78d2Jkp1R58NAgs
Message-ID: <CAMRc=Mc-61ttjn7x7VsVMt1Ph5ROsNZg=1g+DFcnJJsS4dmucg@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] pinctrl: s32cc: add/fix some comments
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 2 Jun 2026 10:01:27 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Add/fix some comments and print statements.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

