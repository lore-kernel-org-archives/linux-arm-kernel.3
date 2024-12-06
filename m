Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1BDE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dpoHhnnSqF1AlwYKD5E4gHGT3XutAgIPGhaNKW/0HU=; b=iFSipWsxdpkOSiPY6iNfF9PWEZ
	GWJdVDiFuM6zX42pJzUDi/AUfDvy/7Lg7TKel0cv0XRANvXlJ5Qo2qSIwwlQB7xBzmUqDM6AVAT+b
	6RGDuPNCpYZI0RY6r2mV62xa6PUHIuFQJbsKNtxH+s6mL2Hzi3gPdtA4WxA1e8CnoiONZ5zC5SYUS
	StEV5gP9pyzOJdtcSeqzLvFgJ2YvEVY/AcjwlEuUx9opxEYt3Hr3vuEA82EBDSndmkQyrsflYGTDM
	OqsoAXc/3Az5Amj0WlR9mmxAFRXFrNh6Q1iITyo5hyGW8GBo/Agsu71z4o7TgxcHSxQXr3pFKwtL9
	MTYupPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVvZ-00000001Mcq-2txn;
	Fri, 06 Dec 2024 10:51:17 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVl6-00000001Kks-3Jkq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:40:30 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-29e5aedbebdso986386fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cornersoftsolutions.com; s=google; t=1733481627; x=1734086427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dpoHhnnSqF1AlwYKD5E4gHGT3XutAgIPGhaNKW/0HU=;
        b=d05xsZfv0lVEYiDIdpxnBNVJRnvv6dIlHbrdZHNiV6PLJXpmJVcnRqcaKXfx3xV8GE
         Hxn9uHvVsvlRyvfiFLfwidSpbkEloXD9+rfiMEesFM2kdyQYT2zAGNo/RR7OfwI4yYOm
         8Jgw6BJgOgd/xneyXeFqe2u4VzXewt0eXPQvrvoQsLfDeMdK13d1UgkQpr5eatKDU1wz
         EVVmeWe/OoyY6Tn8cDsG9cAoRnn+2xjf5ZyUo3cwNdgsHNmt5hsFp69uVTbTe9OhxT0t
         BiRdplJUZGGvWSdB1ZGKtIC+qL2hspV2Y5xXA7ng+sJW3xi9Qbz4q4E/X8qLfSBsYtQj
         b37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733481627; x=1734086427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dpoHhnnSqF1AlwYKD5E4gHGT3XutAgIPGhaNKW/0HU=;
        b=OgjVQUscfmHERU47R1prbocY8U8RuUrOXK2gGoH1IGmwb9NN9eIXrLQujermu23LBu
         zns0lOUym4IZIYKpH3Tr0fmDgmLbLOlfgYQZ55L3FWLaxOgkjRx128jymJw1Be6XsYfj
         Zj0DjmQoWWpaC9lZpRH4H14WpikefKfEy014WIJw6RJ53XpZAKLuMXycFKGeE2zjG5ME
         G1mGc33U64ltouvOzjxZqFVYmn+OxHmA7e2i1CbIRx2ntNsvluZfcXWWnuRvXhGrwxUw
         EMEx1CPJh99V+/+AxArBUDN8J9zgjo2uqTIAfyoyThoYAehvtCuNx9ELlYCCWAcE218R
         vw8w==
X-Forwarded-Encrypted: i=1; AJvYcCUEGo0qIjFn1zQXVuboA68MdcDGRBZlQyJdm+o4t8n0+CrTbyqVIaJHtH2ieJanurtPmY0vxf8Bu4hWH00p8ovf@lists.infradead.org
X-Gm-Message-State: AOJu0YzU+UZN5bcItdW+kO+JUGdKewnVCSCrP7DDJDsuV2wQAvnG4sjp
	Vrjkkv1O3zYxmG/27L0E1qM4U1KqjxFg2i6mj3lUtYLf0KGCHk1NQs/gV9yRRB7b9hYj5wq/QDz
	lO2iRN6lOj0igG0WraEbbzkMbZdZKITgFfcj7Cw==
