Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12385C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AN4mliRZzMBrbopGFJvTRuuBl/xk9aFHZyNZB0Spr1g=; b=IKI6X/jeuIFGTYtHtdQMXT5NnQ
	nkKmfz4DHpRU6rhQLv/f3+BfbIANqH+wkzGEdHRRPt7Xd53/HpV7TjNgaDQVv0W/QdF2UTatvvu4b
	UoKrloR5scWfaNeVZ+zw5p+O2L6vYuaYIoZwkoEOGeORORCDqmQQerLYGzZobW2B/fceLtmoLy5Oh
	MlPk7fzqrMWlH1qyKuOzzeZ3h753IEQ4L/VERsKhqzccZZhdW2YJJzwltzL/1LINlWX9OWZjCvqeq
	JXzBvM61dQSS2oTKKmlgrtr4ap7oLG5wQ57BJzee33mN0UT15ahbeQsoeFuEIeM64QalI8gMyrpto
	iY7lnKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsE9-0000000Ct5y-23WI;
	Tue, 13 May 2025 16:11:33 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsBA-0000000CsfH-0zvC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:08:29 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476ac73c76fso66396001cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747152507; x=1747757307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN4mliRZzMBrbopGFJvTRuuBl/xk9aFHZyNZB0Spr1g=;
        b=TGBhC2TsMshgi+VTnXVQeCLrqmuadinDnZFE1LrgIc9COyQz+1KnimcYOhcjeJ5HEe
         oSKTjdkrKQENQAzrteVDnLZ5Xzz8ar8lsvb4iwbANXq72pDQaOx7rfkOvZQCnt/LR6zz
         x++V7D/x4I8RPFGs9CGuE8YbVfReeFrraXY51yzznJjCTbNkwOxvOmYAL9ybtMqq4bGN
         ZccyA99OKBK4lt/b3hdJg5PZVSxQ9NGkD6j7HOj4IerOGt6wyZ5AODvS1xwBjHQull3l
         bX1qnI2//P5l6tQ/XLC2VeUVpeytLzRVhsAZdGeB9wvCgQ2rUpI8QOUXvAJBkshS/uYe
         Qk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152507; x=1747757307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN4mliRZzMBrbopGFJvTRuuBl/xk9aFHZyNZB0Spr1g=;
        b=Ji/vepvLmC0Jw356gYQi2HpWj+IbuRr1ow6NlNdbq/aSFrNln/Dhl8ZAEPgp3IIInU
         sA2dNfaXnPHtPdLe5R3eUb+1q5lEbq9gGuEUSbxnpCU9FyFLdoFiSeNtwoQAn1b4Tnys
         us2X2NNiNG69AZRjQ65IJt3C3BLjlczl+EDF075m5xsvkXhziF2E8Pvi0sYSycoimsTn
         KyPJSNV8HiKoEnj0bsI/P1Wj0OjMzybiBn4h0+V4jbBKpfbsx56Nc+zvq712w9lJsDKA
         Sefax1BfaiiQd4yImvCu2DIm4LrPHOx74fQ4YdhmoVdMrvUZ5ZAjXPkNW0Y4Jh56jjCj
         7VsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuM5Qh6bNmxm2h3t15lmklvLjdfPafTKDg+7rkxno/QKbTnpj+PN9uQftLPFq+mu18/luUWC6u7CWVtm2bpwPH@lists.infradead.org
X-Gm-Message-State: AOJu0YwtpBuHuuhuJNAygVmuSyi2qFPADBKDb0IidVQi75mcmiFZwirt
	bnhy4pVT478pZ1Ii/iWwwuDu0hqJ+n7zzdp4K4351ZnuH6bA2youTydzR+Eaer5oTPPHVtQBFxO
	vEuY3R2DLNovE931QLk+z7DWdZks=
X-Gm-Gg: ASbGncucaa9ek+l5kkVoMC79kJHVeaWAX95jgJcbhTz4rJoUB0cFQRp09QPjQyeL59W
	rSsQjK3P5E7LXUnXK7avyRr/DcXDr54uZZWJo/VWY97hRBWgzDCg5pLXgl9p6CxhkIqTA7yBlAL
	lLW4EvFrcV3NXxcem07PCO3rWkw8PpFLwD6HgM9f21B++5Rt08U0EHuoYy9oe1XWFP
X-Google-Smtp-Source: AGHT+IE26qRcDzjLWk2tHG/kJHrPsKiSz2MOY61Ty7j3aEFGcynoA5b6w5pOfe5KgAmrxejxGAraPScNp/dww8vXp4w=
X-Received: by 2002:a05:622a:2587:b0:476:98d6:141c with SMTP id
 d75a77b69052e-49495c8eb2emr572421cf.18.1747152503726; Tue, 13 May 2025
 09:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com> <aCNqCrBqGSxRGMKd@mai.linaro.org>
In-Reply-To: <aCNqCrBqGSxRGMKd@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 13 May 2025 20:08:12 +0400
X-Gm-Features: AX0GCFvMOIyMn5-4bO-1Iaea5F4lOX7lux6P---Bu9eSzNlomYJ5PbHB5oe4jbM
Message-ID: <CABjd4YyQ1wg4Esd0ZGO-2+WGXkzrqfbhxLMWJ9N8eXTDr4BBgg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_090828_280325_E9BA624C 
X-CRM114-Status: GOOD (  18.80  )
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

On Tue, May 13, 2025 at 7:49=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Tue, May 06, 2025 at 04:16:32PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA/WonderMedia timer
> > as YAML schema.
> >
> > The IP can generate up to four interrupts from four respective match
> > registers, so reflect that in the schema.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Changes in v3:
> > - Added Rob's review tag (thanks Rob)
> > - Rebased on top of next-20250506 to pull in MAINTAINERS updates
> > - Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_bindi=
ng-v2-1-3c125568f028@gmail.com
> >
> > Changes in v2:
> > - split out this binding change from the big series affecting multiple
> >   subsystems unnecessarily (thanks Rob)
> > - added description for the four possible interrupts (thanks Rob)
> > - added overall description of the IC block
> >
> > Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af6=
89cdfc2@gmail.com/
> > ---
>
> The patch does not apply.
>
> --- MAINTAINERS
> +++ MAINTAINERS
> @@ -3467,6 +3467,7 @@ F:        Documentation/devicetree/bindings/hwinfo/=
via,vt8500-scc-id.yaml
>  F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
>  F:     Documentation/devicetree/bindings/interrupt-controller/via,vt8500=
-intc.yaml
>  F:     Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
>
>         ^^^^^^ those bindings are not in my tree

This series is based on next-20250506. Happy to rebase onto 6.15-rc1,
but these will result in a (trivial) conflict when merging the
different trees into -next and to master. Please let me know if that's
better.

Best regards,
Alexey

