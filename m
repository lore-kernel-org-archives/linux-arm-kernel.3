Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D41CDDE49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SEmrXSvmww7jDp3qvFyibvCH67UbxUU4E5AZdc+eR8E=; b=jBal7bhmGzSW3D/tN4RbrBlcpK
	Yf+uITtwMSLXYWBz5c0J73g7ttPRPJEvG8nJcP83guFQbQvnRxav4/GBupt2H3eb6HwbKxnXdzxva
	tl20tdD0HOUXb+Kn6fnKDtYN/518PswsCp9RHoIHDd8DUA6lWQqQN/FIC7MDXG+wrd+GrfeG22h8O
	3qATnglx4Qvi5bKByMnzWXnX6wQ6n/Gbk3xtiT/c+gg1dlDpubROITNRvl/t6cLeOH53YoxJw94mi
	r+o04Cjyelu8HzPfnEzNuzJ4j8EllkHZ5rZohUt1TiLp/tnXfMj0SCmv4zhdvQqQX8gFvcg953aQJ
	gI6ZIGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YAa-0000000DuBY-0woq;
	Wed, 23 Oct 2024 10:00:48 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wmt-0000000Da1b-2Brl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:32:16 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so4914135a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729672334; x=1730277134; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEmrXSvmww7jDp3qvFyibvCH67UbxUU4E5AZdc+eR8E=;
        b=ap599pKGucsCdiFYJQQXnFpzSkrjSAB4qWYq6Ge93tKrv8xdN99kn5AdDRdgpv4Q+z
         BP7+R3shR9kpCeIuFDsx7YPzOFa34Lck2KktaZftiXzgLFLSyR3+6rB5MYCelm14YgKB
         jI4NyuWHB+hO7DhKenr+BQOW6oNRvhNz9emRT2dY2L1aZHOoIy4KlIEO3SBa99BYDv1I
         4SCxXw4q5XB5AjykToKECfwfp6Z3pTWK14R5W3+ZvNuqkF2BBTT/0tv+m0OH01bNkie7
         T1irgRBh+18qmAIWra7m+8JcsjREV8gUR3ok1RKJYrzJCuMnAlol1wadru7Ha5PYJfFm
         83TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729672334; x=1730277134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEmrXSvmww7jDp3qvFyibvCH67UbxUU4E5AZdc+eR8E=;
        b=UQjDRtAVpx6isnQfugHY7DJNTBhojQARLU/v+C9jHTLiJP/KQj1GYJ4lSRNOE9Qk34
         /DntYpPf1SG7RK2qGFIk94EnmQIii5NVVD4tA319fVRdIyse9fc4hDVQesYQcGpm/adv
         6XjKeGA7nR7GXovtRAmB2vwq0kxfa4wnlFGRftArgIYwbO9zjKFbuwvjo8jIbKI5eWqR
         jdqG95fJqC+Qn8yYes808ipx1m7vYZUWU4J+l8eyiw/ZcctOUpagFf2FTP40R8dA4PzE
         qJ/nh3x9c85d4exgL9MPvKVbtRQpttmmVxORnH7I99CJjt0WezdjiC1dgFNtOpzoG+TA
         hXgg==
X-Forwarded-Encrypted: i=1; AJvYcCX3haLOr7sqeZprTkNFinKSgaNYtOD5lNa3ihIuX8UPV1vwlvSaayZiuAJzm/KW5MnS3Cfodeg1xRWT8ZMFXde5@lists.infradead.org
X-Gm-Message-State: AOJu0YwBo4jim6by+Oa9dA9Ap6dvNS2VJ04yXUJ3iMPjtrVaQtz2Q7tG
	NSjCzsDQnPmhopvPmvCv6/VfQfbqDiO7Q0n4vCDWOqxDZFAUkTXTq4u2iA2i/3LDKNnpffX7DHM
	Xz+xqcvCJBdUANJx2QfYQ9zibenw=
X-Google-Smtp-Source: AGHT+IF/PItJtM7Ja7HX6Mi500IRA5tT5f7uvwsJaF5y5YyAG3PZ464sJ3qXFGk40Z+F5fIxyTIUHhmlzstAhYS6wL8=
X-Received: by 2002:a05:6a21:1693:b0:1d6:5f3d:4ab7 with SMTP id
 adf61e73a8af0-1d978b38257mr2467464637.22.1729672333987; Wed, 23 Oct 2024
 01:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241022021230.2322132-1-jasonhell19@gmail.com> <de478e5f56bb67a9babe59afa6ad53c8dd4542ee.camel@codeconstruct.com.au>
In-Reply-To: <de478e5f56bb67a9babe59afa6ad53c8dd4542ee.camel@codeconstruct.com.au>
From: =?UTF-8?B?5b6Q5YKR55Sf?= <jasonhell19@gmail.com>
Date: Wed, 23 Oct 2024 16:32:02 +0800
Message-ID: <CAFGtgY3BJcpC=Q0cYZQa01D5BFAQTt6GEr=0_mrPGUntHYVioA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: yang.chen@quantatw.com, jerry.lin@quantatw.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, patrick@stwcx.xyz, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_013215_600871_E9FF8AB0 
X-CRM114-Status: GOOD (  11.97  )
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

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2024=E5=B9=B410=E6=
=9C=8823=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:15=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Tue, 2024-10-22 at 10:12 +0800, Jason-Hsu wrote:
> > Add Linux device tree entry related to Meta(Facebook) Ventura specific
> > devices connected to BMC(AST2600) SoC.
> >
> > Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>
>
> What commands are you running to generate and send your patch series?
>
> The patches must be threaded properly.
>
> `git send-email` or `b4` both do what is expected without any effort
> required. Please consider using them, particularly b4, if you're not
> already.
>
> Andrew

We use `git format-patch` and `git send-email` command to generate and
send patch series as below, could you help to check?  Thank you.

git format-patch -2 --cover-letter

git send-email --smtp-debug --to=3Drobh@kernel.org
--to=3Dkrzk+dt@kernel.org --to=3Dconor+dt@kernel.org --to=3Djoel@jms.id.au
--to=3Dandrew@codeconstruct.com.au --to=3Dpatrick@stwcx.xyz
--to=3Ddevicetree@vger.kernel.org
--to=3Dlinux-arm-kernel@lists.infradead.org
--to=3Dlinux-aspeed@lists.ozlabs.org --to=3Dlinux-kernel@vger.kernel.org
--cc=3Dyang.chen@quantatw.com --cc=3Djerry.lin@quantatw.com *.patch

Jason

