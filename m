Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E83C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=; b=ayA7H18Eubw9VHW6PjkZEoGczP
	oDq5AUCbaAKoOCnX1g1KFMhA8KnczjVcijroCVHrhDkwjq1Z4pzjjyIpu0yyiwNh1ib/cI7xYdapU
	qqDP8VMzvqCmu0YOkOmdGZvqXcxfler3lulRclFWnpuGzFEAe7WZ6LGgEtpwWiObalYIXZox2xeSM
	MVfR2JQghGMzAZTatbnD/ax8bwb3oapO+5M+9WUo7FhHF1GV7UhlIjKTfGldfsXMoevNlwPgnuvXZ
	hA1wjthjfPajP25wsfi5DDn6jyzcdluHOHV9f13nIUlatw9bAj8fNcXEyvrjr2TiMw5BAtRnF8jP/
	f+TrlIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP2J-0000000G4Bl-2mNa;
	Mon, 24 Aug 2026 07:24:06 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP2F-0000000G4Ah-2WAV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:24:02 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so347196666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556237; x=1788161037; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
        b=m3AF5Edx5e3wLhm3xNV3ayd1A/hf4apnd5He1OH49GOrcOGKqEn68v7sf9XzUqa8lB
         mwUrlnVebfl6x1/flvISZ+1/Zh54Tal+0XgDZvSqSoXj0zvmZjTHX2en4U2Iw2P7cfXC
         ju2dc5T/gCIFCemWE9is/05SWnfavNx88L5ziPGi7JPQUbOxn1TXAEfAqYcuu1nXtHGt
         DQpIZugrm/oQTbQ9nabgr0cZxd6gER+ukwhV7h83WeSXIef+EsFtOXNQCZt9GEvhqAGR
         93ghr5GSVpWAowr066x1EMPFAzpOuZsBSNY/Cnk4UrHCClJm+rQM4/DE50CUzUYyeG6u
         nihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556237; x=1788161037;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
        b=dmy0PMg0bIOOD0wZrOytjJ1UYj/L02C8tc9fEN/xjrGM6in7Xqm21Xim+eJix3wtKz
         IwksQtvZY/yp/FXKnbK6hxAlHKFgUijPE6P3/tadb0zSxH9cPHcVWb0ZrN+BL3k6qwre
         4zuBe0m1HAp0buCMOLn/2QRtL1hb03r8n8YPB0Xf5fnm2KTW2xFGXKfqXFsf8Q7HjejM
         rn6n78sFCo7eA+d2K8StZY0zEbW1UfNj/wpZZUKFBIEhH6yZY+OQsRTP8CaI2pwS4Icp
         on0cHlc6R7qQs31FaTLxVT6xgKi+rYTIwh3GJ+R0dLJOMzBmXL+9PyS6qcO5ogPAMYjT
         vBHw==
X-Forwarded-Encrypted: i=1; AHgh+RpdpnPsxprzlg+K6bVjQvtC0ZKSDnRinL6ocK05ns1RrDqqfMUkRPj/IB9hF2f5s96mnisKQ+dhLFmZIcnu9RFy@lists.infradead.org
X-Gm-Message-State: AFuF++mKUTJ/GOsQezGlTCg/jxXVdP5oHLpsRDA7ungnphCC4gizriuG
	+CNARMiNd00KEHi5Mvs7f0EHQj3lW8BZRpkPcz8cwQV3YGk4w6XkQ3uCH3ItIxFsXk4=
X-Gm-Gg: AR+sD13fxgOnY3zELneTKdSAyM/horrQMcOxwHcnvSRlOvm2AYjixUjGECQvp/hJJWz
	1imK9pKNB2KpoNX2T6hx1mMIvnRJF01vhXo8m85YI0H0WIKwzFt4/nlJpp2g0O/sGbYkcoDJpBl
	DWeOxJ3B5al+sIM0fg7PauhojDCsVTNH7gS62It4jG9SDQgEZGWni0LjlZb08gkPLiCz8CwtzAY
	O04qyTj0PKCb/DQ+V98g4x8pKz7BaIzbVHgoTR7qE2e7cVGbEEoNhOtGjzEXH812iWJdLcKh7xa
	eQTvzzRH/mcXsMakLj19FlEDtir9tk8t0Ly0Y/W+gWaOyZtOF0xQ9b2nSbzCM56M/+YL00Zq5QB
	FdLT0/nKDbTs7+WNby6FDcc4TMr+crFncjroe+IXotg2336lp2IMCZAj3P4/Vdpm1YelH8Qr+bX
	dfp1UY+hKVI8yZhFlKsMBd/d13gSMaw4oQHauNAmE3187YC4QZcEwGzN1IM983qyCPtpNW0cwPU
	ra4T0riC8VZAyaA299G6yUINm+xySVj2hE+szG4MRWGHZiWSnEai2z+
X-Received: by 2002:a17:907:3d0a:b0:c20:83b1:396c with SMTP id a640c23a62f3a-c246a62b68fmr2605606366b.17.1787556237186;
        Mon, 24 Aug 2026 00:23:57 -0700 (PDT)
Received: from localhost (host-212-171-227-71.pool212171.interbusiness.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm7243944a12.15.2026.08.24.00.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:23:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:23:55 +0200
Message-Id: <DKWZSTY0TTBK.HRRXYTZ4CBWF@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "David Lechner"
 <dlechner@baylibre.com>, "Julien Stephan" <jstephan@baylibre.com>
To: "Carlo Caione" <ccaione@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino@collabora.com>
X-Mailer: aerc 0.22.0
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_002359_641282_AADBED7F 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On Thu Jul 30, 2026 at 10:04 AM CEST, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
>
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.

Gentle ping on this.

Cheers,

--
Carlo Caione

