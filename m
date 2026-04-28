Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2372AFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzeTCn090BT+IXJd5Slkei7HBefLVXYutmmcU3lypxk=; b=GodwMWNO9fIzQ0VH/saT7wqh2+
	bfWufgnbBICmHYC9gO3ab6dGwghn32tWZV3woB7s3GKSRZXmVfb2o5nWDYQf0DYvmen6hkTdAWEWn
	Qp3nLX32ecXbyBOEmoh5l6/Jua6T6c33KisKeSYuklGzgtQidANoiVtX+nfoANbLswFlhv0qaZVno
	laMDPtM369wYuI3dT9FnrRv2Pj9axFG7e0ayI6Ey/iPLgV+TmkYthYrKuYep8S550f6hRlLWENmY7
	P/wThc4lqp9xo/Ak8x+TABLJQv65Vl7iy6A+aEl3UhKWBmJTSblu4MBbruh0AT9tMe9EvbABOm+dC
	I0gb8flQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQS-00000000qJA-2xNp;
	Tue, 28 Apr 2026 08:04:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQK-00000000qEA-2wR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B4096014C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4220C2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363443;
	bh=IoirFoe03mX/ctRgHP5OpPVgaiIaPeHRPHwGzkpjrfs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YfFCV9k+BZYhWnN0htmAA7TEblQEBIOZMmkKLT9ppkoHP+EPaAHnRPo/usK+MnIDz
	 lKQ5X+bLGt5Ktn7rSdCg9HYrEBnuxq+38G00QcQZQqPSAfg3R1l7duUFV19f3S5WLU
	 6X1Lqe01mhvmvMgdK/uHRP3K1iP4rIMIvW8lc+3V1vWSqIDgluBehZ54fKgIjqDRAC
	 +gM4bSE+MTT5LXzGQ8F0TdNcfeatwIRde4vcgwPt9PRKC7OEAq00WFqvVdXEQxzgft
	 eplmJI8bhZRIDW3WHqfXy/KcHZvMnwvH9nzaiOiGfXC/xYDpwOSOPp19xPAOLOPCzC
	 hpPaYYQhQwxeA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so11565687e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:04:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+JAe9IORMaXKmJOLSbnkfNvVGppMd80nlxVqSksmoh1HZKXO9Ze3M5C07t0yvXYwUMy4zrEpwEOzg1oU8C0Zh1@lists.infradead.org
X-Gm-Message-State: AOJu0YzfT/caVmXcBTT2xmxKAEILs+iUOPqgM8G7TLvLqScOTtEhbQHe
	/VPaHFLtJEYQYGgVNLiH5IsJao/VBJeNmxnglLe/pcCXKYuTERevdLQFFiecDJRm9bw7JXHPuTr
	vXbN2sVbXD76V7YUIGEKFA6EVAAHd1liqigKn0s8HFA==
X-Received: by 2002:a05:6512:3b11:b0:5a2:b903:3b43 with SMTP id
 2adb3069b0e04-5a74660485amr881966e87.7.1777363442347; Tue, 28 Apr 2026
 01:04:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-11-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-11-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:04:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc0mjrzLv9qi87nr4TAW_LYn_Ndut=H8WfJPZeSZd6+TA@mail.gmail.com>
X-Gm-Features: AVHnY4LZVg57jPaWekGSSk4DejeTI2gwQWeR0zCi-FpgzjFW0MFsND6PRyA_w6Y
Message-ID: <CAMRc=Mc0mjrzLv9qi87nr4TAW_LYn_Ndut=H8WfJPZeSZd6+TA@mail.gmail.com>
Subject: Re: [PATCH v21 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
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

On Mon, 27 Apr 2026 19:34:51 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
>
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>
> Support for these modes is firmware dependent.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

