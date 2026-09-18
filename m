Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D568C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYugkT6Di0jbYv1UAzEIZo8saQPIqR8KhdoKc68MYJM=; b=jlH4j7CmNX0znGDw+E8sNtbxPQ
	GCOk7QQqhlYTWUEmS5rp+13Y+VS6snyniHZwQnPUrAaIruLX/sH7SF6OWJJMDd99s7CFe70HNmpLH
	OMQsvnvwZwCgwthyOZY8f9HV8KuiPFfjl4IAUURQg1y8TpJMstwQPmpeUzx15OzeyXAqps+1n/wBT
	el5gWuAqfRIGmkrKGhYSAU7Kip8GhEslwdQvGikrvUu6dwyjC7Ml82bw/BBEq4v7XwcpbC04GStPf
	3gb4chGrwfSDVaB6givtv/H7HzN4752V4BNendXzCfRQ2v8XhOGafSJznnoUEn7kawTxdPsqXtm9i
	MVyY8AJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bB9-0000000EyQf-3cPt;
	Fri, 18 Sep 2026 16:11:11 +0000
Received: from mail-244119.protonmail.ch ([109.224.244.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bB6-0000000EyPV-43F7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gdead.co.uk;
	s=protonmail; t=1789747865; x=1790007065;
	bh=jYugkT6Di0jbYv1UAzEIZo8saQPIqR8KhdoKc68MYJM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QUlukx9NLHkxAiw1rLyylAh+/rSyoAQ3M452KnM9UIhFciLsemCxSNp1dm8HQVPr5
	 Tib4wfR/WFgLJmxND443x7M0/zzE82ViuRj88zAbe5Zx/i7eDF96phaYQ9zT6Ogu2e
	 9zQ8MeF0g9EFydWi6sZwVr7vGCNNZ0DE1HrZIfd5MhcF+AtPGGUiCai9wc+GYlbCKl
	 X2Deev+GIaq25qz4u5n56spX6Z7fMaNl6ZaCLd6C1rFAX911LUK9MxRi+ZVQM5jve/
	 a1XT/SGuc4Dsjdi7jjwI6XJXNz9AZZyfsBzsvQ3a2P1hMMy3Z9KB3KRRU96fR5BS5X
	 b8xPase5C39nQ==
Date: Fri, 18 Sep 2026 16:11:00 +0000
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
From: No SPAM here <nospam@gdead.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG?] Possible scheduler bug on Rock 5B RK3588 on 7.2.5
Message-ID: <xGiWqaX7b8GhLlCq5j9_HQ4_L9QWBKmOCsGtfwlLj_hvU8X14OFNW0JWnELcIitXbkxa0JbsyNPLfY8YA8CnRJ6mI2IzJ3kNNPoShy3xcs8=@gdead.co.uk>
In-Reply-To: <11cdc24a-962a-4f44-b91c-445c2ac80c02@rock-chips.com>
References: <f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gdead.co.uk> <d6232ccc-9876-435f-bea8-43cd169dd185@rock-chips.com> <BxAg81spRPHPsVOcNI5jR9tsii3Wi5a_k_BYW6owu3n6D3jn4N6dbkksomSb82KFdp8nT-mY4cyiZzDFHCqtuskOIYxZwBOzAvyYVRy18KQ=@gdead.co.uk> <e045dc5b-5b03-4840-ade9-2c8f98c8c885@rock-chips.com> <iENNazJ40aK7PPjVcvf8KUzlTm4HMyT85UPc2ez-MfyeJjE2HWX1ujGXIA3BGRwegyOJEZQ86kV7UElMjyBc6V5uCkGyK4NRCdw74ZfJwI8=@gdead.co.uk> <11cdc24a-962a-4f44-b91c-445c2ac80c02@rock-chips.com>
Feedback-ID: 206881191:user:proton
X-Pm-Message-ID: 3e86da51f591c6a521b15e8ec85b91a9b4d2988a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_091109_802198_5A13B83E 
X-CRM114-Status: GOOD (  17.54  )
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

I have now retested with kernel 7.3.0-rc3 and this bug appears to have been=
 fixed. The same command now runs all 8 cores at 100% for the duration of t=
he test and the resulting numbers differ (in favour of the 6.18.52 CLUSTER=
=3Dn kernel) by a maximum of 0.25% which is measurement error.

Thanks for your attention. This can be marked as solved.

Trevor


Sent with Proton Mail secure email.

On Friday, 18 September 2026 at 02:22, Chaoyi Chen <chaoyi.chen@rock-chips.=
com> wrote:

> On 9/18/2026 3:15 AM, No SPAM here wrote:
> > Hi
> >
> > On Thursday, 17 September 2026 at 03:37, Chaoyi Chen <chaoyi.chen@rock-=
chips.com> wrote:
> >
> >> Hello Trevor,
> >>
> >> On 9/17/2026 9:21 AM, No SPAM here wrote:
> >>>> Would you mind trying to disable `CONFIG_SCHED_CLUSTER` and checking=
 whether
> >>>> the problem still reproduces?
> >
> > trevor@rock-5b:~$ uname -a
> > Linux rock-5b 6.18.52-current-rockchip64 #1 SMP PREEMPT Mon Sep 14 11:3=
6:19 UTC 2026 aarch64 GNU/Linux
> > trevor@rock-5b:~$ grep CONFIG_SCHED_CLU /boot/config-6.18.52-current-ro=
ckchip64
> > # CONFIG_SCHED_CLUSTER is not set
> > trevor@rock-5b:~$ sar | tail -5
> >
> > 18:50:15        CPU     %user     %nice   %system   %iowait    %steal  =
   %idle
> > 19:00:15        all     99.89      0.00      0.11      0.00      0.00  =
    0.00
> > 19:10:15        all     99.89      0.00      0.11      0.00      0.00  =
    0.00
> > Average:        all     99.89      0.00      0.11      0.00      0.00  =
    0.00
> >
> > Been running stress --cpu 8 since 18:47 and so far it is using all 8 co=
res at 100%. It would normally have shown the 7/8ths problem after 20s or s=
o, maybe 2 or 3 minutes at max. So I'd say this setting is definitely invol=
ved.
> >
>=20
> Thank you very much for testing. I'm not a scheduler expert, but I see
> that CONFIG_SCHED_CLUSTER is enabled by default on arm64 [0].
>=20
> Peter is the maintainer and author of this series.
> @Peter, do you have any further insights? Thank you!
>=20
> This thread background is here[1].
>=20
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D7bd291abe2da09f59dca81f35a4ec220e5e138a2
> [1]: https://lore.kernel.org/all/f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gde=
ad.co.uk/
>=20
> --
> Best,
> Chaoyi
> 

