Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59118E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6jOL9AAxWglamTsC6cbdjMvO1jXJ6RrlsbJ56BXeD4=; b=Ocpd+BxbG/BVkdUJUBuG0jTTYM
	B0MHx+qkaY/auIiSAaaiJ9JhiptKNMqH2EbDHMCBnOyyDywexNWbus+F39xa5C8cv4ZzaKGQrxq1R
	uP0erWQONWdkPu23QJDeMXKD2l/UhW1v9du5RZq8oCGpNY4uVcoVnORn91l/SjJ7zUAA9uy/Ext4t
	lrviunqSVs9j/jNh8YjXISyTaAnfRnDmiJqJfu1tifNIZOiqs33DrMoOyv3V6pAWKLF+U28YbrAxY
	uNn9J0gUo/RFMPoc3VzVSWpzOALJW2ikGC+76KRiUiUJURXB21/JJAjFI44iogPs98b5X7J5HuJNb
	6k9YoHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCxX-00000000az4-40Jk;
	Fri, 27 Dec 2024 16:13:07 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCwO-00000000arF-0Ihc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:11:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53e3a90336eso8174882e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735315914; x=1735920714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6jOL9AAxWglamTsC6cbdjMvO1jXJ6RrlsbJ56BXeD4=;
        b=eU8UcEHa8tIn5/NT3W3Ovc9gU8RfvwWJEvFvJeafAvTAowo/k2BSMHt4uv/HZI2Ead
         4AkfF/7rlZfACSbsJVMCiUiygi+IOBdDTStQMcaO3WLoUlX9SYB4KMa/HHjzfsELGrDK
         69PjzMeqGQj/ucMRVqYxnpoQm//QotThm7+YHUy/O/eNXMMCTs8N7VNe0Ar4SgQuKSf+
         7lGK8mDBdGQmc6fkudV1H8x1mZ2DFT+1PpvNS7PCGT9uRYKtwfICQq+NpyMLDm344iAG
         NahSAX+52F03ZlYYCp5YkEcK3nlJjs42ISRt4Jjbnq4aNrlHfm5ckr69bSfksE1+BZla
         fsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735315914; x=1735920714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6jOL9AAxWglamTsC6cbdjMvO1jXJ6RrlsbJ56BXeD4=;
        b=KnEdD9Yh6YP3j09vc/+xT83p3w94iah14hbpgfpbvSePeoeEmFatdfaGtBELhy1xUu
         BoG9CX1kJml5H/RSjLawm3GnINYR3M/b4opw6xSRvpybUU4XUwcI9tuxpsnxSh+otUqy
         MR9Jv5fmDpVuKTnaJh7jq2r9a3T4j97gevuduaS/Y0kp6kYpmimrWQwIxw4ac28WHNlf
         a873LmBdmroemh4n9bn1HsHjwexUZxoGbyIzgUgsX1nK5h3ShCRveIW7Et7PqgOVk9bH
         kS4ZMu51gDOb0gzEjMz3BpwvsPXrEu006qRWsaNv01Y+Su0drdwzlpnptfWS+tNRda7E
         YdWw==
X-Forwarded-Encrypted: i=1; AJvYcCWYzrJib25+sr2ydKv7DaSQgt7v7AZOkPa/+k9SPFzRAoOkosnDxoPZ6KManVpWLtXI9aAD+le6vYjOiRyEyA86@lists.infradead.org
X-Gm-Message-State: AOJu0YwwKTd6+HSqLFn5CIPTW430SENfefMYzyg+OaPEdn9TRol558zU
	zdkiYsICU5BSUMgoReIzkfLcFKhveefnIH4C8gAyjqQU1F/jdVer27kYxDKdWIIbWkFZueBHg04
	JgNUXAufhwaHDMtmAhItvSlmOpG0gBgW704i1Uwhg6Mnt5U/6
X-Gm-Gg: ASbGnctz7hfKnMky0UZKHXG6hiqCNdZt1PHluFU9ANPHSMH2QZHBMmSuVy1qH2sq4AE
	rukHkkZoYDgME1qugH8E9/DkOKR+KBcETPbl3
X-Google-Smtp-Source: AGHT+IEfzgrnWEv0T8X300Rwk6YsTgikGaZ2unlJL/Mp1uL2AGkGBjigq6K16TIrpmYWFmnd0L6EjwQh/s6OpeadRoU=
X-Received: by 2002:a05:6512:33c9:b0:541:1c5f:bf85 with SMTP id
 2adb3069b0e04-5422956beeemr7174420e87.50.1735315913918; Fri, 27 Dec 2024
 08:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20241224093522.3815562-1-kever.yang@rock-chips.com>
In-Reply-To: <20241224093522.3815562-1-kever.yang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 17:11:43 +0100
Message-ID: <CACRpkdb+3=VQiY0eHcVDcqVMpkSXY1sw_3pC6uCxQ8EZtRQp2Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add rk3562 pinctrl support
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_081156_124114_B178FB6D 
X-CRM114-Status: UNSURE (   8.00  )
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

On Tue, Dec 24, 2024 at 10:35=E2=80=AFAM Kever Yang <kever.yang@rock-chips.=
com> wrote:

> Add the compatible string for the rk3562 SoC.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Patch applied.

Yours,
Linus Walleij

