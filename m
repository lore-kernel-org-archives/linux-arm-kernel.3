Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE79DCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS9MMjBWMQqyNg08agfQFcVT/1XkZ5RtW9KXjSv4aHI=; b=DM1f0JCeokDm+sPaCmjlPlvj4s
	bXPcaWAqExWk1tbYZsdJAvjff8P/HXWnUF0DROGO/WerMzolT+Aih/D/TPlGmqu14kU4eTH8gO+qH
	LWRZiNGqm1M71qqhlIEAkDmnO1zDiMji0XFD0eqdYdvqnk/zRW/DbuVmWrP1FDEryHiSpna9JkM85
	RNBATX1jn+/dhAkFQkGISmy71u40zszUdZiViGg3c22dj6wu/DwRjcRhuCMkma0naxgA84C/wq/3f
	nCU9ne4BYaOs44yMWyKNWbSiOIWU7AcB77JzKJt3D4cRVs2eb7HTlQwZEX1UlV7R1Q0gMK2EY5tF+
	wYZBZZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPa2o-00000003cXm-2SNE;
	Wed, 20 May 2026 06:04:38 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPa2k-00000003cWq-3uOh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 06:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779257069; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=zS9MMjBWMQqyNg08agfQFcVT/1XkZ5RtW9KXjSv4aHI=;
	b=vnIbJeN72rFsRoLz6kdhmcHKKC+LIegqJUQDuXcVGfuok3T3JMcDhN+gFM1I7h35vLXv8o8uFEXQGHWF0S65qS/Wo4v+O6hMaQnTsx/EM771aemgZ9sixF9P6Jva1z26BG1kJxsiTodgiIcQZmvQCpj/xUo8F3tuzeOOcabmTjw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0X3HXL1A_1779257067;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X3HXL1A_1779257067 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 May 2026 14:04:27 +0800
Date: Wed, 20 May 2026 14:04:26 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Michael Bommarito <michael.bommarito@gmail.com>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic-its: reject restored DTE with
 out-of-range num_eventid_bits
Message-ID: <4v4zv3y5yxwkfnouqcjxhrwxvnpd7c4oodevrcgivxu2aeaiyg@2b3arv4mmv7n>
References: <20260517174955.273004-1-michael.bommarito@gmail.com>
 <w6zdprlry2y37wtkirv4zhiy5awau3stbkjohmvfwkswgoaafe@ul53z6xwyuhw>
 <8633zpxh1v.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8633zpxh1v.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_230436_135101_9C0354F5 
X-CRM114-Status: GOOD (  27.05  )
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

On Mon, May 18, 2026 at 09:23:08AM +0800, Marc Zyngier wrote:
> On Mon, 18 May 2026 07:05:13 +0100,
> Yao Yuan <yaoyuan@linux.alibaba.com> wrote:
> >
> > On Sun, May 17, 2026 at 01:49:55PM +0800, Michael Bommarito wrote:
>
> [...]
>
> > > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> > > index 2ea9f1c7ebcd0..a5dcf9a6a2854 100644
> > > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > > @@ -2307,6 +2307,15 @@ static int vgic_its_restore_dte(struct vgic_its *its, u32 id,
> > >  	/* dte entry is valid */
> > >  	offset = (entry & KVM_ITS_DTE_NEXT_MASK) >> KVM_ITS_DTE_NEXT_SHIFT;
> > >
> > > +	/*
> > > +	 * The MAPD command rejects this case; mirror the cap here so a
> > > +	 * restored DTE cannot install an out-of-range num_eventid_bits
> > > +	 * that vgic_its_restore_itt() would then convert into a
> > > +	 * sign-extended scan_its_table() length.
> > > +	 */
> > > +	if (num_eventid_bits > VITS_TYPER_IDBITS)
> > > +		return -EINVAL;
> >
> > Hi,
> >
> > IIUC, the same issue is still there when VITS_TYPER_IDBITS
> > change to >=28, I know it's limited to 16 in GITS_TYPER's
> > definition. I mean the issue is still there w/o really be
> > fixed.
>
> Change how? This is a hard-coded limit that reflect a practical use of
> the ITS (and is already 32 times larger than what PCIe allows).
>
> Are you suggesting a possibility of making this userspace
> configurable?

So far No, may until one day it has more than 16 definition :-)

>
> >
> > Change the scan_its_table() and other related code path to
> > avoid such date conversion issue is more reasonable
> > fixing to me, please also wait others' input yet.
>
> I don't think this is a reasonable course of action. scan_its_table()
> is generic (it doesn't know about any table in particular), and
> assumes that the scan parameters are validated upfront.

Ah I see.

I thought that even w/ chekcing VITS_TYPER_IDBITs, the
size_t -> int -> unsigned long conversion is still there, which is
big -> small -> big, looks odd to me, so I thought it should be fixed yet.
But it can't fix this issue directly.

>
> Thanks,
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

