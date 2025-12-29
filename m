Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFDED3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 12:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0RIAwtADvVOqaERuCW9IojIKIPb3AOQCX/h4YSSMVA=; b=SGr6l1rpzwaHdNRp+lBKEGSUai
	aaEgl/+yLzxxB9bUFxEXpUTCicFzUOV3xmQWWn5mgPK9tHgLD44yMmto7N6b/+jWBbwRK8SpBdLHL
	84cdENq6+jSt+WNhYOTgJNgXK3vtmrpzBoVFF/MYLFTQXIIFSullFQOuH32DDBCVKk/gToK2iLh3j
	jz2Czyy0P1bjj1hHiE6LyYq+fhNbfoIp1p3Vf6wZkEQgE5u6XALTa+h4Ce6hbI5j/v+OfT7X0YvPl
	j2BikcUu/XUCC7Ef8LnZkuDdkpVUfL6hRRTkURwOQ6+ediBpEz8YdyugFrLmx5ovG2Kcm8sUXggCd
	fil3ik0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaC25-00000003eRC-0Rm2;
	Mon, 29 Dec 2025 12:07:29 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaC23-00000003eQm-1GHe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 12:07:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b79ea617f55so1676494466b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767010045; x=1767614845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0RIAwtADvVOqaERuCW9IojIKIPb3AOQCX/h4YSSMVA=;
        b=wPRJGh26TrpZUeq+dPub/G+J00wDqhrLLRgkE1f2D/nYV1IohkAoQDet6E5QMmnUa3
         gyUI6wdhzsUdCo/So8MiKsmsfLjIEhA7wkVyVe487INr9f+lG1QVv9fXxPpHIPHl+SUN
         WqQ4a2ETve6ymggJEkfSf2RQ4/Qn6MrO8wbYHhFOEO4+KLrxKHdBt93LBgS4k90tPt1T
         9w3mLlijVMVOW/WukTVUWbPqb+9qjRLQkDHMMxOXi/iTkciND5G79JNNw8XoAJ8If0Zj
         wlQy6arhHWHJB7TuE+dfgbX51zOD6cb9h1sy1fZ6YsoAXC30MGkQZVIqfE2HACDRhYwN
         bUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767010045; x=1767614845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0RIAwtADvVOqaERuCW9IojIKIPb3AOQCX/h4YSSMVA=;
        b=Zm3icUBo9PRS5YsFGl9fRSTFAtD1ZpNf0i63DFe9MYMZmgRIEENuRo+QX+LtwIGu94
         Hnxf7oq//w/FSDEickihaO5ao1JEs1GG5kZgpe6kQSn2FBIP/j0r3WI+lYha9JjX4dlH
         KTIlP30zdZ4qHiXE4rI5XFWL10rwPSsWGU8bbHg+7nQUfNg5KucNs5X8WgTnItMkCHMj
         4RRuZ0uPg3+rMBZ4O7vYOjKkbkuD08b8varKtxw0NloS9bebkZWahWBGH7KXq793zoBp
         mfzeJ4LMswGzbKfu4yvHmiL4cehhLSa+/wl27SBFt+q89KMZWW6kJ+9QJ3ps+ZjtaIc4
         if2g==
X-Forwarded-Encrypted: i=1; AJvYcCVNr2z1kNjqD1LlIfKlIUPGf86AOPL93ilXRo3EYUY2bYZRsYSU2PmZB2EXF3cMugiyPO8Z/OczCVuoIY5A+p5P@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDU4JnMilLdJDbDGF5ZvQDi7uiyhZQsAZaa0lg3+jwit8dJdk
	3XerVzSXw6wRNuHXv0+5BkYR/8NwmGrGuteFLlvB98yv9TNs6uKQaOnsM+jZfp8O3H85nlIzy/Y
	XwRD58ZVJlkqsKKyM1HNLTuzFeY4letlEwrCQD0jwQw==
