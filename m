Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14A3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j28hcJjQkZPaS3yZ4782JQxyz8Zd4wPyi3h2uE2kkXA=; b=wvNY/8lM0bdN8T+QoHAAy9w0QN
	5DiEDn/LzY8w31ZU6t+CNwyF7SqJhb3QuU70fGaoVKyjwZbw305T57qmG5QwdZfDFM/iBXFVpG3jL
	lwmgyi1tdVdVbtOIa/GqVXpaVaZAAJhqwQK+yiizDc6p6AU4GOQ4WMb6xLkjWDTpt3fjPcRjvlfmK
	8eiRM8KECUglpBiS1KujcQWoZx0UFfEmv10ESZGgQwDL6cA5nl5lqLa7ZW/vwlrIIb2HNowHjFpQ1
	peLvR+fYwgWaxjMHRNrgKZFWclSCGaaif6UY64qIHPAUxmI0C5IRap9KbZ1OdEdeFWEplKMmklc0V
	ZS8GZbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyiT-0000000Emhl-1YUT;
	Wed, 15 Jul 2026 12:27:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyiS-0000000Emgs-0LbD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 890E76137F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018661F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118475;
	bh=j28hcJjQkZPaS3yZ4782JQxyz8Zd4wPyi3h2uE2kkXA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QloyeeZA+L0U0Nakkwr/lWVJ2epmV8vXIHzwlA6j94fp0HUd+UPMioZEIUHbjDN8W
	 iKIdi3aCx+rXYWbmwTIh1ICFS6PFQssNjQAquhZJqFjg0wA+njAN4N57PbyX7F9jNB
	 WUXt06OccYpYq0vonrNCnwKy5yOELeoBdgAtUg/Q36E0h9C2Ls8aJLO14r7o82lxGp
	 /FiDjbu1eD3n4ltGunskB6hppF21R6j9g5Zujnk0NI6TvUJOrZ4jy2IsFX0nUWRTwf
	 qsO7X2nTHn4u7dgR8dLHesPpOA7XOin9U5dPJEmjhmViRqSGvWZNPtZNbaLKb5KvK4
	 fP5r1UYPLKo9w==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso1987074e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:27:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpP6VGDG8ylUaStBqcNz72rDuJYnte/oXZe2fKb794syS8pSZFUziwwr+lnt0mZXuQueXD8qsXhRLhw9Vhwosat@lists.infradead.org
X-Gm-Message-State: AOJu0YwAMVou6NqmRrrjLixmp7VWfyJg9DKe5NcrzUpCuXGaXEoVUyaN
	lxY/zsrGhC7ufNjtSjdWp5YVJBh5WzPw3pm0ddvdkCmp6aRRoKGPdY+mB4Vi+LtOYiT4K8sH64T
	1UrYYHk8DK0ibmcU/M47A5PCGk8WkQbaIB+OLDxsLQA==
X-Received: by 2002:a05:6512:250f:b0:5b1:544e:7185 with SMTP id
 2adb3069b0e04-5b1544e721amr2489500e87.40.1784118473678; Wed, 15 Jul 2026
 05:27:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:27:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:27:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 05:27:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc4e1Rso5Vr1ZoRTkAp4WYUz8H-dQWUjkyBg5sgXiDLOw@mail.gmail.com>
X-Gm-Features: AUfX_mxYq9w3t7suoGM2tbsXEv1g058iRFyDqupc6ScLWcGXZxK2WeoKHlbXNCk
Message-ID: <CAMRc=Mc4e1Rso5Vr1ZoRTkAp4WYUz8H-dQWUjkyBg5sgXiDLOw@mail.gmail.com>
Subject: Re: [PATCH v23 00/13] Implement PSCI reboot mode driver for PSCI resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Song Xue <quic_songxue@quicinc.com>, 
	Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
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

On Tue, 14 Jul 2026 19:16:28 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
>
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
> arguments (reset_type and cookie) by encoding them into a single 64-bit
> magic value.
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
>
> With these enhancements, the patch series enables:
>  - Arch Warm reset and system reset cold as predefined reboot modes.
>  - Vendor-specific resets, configurable via the SoC-specific device tree.
>
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
>
> Note on introducing PSCI-MFD:
> In v19/20, psci-reboot-mode was implemented as a faux-device. Review
> discussion suggested this may not be the best model for firmware-backed
> consumers, and that representing PSCI users as regular platform devices
> would be better. One suggestion was to add a PSCI-MFD driver, allowing
> multiple consumers tied to a single PSCI node "arm,psci-1.0" be probed
> as MFD cells.
>
> Following this, the series adds a PSCI-MFD driver and introduces
> cpuidle-psci-domain and psci-reboot-mode as child cells. To meet the
> psci-reboot-mode requirement, the MFD core is extended to support
> fwnode.
> Reference discussions on this:
> https://lore.kernel.org/all/20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com/
>
> ---
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>
> Changes in v23:
> mfd: core: Add firmware-node support to MFD cells
>  - Add named_fwnode-based firmware node support in MFD cells.(by Bart)
>  - Update the release path. (by Bart)
>  - Add checks for duplicate fwnodes.
>  - Update documentation for usage and limitations.
> mfd: psci-mfd: Add psci-reboot-mode child cell
>  - Update for a named_fwnode-based reboot-mode child cell. (By Bart)
>  - Split psci-reboot-mode and psci-cpuidle-domain into separate child
>    cells.
> power: reset: Add psci-reboot-mode driver
>  - Add COMPILE_TEST in Kconfig. (by Bart)
>  - Update to support up to three u32 arguments to accommodate a
>    32-bit reset_type and a 64-bit cookie. (By Sashiko, Lorenzo)
> dt-bindings: arm: Document reboot mode magic
>  - Update to support up to three u32 arguments to accommodate a
>    32-bit reset_type and a 64-bit cookie.
>  - Dropped reviewed by from Bart and Rob due to considerable changes.
> firmware: psci: Introduce command-based resets
>  - Update to support a 64-bit cookie. (By Sashiko, Lorenzo)
>  - Update the flow so unsupported reset commands and any failures during
>    reset command execution fall back to the
>    Linux reboot_mode path. (By Sashiko)
> power: reset: reboot-mode: Add support for predefined reboot modes
>  - Handle errors and free lists in devm_reboot_mode_register(). (by Sashiko)
>  - Update to support up to three u32 arguments.
> power: reset: reboot-mode: Support up to 3 magic values per mode
>  - Patch for 64 bit magic renamed.
>  - Update to support up to three u32 arguments to accommodate a 32-bit
>    reset_type and a 64-bit cookie.
>  - Dropped reviewed by from Bart and Sebastian due to considerable changes.
> - Link to v22: https://lore.kernel.org/r/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com
>

Just wanted to say: thanks for being persistent, we'll get there eventually. :)

Bart

