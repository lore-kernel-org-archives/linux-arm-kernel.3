Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32B7CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzQapWcP2ymqddngP+24xFPJC/OcI9E0rn+PY/NrRy8=; b=CkcQMcBv+Ap/nLTGnJzKectruW
	P/2t+321fAcVrGN/F9NbBal59KRMcauou5nMRh0xQpRU/HMWISneCM0E5cpapcHK0h37HPqEUZDmE
	CAtK+s9wh9cOhW3nTasAVF5yViSr8eFhe/SMGAMoCfGtdD78KFDdU3DC/KNes0vTVUnH3P7he5YSz
	0FZJC/SzeoB2ch6a9uhJlEXvfnZfEYrj7ymV4272SJ6Q9XSzfbByPXsMJ3BtZD5LDJp0iYWCXx5z6
	1osDCNg2wPFIierUyGYpHzWd0PFOEqA49VT9IJx9RzQJjcjsJ3BjNqIaoms6yg9MnU69/IN5cdiN2
	xrJn7KvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWM6g-00000002ZVQ-2MkP;
	Sun, 07 Jun 2026 22:36:38 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWM6e-00000002ZV0-1fqh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 22:36:37 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51765531803so1579891cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 15:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780871795; cv=none;
        d=google.com; s=arc-20240605;
        b=F+uhsnANCjy3UPfFqtK3UsfnBYnF3BdgYm750l2G/hjrOwo9SuCngtSLGQ3QjwfmxP
         H4eJf+LZrYz68VEtIbiTlDiqBGT5vF/ho6WvC+c1ze1IHfD1GW3SjABjKp3e7lCkD70+
         SMvL/8Fhkm5qvL3PRE+Bzig8bo2tJiMMcz7/sryP8NIyHKUfHpZzI0parpf35nZ5/+sf
         KIZgKKSDBjFXXHPAHeCzW68AQimLrfc1v3rrl7QFam/UBVk4VB0dAzZLoIw5vsVg9Myh
         BOCBcNzWZ84pchio5OFFcjpUJ4W8RBPHFTuApFmpAf0D0wS1QxEpDspxC8tixOtdF7XB
         s33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NzQapWcP2ymqddngP+24xFPJC/OcI9E0rn+PY/NrRy8=;
        fh=tsD0nbGq38HT+/cGJ1KsJNpkKqnMxsldv7MxDr/yebk=;
        b=Su4T/1xNiqejZaUIIPS4lbZQkMly5Hr2lTOw02VT8uDI9ZwoAFhFtz1d6PSwKbV+8O
         fP6xT/dmqMveYxc1KL29+/wLDrQYGOWggPAv23RxmbGYZ0VyO1BblOgvytwgAzCas64H
         vQwlrm+AmVLS7Oolmnlbd6Y/6GFfnKun+0WvCqYc5y5SKo48JkSFvzWLjdf95gMXXQsg
         hTJ5yqZ2Gyiv5hINZ3FSGm1PHYj9F6aqKHCtAmFv2p79aJ/I/MekYyu0LlUibhfAJe56
         2NPviRtqEvZ4B4FYpG9FItXc/6UmGe01UqWOqbCEnfj36vIoPsZRsmWQMr94+HQETqaL
         gzpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780871795; x=1781476595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzQapWcP2ymqddngP+24xFPJC/OcI9E0rn+PY/NrRy8=;
        b=e9p+l8W21P1Tsch5QpaLWq2qqir3IOOklEHhrNyLNS51gUT9R9HVKFLWV1ENwl+ePe
         LOZHuk8dM6laYJw+87B6SE19Aj/ClUatbRuCuy1jUZ6g+3B1uWxCQ+N98cyg7Okidf0A
         uMrfbg2691BObA87JxqanPNL3oNn6MBCPPp/jHMvuNb18tu6XJVRAz9mcdtpcbL0YnLV
         q0P39CgtXlIoD5C1v53y8kC6LNfwm8T7nrwJjdvJ1qVk4QFPQ3lG4faBmqKLmL50xoEC
         7yuNdGA+2/eoxXKz7U/xlzPN5MHQD7J1kUINkvi74+HtB6yS3w6upbu8Dr9r4ul4wpxw
         rtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780871795; x=1781476595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NzQapWcP2ymqddngP+24xFPJC/OcI9E0rn+PY/NrRy8=;
        b=U8ms5XFWJEnkDifboJoFqYmgkBgrEq56FITDsegxPjhQHFvk6f59wGKc7SeOmGKDBL
         7c/7a5P7atA4U8hYqHqYbSQ4xV7T1dTwqN+L+C28E2KijMpeAXyIAVzKuCbPdPuUPv1a
         pcvJcAIWoJpfGJl7HAm/tPa1LsFEqNpU4uTdvmB10qbala8aFpoq1Q02ORPCjV7zZMLT
         t3BqEgq8KEXa0Gc8Jn+azQa0cnClp6u7BNheto7JnyinGuvqYK9MsRzua4EVjdD2PJg5
         Jx/Tauy7CmHNQNs69mKR+Vpn/zpf8sLa6x7kd61BABqW616VZQxG+JmjbN8XfwvfmPfM
         OxCw==
