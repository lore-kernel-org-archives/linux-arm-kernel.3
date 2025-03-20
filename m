Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7749C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 08:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=; b=UY43w8bSylT9l1bZGBheGEKNGR
	xd98Z8nYFD3UCTwPC74x80QM6ZG7MS049ECgi71pu9Ek+NQFmFil1uKddPD1eUwe9vZ/BasjzKvaX
	eyQQqqApA1NmU8NTxVlchOllYXa1g7iRnN0B0ELcqIka/X7aRlEXy12Qw5n+/61oMBUWSRSv7DK59
	xlqQov/SUSxpLApHHaAd7hjTUz7tygW/FJC4Onl8eUzC0+hsslHqf3wJcKDxS+ieYCXeCSEQ32SGC
	Ds+M0NnVPTRs31GKuIsnGKzKpL+f86jkaCrSCfQW0HU5ks5ddFmNkSaGSwb/A8LZ+LF9f9cpzKTBK
	mXXo0MmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB5V-0000000BV0o-3tvc;
	Thu, 20 Mar 2025 08:17:13 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvB3n-0000000BUnf-2Eyf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 08:15:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54963160818so744251e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458525; x=1743063325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
        b=EY2+yA3FauKzOmtXtiY4rnQlOV0Dhkb4lxY/jlW86nibxQPZXp4TOkOYgu1aIrE2d2
         76rHwXJA87zZNHEHfaqfKjfJHxAF9nh4my/vyVu+RsDbbvyM9hS4jT3KH5UGaRHwhBPC
         9mBalVGVO2GCy7gIKP5l48x0ZcoWb+4NyhSU0u+Cob+jc8UofdfXwih7OgripsxdQlxf
         h9p+jhzjFMXBy6rovd6mEN4y4lFGrjtnbtthP3RISD878agiIvjdiN4LoFXF8ramSgo5
         DIBViZjNuY4qskUxEDmFY1mU1jqjFmqv+MC2cttdBctFXD99uGlsPaxaBedTeNzoozua
         2E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458525; x=1743063325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
        b=UEQCoQxyB90l7BwZT4pcqzjavL1EHSMxOxvS6JmrI5rgep6n98vSEaFzkFlpk5SwJR
         f6nFV23DDLoFfqVBN5y3BWp0f2qW6Z/yp66bDoMBJDeiUoXM60rCvmYQCf7UkNlNIdTn
         LcwoGYQdAl0VNjg5M7QU29OXOIGeTTl+e1GowHJ10mZpwwstIKaMjDZXZclxV+WrWB8l
         TZzBSwsEdUzTAaJKtBH79q8FyAGNwx6NxPFUbBzzo7F21+HJzG/etLV/3YRKbtil76Ly
         +ULJIhXsOmtDueTEM01VllASYUla8IXX5R+LGuLwzeNFsoivPx5hXNkjR70uMQ5LN/T/
         IfZg==
X-Forwarded-Encrypted: i=1; AJvYcCU8NIj0wKEI0nT6rO9jar8kw82aJcj31KXGhytdNF3/tfp+J6v8wI2ukuWZ0n03bzP9tKHk68wqvjwuybfW68xK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1T4xzT+sjnJqHanDhrS198v3EA+7IGAuD2ze3/A6TY3FKmP2I
	IDiK9STVJ9MZTpgRW9rF0yl3PLgU7sadod2XiGLA8t543kSiq4rm1Lz+wEdgx7BUYPa15vzdQNx
	EFBIFhXBFR1GXZbFViL8rLbiutdSAPPZ8HBsK2Q==
X-Gm-Gg: ASbGncvxe+o4i0huIHaywLcWxq57LlzUym8AeIhTa6FosEPGz0YdFA0jgFEZ6Fu9lA1
	RCsC30+feJ+MzY76QNrlJubwfgHwJPXNbwi+BLqh0rPTFenJalcP8AgYs64M9ngn/TnVRlODG4M
	zeeHAroPBvCdgAhYjQmFaFX/9yuRu+KxO1vw==
X-Google-Smtp-Source: AGHT+IFt36qrZTs3jVigV6s3o6UseGY3Us8oFZFiBf9nDZO8WAVJKTGbrIYvbTde8JRkHb4C+HxFUH8jfnNdOZIUwPY=
X-Received: by 2002:a05:6512:39c7:b0:549:b13a:5d7f with SMTP id
 2adb3069b0e04-54ad067f248mr760711e87.41.1742458524964; Thu, 20 Mar 2025
 01:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:15:34 +0100
X-Gm-Features: AQ5f1Jq4MkD-TA_HtM3sgjv-P_RV51WIW1wiOeKXspOTGRepAHST2Ro8gvkc5rQ
Message-ID: <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_011527_569898_C44DEE30 
X-CRM114-Status: GOOD (  10.09  )
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

On Tue, Mar 18, 2025 at 11:59=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Convert Nuvoton drivers to use pin control provided data types
> and more of device property APIs.
>
> While doing that, fix one non-critical issue that sparse complains about.
>
> Compile tested only.

Patches LGTM and we are close to the merge window so I have
just applied them.

If there are any issues we can surely fix it up in -next.

Thanks Andy!

Yours,
Linus Walleij

