Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56561FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH6GxipD1JVJ+S6qzqDGcgA+zWxD7WPa3RRlnb752qg=; b=ijrcCGlrytzsKcBmHYrb8yW+mr
	un8FDwSsMfi/Z+bQ9YCm82H6fAPLvpemXSbNMjSOTBj9uEGrggcRe2nDGbs6eqpm6Ztd9C93LHvPy
	dGpBGRM8qYTbx7sa4VxLdNrKO/mCswTIKMtfoHUjRD45kqWKKE3MIbaprYkd4XL9meLhucQccuH8/
	gzOFx93OQQOtjaveKyf+AsuAb2Uxo9moaW0nC/0M0/VC7L9GTXbI118ZjuzUZhVq8tPRhkFpG7LN0
	pkl+mwaj0T2DOOnUp41OLhOG8nutkRwhNLvkbJpclSPl/5nXzOqqFboYW6J4j9FOpfWGxkVT1w5DA
	zSxIETYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuS1-0000000DTNI-0YzP;
	Mon, 04 May 2026 14:39:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuRz-0000000DTMg-1LTh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 223DE43BAC
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0470DC2BCF4
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 May 2026 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905550;
	bh=DH6GxipD1JVJ+S6qzqDGcgA+zWxD7WPa3RRlnb752qg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=D1S68tZPnYu1V0bCy9REcTABOQPO/H+FY9NCnMUifUHJ0aVGVM/4RqOUrOi3dZ7tq
	 SXzE9fZyeruuFmsormEI9/57aLiDhSrowoO8hT3TY4AGjeG/CyZhaNS8+Keza6yny+
	 HdReQ/pmn/2asK43l41qAI3EsES8X5v4sx/C24LcGuIziybTH0isrk6o8UAdPxvNwI
	 dC8Gl8stpEn+8ikHvK6rh6ZjyaTugqxKDqtlonKKLpJg2crnmGkGCD6II0fklERtNF
	 y9qDu5JPGZj11Ht04AAdDQ0lmausLskc9DcJofl8yxybU1bb9QG8Jy+tCPMo7F1TBe
	 BYZREq1b2FbVA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so3602662e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 07:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ls5c3on70s+1U47P83wHpa0SDHpfIatctRM8nYdC7DmUvZ7CLwbaPivyYJYjZz1cemY2rdA4CY2eeFOE5PSz1@lists.infradead.org
X-Gm-Message-State: AOJu0YykA46t2rvU/hwQGN6inqxibXl8ngkZeEaQmM0ZV7AWFg4kjIkg
	3GxHs8YZ/IyX+ci8nI2kbQHP5SYOcWj1tJUL0iREInYTG/F34Q8Vu0OOJlD+S1QEysjZfii3bmR
	wQeqkNhmSiT1haN6RnSAfSedwmTnNiK6bPjJsbPQx8w==
X-Received: by 2002:a05:6512:1255:b0:5a8:6b81:6694 with SMTP id
 2adb3069b0e04-5a86b8167c7mr3261187e87.30.1777905548656; Mon, 04 May 2026
 07:39:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:39:07 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:39:07 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 14:39:07 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mdy5d+8fi1Z3cOZ56XiKTNd+BQPfFc9VSYYpk-6KtFQAA@mail.gmail.com>
X-Gm-Features: AVHnY4LDGkzvq-F0a-Lhky6B8AKh6zx1azWjATamTll0uX7umMCaYvXYiBIHOaI
Message-ID: <CAMRc=Mdy5d+8fi1Z3cOZ56XiKTNd+BQPfFc9VSYYpk-6KtFQAA@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_073911_396455_4F38FD30 
X-CRM114-Status: UNSURE (   6.32  )
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

On Mon, 4 May 2026 15:11:42 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

