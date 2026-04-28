Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94560FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1veT2HGaXuBwD66i7axJCttbE3RG9xTwuDAxhLvr94Y=; b=CNReTOBdt+FQl0jp3KmKnkGbbO
	I7NKpMF9hzsyK8Vvi5FfwH18+0hw1TUGPlHDJYgC5KQ8R6i7GSe3i6S0AeYFQLR/GBVY4l9WVXt4n
	ex3VVfdHwHepPBjwELfMU07FTieXGFL8/YOG8M7y58bOPJIEviFZIHL7pWOlvvbg+6X3BNAEd5Hv1
	3UwBdF6wNHYiDkxqupMNj3o7dl0ONgE17k9zb32L+7DOb/vzPSR5iRtyaLDGrhEtyzrChY8XJmmla
	oj5hU1HH6HDS5A80L8Soa/L+WXOwKNugvEKGLiDiZOqlT8GlV27rxVZcnLd2nmWkZwLvkbScX05/t
	M+nlWyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQ5-00000000q6i-0MPX;
	Tue, 28 Apr 2026 08:03:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQ3-00000000q5V-2Fis
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:03:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFF1B60154
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E11C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363426;
	bh=nVhY0saX0hIlsPhBZOfgsMBCUpdbk4+El+viqARp73s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=TNsj5G6yZNY+l0aXqUiQ4SpAcgeMKg7eakKdZd9BNO8FOWFT5SBnVRpH45GIlyFQI
	 sfu0PJqgZeterYZM/6QPpY5oDbOUsAZhyJvRr6fzhUaGPRr4Ym82QOPD2bqjsPIz/G
	 K0ct9hqiAhWCG8jZr18L4W8i7q1UOF4WfRdJANgZC82x3HMb5l5oyW5PG3hEnSZJWa
	 wGp68Ahrh8SUjDPzYpvXIioXUha6ciDq4gStvwlZzR1UKgU5lZSQsVUjQCnzHJRXMq
	 V/DAQs0ayEjtZyR4i4espP3KgoPS0nHgknrqnTK+G/WsGwHtEjh1OHTjfNX79N3cdI
	 oR1Yxn4pif/mg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a62a049c1fso8430830e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+GPT+1y78bmtZRAl0BNuNkXAW3y7nE5Ttv909jA+XpksxzrPn6EArsg77KJPGNcc6FGMbbl3YgaBjzRFYboKlI@lists.infradead.org
X-Gm-Message-State: AOJu0YxEeCyJf+rcrVl/PUyES6IZecHjXHIrzelsaOYX2SqkBE+UAy+M
	b70f56C75XP7w/GZEkZPfBP/XsjT2Dgoj1cd6Bw+F69C8wQA7juxtvQ1kHF+n2H2gPqtXgGZmzE
	5hhOr1q+anhgt4Ze2HQV/8Nn75nFeBnKT32deWxUxuw==
X-Received: by 2002:a05:6512:1194:b0:5a1:4158:ea9b with SMTP id
 2adb3069b0e04-5a7466182b4mr698217e87.22.1777363425259; Tue, 28 Apr 2026
 01:03:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:43 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-10-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:03:43 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdC0dFadu-gyHLa2zM6fKWhBeXYpKxhcz0n+TwaEQ9XBw@mail.gmail.com>
X-Gm-Features: AVHnY4L0_XpeAfopxwETVjDoOWklya0cgmAaZoipsKTFpenV3YwDa9FcdgYB49Q
Message-ID: <CAMRc=MdC0dFadu-gyHLa2zM6fKWhBeXYpKxhcz0n+TwaEQ9XBw@mail.gmail.com>
Subject: Re: [PATCH v21 10/13] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
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

On Mon, 27 Apr 2026 19:34:50 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

