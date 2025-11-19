Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BE2CF2599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XT2jT53GtflpgtsSSARNMehrU8xMcefHmEbO5weE+H8=; b=YoN+CaNaAzWbTHlsbXpLoSZcfr
	LdQsPVWRH/gGOz34cHlEcpglfs/snhDgRwwqgiVXcbY0crtKd0krVfiVtKwwN7jxzADsCoRtmcSYl
	MjoH+DaQMAmwan2y7pd7ehEqXeDaJraldxb34cve7riI7bSUVXcZ0YN8/bXMZVuZ3ASdzS4UxNFTo
	aV8eS61decGayzBwSt3Cg/VJOCOFTRNoYQaTjjoMbJbIV2imAnUNq6LpX3PLuNF5xCVCWCkHnPxyd
	pCdhpDjbZww4zk52qiJAsEDSfpisyLB7NFBCtACEdFofpqTJSbCEnRJEmLaMURFDGdvxoBP02olOI
	vJRPJZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLd3c-00000002kWX-42dX;
	Wed, 19 Nov 2025 07:56:52 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLd3a-00000002kW4-2mX5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:56:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b7636c96b9aso75391566b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 23:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763539009; x=1764143809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2jT53GtflpgtsSSARNMehrU8xMcefHmEbO5weE+H8=;
        b=Am1a4x26mg6O+M+mCnWuB/N4liYa4ZpBTGS34oQOgDbcDNAvT78VxM6ae63fTCqc9h
         UzuEx0ozkG8ZBuK+NaoK7i7TYraLnsNopef5y7BkYDoz0VBD9ogo90s7/eVtCKWSPLIH
         xAaVJ2IaQhf7eWcu/sdw2dZCMhLaWZdHMJ6FDBS/Um59Muo1leBStVEyfu1vbOuM5iNY
         4nomG8//Z+mWT1Z18Wd6D7Gu3i19bBWM4JtHpJbpKPGD5ADaBnN/dgbYDuE9CWqia8uw
         fE5fVpBvTYNzX9WJQk2FmjztMCQqN/WblSqw1oswTresWLElRJbEBoQkEHNb2jJPBYTt
         G91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539009; x=1764143809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT2jT53GtflpgtsSSARNMehrU8xMcefHmEbO5weE+H8=;
        b=dNZ0PtXmziGStrgScjVeGQa4PVsNmkO4/Z+96buEElLQese2qXizd8JiVZBdZCYCTS
         RbCy1Fxhay1AfaicvWwWzHrwv5rUVvrnORAUnKxYxkmJlDLUmZiQVRIGMA+hNg47QkE4
         +CePPYnnLmJXuXn6IlBW/8LqpYhFzVbJgvhIzscgEuOmNWsxDT+N+15LdwVftukS6jnp
         XuSy06UpcX/6SQMx2NPbEHtRWF4DWv6Hdr/uAB86XPiJ8pREP975BRF6q8vYy3BffA+a
         3v+duQ+vGndXyi1IJLTbdTAtdc4/MyzWHX8pN58xnU6vh8gKG+UuWY2+J7dvolIMT8ET
         dZug==
X-Forwarded-Encrypted: i=1; AJvYcCVkYXtdDl9E1aCW7dxUx6sYQv0unVCscNqMlXAuxV77VItBWaI3Q3R+unkxMKSZj0oNq9ap+HmCpc+u8P4Fxduh@lists.infradead.org
X-Gm-Message-State: AOJu0YyLDQw81mXFFhenc2qOWvng8WDFKqHvpYNwe7aac5mX/dU0mmEj
	KFvDK36kkeD7Banp3ARrP1xK9N9g8P76ZKGPzA5jPO62NgG2GPBievWlpM10Hrjw+HFoPavQUYx
	zqxXBJdcRE+9O1zFY5B1aqxbbQLmgyfc=
X-Gm-Gg: ASbGncv0SfzET2IH/t4yfrjQsfZSrjwxVXUD08JTnZVsJJEc58gPVnygjb7JfVcEnA9
	GjvYAk536gfjYA73ZvUGR+1FOTwNeYajxlEFUsF9rBrxHgjkYa/6btJPaIfV4wS+0wv+EOZLtUN
	pNbOHusldJtbr5x9KkumU3zYl5HrRYpGgqIIsH/e2aSw0HFJQfPxyxIi+wDTOiKIq6R+P4kjHLs
	rWvCmGPEaVRElw9xou4szx79D3FObxbpiHeJzNezLevRXEKaS+U2Np7Xx7IVjuGltPBj0X3gxNh
	h6Lz/rjsTFu1UekRLecNl8kMU3i6j/m8wBmkiuE1tVDtry5jKD5Jf9yElEz/GUunt2Can/ibQSx
	+IBg9TrY=
X-Google-Smtp-Source: AGHT+IHkr98iv8RkJCJVqsJKrbJ1+s/zkdGOwfF/rH8mGb3+ej0aXWY1sLaOq7gDCGS9Bl34YEhC4czuLVOsZWaGVgA=
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id
 a640c23a62f3a-b73677edba0mr1946935566b.13.1763539008473; Tue, 18 Nov 2025
 23:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com> <m2ecpvm20y.fsf@free.fr>
In-Reply-To: <m2ecpvm20y.fsf@free.fr>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 09:56:12 +0200
X-Gm-Features: AWmQ_bmed1VXCExSbCiDJjR0DcoAiO6hz3YdSi7TR0YlyvVDegjc7dB_x9IoTzM
Message-ID: <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_235650_745582_7FB244C6 
X-CRM114-Status: GOOD (  14.78  )
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

On Wed, Nov 19, 2025 at 12:04=E2=80=AFAM Robert Jarzmik <robert.jarzmik@fre=
e.fr> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang
> > <jszhang@kernel.org> wrote:

...

> >> -#ifdef CONFIG_PM
> >>         unsigned long   saved_gplr;
> >>         unsigned long   saved_gpdr;
> >>         unsigned long   saved_grer;
> >>         unsigned long   saved_gfer;
> >> -#endif
>
> Actually this is not equivalent to what was there before.
>
> With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to
> the
> structure. You might thing today, 16 bytes is nothing. True, but
> on a
> 64MB RAM devices, it's something.
>
> That might not be a reason to reject the patch, but it's not only
> a
> "modernisation patch".

Actually a good point! On the same grounds I semi-nacked the gpio-dwapb cha=
nge.

--=20
With Best Regards,
Andy Shevchenko

