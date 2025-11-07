Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8BACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 03:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbO2nTB7Qh4Qw6JsJr6W4VgsgC2mZidOm7iZWG0m/78=; b=Iu5EUQ6acggRTW18uybje6BLgc
	Ax9L735URQgsMRTokmbeVyeXVln8tSU1IJiHifDP2DjYS3ED5F6oQsGUIuakQnvjRTiXEzMLioq8t
	Do5w7rHJI9ihlyFhPgv/JJIwh4quasHIFnzxShKlLdfNnAaaSFaJVYPRB3KY0vPOj1QOU9E/sn9UV
	fSowmhLpL5mbzBKuIoDkIr4JLlauLbyDeMy1ZQOx0z2e7tskQDrhiNi54haKzHE6oMEWXyFyAeyrr
	sXv3tFl9LxnPjdFjpzDOJIDH7DV95LMNp2gRxI7ubaHs8VDFvmlApVMUdNoN3lkRwIDh1Hbvfbxry
	npsywESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHDKG-0000000GdZI-3Dyl;
	Fri, 07 Nov 2025 03:39:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHDKE-0000000GdY6-0MOF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 03:39:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-429c7869704so231086f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 19:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762486783; x=1763091583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbO2nTB7Qh4Qw6JsJr6W4VgsgC2mZidOm7iZWG0m/78=;
        b=TWQAGqbpkSZdNGD2q/pXMFVsYbVL7+0LWvoF3Nz7CsM4sbq8qOQiW3YqQBxPGOWww1
         DSbKLc0ApCfMVMG91WNfO1cDcPkkPWSi/3zdYCAjlW/sbwtS3hO5eOlM/5ohepgwWEWy
         sw0YcGl+ig95nlJV+DtO6rmksf/dfaYS7q3MA377YrXNMv+MDA+Wb3sWKppd3yRqr39F
         mT3axwm7elKKRTwQ4DNUptZrCEQyaDNlH6MUugOqfZZtgGXoco5eDxJmcLFimofwoKSd
         7wzLmCgQ5OiPuaz8rZD/Lmo1cI3W+fkz4PPuMmAyE0tP7riZy0/EPFy/pjMj68UDcYBL
         3Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762486783; x=1763091583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbO2nTB7Qh4Qw6JsJr6W4VgsgC2mZidOm7iZWG0m/78=;
        b=M5SqPETcZgSjeRg3LGpYzVVDY7SDAQ2BziK7uXo1+HV4+9PhEik4WLGHoZy3DKIglG
         u7AgEUF7qQye7fmUU1+n1aROHmlSFd9GpF5IRtmIU6FrRgvqYhH7X5+Edsnp6oMQpEFw
         h2SJVapnEUyqogXlTwZ8SL3HiVHtj3BiIyehAyl7sAh9Wd+/jpcZRi2719mN3H0FkrQM
         C9CNYLUAEOkXWZ8+p9O1ATqXoYtxonRdAtp03GG2uaslrGQdgUJpDSNtJ+H2qJ82m+hz
         FvIlDlLOGFqCsMdVkuD3+nG3dBqcPXyKu5hP6/P3GUSUTuByh+4OZe/wT+4OO5covPuj
         FhOg==
X-Forwarded-Encrypted: i=1; AJvYcCXOMB4aeHfbHnC65s7A8yuR21Zglo7ABLp3dWWvkMoHXsq7u8w1j4maz+KAAgP6tyNoRBSewIahct07/xYwjRNx@lists.infradead.org
X-Gm-Message-State: AOJu0YxF5j9e+uMPsPNOIo/Cqf8v0bqnn/R4yz2gw9hL2HiOgmpLOFbQ
	06Ir+kNuxSnB6HBkHEJf/eFQYhNRYAzAGwLzUt5HVug2VDt1S5cN5dk/Sdcu8nFzzhKLmnLKOa7
	8bpFljFIR4sHWUEBxvPOtqiSuXOwebtafDR4O5iGQLQgXWGbLJBtiEc4ke3I=
X-Gm-Gg: ASbGncvJqvvyK+PygGO86JdnzMHXfzCfFZ7X09ZgJ26DsSEvwYEQqF3yNbQPd3uxUnW
	jb0Nk3d+777IOhmI5yc50uWQAbCX3vTQutKqsqy/V0YTkwn2N41+ATb6+wCZJsqvUJgND9NUDzz
	D5C5ng5xKkEl+G+obY26mli0nOIYfqYKoafZsZ6SEIUix5E9wf2LSBGZ1kNb3frp8M7vWtZzP8m
	Jw/JiJT6iLDtLajKTc12zWX9HoHkYpA11DgCHQg6vtsf9jk+v/kUf2nTZ4Oa74B/NajZXZaY74e
	BOAwf55M8KCJZABeySaLgw/m
