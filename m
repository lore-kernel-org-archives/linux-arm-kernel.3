Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EB2CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/Nb3WWvH/1mUIXPrTIH4b2yaDJsbnyCRLr9hPVOhPI=; b=uGc5rZbhyJVvP8PzxdYxsTRcji
	HrLBQtXsYYcm0Fn6c3fDFoKdZ4vFg3i/g2N+4c6m5JWXOAcKbvV5IkxL0QSDoKpAf71ZaesXgkkC2
	T3fMafzgeWRpxJrxSA14rPtuse0y5bVEELyuprtdPU8ic6959Opbu+M8HG4k0klC5HV09f1Xq7JjM
	R3esxbHZxQBlj+iCE6jJ6qLjRdLsRANrB+vcMdUpFCxRpih679mfL3XbW5qE8RVLfNeYEoB1hv7HS
	xl1mqTg0XzxMGr0hMobACcElssyKyvIZ0zBE5NARxjxOSXGvpYi48iEG5x5BOXGm2wsb3iGAH1djC
	vJE9RtQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgOK-0000000Fgjz-07no;
	Tue, 28 Oct 2025 09:53:24 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgOG-0000000FgfO-3vIl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:53:22 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-44db1c1056cso1232826b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761645199; x=1762249999; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/Nb3WWvH/1mUIXPrTIH4b2yaDJsbnyCRLr9hPVOhPI=;
        b=aiIEh1MWf4llWhiRHhVCjFhqeH9+XZ0pp770BwA2ZTtJ0dZwHNS0wNbzoLx+X8JobA
         U1BxaF81hqUqzSKKABnT95gdPBh+nvKV8zf5YYBO3YMA7Y8gPsVaEzzZZUaOcYrtRjwq
         2xRPmh9ttM3+/+/KMmVvh4ZUKABpwAQgiWNTugp/cBsgThh6OI92mhhPR9GOkBy5ICmV
         /jOi0aO5/ZaKD6EnXBX6TheDXFIphadPVGGXjRipVi4BoJXJl2C2wjuGXSmgyRJSNWOK
         18Ji6s5b56r164FnZcKlDcBE37maetj9GozWOw5m+7x9PXySNmjpSaZXAO6iw1f9vMsC
         5r9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761645199; x=1762249999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/Nb3WWvH/1mUIXPrTIH4b2yaDJsbnyCRLr9hPVOhPI=;
        b=arSZY9CJdjIl7tmQ6zkxRA/QyOM+iuK/EGTc5ue3Lao9f5qji532VNn7b9TejkRNuj
         1ltI0BDdIVAv9AJ1xSRC35U0khWEMO6JMdbbjE5qVy6V2sIoUcfndx7jr/340N6I6Cfb
         1/Y7vM5dFoFEqR++CrC5oRHMfgjtvPVXrPAfio1SSqIvNL9R28NmePAVR8288cgCfceC
         grXlnatufvwKzVOPsNZ2cc6KvggNQk7eOEWN6rFAkjUzlK4mXQzpHynNvOIRXGRAw/2C
         cpWk/ugbW0aeywmdHa/kXB5SThl6U2RPrWOZ7KQw2dQoC3Pt1ONNG4UaoIR5SBAEGCIG
         sb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQpAHENtmKl8rdxaGqgY5VLYwo1N1FUQugM/KlOBxox+zgT+rnf0UOLszHctTk/e0cBU+JXx3Swhzgwu5o+lPN@lists.infradead.org
X-Gm-Message-State: AOJu0YxTNccu3jhTUYSE42gzjFyf57j/IgEbuswVg7c68eItPhyh/1Rx
	E9l530WQ8qLik+gvkvPpOCE+s3NIgdzRsf1SFBA8u/FGaTVG2DLfmy1PstTZcZ+5eaNtt83xfwp
	MqeEJ5dhlaWTSAJ5Q/tkzUZMmY7IApSQ=
X-Gm-Gg: ASbGncuvEk11EBLjvkSOqvZXFRRFExl4z1SEMDXg89WSLYiDX3wKCim16vrixZlIfl4
	K2GUta3kHCV0R7SFbCPfOpUse3MwKw2ZkgnF66DQL7SDJId2VUl1SGRIytXfNW+06jpyYIdcPwL
	RC3iMuUoFV6B8uKcrXrDnAbJ+dGGKcgVwhWjAAceyjluVlhrhmwVQJ8tzsnnAZhpCVZAVK3cqNG
	5jIa9dTDyryt/5gBe/6DtrV+IIjszxE2qFVkBEf8fNx/E848L80cFVK0+It1g==
X-Google-Smtp-Source: AGHT+IEbWmUMugzBeIPUgI1/BsJBgV+0SWoENDsfOHTRTsl6JEQadKCa6qWvaTqxnr9sGbNnfs44CBd9zTl5zKommQA=
X-Received: by 2002:a05:6808:320f:b0:441:8f74:f0b with SMTP id
 5614622812f47-44f6ba984f6mr1130597b6e.53.1761645199645; Tue, 28 Oct 2025
 02:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251028031527.43003-1-linmq006@gmail.com> <0103d31e-f7f8-45df-9add-76adcca3ec40@kernel.org>
In-Reply-To: <0103d31e-f7f8-45df-9add-76adcca3ec40@kernel.org>
From: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
Date: Tue, 28 Oct 2025 17:53:02 +0800
X-Gm-Features: AWmQ_bkMyjcKORFWNp8J-vJD4NSkB71CvF6mfPoA-5wZktbAILoRLRbfvGQOD3w
Message-ID: <CAH-r-ZF9r6hoDOBak5pj7Q5+2wmFto=onHF4_Atv1qcyVjbeXA@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: fix reference count leak in exynos_get_pmu_regmap_by_phandle
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025320_980147_56F522DB 
X-CRM114-Status: GOOD (  11.71  )
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

Hi, Krzysztof

Thanks for your review.

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2025=E5=B9=B410=E6=9C=8828=
=E6=97=A5=E5=91=A8=E4=BA=8C 16:42=E5=86=99=E9=81=93=EF=BC=9A
>
> On 28/10/2025 04:15, Miaoqian Lin wrote:
> > The driver_find_device_by_of_node() function calls driver_find_device
> > and returns a device with its reference count incremented.
> > Add the missing put_device() call to
> > release this reference after the device is used.
> >
> > Found via static analysis.
>
> What static analysis? You must name the tool.
>

I use weggli (AST pattern search) followed by manual review.

> Anyway, same comments as before.
>
> https://lore.kernel.org/all/?q=3Ddfn%3Adrivers%2Fsoc%2Fsamsung%2Fexynos-p=
mu.c

Got it, thanks.


>
> Best regards,
> Krzysztof

