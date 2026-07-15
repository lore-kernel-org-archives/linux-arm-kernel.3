Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E285AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufSU06HSFFf/HF9xxtT6zNddSL0W/3RadTy6uo0f3pw=; b=Ih2lEqNrW90tS7bXgx08hqSLzY
	71p9R7jdspeaVTaOLt7AiSyC6+6s2Mt0Zhj/TvmvBRWFStBcD4GPgXwUwQbKWegMiZdY14WbowOrA
	BVVOB8ultVzGXdADjvxgNBHnSu9APC7wmq8FBE1Z9wQ2PN3DP7gsM0t14IND+vcQB2sD5kf+5idmZ
	QY1cDoIpwFtA1o3LqEfyQD9ZX7+S5fcuvAgptDdGWc4Tcb9Gx7r9pexE92d/WT4VoEunPzE3wVWLR
	rJwaZxvjYCWtR6S2k6rpApo2ZIVX0WJvLfQHfmUztNGxDvQniqBwvBU7+MkM1MCNPP//NbcqFlIjy
	jEdail+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyhM-0000000EmIL-4A2R;
	Wed, 15 Jul 2026 12:26:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyhL-0000000EmI5-2Snm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:26:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D8196137C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCB61F0155A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118406;
	bh=ufSU06HSFFf/HF9xxtT6zNddSL0W/3RadTy6uo0f3pw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QKykeVV+vjB0vBKkxzt1G8Vl5kKWhAKrI3T18ni2Hmw7Ye9vGMPmHsQOOafa6Rkz8
	 Ms0JYatvX30UIvmhmwHhmdX9yRaau4XM7UMuftPm2YrvDgVpRTT9y0EvcfS+iJMopa
	 wn5EvKEKra8RnO1k8aY6zl3W8kTP7P1IlnB4/LKGhKGxEg2xEMFyvVePT3Jcft61ug
	 gLoOZQLE17mfUgB/wOuZnmcyg2/bXhPTd+ObHBKZgp4ncS4UOBn+dwfyO9BIdDE/Ik
	 iVS87KexyX8aSDr2Cs39sUkAux0k+DNAdUQG8yS15R4tPMKJ4Ufu/ntoSvaqilpRBT
	 Qrj1mAGszI78g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39d560a1dd4so4006801fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:26:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoFX08XSzWmeiAYE7u2TB6qJLb/ADNL62mKIFZ+YIhVf0JmIdrzxQMii9NWpvql1EkqVnBXnqICoyHPii2vCDk7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0vscxNEfreGMXrlJQnHg8vwN9Yh/uzeZS7uEXBslXkPuix4pt
	+q6i2qTRVzO8iMdkURXB2VdzX19LU4lGwYK+ImqaBXmhZgGl0Wajhx74XLP8l2I/iFiXazBfObO
	VF+Q8gDINkHoZSUL4xcsbEl2F+A8skDeo4lHsuHHgmw==
X-Received: by 2002:a05:651c:23db:20b0:39c:6e2c:23c3 with SMTP id
 38308e7fff4ca-39db6ba5ea7mr4965071fa.5.1784118404814; Wed, 15 Jul 2026
 05:26:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:26:43 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:26:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 05:26:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
X-Gm-Features: AUfX_mylt-DYfwtCtULeZMicFYpxh50vEHg7XonNMSy71MZwRMycF3EtBgUVrSQ
Message-ID: <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
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

On Tue, 14 Jul 2026 19:16:30 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
>
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>  drivers/power/reset/qcom-pon.c           |  8 ++++---
>  drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>  drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>  include/linux/reboot-mode.h              |  4 +++-

Could we avoid having to modify multiple files here by just providing a new
function:

    nvmem_reboot_mode_write_full()

with the prototype you proposed and making the existing
nvmem_reboot_mode_write() a thin wrapper around it?

Bart

