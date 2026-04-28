Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA389FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MbIw2iKcbdKAtSRHrFFssExGu4AtJtlfPm5msvqox4=; b=bj6KbgFFK5+QEkdXA5uQ5V884w
	Yw9DSH3YXP7Zyt1A3h9XvJwnjmokXouYyomuJAoX7SCCxemF1GFVASD/ogmGbDgfBF1MCMxyVRM/N
	i5d7KlYRO4wcG2tBzrP4y0aasl2g4WG+iuh30UYqmqOK5fv44ilANb+UhxplYXGI+pgCnezzOe2pb
	Sf5nGw7lB0okgmCVKQPwOmZep3iHaW563zIOZimMpAfk7EJ9JD1rDwsRZ8ZdCAhADvPFdPE0SvZE4
	UnfTL/mRw2dyE7syRPjNRCkV4LMcKBjGmksI+Ls0uIpn47bNxBvxQJvoDNzKMzo0kRqrhcj+toK5B
	/we3SQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQX-00000000qMR-0YCb;
	Tue, 28 Apr 2026 08:04:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdQV-00000000qKV-1j8g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D264C60154
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8076EC2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363454;
	bh=OYGgXT+vnZc4JBe0yph53GNPgP8L7MHQXOQ7rAwaRV0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=CAg/hU5JJM2Spf/H8XS8WdFTmzGVaTQu3R8OEt7u+d9CpPF9Tj8WCTdUBU0Jqtp+3
	 T4NxUj10k+KwVkMt9oa98iPyUqTShHTnE/LETOAR5wjh/M3Lj9j9SQ38W5OSwLp01j
	 9N6+EnO9Wz7lMpiiVNSYuBQKxClmr+B+JtIOw4J7jBQ/4VyIgl/KJKA2yqsHClEEvX
	 nIXoYUOCV2S/ds7pklpqgnXryjo/leR3YoPHFR2+/kR+qgvhNL7m576ked88ng3snO
	 76fDHnw0IDU1Qsmj8C1lMmw4quJPOO4TQMru1aluuHXCiYJ1BqwL/7Y7j6uHRuaVgV
	 XYWN0dNcvfA0Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e9653b580so123346861fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:04:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8sOz66uc36aiiSmKOZgZnY4KPbNFZGaF+1fSZxjAuBkGC58MtycnyGlbzsikSKrAgmxoS+e305tlCOKLO80/3V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq1wTt7cUFsUe5ZgUpkJovEID/3BzB8+Eb32GbMlJUuD9XH0e2
	6GdnwNug610hByUFYRcdugQSTjQ2jbR2zFjctox9fwh9AjgzACrZ7u6Ae0p4lHKx1hJ9WnOu32G
	FzGhQTIlEFvAVCVZUom7xtqYLFcg/jb75DO6cnmcSIA==
X-Received: by 2002:a05:651c:210e:b0:38e:af87:8e0b with SMTP id
 38308e7fff4ca-39240f8104bmr6202431fa.18.1777363453160; Tue, 28 Apr 2026
 01:04:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-12-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:04:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MezXrF=M-_sY7uPvLUcn6QG+2H0A5ynQnTKGVW5i3EJug@mail.gmail.com>
X-Gm-Features: AVHnY4L8wKLqhi2w7KQIry4FUuHfj7PF_dv_cFjyoZKwyldMdXdmEga3BQlyXGQ
Message-ID: <CAMRc=MezXrF=M-_sY7uPvLUcn6QG+2H0A5ynQnTKGVW5i3EJug@mail.gmail.com>
Subject: Re: [PATCH v21 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
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

On Mon, 27 Apr 2026 19:34:52 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
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

