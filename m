Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2591CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bx6mWRdOWgIb9ye+nLE/tkjNc3nUXMNF7mOKMpqxWAw=; b=lir8fEZ9AyiLsyhBPITh4emX6g
	SBgSslJgW1XNmO5yW7PU3BQGdehYAT1jYV0jT0r8zRSrqe6RrezWpb2H48olchGXU+juZ5Fwr2kYs
	6XKmbEAdZHmwY9bQHa3ers7geDz4m7YqL2LBcs9gBtkzPh58yrDnYdKZzVdcsxl/cvCXtDShdIHhC
	2lx9BrCsGmGN5MoAE0vylezO0RtzB0ieimtIh6Dw8rsapwJp5ZCapbY3pX1aV6JqkPEXY99/HD0ZA
	tew2VvXtXMH1ZiNlZyWzwUak9Y3aDr6wv2VxEmA4qRrIbaCVHL56W3up5gE54V/uns9rbwLi2+Llp
	mIlUp36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOzz-00000002C7q-3diL;
	Wed, 07 Oct 2026 10:35:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOzy-00000002C7I-1jxX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:35:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBC4243C50
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 10:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06C61F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369345;
	bh=bx6mWRdOWgIb9ye+nLE/tkjNc3nUXMNF7mOKMpqxWAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZvoewflBJxOXYhrH6N9dMuZRVH4BqVoFArQ2EiVqBeQfEpriWJLYDn9eXA8aeKjrr
	 xHBMVyPdWWKjI8vDDaHGAebd+PH6Gh67PZhMHC2xlh9fbnNNuDdVB6XnbxnY6oiq/M
	 5pWTjixqER7QC/m+Cxtl3zHHvE1Bmfnwp2OeT3QoGcLgYV4jhUJu+k7ORjhqWyXMJQ
	 x/2M1My8oh1hvsv2fLcyZVg40XZUuFmeyrxSoDefsES1U+8YW00pN2k7OPWBBfV3VV
	 bZErqZj15Yj0xFn9/BWsw/tGRI2yuYXxOP2igQIFIlvZPhbZxghvE9bpctbdGvDofG
	 0v3eUTKq+qyAQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba4180a65aso1354177e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0pyF6/y8FJQR0OUryE9VAlTelJnKFhtKP1lI5tKD1EX11GQC+deSZh0dfP7437r3TktxYHiKdzno/FOuSaIAo@lists.infradead.org
X-Gm-Message-State: AFq9FYK4h7VMB+9LfjV80qfeU8by9mKDPgiXJ2BTWTIAHQp47te7clgU
	RlMZKL6/UE1s+MVFhsHig2PcYgzzmjTco2Gha1lPAeh7x6OTPtJ4lF9ASQ3zRmHSHAiZ2vcZMl+
	k3tLuS5T7IV5OnptB8Kdk3grpXLAuvbs=
X-Received: by 2002:a05:6512:250e:b0:5bc:b7f6:99af with SMTP id
 2adb3069b0e04-5bcd0639aefmr556834e87.1.1791369344545; Wed, 07 Oct 2026
 03:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-5-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-5-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:35:31 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0CrXLdaq=0XW=dkctKpJN7LNZkobo3fry7O6J8wuVzg@mail.gmail.com>
X-Gm-Features: AclHuK_GYh3LWvdqsu_xdCZ9-oDxmD2HZEJ8XaJYtg9uAMl6VGST9hL4DFl5ONo
Message-ID: <CAD++jL=0CrXLdaq=0XW=dkctKpJN7LNZkobo3fry7O6J8wuVzg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: samsung: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> samsung_dt_subnode_to_map() can reserve map storage before adding
> configuration entries.  The no-child path returns its error directly, and
> the child path frees mappings on failure.
>
> Use one error path that frees the accumulated map in both cases.  The
> caller ignores the output parameters when the mapping callback returns an
> error, so they do not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Peter will decide and merge this patch.

Yours,
Linus Walleij

