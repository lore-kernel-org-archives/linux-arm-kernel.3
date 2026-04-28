Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2295FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Cjuw4XvwNieU6Jv0siKDnnn4ahJa6G58SW7RGlPtuQ=; b=kXlt6EnfakWlCVmXSJ7HGNs562
	y9SbevOTczAumy8JwM/39Zjb/kE9tcr2JMcsx3gjGAzcG0eeqmFXg11vkNIVLTzBr8PgJ0spgfynt
	PPQi7bjNuDJCgTQl+4sJ1lycT1FfJo2ZOnPQCPpaGB2+tvUGXyCpL0tiKFzuJ5IRNqHqPCwVEJthj
	ByotsUyUmYK99R1a0DDokumd9A/NcNRx8pFucK0RBHtEHxvtPN1Z51BVXTwwWoTxKEtOG/to6N6lU
	P05qa3mCmswl7yvrSAki0c+dl9GhNHEP2Xtfxpq7HcxqGUTcexI2k/FRxfRQhJS8+vgE24mlAMylt
	L+BJmEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHd2E-00000000n39-1Tvz;
	Tue, 28 Apr 2026 07:39:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHd28-00000000n1B-0qH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BF1E44567
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF47C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361937;
	bh=M8+6UnX+4lN+I7hSH5w2HlitnXoe39zLUp85i19lW4k=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=exdndTXlRxThyJGPMZoGsrhIEXUARtyMvIjuf8op8WGky70Fh1CYQMazkjhVRT8Mh
	 wfx5U+58ChM4CAl1f/qOYKYgrHhAtnnMOvXqLIzDxW534t1c5vFoCjVwOmEwg2Wa8D
	 yW7geuXxgP/f9U2CiRDbXT+9WLp8ITQKYRubNXdx1DdRouyx7Xck4x1RCoU+Yc3R/a
	 EKukhLU4h9yNp4cu6QO68X4VOFvzQtojmKBsxMiE3LCL8owm6/PfgfAqg/lVN3VyTn
	 v6puGg+NRDEE/X4FaEAfmuLzBFLIvVLd/vEeni0dgKX8zPpsO1imHMsX+8no+Yj7XJ
	 1DhvG2hQOD+LA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so11540637e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:38:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5ot42392jGA+tQsw+6DPni4gvR2ZtaTpKdYP/LT3zjm78SnUPl0hor7v9oYcwfUTkrKdZALcVmOkY1KyBaGYJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywne+lY0EJbmTmlyFgBHrZoFnJnNDDJtJhbEhKRztOKkWp+u155
	8EMleRXtolUYoNH0qI1HiUjTlH7GlH7tbkZuxgtQT+hHY7Q5vG3wyHnBi7Xlw/s5rpE5BADm8RU
	RswuVN8Nyc961ikHaMG/cpBcLc6TZexlOf+QS9d8oMg==
X-Received: by 2002:a05:6512:3f12:b0:5a4:17a6:9780 with SMTP id
 2adb3069b0e04-5a74660a971mr759395e87.14.1777361936359; Tue, 28 Apr 2026
 00:38:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:38:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:38:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-2-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-2-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:38:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=MevqR=ST_-WO_CAUc7stKmQU=_Qp7BTrewzvg40x=JiLw@mail.gmail.com>
X-Gm-Features: AVHnY4IrhreEwlQ0Dtd2BuvGIlLYNK7-acJ0gJkWUG1j_5wLe4XWVKLYqD4Vmhg
Message-ID: <CAMRc=MevqR=ST_-WO_CAUc7stKmQU=_Qp7BTrewzvg40x=JiLw@mail.gmail.com>
Subject: Re: [PATCH v21 02/13] power: reset: reboot-mode: Add support for 64
 bit magic
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_003904_440452_5CECBAA5 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, 27 Apr 2026 19:34:42 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation =E2=80=93 reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
>
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate up-to two 32-bit arguments in below format.
> |    Higher 32 bit  |   Lower 32 bit    |
> |	 arg2	    | 	    arg1	|
>
> Update current reboot-mode drivers for 64-bit magic.
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

