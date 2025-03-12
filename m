Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA15C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoJGCdF3oDbA7eULlsGOHzFmKcP6ZxsGi3iStEDY0S0=; b=FAFoREKWQ91HDrNWQopp4quz6z
	m3q7VacLxJxKPNOviSs2zStDZO++36DHILNUuPPniwrDwpdwPvKcDaRygqRoFH2/Khr35YP8Ne2Wr
	TdGiALIcZVQlOnPHuwN2VpgCRvP7sSaCZL37tPTebdMWx/h8t09avGyN3eZVZ7tPdcZBH7XgSZb7d
	wQ6u+lBZ07V/oslqaBndvvnPyrNL5AZosrAmWi5oJwEPhsk5IjdwOmHS7vp6y17JAaQaTjulDyucZ
	q5eQzjp95UUIqiLkHkE5aYaVUUJjQv6ShqBYxLz+PsGrlO9fztnz5otnmZKf5JKI9rIVmdiCoCvz7
	0E1DmJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO2f-00000008sDX-3h1w;
	Wed, 12 Mar 2025 15:30:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsO10-00000008s3t-29PF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 15:29:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913d129c1aso24574f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741793341; x=1742398141; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GoJGCdF3oDbA7eULlsGOHzFmKcP6ZxsGi3iStEDY0S0=;
        b=yuneLfpJgIa1LWV17AX0lXHH4oXmwyc3KNhzUq6F5Vd23sEMAlh+3rqfjsowKwocgj
         oyHmdiSWWGMnFmsTLobhJXQvQTQRlvd8GW0CnipKpoFM9HBbOlkhzqbD0bQOmlpJeXqz
         bkohQUh4av9b3CjrH4g2uySuRJ4pWs0Bjae2gHe6PO6ZjXliBk8fplv4wTl21NcXZ+uE
         h5MzZLQTH8+zNhiwLe6SKKXribyfKX7UmHREorOwPzO70SsAxQPHsH+xfExpba8AWaCG
         KIDHVXchEAoz6axRY5Fz+TYuqpOQaHnBRdkoHGBN9y4i78sYwg6YQfYClCuXa5bLmwKX
         JizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741793341; x=1742398141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoJGCdF3oDbA7eULlsGOHzFmKcP6ZxsGi3iStEDY0S0=;
        b=TyxnrDD9HTiIzCLGYAJAPRMpqf4CiC8dD2sG23CnRmt42l+IFjRUntkkSZ3DOuB8mP
         btkZXfKBryOSD183g1ECk7cF8+aRQyw70NsSurDLpSPoeACSwNT/qQQXkQjWBZyyfmlW
         C5KIdKaoQ3piuei/5kS4LDYKLebr5tYMqxAcEiyshVdhGA+GMkxVudGe7wNVGzsNiNSj
         30oGFIL1am4TlXZ+IhaVRUOOIwwanomMrlfjodAry9iC4Fgg8yljIs+OzsmllOJ6/QIt
         FEPizxdX5fVANqJ5Gy+wINNPxApitFeCHUtF4ZlPliRPbmIOZ1eq6PzZImsoN7znUhge
         wR5g==
X-Forwarded-Encrypted: i=1; AJvYcCXe/PbZiCSn20h638kdHgbMWOnw1lz/cN0qRY64hWotbaoWwprtkxhuYQu0EnjHaflppib6gjKiHbiDpSDExaSC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw0+5qoXO2HMFOTFlsUbuPJRxeLikFrdBfjnM3CR3E2Y0qSnRR
	CGypOcRki58nXq96Wqtz6aUKLtJO1xD2kP2N+m1MNq5fjadw8zWmqDIZBI/ceJGq3BVLmg+IaLW
	ug/GzFrGkU2iHoFzuY7PdzP4XaLH37Ep7IXeDHw==
X-Gm-Gg: ASbGncszOHFFK/rll/uwKfq/mU4I0UBixhVIo7JukpA2Y/y8NNuwel6S9LVMR6EPqD7
	skvX9oiCX/PWXbvRfCY87+1EViZPxNMVr5ml86wPv94e5DrJk1/1dXKLsJEF1lRKEAdRZQICeH3
	wladSlDCDhAHAtqFzvHqdj7SBjeDE=
