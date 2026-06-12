Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60FBCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 01:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=; b=XtHaknvmY7cG7GpsYDWdDTcsrD
	5tIEIFOFKgo7xLKPgJv4YCyl1zRxttTpalgir53wUK6r6RNCEZxu6CBH9SJjWhPYZCKTxTtsgOpSH
	BDiNK3IojKEt1oU2LBuGNHgnLBLh3QbeKMmaACUtGOFaCqvR7pcvy5RtRKYG7eBu8kMnEuor7DsTc
	YvtNP3cDZb6NB+i8NI0jMadSXMtUiwec8vYRSaZRB0YXF7eVvInsB5gbTtPSpA7vzzUhAB1WyYQKG
	tS7W4T/KquxY8mkPrmtTCjNayrm9uk9nsuqfOTW7Z+gbNPKZz+6tqmt24I+dXRO2G8M4QVZe8yNSR
	Y2AvDjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXqX5-0000000AFaA-2VAI;
	Fri, 12 Jun 2026 01:18:03 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXqX3-0000000AFZe-0VON
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 01:18:02 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so3339221fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781227079; cv=none;
        d=google.com; s=arc-20240605;
        b=IFSNR8l6WBRPvXwg5eWf5vDCQkwmOsHCjvqvJ0tN+HaZK3V752+hyNAxq8RGmVP02q
         8cuJYahLKZoPJqoQVZ33CI20efqJOqoEnUTVp79GdqYS60G4M6i7v083Uaf361LRdHbd
         hjUQv9K1nfYt5nM7TjWQcQdURvs98rv68i6nX3w2fGzlbtf/tShqoYZsdTNPzJ8SYIAd
         o7qIQfeHqvsKI78FE4p1egd1Th4gzJvffwRlOW5ZuXu4eDbNenPOc2S+XlZkvuJtLCjy
         YF1XCYZiT0qkEM61ydCvD8zgqEoSSDEml4FsSgJ8T0ENP21XucOdLHBd9DrEMiflihaC
         f4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        fh=5y3jhPLL04r0sMYybWo4jgsDhm/R2a4wAs7MUHNbrS0=;
        b=deHxcE0keHRvu600jKSAs6ja799OTrIGuljVGDyxSOfUECd8khKkxmm4p9b/IKsQwX
         2UmDOj7MXX080/kvPQ9/+Doc55unsZvxfsEbXtJJyq8weSreHi5sCc8hiyBd1Di6qetu
         A5Owvk1irbkZ76+tbY8uzEHbjWAjJGLXs4cUp7RUNAq8KT/uIqUv3cIr36r7G5mxpDlW
         PpIZTm5EgqGw3YnKkB0lECHwyFAApc48WQQhV05NT+r8CDIg3wbqrwYp7Jij7RF/wwd+
         UmtfYmx9HJeNVDDmcY7pDMLZV9wd8BI+ESLxQpDyRPrIHfD+FzbmQNzgFKopTYJYPEkM
         QnPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781227079; x=1781831879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        b=Z09jklos9gJ+90sVJMp3OZ3py0xYsGal86FvxLVk7D6jFeQkzzzO1+hiS4VnT8jn5/
         4ybkWtQuwFdAYxm3QR95gmbgdMtbpntN+eCYzjswX55zeywgsencef3q9MOpez0ny2TQ
         anE8oZBIJ6ZoGJ2gQyNtnid34yIsyY78LzB+BVKbIEpKw6C445lpG9tCsfljFNhO2H5q
         hVl9hBHRblOOIywKUadnogyFay3R07K4ZJjCbypKLTa8CCjan7EEWTJg34pz9CzfDBTG
         MPja8APPvyI8GvbktEWfXLyaYUQfjhtIGAI31gbRgg56zfFPFlFbM8j/QXDHunqepdsa
         ezRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781227079; x=1781831879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        b=fszfkkOLKja5JvdhetDY1JDlbue0uChBKdhHTymTL7d8S5EhxeNy2Uc4Y0jjpQBI6O
         0g+Pob2JtY4LiLc5K4eoaiMjhYEy/6haXiqAmR0jrzi5dze8qIJ+07hiQeiVrdJc/Jmq
         yAArQEUGL/+g3aZjBnuR4PQoQfRnLECuNBrCts1egmjhJD/JzJJeEOqdbHX1Ir03wC4T
         q5U1crSsF7cMMhDtnFWuBWIqqUHmyo3sNbGLNFzXizKHhGPHbQrxg0MprA7/FNd4sXgB
         43jr3aS1biM0s7kJC3A2KhgdyD6ErXmmf7nt+IFFsGpAvPTDmvXEYGvo8sPw6kK/A4cB
         /cug==
