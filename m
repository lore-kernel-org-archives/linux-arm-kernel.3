Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2158CCD186
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7cWuMDzbtS1yC9wqtXZi6tdwC17BU9l7fLQRuq7gmI=; b=fuLgI/f0F/Ka8iWTLDoi/qbgMe
	fl10pz5IZi/1Rm1fjXkPDxv/XLt6lrO4P1dkmAbOZChm6yvPEvybIEqebxMkSX2pCKoCJSSr8xRWP
	73TyqBx/n5NRobU3GcFcvRZ+Twl86ZkAbEV37UUSCKddhh81WZJty4I5ZkpqxbTsGSeAROzazMgK4
	LhH3te/40T2Nh9byM6M4X7BniE7FKi/+6J5RHxYsAPwq8qN/rEdWcSW3tfE10RsxRAq0V1+xp78hu
	30QfXUZBWhdPe/4LkcolkdvvPuKdBbrFPeUCCQtkn7FYai0KNCzuThMyd8FMr2dYUAU6H7q0NKd9R
	LDyvcGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68BY-000000026oi-3dN0;
	Tue, 07 Oct 2025 13:57:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68BW-000000026oO-22Vy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 13:56:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so2553423b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759845417; x=1760450217; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7cWuMDzbtS1yC9wqtXZi6tdwC17BU9l7fLQRuq7gmI=;
        b=TMsNwZ/IQETWyTniJHn57eUPuo6f44i4/q6zmbBk064AXTq8UCu01ESRF0tKj0kgU5
         1E1MXtiEcsnUGD2SOLcpmXzAjtBpcEZiCJqUZvgRn7i+8uVjEdJSFIIlqcMt5iOveH5x
         ERcBai8xxBQO6FHpC2vFe6ii6Qps3DA7BClR7O7NTICACOjvdcWe2IArNodE5V9MfuSZ
         NAWISS6j13oaM9wd7OR4R57/AjzhQO19DhNzm3l7FnFF07LJuj7L9U76P1ADGsMCRbTg
         XwCEBj7P5PvX+ZT/ImAjhV8zpUAAYVEvrG/z7kA6oNwleXOksthIBlKAWvtoaTPts1Tp
         r+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845417; x=1760450217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7cWuMDzbtS1yC9wqtXZi6tdwC17BU9l7fLQRuq7gmI=;
        b=J04JzAYeglMOPoDec/hlJCMqwr8yvTy7RUNkdfkvyNtEZOP9Y6wTFJgJm7vCFOKYI9
         unVpl+q+2TZtU+DolZHsEFbojb6ICP2eOWz4r7CHHHhwJbbZSsprGHSC2KxO4NZfy7VJ
         Dg9tnUqxEZGGKW793Fm23HSE/IqgE4FzTY5q0G+f0ZzQr08iF2Izbdy74xh+emAmVgrq
         A9NXDhXAuXunkEMww68GlUD2pBcTfG4JQhVn3H2qtctlP7WYMFpSuG6Z39SgRKjocsit
         xce4pa/ThrOo6srY8hUJjuLGfOT6U8hmeenE87kHvGtU5rrnwJ1YbcIG6elUveCD/Fj6
         3Yuw==
X-Forwarded-Encrypted: i=1; AJvYcCWxnf3Trj0i3yeNjgcQud3M421+vt+SA8eVUHgF5N0oFx9mXA/MwEYIRqfq1cULJdAZFJogA4gixLsaGsa2qv2g@lists.infradead.org
X-Gm-Message-State: AOJu0YyEsCDqaFf5EasWbI44Hz8lXe9XA0KbuCeSy0GT7zkdSTDDceYj
	VxyUGVt6JevMy3oA08vAP1WWSoIaB7tZKw+wcjiVM4SsZENzAJ1wpBz58vgx7IGasIPU3n1Cwjz
	77wYO7khYb7itInJtMficq9HiKOjcvpnfdGZhi12KDQ==
X-Gm-Gg: ASbGncu94sUETkQcUxBDrGBmrcX2kLFi2D0AdOpQ9vCCT0dw8RertPG7mYlirEF259H
	nqliOvVJ4jJl8UflDiDfTDFTYeeVTxvxQw38V3Hwu4hoSR++oHVRSjYf/yhIHNu3U7SCILm2pNj
	+Q+NZOF+RXbDyva4EXV2pXdxyZxlpvZK6eV7OPl7Nq/0IdB4vWJdSFCZnSkCJ6PcejK1NaJTrb5
	ejEiPuZpaHv1r20Jmpx5vwlqd55MX3kVgQiPvQ9RaSd5L/F8xvNeVBBfWuCVfPtK8da
