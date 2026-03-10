Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E0EFCD9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+nNz1AInMAO3E2JjYDfzpBLfMNk8UG5uq7SrYEhfjI=; b=ApGZBCgP7v7EpLTmhBQBFXhDLa
	jh7NO3iA4QeTonlKnN1RL1ZU1fJzjwzw04Jr7X3pMkJ9mrNH4gkpKgsBG/R2UT2u3TrWqKhB8RO31
	ZsAohZkRYz+NYRVV03YOYnktVcHQBMf0Rpi7gHyEkDx/kzsRqqozxcjbmTAbx54mc1/ploPyyAwh9
	7qMVrbH4/mbn30bqBLwW63scefZ15iylrw4TvcPBNrJoYGmRy6Lrd2zk6b++TjiiWFzcVYE/eiU8E
	IxJQEOAa6MxeA6vocoYLVwYv9+SrYKB685pEYn5+/fDwJnQmRdtnWabWyIEhg7YXgh5oxx8i7uuim
	bAjiKcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt3a-000000092Io-2ICp;
	Tue, 10 Mar 2026 09:07:14 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt3Y-000000092IJ-0ywG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:07:13 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ffc6a96602so1199570137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773133630; cv=none;
        d=google.com; s=arc-20240605;
        b=b+1fKkaMHzs0BYJsk+hktsCa62sq2/VnvIpPyy+AqVazUmoY0tcmPNJDC5awjSqYQk
         XOUwkTwPOCvyM28dV4deng/an5sxX9QSoRDNF6boJZpFnSAbrdQYXauqEPWdz7Z6IK3g
         dsGNsfXrquU+Ex8rLbZLZM5nVFsk75RbNaVZXAV1hX5M4lcrB8Klw9pI6l1tJtv2cR1l
         Y2YN7kAG7pBZF/vpIxQ+gXbF8mwYoAqm9VBO0VxulG1N82mWIAZKUVx2AZ0jy4cDvG22
         HB47pEN0IHA+Rh5ns794JNoEoEpo39YyGU+BNHbo7z2uIx3ulE+eqUn70XIRgcFPXrMt
         v/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+nNz1AInMAO3E2JjYDfzpBLfMNk8UG5uq7SrYEhfjI=;
        fh=bqhKx0sHI/QM7lawRivCX4rdf7uZWklDqj5m54uw/SI=;
        b=cOAg4uOMouDrY54CPaDqCVJyzafnsLeWmmcSPZMfIxF7s3mlez09NXlOG/H+qB9vZL
         0hbkWlez0vdiI3Zc7oryyDjEmr2TugB04++4pifKNZIhJyBIJ7meolWlKPrMy6Vs/ANN
         k4U1QOL8yUZ9ODdXer7qxadTloh0a5WY0NvKV96Tz+5lIwOWT+nZEevEXaCVHt8LvNoQ
         P2DSRZFU5zdLRmUOgsQmFGeO5EY6GB1k1EjGaLNHAs+jsWCcBaN5xE/IIg4pHO0h2/aO
         sYnY4PUR/NO6Up4x+JgFoaFIV7XAsHQEdvO2xvwUStDGez4nBFHFbyXNKXjIMu9qcw/R
         nNOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773133630; x=1773738430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+nNz1AInMAO3E2JjYDfzpBLfMNk8UG5uq7SrYEhfjI=;
        b=UESJhM+emxWnwYJL+/S9UFDMAhx36j8eXUbCGVpbKY9eyED8pBK2ZQw9ZRRX9gqSNo
         2mrBzKLMQ+FXAcsoAXH5ERBJKgBJuyKqSU1MgSYW951nKdwGogFFg0GYreV16PshNkSy
         HgMayfVvcl1fkKaDCBfoe8ngFUxwf2PHq5AKWBcZrmsfIAGisJKNF5/4MYAkMOeTRtn+
         fjzy+uKyeTZVpWYilp0YiQItUMBEqgy+CW2TjWyPbeNE+OQ8T5Ta1SbxNgkmAiWToWA7
         J1/SkSBT1yjbgvSZvO728g+UQZkivmL9F536yrJAaZB+aOj3DcjOjsMajq2reinqU6NA
         7Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133630; x=1773738430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+nNz1AInMAO3E2JjYDfzpBLfMNk8UG5uq7SrYEhfjI=;
        b=oTqdbh5bvm1lXGEivmO2oBlM5JPmCXpNMVO3aQ76Qwqx3k/0oGC2g1UJKaVMqG/cyK
         Y05lxPYANZ9aoIgCl0VGq1dnbe15gGAUYCm7qRIlDEuKq37dwz8U0je+ALNlxw1XXnuO
         RlvHtSQgqMIJ1oC9sO0knuHjTCz8Xav7bF0KkXw9v4RDLDfQ3D6qaiwU8PqoTpBjuvV+
         ZdcA0qAK8PVKwPJ99LozZk93DT8GUEOIyR1nlOAuoNSxRcYOFyq7RQ1i2j5xBsjQwuCl
         lHZu1LAfF0jiFx7eBbLO7rkl3q+/4Unvx3IXdNgUQscfxr5wLPtArWgbr2SwFFVKSu7f
         Jl3g==
