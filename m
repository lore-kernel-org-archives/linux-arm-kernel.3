Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF2CD3A679
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMUpO4GHw4JTvBKu5JvINhynu0MBcZcJA0tvXvTxH3I=; b=b5x6CzxnVmTBilJr8ClzmGDsE3
	cgAuB2ZepfPGiP9cZ25yrlEuBvvQiEXAILUVsknG9d24ex+8Ve/GvJSt35McPOyV9TC6BZStzfuzE
	iN3/GlNXoJAHXWE7ziHOqs2FxSyeCGomgR4nuTt3ml64NXPWN31uKoKNAEXZAOtq+S+O7KPPoh7+v
	dAGva3hTVW+uXLD/6F5MZEb7DRinef36wE+qNWlIf1DkKcG09EA9OfhHmY4k5+PerM75kJsZ76r32
	g5n2ILaWkziqolPhma3kQQWJAn/NGraYRGR4sUugGaAuVDwhsdnv4ZOJp0+Ky7Skp8d2aa46kp80b
	T03xafkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qO9-0000000FO2A-48u3;
	Tue, 29 Oct 2024 17:52:17 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5phG-0000000FDK3-48Ha
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:08:00 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c693b68f5so61901945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 10:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221677; x=1730826477;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMUpO4GHw4JTvBKu5JvINhynu0MBcZcJA0tvXvTxH3I=;
        b=e7lWhhP6ZwGq05g9xao6qgI1lvYtD5tU1MYSiLXoppbx9KTDGs04hG+1+ZvFNuT9Uk
         0xgwtWc3L5/p1l/mwQZkdpHKXSwLAdXNBc8AwC6YhpQq7XovvHmHJm611BwUJdhYiy44
         BPGO3a9epXWVV0hV8GjTmYVsOZ1tO7auusIuHsjRDB7xtUx14bTx5ldWBPxp6BP1uUW+
         LXADE59M02rlZT6U0qd4FZkkNHhqA7748yOz6EiAAidD/4UoR0O/8UE0IEqKmwOy5ouE
         wgRQ0K9boBNWnmNn4vUmtN0xVKjGvhb7zU/G/Hxn2vVGsSCk29tq6tXweT5AEOKZolcu
         iB/g==
X-Forwarded-Encrypted: i=1; AJvYcCVmY5andYLXr51WJgJrvCqpGe6Tq5Bd8wTbaNVm0jbAqcBKBcaSFhuJB9B1dSXk0CiAKSlqOPGbmIHQ0fIasjHh@lists.infradead.org
X-Gm-Message-State: AOJu0YwB4m5H+Za2ndsh7Dw3QK57OzUwnCUI0SNnycwt1nyp/wVfws92
	VcMwzBXnvHGM12DR6c+D1hPYL/bOGzplFgfjBgSIRgbL982q8IjYkuv2hSSHB9M=
X-Google-Smtp-Source: AGHT+IHQ6hqt2GFIDvzxzB6z/d1rlXeJz0yqkXbJH8u2AzK+uLr+X4awDkW0ZAHg6kt+Bt1a+fJPTw==
X-Received: by 2002:a17:903:22c5:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-210c68ab683mr167590195ad.18.1730221677056;
        Tue, 29 Oct 2024 10:07:57 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46cd4sm68256225ad.41.2024.10.29.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:07:56 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org
Cc: hns@goldelico.com, b-padhi@ti.com, andreas@kemnade.info,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
Date: Tue, 29 Oct 2024 10:07:56 -0700
Message-ID: <7hiktasuqb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_100759_042005_9B73681E 
X-CRM114-Status: GOOD (  10.54  )
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

Robin Murphy <robin.murphy@arm.com> writes:

> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.
>
> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

I tested this on am57xx-beagle-x15 where before this series, I was
seeing various remoteproc drivers fail with

       remoteproc remoteproc0: can't enable iommu: -12

and now with this the remoteproc drivers are successfully loading again.

Thanks Robin for working on bringing this back into modern times!

Kevin