X-Gm-Gg: ASbGncugmATE3SkV51dXnRB/3k//a0WYGr8S+YMnnmWsD8Y10XwkqapRzF6h2+4p+px
	TbcV7ntG5CrzFyUScvqq+Fgp+rvoNTrvU
X-Google-Smtp-Source: AGHT+IEEgtCpiEfKyepoSM+/D8HoOWbGc7v8g0uhiFB/aNLSdUw6Ym7nLZpksS0y4DeVwr2P94N5ssZLKnJh8nBacmA=
X-Received: by 2002:a05:6870:c69a:b0:29d:c832:7ef6 with SMTP id
 586e51a60fabf-29f735d53damr1234503fac.39.1733481627713; Fri, 06 Dec 2024
 02:40:27 -0800 (PST)
MIME-Version: 1.0
References: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
 <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org> <CADRqkYDnDNL_H2CzxjsPOdM++iYp-9Ak3PVFBw2qcjR_M=GeBA@mail.gmail.com>
 <28d1bb46-ab18-42da-9ca2-ff498c888d66@kernel.org> <bdfeceb6-962a-4f20-b76c-4fe5e5ff80c3@foss.st.com>
In-Reply-To: <bdfeceb6-962a-4f20-b76c-4fe5e5ff80c3@foss.st.com>
From: Ken Sloat <ksloat@cornersoftsolutions.com>
Date: Fri, 6 Dec 2024 05:40:16 -0500
Message-ID: <CADRqkYAg5k3xM81-qBBiiLsvVdJCGdCVyAJgEexMw4s-1PeQkQ@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add description for
 dma-cell values
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, dmaengine@vger.kernel.org, 
	alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, 
	Ken Sloat <ksloat@cornersoftsolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_024028_933150_5B294E48 
X-CRM114-Status: GOOD (  23.81  )
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

Hi Amelie,

Thanks for reviewing

On Thu, Dec 5, 2024 at 1:06=E2=80=AFPM Amelie Delaunay
<amelie.delaunay@foss.st.com> wrote:
>
>
> On 12/5/24 17:09, Krzysztof Kozlowski wrote:
> > On 05/12/2024 17:07, Ken Sloat wrote:
> >>>> + 1. The mux input number/line for the request
> >>>> + 2. Bitfield representing DMA channel configuration that is passed
> >>>> + to the real DMA controller
> >>>> + 3. Bitfield representing device dependent DMA features passed to
> >>>> + the real DMA controller
> >>>> +
> >>>> + For bitfield definitions of cells 2 and 3, see the associated
> >>>> + bindings doc for the actual DMA controller the mux is connected
> >>>
> >>> This does not sound right. This is the binding for DMA controller, so
> >>> you are saying "please look at itself". I suggest to drop this as wel=
l.
> >>>
> >>
> >> While logically it is the DMA controller, this doc is specifically for
> >> the mux - the DMA controller has its own driver and binding docs in
> >> Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
> >>
> >> I can reference st,stm32-dma.yaml directly, but I was unsure if this
> >> mux IP was used with another DMA controller from ST on a different
> >> SoC.
> >>
> >> What do you suggest here?
> >
> > Thanks for explanation, I think it is fine.
> >
> > Best regards,
> > Krzysztof
>
> This description was lost when STM32 DMAMUX binding txt file was
> converted to yaml:
> 0b7c446fa9f7 ("dt-bindings: dma: Convert stm32 DMAMUX bindings to
> json-schema")
>
> -- #dma-cells:  Should be set to <3>.
> -               First parameter is request line number.
> -               Second is DMA channel configuration
> -               Third is Fifo threshold

Thanks for the info, this aligns with what I have

> -               For more details about the three cells, please see
> -               stm32-dma.txt documentation binding file
>
>
> stm32-dmamux exclusively muxes stm32-dma channels. It is not used with
> other ST DMA controllers (STM32 MDMA, STM32 DMA3).
>
> So it is fine to refer to st,stm32-dma.yaml.

Ok, I can add that on v2

>
> Regards,
> Amelie

--=20
Sincerely,
Ken Sloat

