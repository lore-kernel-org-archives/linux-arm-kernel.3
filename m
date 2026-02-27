Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56705FD9E26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 00:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUqDumqrEysKvvzn7b3yuEIJM9ThYwDQsBhBjQ8cCkI=; b=t+3XfLmniZyzyj5A6eCrz0fGXs
	YOgQ4oUB+7SmX0LP1Wra8do+BQWSsByIeworRE9QQZgdfeLd1QmMPYh4GoMvE9ulL9riJWGtQ2lwC
	vkiGsUy74ebSrel+Y0k0ACMEjUEX0QKtxeNO08KVPHsfyirGF58BUUfZ1yq/G9WTNtBiIrUcQWweu
	MIBCN6QWJ/3LvIT+8KwZ7uaHAMdVtFBh+z6P4NQf+5LPWTK1oUDW9P+KEZ161ij7WvBUtng+veSwH
	cbTstC9+GDBuBOFlMMx7KlLu7lnDMQJpiNHHI16gw5LlqfKpQPUc+8A60poXHspxP6oiIlAqKSmgO
	kxQZRWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlTw-00000007PLp-2D0H;
	Fri, 27 Feb 2026 00:13:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvlTv-00000007PLj-07s8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 00:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 389076012A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF159C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 00:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772151201;
	bh=qUqDumqrEysKvvzn7b3yuEIJM9ThYwDQsBhBjQ8cCkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=owSkck6dpqJc1aXzqgzAC9bOTKxCIMxK88+s/wgkjRMufbYFwdQ4ideevl1fNpBLB
	 fgjaUVIhZir2kJXjXcj/HZ+QmRD0JYNjEggwUZyAr8dLn3tCuIRZHxIeW6L1AOJxu1
	 9VOQWzM2QcbkhvkySVL1cWD1qzgUvxIjIFUvvu7aW9bLBuGTclVs/eslC1kb+zL20T
	 3b7wIzzerSoesoC7PnPqIbxsAX8Yyrm5wD5H+T99c0wJnJlTlwGlhBK/BN+SHdQud+
	 FaEYDjZA9qLIlTvH3S+/mlBzAiWTjvx4I2r/Qd7UZ+RezU2zmaerFurOnOa9Jf52Lx
	 TNp1GJUWG1Z5w==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e0553bdso13780857b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 16:13:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOmv4D4l71I6N9N9+N7NbrGD1pRbzSxqBbODpbdsq1mS0gyu6cyCkE+Yg/SplmgCTytQ1V41hiC8p7H+YZRquE@lists.infradead.org
X-Gm-Message-State: AOJu0YxAvNsX83tp0SKlrLDzEKa0F4pK9VUi5JA9DWuzRsWdtGIXzVL1
	kT0rqbZpNHmpbB7yqzgYNCFmBZabbEfqSmv9rO+1dCN3mqjAlOhpuvg+MXEeBCoFfq1RerJtIfY
	rIiwoSJTjgTtVc7rcQQJr3ZBi+bYYJWs=
X-Received: by 2002:a05:690c:112:b0:798:5333:ce1c with SMTP id
 00721157ae682-798855090aemr11680817b3.23.1772151201232; Thu, 26 Feb 2026
 16:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
In-Reply-To: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 01:13:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLky3BTqryNY4MkiLpLZKW-OZhG78tC8Gp67wXZ0WMpt6w@mail.gmail.com>
X-Gm-Features: AaiRm52Gm-BswzfmZ91rHxmFojNKjWg-xm2ljpTlm0-vUOMkdIUDq-NT6rw7rAo
Message-ID: <CAD++jLky3BTqryNY4MkiLpLZKW-OZhG78tC8Gp67wXZ0WMpt6w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] i2c: pxa: fix I2C communication on Armada 3700
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Hanna Hawa <hhhawa@amazon.com>, Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
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

On Thu, Feb 26, 2026 at 2:11=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. The first patch in the series
> fixes that regression. The second patch improves recovery to make it
> more robust which helps to avoid communication problems with certain
> SFP modules.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

OMG what a trainwreck this is, thanks a lot for digging into this and
fixing it Gabor!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

