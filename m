Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A48CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=; b=DzLGe/0gTXetWUWXG3nJAwC2DY
	lTGqzggIMiMlcANnJOl7u8pTypuhi7p7D7O5IMCoFzVYJUSgixK5IXRsfxLKolz46AYGt6FA0k0ac
	FGN55CyJZgBL5VdtFLnOh1Gww4MykLr3AOGDnjUvUcYmuki7Gm4HRlo183PQyCyJKdNN6szUOUAOV
	qV5wBURxxCNrTT+LeQTPLj9rf7QrwMy6OXgdUfAaB+YaMFxGCLEH5f60BZCTKcKAdqOTLxPm4sM6y
	P/rsY5D2L7SK0TF+ByWTRZ8ln+L3Gxzdf6AatdHDxMhsOE8MRqnDJMaUSDtVbSisjGyDdco2dz1iH
	0h44wxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlJc-00000009yBY-2zLv;
	Thu, 11 Jun 2026 19:43:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlJZ-00000009yB3-2n1u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 19:43:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so138938f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781207023; x=1781811823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=;
        b=RyILrfg6UCgtOs8DH9fXLYXt9UkkkqY+4rX2WmEdepgfcSKdn4Vztu3bWY81DJr8J+
         hP2/9XwUJyxOClk5H+L2uLeB+G6LL9/utegC0mko/Q5D4VAWMG+DuvgFn/YFzVnd1bzC
         2bcocuOm1lrC0ryx8JZCtombfz1fIRXmffDDuNLPjkceQo0q0YF56fHuJkz1rS5zZwey
         OXEXMzWuxJNOIEiPlxPgmf+BdA6ZBQyIxHXqMQF5f2eULB1KwuIOCQ3PzB1qpVI7GO/C
         +QqgIcJSqv2VsamI5oX1KCBpCQWXHRrapYgKDU1Vu414RV/1SiqR2cXbZxdJNpRpNufj
         nzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781207023; x=1781811823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1KQdWvhqEfny/utP9buNkNl2/nWXIxFcbLtKnInfxQ=;
        b=X8TfsIBNq4T62Qsa7BcR9rFOqDxyRRT3KWZE6X9G0upw/fb0y9a3tjsd9D3m3FwNdV
         TslTeDvL3xXNXpeqKZy3gBtSVVTsnma3ZBQ6+t56sbREX2OtHzPe4qup6CEMGzj8SZZQ
         s+MUfwNNrITBqksnfMcX+NideBMP8GNcdQHfyLORkqM5/kgpb2WjnIWazXtvWhTgLeJE
         1J5ZCEGqGdJplAXHRgitV+PIgAEyPGCz4KLL70adhL3X5hZO8BaqHuRrJaXni4rxVPa5
         JJxI9xiXfKKd1QlRgXgF2Jhb1BoeX4BH5H5ROZOiGnKaut3ivpgk19RfWI/fcJ8JLrvI
         6yVw==
X-Forwarded-Encrypted: i=1; AFNElJ+h7TQSOr+D3L+wiA8mg4hOdYnZUJLah8ehX5bF6nplBSlTCFk4yvCFLrMC0ecV6rU3v0lFnupxmfLgufsxwJsf@lists.infradead.org
X-Gm-Message-State: AOJu0YztxO/lKYuy913MYUDH0Xx+SEUr/Khga9NqcDkj3PaCdzHrgani
	QRnq903GXNV3jgh/mIts6j/Y+EsnXzMP6+/PcNMcmkc6E8k/WcmSkBkb
X-Gm-Gg: Acq92OE6LCtERiA7rhK+IGXVDvyi8Q12NtHh7S7mCXKwlwVkGGIZml5wze5SwKhuPeH
	EpxGgxVyqkf1p8P3uoej3ByFFEb7WpD2YdQ7HL+cIHKa2oy+qI81qT555ZnpF4RmraXKVjw0ft8
	1ajl/UBIEfLf1PZ7AvsxvWOM18Ufj8QW/YV2oCv81GmqqQfKQYmLKLMm/APoIz9Kb8no7h54PjH
	pjd1v+KNPLHT7V+aUNNuq9ZR48lkMeCZvFubwm3cvGSmZX5IGn3ebmAUPccL/9FVGHRjEsSJp94
	If+A+greHbtYRw5W31Uul0t1t69UAFo0gHCS9NbOdK7ycWv7oVaUl0DGmGdEKLCHuZevrWSMzeD
	wKTYFsD8dhFXQFSNi800//2C46PVdmCL/4TTe/9gwrkKhkjpkLUKb5R0+581PU/Z1Gh+4CWgQ/x
	dGF4Zt+nTKfUp0lYtb9XtUWnjGnm/rGYp6MN9g8ctIrYDUrBvSs3F5oaOGclHc
X-Received: by 2002:a05:6000:2911:b0:45e:eec6:5023 with SMTP id ffacd0b85a97d-460677ed2f4mr6812673f8f.37.1781207023291;
        Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606c0f5164sm1211937f8f.21.2026.06.11.12.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 12:43:43 -0700 (PDT)
Date: Thu, 11 Jun 2026 20:43:41 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
Message-ID: <20260611204341.147f1afb@pumpkin>
In-Reply-To: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_124345_742969_57A751AB 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, 11 Jun 2026 20:12:32 +0200
Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> instead of explicitly specifying a baud rate.
> 
> This would mean the default of 9600 is used, but it goes unnoticed when
> booting normally as barebox fixes up a console= line that includes a
> baud rate.
> 
> When EFI booting GRUB however, GRUB will not pass along the console=
> line and thus the board ends up with a 9600 baud Linux console,
> confusing users.

Is it possible to determine the current baud rate (by reading the hardware
register) and default to that value.
Then if grub has initialised the uart the kernel will use the same
baud rate.

	David

> 
> This series fixes this. As the device trees were added at different
> times, they are fixed each in a separate commit with its own Fixes: tag.
> 
> ---
> Ahmad Fatoum (3):
>       ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>       ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>       ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> 
>  arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>  arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> 
> Best regards,
> --  
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> 


