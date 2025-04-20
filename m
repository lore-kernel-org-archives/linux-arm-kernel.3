Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3F3C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94OI61Qmw868CLwlFK0a6ayGGnbK7PL1vRKgwcsJ6K8=; b=tL00T+oncfatsKKezX6mISJhD/
	LEn55u/t8GMSGv+oQnX0T0ZDWjLyWyeygQ/2xihiJbG69PWjnwLPLnxtQu/TEwhb1pmoJJW8QCyzr
	XIdEdjgJi3QOCfbDrIP0PHN7I86p9O53Ig1jl9x+TAR2TyDY+XxEwlvucONUxKW2EhwknI1lmOgf5
	Qjg9WPowAMEE8/Yfy3Mnb8rVxRrh4Wwl9Yhbp4LFljVbXtBdTyZkf1dgOHfz7pue79ceQsA+OzSzC
	OAmdV1S3N23ZsrTZAEz+iewmaRFzgz8qa64g4857c1Pa+H0aVgkVXElOfeTrZqZ++R2ZP5Kv3Uib2
	+zgiEDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Ymq-00000002rN5-2o2n;
	Sun, 20 Apr 2025 17:49:00 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Yh9-00000002qqG-0V4v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 17:43:08 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso2706403a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Apr 2025 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745170985; x=1745775785; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94OI61Qmw868CLwlFK0a6ayGGnbK7PL1vRKgwcsJ6K8=;
        b=QHULxV8te41A8p5X9kWEeXKHRMC9MQjs21kObEeEUMSB61KV0Bgff6yepQrhI1/3G0
         iZg4c9BAq0ckjbCYPx/pQb+O8W0V88CaSEQMJ84IHWlQto2YkNb1pwNbRBn1DKzgsW9D
         qq0fzjOU+S0kLlflQUZ69XTrpN0cP+22cdjLhdGTlre3dOyJuiToWbO+8+/LihbQolpm
         glBj847XPj415IHlyKmTtpBL083XrjlcESVfxgcclLADOzrHjs62aiz0ZY1PYctGP7Os
         tlUGbQ3gVFJ4kwY2Tzp2G2xKztKK9C9hcFTZRPF7V4S6RW1GPKL23C7MLgTNRw+nSPok
         k0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745170985; x=1745775785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94OI61Qmw868CLwlFK0a6ayGGnbK7PL1vRKgwcsJ6K8=;
        b=TVLZKRqlrWRIMHVmmGYb0GM0eWAQ9iwKQo8+gjSLuT5HssOD4/z9a2ONES7fhTJJdS
         V1cbpiNHq2fE7riUIqeDHlNwMCSQ243SD11tXkhjvEvN4NyTp7+6rgmlaV+ZF/HnjJnh
         YY72XjofYbwyRiHPvRJoJEwFDEXJB1gLT4YghozrK0ZK4Ozx9d1SPg9w65trvaDNsIMv
         8n1XJTet9zFfH3uZcmijH7PxD/XBdtQYsWEmc2DDg71wFQQyV/f7Yp7Qy0n8fPS2kcIy
         5Z+fTSOjQEvDuey4joHuP0Pmb7mUIFOl4Qmp1QG5dnQpSmb3Qd0AXX9ckr+97CraTUrv
         UhDw==
X-Forwarded-Encrypted: i=1; AJvYcCVc4XfEyKoKpKT+XFpnOd0hMHDOE68pr9ObOBcZbnIsqU+QklpQhj3chXYC4Xfcv4pMc2FfMyd1uz9psXgPYyB2@lists.infradead.org
X-Gm-Message-State: AOJu0YzE32wL4bAjldJGzKaymmWWG+pJo2QFTKzxuDtXZhmWlnl7eF/C
	ddgVDiKnAw8ZhNMT1f5PSKhu6KYaj9PTduITWz8IwatOAOz08C+kVJq15rOMUorkPhUWs+368CQ
	Ukz6eORvJlcZrQthAFb1Oa3lDKk8=
X-Gm-Gg: ASbGncsx6H9QHkupZa1+RGT8x95dpY2Vtdc/+/OuRp+xG6UMVjqVj7qJ7o5gBYEHKXo
	Nu6CejOa6MPg0u89vrqI2cL1+TX/WI18dfnLgjPbHFqfw/592oeRkrUaLrO4dw3dAWdFiSqKLCW
	I7lUzPSNpwIdzJh0qstAXPZ1UicdUhwyrbliHNQgSTAMwrxbvIPgBZbmE=
X-Google-Smtp-Source: AGHT+IGm/qhW7RxxGqgE9TkxiPozSlJRJuNqpTAlw8fbvhCQ/C7aEOmO2pE3XGjnDP+M+WAyZpU48wYHvTvZagWzwlQ=
X-Received: by 2002:a05:6402:1d4e:b0:5ee:498:7898 with SMTP id
 4fb4d7f45d1cf-5f628594334mr8047875a12.17.1745170984482; Sun, 20 Apr 2025
 10:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250419160051.677485-1-pbrobinson@gmail.com> <20250419160051.677485-3-pbrobinson@gmail.com>
 <5dd7825c9fcc83764fbb4b0b53704152@manjaro.org> <CALeDE9Nyt7Di2_u-Vf=6OCAg-6wmbz75Cs_MCfZrk6upbD9nZw@mail.gmail.com>
 <e111f8b9f499a158af5fad1942951e0f@manjaro.org>
In-Reply-To: <e111f8b9f499a158af5fad1942951e0f@manjaro.org>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sun, 20 Apr 2025 18:42:53 +0100
X-Gm-Features: ATxdqUFjSHoMqdkC-Lh3e-QRl--9tH_9W7-UzywjrWL3LtvJJouCNr-dcednj7E
Message-ID: <CALeDE9MXE24mdxPNTMYroZG4Wa60bAGCJ-3rFNgpoB3U9JkEyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_104307_159612_30C01A3E 
X-CRM114-Status: GOOD (  20.44  )
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

On Sun, 20 Apr 2025 at 18:17, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Peter,
>
> On 2025-04-20 11:33, Peter Robinson wrote:
> >> > This adds all the pin mappings on the WiFi/BT header on
> >> > the SoPine baseboard/A64-LTS. They're disabled by default
> >> > as the modules don't ship by default. This includes, where
> >> > they haven't been already, UART1 for BT and mmc1 for WiFi.
> >>
> >> The patch subject should be improved a bit, to include
> >> "Baseboard" as well.  Having just "SoPine" is a bit too
> >> vague, and it should actually be written as "SOPINE"
> >> at all places in the prose.
> >
> > It literally has baseboard in the second line of the description.
>
> True, but the patch subject should also contain "Baseboard",
> because SOPINE is a system on module, and the SOPINE Baseboard
> turns it into an SBC that actually has the add-on headers that
> the patch addresses.  I hope it makes sense.

I mean it's pretty clear from the file that is being patched, I think
you're splitting hairs here, but I've already updated it in v4

