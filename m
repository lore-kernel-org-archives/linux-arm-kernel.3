Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0428F46C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aybtIzcYOFk4NYjCCutoTxAAiO25iEOBYjxMd1pVN1E=; b=tramEdJTd1LsqdpWHhJBN9jP8W
	UM3jvv9FLT1nUPGhcqdl4bTuD6f8igWEMrApuv68tYusht2srMvfe4cA6ezf10i7+cTFS9WLrI0UU
	AIqu6pLGhEZyASXEEHSCZ6tt6Ilbi7V4XGL67PR50aEOKXntFjZzfJZjL9WIY/HkHQkS9GSMiv0sq
	kdnzw0Xoi3TM6ENvn56Iyu31M+cy55g0mdGHD1Ff93vTqq3wxsiFPdx93j4Xk7x+AS9u1LFnSuoMX
	IyIAEkVCefVAL2BsuZr+DZ4fe8FiOKhF0DbJnP0p7yjiPnu+jl7+sLBe2eQcfMe4eOJodq3bHGrhe
	6r4Ms2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kxa-00000005C3U-3pIO;
	Mon, 06 Apr 2026 14:29:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kxY-00000005C1f-0MMh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 14:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC53143460;
	Mon,  6 Apr 2026 14:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CBAC4CEF7;
	Mon,  6 Apr 2026 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485786;
	bh=ArnEb8iTrG1HBn6Jh5O6C/vH6Bepv8pxSQWcTcSm1Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mLbMoc9WXhk8SpQWQmCo9HHXPF0j9EG3YBeLn7wt4tcy0vkKBF4WqHN3IpHtX9ssr
	 HFZoLaaigQ/JRHn1WU6lRelwuOJ6nqGmxNvn1LkaX5i80Bo64fVXyAUHeMoShf1gtL
	 zwkQpMeedJ1UORslXzRomM2b120RxH+SXzNt/yJ2cWzMeda+LP7MYDaG2iXgUT2XSe
	 rCyS9rxKCBBbwYFsdhvV7xDP3vTX6KdaaD9OQ/rsLDvhbL1EepXrP0BTl+0Igg+J3b
	 o+ZWkgNqX/Oh1WCD44iPytxt9m80b66haBxOqMHaPHYNQcmnBNifxJkoBkzVA6DXVb
	 9svWHf8UB7icA==
Date: Mon, 6 Apr 2026 19:59:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	mark.rutland@arm.com, lpieralisi@kernel.org, bjorn.andersson@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adO1lS2g8Hewj0Ol@baldur>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_072948_180756_2273A00B 
X-CRM114-Status: GOOD (  38.34  )
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

On Mon, Apr 06, 2026 at 08:48:44AM -0500, Bjorn Andersson wrote:
> On Tue, Mar 31, 2026 at 12:09:38PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 30, 2026 at 03:48:05PM -0500, Bjorn Andersson wrote:
> > > On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> > > > From: Konrad Dybcio <konradybcio@kernel.org>
> > > > 
> > > > PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> > > > firmware to implement the suspend to RAM (S2RAM) functionality by
> > > > transitioning the system to a deeper low power state. When the system
> > > > enters such state, the power to the peripheral devices might be removed.
> > > 
> > > What is the actual extent of "peripheral devices" in this definition?
> > > 
> > 
> > All devices except the ones backing volatile memory (DDR).
> > 
> 
> I do not agree that this should be the interpretation on a Qualcomm
> platform.
> 
> 
> We do have the corner case of DeepSleep, where this indeed is what will
> happen (not sure if other resource votes in the system are ignored
> though?). For all typical targets making the PSCI jump might result in
> CX being turned off (unless something else votes for it...). 
> 
> State is still retained on a case-by-case basis and some parts of the
> system are still functional when we enter such state - and that is the
> system state we desire.
> 
> Making the interpretation that all SoC resources will be disabled will
> result in a large amount of unnecessary save/restore work, in addition
> to breaking many use cases.
> 

I think adding these kind of per-device power state might be cumbersome as it
may vary from SoC to SoC. But I do agree on the pain point of context
save/restore work which will happen majority of the times since DeepSleep
platforms are limited as of now.

> I do however not think that such interpretation is necessary, the
> pm_suspend_via_firmware() kernel-doc describes that the firmware might
> perform actions to power down things, it isn't specific about the
> extent, so I think that's fine - while equating this to DeepSleep (SoC
> fully powered down) is too extreme.
> 
> 
> What bothers me with this patch in itself is that the behavior in
> relation to PCIe does match the description of pm_suspend_via_firmware()
> - the firmware does things which causes PCIe to "break", but IMHO this
> is merely because PCIe operates without voting for the resources that it
> depends on. But you keep telling me that this can't be solved in the PCI
> layer...
> 

We do not want to vote for any resources during system suspend from the PCI
layer (host controller driver in specific), and that's the problem (only a few
platforms are exceptions).

Let's say if we have connected a NVMe to the PCIe bus. Since this is a passive
device i.e, not supporting wakeup, we can safely put the PCIe bus into low power
mode (turning off resources) to save power during system suspend (let's
ignore the NVMe driver behavior now). Now the suspend (s2ram) behavior will be:

CXPC - Controller context will be retained by switching the power domain to
always ON domain

DeepSleep - Controller context will be lost once the SoC enters CXPC, since CXPC
is the pre-requisite for entering DeepSleep

So only if the NVMe driver had prepared for the power loss, the driver will
resume successfully, if the platform used DeepSleep.

> If we can agree that pm_suspend_via_firmware() relates to the state of
> CX - and merely the implicit PCSI-owned vote thereof - then I think we
> should merge this patch.
> 

Sure. It makes logical sense to relate this API behavior with the state of CX.
I'll send v2 with the updated commit message.

> 
> But regardless of this interpretation. If PCI/NVMe relies on the PSCI
> implementation's implicit vote for CX and its absence breaks NVMe during
> suspend, then we're faced with exactly the same problem if the user
> chooses s2idle as their means of suspending the system.
> 

From the PCIe controller driver, we are going to keep the votes in s2idle, but
just let go in s2ram.

> I.e. on a Qualcomm platform, we should flag PM_SUSPEND_FLAG_FW_SUSPEND
> in s2idle as well - because from PCI/NVMe's point of view, the relevant
> resources will be gone in either configuration.
> 

No they don't, as we do not plan to drop votes in s2idle. So
PM_SUSPEND_FLAG_FW_SUSPEND only applies to s2ram.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

