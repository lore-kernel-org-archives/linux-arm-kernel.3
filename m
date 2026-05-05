Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31F1FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiETUYGBdA6U6OoG8HOJZeeTR5ZTz0XpLfvjy4A7y8Y=; b=QKvrJUPe6QmqEJQUx33J3vUk58
	IT9OjpoH5g2qodxY3tSvg8xp3lbLn3kpfpYdr8Ap08K9/aK1H1HyTfrexmk4ANJPMg4OsRDC77uNJ
	JbRFBbs20Uvpw0UaGOee1oy2/W868Rc/NP/NkToGyJiEeEc8xQVUxlmFBG1bIGV+TFjlW8BJqjR3Z
	XTFaWd2e3pHy3dbMW9jLXYkcZCvDCejHNZdrZ58Ot/UweIe45MAyj1YZBOxEog3HFug/Nnyw0lO2K
	EgsKfoKvyhTmomVg8726YoPztz8zbbd2stvWizeeSmVdjSVTLN/nrXUqW/5VNXPaK5l8NSYzFBCXL
	hBCD5zHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC2u-0000000FfEW-0xgL;
	Tue, 05 May 2026 09:26:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKC2t-0000000FfEN-0RxJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 57D6260141
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E368C2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973186;
	bh=BiETUYGBdA6U6OoG8HOJZeeTR5ZTz0XpLfvjy4A7y8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bqiatuw+F31Yuyoyo8LoEyVfRW3HPwHTDRebp1rK4BMrtJwqiA/ehvA6BeODAu+bt
	 Fh5S9NOONoE2eOGNNiOsU0Mtv+sSZxpix2vGFIAXFvTlOGJkXUA8KWA8Sx/EwqSkDW
	 R0+EwFg/rqq0v34ez6QlHT/ciTnOwE4Q857yVeIznIU9uD9K/bQQnxKmRogHYVSrdz
	 P98VKbcN/5GnBX0hBG5VHALMEHfI95rMmAAQ89K8CXwWEkjN+j66d6y+15g0FnRyD9
	 MOZyGFxQxe7BaPMbtajV4taehBXjgHEjL2H+T9Q0p6sOaCDByrIsULDgqwxhKs7NG6
	 aNpUu3y/fHm+A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a858881ad2so5086385e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:26:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+SItQh32WCbXUYSLPpQqZaPEUrTny2LVZ+EEx3PHJwVVUnlauXyu3bDLWBxgAloMgQinG5SxKGBttAZSVQzOXa@lists.infradead.org
X-Gm-Message-State: AOJu0YwHVbst79biEJaN1HWcqbpjHuoIdBkpVRaF93csu7kwSI7y13+X
	eKryEFaCZX44bz7o+hcSQw/rFDpKI6mJak6wkYfCcqwEVDCYVmqjEmcmJeTVqj19II6OaQTksKF
	/HewK7l9lQUK1hVe/JLZOShTv85YTIbI=
X-Received: by 2002:a05:6512:3a83:b0:5a4:1a2:1d39 with SMTP id
 2adb3069b0e04-5a862ebe3a4mr4549164e87.6.1777973184715; Tue, 05 May 2026
 02:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
In-Reply-To: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:26:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLki-QEVAGwO5YfYAeVWs+Ey1WmFY-+XNkn_BA+6T7u6WA@mail.gmail.com>
X-Gm-Features: AVHnY4JN0IoEyvASti40bogeQWlWZiOgk0WDse555_qDzC-5oeg4FV2OdHIN3wY
Message-ID: <CAD++jLki-QEVAGwO5YfYAeVWs+Ey1WmFY-+XNkn_BA+6T7u6WA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: fix regulator leak in sunxi_pmx_request()
 error path
To: Felix Gu <ustc.gu@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

On Mon, May 4, 2026 at 4:53=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> In the error path of sunxi_pmx_request(), the code calls
> regulator_put(s_reg->regulator) to release the regulator. However,
> s_reg->regulator is only assigned after a successful regulator_enable().
> This causes a memory leak: the regulator obtained via regulator_get()
> is never properly released when regulator_enable() fails.
>
> Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator=
 handling")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied as nonurgent fix!

Yours,
Linus Walleij

