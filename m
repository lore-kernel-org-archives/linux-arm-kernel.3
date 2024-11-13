Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A51D41C0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlw6kUSyPp5tLgtfsZkFNg3PR6lL49gz78ER/JqTsTQ=; b=Lb+lP/R1YDd45z6Lm7H9lYf6NS
	OXlyejyMvr7vr/iP83eUK8D7adEN/bjkartQ+32ZKQ/mPns6gubS0hxAEca8jr1x5TywNoZKOSXou
	zjMgTIBh/3tZq+2GQJQe5bWGwaweMPA9LwPgwjezMSX2OIcgfAqyz6T8FdXMxvzmKqA5o9ODzZdvc
	uDvyYFWstenvHIvSEb1AheS8vjZVBNryK7G61RcagynsME0tVnMcbWRfJeG1VjnAjcBKXX1slIYCz
	lAe8ZdPl0+l96HcckLhEKN59iB0mmJZgpiIvTiTVurTQff1lRKDLqygmwx+gMsRh+UJ/4i6eJuShV
	qO8tk/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8Pg-000000063gf-16Ho;
	Wed, 13 Nov 2024 08:07:44 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB8Nq-000000063UY-3TmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:05:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-724455f40a0so1769988b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731485149; x=1732089949; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlw6kUSyPp5tLgtfsZkFNg3PR6lL49gz78ER/JqTsTQ=;
        b=dO0SXth9z5GDezgNwGzXi8PGUewSUN/hleE2PC4W3xI65uORHhYxv2hfia201KOifM
         EoUO+1nLdD5AM0asxYwOIcAMkWL2/T4Uqj3K+wJdr8P/51ylCe2w1TteVY1BqlA+aGQB
         ils8g8NGYwWJFppHlOa3ZWCdPRR1R39wnlr/cqBNNgVATOQzTtmK0tEMQKcPKGVMRigX
         +alcqO7H7kbFhijh2sQ/eu6VPVv7OT/u3ECCoU2mQPu7Y5bAm4KAWWuyfu/Gavddvt6O
         xX1ErSkLKxZhfZyWQtM9pdgkhPL7PT4LynCf8L2yhyqfdZnO/PzYmrFMpT4vZNRnKdou
         waDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731485149; x=1732089949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlw6kUSyPp5tLgtfsZkFNg3PR6lL49gz78ER/JqTsTQ=;
        b=xTuxGjs4LX8AmhC3BVrxybvFn538CkuB6PNmvisVtgEv7rNKeQKgLiZpECzJrQNsvt
         hj5M3GPwf7vdezHP6mp/DjhkhWpUDOHVmVC7Azmqevv3Ky6LJ0Mt3mLHMQDbJSnIGyCD
         FGg/DvyPt8aMTLzkj+SwU7MeXAjZDWRtuqdvxuQBhGSGVCfq55hx5fnJ7DOj61VHpXOP
         4hni2kyTEWDFEQ9pKaHO7dN0o71+eG3UQkquD5acz7pJXeC6sTy8jQ7Mn3jT/t261nMh
         MfIcbxwE8PwQEorOaY/T764OPoGg5k0RwqL52/r+PEoPCKM2DMKzyo7b3aayWx+O5JWN
         or9A==
X-Forwarded-Encrypted: i=1; AJvYcCUU98vhvlI1ZKwXN9Z+/4vAXHJ4Oh5HT5ey7k21coP5ZUf1Uo/3msG2Ej01Wi0Ky3evhnBcEd6vCtgpUtYbrguI@lists.infradead.org
X-Gm-Message-State: AOJu0YwJoDokHFL0wXZbnpPe/Zd9n8qL7R7nIQ7st3Ueiju/B4o2JHHK
	Y749WQiIIVVOhxWYKaHNjlRKbNXRuB0lLvFcrRD5f8wqZU+BUpulob/P/B71pw==
X-Google-Smtp-Source: AGHT+IEjDnxKhbCCSCBWYLn3McpIR9HgecocJsUDjXO9Dqd9HW2AhapmTEwblwCMv1Z5Ny/KnEVQ9w==
X-Received: by 2002:a05:6a20:6a20:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1dc228b0182mr24476009637.1.1731485149130;
        Wed, 13 Nov 2024 00:05:49 -0800 (PST)
