Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE554D767C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdAjtUXnPi9UdzGYCmAV7NNqxn84GFDS7LKrZANiOVM=; b=SQ1qwQ9fFba9n/fk4Tv5/V+fTj
	QGk2vnFTvC8o+8L8L8BKdwoX6EqhC3g1skYJGHuAtCA3L1Y0ZuuxR8L8izaS6KdCBIT7mU9S/MDgx
	u+MuE8BeGez/dTi0cF4qgi1tW0HHVI2OIT5EKvnXSS71zlilmuzifmxhsfiVz2eujleF/9RSv4irp
	2FX9KiNHSLoLQptTUmdfk1uKS2ckx28EitcRH3YAOXP1U+NHMOlGh0y75kzzMZsEdEdtENi96T6ZH
	Qk5lCfdJwylwHjyC/p3LMGx/dzNnjDJTF1uU6HdfcTvjlFjzRg4vPrEaKTQ+WY7nkYAxUORN5ttXJ
	RWSlONMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXWW-0000000A3SG-0Tcd;
	Fri, 19 Dec 2025 10:15:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXWU-0000000A3RI-49PH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2192A60052
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD323C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766139345;
	bh=TdAjtUXnPi9UdzGYCmAV7NNqxn84GFDS7LKrZANiOVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uO8VWYORv00juJlR18gKGq79eKmKW5LiIU85rb0C4LMNs1hNtbGKJIC04pLtgBuLk
	 WwQNTdl2AOq0ULF0eGDW5wwXqWJUkIH7PMEVLZfDhm+Qz7tWI7/x6iUeJrmnMmgvZw
	 JahhzL+A53onpFSj6/uPvyqawqsjkGFW/4S30VFH9ftiMy/rUiAHAtex9NVgPSeHUP
	 UZhE50Y4Prt7vhRkkvbQFxuuvY2RhCFHJGujnQxX3DWUIyJxbS15IhgEq9lC42vENJ
	 s+MZ8ADBDEjr3T0/OQGEr2+IHEiWVYaCwWWG5PVBxcTFr9GI7MS16OaKslbtfEgNN7
	 A5s+usZooTDhg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso1770492e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:15:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0r6o1nNVIrPW89LH0MkbkHcPiQrfbGiiLOxHdIyA98hQyBhJuIpe6n+ild0SMI7KLh/y0Qxi5yxeT1fLGEEL5@lists.infradead.org
X-Gm-Message-State: AOJu0YyeGdJong4xxByD+lsEwczmPyjeydy8C4eZGYdjQxr7ISCWnZ/D
	Bmw6ccV20vj3vABifA3TbhrIxKsM0yGXLsagC8Si5POOBeNbGap8GCjnoJkAeKnHtlukJNA7i6i
	lNIA1yr+x5L9yzARTv4+LpPEOAYG+gz/8A6ZZVQzqDQ==
X-Google-Smtp-Source: AGHT+IHXXPtjxI+X3g9JF7oZTi0dKlS+jo+mIiQg/lKY3jeto9hFI38mrhvbiHA2Rp4MB/8840d+uPeQ7mLwH8ZXl0A=
X-Received: by 2002:a05:6512:39cc:b0:598:ee60:8af0 with SMTP id
 2adb3069b0e04-59a17d8c2d0mr860672e87.19.1766139344377; Fri, 19 Dec 2025
 02:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com> <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-3-5c65cbb513ac@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 19 Dec 2025 11:15:31 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
X-Gm-Features: AQt7F2rKNUD48qbiAtp8txVUkBhM27TcXELn4tTZ3gej5gIHuBVaFRaHInahGEM
Message-ID: <CAMRc=Md=KvKaXZvdwRd_rTp-Oq1qrAo12ENcUqTTWSYnCYSZuA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: zynq: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
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

On Fri, Dec 19, 2025 at 11:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

I think there are some copy-paste leftovers in your commit messages.
You're saying you're using of_ functions but you're really going for
the device_ ones. Also update error messages. And possibly use
dev_err_probe() too while at it?

Same elsewhere.

Bart

