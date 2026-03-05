Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39000F30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQ0T9bUE9C/9y8Vs6pywRcQ3tiB0ev9f4VxMdnV+hAk=; b=uHy9TLJXm33wnNuAc75iOtrGmz
	ISNCC5UhvJ9WHNJn+G/Stc5JIM8BSQ+KbkkzoO25DhvemEGuQsWH4BhCVnyoZEXD3KC+nyaRIEG4Z
	UfsljfSguwE5aEIQT+dUCTbAQzeec9lXtsdt7bNlYzPdQBjFNfV307ALdQConhM0FQozWnv4tpRUy
	i9oBAzS6i8j8mNazvFPxTWB3sKDS2dqJVMuSr+Now36heDWuK4KoimHfwGSyMYjRYNmdtl9SQBvqX
	z6/4WD1qSYnXoCH/7pCDq6q1Hy7udjJXBWW8CWyT3us/0HBBFFM2PCZVTVpnp6D7kGaedwN7xPuEV
	cgdcQOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5aA-00000001W1S-1zHb;
	Thu, 05 Mar 2026 10:05:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5a9-00000001W1B-0gsq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D4176183A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 10:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214F2C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772705124;
	bh=lQ0T9bUE9C/9y8Vs6pywRcQ3tiB0ev9f4VxMdnV+hAk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Rrk1MOcbJC7diGpkgHuAM97vXMc8P/tAN1MFcvPsz7M8WIioAvB9XmrQqu5l+dSOg
	 aqOzcPXh6wSPUm4OVtyZxFCi+cRg9dF2mhjO7HfmL6gRHmrm4l6E+qtIfIiBx3RM8d
	 dkaAfVCb4KCX0Q53zYLrv8P7wUElGWhYZn9npg6tk4bytkPMfj/oDiiZoqr9PVQNyZ
	 XrwRcUKB0ctZvgOj+MPTqa6r76dEWwCKo97NqFJlBdWXE4eLOzRIGpzVIrspHKuzwN
	 +UsuV5+xp7XgdQWqMORe8SoS+IHXb9l30Aw1JZGDBSl0dJkLjmhcnKw+1mfgfnpvhQ
	 y7sT9ETdlhkPQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so20322961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:05:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUijsD32mwiFRKbNb/pwHuvzS1uhuLnfxA7/4iq8ogZYBFC4tiBTOwljDenui3eCVs3Z1OVeHU1Ru5Z7H/tIRZT@lists.infradead.org
X-Gm-Message-State: AOJu0YxPD89FrhvGHLLyu+tyc760YXpj2lLvq4zMYyNYUxYRxqC4dvQG
	o8IFRWY44S27bcuk8+C4UJmJicBICvtWM8faqvm7KktSsNu/ewVHpmWqKisfB+nABYSV0S0i/XQ
	U0pB2tmrzb9werIKQq1cXVvc/KkgSAHg49yi1hlUYcw==
X-Received: by 2002:a05:651c:41d6:b0:387:4ee2:1cbe with SMTP id
 38308e7fff4ca-38a2c564d92mr31840641fa.2.1772705122833; Thu, 05 Mar 2026
 02:05:22 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Mar 2026 05:05:20 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Mar 2026 05:05:20 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 05:05:20 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdnf_F2JtSOaz4AkZT6EErYhMcVT8HZ+bf_zO+FCH+OUA@mail.gmail.com>
X-Gm-Features: AaiRm52_Ghl_cyrpx4-PLseenakv1wMTEmeY_ZbSCiMyp4qVQG4KYHqTiXWk5K0
Message-ID: <CAMRc=Mdnf_F2JtSOaz4AkZT6EErYhMcVT8HZ+bf_zO+FCH+OUA@mail.gmail.com>
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based allocations
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 4 Mar 2026 19:03:01 +0100, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that
> they will not be referenced after the managed resources have been
> released during driver detach.
>
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
>
> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

