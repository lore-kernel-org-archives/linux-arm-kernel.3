Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B502E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 01:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HU9lX2UcHoXHx+eblYPMWmc0zAYSbERvbK5TxRCkS5I=; b=WS8mCc07WiBn3JkcLlWsHrC2Ic
	Yn95LcgU28w2EZIvOAOZ3uPeCY9OBXZZo88biRGi06OZDANA2Qi06FivbhFfgPrvvOyn0cdQKIORo
	VXiyJv7dTkHoA7abfSjCo1xwnXiGX2iVKoUdPx92avhWepMZj+Oud7ai1NEUtwr26yKsoInJ/dN73
	JI0B+Kdp+pLslytvWcphcFkx6G1UFZlnUT0/W86gyOn42MIAL4RZTJDPGfwe/WsBXXtRunQOfstfb
	7b64XMxai/8PUEU5kpuutC0V2vxIABTNKuJgNTtO34GvmTh+5+qEwB+qj2+zUqWOz2k/uXjMW4FxE
	jaFhhiog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBKf-0000000DOIT-1P49;
	Wed, 11 Dec 2024 01:16:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBIc-0000000DO1b-0oJu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 01:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1903A41D2C;
	Wed, 11 Dec 2024 01:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91169C4CED6;
	Wed, 11 Dec 2024 01:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733879635;
	bh=WXYFL2lzpahBm9B+v7DU3pKQd5XfIBdEGGOSasUIPzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iS/3PWM9TNlHS7RGLrXMkZAdwOkldLNzoXEaOeoqgBMx5ECYOict+BBcv0x/hvTYJ
	 4+N5Jv0yQTjXHhbj7h3A0h7YsYbbnYIg6B2GI584k/gTZd94F72j47lunKkC/DGK0m
	 5E9yQokf1WvYnWUltojmWOiab1zudFtSzncq1sQ8T7o79V5iGjAjddaa6r1DsDCmHM
	 j8EDEhMAf71gMbVt0NY9r55TRtxtYbetNeJBxWBozJIOKi/86G10z+mka3ccWpMWT4
	 CsLknvFUygFyYVCakkAfqMcUNKGKcFegooKAU+uMGGCMdFfjWeZBx5dHpRkB0cwQJx
	 VvXsLHYhlowdA==
Date: Tue, 10 Dec 2024 19:13:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Pavan Kondeti <quic_pkondeti@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171358_295580_EE4677F5 
X-CRM114-Status: GOOD (  16.62  )
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

On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> On 12/10/2024 1:24 AM, Rob Clark wrote:
> > On Mon, Dec 9, 2024 at 12:20 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>
> >> When kernel is booted in EL2, SECVID registers are accessible to the
> >> KMD. So we can use that to switch GPU's secure mode to avoid dependency
> >> on Zap firmware. Also, we can't load a secure firmware without a
> >> hypervisor that supports it.
> > 
> > Shouldn't we do this based on whether zap node is in dtb (and not disabled)?
> 
> This is better, isn't it? Otherwise, multiple overlays should be
> maintained for each soc/board since EL2 can be toggled from bootloader.
> And this feature is likely going to be more widely available.
> 

The DeviceTree passed to the OS needs to describe the world that said OS
is going to operate in. If you change the world you need to change the
description.
There are several other examples where this would be necessary
(remoteproc and watchdog to name two examples from the Qualcomm upstream
world).

So, if we can cover this by zap-shader being enabled or disabled, that
sounds like a clean and scaleable solution.

Regards,
Bjorn

