Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCDAD2E012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=; b=ehG0JJyHt8KzPMnZLEzbDUZ3Yc
	PCv9VcLiCIjGGzCNtVz4pW1a+iPW8jA64bXJq6n29Zdmcx2y9dUh9egzhphnx7vA7GKx/HrXCiX8P
	du4EkGt5sdFYd6MEV+npG2s5l2cmsG6fnJaF/n8TUYSisD6l2UcM72cJsOI8x4igqK3AhE5Dx+RN1
	UrWcpI0MbGMOGeKQkhZB0DEjCPNWKe5Dk8/jZb7FuB8E/bV/y43SYHxv75geYC4w6bzIgl4AGvRS/
	K8d6v081RmZiv98oHGEY18dodiLefnriNnvoRQS/dUXl/Dw+uPcXa8ay31A6Q1YNiR3bX7zWrlDxA
	UzlDL0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQ2C-000000098cw-1luU;
	Fri, 05 Dec 2025 07:15:20 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRQ29-000000098cK-2oTu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 07:15:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bc8ceb76c04so1189049a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 23:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764918917; x=1765523717; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=;
        b=mjWxB+0mqf2q7M3diD1wjB3I8kBkHpPFKdSFf6IdK/unZa2SfMdOtlF0RMo4WBHRr/
         R3Gxf/UzY9cg5f9aSXxB9GnyNd5oF9NcmY9z+7oHfnxR2GRoZo/j90uEnHrmA1eT9HCA
         tE17wAUue3hb6SPp8IACZWUe1mgTjBUNc7hMgUguNZGAjwI6BviM3pVTN99j4u5frarq
         9DQ3F1ULRAaPiuoh6YpaFiXi0rGZpnAC7kNWPoornHmGpdQF+rXgU5EOI4QdWWGRPiUg
         92rKHr5Q8D7IRWd0AQsYUUqrjLXnKkpJ4N9Od7QuEHyuG6fEMs0rB4av910j2wLW/320
         WsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764918917; x=1765523717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wtL3yYldnmdNDWFJpGyyGoQVux0laNIvubZCakEWnc=;
        b=G3x0NdtNw/88NdleFTRgtOdf34rR5rQ+w6ETrKlSR3r2YDU61JhB8UkDP0I+agoGOl
         LFBiWOCqfPyzemlBQqotwD2V4UNWzEISe1XM+6cfy25lnwpej0MNaBI4JOqSHA0p3GrH
         Ro8WpPTJV/eGqxW/jnKvTEanpZo1Af4MbyV2tfanWBtjcTSNptf7GR4wsvXLZeCtdDS3
         UgYZaV7QHY1Px67cVSIT3/gMEkSkdxBtufL553uZYOBc8EC3Pl7yJ/Kyh6ki3LDfxsgT
         5KM4DQhw0r1rJDk7S9CQf5FKo2EUj68SYq5QRIUSrubSO2Enn35aB0we+21JgXn7/q6Z
         h5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXx4AmZgXGyMcU0yx4A2BXOXADVIm2XyMApChGOSqvRssbDvwi7ut1iWoxC5iGVCkyEdcfTZEnwg0S7YKU9r0pV@lists.infradead.org
X-Gm-Message-State: AOJu0YxATkWYFVLbdxNlCXnI0+hshSj3IrOQKDSS68+gPoARDzzqIMo8
	XheFre+goL+k27J10R+ebKIQWCybW8b+G11kfoA7ABlKR+1grjBC7EEFazwKLFMfXn5XAI0i/cp
	AFOrg8SyJ/3zyfCU/H7e5wtIWx+KE3XMsbazGEqQy
X-Gm-Gg: ASbGncsLWzzeDEMXbay2b3unebtAth9izPWZouRLRrPQ1nylIN187X87giQ7XD/y16/
	4SOY1PHbUX/R142tFuHXdjGYn6ixKtVsY4jiY4zQqWTXzwVtrqwkc4C/UgJ515+xbpo4KAqII9+
	VcyMOiwPThvdYGiaDh8enkr92b/F55mCS/Bk5d3ThfskYYYleA6OZvJWJUPOodE/wcOp3QI1/28
	scfv5mRtkOsXyFCpVqKLA9fROV6QCUN2QDMhQD5x8GISE/n2psUsQsg5Wm/ceGZY6xepwRnDA9f
	rSjVmgmXkilb0d5rNCz1RC+tAao=
X-Google-Smtp-Source: AGHT+IGT6K0BHHyK+7ApfhiR4AaLaZPBjcT+DuZDOJN2iRJE4JKw2dSIgc9ERTNi77a15Duy+EoIn1JYySe0GVV8zUc=
X-Received: by 2002:a05:7300:5a0d:b0:2a4:3593:c7df with SMTP id
 5a478bee46e88-2ab92ee610bmr5224431eec.31.1764918916332; Thu, 04 Dec 2025
 23:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20251205-controller-v9-0-9f158b18f979@google.com>
 <20251205-controller-v9-2-9f158b18f979@google.com> <2025120553-suffrage-divisive-5890@gregkh>
In-Reply-To: <2025120553-suffrage-divisive-5890@gregkh>
From: Roy Luo <royluo@google.com>
Date: Thu, 4 Dec 2025 23:14:39 -0800
X-Gm-Features: AWmQ_bkT_bQr6GsRLXiYEii_iEy6B48Me29L8TfZAdXfRwHS8tmUgcF8diylx2U
Message-ID: <CA+zupgzL7v5MZDpxKDQQCqAZaqTdHbiG9-xTr+8RnigMFZJ_7Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_231517_723439_9BD25D78 
X-CRM114-Status: GOOD (  16.41  )
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

On Thu, Dec 4, 2025 at 10:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Dec 05, 2025 at 02:26:38AM +0000, Roy Luo wrote:
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on ARCH_GOOGLE || COMPILE_TEST
>
> There is no ARCH_GOOGLE in the tree now, so how is this supposed to
> work?  Shouldn't tools that check for "invalid config options" trigger
> on this?
>
> thanks,
>
> greg k-h

Hi Greg,

The menuconfig looks like the following and it doesn't complain:
| Symbol: ARCH_GOOGLE [=3DARCH_GOOGLE]
| Type  : unknown
|
| Symbol: PHY_GOOGLE_USB [=3Dy]
| Type  : tristate
| Defined at drivers/phy/Kconfig:104
|     Prompt: Google Tensor SoC USB PHY driver
|     Depends on: ARCH_GOOGLE || COMPILE_TEST [=3Dy]

According to Kconfig documentation [1], the unknown symbol
would simply be evaluated as an "n", which is what we want.
"Convert the symbol into an expression. Boolean and tristate
symbols are simply converted into the respective expression
values. All other symbol types result in =E2=80=98n=E2=80=99."

In a different Kconfig documentation, an environment variable
"KCONFIG_WARN_UNKNOWN_SYMBOLS" is there to detect
undefined symbols in the "config input", but I can't find one that
catches undefined symbols in the Kconfig tree itself.

That is, the tool seems to allow this.
However, if this turns out to be a major problem. I think we
can either:
- Remove ARCH_GOOGLE and leave COMPILE_TEST as
  the only dependency. Then add ARCH_GOOGLE back
  later once it's in the tree.
- Defer the whole patch series until ARCH_GOOGLE is
  present (I hope not).

[1] https://docs.kernel.org/kbuild/kconfig-language.html#menu-dependencies
[2] https://www.kernel.org/doc/Documentation/kbuild/kconfig.rst

Regards,
Roy Luo

