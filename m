Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAECCF3D31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+pXAeMXzWroKCOYvz9KbDSldPuur+STmUT37F1ZplU=; b=yUqZPljVc0nS3rbhbNFDTeXvap
	2dlPHWURKf1N02PQwMTxui0hJgsY/Ui+S7kiB+b4WgKm6P7rgllRRNQVn8JDVk99Gk0GAC2JL6lr/
	yXY7cLt9fxewr1ty9SY/5bj1BptK/g5LHKoNqjBIQTQiAnRvLgWyWOfm77lKbLPhURDa0k1aLv68M
	2a5gAFCg+th4ZaJLKajZ9uRP6P4CpryDKEwcgkAt7e9WKPna/HED781KlkP4H5QbDK6sU4mB3DbTR
	qSTrBZNqHWURO2D5ljNBGhXAAyrMlMaggGAc79Rk7nPmzqBjjUAkaixsoXFmA6PnE/Uj3o1J+FZX3
	G555U/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAxf-000000029ff-2yFA;
	Thu, 05 Mar 2026 15:50:03 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAxc-000000029eW-1jy1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:50:02 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5069df1de6fso69223521cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 07:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772725799; cv=none;
        d=google.com; s=arc-20240605;
        b=GXQUtTt4CC6l8Jrvz5rao/YzrB2KBjHzUwaL7bnzu2JtiBZJce3acO8x+nmJ7f7UEg
         oHJED1gZB4/8NUQDP+76Q1P2UBa3FSkRl0CXmHVwkWI9/fWgvV+pg+0HHr1xLUodNTjS
         pBtf4QMQ0PayIHbQiq05y6aII6D539d0lTTMt188a7Usq0jd2jkEK0WAhfBKW19yF48t
         Yt53ettNo94Cn5BePNnlTfC6s6dAM0oTvTFPrNqwt19svR9clLzR5E4jUEUNQGoZd+z9
         0notwOTJrWumsva2KOKSmQ58VbcGJU53vEbCN1CJo3hfQaWVCieXBS7m+Fq9QCuYwiKI
         7NXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+pXAeMXzWroKCOYvz9KbDSldPuur+STmUT37F1ZplU=;
        fh=iS+jKiPytF0hOvznV9ffkhShosrSH5VU3IaqcXZRPsc=;
        b=KkSXMPcKa7xKincAFIA3v0P3b87G4cB0vI8lqr0OTidXFRpna/jVLTG6IEpnfAaMtY
         GW31bUb9euvgy/4bomCFw+eNd3Z2hj8MFZ4WttxpvTVqdYCVFDcSoJ5j3vfLQhvflxfP
         bxAMCE6jFYsJnvzVaGvT3ysNmcKOTLswvyVIIvd7QNakV+2L+REx+c0qHsyARNoxvHHQ
         x0m2QZSi+ZDijGVE6s21i9qmZH9aqYQtmNAQyOre9jGXm30LLcytiGHBG9qSnenQ5AwV
         FRxBsJdVTBu+iL6nih9QKo3JUjWuB2vqbMExs96KUVYZ0hoAQ2H4gY2tpu3iBYfb4sZt
         FxSA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772725799; x=1773330599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+pXAeMXzWroKCOYvz9KbDSldPuur+STmUT37F1ZplU=;
        b=H1EKObGqU8Ac8iL6HtM1mWLw2YawKR2xpwcJ9XCB0Wjv285Rj1tZKrNWPF2pvmF6Cg
         YE6O09eciRAzeR4gusRSKmVPquCfhlmTmrbDfLHJulbNtrkccdqSOZjxJWZA0K5lKlYz
         gDcEvz4Q+HW8UM9N/+RUDAE3+UsO7UO4Fazdq8NO0aBCZ3tmghA6LD4dOmIWny+5O1C7
         ptmGZOaB3wR+zahfe+WyqWN5MIjjUc29ghe6cd75JmoLSwMLilqc5JvOWs9FDEn/MCLT
         qxj5Q67DoKHr7goiky8EKs/7IEZkq7uObmHCxp7bN7TlSjYXSFl/bHyNk0lIBkJi4f9s
         VWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772725799; x=1773330599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+pXAeMXzWroKCOYvz9KbDSldPuur+STmUT37F1ZplU=;
        b=HCYt9Lgj0kQV4KsfLlZA3fKYK2VjKSBfbTeULHa8H1iXzHS6TjnYMLD+xWAxJCIniI
         hLPrO7mbJ5NmV2jX7hcPNWR+cy7Hp9Ja68WIkbutmsCn0DHHJnT4oUnnKyVT8abWe/5X
         Ym1jCpvnZmiuYDRLvjxkkxWAQqTVztodm8M0L+cgrOPJphCS3yPVnlSE2iwy7DsalvPz
         UxHWTiczVf9FaLg9D16c/Qiw6rX1EY+wXkY2meGsCL7BpJqgsl/mi7HXXRRoAsclFzFj
         obUQ6o4ELdJbKpUEK+Ys+j5E/6LNh5oD02o9xBcfLSRKsUvhX7SyemnVlPebTxOG8dqI
         d3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFq9cMvJ66KJ+OPdUb0jl1wwNcIehVqyovApPRKRqv8BTVIVxkxhQ5X/rw/N2KZRKXfbJPthxjA3LuKndxuqRq@lists.infradead.org
