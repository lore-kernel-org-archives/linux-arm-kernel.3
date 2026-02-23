Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884EFEF5862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 04:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoD6tE+yirYO2wDnJyh3VhePC5QLfqyFQbq0eMsMM6o=; b=rrBk7WvLRHl2F0VN0Whz6u5A3h
	Qrecms5k3UvpDduVhxXlsOU7u+Qf/I5E9PoS3/rj7qnRSACUNGqOL0KT3astEITYgjEJ32p6O0Jnz
	DuNbJcN/1v0kstFS7LLWLT27cmN6f0/XmAH3JXvLoyMbpvJ+VKumNPsSbscWfME5WDfCmC/qcl5jZ
	RCT21tNgDLlwjSwtoyr93XqCx0IPlBIhI6OFfjmozOUh3yGPa9pz2eWOW5lARlfg6FJDvSYVDA+aV
	K7v1JpCXn2pOgmf2g3+klwWJbkO0kP/0jI850LUs5wu5zinUuq/p6w0jgA1WIPPKR5GpYhWu/pmWq
	Fo6N8GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuO19-0000000HEWB-0Z5u;
	Mon, 23 Feb 2026 04:57:59 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuO16-0000000HEVm-2NE3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 04:57:57 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1275910b930so2843536c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 20:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771822675; x=1772427475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoD6tE+yirYO2wDnJyh3VhePC5QLfqyFQbq0eMsMM6o=;
        b=PLWmH0kFgTufGOAXPf9HbCIdZ26C/9sxOfJkFz1V5WMOxE4l2mnVO/ciESBXK3mYEv
         6PJrP53BcnVefHn1Kidp9riPmF9qfaeF1gwNa1UujZd8L612qrPSxpZch3YNetBsG6g8
         AZXPStFVAONL5m9yHvkv9F0QhZGEapuOSzessZBqyNnBKwcss1bubrGOFkTqbYTuatfv
         OzYk2/SzLiK7rXlXzV20X+9Anxo9WCtEDMcs1nuaRk+aEyXVj3hRVN8blmoxEAY5+RT9
         Kg6teJTRjfwi32Bl3Maxz1HlcmyvLCczNZVxcf8eqj3y/VdvOKUlmjOqryKkQdprA+lo
         h29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771822675; x=1772427475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoD6tE+yirYO2wDnJyh3VhePC5QLfqyFQbq0eMsMM6o=;
        b=mrCNicqzC462qB8y1Vk5okJUBvrbizHIbmgZRQOkdMdstHTGMKqpPY44Rm/PGc3PCj
         cH8j20I8uwOv70zoGqW3TAd8PM9DlCzyi/WfQZIpIVMWxEPpDOLhTwy/ZBX4xBddLxoG
         zWi54P3L0Ar/o9JilEpefDsy0O01hl9HDpXxxLiL3gQwxCEUvZ/5laDdsRcLUIQ4a1It
         JTziJreAWCtMehIv9UOWISd8T3yOTRtzzqc0ZxiMH4sI7KJhaYPg0b4yLQ3XEjjti8W/
         RqZGiqlcTamHlF5ilyindWwTTu0fh5U7nu+BTP/+XFfR8dWpu5evT6IgJ7ca0D05VC8i
         hrnA==
X-Forwarded-Encrypted: i=1; AJvYcCV2+qK7THYYG5ikUWORprGFKqixcULQpU1PwONGwmmzq+V3RslPbgKjj2Fp0dVGf9fcma7KBNYAyKUDI2ciWyRp@lists.infradead.org
X-Gm-Message-State: AOJu0YygI/U73lulVGsk8TYb0Eg0ozrvbsZ6HIyrf9I/vAo31rIEbIW9
	FVyUtQBy9CptgP+F2bM6yd/aVDGFzngVKbKkDsQvsCpxmac/xaeoxzwY
