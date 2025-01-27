Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04763C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdQNENxtftTm8HQURKWza6Re6fOF6SeQACQklqs9PnY=; b=b4e+ahVrHl6XC6aSrS/ihjb9zY
	Vt3NLZHktGrWfLcf1kx2rqUhm0K9MILkWF99vEXHyLjC5JzEstnLs1iAVMwMcVMb5upjxnidC7E7N
	EE8fD6t31ux4YTLbH5giAYY4Si1IlxvzkbOBRTa5pdpV4D508p1vpvTj78niJsKJ8l0kR8AtawWXQ
	kAJxAnUSS+IG9ZwkoRfTbUPhASxJf140Sp8Jk3HS7J2Lp0S+q/k8OwMDCZz/3Nm48S1aZ3UpMZI0Y
	9g4n2S9SdAXcBLOY8DBDU3srcAA0PAYdSSZLmu2K/pt1e0XbXEYsH7Gq1GM0YVYu1IhJgqqNxCRYJ
	XPe/GZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPU6-00000002PPq-3uBy;
	Mon, 27 Jan 2025 13:49:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPSl-00000002PD4-3dbI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 13:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A377A41522
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93973C4CEE7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737985658;
	bh=FbHUn/6nLxF1tewy4sIvs0gNS5q6afUqFEF4FNmNk0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AMVppRqLYzLVfnZ7BBtG9j/Ay66+ApyXDcAbhR3CcXbkB0cVpDCYBZCKBC1txKuK0
	 JcR9EikxTyxHbYjtG5aq0U5xlOsBT310c1xBIXNYieRtGTn1H3xuFi+9jJrOVryNcZ
	 hu3FgpSParcE0MPOT5KxTUkC8n9Bv4APXj2+cDx5e1vW7BppQ7Zcui0lh12fARSeOB
	 27QxaCS128Hu/o3aHA7m5u+gLO3OV6rg4RmJzVAmNC0Vv+Rar/oElrsof5EPmwobT3
	 k7x3K93obbyy4KHrRHHDB5BOiHehhDsIJU6F3Ecsm5Lgf5ChF7KTd57fieYzHbcEEz
	 HEoxvZ/p33Idg==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso744125466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 05:47:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXkHjytemt6KPaXKgCUCj2a6SwHJZzVer9kfKNR4fIZ7tQR+/dS62oIR70VC+QvSw8zrgg/+kxUPdviSJyJ8BR@lists.infradead.org
X-Gm-Message-State: AOJu0YydVhr/DW290cM3bIY5oXVE/UBSAfJVY0033oqI6NSBGcRN//a1
	xWKCXBzLxg1ZQWlD2XAheLTnLwxvPKDltalss78gcnwky4+kTk5eDLjA1ZpfsVvlZktV+CWkezL
	3VVwBCoo3QqXjj3mCBfvZczlnTpk=
X-Google-Smtp-Source: AGHT+IEbpxzqSj+hGIg7Y2xBOvV1yF7RmDBDc0hW9/d9I/wEh0AMT4Gd046K0pDJaIciNG24CI6n8R+CzgzXJ/YXqE8=
X-Received: by 2002:a17:906:f598:b0:aa6:832b:8d76 with SMTP id
 a640c23a62f3a-ab38b1919f3mr3874098766b.12.1737985657013; Mon, 27 Jan 2025
 05:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20250127092450.2945611-1-hayashi.kunihiko@socionext.com>
 <Z5dXJ1EIUx8DAh6J@shell.armlinux.org.uk> <CAAhV-H78fbK+jAsootOaZW=eQ3RPna3VQTxHd33vDSueYkyYtA@mail.gmail.com>
 <f1912a83-0840-4e82-9a60-9a59f1657694@lunn.ch>
In-Reply-To: <f1912a83-0840-4e82-9a60-9a59f1657694@lunn.ch>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 27 Jan 2025 21:47:29 +0800
X-Gmail-Original-Message-ID: <CAAhV-H73FNTzhjwkZwO4RAZFF1Ri6EzpJL3jnWW4rPRFZQRZZA@mail.gmail.com>
X-Gm-Features: AWEUYZk9467VQpU4g5ILSGXNQugm1uYVv8NWvcqq21h7HwGtHut0Xw9R2spdAsw
Message-ID: <CAAhV-H73FNTzhjwkZwO4RAZFF1Ri6EzpJL3jnWW4rPRFZQRZZA@mail.gmail.com>
Subject: Re: [PATCH net 0/3] net: stmmac: Fix usage of maximum queue number macros
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_054740_030745_D63EB1A8 
X-CRM114-Status: GOOD (  20.98  )
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

Hi, Andrew,

On Mon, Jan 27, 2025 at 9:21=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I'm not very familiar with the difference between net and net-next,
> > but I think this series should be backported to stable branches.
>
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
According to the rules a "bug" should break build or break runtime or
a security issue, but shouldn't be spelling fixes.

But from my point of view, this series is not just "spelling fixes",
and not "trivial fixes without benefit for users". It is obviously a
copy-paste error and may confuse developers, so I think the patches
really have "benefits".

>
>
>   It must either fix a real bug that bothers people or just add a
>   device ID.
>
> Does this really bother people? Have we seen bug reports?
No bug report is because MTL_MAX_RX_QUEUES is accidentally equal to
MTL_MAX_TX_QUEUES and it just works, not because the logic is correct.
And Kunihiko's patch can also be treated as a report.

>
> There is another aspect to this. We are adding warnings saying that
> the device tree blob is broken. That should encourage users to upgrade
> their device tree blob. But most won't find any newer version. If this
> goes into net-next, the roll out will be a lot slower, developers on
> the leading edge will find the DT issue and submit a DT patch. By the
> time this is in a distro kernel, maybe most of the DT issues will
> already be fixed?
Goto net or goto net-next are both fine to me, I just think this
series should be backported to stable branches. There are lots of
patches backported even though they are less important than this
series (maybe not in the network subsystem).

Huacai
>
>         Andrew

