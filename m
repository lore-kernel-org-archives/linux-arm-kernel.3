Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61445CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHG9bRC/eTBIEqmoQg8JdOZqrHqlbR+KL5CL3+34Mnk=; b=Ba5CDTIA/dT7OmE2LU8UJTdKmX
	pPDxRPt47Qr0rE7eenYZn2VNNPGbT+sDKT9VfHhh4Sf/eDqfvulAWIWf5Hr22YxIWs983lj3AGS9v
	egszlBxAnwqhijmODG8u05LLxt/nbj52YS/kotMSYUHcjf4y5n1DU3DuoLxCSnjZq6VqbXjNggnW9
	H+scRUZy667dxWeacdeC2fTku30LWna2hw2jB/FQMzEnWpiD4EvPyBH95VxbP+g/jZbGQK66EyHWp
	OBEyL1sr8ZHRstHasIQALWrnipmFpaZF9GGJpeyK+jzaFPzszi3RhXQ/LT37grrPNaANJ5guoT/7e
	Mg6I0EmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7Um-00000008VQA-1mpr;
	Wed, 12 Nov 2025 09:50:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7Ul-00000008VPo-30KL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FC7B6020B;
	Wed, 12 Nov 2025 09:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0C7C4CEF8;
	Wed, 12 Nov 2025 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762941027;
	bh=wKkYTwbaHODjzCytHEFDqnL5g4JxssRcsrQb6AjyIG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THXlsGbFErwUFo1wXBwnqtZVc6BeYn6L2UE7CtZWfMJ4+KHQIlHtuc0TildUHh9Ob
	 lbTpx2tKz/MJDGXzxMH3yv/POWUQ2aqZzG7HA94ie+/hvHaVTkNs0qr3mkXqf8MUl6
	 3xQrouYjCT1oIZFDzLeMNz2k5X4HgsMojIK8wtRmO6zaaZSfFJSKTvA/atntB+Nvce
	 UTg4ZNmTK0FKQW5hAT0TVEXQQv998uAJgquRdnYwTccyPWKJ4vmwWzDuutaq7NLM3K
	 yO9dpZI9D2EUC6PxhSTPniAIx6r42xtWyAYBzgMBzkGIU3Q09/XJ3yR3XEsaBgw3Vc
	 GTO/aG2ppFgmw==
Date: Wed, 12 Nov 2025 10:50:19 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: fj1078ii@fujitsu.com, catalin.marinas@arm.com, fj2767dz@fujitsu.com,
	guohanjun@huawei.com, ilkka@os.amperecomputing.com, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	sudeep.holla@arm.com, will@kernel.org, tglx@linutronix.de,
	maz@kernel.org
Subject: Re: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
Message-ID: <aRRYW7UK7PWb6cpS@lpieralisi>
References: <OSAPR01MB7669F9B9E145A50B38819E13D5CEA@OSAPR01MB7669.jpnprd01.prod.outlook.com>
 <20251112044239.4049011-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112044239.4049011-1-cmirabil@redhat.com>
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

[+cc Thomas, Marc]

On Tue, Nov 11, 2025 at 11:42:37PM -0500, Charles Mirabile wrote:
> Hi All—
> 
> On Mon, Nov 10, 2025 at 07:38:17AM +0000, Kazuhiro Abe (Fujitsu) wrote:
> > Hi Will,
> > 
> > > Hi Will,
> > > 
> > > > [You don't often get email from will@kernel.org. Learn why this is
> > > > important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > On Mon, Oct 20, 2025 at 09:23:05PM +0800, Hanjun Guo wrote:
> > > > > On 2025/10/17 15:39, Kazuhiro Abe wrote:
> > > > > > AGDI has two types of signaling modes: SDEI and interrupt.
> > > > > > Currently, the AGDI driver only supports SDEI.
> > > > > > Therefore, add support for interrupt signaling mode The interrupt
> > > > > > vector is retrieved from the AGDI table, and call panic function
> > > > > > when an interrupt occurs.
> > > > > >
> > > > > > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > > > > > Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
> > > > > > ---
> > > > > > Hanjun, I have addressed all your comments.
> > > > > > Please review them.
> > > > > >
> > > > > > v3->v4
> > > > > >   - Add a comment to the flags member.
> > > > > >   - Fix agdi_interrupt_probe.
> > > > > >   - Fix agdi_interrupt_remove.
> > > > > >   - Add space in struct initializsation.
> > > > > >   - Delete curly braces.
> > > > >
> > > > > Looks good to me,
> > > > >
> > > > > Acked-by: Hanjun Guo <guohanjun@huawei.com>
> > > >
> > > > I wasn't cc'd on the original patch but I couldn't figure out why it
> > > > uses IRQF_NO_AUTOEN when requesting the irq given that the first thing
> > > > it does is enable it.
> > > 
> > > I misunderstood the usage of request_irq and enable_irq.
> > > Since there's no need to separate them, I will remove IRQF_NO_AUTOEN and the
> > > enable_irq call, and send v5.
> > 
> > I found out when calling request_nmi, removing IRQF_NO_AUTOEN results in an error (-EINVAL).
> > Therefore, I would like to keep IRQF_NO_AUTOEN specified.
> > If you have any comments on this version, please let me know.
> 
> Could it be that this is just a bug in `request_nmi`? I see the following:
> 
> if (!desc || (irq_settings_can_autoenable(desc) &&
>     !(irqflags & IRQF_NO_AUTOEN)) ||
>     !irq_settings_can_request(desc) ||
>     WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
>     !irq_supports_nmi(desc))
> 	return -EINVAL;
> 
> Perhaps there is just a missing `!` before `irq_settings_can_autoenable`.
> 
> As far as I can tell it has always been wrong - git blame points me to the
> original commit where that code was introduced:
> 
> b525903c254da ("genirq: Provide basic NMI management for interrupt lines")

I don't think that's the right rationale (and I can't claim to understand
it fully either - that's why I added Thomas/Marc in CC).

As per b525903c254da - IIUC NMI must not be autoenable-capable -
enable/disable must be done using enable_nmi/disable_nmi_nosync explicitly.

cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
added the logic checking the IRQF_NO_AUTOEN flag to request_nmi().

Now, AFAICS irq_settings_can_autoenable(desc) returns true in this
specific case - the IRQ is a GICv3 SPI.

First question is - before commit cbe16f35bee6, how request_nmi() could
have possibly succeeded - irq_settings_can_autoenable() would return
true and request_nmi() would have failed.

Come cbe16f35bee6:

if (!desc || (irq_settings_can_autoenable(desc) && !(irqflags & IRQF_NO_AUTOEN)) ||
	!irq_settings_can_request(desc) ||
	WARN_ON(irq_settings_is_per_cpu_devid(desc)) ||
	!irq_supports_nmi(desc))
		return -EINVAL;

Now the check passes _if_ you pass in irqflags IRQF_NO_AUTOEN.

I agree with Will that's a bit counterintuitive - maybe we can force
the irqdesc to be NOAUTOEN in request_nmi() directly ?

Thomas and Marc know better so that's where I stop.

Thanks,
Lorenzo

> I looked and the only two callers are using `IRQF_NO_AUTOEN` so I guess it
> just hasn't been noticed yet.
> 
> Happy to send a patch to fix it.
> 
> > 
> > Best Regards,
> > Kazuhiro Abe
> > 
> > > 
> > > Best Regards,
> > > Kazuhiro Abe
> > > 
> > > >
> > > > Will
> 
> Best—Charlie
> 

