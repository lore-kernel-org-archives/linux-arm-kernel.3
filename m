Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA976D132B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u5YBWq3PcwdT15rNs5INrgZ65AXIf+4Xa7bQgYZE4c=; b=lqw7lGaC4HKZY+BGnNobf12XqH
	cG+M6E2qUtywvcGCoodWeL4Z0t19ZFG9pyNJnDNGv+aVABzexf3u20oCqvSpnQPOhX3QcBxPJKs08
	/tf/rWNbJXiKuXpEGpJQsK5/N1ZDjyYhsXrJzgUs1AuVVUPhDDo5YDB1Mx9BUp2dJzQyWLVHo1Fxh
	UhAmTJ5yaepsj2q2PHjVsCk7VmPE7g3lVNiGyBOPGgZnmbSIa6kTVQbF13O5MBgM+w5Z7XFJ2hd1X
	eb6+sHmH+Q/0zLeJdmNK8zhKEEMPqKBqN61ubkfuc4LtDwb3Ub9lI0P+gUOm3wCL8p3xWchYxEnVw
	wZwz9p8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vrR-0000000Ddop-3c1N;
	Mon, 04 Nov 2024 12:07:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vdP-0000000Dbbn-3N2K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:52:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8AD3A42E72
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 11:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4E7C4CED6
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730721158;
	bh=jrlWt5vVEgQhbvNsEfxgX8LzoJjDyTOI4FiZQj4aXNk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JYEf8ZaxDA3521GMC8+lsy2VXaVGTqZhAX+zb1BHjJw/uP87jDcMu6FsbntrY8nRX
	 Hh0k4Umq2uJ0rUpt/kWc7F/aGSIJjQt813PhimAZ/+qayDAONP/MVdae+nBXUG9UCq
	 t0SUsJGmKPVLC2THvhyZGaGUcMmHVvLLe/nM6ugJ/e9ocOkndyK018llbxPtCn42RX
	 PkJj0N8kSFnT8fgQweftGSG/egbdTKqKRcgqK7FgrP157LOKdixAdNd9x9LeI4dtMV
	 A+vayycmbsNz2wGH+gLNM2WG0jKYeieX/+phV4oNhr7r3w9BCH2gX75+S9iKF6UnmG
	 hADpGfE9UpwCQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f58c68c5so7355505e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:52:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9CxhYr447ZYCV+Dg0iU+nzYOjUhnUs3J4E8Uh/ov5xEVGeCVCFfxc4hZbi+NF3FWIM8weZnJWS/oDSCr96FCO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt9US4q7ABkPnJZjYhKSQD6ytZcubcQSIOvIZO2k6qFZ9QFb3F
	hYbOO2ahncRv917DurfiRalwuSiiAzJN2gRMn17ujHubbNgwgC3LV8EBWe8aX4wspILCvkoP5pW
	EmSahI2Kth3dhuzOOG+RX7IyMgPM=
X-Google-Smtp-Source: AGHT+IHOLYnwFSb9KBpeoWpWkpPxWEFAYUIdVKIVNNpEmCe0aybibfjYsoY5R2GKKWfs4LrM9+oAoTYv4X5bZTldauU=
X-Received: by 2002:a05:6512:1295:b0:538:9e36:7b6a with SMTP id
 2adb3069b0e04-53d65df25a3mr8861824e87.32.1730721156964; Mon, 04 Nov 2024
 03:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org> <dk7dxsyunx47gvmlnarjkqx63en52hktdnzwyyeyhohts7rkjn@a6lx6sq46vb4>
In-Reply-To: <dk7dxsyunx47gvmlnarjkqx63en52hktdnzwyyeyhohts7rkjn@a6lx6sq46vb4>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 12:52:25 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEPM+4B4xTThOejMZ5bLHcwzNYbW333ZZu1YFJGy5johg@mail.gmail.com>
Message-ID: <CAMj1kXEPM+4B4xTThOejMZ5bLHcwzNYbW333ZZu1YFJGy5johg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_035239_988588_80D7258C 
X-CRM114-Status: GOOD (  24.14  )
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

(cc Linus)

On Mon, 4 Nov 2024 at 12:51, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Oct 14, 2024 at 04:55:19PM +0300, Dmitry Baryshkov wrote:
> > Follow the ARM64 platform and implement simple cache information driver.
> > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > returning -EOPNOTSUPP in case of older platforms.
> >
> > In theory we should be able to skip CLIDR reading and assume that Dcache
> > and Icache (or unified L1 cache) always exist if CTR is supported and
> > returns sensible value. However I think this better be handled by the
> > maintainers of corresponding platforms.
> >
> > Other than just providing information to the userspace, this patchset is
> > required in order to implement L2 cache driver (and in the end CPU
> > frequency scaling) on ARMv7-based Qualcomm devices.
>
> Sudeep, Ard, Arnd, Russell, I have been struggling to get reviews for
> this for several months. Is there a chance to hear anything? I'd really
> like to scratch this off my 'pending' list.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Handle cores like ARM1176, which have cpu_architecture() ==
> >   CPU_ARCH_ARMv7 (because of VMSAv7 implementation), but no CLIDR
> >   register (because they are ARMv6) (Arnd).
> > - Link to v1: https://lore.kernel.org/r/20231231-armv7-cacheinfo-v1-0-9e8d440b59d9@linaro.org
>
> --
> With best wishes
> Dmitry

