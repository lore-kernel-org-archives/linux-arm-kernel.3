Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B56D3B7DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNvqYgBG7iSIMiizE0aJ/ECmeySIS6td2ZjzM3JB2Vg=; b=xdTLmtF7XGc/gGizo6PLacjqyb
	GSXGOvuZpeJTDWhh5d36vTPHUHp/1iWixpFZHYILvQOH8GYT/gNw/SRHoMC9aGIgULIipBDFA2XSD
	AF9ALRbyfM2YxargJfPQW8V34+4rG1kxDFMyuQM0RFQtcGqAKj3daBdr0Fa/r4VrtQNVhOS/O7i57
	p9IpDNKmU3oDjdoEl08OhmL8ZL8VsoalnZ2cmPr+cE6mpLxDwIni0AX3DVIXD4cHCHy7B4jGMA1tv
	t7wA0tiByAILrf7O9HSIc5m1zj9W5fhLGXlysNAko5+XWxuuPuEG/muXaT7779BQsZjyEz9Tn2xhG
	3lRETk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYVw-0000000Cx7j-1h8b;
	Mon, 08 Dec 2025 10:30:44 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYVu-0000000Cx7A-1i10
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 10:30:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b79b9113651so687195066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 02:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765189840; x=1765794640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNvqYgBG7iSIMiizE0aJ/ECmeySIS6td2ZjzM3JB2Vg=;
        b=tXLb+QvcGNdgGPBm1vDOpKv/63tAm/l7OikYv8b1RLC3RiW6P1TXemq84LIDUrfGEH
         KCtIvhFCT9gSu3yLvLAzjPR2/pPSXtQW2AxFKiHn9nzgW5ffJ91xQml2jrOZBQJPrna7
         onY0AfKpbYfNzJ0xWUqdtFv1GnPCUlS2V36AnZUfr1C0LwPhZ8SdCMhMKUT7PDIjIK35
         7IZ1PXGgay7sPUH0AmwoOb4iEe5DjrFapiqGQrWt6IkM9uy9Uc1VC37SODYIDz0++GuI
         Sul3JYflN2AAtzEF+2NuF7ZTPkJC4oqYnp9E1LD43DMzSXXP6mvivBeiFAk2ZORebAY5
         zV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765189840; x=1765794640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNvqYgBG7iSIMiizE0aJ/ECmeySIS6td2ZjzM3JB2Vg=;
        b=f3PJyKhj/2pJU+lhiVhMvQG3W3yeqctxCxp7uJTxDesRMSThEIa3SCe9N8gZ5J12cr
         Q6TxDS19rb62FqCrn9DVEWJoQiS0HvGA31NdM4o751NEPuTM6/iyj76t7zYOvOQFj3/P
         N3tYHwMHeAldMIas6G7XZz+Ib4QeL2stqq2fC274GJXl1pe6/T0HmsiabjbNjFe6/BIy
         z/11I4yCYKjwiGh0eo5VJrYfFGAylkJUnwjz9DkGOYWzH9hXMMdspNJ08eBo5SYZyulg
         js5AHpjzf+WxaCnZg6LSMe/wjiQcvSDhq7reMWBWFTqhvngG78vE1LvhXsJ0ZU7rfy7m
         fOOw==
X-Forwarded-Encrypted: i=1; AJvYcCX5bGK7GC+xFRhoalkg2gu/Ew90jI57yuh2ihx/H3lmiybGdqVbIQa4H+v7Y6AUrnubYgxyCK2/+z27EriVzuf+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+8Sw8yda96Z83C084ouoVwQLXCCDsiYmPuIQkL/nMqiUz6mW
	spzVDZ/GpsHrIRpBZxjeAaZPpxuA3dii4DLZMJkz0heZ/4IOu86v+i8d7cICwTmCX58yGIRoPd5
	yZYYSXoyTnqzLLy/ZMdYuALW6eoffkVXAsGGXtvmGFQ==
X-Gm-Gg: ASbGncs73uAG/52RtnfWXPA7W7jUZJB2gGWTyYRC+EeDEbZeRug2j8T2rQd45sbarhS
	lWGGgd0CXfoIgznYhGAiTUkArFaaeu3HW60tZC5P5b6B8GZxX8Shq5ekgfMCj8rJ55mlzPBu7Lu
	frzLwazsdoIKh/lzUKctD4CQV0zqerHhxQmXHHfPjvMEzZnkt1/ZerYedIZnc8GE+rx49xaf4S/
	0mMMueNAY61j5sdxUOocBm2eIrU72b66INT5XcWesKslkDqAhgV3P2ESfGiSvu5rnDTn8k=
X-Google-Smtp-Source: AGHT+IGTGfVyoL064tKoONxhclX3UfjDWBItbzH79CNnYw055wrJS+DIVrLMSFgzEDdDe4VqLWZokTX1m+LMd5COg2g=
X-Received: by 2002:a17:907:2d9f:b0:b6f:9db1:f831 with SMTP id
 a640c23a62f3a-b7a2432665emr675738166b.23.1765189839808; Mon, 08 Dec 2025
 02:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-2-robert.marko@sartura.hr> <20251203-duly-leotard-86b83bd840c6@spud>
In-Reply-To: <20251203-duly-leotard-86b83bd840c6@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 8 Dec 2025 11:30:28 +0100
X-Gm-Features: AQt7F2rM1STFm1xLFXO9y7ZB3gww-XKs-PW-e-F3Xq1nOQlYXGXTztJZMADERPo
Message-ID: <CA+HBbNH6wO2VWOp1Dn52ArrYg6z89FgYnT3x-jsHsTVJ5xSBSA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: arm: Document Microchip LAN969x
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_023042_468111_5A356E85 
X-CRM114-Status: GOOD (  20.49  )
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

On Wed, Dec 3, 2025 at 8:19=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Dec 03, 2025 at 01:21:30PM +0100, Robert Marko wrote:
> > Microchip LAN969x is a series of multi-port, multi-gigabit switches bas=
ed
> > on ARMv8 Cortex-A53 CPU.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/microchip,lan969x.yaml       | 32 +++++++++++++++++++
>
> This should not be in a unique file, put it in with the other microchip
> arm devices please. Also, the wildcard in the compatible is not
> permitted, only way it'd make sense is if these are different binnings
> of the same silicon. If that's the case, you need to explain why,
> because compatibles are meant to be soc-specific.

Hi Conor,
The issue is that there is no unique place for Microchip SoC-s,
LAN966x series is in the AT91 bindings
while SparX-5 has its own bindings file.

What would you suggest in this case?

As for the wildcard, I understand, will get rid of it in v2.

Regards,
Robert

>
> pw-bot: changes-requested
>
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/microchip,lan=
969x.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/microchip,lan969x.ya=
ml b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
> > new file mode 100644
> > index 000000000000..3fa1d4ed40d1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/microchip,lan969x.yaml
> > @@ -0,0 +1,32 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/microchip,lan969x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Boards
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |+
> > +   The Microchip LAN969x SoC is a ARMv8-based used in a family of
> > +   multi-port, multi-gigabit switches.
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> > +          Ethernet development system board.
> > +        items:
> > +          - const: microchip,ev23x71a
> > +          - const: microchip,lan969x
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: true
> > +
> > +...
> > --
> > 2.52.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

