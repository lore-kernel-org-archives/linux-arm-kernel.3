Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86555C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 15:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PssKll4JEoMlKe6UK2jH07Ppq8XsuPzXadX333xk3Wo=; b=zgzkW/49gte7uhH8IV7VvJZK++
	BfO0rDE1X/h5K1Eun54Eov3kDY4JkNB/kcsjxtARM4Rh8TpC03MmwOo3inaYOU/OhQZl7vybGRcFD
	JA1zkpyhy2G7tU87wBtuowVO/2zfqnBzNZEfGEA27lohUWeg2GfKaxD1yPrT/yTQqf8UGvUrkAyu1
	nvK6si/mSI2b3tvoEFqbBoXW7df9a8IquLJVLlkstpCIzv0lpAuno9dN6mineCV9mlNplY+ewUPCw
	RmKv5qH5VFocObK+mdhUMNZnQwqri3uwdApVaxXLZWW8FCGRjU1XamDU/oXHV3ZzR/TdJXhVZMQWY
	eGliCP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th9aT-0000000F7jt-2vgv;
	Sun, 09 Feb 2025 15:51:13 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th9Z5-0000000F7Zf-36oR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 15:49:48 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2b863fdc25aso271250fac.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Feb 2025 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739116187; x=1739720987; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PssKll4JEoMlKe6UK2jH07Ppq8XsuPzXadX333xk3Wo=;
        b=GUJKH7iHMNc2nH7SPoAA0mVD62wxFu2E1vkDEtbPp6N5YGuzhW4P0NVkdFXFeMBAXR
         rP7DTHf1kCNpYYMep7FzEs+UdM+WykxIdjdvjLt5wKNGr3tApOy5P07EjuGZCFbIunRZ
         wqcJ3TyjHsce/jamAJ+cE1jZKLsrBHaVgMI/CKluca9YluoPv75gsRYUq0ZbgOtlj1CF
         8YRZtXCGFawrQ0R2DOuJLCZOXt7dcB0OFeJngO5Xu6ii7dCWAmvUuXwUYx4mx26SyKGM
         ipL9rpYzVyUVbrZt11fj9tJ5DuyeEEuq2n1hklCJOhioSpk85uMqazYin1tShXSJ5sFg
         SVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739116187; x=1739720987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PssKll4JEoMlKe6UK2jH07Ppq8XsuPzXadX333xk3Wo=;
        b=eVI6ydlA4kqXBv+zhIHfCcyZFdlNtoZoP5Hxzbc8yfDHAKWQC+/o4TzRSisCnUyCAZ
         GK9naaEnfOJJPpA+6rdtUY6y+M2AUdRl6BjCtpMgg96EfjDyfMLKT0kbvvmhz1rLlZ+T
         E8RsDWrneOwUyWIoAKL/mnRER5DpPlBt81IWQ9H+DsaAjaa4pgcwLM80xShcZr4p0jAg
         GmIYq6T0p4cRBLBkS0+CA+pJCLFhza+5svqwPKjaj6JjK6NvJYdwQIwA6vWUmyrcH7E8
         KI+6IRk//ItK/5P5rRN5CkSXKrl1CSlDJWwSb0XQk7ADhm1WKoY58sz5Z8WDGRo06Aja
         bnrA==
X-Forwarded-Encrypted: i=1; AJvYcCW4IzouAffnBg6fpa+2KEQt6HsLCRlZifs+IAkXGOk7mNyQM3mZYMUNO0bEkx3GUReqRIbhU542bJEjSA9/X5jz@lists.infradead.org
X-Gm-Message-State: AOJu0YxicDbptcfCC/LJAGbZFzd3ll6EKwIMwkTYE7TrVrgyXt/qvlsD
	ptisRKp+/1/jrpKBZR1wpr6BfU8CozIl/2WwTXhwufg48s32r+Bsrun3kVjVocA/4hrxtD9C/kd
	pvZ2+/AwbnR8kX+2t7iEC0jnyXnBIJ/awoBjTulp28WbYcgdSex4=
X-Gm-Gg: ASbGncsN2O/WRVtT+t6j3K/eKLVPPGo35fU9G3qGEQaz6niaFCCRVmJoSTnFNJbAS3E
	jojOk3N1inaBf6Wz74LR1TLim+xG3NL7S9IkCfbR5brbhdcVuX/1L53oSyGafjILRJPEp+RKc
X-Google-Smtp-Source: AGHT+IEJx4GAJCZ1ff4k2hzF9hSjRKWNrgbRsTFnQrR3DUT9d8D8jCv4lfl/PeBdwYbUEL9kQpD9Eg5C5R06EpPRzxc=
X-Received: by 2002:a05:6870:c0b:b0:29e:3132:5897 with SMTP id
 586e51a60fabf-2b83eba9bf7mr6061588fac.5.1739116186662; Sun, 09 Feb 2025
 07:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org> <20250206-gs101-renppt-dts-v1-3-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-3-cdfe993fb3c5@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 9 Feb 2025 15:49:35 +0000
X-Gm-Features: AWEUYZlsv4LiCm_NFbOvnGh5QJf88D0c8PjjEovMiCg0gV1Nlhp4jo0ANNrcy54
Message-ID: <CADrjBPrO4o0X45roprKvRsdQ3wRKvRMsk_Ry8z9j6FmzPatG=A@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_074947_784645_19309353 
X-CRM114-Status: GOOD (  19.51  )
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

On Thu, 6 Feb 2025 at 13:08, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> syscon-reboot-mode can be used to indicate the reboot mode for the
> bootloader.
>
> While not sufficient for all boot modes, the boot loader does use
> SYSIP_DAT0 (PMU + 0x0810) to determine some of the actions it should
> take. This change helps it deciding what to do in those cases.
>
> For complete support, we'll also have to write the boot mode to an
> NVMEM storage location, but we have no upstream driver for that yet.
> Nevertheless, this patch is a step towards full support for the boot
> mode.
>
> Note1: Android also uses 'shutdown,thermal' and
> shutdown,thermal,battery', but that can not be described in DT as ','
> is used to denote vendor prefixes. I've left them out from here for
> that reason.
>
> Note2: downstream / bootloader recognizes one more mode: 'dm-verity
> device corrupted' with value 0x50, but we can not describe that in DT
> using a property name due to the space, so it's been left out from here
> as well. This string appears to come from drivers/md/dm-verity-target.c
> and should probably be changed there in a follow-up patch, so that it
> can be used in reboot-mode nodes like this one here.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

