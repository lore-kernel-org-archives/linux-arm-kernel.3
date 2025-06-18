Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AE7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gU1SNTj2Uw5CPwEJB/aCInEX5ywExrTmgIA0Ro+WzY=; b=3D89itfSz+ePxmIy3dcC31Qk3m
	gvGNhGskJ8GUUHK8AC+VDJVyqgxA2D96Hphem7QGwu3F8irxEVXh7Z0iLG/pHAI1LqYCPnsD7VMsW
	wScUtLzIby5bio89WE8K+he1QOMC7rHprDvqjWtv89NfxKMcTP80rqP30+LjkqnHd1hpCUxUw1zDI
	mUbfTQlqHCZZo4/dlio2wCQibpIQe8kZuZRiaSL2PExJgKE5HU28w4F1BDRrCHSsn/8XNGu+Pt5hB
	s6pmQyoI+wOInktRyOtUQWJhE9zuwtf3jQqucEvyopHEXy3bf3LUzaj5hFPYVqx9f22j3Lz4lHc5l
	2VR29hvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuWt-0000000AZ9A-3juh;
	Wed, 18 Jun 2025 15:16:47 +0000
Received: from sender4-of-o54.zoho.com ([136.143.188.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrn4-0000000A6Nh-3U68
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:21:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750249277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LwTyltZLvFLcU/04Th+T9Kkk5eGUpsjs+w95iD+lahK1CtbqtZNTO2E4WzxMbCgMutsym+AfRQtmcdmJtYeoPvAe6k6jL6Y+dV12WrwzOPS2ZDZdaEuY2U3wgCygw28+Dgy1nMsyIiaYhLTOy/7mz6YWYO/+Yz2f4UDyNfptreA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750249277; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+gU1SNTj2Uw5CPwEJB/aCInEX5ywExrTmgIA0Ro+WzY=; 
	b=C9I9o0o+fPla+K9uBwJf2Je8gsVj/EwBskSumylYp0XVYHv8BZsJDQ1T8rEmdU5eJU+FxPdonSoVDhbnJp1/99GPOYTj1MnyvVplXbEVMg14i4N41GERKGBZnKulqi4dEvBI2qZiuL1eLH4Preb+3WUJDH/Pue2+haSxbMiMBgg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750249277;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=+gU1SNTj2Uw5CPwEJB/aCInEX5ywExrTmgIA0Ro+WzY=;
	b=FFRv1QtnnHHmCRJY8qHb1/CxJZdBlKgxKrfTStV52YoEHgB5tgFYJ4F31zI3sV1Y
	73Whw2o5OYKd8BYf4QttZrN4M65Ko3ONFlZapq/rwlISZ1ThWD3mV62J6O4+ihPnvRZ
	0E2UaR6tRyZKkvsho5QWKzamh0dlCdX9kwgHNc5I=
Received: by mx.zohomail.com with SMTPS id 1750249250132973.3344122035301;
	Wed, 18 Jun 2025 05:20:50 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:20:43 +0000
From: Anirudh Rayabharam <anirudh@anirudhrb.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Roman Kisel <romank@linux.microsoft.com>,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp
 UUID
Message-ID: <aFKvG69DVhHcI5Mn@anirudh-surface.localdomain>
References: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
 <20250610160656.11984-1-romank@linux.microsoft.com>
 <20250611-wandering-juicy-magpie-ed7f46@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-wandering-juicy-magpie-ed7f46@sudeepholla>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052118_935455_C2AFAA47 
X-CRM114-Status: GOOD (  33.00  )
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

On Wed, Jun 11, 2025 at 01:52:32PM +0100, Sudeep Holla wrote:
> On Tue, Jun 10, 2025 at 09:06:48AM -0700, Roman Kisel wrote:
> > > (sorry for the delay, found the patch in the spam 🙁)
> > 
> > "b4" shows the the mail server used for the patch submission
> > doesn't pass the DKIM check, so finding the patch in the spam seems
> > expected :) Thanks for your help!
> > 
> 
> Thought so looking at the header but I just have very basic knowledge
> there, so couldn't comment.
> 
> > >
> > > On Wed, May 21, 2025 at 09:40:48AM +0000, Anirudh Rayabharam wrote:
> > >> From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> > >>
> > >> When Linux is running as the root partition under Microsoft Hypervisor
> > >> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
> > >>
> > >> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
> > >> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
> > >> of supporting only hvc.
> > >>
> > >> Boot tested on MSHV guest, MSHV root & KVM guest.
> > >>
> > >
> > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > >
> > > Are they any dependent patches or series using this ? Do you plan to
> > > route it via KVM tree if there are any dependency. Or else I can push
> > > it through (arm-)soc tree. Let me know.
> > 
> > Anirudh had been OOF for some time and would be for another
> > week iiuc so I thought I'd reply.
> > 
> > The patch this depends on is 13423063c7cb
> > ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID"),
> > and this patch has already been pulled into the Linus'es tree.
> > 
> 
> Had a quick look at the commit to refresh my memory and as you mentioned
> it is new feature. I was checking to see if this is a fix.
> 
> > As for routing, (arm-)soc should be good it appears as the change
> > is contained within the firmware drivers path. Although I'd trust more to your,
> > Arnd's or Wei's opinion than mine!
> > 
> 
> I will queue this once I start collecting patches for v6.17 in 1/2 weeks'
> time, so expect silence until then 😄.

Sounds good, thanks!

Regards,
Anirudh.

> 
> -- 
> Regards,
> Sudeep

