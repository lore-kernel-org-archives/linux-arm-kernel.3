Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C88CCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 20:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IoDhb3udmXxflS3dgrcLv1niGYnHXK5D0HgB/kdlyQ=; b=KdBWmA8BZQwxrC3WzNDHFvJXzm
	v8mtHrbZcNMuyu3JOCBMGf6kfAIFujwaYYII1mv4aWnezuTlBbWlLCf5NmSBOrTO1m6vTLHILMBeY
	T0k6rhsmWc31f25YhphyQrwyzNdEVyBH0wMgtOYWgaMMKFluIuQGviFwtlXdl3dNPgzhWRdFia8ay
	Koi0LJ0YjllS8rPG4avv6rW40Oc4EuYp0HjdMr7OFPkLJbmkW7xb5JsCNJBFmxhNAUs1TjV6eGLyI
	Mx3XieVgC3jMtsXd2mLfDPV/iKAD5tsQAZ7TteAwZVZINzd3hcRtDyCek+Mg/TF+IqKXyCOhsWLUO
	G1GX7Riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3Po-00000008CfX-3Bwu;
	Fri, 29 May 2026 20:02:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3Pn-00000008CfM-3QB7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 20:02:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DDD54605D9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CE21F00899
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084962;
	bh=3IoDhb3udmXxflS3dgrcLv1niGYnHXK5D0HgB/kdlyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZlarIqBWtLGcGIdM2D5odT8h71DAweyXa2Y8k8pHd+US5FR+kmMo4PR1UpJNcqvFg
	 VsgUHFWdn6XOxhXICNF2Xx14atl22crYlJdj5NRdZJV697Waap41kNM2wxjUwuCVoD
	 cF9nHEh3l6C7hOV3bcoKpd3Phk/uMm9STgYb1lPP9CqsUIAu4Tz6swP2sZyeRkXpvr
	 Wyswhck/JhJ6KMfL5aylsDFOQZR/rDcHZ0xNk6Sk9bFthDpNMBQ1fSMj24UmIyuIec
	 IMFoJjRJKa8KSF3mxA1yAZB9XS+aLT4J+Q9uwgQrZ7cEkmToNsbDEnF++twcZDkQlD
	 x8jvjunZ2l9Cw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8891febd2so18762929e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 13:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/sstaBXZMl/jn/d1JnGrBOpfa9A9T+JInGJjSqoxUZ0fmn0udH8iYRZ0pI8CrOaAC8+fwVn+Jgu90gt7PyNKi3@lists.infradead.org
X-Gm-Message-State: AOJu0YyTV3GmM6+KNEjFki4PPkzq3TvAjUZBBu6ZGN5ev5dBkYJ7uHUA
	2oiLoUgcZGYw825mzTIq7ywsRUBhfNF1lc6YH2f7weLVH1cBfdh3G0ez++1eqjww5QXmNk11am/
	+FzfV8x4w6um8unqKOSxEUWYJNZL9Gfs=
X-Received: by 2002:a05:6512:110f:b0:5a4:19df:db1 with SMTP id
 2adb3069b0e04-5aa607bdf2dmr472223e87.15.1780084961397; Fri, 29 May 2026
 13:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:02:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ci76uJRi3miCeK=b_niFfpbjB596UvHhBVWLXPSvtXQ@mail.gmail.com>
X-Gm-Features: AVHnY4II6mWwzs5HHtPCKUO6QCDuwfRP29kXe_FIpHNftdTxNbG5xf6Bwi9pi9A
Message-ID: <CAD++jL=ci76uJRi3miCeK=b_niFfpbjB596UvHhBVWLXPSvtXQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
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

On Wed, May 27, 2026 at 11:09=E2=80=AFPM Peter Griffin <peter.griffin@linar=
o.org> wrote:

> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Patch applied!

Will go into 7.2-rc1 in order to not annoy Linus (the big penguin).

Yours,
Linus Walleij

