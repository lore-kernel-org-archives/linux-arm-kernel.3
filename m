Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2667DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDpvp8vnAzoZQLx8FKACNiz9sLgSiXd+woO3izJE9Kg=; b=M+SX2r9849tynZwyc6pZIm/wp0
	v1OuUgJjf9SOcDBjWzqMv5qFaf5JQQBRrx5+ajT1GSRQhw4M1Ignea0CeSGDQ0fwVEHNq2ZOuQVQl
	3fsjlyX4edWJTPpBPuluA+0iSx00IuMV9QQt81316NtCGh2FqRY52Rbvdmepa/J+Jtk4zfHb+Xhmp
	8Vxn9HTqSvUuGGPPFpDVVAzFNrxtdGRkqT/JE/Napzwpbzt22F/V8yphjdQR1bczmE3cWs15m2UFj
	a3z07CIWFU/vs166Bl8mIZLbh/5akP5EbHt4phg9WpzTpENImi7n/eJJjIe4ehRP+rftt62Dc2OXo
	ExD2p+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzNb-0000000Etab-11PZ;
	Wed, 15 Jul 2026 13:10:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzNX-0000000EtZr-2om6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:10:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0858E42B83
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56591F01559
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121022;
	bh=HDpvp8vnAzoZQLx8FKACNiz9sLgSiXd+woO3izJE9Kg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UTM3Ff/Xjfkc1w+y5Rc4E23kuZYtpT6J1qO39PbniNPQT1veAV/ch628jHHSoAc+H
	 UAoDbTsRGXLa40jN8Ur3skgvbIyziZGBxBvtZskuUwvhFYFFXK5HyAHrr+SoNyZbip
	 XEK9Yzh2X3pFzSek30zbJ8Ugq9u+8valytG86OO4Vbx3sUQRPBA491ZdgXcjcJ7Bmi
	 GEW31/+w7OC71rjSKOeMsvcT8Vpr50p9xQ9XyxGRHFOkv7F8umSXWPbwmI0AXXjJrF
	 aYNMEWXtCkwv1R+47Cxs+T/mjcGLt9Kp5EeHocbT2uzWtPwhNrl00Cqu7lKkr5gOLO
	 /Ghz4UbdRekfA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so20478441fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 06:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPmtohvhFaNxogUJiF2ygRmd92386phxECBRf4OaDNM+EsvP/iKivplXC3AU3xVVurTGt6GiV54nV/8UlVr0RN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw++J54WEBQJfUTa51J/SMR/5cUPE2K42+xodtIXlT9tjXLk55M
	ey9keVP+vZr2tQx3oI1tnxLzJVM/gc/mPdqzDt6s3tpO7pAiztUssHvri8E5R/nlvVndeOxu771
	4NBYqwKwHVxS8xpKTX0Cgr+X1VNJQeU08anCRZKldXQ==
X-Received: by 2002:a2e:a994:0:b0:39c:650c:454e with SMTP id
 38308e7fff4ca-39caa80368dmr38788201fa.13.1784121021501; Wed, 15 Jul 2026
 06:10:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 13:10:18 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 13:10:18 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:10:18 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdBC98zwc3jQwXgxMTEp_yBvjtU9cNQeRaTSsbZody3Zg@mail.gmail.com>
X-Gm-Features: AUfX_mwKvQxfwhOc8sChG6IUYiOddNnheWaj2Ma61SgPXzcEOXNcrLK8YSHAqsk
Message-ID: <CAMRc=MdBC98zwc3jQwXgxMTEp_yBvjtU9cNQeRaTSsbZody3Zg@mail.gmail.com>
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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

On Tue, 14 Jul 2026 19:16:35 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>
> Add a psci-reboot-mode driver, and define two types of PSCI resets,
> predefined-resets and vendor-specific resets. Predefined-resets are
> defined by psci driver and vendor-specific resets are defined by SoC
> vendors, under the psci:reboot-mode node of SoC device tree.
>
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
>
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

