Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1B4CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=; b=d/6/TBRkG5Y53FQsgIyAXZYWkw
	sMJ3zip5K2NGXAoFaYXNPq2KUAk+hqGoQv5tklL9fie+Ymh2eoq3IAEopReYW0MuBcX3jy8pg8EGS
	HVSJ8sd8LS9uTo9TtMv407JpunJOeOp4q2iGspmHZn/x3tLvmcj0TlxtCB6t53Bvfc5Hgc+SfgLl1
	QNSUg/KLnkS+yS/htE90MurrrZdTYgpIZov2xp0bD75NZuLRE7VoSVJ5rWy+cgxHFIGxWS2qxzfYg
	DM+o7LQFMdsTcFLJlE02YiwYIeGvLuxch7OMRUQVRWcpxpTU2aohBYMn3bhqp5OnP+plQ6djOGP3o
	eDEUL3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMU93-0000000EJVY-18F8;
	Mon, 11 May 2026 17:10:17 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMU91-0000000EJUZ-0hn8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 17:10:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8383fb7143aso2125264b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778519414; x=1779124214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=UKkoEcYtjLaOJ23fvuBim4BSQb6MsBET76mpKwDVKgYoJprJ6wYwnim9JamWRNAQ/Y
         yvqrmqEC1ioYdtD4BkmfgzfCJL/HljMrAqFr47557PjoBIXUhbL9ZngkB1NnnFMdj0wW
         fHGfNbw0P+Qcs2Qfut7lH30/Q5Q5mwjZ4zvBVQBfU1ae0DqyriqX3Uiju78+pk3TgRui
         9WZGdvC2KnNmre6fN37B6ETb2LOnsv5B685Lgj23p53Fm/f9N5CKsB4KL2uW40a32Zj8
         sL5ZsDv3FYjR8bt1oty3Vs9gzXoqgQRiRFFpDG+I7vdkM80Iic7miFh0Udt90r1OBB95
         xiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519414; x=1779124214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXPv9NMuATRuOngICuHBognry2tLHdZTtLmZBPko5FM=;
        b=ko8VRzvIPHY4gL9E+WcD2xip7Ty41LIOur/EPpWYjfWtNhOBO2RAVgpi1GpVAg5pEL
         CfwMu2RN0hhezCa+bcTaA+wQnp0b25UEMcfxu4EODuvS5vGT30+vNjVK/A59TLhX84MS
         G+jvORUiPn7faGIPP7ligoUJ49qBuTMVTwOVtXsj9EPp1iaTptPpdVz/hU55PxkGUf0g
         FOiYStp6AGJZXw1V7rOJi3jSFAqcR1xqxRZLUHqgPdrKNOGX68wv02gCjdgCA2CKhBzx
         nnMG7hgFgGihLZQQVrKAjIljpqk6OTrox1jWtNwNb+ZVhkmJ1QOhHvCIiAaO6y0pM4/1
         Oj1A==
X-Forwarded-Encrypted: i=1; AFNElJ8VNrabc6+Y8LHDMCGdQkwc8wOFsFcm86PcTay9xwTvhx3/GfCU4GAuN+DiKJm+YUeDGtFnOAM0IsdfMnRO76E8@lists.infradead.org
X-Gm-Message-State: AOJu0YzwYodPzaT2A2vsLgNxWp0c6NhUJrTjdZ6jed/5GduBfELrEufq
	PskvhLPf3F/n6sHNiO+9PK7u3AUsRoV5MRD6mS9lVRLOeqoOLz4VfpUs/A49m9oiF58=
X-Gm-Gg: Acq92OHAHR1z2/JBffFX0VTD4OS9SUeV0FosRG2KHOUFpxu9iKZXjx2L/d2CTcaFyQy
	cn0Vt5rc+1cQGqyBH6l7wAhp8rwY6CXZwvReK1XclbcRsji1gBP0u3nDeAICUpReqtnLi1r1/Ob
	bYhW7Ft4T2mwJNdnX7hrJ55MjFEg+W0Og/A4jOP6+raUGgbDlKO6ICISqS6mqNmQ4MOpCv1jL2F
	aDqLo5KQA2QvUq/e6DJ6+VcBwZU3FWI5/QVbwePYhIlrjByMoUNUk8e9HeCsfkwvXQ1Vc3w+Egb
	X+1NprguK/8ZyAOG3DpkiaJr/9hlVSvssw8u8aWqro4aycTJvEuBd5y0aZHPsSgGReTnfZzFQQo
	9PUAzDVNkocS8W5hIb5jAJ8o1+s6Ig+1+0SxSkEWM2R+Qscc1yKKSv7H6xp0tKdW799LG6o3VNd
	Pq8e1og2XFbuChdqZA6Lr2xbXuYKs=
X-Received: by 2002:a05:6a00:f9a:b0:82a:7893:e14b with SMTP id d2e1a72fcca58-83e3bb9f9ecmr9882717b3a.38.1778519413426;
        Mon, 11 May 2026 10:10:13 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6a4f:ac45:cc0f:8508])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a52cesm19958782b3a.57.2026.05.11.10.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:10:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:10:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org, peng.fan@nxp.com,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/4] remoteproc: add Cortex-A Core remoteproc support
 on i.MX platforms
Message-ID: <agINcH6hVf8G_T_3@p14s>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <agF+iYRfUIoBu35M@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agF+iYRfUIoBu35M@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_101015_214335_BB8EB4E0 
X-CRM114-Status: GOOD (  23.46  )
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

On Mon, May 11, 2026 at 03:00:25PM +0800, Peng Fan wrote:
> Hi Jiafei,
> 
> On Mon, May 11, 2026 at 10:39:24AM +0800, Jiafei Pan wrote:
> >This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
> >1. Adding dts binding for Cortex-A Core remoteproc
> >2. Enable Cortex-A Core remoteproc support in remoteproc driver
> >3. Adding dts example on imx93 platforms.
> 
> Normally, we only keep one patch or patch series from the same author that
> modifies the same file in the review queue at a time.
> 
> You already have a patch for imx_rproc.c currently under review(got R-b, but
> need Mathieu to handle), so this patch series might be delayed to be reviewed.
> 
> As I have replied in internal, to make multiple OS run on Cortex-A SMP without
> hypervsior, some GIC changes are required, without those GIC changes,
> this patchset is not testable using upstream tree.
>

If that is the case, please re-submit when the proper background work on GIC has
been merged.

Mathieu
 
> Thanks,
> Peng
> 
> >
> >Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> >
> >---
> >Changes in v3:
> >- Fixed dt_binding_check warnings
> >- Updated prefix of patch subject
> >
> >Changes in v2:
> >- Update arch/arm64/boot/dts/freescale/Makefile to add new dts
> >
> >---
> >Hou Zhiqiang (1):
> >  remoteproc: imx_rproc: add autoboot support for A-core
> >
> >Jiafei Pan (3):
> >  dt-bindings: remoteproc: add imx-rproc-psci
> >  remoteproc: imx_rproc: add support for Cortex-A Core
> >  arm64: dts: imx93: Cortex-A Core remoteproc device node
> >
> > .../remoteproc/fsl,imx-rproc-psci.yaml        |  51 ++++++
> > arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
> > .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
> > .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
> > drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
> > drivers/remoteproc/imx_rproc.h                |   2 +
> > 7 files changed, 297 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
> >
> >-- 
> >2.43.0
> >

