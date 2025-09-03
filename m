Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E85CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 01:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqb7QCwsVGplKgoZF2uvDFg9BOUlksqxcc7HXtD0FJo=; b=OVPdAifA/2xEMvJMGPS3dNa4yz
	acOUwc+LmURRT8S/WzvnSPyiBmSIKaCVRusIVV9TxEYpZq0czuGjzjqRH02v/6xywxSMlM1v9a/Yt
	EHqWx0qXJOvEczKsM9ml9c7qJBqDI0c8fhH8C2qzVJuGhGdw0GUWH0PXMONMnoumAD3JRmyRvAGSV
	g38ylG6OvBdxJtPpzwqxRDK0BqK0FvAebwaa31lc6uUaeu+pO+KDkz8EcNHzq76fKt3giTxTND5a9
	fCySMM4WBlBXKNrx2kdRcDUNcWDglwvr8sKUUK9zMEtftnV5xFKLcatHCi2Bl47rmjNqzlnkFsNjR
	fmJRB4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcVR-0000000366t-2nLT;
	Wed, 03 Sep 2025 01:41:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utcSk-000000035Yr-1FAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 01:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A06DD6013B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 01:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58939C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Sep 2025 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756863541;
	bh=zOeJ5ngI5GgY1IUOwe+4owS6Ud/kOULo7zVSgkL3p5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z+2lHvAWCl/vO+TD/GRYZ9XtoEazhN/pB71rceWYow23uHBN1fB1jPi5jB706VZEc
	 nNN69N2/v5o09ABUe26G9HN2Nt7RwNncmLFrsYtZzl9BU3EFIlJNgRy35IzG0iP9XR
	 rGL4ClS6Yheul2bjqvaK+musBTCTdwTkFjB3JQq0dmjgdFL/82THwQilqMIboxMA8M
	 TnJl0fbrJe8tjkcHJtN0YM9XEr7T3L0Zr6jWQU8n2m4k6Nqe+OVgHXqJ6YNSX+Ft2c
	 Bf+3u68972YE44fB0dbAbw39K/JGl3Yf3gytBwHNJLJplH24BgwU8PfsrQcagdJB3D
	 VLObaZ/NtlyaQ==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so7381176a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 18:39:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTpt5f+91hGVVDROpU86BFBJ76FSySHWcPQ6fDcqxevbzK52JKzGvNTRKtQDvq5uRsSZ/JRAmKZGT4w7D8DCso@lists.infradead.org
X-Gm-Message-State: AOJu0YwazPNPC9RkbNuo0Wn/SRU3a5bpWAFrUghJV0CKbTIswniD5FAt
	UPuqAacx7dy1CiCpoFu+L/59hQeWu9DvNLIyBlfy59VymURdzAAgNqd94JnKUMOYlO57qDdGCvK
	OZsNjlE4BEnzVoQAFkjrkJHXwsVm0WQ==
X-Google-Smtp-Source: AGHT+IFptbMpMMT2D9FRexdLPIqSHrJPMLwelNoD7hUYbe5eOkeTndk6fldDic2MqA1Vki3qonEvJQY7U6OrawKIpS0=
X-Received: by 2002:a05:6402:42c2:b0:61e:d636:5815 with SMTP id
 4fb4d7f45d1cf-61ed6365ademr1443549a12.24.1756863539897; Tue, 02 Sep 2025
 18:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250902151543.147439-1-klaus.kudielka@gmail.com>
In-Reply-To: <20250902151543.147439-1-klaus.kudielka@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Sep 2025 20:38:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLvF12GZfoZVdHaOxn9uH3axnUT0dHJtD13EQv1rtxQ1g@mail.gmail.com>
X-Gm-Features: Ac12FXxUo1lmvvhdHtzI1m4RbTesfMH5DhqHLkRQGu05jSBfxV6er8SVWtO9ixw
Message-ID: <CAL_JsqLvF12GZfoZVdHaOxn9uH3axnUT0dHJtD13EQv1rtxQ1g@mail.gmail.com>
Subject: Re: [PATCH] PCI: mvebu: Fix the use of the for_each_of_range() iterator
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, Jan Palus <jpalus@fastmail.com>
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

On Tue, Sep 2, 2025 at 10:17=E2=80=AFAM Klaus Kudielka <klaus.kudielka@gmai=
l.com> wrote:
>
> The blamed commit simplifies code, by using the for_each_of_range()
> iterator. But it results in no pci devices being detected anymore on
> Turris Omnia (and probably other mvebu targets).
>
> Analysis:
>
> To determine range.flags, of_pci_range_parser_one() uses bus->get_flags()=
,
> which resolves to of_bus_pci_get_flags(). That function already returns a=
n
> IORESOURCE bit field, and NOT the original flags from the "ranges"
> resource.
>
> Then mvebu_get_tgt_attr() attempts the very same conversion again.
> But this is a misinterpretation of range.flags.
>
> Remove the misinterpretation of range.flags in mvebu_get_tgt_addr(),
> to restore the intended behavior.
>
> Signed-off-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Fixes: 5da3d94a23c6 ("PCI: mvebu: Use for_each_of_range() iterator for pa=
rsing "ranges"")
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20250820184603.GA633069@bhelgaas/
> Reported-by: Jan Palus <jpalus@fastmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220479
> ---
>  drivers/pci/controller/pci-mvebu.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)

Thanks for debugging this. And the code is further simplified which is
even better!

Acked-by: Rob Herring (Arm) <robh@kernel.org>

