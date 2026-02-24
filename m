Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E9E9B260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CObB27JMxovfM8wyNCjWJgmKAirbBGB/9n12INFjL+M=; b=BC+pQw7KGmVfCVG5EY+/czUTsE
	/Ctd5GqwXVLiQUG7IxyPfRN+0Q8AOK3Y75or0RPhWVoybAviny592BMtqhhI0dWvPm81i7cCgW7kc
	luFbFrmvnSGNjZnRojKdLA1NbSxpzYKL2OmknMxyGz4ci+6Xa/f9nTKaKbS4iYP+/XmQ/SdD2iKkY
	efIxBJarkzjpyr7aINdSwQ8WjXeNT2cglSIq1x6rfAZFuQbUPfGTi1kamfrU7xlVBW2y2FPp7nKqT
	vtZKztwLPR7nal0xrzzTox7NaYHJHxGDgrg3HQtKbS2CjRpMHstXajFUmU0Y13IOTMcIRoYsy142s
	gD+WWTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuslo-000000029sM-0XBT;
	Tue, 24 Feb 2026 13:48:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusll-000000029s1-3EcD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 13:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2279B42E42
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 13:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CD4C116D0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771940887;
	bh=CObB27JMxovfM8wyNCjWJgmKAirbBGB/9n12INFjL+M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=maWJnBIldOGiH8Ni6hMPjlPJUA4qpPHV5Ae/+uAq91UF8Qtqv9iCcZ+1yKSwvilWi
	 Se6Q9yq2OXiLTksTZ/fvAU2qIWviuqaLguvdMAO74n9+KWvJlWz3WNmyjPXojgy5mk
	 Cjnb4qr2jcEUBlEkgT4QAoghY5KiBC/K9gCnDW0npmAhIFoSZ2x0bo/M+yQgVk1gR+
	 Zz0O8zu4OOGlslv37HpNZJMgYif4x7b95N5bXyL0AQ0IiFaHy+tmy3WBrA81KzyC8J
	 b40CIoFsT7PXLu3GJ5IDfXZ78EBa+i7SBG1Q1NobfuuVX5u304iu9eULVfDFEecSCp
	 jpIJp3Z0swpaw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-794719afcd4so56949857b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 05:48:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhYbU79QioFNyLSaEi4CpJjnDQcYOXqAgRPdoVZ64zPuzuyFrz1zLUYp8sY9LwuqQziP+Ps22t9TtD8jhZ2LQW@lists.infradead.org
X-Gm-Message-State: AOJu0YzsGyqURKK+1MckRP7c9sLWHQXfZ5fwptnSFPBDtoabFHb4HInX
	FgvfA7kpw+814U2zUNqSVa3edoDJ89FfPrsd1QlQiUeUzcwbrnmY6MhWh6LbCxvdweC38ojupZL
	CEzpg9kpzEyF/NGabx3/l+hSdbaxPtwo=
X-Received: by 2002:a05:690c:f06:b0:797:ffb6:fd6f with SMTP id
 00721157ae682-79828ff36admr100103757b3.38.1771940886307; Tue, 24 Feb 2026
 05:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152457.155392-4-krzysztof.kozlowski@oss.qualcomm.com>
 <aVarmf5rlHWzNZ0Q@bogus> <739a4379-5be8-453a-8ff0-780aa35c9b71@kernel.org>
In-Reply-To: <739a4379-5be8-453a-8ff0-780aa35c9b71@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 14:47:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmFkS2mxXxj8ds+wYtGyB_9ZuCmu9+wvMeV48Eypn-Mmg@mail.gmail.com>
X-Gm-Features: AaiRm53UUlEOLWzGiaL2z5SgIqcCNTYT-VjRsxPH8pu0MbKt5Y1jW00kb6mGSX4
Message-ID: <CAD++jLmFkS2mxXxj8ds+wYtGyB_9ZuCmu9+wvMeV48Eypn-Mmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: arm: Use lowercase hex
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_054809_861129_A39A3E45 
X-CRM114-Status: GOOD (  13.53  )
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

On Tue, Feb 24, 2026 at 12:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On 01/01/2026 18:15, Sudeep Holla wrote:
> > On Tue, Dec 23, 2025 at 04:24:59PM +0100, Krzysztof Kozlowski wrote:
> >> The DTS code coding style expects lowercase hex for values and unit
> >> addresses.
> >>
> >
> > s/arm64/ARM in $subject would be ideal.
> >
> > Anyways,
> >
> > Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> >
> > Linus,
> >
> > I assume you will send it to arm-soc. Please shout if you want be to ac=
t
> > on this.
>
> I applied it to soc tree with subject fix.

Thanks Krzysztof!

Linus

