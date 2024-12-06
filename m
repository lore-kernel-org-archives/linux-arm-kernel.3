Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE00E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAqTXqjrMSI3/C0Zy/7XIZXFz5SFRV2rP4BazELa0BE=; b=VuIKV2cSX22JVU+eQy3b+wBDFa
	gqST1+H3GiswAF0KXTs3M5LMHH7TyZFBCbIlyU4WhbhmihZ4Wn+K68/+ntm6WNTI1pSt9z8TeZnAy
	f4779WoEsiEWeusGPSXc1q9KlnWyiFBvjL+Lfv3aJ+KV7To0YqCMNQstvwYR5ArzIl+HglRZELArf
	4HERDhsX8VJt4n0PVf/cNFj6M3f7Bb3Y9COd4KrYWPBz3Hezp95D6rNz6pi3bEiasf975U8Vi2bbK
	jnakz4MTUK+keKDomHERkhUCgoShip0cxCKQCseoDK6SCsQiFiYsh17WFz1bn/fUBjFTMJg9pq/YK
	g7iIBF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVpV-00000001LW2-29Cf;
	Fri, 06 Dec 2024 10:45:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVVY-00000001Gka-3B0c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:24:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F10D12FC;
	Fri,  6 Dec 2024 02:24:52 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B87B3F71E;
	Fri,  6 Dec 2024 02:24:22 -0800 (PST)
Date: Fri, 6 Dec 2024 10:24:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] firmware/psci: Allow specifying an S2RAM state
 through CPU_SUSPEND
Message-ID: <Z1LQ0-3AVkVHgPaY@bogus>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-3-9fdd9a04b75c@oss.qualcomm.com>
 <ZzSiM6Pn6A9e1QUD@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzSiM6Pn6A9e1QUD@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_022424_845673_FBB21679 
X-CRM114-Status: GOOD (  24.58  )
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

On Wed, Nov 13, 2024 at 01:57:23PM +0100, Lorenzo Pieralisi wrote:
> On Mon, Oct 28, 2024 at 03:22:59PM +0100, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Certain firmware implementations (such as the ones found on Qualcomm
> > SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
> > through the CPU_SUSPEND call.
> > 
> > This works exactly like SYSTEM_SUSPEND. The PSCI spec describes that
> > call as optional (and only introduced in PSCIv1.0), so not all
> > platforms expose it.
> > 
> > Marking a DT-described "domain-idle-state" as such isn't currently
> > well accounted for in the PSCI idle topology infrastructure: the
> > cpuidle and genpd framework are deeply intertwined, and trying to
> > separate them would cause more havoc than good.
> 
> I don't understand what you mean here please elaborate.
> 
> The part of the story I understand is that you have a system (well,
> firmware for an extended set of systems) that does not implement
> SYSTEM_SUSPEND but can reach a S2R like system state through the
> CPU_SUSPEND call. Firmware works in OS-initiated mode, idle-states
> should allow you to define idle states that allow the system to
> enter the S2R state through CPUidle.
> 
> Please explain to me what's missing.
> 
> > Instead, allow the specifying of a single CPU_SUSPEND sleep param
> > under the /psci node that shall be treated exactly like SYSTEM_SUSPEND
> > from Linux's POV. As a bonus, this way we also don't have to fight
> > with the genpd idle governor to avoid taking the S3-like state into
> > consideration.
> 
> That's not acceptable. I want to understand what's preventing this
> system to enter that state through suspend2idle and the mainline code.
> 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  drivers/firmware/psci/psci.c | 36 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 31 insertions(+), 5 deletions(-)
> 
> NACK
> 

+1, will wait for the response here before adding any more questions that
may lead to more confusion or discussion churn.

-- 
Regards,
Sudeep

