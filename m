Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775FD59D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFcDtbEmq7ZVjInvpisCNfzHQPlIXkFOIPRXlH+eeHs=; b=yxp1OEdIegyHDarzpdQr6hTYbl
	mUr1I/DYXXC8Vd8mpOzlXBHx0Q8lFHJOpDmIVnuKY1+UkKCwOukxeP5q8j6Qprv8qS5E6syu1D1qP
	jMX/8PY8o/GKk2zALVbg3GG8Wo4mQQVlFDuFSssDviH4OUnOk64h+hEY92m3PuJAUyQuOkbFztTPO
	FjKDVyy7tiAbo2dGMlGuUW5qYLui22TYcq0b8mR1HoPkEEJ9Hk35FWsk81E0R49V92fVolZlJMFyn
	Chd5e+eu9rOEYMShVU/vHWK4CvcrxJQsSULG6J8psGwn7JnMh714zliUeEjQGNqsjN9ca4Tb8yHOP
	aOdP517g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFee5-00000008xMI-1Myb;
	Mon, 25 Nov 2024 19:21:17 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFecR-00000008x8M-3TbG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 19:19:37 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4669eecd88dso5145491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732562374; x=1733167174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFcDtbEmq7ZVjInvpisCNfzHQPlIXkFOIPRXlH+eeHs=;
        b=lbKYj3Zh8e2ilv3zb8Bibz3pfaE1tt24LVMwMooV0+Vx+8inw4+E6aa4bjj/9fPh3y
         ehqltP7J8LltIgEB7Y3CGC9+gNl5JjnZm4IELhoYlNsTUXVaLzATEwsnLZiY0xqHUP5V
         sjsoscfCWL6RpnWRfHxHDfO2RVrQVylHQ/emvQKPeAX3z8edH6zVAAqL2LVmqfDTbrVq
         g4xs6CG2lyw+tK/bJv3yz94ceJYWH4Jziuayi+QOsmtNuobZkcj57psk232rH25UtpEj
         nPdX+CGFaqHEjUmmEjUgwEBkNr3eNCpjWcCwIl/GqBSy8jO7oXVUBe0G6jROY2jnOBig
         3krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732562374; x=1733167174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFcDtbEmq7ZVjInvpisCNfzHQPlIXkFOIPRXlH+eeHs=;
        b=sPuaKiwwYzUbXke/voL28n7nh9PslsNxr80IyI4CFUSb06/h6uuZwn2ELnAlBOs35B
         X+RVpgeQzEUSovGFa80W5wJypMYMVki8kEhFLR5FVPvWoJw2RaMwQU+pBpaFXlos+a0S
         PeUWLmvT2+IWirZ79W6eHsmAf/MI7ZUOoC1cG/abCG1zQJ4hstgsupTOzxEqzmsjQPDE
         CvO/UzoO21LwySt5QZ6IMiPQXqsui2CDdC1jC0Z0n8c6AHOzgOJsIVDyK5exCIoI3YYu
         72Au/nXqGRi9iULsMXVnKi/AKPpgHLyDChIQ4I8pK/WH1cAB4eMkA31rCjpy0cBlsZG5
         PTnA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Nmq+WWIH+/CNtW4NbAsagU0vTRlqvqnPyWm9+PiOG6FS9sG0QUKBcvBB1ugr4gXYKfB4SO+N0wD+r+GOG7BC@lists.infradead.org
X-Gm-Message-State: AOJu0YzTEvEqeRAJ16ZJy6PMfYpKvN5egjgXGPo+Vic2bKxTWMtnpjAp
	pTPKeZSblVLg7NXykz/j/vyqUhxa8E32ONXTNkwVOK+/CHLilxEhKgaZXI7BfKQNuJIFTa8na9U
	la4P86XYVRdE4UUd7MYpitpFH3ug=
X-Gm-Gg: ASbGncu5H/pZ+U292UIWIlxP4GdUhGZ2k4lWbTxdk9YtOAzG1mJQixW985kMDbfENop
	NOthEf81uazMs0qzYqu5Ydd+LWsCGIwaO
X-Google-Smtp-Source: AGHT+IG9FRlCMVjbtG4tYT5ULavoFaSRxzvNtQwBm2toqh3xQ8KXyaHmRc8ym5w+bW67nXYMJSqEy467XPS2DlqbNmc=
X-Received: by 2002:a05:622a:2ca:b0:461:313e:8868 with SMTP id
 d75a77b69052e-4653d646ebbmr209731321cf.50.1732562374448; Mon, 25 Nov 2024
 11:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
 <b3e2ed68-092f-4ccb-a945-19e19d5c8071@kernel.org> <CANeGvZXjUUOhySGhMCXDp3yfTtuOKdXgMa7DTtZDpq1iXkkfhg@mail.gmail.com>
 <aeded772-3471-44f7-bdb8-d820ddcf0c6d@kernel.org>
In-Reply-To: <aeded772-3471-44f7-bdb8-d820ddcf0c6d@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 25 Nov 2024 14:19:23 -0500
Message-ID: <CANeGvZUkFqnLJW2aPvxCvSoQZ4EoV-QKc5WeLtimzGspgWpJGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camif-core: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111936_896550_B630819E 
X-CRM114-Status: GOOD (  16.47  )
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

On Mon, Nov 25, 2024 at 2:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/11/2024 22:10, Jiasheng Jiang wrote:
> > Hi Krzysztof,
> >
> > On Sun, Nov 24, 2024 at 5:50=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 23/11/2024 22:26, Jiasheng Jiang wrote:
> >>> Add check for the return value of clk_enable() to gurantee the succes=
s.
> >>>
> >>> Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC=
 series camera interface")
> >>> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> >>> ---
> >>>  .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++=
--
> >>>  1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> Nothing improved...
> >
> > Sorry for the confusion. This series consists of two patches.
> > Only "PATCH 1/2" has been modified, while "PATCH 2/2" remains unchanged=
.
> > As a result, there is no changelog for "PATCH 2/2".
> It is not correctly versioned. Version is per entire patchset, simply
> use b4 (or look how any other patchset is done via lore.kernel.org).

Thank you very much.
I have correctly versioned and resend the v3 patches.

-Jiasheng

