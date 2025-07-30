Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFD6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 09:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amCpS6Biku5UkvGCeY8Q3zKrvNs8l+NdNFt807Gj1q8=; b=ghzFfBCklE+Ja4lwn9WDQUF56f
	/UOaMaNqDwp4c2J88tnrVhDVIxb+A+ewk6afNgBM1D/D0O9mbVPZvaR64jJiwzNhe0IdkeNyPrvaN
	U6JL6wLmp2GFk7OG7r/QMCgR24/Z9hYI3/y14inMudg5vHwePKl+aoblCIysc9Cdks8KPJDLet1k2
	DIh9+cA5pAF55ZgFfaRoYVZUoY9I061glthsm2V7YD/49u6WZX4VCbFoQ/PWDffOgOg/njZH76cO3
	001bRcMPg9bWOJRP/AACgEHAp9nKAymFpakx4oG+Rieg8zCEWZOVyFV6xSaklrH05ENn+NjViyHla
	N2rT/Yug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2oO-000000014PE-3MMU;
	Wed, 30 Jul 2025 09:09:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2ll-000000014AW-017S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:06:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4561ca74829so66614745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 02:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753866399; x=1754471199; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=amCpS6Biku5UkvGCeY8Q3zKrvNs8l+NdNFt807Gj1q8=;
        b=osYK31pqats34KLOj4rNzJRSl9gpkjS35sA/KbDRnlZXcejw4OwHqAjfJHAZgi57T6
         FwcS05LMUJKpJG30UADoBAHoZH3vbBEsVMTj+RRCxepncrzKutmdNUZsD92o8gBOuwFF
         imOpG83gky9YkHjtaUKqoi3sz/5zvyU5lB9Wj9odSbiIl22p7Qlm6imzZpRBvF/jlhHK
         gOvp3zEIsCYUcG759XPzYRZhYrpzIAThuGzfDBkxHQsj1+m7H0OyMORwZIRRSF/qLRVb
         rz0wRrjYZASew6B/0t7YSDiaT/6UYRYLTGMmVWS+hyRt+PTQ+Sror/OiIi/kkJYemxmS
         jgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753866399; x=1754471199;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amCpS6Biku5UkvGCeY8Q3zKrvNs8l+NdNFt807Gj1q8=;
        b=cDrFJRZuT51DU1hVS08oJ1ToRTPkVSOibFrMte8vMxDwELe3+Q5M5MC545N+iA79uA
         MOzWM9wsPZdWCyjPgHWRi/zy69f+5d1tbVx8hYp2VBpUqRkyj5l33DLEbWBX3R6ncThp
         JHNrZJyCpbBIQRCy9NjuYBLfI2xTeoo3xGMoIvh1cQo3moUJYqLoNmqHncjCW5DyiLf4
         ZQ3QjBb7gY2ZiQhKLKAs+ECW14D1LBb+15j/KVatd+e60kwwpLjnXsbXlKoOAaJRsL30
         JBKgKd2i5rO9VPOX/a1kJji5UXOvHXkhSzlORt0cOvTDHeyBp7BK4x6+gOXydagUuhp6
         McYw==
X-Forwarded-Encrypted: i=1; AJvYcCUT/m01ZRErwcYnFFt9dfAhYougBwM8m9uIE5+8Khdj1iq6FAzil+W4oMFmCvPmkd5kARUq5DJcST4aDWkJVNbR@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZT+GeMingl/G2ujlzLrB0ljVZoWT8AwmYvgKE6saZFdmLWTV
	htU5acIAGma0xHQML35aYFEHNg7URXudCVZDqts1fBShDYu7REFjk46iZMDgxKaAEqE=
X-Gm-Gg: ASbGncseBeOg1WS9hBNtK5lRJ0N7f9Zjvb/9Pe9rDBiB+bnxoapeAe3a5o04gBT+4pb
	3e1hmIzrtSstTr4uXd811iMRnyfSjLACxRIMriR9/7A0EUOzPY9D39V4wvaZjpT1bI0fCeD/vAW
	rFSmgWP/L+8QWHewPz5+mrdMl1hmXQhxmwCKum+5MTPQNHrcKwuM5TvstMzyEHJiuitauJM/5dI
	U1asvlC7AfUgLF+lle9H2gDoSGqsyVOAmd8QkPGgsyZjHgt+CF7SmZnbKannos4UUxpwrLfob4e
	l6WSByXs26LGH02sq3Ygp0O6+m8XfMoT+OlL2KgHS/7jZGkOTQt7uL8wf/+Ur4Jkj9S+lnW3lky
	/2IqUDIWMxEEPg1xIWI8hEhoE7g==
