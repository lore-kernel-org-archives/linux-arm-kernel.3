Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14946C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=; b=svysn5l/Mdgue4MMyPmPIUv8jc
	W0jpUxPVymcL5gTFUC6X05EaJHvS0+Ski72jWB3p8m5KwPFyCirpg+qUO0tfCYUqdLvcfbd+vpWju
	zJDrZ2kbaeSkrsNHuz2x4gtqo0+fBteafyHB2mrf83vzPw/hSZLmjReAcKgtzSlHIX+9fKykY4pdp
	KDggkeTqSCUk/dfWnVZ0xwqzeCmvGwClwaabHTdaN4+Hye+684PW2XCoc8VlSBId3f8T9VPgFtmJs
	I0vc0DtO045l1ovlR0CxyITWACik4MoF7ON1OENRxxrO4V16rEyg39wRGAtbrvO+NR7ZEJOt2rLUr
	MUTsaT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaHG-0000000BVlZ-0cR6;
	Thu, 30 Jul 2026 23:35:02 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaHD-0000000BVki-3Kp2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:35:00 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5bf9506704fso141776e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785454499; x=1786059299; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=d83g8Q3k5mIAVJZQYWZmK/JreqfT9m7vO+oCSxJ2oNClp2uMC/DjGVlokW4InRGqyn
         TcpHx9ETAm/DF0vH01YaK9OiKNbb1D64H+7Yo4ykTdUZcZZD2PE5YyNXyi/e3kytMjnn
         a4k4dNDqdItwuqsXdlEKBYC2CN1PUSiRtJymM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785454499; x=1786059299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7GFN5YpwDEZAtAP3vleYwkuNsvwAGPeTkmkPSkEkzs=;
        b=bBN9fbVLqXNns+L1EIW4sp8W2kCF+Q0Y1Tyqe8UGsFnPAL+qF04VI/GJ9g5ucZAf1G
         0q0721L5limyjHCaS82vTGZph+Ss4t+CcBQefsi8vruKempE94gDAqiGnrT7fI1uaNWW
         +Tm95cVdWWTWOAPxuE8+SviE/EW0k+2+aFOJoFdTwUGO4Uvn8c/Z3KxwUP/sZSl1DAiU
         9bX5+UMb7R7iE1YlyoVxTDPJ+JE7kJKbq4kpXenZoggP/dmgQ9WalDI7w7FmCFm2nVON
         ypfsJHtx6vax9vew+q6RyHksowb5w8SXg1/nH/PtK+goeHtGo1aFF2mIfMS0yVpHY8Lw
         hmOg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Sc1e/I/smLxO65gzIr36I3hp/YLLWj+g9KzSRv2IjWmlARaE+dctUayICx6d14EJjKVzYSRw51H7a9iJBus+@lists.infradead.org
X-Gm-Message-State: AOJu0YyBaFnsIM3pCDLUnFUkmRJCrSnq8H91eYn7vPUI3Lh87/LNViWu
	W/ZwRKmuKkOMGC1mKc+TjPhyjYkqrAPPcdtLOtHPckYHzRvdTAkPkpVWWzXnQZn8cYBPstLLiJF
	Dvv4=
X-Gm-Gg: AR+sD12sKrXGPAMdrlrAg6IGernCNk9TFl0ySfZV5EE19hL3Co/E4/JN58pyYcxLh+G
	2k1T7Zm7Xo4q8grBCtGCDuRsgnBbfrGbspiHgYDo4/GnMzMha1Lb7eVlDTz3NVEBrCC476tc/nh
	wPUGMNLortYGtTAOuvSfHyvAaAOyE4c+E3iKwPggRidBECSdPNuwNDxQgqzPgQBcCR66i/I8Nl9
	lJ6nycViS1+LvJDo+UmQqMajG4rjFMFSA6eLur3/WKGw/Ozovirv1erYWXYABli78M9WMlfi4z+
	59n64Pd6AFQR3MB03FVb7gkJsgbOi3P9Wn7tL2xox4ioZjRyDNM3+Ek7u0/7fHPduVnHdMaq0c4
	zhX2xv0YpG4+zM/me9q4EOY4Kh+6JHQjpKG37e3X0jfxorqa/XKSfPeFigsuVz0kgbMNh5gGOCh
	JvggcIsXAAXIFFlim+B2Cc8j1QGz/elhHTlCj8tQ1csBx2w7FcOyAsgXDPeQOMB18pwr+DoSLCh
	1t1aCv7lmJqrCADsMOs+HqnpD0=
X-Received: by 2002:a05:6122:c83:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5c3661a066cmr1486378e0c.10.1785454498690;
        Thu, 30 Jul 2026 16:34:58 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c36674e7dbsm2617859e0c.16.2026.07.30.16.34.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 16:34:55 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-738bcf9a573so132543137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:34:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcqIRQxl1Rymk/AoqduovbMjPknnm3EmXHO+NUnFGG1eybp1qfPMRovI3yVnn/TKwSJnIWwLJJEYW2FpxuUok/@lists.infradead.org
X-Received: by 2002:a05:6102:511f:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-7574e1d5298mr1438306137.7.1785454492526; Thu, 30 Jul 2026
 16:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 16:34:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
X-Gm-Features: AUfX_mxnuq3KCnn0XeSL1ZB4QNLigMdFRjElx75voPzjUsE6soU8Kl1B5ccPok8
Message-ID: <CAD=FV=WWpswZ0LbZzpj6RcyRxYps1Ht8+w2TYTviTw4bo80KZg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_163459_842169_760DF768 
X-CRM114-Status: GOOD (  12.73  )
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

Hi,

On Wed, Jul 22, 2026 at 2:56=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Enable the Google Tensor G5 (Laguna) SoC family in the arm64
> defconfig. This SoC family is found in Pixel 10 and later phones.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

In case having a tag helps:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

