Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FDAC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF6+Ekp5LFOn/Da+vUOZnyB0ssktivNlZp8mV3L4hrs=; b=M5oZu2WMvXQ2akJz4xMMOtQsVt
	FXWs/cBxXtVjvSDmopgg9ZvKNEzyfVlOpapqgtvUbO+IYPki9o/NtsO22m50YdH8ZVEKee3pAbgwG
	0zOn1PPr9cqaVXf8HP7eDV4rypTJwhzTyhQs+C25a6NXLEGAY5t3WHDoA/g0Wl1UOv+glSd6yHtEi
	qmxvj9FuwyxrvkpM/lCg4+C4jI9gijNb6Sr8SrMbmnlwN5ZZtWOMovOvemlrwLKIn1g8oDptZNMSD
	e4qVUoIvPAjY73s9ziF68qWPtakTuVbMcs6Lo1aB2Rv1xRjTaW7Fv9osmuQghBFzxR3CQPIjGSx8E
	/vpas7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l5-00000008EWy-07JO;
	Tue, 10 Jun 2025 22:47:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1VC-00000007QBw-0RtQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EF6+Ekp5LFOn/Da+vUOZnyB0ssktivNlZp8mV3L4hrs=; b=Lf2XWxHJMotrOgRa02UIkhDhzX
	U3V1EOBtXO1WPcqqnazl4OYl4V3Z/fWKCcUyljdUh36Gktj2iX1VOoZy7ZhgZ1jEGmXwJsAvtetO9
	VuMLLsF/tO5+jAPjLcEMjJBx8uCpaKe0hu+KAs4mMVh1d5JRZAUFw1cnyGwlnyqO+v/qYIKAiHcA5
	mQdeS23fek4Bx3QGLKIuJNdtWOGyvR8YlTC0rBb6LIHeLewyCCjtgyV0aUZTL0w/ZNOtAYjDuqIXR
	GNLbf266xD4nBzmKLL7ziVFymhUSw0OtYeSjyiwG+1M78qvKmU3nwB3DKHeRH6KydEhu8e35DD2B7
	pniIs3sg==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1V9-00000001vPc-40Nk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:07:05 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id C0A4D21175A4;
	Tue, 10 Jun 2025 09:06:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C0A4D21175A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1749571618;
	bh=EF6+Ekp5LFOn/Da+vUOZnyB0ssktivNlZp8mV3L4hrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O51AOjvtxzIfvKmh7tEijTRnn/KFclGPxRlbGJi/7DMCm2/914JouuKmN2ZR3p7pj
	 zQhrDQVXBPTWDBLH/QVuZVmMdcurziTUwQge77GOf7nBMJAlWrHcVXcJ2//OLJ3yDR
	 5X3Zj1w9sseHk+6K9ekaKxn4eKmglkCxmTcTHg3k=
From: Roman Kisel <romank@linux.microsoft.com>
To: sudeep.holla@arm.com
Cc: anirudh@anirudhrb.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp UUID
Date: Tue, 10 Jun 2025 09:06:48 -0700
Message-ID: <20250610160656.11984-1-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
References: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_170704_242587_59320EE8 
X-CRM114-Status: GOOD (  19.05  )
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

> (sorry for the delay, found the patch in the spam 🙁)

"b4" shows the the mail server used for the patch submission
doesn't pass the DKIM check, so finding the patch in the spam seems
expected :) Thanks for your help!

>
> On Wed, May 21, 2025 at 09:40:48AM +0000, Anirudh Rayabharam wrote:
>> From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
>>
>> When Linux is running as the root partition under Microsoft Hypervisor
>> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
>>
>> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
>> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
>> of supporting only hvc.
>>
>> Boot tested on MSHV guest, MSHV root & KVM guest.
>>
>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>
> Are they any dependent patches or series using this ? Do you plan to
> route it via KVM tree if there are any dependency. Or else I can push
> it through (arm-)soc tree. Let me know.

Anirudh had been OOF for some time and would be for another
week iiuc so I thought I'd reply.

The patch this depends on is 13423063c7cb
("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID"),
and this patch has already been pulled into the Linus'es tree.

As for routing, (arm-)soc should be good it appears as the change
is contained within the firmware drivers path. Although I'd trust more to your,
Arnd's or Wei's opinion than mine!

>
> --
> Regards,
> Sudeep