X-Google-Smtp-Source: AGHT+IGu9BTjzxVnqGeLDV3BoeEs9yZzpZzfEcV+C4Pb53LxtnI2Wds8ED4FoqgjBE3qk36pQJS9SA==
X-Received: by 2002:a05:600c:6995:b0:456:2cd9:fc41 with SMTP id 5b1f17b1804b1-45892bc44a5mr21276705e9.20.1753866399264;
        Wed, 30 Jul 2025 02:06:39 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b7973a9422sm814667f8f.21.2025.07.30.02.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:06:38 -0700 (PDT)
Message-ID: <b1b34e31904f711e7cf82394843a9966238f2896.camel@linaro.org>
Subject: Re: [PATCH v13 04/10] Documentation: ABI: Add
 sysfs-class-reboot-mode-reboot_modes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Bartosz
 Golaszewski	 <bartosz.golaszewski@linaro.org>, Bjorn Andersson
 <andersson@kernel.org>,  Sebastian Reichel	 <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Sudeep Holla	 <sudeep.holla@arm.com>, Souvik Chakravarty
 <Souvik.Chakravarty@arm.com>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Yan	 <andy.yan@rock-chips.com>,
 Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio
 <konradybcio@kernel.org>, 	cros-qcom-dts-watchers@chromium.org, Vinod Koul
 <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Florian Fainelli	 <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha
	 <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Elliot Berman <quic_eberman@quicinc.com>, 
 Srinivas Kandagatla
	 <srini@kernel.org>
Date: Wed, 30 Jul 2025 10:06:37 +0100
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-4-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
	 <20250727-arm-psci-system_reset2-vendor-reboots-v13-4-6b8d23315898@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_020641_067071_1ACB6385 
X-CRM114-Status: GOOD (  23.12  )
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

On Sun, 2025-07-27 at 21:54 +0530, Shivendra Pratap wrote:
> Add ABI documentation for /sys/class/reboot-mode/*/reboot_modes,
> a read-only sysfs attribute exposing the list of supported
> reboot-mode arguments. This file is created by reboot-mode
> framework and provides a user-readable interface to query
> available reboot-mode arguments.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
> =C2=A0.../testing/sysfs-class-reboot-mode-reboot_modes=C2=A0=C2=A0 | 39 +=
+++++++++++++++++++++
> =C2=A01 file changed, 39 insertions(+)
>=20
> diff --git a/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_mod=
es b/Documentation/ABI/testing/sysfs-class-reboot-mode-
> reboot_modes
> new file mode 100644
> index 0000000000000000000000000000000000000000..7147a781e5d4d11977c3a156b=
f4308aa13310e39
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
> @@ -0,0 +1,39 @@
> +What:		/sys/class/reboot-mode/<driver>/reboot_modes
> +Date:		July 2025
> +KernelVersion:	6.16

The version should probably be updated.

> +Contact:	linux-pm@vger.kernel.org
> +		Description:
> +		This interface exposes the reboot-mode arguments
> +		registered with the reboot-mode framework. It is
> +		a read-only interface and provides a comma
> +		separated list of reboot-mode arguments supported
> +		on the current platform.
> +		Example:
> +		 recovery,fastboot,bootloader

I'd personally find space separated like e.g. in files below /sys/power
and many other similar files below /sys easier to read.

Cheers,
Andre'


> +
> +		The exact sysfs path may vary depending on the
> +		name of the driver that registers the arguments.
> +		Example:
> +		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
> +		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
> +		 /sys/class/reboot-mode/qcom-pon/reboot_modes
> +
> +		The supported arguments can be used by userspace
> +		to invoke device reset using the reboot() system
> +		call, with the "argument" as string to "*arg"
> +		parameter along with LINUX_REBOOT_CMD_RESTART2.
> +		Example:
> +		 reboot(LINUX_REBOOT_MAGIC1, LINUX_REBOOT_MAGIC2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX_REBOOT_CMD_RESTART2, =
"bootloader");
> +
> +		A driver can expose the supported arguments by
> +		registering them with the reboot-mode framework
> +		using the property names that follow the
> +		mode-<argument> format.
> +		Example:
> +		 mode-bootloader, mode-recovery.
> +
> +		This attribute is useful for scripts or initramfs
> +		logic that need to programmatically determine
> +		which reboot-mode arguments are valid before
> +		triggering a reboot.