X-Forwarded-Encrypted: i=1; AFNElJ9VdvlFegfkn/Hkpn4AYBe2Jj8UMEZR7+QpV8CpC6GwUz/cmNbaQPAEcclX/Rd8IrKtRKLpcl4AEPXaCnwGwKZE@lists.infradead.org
X-Gm-Message-State: AOJu0YxLecsruZiBlAFSI8jqI/DJMAA3tIVA6AnXnQQnCzusZ5ePj0Cw
	Kt7cPudhr9YREIFQBOkZHPsg4+zfqwsPgMooakhNbQbBoKPg/bo5p+RXkunZqEpcNsGi+xTfmc8
	4IOZ2iyp9HBptSwuU1tVuhg/RemRoRaQ=
X-Gm-Gg: Acq92OGEMbI6E69wIsEXpY80aFfJrPxkNKwUAtlSwBtwBzLo1hBko03PXZ95WqitK+j
	PC2HRkDCh2JgPA286O9deCY2tscAB5vTqyo6Buv/mlPFp/OwildVIG70nwYxbBrc5ywBLukNGlm
	ADgvHfFqJYH4tcGnXdJAi6tMW0FJTl2Bmq8kYcrf3h12qeHXprFotw+yIVuj1hnG8Z4svhVEElk
	ixEP0UgMhPE1SZKPPftIzXBkpD7wetGwoN41yQ7H9ymPaCeO7MtEUMxmvu8JrlZJhwRyQGamuJe
	nRHlY0tZ
X-Received: by 2002:a2e:a99a:0:b0:396:7927:2d14 with SMTP id
 38308e7fff4ca-3992afbd66dmr1406371fa.8.1781227078553; Thu, 11 Jun 2026
 18:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com> <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
In-Reply-To: <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 12 Jun 2026 09:19:28 +0800
X-Gm-Features: AVVi8CftlH_ekg-tghtfw6NJS5VaORcKvffCfG_52e7muOzHwhtMeakE4Fesdbk
Message-ID: <CAF7HswOi3fPMFppPoGmh0QELiPz4Po4cyWuDrEHLY2vNMyKE9g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_181801_176411_C25522C4 
X-CRM114-Status: GOOD (  14.60  )
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

On Thu, Jun 11, 2026 at 11:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +     /* Marvell 88E6393X EEPROM */
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c64";
> > +             reg =3D <0x50>;
> > +     };
>
> How is this on both a host I2C bus, and the switches I2C bus? Are you
> using multi-master? Is there a GPIO to hold the switch in reset while
> the host access the EEPROM?
>
>       Andrew
Hi Andrew,

Thanks for taking a look at this.

To answer your questions: No, we are not using multi-master.
The EEPROM is physically isolated by a hardware I2C multiplexer.
By default, the mux connects the EEPROM directly to the Marvell switch
for its routine operation and configuration loading. The BMC's I2C bus is
physically disconnected from the EEPROM during this time.

The BMC only gains access to this EEPROM for out-of-band firmware updates.
When an update is required, the BMC or CPLD asserts a reset to the switch,
toggles the I2C mux to route the EEPROM to the BMC, performs the flash,
and then restores the original routing before releasing the switch from res=
et.

Therefore, there is no runtime concurrent access or multi-master scenario
between the host and the switch.

Would you recommend adding a comment in the device tree to clarify this
hardware isolation, or is this explanation sufficient?

Best regards,
Kyle Hsieh

