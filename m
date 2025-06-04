Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D537C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=; b=z7zLuOm1PXqHeMbO7xAxsI6PCc
	2Jst+QL1QyZTAXm2gJaHuyQWwGD/br+Gu52m9ebyjb7DadnDcBFgieeZ3/5rabnUNUaG/82guBEot
	eGAs2CbYRo66Lk9B34vPkQjnkBFcdr9LqjIZIAWTbHC2jt6OZzD8l7b0FI42g6o39A1fEx274lcXh
	d2ZtGycwFNPirrGk7hxXgL/GvHfBm+R1sfcuAl4vWWHXcm/32vPlpfSD/bHtikKnYa9T424xxXKWp
	93EHvmyAFS2MviCXdBnpKDOr47tePt5T9mDdUWVfnb3ZQTVPeiCVLAfwDqbrdoh6TsIF6rfDXZUki
	BGdFFKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrGI-0000000DosS-0Kce;
	Wed, 04 Jun 2025 16:46:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrEB-0000000DomV-4BEt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 16:44:37 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so976e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749055474; x=1749660274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
        b=H4PxF11BTopDqLHcxNODPSDg6yfovkpfvG5mcVbWq2vgxE8Qia2hHKNeqGY5ESnx7C
         dIoVLAJbm7WqU1OVl8PTbHTYO984PRKXtKrFUgNF7FqJNNTXpyhaOPbbSeXBCOPF6JRS
         EY0TZln3C/2AmovyCOsrRa0lVZqwzt30xw3IiNvuni8eYJDkmYvVQXyGYYcKhazM8CdE
         uWCgs306CK4UyySEWYwSZqkqKFgqU0jKowg0MxGoU8wC7So2zato0IyEUkLrpYPRxkc1
         QlG6xW7MtMlAX/v+XB4MSC/Wug2eR8wfeW+A3Qxy5D5p3oL5YcoQiBWYJVr/ETE5rzeO
         o4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749055474; x=1749660274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFMCMbJITuoovSp6CQHXf/DpRmcuSqQ1RVhHc0lV4rE=;
        b=TwcNXWi+F60t/WjPhieVAcRiV2OwqWI4M19RaKavAXMWT9rgWgHWdd/75tjc+jr1BA
         7ZSKh/KZBDHzG2qwJfFAv8P+UVm0C2rdYIup0T7Ff+KrBt2Ew5TLKwpizpz9DtGjSwrg
         VmQBlppvuuFXZDaSMpC+qh+3LX4I18sZE1U3JtyFVZSIPSvMQP9h+PppjeqgKA2GZU0h
         Pb22Qn4SMD4seUOaLiWhV/4Q+4gMIzomwirFMkmQLRv5WjjODaFoT1WEFiqYUOjtrQQH
         pBZoCUzLVmJvKc1P6wMNsjWjeAV429+hlAu6NBo6Qg7bRnn4Y4PqurFg/JORfe0U4Y3c
         3lMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfhBoVJHNSadfb5BNhSmdHySU5DnHGQn2gW4224Sd+Bx7dzlf3TfGe/qZjYRY2NLeDZhQG1HOg761a3OY/nrWB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9bwn3+H3gnwMbdOdeIu+CriFx/5eO0HiSTXmf7ucQoD/AljhE
	oF609P+kw2OFDrNibnHPvxXNq/AgWtFDpFC7zaYA35zs6S6RLsGrtQ+DZxSMmKH10yPHiDtZPmX
	OKkL49VcvReTeQwZDXoPre56CkFLVke0=
X-Gm-Gg: ASbGncsHyTpI4WaDb8PlvxPa8gNKFsRQMLlkC7LdKTE1kqEAV2sRovHsenS80tQm0s6
	Dcv9flcff4uqyMobX4fpHyeRVBOy6ocTvZQEJOnxUnrZKPEhKZk7oc6jjHkx6y/itS3DsXCCL1y
	kGWwH8AJ5Y0CFmHxE38rJiZO//ZtDqSGyUTJfHII4nV32vbFByy5QE/NGvcWJivHPXGkUFTTq25
	Je2ppd8bw4Ktg==
X-Google-Smtp-Source: AGHT+IF/YsIUFahxFoeFKA3DR2RVxvuZILJjjOA/b6Zn6AHVPsWFoSWcKKxSdkTyVWeKMDIAuj3FRHVXkASKTjwKFFY=
X-Received: by 2002:a05:6512:b86:b0:553:25b2:357d with SMTP id
 2adb3069b0e04-55357bd6f7fmr943933e87.52.1749055473351; Wed, 04 Jun 2025
 09:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
In-Reply-To: <20250604153510.55689-1-stefano.radaelli21@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Jun 2025 13:44:22 -0300
X-Gm-Features: AX0GCFtSAkrZTNsALuZF7FxrEF2hbsck5XT79hM6Y37nNbT0k-G0Qzh3cVE1Gmw
Message-ID: <CAOMZO5BYBMq=5ir8WQBEH=h6SPpm4MiUrDoDJvJEH6ioUCB11g@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_094436_038128_9DDEB726 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Stefano,

Nitpik: The subject line of your path should be:

Subject: [PATCH v2] arm64: dts: ....

and not only

Subject: [v2] rm64: dts: ....

On Wed, Jun 4, 2025 at 12:36=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> Variscite has updated the Ethernet PHY on the VAR-SOM-MX93 from the
> Murata CYW43353 to the MaxLinear MXL86110, as documented in the

Murata CYW43353 is a Wifi chip, not an Ethernet PHY.

I think you meant:

"from the ADIN1300BCPZ to the MaxLinear MXL86110"