X-Gm-Gg: AY/fxX5DOSH49DxEXb2RF7aLP+NFDw6pM6vFvBCH1Rh7PNt3Yh73cO2FhX7ICm0Tf+E
	eNUwtOQcynglZ0QgxBPq1ksoRGX735uM7mly4/GBMvinFqAJY5EGcuMe+F5DNv+/WEfTlolD0ci
	EluVHZqSTy1yJBrNegVarSfLZqP4n7WT9L23WkqIiNAod7qrKE6lP8wlJBH70FCDSD1ytGJE66p
	En0PgNvrlVBYaAgWMQFPrLoebJFXHuajJ/Xwu+CGepQyXAU0oCgOXXLprghvaTSyDFik1iMiX1B
	K7SqIRMBEgNHcaYyznnfHiJOivnIgbdf5UPMRWrIOMmwzpAUNrue
X-Google-Smtp-Source: AGHT+IHwGBZ7fPOTgnv1RT35iaeFO7HZRzkOQtdPCeQFstms7NNREAW/jaHp2F7zdlu800ZsYVpbEuZjGBw4wnDce1o=
X-Received: by 2002:a17:906:2081:b0:b80:415e:5b2 with SMTP id
 a640c23a62f3a-b80415e05efmr2616951466b.4.1767010044222; Mon, 29 Dec 2025
 04:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
 <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org> <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
 <d210552f-c8bf-4084-9317-b743075d9946@kernel.org> <2025122516245554f59e2e@mail.local>
 <20251227-splendid-striped-starfish-ece074@quoll>
In-Reply-To: <20251227-splendid-striped-starfish-ece074@quoll>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 29 Dec 2025 13:07:13 +0100
X-Gm-Features: AQt7F2pkPcBxmyeR-DPcdCGLawGZy7wfoKy0BfxlIeZ5QxnvZTUu33UqbaIu3eU
Message-ID: <CA+HBbNEqq9ZqBR88DFSSSrYw=LBzAreFC0kL88-HZCGAsOrqZw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_040727_383730_A31C6856 
X-CRM114-Status: GOOD (  28.49  )
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

On Sat, Dec 27, 2025 at 12:17=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Thu, Dec 25, 2025 at 05:24:55PM +0100, Alexandre Belloni wrote:
> > On 25/12/2025 09:47:34+0100, Krzysztof Kozlowski wrote:
> > > On 24/12/2025 15:01, Robert Marko wrote:
> > > > On Wed, Dec 24, 2025 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > >>
> > > >> On 24/12/2025 11:30, Robert Marko wrote:
> > > >>> On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krz=
k@kernel.org> wrote:
> > > >>>>
> > > >>>> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > > >>>>> Add the required LAN969x clock bindings.
> > > >>>>
> > > >>>> I do not see clock bindings actually here. Where is the actual b=
inding?
> > > >>>> Commit msg does not help me at all to understand why you are doi=
ng this
> > > >>>> without actual required bindings.
> > > >>>
> > > >>> I guess it is a bit confusing, there is no schema here, these are=
 the
> > > >>> clock indexes that
> > > >>> reside in dt-bindings and are used by the SoC DTSI.
> > > >>
> > > >> I understand as not used by drivers? Then no ABI and there is no p=
oint
> > > >> in putting them into bindings.
> > > >
> > > > It is not included by the driver directly, but it requires these ex=
act
> > > > indexes to be passed
> > > > so its effectively ABI.
> > >
> > > How it requires the exact index? In what way? I do not see anything i=
n
> > > the gck driver using/relying on these values. Nothing. Please point m=
e
> > > to the line which directly uses these values.... or how many times I
> > > will need to write this is not ABI?
> > >
> >
> > The index here is the exact id that needs to be set in the PMC_PCR
> > register and so it is dictated by the hardware.
>
> So not a binding between Linux and DTS.
>

What would be your suggestion on moving forwarding regarding the clock
HW indexes?

LAN966x does the same with HW clock indexes in the dt-bindings includes.

Regards,
Robert

> Best regards,
> Krzysztof
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