X-Google-Smtp-Source: AGHT+IGEh7IhvQg+TrDD6zZjcWzRpXTsExEgfoQszOkKmBt1xXGm8ca7e3AYQMZfs4zZsYumxirBfUxPg23Zvt75ckw=
X-Received: by 2002:a05:6000:240a:b0:429:d6dc:ae2f with SMTP id
 ffacd0b85a97d-42ae5ac513dmr1043717f8f.31.1762486783011; Thu, 06 Nov 2025
 19:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20251029214032.3175261-1-royluo@google.com> <20251029214032.3175261-2-royluo@google.com>
In-Reply-To: <20251029214032.3175261-2-royluo@google.com>
From: Doug Anderson <dianders@google.com>
Date: Thu, 6 Nov 2025 19:39:31 -0800
X-Gm-Features: AWmQ_bk0tg9nfbEFrAczn7gf3WHlPnE4d6lMh6R1gsb1gSV599Sr46OpKQ3eUsM
Message-ID: <CAD=FV=VYOD=33secA=2ozE8EO6Z_Wi_ZjiDMov5oP8Z42JytAg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Roy Luo <royluo@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_193946_151104_6608FEE9 
X-CRM114-Status: GOOD (  24.70  )
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

On Wed, Oct 29, 2025 at 2:40=E2=80=AFPM Roy Luo <royluo@google.com> wrote:
>
> Document the device tree bindings for the USB PHY interfaces integrated
> with the DWC3 controller on Google Tensor SoCs, starting with G5
> generation. The USB PHY on Tensor G5 includes two integrated Synopsys
> PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort combo PHY IP.
>
> Due to a complete architectural overhaul in the Google Tensor G5, the
> existing Samsung/Exynos USB PHY binding for older generations of Google
> silicons such as gs101 are no longer compatible, necessitating this new
> device tree binding.
>
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/phy/google,gs5-usb-phy.yaml      | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-=
phy.yaml
>
> diff --git a/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yam=
l b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> new file mode 100644
> index 000000000000..8a590036fbac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025, Google LLC
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/google,gs5-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Tensor Series (G5+) USB PHY
> +
> +maintainers:
> +  - Roy Luo <royluo@google.com>
> +
> +description: |
> +  Describes the USB PHY interfaces integrated with the DWC3 USB controll=
er on
> +  Google Tensor SoCs, starting with the G5 generation.
> +  Two specific PHY IPs from Synopsys are integrated, including eUSB 2.0 =
PHY IP
> +  and USB 3.2/DisplayPort combo PHY IP.
> +
> +properties:
> +  compatible:
> +    const: google,gs5-usb-phy

FWIW, we've had some rather heated bikeshedding at Google about the
use of "gs5" to refer to this processor.

* The processor is almost exclusively referred to as "lga" in code at Googl=
e.

* The processor's code name is "laguna".

* Nobody is aware of the processor being referred to as "gs5"
internally. Though this is the 5th Google Silicon ("GS") processor, so
it makes some sense, "gs5" is not really an official name for it. At
least one person pointed to the fact that it's a tad bit confusing
that the first generation Tensor processor is called "gs101" upstream
and the fifth generation is called "gs5".

* Some folks proposed "gs501" to match the "gs101, gs201, ..." trend.
The first two Tensor processors were definitely called "gs101" and
"gs201" and the next two were referred to as "gs301" and "gs401" in
some internal docs, though this was discouraged. The processor in
Pixel 10 was never called "gs501" internally as far as I can tell.


In any case, it's a bit of a mess. The straw poll I took seemed to
land on "lga" being the preferred name to continue to refer to this
processor in upstream code. Would it be possible to change from "gs5"
to "lga" here? The "laguna" code name for this processor is well known
publicly and it's generally quite common to refer to processors (and
boards) by their codenames, since codenames are often available sooner
than marketing names and also less likely to change. Indeed, I was
even CCed on a change recently where there were plans to move away
from a processor ID and back to a codename [1].


[1] http://lore.kernel.org/r/20251030-rename-dts-2-v1-2-80c0b81c4d77@oss.qu=
alcomm.com

