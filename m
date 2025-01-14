Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737B4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=; b=DpKYiCzt+yMrytkdHq9orDU3yt
	LxLdOWkBJAy2W0D1La3xf9YgUiCpDDdWG9GfCndmMxh8Y343HfUVBohHmNGQZUNF2Apeqy3iulXIR
	78srWcik1uO2c7+hI+gDu4kFKVdBnWYMLg5jJFPwzLEMIWm9o1cy8qri98edjz8ImZIeZCFzPnpC5
	nbZ448LbGH49G6RPL2PU7FISNPVx7QJwsTxhnRcqNcBYcJqudo8wNopkcwGKsquZB3QFEzks/3I8I
	08p82snoRzViQacJw1ycEwZ4T/pmW9NfV8yKhFLseAIHsqC3Pm3Bwg/zZ0PSHshagPPfDMJ3UlEG9
	BEOg5Rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdbj-00000007zpF-2Squ;
	Tue, 14 Jan 2025 09:53:11 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdaU-00000007zeI-43xC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:51:56 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso765023966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848313; x=1737453113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
        b=NuKOJHvF+5DcBQ+qntzWDlOyFQpnazPL+YLS1lziaU4IiGQtmiwTy835kD/kr5X0Qm
         kuQTXx6uIFiiBueCGVo7HNFEKMF3PGqFn+rf6jL6Nsl/9Vcjetc94BpOIc6FNFxyZAcc
         gwOkztn8H6I/kmsRtRQ84R+dTOAHSESc5rk0c52KeJSpVukelX2SH6W4NyXaxCRLNWQi
         HZciyszxgT21OcdTbPjiFrvLEFhOpa2OZm4YGABuvIsiup6OkRN3BZJxE198UpF89/N0
         PG1fUxAe58BZZTz/8G0I/pl5xPg1COsuNpYcdTB+QLbQj8MsCiJNc3O0h7uitK/ssr83
         cZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848313; x=1737453113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vhKhJFrC6JYbngxiOyCcDr7JeL3UGoiHu/Elu/1nCA=;
        b=ZX0jvcHDVQAfOCZrrGzrXqSZqce3DffZAkWakCBsilLaCxiutbtT5J7VDtxHwK+k/w
         /jmJ4DxGra6S1b1gDd9P5o2/NXBn+aCX0MWwBh80NoGGpRTOTDOIz/zJrYVp/qm4Pixs
         YrybybNHNWfRgcQ8IFgSMplypN56GnSIKa78/qvvgjC7p3UgOLCKmHw6fhVbAOvAjUzL
         cSMpr4JUMZH09NUjhpxvaHjI71jahsllUjOqhLCsYGYA5qdlXXxdKbo67AubT/byMuCn
         6b/QvU2TjYrH7Jldobdpa6fQ4A/Yghay/Qvpmk5ShCOfUyGI58fyBXxNSsDKfYgGCvUT
         Vx6w==
X-Forwarded-Encrypted: i=1; AJvYcCW7I1N1N0BpKl2L/s0iUqoEAVsJ6BJz5gJhRn/d6nhhShR1i2fu52McSf09sV2ItZj/4OCfRwIU/gHICiztuzQL@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd57dftojUeOgPk38HSo3cPEhcsV3EBMm3n0zM5Q91I+BQPkPv
	bfwpY44NR9VOE0TSa1/jT9dwGZa/UIcODblsXDqe6LvYgOHC7DhJPQ+PdzW7zj7Ph8RIYkxpJ4f
	Dt3ZALJl4FjUs3t239g/yohysN7I=
X-Gm-Gg: ASbGncu/3FQ8QzfmA4irS7r7b8Em2mPgBjT8+5vOt5m/4whd7YtTGfx8a+AxDJn8Kwu
	hDTfLfuUeL+dPUCM/BtZBAFb80+RpRDoJplLJoA==
X-Google-Smtp-Source: AGHT+IErJxrzE/fPLNIE9OFTXNlcCjKKB7eMnozUt0cKWjd3vc1cA5OjHKMV2NdK/m8kjackNKlo5HDJSzrjCAOUsv4=
X-Received: by 2002:a05:6402:4415:b0:5d0:abb8:7a3 with SMTP id
 4fb4d7f45d1cf-5d972e000c5mr61231608a12.6.1736848313193; Tue, 14 Jan 2025
 01:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Jan 2025 11:51:17 +0200
X-Gm-Features: AbW1kvaodGOQwkiNEnvsBKGVicOgrqCop4aPxft-hJqem49G8vNcWLLBKL5YFKM
Message-ID: <CAHp75Vf9HyLioEe+tN4VPMCMNveS1KODZSS3E7pH9a7hPyDLdw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_015155_004944_F474BEA4 
X-CRM114-Status: GOOD (  10.39  )
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

On Tue, Jan 14, 2025 at 12:19=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> struct platform_device::id was only set by board code, but since i.MX
> became a devicetree-only platform, this will always be -1
> (PLATFORM_DEVID_NONE).
>
> Note: of_alias_get_id() returns a negative number on error and base
> treats all negative errors the same, so we need not add any additional
> error handling.

This one is good,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

