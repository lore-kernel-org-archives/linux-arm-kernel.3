Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45943CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cjg8EJYcVTI9rTTTcx4cj4rR0+h1zQf26NxqhwPN2QA=; b=CkYocstTK1q6hyGfjrK2uvLUJV
	nFpCFCLvj8US+tVhoq66nhV1xXDEqk/b5PfYiWXUbBocaymL8o2PnbssXjnewvPlWZGWa6iDuGWph
	8UWWCXmswGI0fQo8iYctE9RDmwyvZWdaboT/854QGiYfPGXXyv4yNR+Xu2zeoh19r+nCP+0JBpKws
	nrnuQJN06EiDoiUim1TuddDP2Zo+fHmsljk8FiF75EMIJYRsqfnVIJROzum23WFDmIv/gUvxWWv0Y
	dN/UCKMosXJUc7JevThcsPUuGr1HX44mKiEEpxTNAYxzoiSkoLgtI7GtuZ3EkvrCi4NhFIu3eNjuY
	OLRkVUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mPM-00000000CJF-1i7B;
	Mon, 06 Oct 2025 14:41:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mPK-00000000CIj-1coZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 14:41:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DBD91515;
	Mon,  6 Oct 2025 07:41:37 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D62923F738;
	Mon,  6 Oct 2025 07:41:42 -0700 (PDT)
Date: Mon, 6 Oct 2025 15:41:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
Message-ID: <20251006-spiked-beige-gecko-6d8748@sudeepholla>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org>
 <20251006-manipulative-urban-antelope-31101f@sudeepholla>
 <CAPDyKFoz4P6cZWNA-omNtF3XqKKciC07aVXBTVQp8ueyyYxmxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFoz4P6cZWNA-omNtF3XqKKciC07aVXBTVQp8ueyyYxmxA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_074146_462709_7D9FD39D 
X-CRM114-Status: GOOD (  16.97  )
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

On Mon, Oct 06, 2025 at 02:22:49PM +0200, Ulf Hansson wrote:
> On Mon, 6 Oct 2025 at 12:54, Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > 2. I understand this is intended for the DragonBoard 410c, where the firmware
> >    can’t be updated. However, ideally, the PSCI firmware should handle checking
> >    for pending IPIs if that’s important for the platform. The firmware could
> >    perform this check at the CPU PPU/HW level and prevent entering the
> >    state if needed.
> 
> I think this is exactly what is happening on Dragonboard 410c (see the
> stats I shared in the commit message in patch3).
> 
> The PSCI FW refuses to enter the suggested idlestate and the call fails.
> 

Ah OK, the PSCI FW is doing the job correctly, we are just attempting to
reduce the failures by catching few cases earlier in the OSPM itself ?
Sure it only reduces the failures but it can't eliminate those as IPI might
be issued after this check in the OSPM. I understand the call to firmware
can be prevented.

-- 
Regards,
Sudeep

