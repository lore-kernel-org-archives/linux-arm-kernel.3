Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A202C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTVAMciqAbDxpEFCNEtevwarA4Upw6KcXkxokjrk3Jo=; b=Sd84T3dysJJ0LOAWtzjPMob11F
	BfhCrF59bOPex3BMSggg3kkmefBiFzFIXsIWnytNzvITWLsKkew5/ToMEYsSFV+6+Ay5f00ACKcJ1
	AWds+byHSv9OaCZr0shIdam6aBRmqzX8vwO7ZSLuoHlLcrW0FGccC5O0RSUxJuseYvFJZcRiGRYvS
	DFMgA9U/IZ51nPZctm8+HpkhHa1Pb+uZg2hI3L5GgEP68mhaauuxx6Csvsbu9EBI/+8KOh+6NOg8A
	5rTB87vPxkMXGvA/2zsj4EjuI3k1/ZaAAwDOuPVn5fuhqowaZPc2klUSWIG4QiQ2jRg1SwGiwbM/x
	5PRjkmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCdZ-0000000FuTr-3bJh;
	Thu, 05 Jun 2025 15:36:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNCbN-0000000FuLQ-2niF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 15:33:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF7F51688;
	Thu,  5 Jun 2025 08:33:36 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F280C3F5A1;
	Thu,  5 Jun 2025 08:33:52 -0700 (PDT)
Date: Thu, 5 Jun 2025 16:33:50 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Anirudh Rayabharam <anirudh@anirudhrb.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp
 UUID
Message-ID: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
References: <20250521094049.960056-1-anirudh@anirudhrb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521094049.960056-1-anirudh@anirudhrb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_083357_749826_D32D2F54 
X-CRM114-Status: GOOD (  13.48  )
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

(sorry for the delay, found the patch in the spam 🙁)

On Wed, May 21, 2025 at 09:40:48AM +0000, Anirudh Rayabharam wrote:
> From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> 
> When Linux is running as the root partition under Microsoft Hypervisor
> (MSHV) a.k.a Hyper-V, smc is used as the conduit for smc calls.
> 
> Extend arm_smccc_hypervisor_has_uuid() to support this usecase. Use
> arm_smccc_1_1_invoke to retrieve and use the appropriate conduit instead
> of supporting only hvc.
> 
> Boot tested on MSHV guest, MSHV root & KVM guest.
>

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Are they any dependent patches or series using this ? Do you plan to
route it via KVM tree if there are any dependency. Or else I can push
it through (arm-)soc tree. Let me know.

-- 
Regards,
Sudeep