X-Google-Smtp-Source: AGHT+IEsiWqnXaD1cuE3/m+LZcGWd7XHacsxrexFMtx/SJ2oYNLhRRGdKoHhf9+raCyU9FzKPCRwRq6405SwVXCIe/8=
X-Received: by 2002:a05:6a00:988:b0:781:d163:ce41 with SMTP id
 d2e1a72fcca58-78c98d5cc70mr16919790b3a.11.1759845417396; Tue, 07 Oct 2025
 06:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-19-ea49e91124ec@arm.com>
 <CAJ9a7VgQoJMQyuGP6UP8ptg4xcoV2cbR4bwz6ooRy5O_SaiCVA@mail.gmail.com> <20251003135946.GY7985@e132581.arm.com>
In-Reply-To: <20251003135946.GY7985@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 7 Oct 2025 14:56:46 +0100
X-Gm-Features: AS18NWAgCrSWwh2oCctSKgUbwseSTmmKlJPEmkCZQGmWUOFNklXbFhpzA3iiu2Q
Message-ID: <CAJ9a7Vgg24S3ApkvEWr5ayD0OK5cYZTsmjJKpZkZzzMah72ijw@mail.gmail.com>
Subject: Re: [PATCH v3 19/31] coresight: cti: Introduce CS_MODE_DEBUG mode
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Yabin Cui <yabinc@google.com>, 
	Keita Morisaki <keyz@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_065658_529938_E5C1586D 
X-CRM114-Status: GOOD (  31.37  )
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

Hi Leo,

On Fri, 3 Oct 2025 at 14:59, Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, Oct 02, 2025 at 11:31:52AM +0100, Mike Leach wrote:
> > Hi,
> >
> > On Mon, 15 Sept 2025 at 11:34, Leo Yan <leo.yan@arm.com> wrote:
> > >
> > > Introduce a new CS_MODE_DEBUG mode to indicate that a device is being
> > > used for debugging purposes, e.g, if a system enables CTI for debugging
> > > but not for hardware trace
> > >
> >
> > How can you know why the CTI is being enabled?
>
> Depend on which CTI enablement path is invoked.
>
> > System CTIs are attached to key HW trace infrastucture such as input
> > triggers for ETR/ETB that have direct effect on trace.
> > CoreCTIs, while they have some debug triggers, can also trigger ETM events.
>
> Seems to me, it is no matter system CTIs or Core CTIs. Here, I am trying
> to distinguish three methods for enabling CTI:
>
>   (1) Enable CTI within a perf session.
>   (2) Enable CTI within a sysfs session.
>   (3) Enable CTI using the CTI driver's sysfs knob(s).
>
> Currently, methods (2) and (3) are both using CS_MODE_SYSFS.
>
> Method (2) enables a CTI device when we enable a source-to-sink path
> via the sysfs interface; CTI acts as a helper in this case.
>
> Since the CTI driver also provides its own sysfs knobs to enable the
> CTI device by itself (defined in coresight-cti-sysfs.c), to
> distinguish this from method (2), this patch introduces CS_MODE_DEBUG.
>
> Thanks,
> Leo

The point here is that a user can (or at least could and should be
able to) program and enable CTIs across the system to generate signal
inputs to trace devices, then start trace either by sysfs or perf and
expect those CTIs to have the desired effect.

The "mode" for CTIs was introduced to fix a ref count issue. I am not
sure now that this is the best solution. A "mode" is good for
components on the direct trace path responsible for transmitting trace
from source to sink, but perhaps less useful on the CTI/CTM system
which is both global and has multiple uses.

We effectively have three domains for CTIs all of which can be
programmed to affect trace capture -
1) CPU bound - on the trace path, possibly affected by core power down
depending on the implementation of the system and will be enabled as
helpers as the path is enabled.
2) Trace path  system CTIs - connected to other path devices - e.g.
funnels, etr etc, that will also be enabled as helpers as trace path
is enabled.
3) Other system CTIs - not directly connected to specific trace
devices, but can channel signals via the CTM to other trace path CTIs

The CTI driver ref-counts CTI enables / disables, and alos has a flag
to indicate when powered so that enables / disables are counted but
will not be acted on unless powered.

There is probably a case for ensuring that the enables/disables via
the sysfs files are balanced - i.e. a sysfs file disable should not
disable a helper enable, so a specific count on that route may be
needed.

Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