X-Forwarded-Encrypted: i=1; AJvYcCVyR7SlgwSo+CMpyPeaEUxhdI8kzjt259Y5viorEcd4D+DtXrejQQbSGHLEWuhAmAfLgLd9IiDjvAn8Z7gD3MGD@lists.infradead.org
X-Gm-Message-State: AOJu0YyVYJFMi4Xm06kvdvcATJNbtm7AVS0GkzX87YP9DaDByKv0ocUw
	DCwvRyFld96+yAuRs3f2h3UFe8zna/k41E9kHigAQElcw8+YVDROV/owkzMKNB7ItUaez5unNjg
	64etg+/q5wzlQF1K07+gckrof+lZwYiA=
X-Gm-Gg: ATEYQzyTM1SSVceaGBVcI05j0TLRhHPXShZNcDjWnbR/RmpD30Z7cVMgBV8V+gBdggO
	8DFqTgZS4TWyQAT23L2kmfoZOp73WZguRjOv0vGn3NvpXMToLFlXs7qjn0wUOZQddeOzdydWopG
	9qItN1ObkTEnHySvpp8XmsWGz9MYWheCuLkxBii8nPLf3bOTuzU4A12JTVkwY46pWo3z4rxvTLF
	XPJEfJcW50wnte8CbITCpneoYVvrhG36BoiRe1avxoAdxW9M4qbxuFLD8ECgKpiKn60DXHA8A/v
	FZEoJw==
X-Received: by 2002:a05:6102:dce:b0:5f5:4eac:cd2e with SMTP id
 ada2fe7eead31-5ffe61bf0c7mr5730209137.32.1773133630078; Tue, 10 Mar 2026
 02:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260226-anacapa-dts-sgpio-v2-1-fd76828616b8@gmail.com> <3e9d0b356ad2871de0b3a47194726d3503ef136e.camel@codeconstruct.com.au>
In-Reply-To: <3e9d0b356ad2871de0b3a47194726d3503ef136e.camel@codeconstruct.com.au>
From: Colin Huang <u8813345@gmail.com>
Date: Tue, 10 Mar 2026 17:06:59 +0800
X-Gm-Features: AaiRm52146tZ5iflavx_AsTSdrRXnGzrXSl7eTyC_eatkyvt9sjGedxW7uv8FZY
Message-ID: <CAPBH0A-x6Mve=9C_4OFRCCQBfEr8e1mnjstG=EaRKc1wKdhuQQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: update SGPIO and PCA9555
 settings for DFT
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com, 
	Peter.Shen@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020712_279917_7E62DFAC 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Andrew,
 Thanks for your feedback.
 I will separate more patches and remove the document name from comment.
BR,
Colin Huang

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2026=E5=B9=B43=E6=9C=
=885=E6=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=887:57=E5=AF=AB=E9=81=93=EF=
=BC=9A

>
> Hi Colin,
>
> On Thu, 2026-02-26 at 22:08 +0800, Colin Huang wrote:
> > This update adjusts SGPIO mappings and enables interrupt support for th=
e
> > PCA9555 GPIO expanders. These changes are required as part of the DFT
> > (Design For Tooling) integration and are aligned with the SGPIO signal
> > definitions provided in Helios_SGPIO_BIT_MAP.xlsx (rev: 2026-02-16).
>
> Where can I access Helios_SGPIO_IT_MAP.xslx?
>
> My suspicion is I can't, in which case this doesn't have any business
> being the commit message.
>
> >
> > Updates include:
> > - Add interrupt-parent and interrupts properties to PCA9555 nodes to
> >   enable proper interrupt handling required by phosphor-gpio-monitor.
> > - Correct placement of LEAK_DETECT_RMC_N.
> > - Update SGPIO line-name mappings per the latest Helios SGPIO bit map t=
o
> >   reflect leakage channels, presence pins, module power-good, and other
> >   DFT-related monitoring signals.
>
> Please take some time to read through the documentation on separating
> your changes:
>
> https://docs.kernel.org/process/submitting-patches.html#separate-your-cha=
nges
>
> If you haven't already, please also take the time to read the rest of
> the document.
>
> Andrew

