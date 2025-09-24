Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BCFCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 01:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZsVlg5OxPMiXZWZO+qrLbc/alKsBFgcyv9irh3N5VY=; b=huQDKsWh7k40r10FnitaW0gbnZ
	V+lqauNxGM9tG8FYrXR21CVmfxkrCOZ751kdCQpiCK5I3seKdDp0GYpEWMpD3Vzlp8FFQNgArUcON
	iiaerfn3h0XUB3dIk5e/Rbpg+CPYhDRXzrSLhyL/+9gZReBhTWK+jOkSh9L45bCr1ttfTEPC10Qft
	3bEZ1/4sk7V/RN97ZRQaxedlRX6ArH3F9n52n5cv9mzJUs2zpNIU25AU6kYSySTTXDqalD1R7j0OJ
	3I6Enn7NDYkYF6u3oS7lQRlr2paFk2ZURN6s4a2I0dArCeEh2Ixoe8sdDsyhn9IAmApPjm+iDgY8+
	I+v3opOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Drt-0000000FFqS-1umC;
	Wed, 24 Sep 2025 01:00:25 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Drr-0000000FFpo-1Dh6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 01:00:24 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4b7a40c7fc2so96922921cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 18:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758675620; x=1759280420; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZsVlg5OxPMiXZWZO+qrLbc/alKsBFgcyv9irh3N5VY=;
        b=IAfX9AaaGDP9pX0/se9WtnStNNYClZSON5bKedkSsCaMschjwi/iyj6Dq6/H1KDody
         jStQDI2nbjkGYtmVco3yCotA+BSe++3vGdy6n28B6d2lFiwJ0b44hVZfoGHYRrKLP3QF
         9H+3OomZ+p2B5GMY7zQ+6DISGPPj6ac10aalvaS3BxwoybXI7hCeoHAwgPNn6aaoJdZ7
         xcnsepAompgjv7kwxQO0ZNdkOlPo0BSK5eT2TRp3PtB9oTF5RU+yhMrHBPhQMS6Xvh8j
         DIjuCQSlfsI/IqNpu0S0nAitlMKapJpxJj0H0dFABuq2hG2FqdzRdXUgsO230YahCwy0
         mCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758675620; x=1759280420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZsVlg5OxPMiXZWZO+qrLbc/alKsBFgcyv9irh3N5VY=;
        b=FYx+OWNLS2D7RznwXF3mgZmJMiUSReShgBy7GKDeCAHoM0J5lWo1PVMmaiMnWSo70p
         OEmJB2VklevsvMrUM9G9aHfiyaGIUDBjiD9KYSWoJNEIIBYf1vUV/8Gg2i9W0ucu9T8A
         5xxpqJ0gQ/YEKq4U7dUeRAi4KZGoc7fbx+16xDfr3Tbih3qFqa0N5jOouM+8QkQA8A1/
         BYDFYh5nVC81dWgCzs7zQwHPkR6m3HARK5AcbauE2eoX7AHR7J9O4nGqFlOPAmkuMj2Z
         rBd3Ys2zqdEiyJ5QRD/A01gP/Jr6wvThnz2hZE/LWHSTIuUach0U/+JNELUA5cW/afcx
         S3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVGUQGx//+npzF5NVv0Lf6dG8oG12gsaGhG1c4Hj+sEwlAMnSVJpGm8Pww9q/9kX5SdvcQVsNMtm0HIsZTlOD5g@lists.infradead.org
X-Gm-Message-State: AOJu0YxH8OUtXjSCo2BlFTNL5rdvPKk3G2v07cKb8pBgG9GSA7kNHeac
	P3r2zIK8FHTQwreQGgK0zBMVAhhXmEY2yxd313OEdTHzE8jdcZpjzQPI6MZmnPlIeIbH0DAJTLL
	LB2XbyZ6j7oLgbUfIOMTuY4L/uehrC5s=
X-Gm-Gg: ASbGncs7IKALUqJ2TD5DOmUj8FAITAyTcH6e4kQivVQtApmjzdgp2ZnJetS3yL8wXm/
	YcZABiPRbemjdDXVOZ8zXQ+wGBLe+5Nx28hy8f0fOja8PtEYN3lX+FW+ZTG5LB2ebC2JuQdjg3q
	h0t1hX6r75AL97/AbhCUWeYMFbtcn9EPKZRyzWSWaKLD1YAMvazr5RC7E7INTtPHUfkHZiiF+cF
	O/+a9SwSgcmjizlSp+ZDSxKBrurhyq1sYcWehbPJA==
X-Google-Smtp-Source: AGHT+IFU+HdxW/LEWFydKq5uIjzjnXTJNktogq3srwO5gahMvnvKX0l6y5Tq5+EvCdygt2yb/FL6Q+goFczk6oDSGcI=
X-Received: by 2002:a05:622a:1905:b0:4d8:67fb:4180 with SMTP id
 d75a77b69052e-4d867fb4421mr7701411cf.8.1758675620385; Tue, 23 Sep 2025
 18:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com> <393411916e94245a9f3628c41ebee34c3dd95a98.camel@codeconstruct.com.au>
In-Reply-To: <393411916e94245a9f3628c41ebee34c3dd95a98.camel@codeconstruct.com.au>
From: Peter Yin <peteryin.openbmc@gmail.com>
Date: Wed, 24 Sep 2025 09:00:08 +0800
X-Gm-Features: AS18NWCngewRu6_z1rC1usvMWn-hg2wKnEFU7JU8elKMaPgAwRFUKF7tF2eGoqo
Message-ID: <CAPSyxFQ1O-trBv9AQAn8nrh47zVAX9GLFovbpcy=_5Va6rDUcg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Revise Meta(Facebook) Harma BMC(AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_180023_331457_4DFCEB7A 
X-CRM114-Status: GOOD (  13.64  )
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

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2025=E5=B9=B49=E6=9C=
=8822=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=8811:31=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi Peter,
>
> On Wed, 2025-09-17 at 18:18 +0800, Peter Yin wrote:
> > Summary:
> > Revise linux device tree entry related to Meta(Facebook) Harma
> > specific devices connected to BMC(AST2600) SoC.
> >
> > follow-up:
> > https://lore.kernel.org/all/3a65d568540e9ca43d3bfc24cfe5f72d2bb12b3b.ca=
mel@codeconstruct.com.au/
> >
> > v1
> >   - Patch 0001 - add new line between the child nodes
> >   - Patch 0002 - use power-monitor instead of power-sensor
> >   - Patch 0003 - dd sq52206 power monitor device
> >   - Patch 0004 - dd retimer sgpio
> >
> > Base: tags/v6.17-rc3-39-g07d9df80082b
>
> Can you please rebase this on the aspeed/arm/dt branch of
>
> https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
>
> Patch 2/4 fails to apply.
>
> Cheers,
>
> Andrew

I will fix it in the next version.

