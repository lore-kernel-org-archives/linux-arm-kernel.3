Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6768CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=; b=OYY2jasv7Es5P/VIx7M4zjZAZ9
	nEs1AJnTaidqBVSAK9WKynhAPcNwxcg+xPJfhSYdxnle9mc8QI3WmBdnz6XkxTXxfno7quvs89cPd
	U/2x/glZ44zAnEnSO1vINiU+aQig1S7P2Qq8PYVdlwNiakL7Q9478rXMxqHHCcdtDIYmcbK/fXWc8
	TlxqhzdIKE0ggJ2hCJafwRviDdn10vzL0L/aWGFr75kv4TNDbgWrVnq4OQpMFVo3LPGd8g3pg9O/k
	+0JOpV8j62kRgYBBem44obtPN6jW2eEuk3H1U9BVOfwCkcHfw1imYvdGlBG+fST0i0DN8HGWfwwfK
	KVKgxbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFYF-000000087Lq-3651;
	Tue, 21 Jan 2025 14:48:23 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFWx-000000087C5-0BGA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:47:04 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3eba0f09c3aso1639612b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737470821; x=1738075621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=;
        b=drJJoZ8WfPlSWcrN5qnzVDLBXZpsSSAG9fRXEzoD1KTjLZCsPlorh4/hQ6yCyTQ3gL
         xI3zoTxaRbKSDOcjXFrvnQ90q/pKjzImutQnW/cONPWD7tagRvlqVqms/men3gN7WCSe
         WSnyoH3R2sOZhPyUpxHEq8FFix+71z9IpH+u/2D2Z4EXgU5ipQUgUJ4z/Q/LaNuGVKSS
         wY3Y7ltbROVZIecw0N6ZuMB7phZLL/0WUCetE1tXjtE1d2cKZjMbBONEvQckYXoiY1Ux
         +QDkC5WR+AyxZ/PubHnIJCZoE84v9KgM3LMo9EA+ZFNi4s6MKHq83wOhQarVUQEhuOEV
         /3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737470821; x=1738075621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yhhp0mRWZvKHvJLLfnJ0LjeNwmaLDCHbk6JWfbHtLI=;
        b=GFXBZdc++8z7Apw/32M8By4uUqoAcrqqweMbr+uTC2+nsPjMBnxw+ryapVev1Eb61x
         oFN9UUZbvFN0CDgBHRPdt1HAvhjdVp4vNWH6ByGDTNsxFvlKw6ZOdXw6S38JC+YGVRpk
         zIBQMapQOR2oEfpf+iDfPXf1Zq9SwHCfACGwwUuMa7qNlRTmjyG9hH/dSFu67uwWO9n/
         NUXnyWbs03tyrHLhsaa0vJ/PGJjCGkJo5gppRggWasVzKpfU4uvVoG0fLTyhSxYmlbrZ
         CSimIuyywsIuDEeS3S7chrSqOZC4tzBlS2MoDUzaT5aKNtNevwD6jaq/M9dpdVnbJ7P0
         y32A==
X-Forwarded-Encrypted: i=1; AJvYcCXqD4LfDM+wxY8jWX3cN9hSTT8U2kNUrDfcjC3XI2aP+/kTosmQDpwNvG3UxIJXzFrSepxnF/fPesD723rmrGsp@lists.infradead.org
X-Gm-Message-State: AOJu0YyRaKMyFm+IWILdmV+Jx6yB15DS9v15VQ9OyIpznJMlB0nW9bCo
	8JpcwAcU8/OM9Ed52cur8LHA3kzeisU6orbWzHLeFZyJVpeJ3NMv3oHLlJYbiS1K5ojo+5WYcqg
	oUSSB8ES/qho3l/rdAKWc72bQUccy5BIdRHuVHA==
X-Gm-Gg: ASbGncuTyoWc2lnXBv8bufb7fTRW/4vNR/I4KU/AmowZ631G8h0MUEfBv9nUPeVlIek
	RjpzAEIa/uRnYgwXlxcLul93kEegHch+pmqH8H3PrfYgVEE3H5okX
X-Google-Smtp-Source: AGHT+IH2CfYbF8hfXPnykYK8fykXtjqZXBYffL/Pjc2tKlK1mKKJ7qDc/3PPOkRKkkj5qhUhL1/Cyh93nu3VEPBCrq8=
X-Received: by 2002:a05:6808:800e:b0:3e6:1ea5:6b30 with SMTP id
 5614622812f47-3f19fcc1560mr8171055b6e.24.1737470821566; Tue, 21 Jan 2025
 06:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org>
 <20250120-pinctrl-fltcon-suspend-v1-2-e77900b2a854@linaro.org> <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
In-Reply-To: <4ac64a481d80785973d038b9292a05781e70a670.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 21 Jan 2025 14:46:50 +0000
X-Gm-Features: AbW1kvYEUqxUBeGd3VHQBBcdayPXs-zQHZichg4BXm23UKs5sRmwc2OmOQH-Bg8
Message-ID: <CADrjBPox8ZXRPSAsAxbPqoib0dgpgQXQF+5grPguujYjoOiy7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_064703_106749_7E806DEF 
X-CRM114-Status: GOOD (  18.16  )
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

Hi Andr=C3=A9,

Thanks for the review!

On Tue, 21 Jan 2025 at 11:20, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Hi Peter,
>
> On Mon, 2025-01-20 at 22:34 +0000, Peter Griffin wrote:
> > gs101 needs it's own suspend/resume callbacks to use the newly
> > added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> > registers. It also differs to previous SoCs in that fltcon1
> > register doesn't always exist for each bank.
> >
> > exynosautov920 also has dedicated logic for using eint_con_offset
> > and eint_mask_offset for saving & restoring it's registers.
> >
> > Refactor the existing platform specific suspend/resume callback
> > so that each SoC variant has their own callback containing the
> > SoC specific logic.
> >
> > Additionally we now call drvdata->suspend() & drvdata->resume()
> > from within the loop that iterates the banks in
> > samsung_pinctrl_suspend() and samsung_pinctrl_resume().
>
> Maybe split this patch in two:
> * first to do the refactoring plus adding exynosautov920_pinctrl_suspend(=
)
>   and exynosautov920_pinctrl_resume()
> * second to add gs101_pinctrl_suspend() / gs101_pinctrl_resume()
>
> This way, it's obvious which part is the bugfix and which part is the
> preparation and I believe it'd be easier to read.

Sure, I will split it into two patches in the next version.

Thanks,

Peter

