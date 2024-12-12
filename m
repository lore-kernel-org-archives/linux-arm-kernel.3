Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C75E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmFRsB7f9NOss0xNm0fad2Itrm/Po+fgTM7+39tGFRU=; b=WfR1NoBGWeEt1g/IAW7Rtvel3B
	2rOTuDixsM1RVtvoSMe6M2zrmv4qMn4n01mMhFNh7dg/7cp8sFib0S9Z7OznkkHK+t2c3oRRkzZ+T
	/09hZjDAm+Ion5YkzvuqAxsT+rFdoAUHOFaloSjAspd5HVG3uumUXVeFCDFI8MsNwLsc9I5rk1OWn
	4tP44mKy6gLABYdT7QGOl5bqtXOTTgse9PA2ZCyZGDvOXR6U60cNoI3BCCAPzrtFkyNEJa9+IqLAL
	6qeSXX9Qu3INEsi9uwuya44CmFoXeo3v8SIjFatHpPH8woGvx8/zJrl73PDnXiaQ2GUynAnWAwITN
	UioXTsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgdx-000000005VQ-0qnk;
	Thu, 12 Dec 2024 10:42:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgcr-000000005Lv-3zf6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:40:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79EF9169E;
	Thu, 12 Dec 2024 02:41:25 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F7F3F58B;
	Thu, 12 Dec 2024 02:40:54 -0800 (PST)
Date: Thu, 12 Dec 2024 10:40:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Elliot Berman <quic_eberman@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <Z1q9rnzOlB9J5dXb@J2N7QTR9R3>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
 <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
 <86sequsdtp.wl-maz@kernel.org>
 <c197264b-3791-493a-b717-3dfd844de922@quicinc.com>
 <87bjxhs2t7.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjxhs2t7.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_024058_075917_0A147C78 
X-CRM114-Status: GOOD (  34.92  )
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

On Thu, Dec 12, 2024 at 08:50:12AM +0000, Marc Zyngier wrote:
> On Thu, 12 Dec 2024 05:31:00 +0000,
> Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > 
> > On Wed, Dec 11, 2024 at 10:40:02AM +0000, Marc Zyngier wrote:
> > > On Wed, 11 Dec 2024 00:37:34 +0000,
> > > Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > > > 
> > > > On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > > > > > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +
> > > > > > +#ifdef CONFIG_ARM64
> > > > > > +	/*
> > > > > > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > > > > > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > > > > > +	 */
> > > > > > +	if (is_kernel_in_hyp_mode())
> > > > > > +		goto direct_switch;
> > > > > 
> > > > > No, please. To check whether you are *booted* at EL2, you need to
> > > > > check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> > > > > none of the driver's business, really. This is still absolutely
> > > > > disgusting from an abstraction perspective, but I guess we don't have
> > > > > much choice here.
> > > > > 
> > > > 
> > > > Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
> > > > available for modules? Do you prefer exporting
> > > > kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
> > > > try something like [1]?
> > > 
> > > Ideally, neither. These were bad ideas nine years ago, and they still
> > > are. The least ugly hack I can come up with is the patch below, and
> > > you'd write something like:
> > > 
> > > 	if (cpus_have_cap(ARM64_HAS_EL2_OWNERSHIP))
> > > 		blah();
> > > 
> > > This is obviously completely untested.
> > > 
> > 
> > I have tested your patch. It works as intended. Thanks Marc.
> 
> Note that you will probably get some push-back from the arm64
> maintainers on this front, because this is a fairly incomplete (and
> fragile) solution.
> 
> It would be much better if the discriminant came from the device tree.
> After all, the hypervisor is fscking-up^W^Wchanging the programming
> model of the GPU, and that should be reflected in the DT. Because for
> all intent and purposes, this is not the same hardware anymore.

FWIW I agree 100%, this should be described in DT.

The cpucap doesn't describe the actual property we care about, and it
cannot in general (e.g. for nested virt). I would strongly prefer to not
have that as it's setting ourselves up for failure.

> The GPU isn't the only device that needs fixing in that way: the
> SMMUv3 needs to be exposed to the OS, and the PCIe ports need to be
> linked to it and the ITS. So at the end of the day, detecting EL2 only
> serves a limited purpose. You need to handle these cases, and might as
> well put the GPU in the same bag.
> 
> Which means that you'd either have a pair of static DTs (one that
> exposes the brokenness of the firmware, and one that doesn't), or you
> go the dtbhack route to compose the DT at boot time.

Liekwise, agreed on all of this.

Mark.

