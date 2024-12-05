Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30BCE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOckcNe8W3RQKx65UzBFy6XStXAxVc8nCNjDX8cXNw0=; b=Joi9VxX2kn12T9pVOtKOyAMmBL
	gkfbISo9aijHuUWzRTvIH59KCdpkjEuDY36slz+6MCzQ7sIPseYp9apmHRimY5IysZi0x/DdpSmc1
	KjvtcZgKmd9NvNLHsL3HCUsyJ4y5BUPPmqTfMlZWmmJdW++2zBmweebP9V1dNQZh+TI+GX4pKOKQi
	EtLGjqJCzfjh7YI0PjdUN0hJuO044zFyEuIRpMW5kBXgDRTQInynI9kIdio4TPSl6m2N2QQWWOMyl
	JNh4PcXKaYL5mHzzUl1VJKFUTQzbevQRPsaFDciyYlujFL4yuDURyjwV+HmUotEA4UJsgq1eiTB4T
	9bQ/3Yuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEP7-0000000GgiI-0Bgk;
	Thu, 05 Dec 2024 16:08:37 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEO4-0000000GgQh-3jfL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:07:34 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-288fa5ce8f0so331261fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cornersoftsolutions.com; s=google; t=1733414851; x=1734019651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOckcNe8W3RQKx65UzBFy6XStXAxVc8nCNjDX8cXNw0=;
        b=Z37S69OgTYLaFw5XA2BsoOqsv7inJpmL/9uy77atwuzOYlpmdqLIAjDQh8VMeZN3Wa
         jftcPVVYDskdM1M1/Mcac5qzXvdiBZxvGiFjQjnBuytPfElHXoG9bZNKfoyzhd36hhg1
         Lz/Iwse6Hhq17f1ABmW/bfMETLg7ktZnIQKgDvz0Wpo01ndKrHS16NS1MWYG1TOqcBIH
         toc7fbf4aGIqjn/+5vZa89Up5plpDUpRoqYoBU8TOb2DBgERs7V7Y2PLLlnsfBzwaKKn
         0sO3qTvAFoY7qhBdivSpqilRNLX4en43y3JeBuszTAivaJVRFST9vABj6P7VzE7uOef1
         frFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733414851; x=1734019651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOckcNe8W3RQKx65UzBFy6XStXAxVc8nCNjDX8cXNw0=;
        b=aQ7RXmx9naA+EbNzqmvMzZ7ix2uG5ehr4TVZ3zjoYqosyk66GfYg2M1tuPfvo2PKfI
         eeAQgag0pxVa5bbq3VcBV7phYUSy0EpkbUAS3WkLAJ+zVAwgXcz4sMNEOqt70ZaXDxZz
         EeJGLZZxhdJD5NgppApVnZz8ijuH3CZHUxBUuFi2zhPlTI1IKAI0t5uv00ULY5vStKnD
         aSy98Vk2V89GsrdqKoppXPT+8xuZC++lLpQ6603wwgRFi9StSRhOuZZqvf7UomtVTAFp
         qWsUIOHblSO8noj6VTrtKJvFt7fhPjnEEpURREOFAdUojMqeWiadVkZ879sNXCnBm8pE
         YvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1NDF/v1ud/LDiyt99rij0mL5RCIjMIcqhsSYAYXoyqVrRj/S8ANJeVBwrMrOkehrqxfM9empNBOrldSNN7Yva@lists.infradead.org
X-Gm-Message-State: AOJu0YwEEs7apPHDwuxUxT/mUHZBjWeqRBJH5/9IYkWOv3vagtfoo0Dy
	AlWl0Ux9OiGd36WNGkaPcOy9ACOjSOvdzZ/0nnJqTfA+geRVoJxHBzV+qAxiHGi3FZr32vK1l0f
	nTXrw2EueBCn3PpyRF1VT1CML3uH5O/MtBDX6mg==
X-Gm-Gg: ASbGncv4G4N7OXGDnkOrNLsZ7MMf3O39QMhPSHwOHFZ3yDezsk3rMOjyfvcWE4KzVAa
	BMiGvPGsTp9fwdsfpqbwD33OHgX7L4X1R
X-Google-Smtp-Source: AGHT+IFc4uqMYZT0SxPqLKcDtYnZCPI05fbA21AsNVCAy81bsUwRL7Rs+7Wfd6hN5qQc+lT4SQo91gDOIfd4QY1CTs0=
X-Received: by 2002:a05:6871:4b83:b0:29d:c832:840d with SMTP id
 586e51a60fabf-29e8890d522mr10222701fac.35.1733414850886; Thu, 05 Dec 2024
 08:07:30 -0800 (PST)
MIME-Version: 1.0
References: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
 <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
In-Reply-To: <d53538ea-f846-4a6a-bc14-22ec7ee57e53@kernel.org>
From: Ken Sloat <ksloat@cornersoftsolutions.com>
Date: Thu, 5 Dec 2024 11:07:20 -0500
Message-ID: <CADRqkYDnDNL_H2CzxjsPOdM++iYp-9Ak3PVFBw2qcjR_M=GeBA@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add description for
 dma-cell values
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	dmaengine@vger.kernel.org, alexandre.torgue@foss.st.com, 
	mcoquelin.stm32@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, vkoul@kernel.org, amelie.delaunay@foss.st.com, 
	Ken Sloat <ksloat@cornersoftsolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_080732_937532_14723BEC 
X-CRM114-Status: GOOD (  26.37  )
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

Hi Krzysztof,

Thanks for reviewing

On Thu, Dec 5, 2024 at 10:59=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/12/2024 16:32, Ken Sloat wrote:
> > The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> > for the actual controller. These values are currently undocumented
> > leaving the user to reverse engineer the driver in order to determine
> > their meaning. Add a basic description, while avoiding duplicating
> > information by pointing the user to the associated DMA docs that
> > describe the fields in depth.
> >
> > Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>
> > ---
> > .../bindings/dma/stm32/st,stm32-dmamux.yaml | 11 +++++++++++
> > 1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamu=
x.yaml
> > b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
> > index f26c914a3a9a..aa2e52027ee6 100644
> > --- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
> > +++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
> > @@ -15,6 +15,17 @@ allOf:
> > properties:
> > "#dma-cells":
> > const: 3
>
> Your patch is corrupted. Please use git send-email or b4 or b4+relay.

Sorry about that, I will do that. I will wait for any additional
comments and then re-submit.

>
> > + description: |
> > + Should be set to <3> with each cell representing the following:
>
> Drop this part, const says this.

Ok

>
> > + 1. The mux input number/line for the request
> > + 2. Bitfield representing DMA channel configuration that is passed
> > + to the real DMA controller
> > + 3. Bitfield representing device dependent DMA features passed to
> > + the real DMA controller
> > +
> > + For bitfield definitions of cells 2 and 3, see the associated
> > + bindings doc for the actual DMA controller the mux is connected
>
> This does not sound right. This is the binding for DMA controller, so
> you are saying "please look at itself". I suggest to drop this as well.
>

While logically it is the DMA controller, this doc is specifically for
the mux - the DMA controller has its own driver and binding docs in
Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml

I can reference st,stm32-dma.yaml directly, but I was unsure if this
mux IP was used with another DMA controller from ST on a different
SoC.

What do you suggest here?

>
> Best regards,
> Krzysztof

--=20
Sincerely,
Ken Sloat

