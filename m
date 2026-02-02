Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E69E7314A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/InJPHvERGCp1LsWMayuS4ifK01C+WuQcizR58ez5zo=; b=IxZ6D9s+83qsfXDB1SZTd3nEsM
	72PaxHfIcTIes6fVg5NR6S3BGeH2X6lNw12MBFjlLXdwLXcQUCP7WmCbbhz/l2AvV0gNfjbBtecqW
	ZEDLrrBg/bFVFV/kTnZgqq1ltwlUhfF9sYXmnYOU4nwOeAJ4Q74voDsOJ7V57FauJmCdwHCi3CRcG
	UNFlJQgiz6H/gV1aW+vNSoykDBGjReWiEfrBqsqEMYoFUZeqgRY8J7YiW4AuWtljGQ99RmQIpobYL
	GBmpK0ImqaLtyY8r3N53yrqRcKGGEjgkKpjufEfv05JLRtX6v68F/tQh9rV5rno/fdYRrG0JOlZlp
	bgUdkC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpvq-00000004gaU-1h6k;
	Mon, 02 Feb 2026 09:09:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpvo-00000004gaN-47yY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 09:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 417D560126
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Feb 2026 09:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7C4C116C6
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Feb 2026 09:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770023355;
	bh=/InJPHvERGCp1LsWMayuS4ifK01C+WuQcizR58ez5zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fb27v97jb7yojGjO654DODgvw1pdwG8+XtoNd5LeLCeapI5/YLEhgsXknrAweZs7H
	 OZsgwYOprhM9N4p/oc+5IpRANR+UJWKKQAbtAZGJ9GezKq6vFHVNTkXpU/XRj0MG1h
	 x5W/wZFtXsLEnTctapdgLnIs0hhMzqIOwhnkyO9qsfIAeQtFAv2uMRRysXjBAokfpM
	 JOTyp0YohpHQCob7NTC/jfCqTilRz6qt4dTtf0XbTvcVtC7uoz7XT7KuWGxMMR5o0k
	 3OIYBREEWpjiz4e9pxP9JgK/YKzRkGKYjSolLiQuj3uTOkuAZFwBMk0cBtK9IqZcCB
	 bo1zETTCTNnyQ==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-649b5f5570fso1895707d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 01:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaN14XU1qbkX5GAmdnPdM0KdTy2tNdgilbW1ZeyWN7776tfs9Qpi+y9Y+hjTjnB2ljG3cCpqnXEK8/kEQVY9Yd@lists.infradead.org
X-Gm-Message-State: AOJu0YwTlHooGblYRm1zyecn6VIv6xuXDp6PL3NLtZ6fkDxAWEDE6Lhe
	cey6yZUMba5VsbN7ksBLgW7ririeNfscTFivXtRbnblsaADETOaUW3iKztl/6SQwGzXhzR0VH6J
	2Red8joEu989C86wyzESccB6VFA880+k=
X-Received: by 2002:a05:690e:118a:b0:649:4621:92a3 with SMTP id
 956f58d0204a3-649a8e90d32mr8031455d50.45.1770023354348; Mon, 02 Feb 2026
 01:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <20260128203455.38569-2-stefandoesinger@gmail.com> <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
 <1848649.VLH7GnMWUR@strix>
In-Reply-To: <1848649.VLH7GnMWUR@strix>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Feb 2026 10:09:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
X-Gm-Features: AZwV_QiXXxRz81uzVh_2upCA4sYYxurDk7-L4zykHjdd2gbxVYQpKymeIjnMhMU
Message-ID: <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>
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

Hi Stefan,

On Fri, Jan 30, 2026 at 5:38=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:
> Andre Przywara suggested switching to 64 bit via the Reset Management
> Register. The RMR seems to do nothing on this hardware (https://
> lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099787.html =
is my
> reply in the archives).
>
> We don't have board schematics or datasheets, but I guess AA64nAA32 is
> hardwired to 32 bit. Maybe a GPIO pin can control it, but it doesn't look=
 like
> it. We also know of no way to reset the CPU without resetting the rest of=
 the
> board. (since RMR doesn't seem to work)

How typical. Well maybe this is just a new breed of 32bit machine
after all.

> In my previous research I came across the suggestion to do an eret from E=
L3 to
> EL3 and set SCR_EL3.RW to 1. We'd obviously need to set ELR_EL3 to point =
to 64
> bit code. However, I haven't actually seen a working example of that and =
my
> own attempts just ended up locking up the CPU. I don't know where I came
> across the suggestion the first time.

It would be my intuitive idea as well. After all, ERET is the way we do a l=
ot
of things, such as start processes in user mode. But if it doesn't work,
well then it doesn't :/

I don't have any other ideas than to proceed with a 32bit port.

Yours,
Linus Walleij

