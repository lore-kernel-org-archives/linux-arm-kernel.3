Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6566AD1F9D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0SZ/BwxplpUehnXIwTyiQz6fanbn+g+7X25vWezG6o=; b=B2ld5brRrFLqW/cMiCkPZ7PSyc
	3lk81+FNh97qMuek1/yNQvNNzRmaBNb/TDukCFjMSzQubL7FWRcL7rcCRq4xhXFIjrwhs2psTqsmY
	n1R7VKWpkSMTCN6W31ep4NGl2QK3Ei4n7mOH12KZsmi9asn0NF6UuP05nOj3spCxTpmKgW2RPgvAk
	ui+jFRCDMP28LbL7TnZ+eXouPUpc3iDeXGViXLGAODCmYc2nEMs2bGVgmweFaNdWJQ/R9+Munh+s6
	RHBW/VP727pej5L92QCk43tZ3HlA20dIqWI64M/fCvk/D4hs+k5vDyCyMLDVS/l+BJ5Uy681x4FY5
	gIaZP69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR84t-00000007xXs-1nkl;
	Thu, 04 Dec 2025 12:04:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR84q-00000007xXA-2ZKq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:04:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BAE1339;
	Thu,  4 Dec 2025 04:04:42 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88DCB3F73B;
	Thu,  4 Dec 2025 04:04:48 -0800 (PST)
Date: Thu, 4 Dec 2025 12:04:42 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rsalveti@oss.qualcomm.com
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <aTF42v5dpTuCe7r3@J2N7QTR9R3>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
 <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_040452_693785_11703F8D 
X-CRM114-Status: GOOD (  22.74  )
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

Hi Pavan, Marc,

On Thu, Dec 04, 2025 at 04:06:12PM +0530, Pavan Kondeti wrote:
> On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> > On Thu, 04 Dec 2025 04:07:15 +0000,
> > Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > > Hi
> > > 
> > > The pointer authentication feature (PAuth) is only supported on
> > > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.

> > On what grounds? Hardware incompatibility? I seriously doubt it,
> > since nobody glues pre-8.3 CPUs to anything more modern.

Marc, it seems like that's exactly that's happened here. :/

> I see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0
> (A78) indicates that PAuth is supported but not for CPU#4 (A55). I am
> told, there are no other controls outside EL2 (trap) to manipulate
> this feature. So, I am assuming that this is indeed reflecting the HW.

Cortex-A78 doesn't have pointer authentication, but Cortex-A78C does, so
maybe you actually have Cortex-A78C?

What are the MIDRs on this SoC? e.g. the output of:

  cat /sys/devices/system/cpu/cpu*/regs/identification/midr_el1 | sort | uniq

If this SoC has both Cortex-A78C and Cortex-A55, that's a rather
unfortunate combination that should have been caught at the SoC design
phase, as Marc alluded to.

[...]

> > > This patch [2] from Catalin adds a devicetree property under memory {}
> > > to disable MTE.

Catalin's patch was a bit different. It described whether the memory
range supported tags (and was actually a property of the memory). That
patch didn't make it into mainline AFAICT.

[...]

> I understand that this does not fall under errata but is
> there a possiblity to introduce an Errata targeting CPU#0 MIDR and
> disabling the Pointer authentication? I understand that if there is
> another Qualcomm SoC that exists with all CPUs supporting pointer
> authentication with same MIDR, we may be disabling the feature but this
> is something I can check internally.

I strongly suspect we cannot use the MIDR for this. Per:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=53a52a0ec7680287b170b36488203b5822e6da2d

... Qualcomm's Kryo {Prime,Gold,Silver} parts seem to identify
themselves as Arm ltd implementations, and those will appear in other
non-Qualcomm SoCs.

Without know *exactly* which MIDRs you have on this part, we cannot say.

Regardless, I strongly suspect that we have to live with the command
line option for these parts.

Mark.

