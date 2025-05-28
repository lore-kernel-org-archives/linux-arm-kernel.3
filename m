Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46007C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=; b=L2z3Wa/EaoStMjoNQD/BHiPHB9
	CWpQIl7+OUUVG8YVHADev9Yu85NjDNerVQ3f9F8fEh40bRbtFQQRS3SoQDSi7wCY20JlqsQSt2Xov
	eIL4ySSFj/c6Z1LdAKPOxbHm9B5+SXkAZyOS/ap/xu/NxzyEkP9KluloHP/dmiz6BD9X3J4uHUWhS
	J0Trb6ycPCtIZN9JY7FtD/znkpltRK6QfvywW288R0HSRw6q+dD4q0I3KNejYpz/zkFEt5/lmiH+D
	ngJk0QpPJEihIYR5TEwoXpTUCdBMe22K27DCppH4BJGw73YiiJyV/IRvow2JJXASqlXRf27yxBnYK
	GLUrUhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMky-0000000E1A9-436f;
	Wed, 28 May 2025 19:48:08 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMin-0000000E0mL-33GJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 19:45:54 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-87be9d1fe01so40548241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461552; x=1749066352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
        b=My/cEBmE65WqDBfSgs61Oajne7/IqT/ZKeF6hBd7u6sxIUXikP5YFppRszbfpRnqfh
         AqVk4D474o/ad8fOrbnw+0H230CxaZOg9tU6amAQEN6ka75eCIm9RWPeJ9BfkSIhRelf
         Se/UrkMCpnASW4bXZNiXDvPUk33HvDBMtij7XXG2XeHeqlzStnSHZrgAVD0Qm8aORKlc
         FlDZC89uhaXUqMvMGdURXyYeb1mhyR04XPU56K00IL5phzG1Zi7IMoUk7hGBwF+dB3NJ
         KtN/1lCNl/F+qbW5BT5hhgmiTLTiRjGFFCkCgIQ0DuhW2ye3WNgmTvAJKpP4Fq5R3yCd
         TgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461552; x=1749066352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
        b=nXKK5yYAtdvt696BfScXpBoU5460CWTRQ2zENDle8Gi6yQiM3kkZnYUBZvLzHc+l8d
         67OyLri3bX066c+Lx6aKCg6x2BijBgkVRtj+PC/zTkdnmrvcBUDMzqAa8jueFZbkLfC/
         D4oWXC7M9EgMe/Ij1JMsKcZep5r5nP1LpANB4xjKrt8QJqp911FNBf1iWPLTSJEP/QWK
         Yw3UZA5v/+pM06aV3uraS66E8mTVnI0dcWec4zWcVDRca96HiCEumvOr7i3f4OXUgvxd
         zCz7pTScOctzSW0D4MyRYVzJpaRVSeySr6NsnG+9NXN1ZHpJ0BcOhjSoJCGp3nzlpTA7
         B3dA==
X-Forwarded-Encrypted: i=1; AJvYcCV/eIZ4Er7hlA6YiRHEZ6SN1wfxaez8UAVw2NIRaIquGvPj20BIDBonhkG2tVJHIinahY/gPesWZT5HVkX1SI7s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy83ih3N1w89cKnZUnoa2+v3lUUC35E6F4tMqLk/bWPgpsn01r7
	gAj9g29XJNO83fsx0BDYn5esFSVYIYirPtAZeHStmc702/UtfmSuWhSy1hXf3VXClbanCyWEYXC
	qLtlAMlYKOPOcEbg6cNb+4qgfsMR6KPI=
X-Gm-Gg: ASbGncu3DpOKvFzCrxJSdgqFUBQlxzhb3mT7KMS2GCzPP6dOQrECG0Z/I4Da9pwnahZ
	GjlqAQofUkGptmyKvqxsoLJgyGk8OO4Iwm2NhboT/skDfIYviN8/sgH0lE41nRLAcjNepvbTkUj
	7e+VAQfXeEHCPUEOQn/ukU+hIosx4fDBI5LA==
X-Google-Smtp-Source: AGHT+IEMvKPgfShf/MwU8EBntmzL2gLB5r9MeIt5Zff5sN3Hg4sMdylM4vuXLPE4sTB9F/25CeOcTFcD0aTeNKmZrbs=
X-Received: by 2002:a05:6102:441b:b0:4e5:9fbe:79f1 with SMTP id
 ada2fe7eead31-4e59fbe7f3amr3865881137.24.1748461552237; Wed, 28 May 2025
 12:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk> <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
In-Reply-To: <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 13:45:40 -0600
X-Gm-Features: AX0GCFvXBPujHS6_IsJk8UZ1tZBvuuAf4ZznRV1htx1eM1HjStthmVFSfduasE8
Message-ID: <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, wens@csie.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_124553_765243_81E4A303 
X-CRM114-Status: GOOD (  22.44  )
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

On Wed, May 28, 2025 at 1:27=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I think a lot of ethernet drivers use phy_find_first() for phy scanning
> > as well so it's not limited to just stmmac AFAIU.
>
> You need to differentiate by time. It has become a lot less used in
> the last decade. DT describes the PHY, so there is no need to hunt
> around for it. The only real use case now a days is USB dongles, which
> don't have DT, and maybe PCIe devices without ACPI support.

I mean, hardware probing features for this sort of use case have been
getting added outside the network subsystem so I'm not sure what the
issue with this is as those use cases don't appear to be meaningfully
different.

> I suggest you give up pushing this. You have two Maintainers saying no
> to this, so it is very unlikely you are going to succeed.

So what should I be doing instead? It's not clear to me what the issue
with this approach is as it appears to be a rather non-invasive change.

> I personally don't like depending on the bootloader. I often replace
> the bootloader, because it is a crippled version that does not let me
> TFTP boot, does not have flash enabled for saving configuration, and i
> want to use barebox etc. I think it is much better when Linux drives
> the hardware, not the bootloader.

As you said earlier we don't want to rely on the bootloader(which I agree
with), so it's unclear how we should support SoC's that require runtime
autodetection like this in the kernel.