X-Forwarded-Encrypted: i=1; AFNElJ+xJyMX+UubLOZuNunmU1vT9XfQIf/UQlSGk1FsU5mVuPQpg6GY4HgZWftSZi/SePZK+RS163eBN+vPhYI8kd5h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/PEK0n2pPRIoB3TDkiybrO6ZX7rRltZe1P2KjNY2MFHw6xgF0
	cyGSqVw9NZ6OFcmsu/YIdZPrb0x9rbKR228K6NjIoGIREvJTndt2dAkr69ql6JXD/bhTYvB3yyL
	VNhcCGvp69leE5GCJDftZaQKL8fEXQyuglZWup0g6
X-Gm-Gg: Acq92OHcyoTOeXqiW1XmRL7/N/JauFh/oXD3uZLJbHSZ0KveZFHXJf2pR1w/W6l0LgM
	tKWtCuEoZJnqLpCeWLb03cGyd9IIk0GzXV7/vWR+QhLeAYv95JgQAr31fB0Ao9+nR5LVc6u8Re0
	b1AAfkieosQM5P5Yg6m4nwAlE34n+U7VcbgAAif+tPQ7LJt9BfTQAbHxrpeoaH1gxXTPGS8bKw3
	6OPP2l0JAVd3H/SkuTXjH4YIlHAWVJ5r8HCDcLFXRj/ZRyR0IpeAmiBMQ28rQBBEIBoIeaNnb60
	yf+HmhWWtHldqYw=
X-Received: by 2002:a05:622a:7b13:b0:517:5c70:46bd with SMTP id
 d75a77b69052e-51798cae59dmr16918231cf.11.1780871794443; Sun, 07 Jun 2026
 15:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-10-praan@google.com>
 <CAE2F3rAYWMq6DO5k20e4iMtPbh_X9JeiU8kUfw8nsS5xs42F_Q@mail.gmail.com> <ah7IoJqmRbK7xK5-@google.com>
In-Reply-To: <ah7IoJqmRbK7xK5-@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 7 Jun 2026 15:36:23 -0700
X-Gm-Features: AVVi8CcBpwT5j7IGxPrmPgiLAQbAn4sKZqb1wXuCaNfPlpIEArZNRn7dVWRuI0A
Message-ID: <CAE2F3rDuq4FYrQSZ0dK535DB0uOUgCZdsRvGy0JVeaOR_fLbgw@mail.gmail.com>
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime & system
 sleep ops
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_153636_473368_6BA26247 
X-CRM114-Status: GOOD (  18.02  )
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

On Tue, Jun 2, 2026 at 5:12=E2=80=AFAM Pranjal Shrivastava <praan@google.co=
m> wrote:
>
> On Mon, Jun 01, 2026 at 10:25:41PM -0700, Daniel Mentz wrote:
> > On Mon, Jun 1, 2026 at 2:59=E2=80=AFPM Pranjal Shrivastava <praan@googl=
e.com> wrote:
> >
> > > +       /* Drain the CMDQs */
> > > +       ret =3D arm_smmu_drain_queues(smmu);
> > > +       if (ret)
> > > +               dev_warn(smmu->dev, "failed to drain queues, forcing =
suspend\n");
> >
> > Can arm_smmu_drain_queues() be called after cmdq->lock is 0? I think
> > that way we can be sure that no other thread updates smmu->cmdq.q.cons
> >
>
> Hmm.. that wouldn't work for impl-specific CMDQs as we STOP and drain
> them together in a single function.. maybe I'll factor out setting the
> STOP_FLAG on impl-specific queues as another impl_op, gate the queues
> first, wait for lock =3D=3D 0 and then drain_queues?

I'm not familiar with impl-specific CMDQs, but what you are suggesting
sounds plausible to me.

>
> > > +
> > > +       /* Wait for cmdq->lock =3D=3D 0 to ensure last CMDQ_CONS_REG =
is written */
> > > +       timeout =3D ARM_SMMU_SUSPEND_TIMEOUT_US;
> > > +       while (atomic_read(&cmdq->lock) !=3D 0 && --timeout)
> > > +               udelay(1);
> > > +
> > > +       /* Timing out here implies misconfigured Runtime PM or broken=
 devlinks */
> > > +       if (!timeout)
> > > +               dev_err(smmu->dev, "cmdq lock !=3D 0, forcing suspend=
. Polling CPUs may fault.\n");