X-Google-Smtp-Source: AGHT+IGw4bTsCNZeyHyE2bBo2kT2RvE7wgPFf4FL+k+G4SRUq7UKiAhEDf/H5m1+yHQGeBMie4MSyvCDJCGtPn4RUIg=
X-Received: by 2002:a05:6000:1448:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-395633b59e0mr126422f8f.0.1741793340830; Wed, 12 Mar 2025
 08:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <CACr-zFC=mPNeeHMp9XnSby+cMQaPWt_3s8iUiCN+EnVPeGad8Q@mail.gmail.com>
 <uljqxwfgl26txrfqvkvzzpj6qurgmwcbuot7gu2u6rwjaqgncb@jeuyi4mexjff>
 <CACr-zFDSFizYmrVN-dV334n1kq17UB9k4FxrV20NNQCQMhzrwg@mail.gmail.com>
 <92dd35a2-d1cc-4f2b-b3a8-5752ec33b0d3@kernel.org> <CACr-zFCYWEFPO8yExp_8hOQdVtC9Zwu1ZOZNksSeyyS6Ht0e9A@mail.gmail.com>
 <5ecb69c9-c877-4c91-a1ae-0ef59d0ee3d6@kernel.org>
In-Reply-To: <5ecb69c9-c877-4c91-a1ae-0ef59d0ee3d6@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 12 Mar 2025 16:28:49 +0100
X-Gm-Features: AQ5f1JrsTOrUVQk8MQpv1Smb_EIlMCLrXov_OVBk2xwC6hUgiuoRDMUNqMw387s
Message-ID: <CACr-zFAMa3Awx16avbXNMRhkELFkEZedZfHVCFuFc4fitWFL4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as built-in
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_082902_557001_290276ED 
X-CRM114-Status: GOOD (  31.12  )
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

Hi Krzysztof,

On Wed, 12 Mar 2025 at 12:34, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/03/2025 12:10, Christopher Obbard wrote:
> > Hi Krzysztof,
> >
> > On Wed, 12 Mar 2025 at 09:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 11/03/2025 20:15, Christopher Obbard wrote:
> >>> Hi Dmitry,
> >>>
> >>> On Tue, 11 Mar 2025 at 19:58, Dmitry Baryshkov <lumag@kernel.org> wrote:
> >>>>
> >>>> On Tue, Mar 11, 2025 at 07:10:06PM +0100, Christopher Obbard wrote:
> >>>>> I sent this patch to start the discussion, some things I found:
> >>>>>
> >>>>> 1) Some interconnects are missing from arm defconfig. Should they be =y too ?
> >>>>
> >>>> No, unless those are required for the UART console.
> >>>
> >>> OK, that makes sense. FWIW the cryptic (to me, at least) commit log on
> >>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6eee808134ecf1c1093ff1ddfc056dc5e469d0c3
> >>> made me think that the interconnects should be built-in on all devices.
> >>>
> >>> Of course, the real problem here is RB3gen2 not actually finding the
> >>> UFS/eMMC device due to no interconnect driver.
> >>> Until now, I have been building that into the kernel. I will
> >>> investigate instead shoving into the initrd (in both debian and
> >>> fedora) which should solve my issue and render this patchset useless.
> >>
> >> For Qualcomm platforms you are expected to always have initramfs, thus
> >> you will have the modules for UFS/eMMC mounts. I don't understand the
> >> problem which you were trying to solve.
> >>
> >> The interconnects were built in *only* because of need for serial
> >> console. Only.
> >
> > Thanks for confirming. It is all clear now.
> >
> > Consider this patch dropped from my side.
> >
> > For reference, I am working on updating initramfs generation tools in
> > Debian/Fedora to include the required interconnect modules. Currently
> > the interconnect drivers are built as modules in these distros, but
> > are not included in the initrd. That is where my confusion initially
> > stemmed from.
>
> Sure. This defconfig is anyway for us - developers, not for the distros
> to use directly. Distros have much bigger configs and use almost
> everything as module.

Completely agree - my usual workflow is to build with the kernel's
defconfig (disto config is generally huge) and install the resulting
kernel into my Debian image.

Installing a kernel built with `make bindeb-pkg` then calls
update-initramfs to create the initrd - which then should pack the
RIGHT modules needed for loading storage/network boot/etc into the
initrd. In this case it simply didn't yet copy that module into the
initrd in Debian, so I will sort it out in the distro space ;-).

We can likely stop this discussion now as it's clear to everyone
what's going on I think.

Thanks,

Chris

