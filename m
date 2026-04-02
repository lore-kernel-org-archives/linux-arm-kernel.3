Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCAFD3942C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=; b=e/PxQsns1izWl5+o0bIS/MpHes
	klc33kWUm53WBYnyg5/Zil1SdRa92gK+uy3+sncOJTM6sM8S5H75X99S36qFpReNdkUcb8TBlmGwn
	Lr7OIUxnHUmvEWX0KovOPYqtpTU8cGr9jwgeY08a3z+LW9XVyKx1IXkgUyIzrb1vbxUPWqxg0nRwM
	avomIx0xcI4xC2NeuGFeI6YfElgWSOCvssyhzFm36rsqo9OaJEGEaitLQQ9iTcc9orp/Gkkeqh6J9
	jb/dgWGBJDYgX6zx42oqqIbsmlgfc4zDASF9DnEccWlJCaKWX5xK4DKHCuJKjq3hmTo1GUsrEfqcL
	Pqf621MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IXt-00000000DpY-35QE;
	Thu, 02 Apr 2026 13:57:17 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IXr-00000000DpB-0CAi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:57:16 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso8145245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775138233; x=1775743033; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=;
        b=bPieVSxa9/hG5DklWD+SXsa9Q7QcuhtwK+lxOSNx2OmZnhHnM45AX9fZm9sv8+f0H1
         +IMOGzTkiXFY0qPVJHLq+JEQsLMUyrWi3tkTHcoUBf1J8rb3PDsasu7OuNNQgDsWnuvf
         BvgkK+hic213FRaGMyf56kmohaHNv8KRbcdqfYlnpwMdyK0H3JpmaKXxGJal8FfLp5+5
         RhlUDmcgeK4gu/aK62op5/PHKNSS8j/AakMCXuHSswaq7sx/4uCAIkuT+HUoZk5X9V55
         r/pwyxisGdXVS2dyqmJ2OAjvu4NLQKXmkDhGpreGDKJwdRexVscyY4t8Tn0aj4Vc3BbF
         tnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775138233; x=1775743033;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlqXtAWJ1GByy64qGazEk71FC5c2hQMAqngLM9hJtdA=;
        b=OWv6Zlv04wRjKWz2qEotmYqJvG/qzwnjrJCjL6Tqzu4L41NZrBoBHgE2Tmc9s19il3
         2eewY7+bk3nOosSJlvgctxKXu1eoRMyv6tCfXL2Gos3w3QvK9cVg53XsyEROyTmtbq54
         9HJSp73M6aorCuaVq/ulm55PtHPXGgSBvCKhg8oU7GwMWzb4MpwIwa8VTrMaJIarZMj0
         wLyiO72eqP+2kQvFOKnZVSwNwAv3mK6b89XGfom/Y7n/5/3lkh+nlaSIb1f9ZK7Ox3zl
         RERzymTIEvmdGhhg/cghjqcnKOqJeTtIuCchMIUvea6R8h0DkyXzUMEGIbMyDLYD0f8t
         Um1g==
X-Forwarded-Encrypted: i=1; AJvYcCUNiSTmMuJFjJ9Am3Ewy48KFj5qyo34QgMf9Y6LlWbu3znRTf24039jv6dy1xu9eiKLntGbLDCxh/2v6lGqlc+j@lists.infradead.org
X-Gm-Message-State: AOJu0YwA6pVqSu8RIi5WXZdQ2856FcZNi25hboHx+i+tZ3LAEx6lMBwE
	Y13ZNK2pXJy8fiTu8yNGs82HLUXiHZSvSDTWkiMfdHY0t5Jd6+pxj5Dg5tDOyuSBYhg=
X-Gm-Gg: ATEYQzwvAC+1rZo1VyfUP57H9PyLRmlICUK3E9+zWBqa4BQvR41mC869Chpx4tWhzSf
	jiHnMQrbFyThyqOvbdE43tr4pY8iPGacpCH24CYsxEDa6SFTtUdBEnwJ7YbGI0J9G8FFJXx2R/s
	tKJY/JBBVVkQoekzUyPOby+VzSiGp5VBIrscTEjOHe0KmDezuopvuOoNDW53oJ+TWWEIDy04wGv
	fjiHKTweOiqvMrW3FIt/ZDOgf7l0AkLsA7GSNHpLYAR3vPE8A0xlaXJf4p70Ub3esauv8JZOQH/
	BG9jabk+2qcZbRJizl4CFBJpZoP3doie6ZBOLpqNHYZc1T78VJOKdMadUDfvi0GK9nhDigtAGBt
	0ubKr33f+vNu3G8WMWlNGL3q/grG/UI51877Xk6OUA1BLSBV3ZW90sIgw2QoCsjysEsLytkNDig
	yzqNDQlkKkAonwqm1pny4LuSzLxlZC7enIoDZ6+QtjtAhgFzxagFSLph607ZtfWSH5U6yOjOWss
	U+kBQiWeApmHpMf
X-Received: by 2002:a05:600c:8488:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-488835682c8mr136632325e9.13.1775138232539;
        Thu, 02 Apr 2026 06:57:12 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:a0c1:4037:aafe:5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm7388752f8f.9.2026.04.02.06.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 06:57:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 14:57:11 +0100
Message-Id: <DHIPZHI8BC0M.1GLYIDLUP5SF5@linaro.org>
Subject: Re: [PATCH v2 6/7] MAINTAINERS: add exynos850-pmu.c to Exynos850
 entry
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Sam Protsenko" <semen.protsenko@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-6-c5a760a3e259@linaro.org>
 <f73173b4-f44a-4d01-abec-3366b6561332@kernel.org>
 <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
In-Reply-To: <CAPLW+4=H_UkjwY2RJFPD9ekJh05MyuhKrymeuUYC4dX1WzF0wg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_065715_135133_CB7BF084 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed Apr 1, 2026 at 5:16 PM BST, Sam Protsenko wrote:
> Hi Krzysztof,
>
> On Wed, Apr 1, 2026 at 9:28=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>>
>> On 01/04/2026 06:51, Alexey Klimov wrote:
>> > Update Exynos850 entry to include new file
>> > drivers/soc/samsung/exynos850-pmu.c. Add myself as M
>> > there.
>> >
>> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> > ---
>> >  MAINTAINERS | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index e14e6f874e05..4b28e92b4d9b 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -23601,6 +23601,7 @@ F:    include/dt-bindings/clock/samsung,exynos=
2200-cmu.h
>> >
>> >  SAMSUNG EXYNOS850 SoC SUPPORT
>> >  M:   Sam Protsenko <semen.protsenko@linaro.org>
>> > +M:   Alexey Klimov <alexey.klimov@linaro.org>
>>
>> I am surprised to see this because I did not find many reviews from your
>> side before.
>>
>
> It was me who advised Alexey to add himself on the list, as he's doing
> a lot of Exynos850 related work nowadays, and we expect him to
> continue doing that. If you think it's too early, let's get back to
> this once there are more patches submitted under his name.
>
> Thanks!
>
>> Please first engage in reviewing of this platform, before assigning
>> yourself as a maintainer.

Okay, so it was done after Sam's advice. I can do one of these options:
- drop this patch;
- move it into separate entry in maintainers file;
- something else, please suggest.

I don't fancy having loose files (first option).

Best regards,
Alexey.


