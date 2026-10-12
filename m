Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D07CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeD7D4aQT6ubnrlyd315JiScycX+b5znCR9PJwP593g=; b=kVRxGRJQkOlHK4WJ5l+j8WfJHo
	JgWkgpZrLgAIPDPPrKAutG2ciSkz5Abk4OaUy8zWLSCU+xyvq/+vqof9BQgfHLliRYB9zmhWvcRQ5
	D+OB5loBcZtFsEtawePX14TQUfFF/0C+8c6CnbJX7g0zgPixKsi6632IRBMRj+R1MZ2nNeDdYHRPX
	ZjQk1uhJdTcGfJRXQ7MyIzw2UWwFkjaUqks6ZZPT8MQBwPFIxbOgnANBO441Jf/r5QM3DgvXp1nrQ
	WzPMKiCEQ3nw65i882S5+9dGT2mIKQhVj2UTjKVdY53xQh8ElajkaCOkWo3ntqJAHMP9I9Sp9fo2l
	mkdHVrnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKuP-0000000BG2v-3aXx;
	Mon, 12 Oct 2026 18:38:01 +0000
Received: from out-48.mta0.migadu.com ([2001:41d0:1004:224b::30] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKuN-0000000BG2O-1KlF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:38:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PAJwNoyeV9qo8z7bFLcFxGpJsVQgzwLwwepP4CadQZ8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791830277; v=1; x=1792435077;
 b=PlhnKckC3xVjTIgA7jkgMz+6uNK++R8qduphQEm8UXYeMi4ik9yo1ND3wI8BnrHqEozKOJLf
 6GE73bBy+LDfY84oVf9Bg9tI/2AI5i8FNdSWKvf9k3i2GuHla8TpbsH6bd9BRcZ9yu+VoNTwVGw
 ISwGGNwok5dqUXPrNAOVuAF8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id effd776211581a53;
	Mon, 12 Oct 2026 18:37:57 +0000
X-Mizu-Trace-ID: effd776211581a53
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so10935e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:37:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAQunP9wtkgrLwi7MSwSTAETplmXvQoq34OFT/ZoVHGZJRnmvk92DO1xfXBlGv1WTukcWlC9eYzp2d7/L1gNIM@lists.infradead.org
X-Gm-Message-State: AFq9FYK2nJjvF4sGXqaj6L5SHcqEtvi1XNSKokVqa5qvgEeMi/EhMGgS
	js5qB17UqYywa+3GH+e1UfY5u9gI3s8nKS9YCP1wvx0YjyagYR5Kv+lmS/wg5dnZ04EbudwTx5z
	pYz7sNQGuL2ek//HaUNKZMIaMBtrgSyph8hMM/QWq
X-Received: by 2002:a05:6512:6204:b0:5bc:f1dd:f0ac with SMTP id
 2adb3069b0e04-5bcf1ddf0c7mr137133e87.1.1791830271913; Mon, 12 Oct 2026
 11:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261012084743.2228612-1-fuad.tabba@linux.dev>
 <8633ub2mlg.wl-maz@kernel.org> <CA+EHjTwyQPPVG4tGY0i0DRk=kwbdEmjca6+GNjLDXrGxkNbMOw@mail.gmail.com>
 <86zewi23ga.wl-maz@kernel.org>
In-Reply-To: <86zewi23ga.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 12 Oct 2026 19:37:15 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy1zAoOH32hsf0cHZGP1C-=uVBSJS91QGZ3_-NkKJEKhw@mail.gmail.com>
X-Gm-Features: AclHuK_918Jtmjw5j4JcpJhTo2ueYx7ntIhbD08RWsI09XibC9OrOgTwIR86Ta0
Message-ID: <CA+EHjTy1zAoOH32hsf0cHZGP1C-=uVBSJS91QGZ3_-NkKJEKhw@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: vgic-v4: Don't forward an LPI with no
 target vCPU
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_113759_494638_B18DB280 
X-CRM114-Status: GOOD (  21.45  )
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

On Mon, 12 Oct 2026 at 19:12, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 12 Oct 2026 15:13:51 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Hi Marc,
> >
> > On Mon, 12 Oct 2026 12:18:51 +0100, Marc Zyngier <maz@kernel.org> wrote:
> > [...]
> > > Isn't the core problem that we don't correctly handle the UNPRED
> > > double mapping of the same LPI? I'd rather we attack the issue at the
> > > source instead of papering over the consequences.
> > >
> > > I hacked the following, which is obviously untested. Can you give it a
> > > go?
> >
> > With your diff on rc3, the second MAPTI is dropped, and forwarding the
> > vfio-pci MSI to its event leaves the host up.
> >
> > However, a vgic_irq outlives its ITE while the LPI is pending on a
> > vCPU, so the check also drops a legitimate remap: a guest that
> > DISCARDs a pending LPI and then maps it again loses the new mapping.
>
> But this is yet another bug: 5.3.4 is pretty clear that DISCARD should
> get rid of everything (pending bit and mapping). I reckon this is yet
> another case of the initial implementation being overly worried about
> kicking vcpus out of the guest when destructive action is required.
>
> We should fix this.

I'll add a patch to v2 that makes DISCARD clear the pending state,
kicking the vCPUs out of the guest first when the LPI is queued on
one.

Cheers,
/fuad


>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