X-Gm-Gg: AZuq6aKWy9Gx+cIium8sg0ehk4XyN/FCMX/Fr6MSX9u3eO5qOFhrsdjiY1T7l8ZEt5U
	fjhdM0yRTxPRbaLNNMhL0jxNsdWil+18jD+QGVXgtk/Dw/q8rQLdmnDCj1eyzB0r8hUbhLSZvm/
	sorGTkf8+vO5uDMgEw9gO540rlP7hBWbE/NeK5W4cjblK3iFjxV0OknB5kQ8pAn63S31Djx3p3n
	EYmI9shTTsBEnzhC6aHjH8nGcAiFxaplip0SwJPR+SN+8YafMtaJf1IYhZDhNMr0gt1gumgWQB6
	lTU+QnNlyZzv0nSDrDkYqvXvTcCOdUFuVcm970FYA78DenNdH7davkDJ1ZoMh5QStMEPFUHUWaq
	J8SUIEzgdrs0jmnzANISdCiDqpR0IwP2Maf4PjCl8t1WFsn3eaossIRTWV5c14A32HeGQ5uqQVn
	55+d35PzSXhwbI8R5kqgvwu3VYYHxAJSIwLh2p906JsGqzZUuO6D4qKxV4+rM0j68=
X-Received: by 2002:a05:7022:48c:b0:11b:f271:835a with SMTP id a92af1059eb24-1275fa41703mr6770004c88.3.1771822675098;
        Sun, 22 Feb 2026 20:57:55 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af2ea06sm8045507c88.7.2026.02.22.20.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 20:57:54 -0800 (PST)
Date: Sun, 22 Feb 2026 20:57:51 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <aZvdDIYlCjg8sVGT@google.com>
References: <aY_BpRQmLdqOOW2K@google.com>
 <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
 <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_205756_724651_700DAE02 
X-CRM114-Status: GOOD (  28.91  )
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

Hi Marc,

On Sat, Feb 21, 2026 at 03:24:35PM +0100, Marc Dietrich wrote:
> Hi Dmitry,
> 
> On Sat, 14 Feb 2026, Marc Dietrich wrote:
> 
> > Hi Dmitry,
> > 
> > On Fri, 13 Feb 2026, Dmitry Torokhov wrote:
> > 
> > > As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
> > > device can be instantiated via device tree.
> > > 
> > > Add the declaration there and drop board-paz00.c file and relevant
> > > Makefile fragments.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > 
> > > This is not tested on real hardware, compile tested only...
> > > 
> > > arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
> > > arch/arm/mach-tegra/Makefile               |  2 -
> > > arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
> > > arch/arm/mach-tegra/board.h                |  2 -
> > > arch/arm/mach-tegra/tegra.c                |  4 --
> > > 5 files changed, 8 insertions(+), 64 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > index 1408e1e00759..d1093ad569e6 100644
> > > --- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > +++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> > > @@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
> > > 		enable-active-high;
> > > 	};
> > > 
> > > +	rfkill {
> > > +		compatible = "rfkill-gpio";
> > > +		label = "wifi_rfkill";
> > > +		radio-type = "wlan";
> > > +		reset-gpios = <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
> > 
> > I guess this can be removed, as it should trigger the LED, which is
> > already included elsewhere ....
> > 
> > > +		shutdown-gpios = <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
> > > +	};
> > > +
> > > 	sound {
> > > 		compatible = "nvidia,tegra-audio-alc5632-paz00",
> > > 			"nvidia,tegra-audio-alc5632";
> > 
> > I'll give it a try and report back.
> 
> rfkill (and LED) works as expected. With the reset-gpio line mentioned above
> removed, you can add my Tested-By.

Thank you Marc.

I am still a bit confused about the reset gpio. As far as I understand
looking through old commits reset gpio (PD1) is distinct from the LED
gpio (PD0) that is currently being controlled by "gpio-leds".

I guess the rfkill driver needs at least one of "reset" or "shutdown"
gpios, and that is why it continues to work with only shutdown, but I am
trying to understand if PD1 was never connected to the WiFi chip reset
line and instead is used for something else, or if it is indeed a reset
line...

Was the patch not working with reset-gpios present? I am trying to
gather data to craft a proper commit message.

Thanks.

-- 
Dmitry

