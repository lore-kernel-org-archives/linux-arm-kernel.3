Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B460C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 22:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjShX4oY7YbHcAVM4iaZJGTrGB0SElIHdue6RXDVlyE=; b=DOVtn7ecyAYVMTrXB0d2FUhcEG
	33KKgyX7gb8u6FvKeNRvuLFRy7etJqQikmUIEr5Qvt3gH799QZHjhspnhkYV5tDXeU82dcyUgUnvH
	Dabm91HI/DLc33UrNtj/F8iQt2FdxYkNFbi42n0wArg6RB7tIkKYP+uTW0I/kykwXI7uJ5q/Xr+nZ
	Kt7Rk0rYAT0echPWxc0NXlM4JFlgMmIiZ4YheRQNXNSS0V0fAQigz4lBfH7Oujs4fFZNGBE2AaZjP
	HFelsmFh+yEzODEIVkD+/wpfarGw2pBI7WJM/Pq+Os+zxydsuBKot/FogvnwLcXcEVIlBfXR23V6F
	cA8nTHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cVH-00000003PJ0-2ida;
	Fri, 04 Sep 2026 22:35:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cVG-00000003PIj-2eqw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 22:35:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE93B602C4
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84421F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Sep 2026 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561321;
	bh=cjShX4oY7YbHcAVM4iaZJGTrGB0SElIHdue6RXDVlyE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S1cNqucaFHW6mj1AqtTBLFjH4Cf6LX5zm/BOYie6CBytNUQRVA+DFOwR+bf8ajugM
	 5WxLAOBcHTa1qrIPmBbZ2Y5WjEKx7z1vltSxkB/Mtwn+7kANpK+2zJLQZIIxMKup6u
	 qfGglqjzGDhAY1fmIqFMZSVmnzXb2KLlOE9fsbormEscl/1/PpOmnAnNHJUIFl5ckN
	 E9jPBLynaz+haC7aPqJgw2QuY9UmDNTOWxkJ3l9eo1od2a26CQvs/J1+AF1Da24BnM
	 3ckO8IpojGE+yYGzbQ34mObs8x4CsfbSFj00+x3SSRUlr5SFpwgzWwL/QElS8/rRs1
	 F8WF4ng8vY7hQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso2180631e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 15:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByT5wgVPsDajTQ5K2NDEsBN1LPjz7f5E0lgfx44zN7ccZm7AI8WE83FJvMiUEal89vLMd2+8bcmMPzHu8c6PIDm@lists.infradead.org
X-Gm-Message-State: AFuF++kdLoZ6jQxT0urQXiCyfJDmdO5eY+CGjLLlZiJMLz5d8V1/qfxK
	Oa73Q5hMP+65kI49BEgyEeemG2Y99mUjit1Eq64/FhOsrczRLDJ+BTToloJgDXT8BhkLHiZN4a7
	SYzVk7rO4NIidUNV0gabBukGL0uNlIFM=
X-Received: by 2002:a05:6512:124d:b0:5b6:1a7c:fd93 with SMTP id
 2adb3069b0e04-5b61a7cfe67mr1005642e87.57.1788561320389; Fri, 04 Sep 2026
 15:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260904115917.13695-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904115917.13695-1-hemanth.selam@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:35:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6Z-xuq0G9+f_P7q6d=Ztb237FVNO_FOVn=vq0EgFp6g@mail.gmail.com>
X-Gm-Features: AcwNN1WkiKWdoB-SHKS8eBdhTV4jKHtcnkd7zW72aQm4tmI1VLdCqZKMV8LqvFc
Message-ID: <CAD++jLk6Z-xuq0G9+f_P7q6d=Ztb237FVNO_FOVn=vq0EgFp6g@mail.gmail.com>
Subject: Re: [PATCH] net: cortina: fix typo "trigged" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

On Fri, Sep 4, 2026 at 1:59=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:

> Correct "trigged" to "triggered", reported by scripts/checkpatch.pl using
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

