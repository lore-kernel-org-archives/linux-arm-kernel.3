Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7701C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8sJ6HYzkRIIDcV1u64F3+oicJvBZLiGsmcxqwkREC8=; b=fOi1HYsOUj1LhRzoJLIbMgh6d9
	R+V+NGHcs5NChoSKdbzsSgN1LFbx5BxBecpQpVhNv9Lv6bTv26KXjyRDnjr6CtuCjfmCv9L3ICX+e
	8azAU1/aVoV+nRDXsasYFitqmQhh85jYFJA4S44AVTRHMf35fXTRxOFGEv5WS1Qe0rwIp/yMadNTw
	vrE2WfRlp6D02/yKhTSNDD92g29c2X7MtQx+I0l2kgucbJa5880eOuEDwgHiAPow4jA6BqCHlklkf
	jt3iWyqpsvkBsCLotUmGCNG5Kjj+XGpmmAme/0gFh7eHXfbvSWfinXb7982YhVWMXt511kw8I4ePp
	UupHgE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuWs-0000000AZ8K-2uM1;
	Wed, 18 Jun 2025 15:16:46 +0000
Received: from sender4-of-o54.zoho.com ([136.143.188.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrmp-0000000A6Kn-2CQ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750249258; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YSCSonrtrvMPJCPNYdTP7AcpMF8tT6Ns+Mv0ldpqQIo6+VVsWvybiYTHRm/bIudq32v2ha6n346/3FTTt+P8UbHfS6rugLW+Hg+0RXyT4HQrnkCnTTUas5LplGasyde1d8xWsilHCV9lDTk9wUxa/5Zld7ToYUxGQ13t64ww604=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750249258; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u8sJ6HYzkRIIDcV1u64F3+oicJvBZLiGsmcxqwkREC8=; 
	b=JFWPoiTxYzoV/wI4zmhzdU3LumXwpVOmn6Xjug2vC/+vAooCkOufMzx+rhanMRI3io5JbRU9w1xCKvup4SQ49dBrmU3K2WqWAjvqAn+Ea3m2Mz9Ng7fYE/lZWNyu0qwlyN6lDrBGShLzD2po6+qF2UHxyuZ5UeMKF8JthEkOkBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750249258;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=u8sJ6HYzkRIIDcV1u64F3+oicJvBZLiGsmcxqwkREC8=;
	b=datD/rfwSFfsy4TyCfsc6mkuDCWoa9zxex6dKoTdTJWSQuYfB/9o4mPHJA3e0aZT
	okQ6zz1y4stvizRXXqCvfWHFBOvd5V2/h+HF2Vnw6295W+lLgRfVYywxnK9GyV+aLOG
	Ea+R2YiQxv4PNY5eVOavAkWiujrDNfPLqnlC+DEU=
Received: by mx.zohomail.com with SMTPS id 1750249209729383.6811066576498;
	Wed, 18 Jun 2025 05:20:09 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:20:05 +0000
From: Anirudh Rayabharam <anirudh@anirudhrb.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp
 UUID
Message-ID: <aFKu9TFA6oj1N2cR@anirudh-surface.localdomain>
References: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
 <20250610160656.11984-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610160656.11984-1-romank@linux.microsoft.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052103_722424_D82D4291 
X-CRM114-Status: GOOD (  27.32  )
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

On Tue, Jun 10, 2025 at 09:06:48AM -0700, Roman Kisel wrote:
> > (sorry for the delay, found the patch in the spam 🙁)
> 
> "b4" shows the the mail server used for the patch submission
> doesn't pass the DKIM check, so finding the patch in the spam seems

How do you check this? I mean, what b4 command do you run?

I think it should be fix now. Let's see...

> expected :) Thanks for your help!
> 
> >
> > On Wed, May 21, 2025 at 09:40:48AM +0000, Anirudh Rayabharam wrote:
> >> From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> >>
> >> When Linux is running as the root partition under Microsoft Hypervisor
> >> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
> >>
> >> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
> >> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
> >> of supporting only hvc.
> >>
> >> Boot tested on MSHV guest, MSHV root & KVM guest.
> >>
> >
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> >
> > Are they any dependent patches or series using this ? Do you plan to
> > route it via KVM tree if there are any dependency. Or else I can push
> > it through (arm-)soc tree. Let me know.
> 
> Anirudh had been OOF for some time and would be for another
> week iiuc so I thought I'd reply.

Thanks Roman!

Regards,
Anirudh

> 
> The patch this depends on is 13423063c7cb
> ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID"),
> and this patch has already been pulled into the Linus'es tree.
> 
> As for routing, (arm-)soc should be good it appears as the change
> is contained within the firmware drivers path. Although I'd trust more to your,
> Arnd's or Wei's opinion than mine!
> 
> >
> > --
> > Regards,
> > Sudeep