X-Gm-Message-State: AOJu0YxA4uzDYwrzAhEJYOITLdQrYYhKmGd7p8ha7jWkB+uLRFATnmF0
	NgV4VZiWAUSm44FcfRgF3tpqeySNcjHhSFkUSa77ZXZFBbAtxZHL1K/DDOibSRn2LuUzSw2OLHr
	1lZWqVrPHF5pwlcflnMwje3Hdwa9OMgs=
X-Gm-Gg: ATEYQzxXEVN5/v+gk/Ua98kD39g+3GTqA+axEQ9qNSzG5tcCzGf/rbM8OtlvuqVuUnI
	6EHwAhyOiWKNIucWFxFqre0m5ZaqufrtNRZGANrEe0DNyTX933mAOQyMJ6E+72MmdGG0tlCs6+A
	V/gyso2+IR7u0cjoj8bgaeieTmDNjHytkwTIZ9qNHcanw7yKedZRxetWuO99ot+SXjrJPZSeElc
	P3aIVfvY9RKW9hcFWkorw/JjKOdXdbOVBBJEuiV8ATdfwxY+KFhUCmJVMwOvHerNS/FqoNCYCkh
	W2lTJYtZlajrBiDoJvqmqZX7yA==
X-Received: by 2002:a05:622a:1484:b0:4ee:2510:198a with SMTP id
 d75a77b69052e-508db38c1a8mr76337861cf.39.1772725798828; Thu, 05 Mar 2026
 07:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-3-akkun11.open@gmail.com> <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
In-Reply-To: <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 6 Mar 2026 00:49:47 +0900
X-Gm-Features: AaiRm521wTMvM9tiwSeKP0vcH6dUDJ_V9_ra6wgn6PHQaKXTEdU0XLC1ALsdj4A
Message-ID: <CAKr_iV5cmE-GBp679Q-=bZi+186BvMvD41ctxnxNC3mTKEzuRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_075000_463471_EA0E0020 
X-CRM114-Status: GOOD (  24.78  )
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

Hi Angelo, thanks for the feedback.

On Thu, Mar 5, 2026 at 6:46=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Okay, but this is just a simple framebuffer and a UART; while it may be i=
n some
> way useful, there's already one device based on MT6589 that was upstreame=
d with
> just a framebuffer and a serial port, but then didn't receive any more su=
pport.
>
> Could you please extend your efforts a little and push at least some supp=
ort for
> clock controllers and power domains for the MT6589 SoC to make it at leas=
t barely
> useful?

Your point is valid. I saw similar minimal Device Trees in
"arch/arm/boot/dts/mediatek/" . Currently, I am actively working on
MT6589 kernel mainlining and Lenovo YOGA Tablet support, so I submitted
this patch as initial support for this device.

I will send patches to add the following features in the near future
(preferably within this month):

- Clock
I wrote drivers and they seem to be working.
However, some parent clocks are unknown.

- Pinctrl
I refactored it to common-v2, paris and it's working.
A little more work is needed to add support for R0, TDSEL, RDSEL, and
device tree binding.

- PWRAP and MT6320 PMIC RTC
PWRAP is working fine. This seems to be almost the same as MT8135.
MT6320 PMIC has confirmed RTC operation, but it will take a little more
time as I haven't written the regulator driver yet.

Additional time is required to add the following features:

- Power Domains (scpsys)
I've written a driver, but I haven't checked that it works yet.
And, some features are missing for full support.

- eMMC/SD (MSDC)
Likely compatible with "mtk-sd.c". I have written in Device Tree, but
it is not working on the device. It needs debug mode.

- USB
Almost certainly compatible with "mediatek,mtk-musb" and
"mediatek,generic-tphy-v1". The device is not recognized by the PC,
and there are logs saying "couldn't find an available UDC".
It may take more time.

- UART DMA
Boots without any errors, but I can't confirm its operation because
I haven't soldered UART.

- I2C
I don't know the details, but the clock is supplied from the PMIC,
but PMIC clock driver does not exist. Fortunately, MediaTek engineers
implemented MT6589 compatibility in the I2C driver (but it is not added
in the MT6589 Device Tree).

- I2C devices (only in mainline)
Touchscreen: syna,rmi4-i2c
Accelerometer: bosch,bma255
Magnetometer: bosch,bmm150
Fuel Gauge: ti,bq27541
Battery Charger: ti,bq24196

- SPI
Like I2C, there is a driver (it seems that the PMIC clock is not
required for SPI), but  I don't know what devices are connected.

I am committed to making MT6589 and the Lenovo YOGA Tablet fully
functional in the mainline kernel. I will send these additional patches
as soon as they are ready for review.

Best regards,
Akari

