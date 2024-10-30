Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F7ED6B6D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQzFRfxxx9a4+2mBsj0Xqoq7m6oJoVrd/IVmDiqDLcY=; b=TE2oz3l57ywdeCdf+aOIypyOhw
	mbXXBD9b/R1LOSF+04eqCoBpUZl/CjwY2JpWD97nZKfrFBOkk8uqHWM05fkZbCrsETGfKQO6vjTJq
	5rgof46hOGLDssN1FRk6x7SyOgdEnf3EhrthJLs4OmXRl8QOz6pIt+r6q4VR/aSBieakIdoTzehe5
	qSWO6U4WOCfF8xbUcxjRJQQs5PUTeDFOJgs3J1zED7Ton/ay8y7U6hkZr8JqIlwTvJL2rsp+ToBwi
	dwog58hjUt2slGPMjj5Y43kg53yHvIniM0KK2J8JvbAMNSZn+Qls8lcBWKbb0b6Oe5CKdAYy9plh8
	M6DAsw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ExO-00000001boj-1M2r;
	Wed, 30 Oct 2024 20:06:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Evg-00000001bZ1-06rx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 20:04:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71ec997ad06so150370b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730318670; x=1730923470; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQzFRfxxx9a4+2mBsj0Xqoq7m6oJoVrd/IVmDiqDLcY=;
        b=LA7wC1yIZqS8l/lQA8r6V9fInphqrcqwH0zcX8ZEdznO1X84v5jJLUrcMAr0z5cVeC
         /v4xrpgrEy+7VvKTRyiPWboImm07Vb6tsKcop2VDpwUHbyu7bpYLqgcMA0V6qwwrC0pN
         iqb3u+2y0UXBPZ+9RPnypqKgEOnP0beNKKRcGJzhnihiJluwnMjnewKO8BaSFIrrT/er
         VnME4gPYak76bDF9Mt9paFogJTc6CTN9lKWs/mu+cYWtJc5ffsb+bjdiWrKoQMkWDK5C
         fpxFJmmEeQOxWoniudEa9WCwJVqLXGc5rqL3U9NbPNfbtKfWhJS92XhsfFXuuLsuIjuT
         s+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730318670; x=1730923470;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQzFRfxxx9a4+2mBsj0Xqoq7m6oJoVrd/IVmDiqDLcY=;
        b=Nf2PhDI15DpOwHI5MS1AsIB/QZNJRtFQ+qNbFi1CAov5JM0fYt6ewGoEAbg/xd3pm4
         Jz0/SMUEo4e6avdXM0JOdA6rN9LHD0CCGyuwyZUeM1fCwnVD2+2KvN9Jq34fIFTb8LKc
         C2sQVMHeUaDUD/CW18vHEciJ0hAEJpX/aMmtucPyQzojzpc2idtJKCJXY0NOzW8PZ9Du
         qd7DC48rlQcACcuejnP3OYeLMLADGCmzbEEALkZOHD2AIfx58l+is930aWuR5VY6BoYB
         jpD23JIhQrbKxrdA3hP/Nr0fMBcbSTMYCTobQkovbgl6akoAv0b2UJ+abGzvL6sRidgs
         YvLg==
X-Gm-Message-State: AOJu0YxyOTYDaNe/t/CtfAMjwgaJNAOFH79AD40ij79bKMFH4vdOYVbk
	fs2lhCycG5Wdc+CtEVXYPMfMWc3Z09kwbAoLaDlXzqyNrsrHrwzaSjr2r5jwNwk=
X-Google-Smtp-Source: AGHT+IGVMEfUTc5x54Nwx1RTWRE+uqmsaKPPq5D46+jAG7fPOuoQ1j0ELW9wLdgJ/Zu3YwUM52plmg==
X-Received: by 2002:a05:6a00:3ccb:b0:71e:4ee1:6d78 with SMTP id d2e1a72fcca58-720ab39e56emr5383301b3a.1.1730318670285;
        Wed, 30 Oct 2024 13:04:30 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a3c046sm9623477b3a.194.2024.10.30.13.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 13:04:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Nishanth Menon
 <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, vishalm@ti.com, sebin.francis@ti.com,
 d-gole@ti.com, Devarsh Thakkar <devarsht@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH RFC] pmdomain: ti-sci: Set PD on/off state according to
 the HW state
In-Reply-To: <20241022-tisci-pd-boot-state-v1-1-849a6384131b@ideasonboard.com>
References: <20241022-tisci-pd-boot-state-v1-1-849a6384131b@ideasonboard.com>
Date: Wed, 30 Oct 2024 13:04:28 -0700
Message-ID: <7hmsilqrw3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_130432_267122_6C96199F 
X-CRM114-Status: GOOD (  34.82  )
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

Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> writes:

> At the moment the driver sets the power state of all the PDs it creates
> to off, regardless of the actual HW state. This has two drawbacks:
>
> 1) The kernel cannot disable unused PDs automatically for power saving,
>    as it thinks they are off already
>
> 2) A more specific case (but perhaps applicable to other scenarios
>    also): bootloader enabled splash-screen cannot be kept on the screen.
>
> The issue in 2) is that the driver framework automatically enables the
> device's PD before calling probe() and disables it after the probe().
> This means that when the display subsystem (DSS) driver probes, but e.g.
> fails due to deferred probing, the DSS PD gets turned off and the driver
> cannot do anything to affect that.
>
> Solving the 2) requires more changes to actually keep the PD on during
> the boot, but a prerequisite for it is to have the correct power state
> for the PD.
>
> The downside with this patch is that it takes time to call the 'is_on'
> op, and we need to call it for each PD. In my tests with AM62 SK, using
> defconfig, I see an increase from ~3.5ms to ~7ms. However, the added
> feature is valuable, so in my opinion it's worth it.
>
> The performance could probably be improved with a new firmware API which
> returns the power states of all the PDs.

Agreed.  I think we have to pay this performance price for correctness,
and we can optimizie it later with improvements to the SCI firmware and
a new API.

> There's also a related HW issue at play here: if the DSS IP is enabled
> and active, and its PD is turned off without first disabling the DSS
> display outputs, the DSS IP will hang and causes the kernel to halt if
> and when the DSS driver accesses the DSS registers the next time.

Ouch.

> With the current upstream kernel, with this patch applied, this means
> that if the bootloader enables the display, and the DSS driver is
> compiled as a module, the kernel will at some point disable unused PDs,
> including the DSS PD. When the DSS module is later loaded, it will hang
> the kernel.
>
> The same issue is already there, even without this patch, as the DSS
> driver may hit deferred probing, which causes the PD to be turned off,
> and leading to kernel halt when the DSS driver is probed again. This
> issue has been made quite rare with some arrangements in the DSS
> driver's probe, but it's still there.
>
> So, because of the DSS hang issues, I think this patch is still an RFC.

Like you said, I think that DSS hang is an issue independently of this
patch, so it shouldn't hold this up IMO.

> Hopefully we can sort out all the issues, but this patch (or similar)
> will be part of the solution so I'd like to get some acks/nacks/comments
> for this. Also, this change might have side effects to other devices
> too, if the drivers expect the PD to be on, so testing is needed.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

We already discussed this a bit off-list, but for the record, I agree
with the approach.

I also tested it on k3-am62a7-sk where I've been doing the other TI SCI
pmdomain work and everything still working fine.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

