Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207F3C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh0lbU+Oo2lQ3Bjxsb/KHgcQpBxKm0dV99RGXCT0+I0=; b=CMyH0/9xi2gYrtBPHFUJnNr4QG
	wjimuUmJyeG8sM9bEK5VyXWBNfRN4wCt68COS47YLTee12xlrs88peL1m3tbRawx5+7GJpMviCuvA
	8lEViwzKNyVm16wwPA1Tzvuzxnbwq2ePWQONcpMkfDXRKg1taYnqCDyqlsU1vq5mQVFm+7iNfyf0J
	0Q2IKCBxy/58JZi9qNpfKmDol7Zru13LLE+BfGyhokX28KIuZRFkUwrkjyKpiMv9vvjfnxNg+6uh4
	eVa8bsstyqF/YZX7+GBJGHGQ8iDqO9d1x2zo8QU6tk1sUconoW6F+iAhs39Wm4vnClMAMMgEFPD35
	SzkkIo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1wF-0000000AIK8-4BBn;
	Wed, 19 Mar 2025 22:31:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1sC-0000000AHgc-0Gjv;
	Wed, 19 Mar 2025 22:26:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223594b3c6dso1176775ad.2;
        Wed, 19 Mar 2025 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742423211; x=1743028011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh0lbU+Oo2lQ3Bjxsb/KHgcQpBxKm0dV99RGXCT0+I0=;
        b=KyTqTWRWh9oVfUBEXcAu6tIAOGlqN8rkL4Txp1AB+/ORKtE2JbQQtshK7KlUW4Ry/O
         yrTG1/xS3JzGhBWOnpVAtE8+/997bSH1Ffdkvktywuz1s76XmrVYm3Tbwqb4A/r/QR+g
         Vvk2myAd7S8vYy/KBknFTVOkPRqDEWPEwXuEfbRYLeZxZnhuK/qPszA0FQTj3DNLTZ0b
         UaRhao1qVolj6g7XwqpgpC1zbhhS4bQoRLF0Aa/Kk0+5sSAEHXQ/Wt//MR7Y5oCHhJ1S
         Gk70CSUBiQOib+w90eb0/qpQvU/C/1QQRipoNi8/b7q1FZ5gHFVd4b5wBVgKqSsjoyYm
         JIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742423211; x=1743028011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh0lbU+Oo2lQ3Bjxsb/KHgcQpBxKm0dV99RGXCT0+I0=;
        b=Km1Y27SGXUQhAmKTzaXOvcDSYm2uLUOnUEn+DCy87xTbXH8qqmj/EI8u0o6/NszdVo
         6ObZ290djLmrXUs7ACwwBjQCbe9ouOz33BsZubQWPXxlECMZT68vBHa0XyoRD09sXUu8
         udt78iYYMpGJWzX3LzvmrE5V6NLcn6wzuf0aJMfMXI4sVyU6PRA2CeY1xQxTzIMQsHk5
         GEnbljFj0eZSv3wyhv7RJRM2YpvxBVQ+Tl0CJw0Ou45e4GU/Mkd/aSyZvm4myAuHoCCE
         IKmUmI06q3G3+W0u8XrW4q17yjcI96+lufrt246Pu3Q3KbWqEh/PkwXqF+AbEuLfoC58
         Ceag==
X-Forwarded-Encrypted: i=1; AJvYcCVZZcnydpoV5DUDu38BhxCdNrQ6Q7EIb8qoQxunFpfReUy4zHC9N5xQ64b9Ah5JddGrVqjiexztfuGDCSM5rEUTrA==@lists.infradead.org, AJvYcCWxBZWlq/TA/iblJZNzbC2WRS9dZkChLVptnfsXg+F+RCExZ8zqxE1Ip3why1vg9BoJpdg9njICvBRRiuQu@lists.infradead.org
X-Gm-Message-State: AOJu0YxuLLEpOBr+oE4f3A4tGRz+7sSkBDIjBFaIowpPyQHfQ1/iXksu
	KXy+mm+6glX8As7pdlvysuMN4MuilT4SJ2qs6/GZIJmpvk7+Ks2RchqW1nKVVaEh0Q0Of1RZ4MS
	VoGsrZk9vdwkx82djCdn1QGd/9VQ=
X-Gm-Gg: ASbGnctVFmUi2U9usZ79fH2bLEqy9VivRUH+lS/5Kp8SAwbEgzVKEUXOcYsAXtEkeRa
	AfSBvafB4ww+owybQIn7kX1Htrvu9VZrX/us0tyWmPxhYZmLjQX74Eyqt3eKUtYlqPNs7gS3lpB
	8v5S7t0nLzDm4qiKO3R5Kj5ZIMcXc0u3VzSnZf26J4eVsncr0eMWUkgU9EnPk=
X-Google-Smtp-Source: AGHT+IFcGyOMikyVY9qlKdXwGdd+iPF7PAzU5/0LwXwsIYEBQl9meRAr7922jpsZNYH0Rdr8c3tSS8XVX+XEZrjW3nY=
X-Received: by 2002:a17:902:d54a:b0:223:6657:5001 with SMTP id
 d9443c01a7336-22649c8fe35mr84587625ad.40.1742423211163; Wed, 19 Mar 2025
 15:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net> <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
In-Reply-To: <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:26:40 +0100
X-Gm-Features: AQ5f1JpGPU3zshV1sBp8v7DgL1EJjYt8fZcN-H0O1bb1f4rALS8YmKAYBWD29tg
Message-ID: <CAFBinCA1wa89vSo0TOs5yZWg_Fs8gt5vUerjhSNFAHMkANy6GQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: Add Ugoos AM3
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_152652_102697_73C9DF92 
X-CRM114-Status: GOOD (  12.83  )
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

On Fri, Mar 14, 2025 at 12:11=E2=80=AFAM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC,
> with a board design that is very close to the Q20x development boards.
> The MMC max-frequency properties are copied from the downstream device
> tree.
>
>   https://ugoos.com/ugoos-am3-16g
>
> The following functionality has been tested and is known to work:
>  - debug serial port
>  - "update" button inside the case
>  - USB host mode, on all three ports
>  - HDMI video/audio output
>  - eMMC, MicroSD, and SDIO WLAN
>  - S/PDIF audio output
>  - Ethernet
>  - Infrared remote control input
>
> The following functionality doesn't seem to work:
>  - USB role switching and device mode on the "OTG" port
>  - case LED
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

