Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC85D1951A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkLYQ+xttW3yQLEX/26eoBKkIwpMcw+WYxW9ZXrxbR4=; b=m7eEPX1Whk9Spj8uoTktVzVuFo
	f7U1c2MWC+TyEkkCGxtYb54CFGr0Q1OyBQaPHnWaztF1fI+4UcBw0ak9y9fliegxcx2dTvDTpu1ci
	jTbdIlZIVUoToJt4uRu/B0MXb8CVsbhPKhExtsh3ShmTMziZUADFKGrv1/MjUXXjk9CQ+h5P99FLF
	D6BCvZgHVkpRYBObArsk+EhpVnLP0CsVt3PplK1UITUMuVchENMCCEfSScpTsVIZcNQPr6pXM0Dkm
	0MHfNFoUDXl7aCRx9HN7oxOkcwli0kAo++xu5uA3UHsFH2WksbTjC9Cul0hWseIB/jm1cbtWxXQt4
	U3jzJI2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTQY-0000000DDiT-2MuY;
	Mon, 26 Jan 2026 20:43:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTQT-0000000DDhv-46RO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD57E44392
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 20:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92690C19425
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769460188;
	bh=qkLYQ+xttW3yQLEX/26eoBKkIwpMcw+WYxW9ZXrxbR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=od98iYziNKyiPtw8ldGa9AyuAo/5IjH4LBM762m+6AteHKURno1rOT9HT2tPLdM0M
	 CKo8bWbdU0wMVUWUZQgzTt0YIAXyxe+cdbigJKeDVTqKXXtqQG7sUubHaDVRWTVFkw
	 HoCDuEH92ptJ2VJoJ6e88NLVR8wgfmwk5xfwxTvPoAXwfm+xZgVFzvpk2Xjb4JjtNw
	 HfafeejKzSRGX0sIKoJd2t5qr4YQJa46eaZrslKGq472pKZgqd9T1tDnwjhDtgpe3H
	 YCGJGxVLjyE/0II9IMo89i42MoUc9jHWH0/8cXRqOdEkJ9VzOKi/Tl+vlgN6ZY0Ala
	 GM9wTYG9h2KHg==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-662c42e7897so1429917eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 12:43:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfn5z58Vu6GlvRCU3b/Hk6ZkMIvBaoy8p0Q9ye9cpFiyIR7TRoYJV57HnS4VrNxH9jwxTUtHTHd5AxhY+/4aFn@lists.infradead.org
X-Gm-Message-State: AOJu0YwxZ0KgWtKP7Kq+NCi2a6x6GqGzKFAUzIKWQHrMncuSVB74D1Yp
	NmrQ5iP6fIzhf1r60R/wyBXrTT+dlrZ954LyoCacGK+CRzF350/2kPz+grlxO7oMJ9RnPfwdCoo
	u5il8mAVPi5eibLnhKAHpHUtgalU3NYA=
X-Received: by 2002:a05:6820:4dcb:b0:662:c114:b29e with SMTP id
 006d021491bc7-662e02de9ccmr2478764eaf.24.1769460187481; Mon, 26 Jan 2026
 12:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi> <87sec30yhk.ffs@tglx> <aW3pALPxn4i9fiDO@lpieralisi>
 <87pl751zeh.ffs@tglx> <aW9V4A7lTGZWTO9e@lpieralisi> <aXM0dVthp33yUqj8@lpieralisi>
In-Reply-To: <aXM0dVthp33yUqj8@lpieralisi>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 26 Jan 2026 21:42:55 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hOVO7N77nnyWsh_vhGcm-TzavrGBgci=a+o_-LKhkuXg@mail.gmail.com>
X-Gm-Features: AZwV_QgIu0Sq3ZvSpiujHJcegyl-N4Pxcc67Z0kbWXZrvS3aL-fZTGN44hcX9YU
Message-ID: <CAJZ5v0hOVO7N77nnyWsh_vhGcm-TzavrGBgci=a+o_-LKhkuXg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_124310_059204_0B5AA008 
X-CRM114-Status: GOOD (  19.65  )
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

Hi Lorenzo,

On Fri, Jan 23, 2026 at 9:42=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> On Tue, Jan 20, 2026 at 11:16:00AM +0100, Lorenzo Pieralisi wrote:
> > On Mon, Jan 19, 2026 at 02:54:14PM +0100, Thomas Gleixner wrote:
> > > On Mon, Jan 19 2026 at 09:19, Lorenzo Pieralisi wrote:
> > > > On Sun, Jan 18, 2026 at 03:47:03PM +0100, Thomas Gleixner wrote:
> > > > I think the simplest way to sort this out is for this series to go =
via
> > > > the ACPI tree if that's OK for Thomas, given that the ACPICA code w=
ill
> > > > go via the ACPI tree anyway and there are other dependencies on it =
there
> > > > I assume (this series is fairly self-contained).
> > >
> > > I'm fine with that
> > >
> > > Acked-by: Thomas Gleixner <tglx@kernel.org>
> >
> > Thank you Thomas, Rafael I hope that works for you too, please let me k=
now
> > if there is anything I can/should do.
>
> Hi Rafael,
>
> forgive me for another ping, can you please let me know whether you can p=
ull
> this series on top of acpica changes for v7.0 or it needs to take a diffe=
rent
> route ?

Sure, I can queue it up.

Thanks!