Received: from thinkpad ([117.213.103.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f7127f3b01sm960520a12.84.2024.11.13.00.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:05:48 -0800 (PST)
Date: Wed, 13 Nov 2024 13:35:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on
 pre-SYSTEM_SUSPEND PSCI impls
Message-ID: <20241113080540.mtm7nu7nqrfz27yj@thinkpad>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
 <ce1d2196-cf09-4d27-8b41-372948a59e89@gmail.com>
 <20241112184301.6mlwpfzzowut36pn@thinkpad>
 <eeec6eea-edb4-414e-9c11-88054e3624e4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeec6eea-edb4-414e-9c11-88054e3624e4@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_000550_900048_E0CE1516 
X-CRM114-Status: GOOD (  55.55  )
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

On Tue, Nov 12, 2024 at 08:04:34PM +0100, Konrad Dybcio wrote:
> 
> 
> On 11/12/24 19:43, Manivannan Sadhasivam wrote:
> > On Tue, Nov 12, 2024 at 07:32:36PM +0100, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 11/12/24 19:01, Manivannan Sadhasivam wrote:
> > > > On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
> > > > > Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
> > > > > CPU_SUSPEND instead. Inform Linux about that.
> > > > > Please see the commit messages for a more detailed explanation.
> > > > > 
> > > > 
> > > > It is still not PSCI_SYSTEM_SUSPEND though...
> > > 
> > > It *literally* does the same thing on devices where it's exposed.
> > > 
> > 
> > But still...
> 
> Still-what? We can't replace the signed firmware on (unironically) tens
> of millions of devices in the wild and this is how it exposes that sleep
> state. This is how arm platforms did it before the PSCI spec was
> updated and SYSTEM_SUSPEND is *still optional today*.
> 

I never asked you to replace the firmware in first place, so don't quote the
fact I never said. I see this approach as a way of abusing/faking PSCI system
suspend.

Moreover, I heard from Bjorn that Qcom doesn't want to put the PCIe devices into
D3Cold during system suspend for future platforms (based on their
experimentation). So if drivers rely on this static information, then even Qcom
cannot achieve what they want.

> 
> > > > > This is effectively a more educated follow-up to [1].
> > > > > 
> > > > > The ultimate goal is to stop making Linux think that certain states
> > > > > only concern cores/clusters, and consequently setting
> > > > > pm_set_suspend/resume_via_firmware(), so that client drivers (such as
> > > > > NVMe, see related discussion over at [2]) can make informed decisions
> > > > > about assuming the power state of the device they govern.
> > > > > 
> > > > > If this series gets green light, I'll push a follow-up one that wires
> > > > > up said sleep state on Qualcomm SoCs across the board.
> > > > > 
> > > > 
> > > > Sorry. I don't think PSCI is the right place for this. Qcom SoCs have a common
> > > > firmware across all segments (mostly),
> > > 
> > > This ^
> > > 
> > > > so there is no S2R involved and only S2Idle.
> > > 
> > > is not at all related to this ^, the "so" makes no sense.
> > > 
> > > (also you're wrong, this *is* S2RAM)
> > > 
> > 
> > What? Qcom SoCs supporting S2R? I'm unheard of.
> 
> Maybe you're thinking of hibernation, which is not widely (if at all)
> supported.
> 

Not hibernation. The Qcom platforms I've aware of all support only S2Idle. I
don't work for Qcom, so I may be missing some insider information.

> 
> > > > If you use PSCI to implement suspend_via_firmware(), then all the SoCs
> > > > making use of the PSCI implementation will have the same behavior. I don't think
> > > > we would want that.
> > > 
> > > This is an issue with the NVMe framework that is totally unrelated to this
> > > change, see below. Also, the code only sets that on targets where such state
> > > exists and is described.
> > > 
> > 
> > Well, you are doing it just because you want the NVMe device to learn about the
> > platform requirement.
> 
> And I can't see why you're having a problem with this. It's exactly how it
> works on x86 too. Modern Standby also shuts down storage on Windows,
> regardless of the CPU architecture.

It is not just my problem. I'm expressing the concern that NVMe folks have and
already expressed over the similar solutions I proposed. And I cannot just
overrule them.

> > > > For instance, if a Qcom SoC is used in an android tablet with the same firmware,
> > > > then this would allow the NVMe device to be turned off during system suspend all
> > > > the time when user presses the lock button. And this will cause NVMe device to
> > > > wear out faster. The said approach will work fine for non-android usecases
> > > > though.
> > > 
> > > The NVMe framework doesn't make a distinction between "phone screen off" and
> > > "laptop lid closed & thrown in a bag" on *any* platform. The usecase you're
> > > describing is not supported as of today since nobody *actually* has NVMe on a
> > > phone that also happens to run upstream Linux.
> > > I'm not going to solve imaginary problems.
> > > 
> > 
> > Not just phone, NVMe device could be running on an android tablet.
> 
> 'Could' very much makes it imaginary. There are no supported devices that
> fall into this category.
> 

Agree that there are no products in the market (yet). But having NMVe on
handheld devices is not something I would quote as 'imaginary'.

> > I'm not
> > talking about an imaginary problem, but a real problem that is in a forseeable
> > future
> 
> Keyword: future. This issue has been on hold for years because of 'issues'
> that are pinky promised to happen eventually, without anyone suggesting any
> actually acceptable solutions. This just undermines progress.
> 

Not true. There are solutions suggested, but then it always takes time to reach
consensus. One of the approach that I'm about to propose is to have a userspace
knob that specifies whether the device can be powered down or not (leaving the
default behavior to put them in low power state). Because, the decision to put
the devices into power down or low power state sounds more like an userspace
policy. It was discussed at LPC 2023.

> > (that is also the reason why NVMe developers doesn't want to put the
> > device into power down mode always during system suspend).
> 
> This is the current behavior on any new x86 laptop, and has been for a
> couple of years.
> 
> > And with this change, you are just going to make the NVMe lifetime miserable on
> > those platforms.
> 
> Fearmongering and hearsay. See above.
> 

I can only wish you best of luck with this approach!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

