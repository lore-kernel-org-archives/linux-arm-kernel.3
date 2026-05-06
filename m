Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF9BCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe86PdiXqLS2iOWkR3ssBBeNry96Lj+AG0WMYOF0w6k=; b=yMY3GofcTSocUOlzb5A21MOdmQ
	I5l28YuB46CkDG/8TkvKsHKCaQ6Beq1fGTQgnt+zaBDtgwaCBYODM1Kp5Ud3S9xU6hx1lv3Nz6iaQ
	d5N5906ZNqIxfxml94fpcRMF009Fr3+FMc4m4s93FHN9qHCPFF4V/ewBDi5so+VNI6X9sPHkuo3XF
	yHBwXdibtoO7iOxaM8kdVcyy5IDuoDTuu5cmsdZ8fX9/gwS3m3wvaAV0Vf2IPT05yOOdT+8mIUG2J
	274KKUW9IsaZ3ExIk0TyiWm1KPnmlrmbYxjv/bk5CP67cIDmM1BFx1Ehzsoo2Djuyzaut0XxQ/frL
	0MfD5/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKftM-00000001cot-0QWQ;
	Wed, 06 May 2026 17:18:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKftK-00000001coh-34x5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9F556012A;
	Wed,  6 May 2026 17:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6572CC2BCB0;
	Wed,  6 May 2026 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778087913;
	bh=MKhUYQpBlny7azoXrW/1cc8EFMweik0RsJgT4PfJcCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoWPL3Nsa592G0H63aOsgPrEkmTLcpRkbrfNV7OC4DWMxTKy2IDG2Qc17AfORMvq4
	 FbSVF/sPo06kkMotuJ/o4sVm7svEICB+ZJbSFwR6lwTlowN93OBCs/pr1Vuw7/qm7q
	 EZvNp3ac49h9cx2x9zr4JzPLDETsuiLwSZtAM5KkQ877nuZBKP2nvaV7JjtmckTntZ
	 oHJep68hzu31R7L13ClBJStJLWg872OkCWuUXX4pRddpPgOMnD+r0Ebo0EoqYF9dMt
	 /nZs2bvQc9aoToDq2ANXwUMwNTaeAzoA8yQCRjq9kmqmEPug/eMI3m3GLFFfxjTdEn
	 l534aEB+eQdoQ==
Date: Wed, 6 May 2026 22:48:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, mark.rutland@arm.com, lpieralisi@kernel.org, 
	bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <4ympdtnpqrydnjmapuswsnig7ymuopy4kpxqclyxnoaqgpdmxl@eywcfbu3avtg>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
 <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
 <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
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

On Tue, May 05, 2026 at 02:47:08PM +0100, Jon Hunter wrote:
> Hi Mani,
> 
> On 06/04/2026 15:29, Manivannan Sadhasivam wrote:
> 
> ...
> 
> > Sure. It makes logical sense to relate this API behavior with the state of CX.
> > I'll send v2 with the updated commit message.
> 
> Did you ever send a V2? I am not sure if I missed it and so wanted to check.
> 

No, I didn't. I had some offline discussions with Bjorn and concluded that it
might not be appropriate to set pm_set_resume/suspend_via_firmware() for all
firmware flavors that our Qcom SoCs support.

Then I found out a limitation with our Root Complex IPs in exiting L1ss if the
platform is suspended. So sent out a series to fix that and that allowed me to
get past the NVMe issue coincidentally.

But since this patch applies to other ARM64 SoCs, it logically makes sense to
apply it IMO. So, I'll leave it to PSCI maintainers to decide.

- Mani

[1] https://lore.kernel.org/linux-pci/20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com

-- 
மணிவண்ணன் சதாசிவம்

