Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC623CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZET4GDyvNY1+2FL6EzMZ6GSoVef07DU3MtZp4qPNVvA=; b=rrRjJuvfFQlq+7SzL7CdgGtHNz
	aMf/03C9z0RtKKH82mbYWGR+M/s/PWdA/zVT83PmlTYvBxUXiKHqmT9Futgf40Snz/N2GjxzOkkbO
	Yxq7Kn6ksijo7xTerLbUd7roln9OEmp0PxO//gQnOIT0zAqkxqP4gd3dBIrOav970jnD/3KuFj/eu
	bX+kXJsygLGUt33lYEff2j7E8G1zzWCFQW741rYgo89ZUutVhParNl619FMyvxK36HUwDNyGq/sN3
	GLw015/TISIvEuf+UvZT3vY6kjgy/szn8QvaFf8K23nk1Ji8BX9dD4Ll/FKO9p5qgwjapjP1zfYeQ
	q1TNGFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx9z-00000003h14-1Xa2;
	Thu, 07 May 2026 11:44:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKx9w-00000003h0Q-3gef
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 11:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E98443972;
	Thu,  7 May 2026 11:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E29C2BCB2;
	Thu,  7 May 2026 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154292;
	bh=jTnvtAFFnsIrZicTBdhLaws8Zfm6vt3oXsIQRVkiHjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbetJZh8QF+19DK4P580Sxu0oRB/09PJQOlcMHn8yyDPCoG2QK7qzxj6qV8RHiaP/
	 8Jh1hwR8ddK4Gy8xrvgmGRDkd/pBhlQHWyqjMk4CmheIF3vUExWYtjR9oFutartqN/
	 b63MJna/F5vBVlfJ/9eDiOCXeY0J3A3YpFQN3FTBVX4C78iXTM0e4aae5JaOoawMQs
	 1bpw+Ma9I4/Y/4TXrfZ221UwWUgXFtGe5yHcvQZU62NwM0Ktpl0YtGad/igd5dDRq/
	 r9F2hDmTP/zlbaZ0zAncsPw2WUwNyGJdtdTZfawdvjUyeWBPWrybYGOZuzNhU9yoSr
	 NgHdL7gms42nw==
Date: Thu, 7 May 2026 17:14:39 +0530
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
Message-ID: <i5gyutgzfckobfaidbwtlzpgjsdcarbg3mroqhvfy6eha7pvax@egxycr4kp7xw>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acrdFfk8al80dynq@baldur>
 <ces6pczk5yo2v5h6sga2dl2xuncqv4pmudunc7dhyeiy6swfh7@bk7vxdxrsrzz>
 <adO1lS2g8Hewj0Ol@baldur>
 <a6lce6bq3yjzidxzq6w2xuiyevvgfuu5crbijtzeiukecmwvhh@k2w64iyj7q7q>
 <cbffc0ec-2961-4a3f-91e8-770f3f7f8bcc@nvidia.com>
 <4ympdtnpqrydnjmapuswsnig7ymuopy4kpxqclyxnoaqgpdmxl@eywcfbu3avtg>
 <49a68039-3a59-4b4c-acbd-0fa917d0e456@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49a68039-3a59-4b4c-acbd-0fa917d0e456@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_044452_936118_81D84C04 
X-CRM114-Status: GOOD (  25.03  )
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

On Thu, May 07, 2026 at 11:54:08AM +0100, Jon Hunter wrote:
> 
> On 06/05/2026 18:18, Manivannan Sadhasivam wrote:
> > On Tue, May 05, 2026 at 02:47:08PM +0100, Jon Hunter wrote:
> > > Hi Mani,
> > > 
> > > On 06/04/2026 15:29, Manivannan Sadhasivam wrote:
> > > 
> > > ...
> > > 
> > > > Sure. It makes logical sense to relate this API behavior with the state of CX.
> > > > I'll send v2 with the updated commit message.
> > > 
> > > Did you ever send a V2? I am not sure if I missed it and so wanted to check.
> > > 
> > 
> > No, I didn't. I had some offline discussions with Bjorn and concluded that it
> > might not be appropriate to set pm_set_resume/suspend_via_firmware() for all
> > firmware flavors that our Qcom SoCs support.
> > 
> > Then I found out a limitation with our Root Complex IPs in exiting L1ss if the
> > platform is suspended. So sent out a series to fix that and that allowed me to
> > get past the NVMe issue coincidentally.
> > 
> > But since this patch applies to other ARM64 SoCs, it logically makes sense to
> > apply it IMO. So, I'll leave it to PSCI maintainers to decide.
> 
> 
> I am not sure I follow the above. Sounds like you don't want to apply this
> because it may not work for all Qualcomm SoCs, but regardless of that you
> will leave to the PSCI maintainers to decide?
> 

No, I was saying that there is no need to respin this patch and the PSCI
maintainers can apply this patch as-is.

> Anyway, I have resumed the discussion on the original thread [0] because
> this has been broken now for the last two kernel releases.
> 

Sure. We were carrying out-of-tree patch to fix this issue ever since we started
supporting NVMe on Qcom SoCs ;)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

