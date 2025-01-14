Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BE6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=; b=XoVXITkML9ojroF1pMP5YZAcf1
	hzXwMwCgrRGwxHx+JbnKQu0Q0nfD9JIN+YQfXEdeQGoOJXc7uLbczgCrEuUcaKIo0QJSeMe+mZjvE
	+ECBzApvS4xqN0F61qD0MgIOu4FIMNG+7hZjvL0X269ueJ0tq8tcaaeBEdt5HqccHXYqGrHp400Vc
	f1TRrKl6JVhWbRGvHvoJ2o0Q0HRc9jYyd+oKePl1jbLTPkrjL8w7lMT9NI3trZJ9eJEtAziyo7uUI
	yxhOkrlwflN2bGd/JpO7IvopFWvxV0I3gWHhpo3TwpB7k5BLP6wFCFup+aBdR2Jz65R4dKFyooeWn
	lUH7mpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcz5-00000007vNV-1YxI;
	Tue, 14 Jan 2025 09:13:15 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcwx-00000007ux6-0SLT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:11:06 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e46c6547266so7755247276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845861; x=1737450661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=;
        b=WjkDiJzVzoubHduFuIrXVYZb1GHIrbjM9/qeQ0r/aFV9CH3X/0NxaaSRYQtb77Jx56
         lkJAtFh+TcmbKWkSbMsHS+qWQogxf02fwjVhBdS9EY6Dx6WxSdVwFJY2mK2z1htCyQaD
         +pr1FfeKMYXAlcRM0P7WhnW5/Nkl75x5Ly+98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845861; x=1737450661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laOni/3pZswCtnZWqEbh9/nDgLWlbXlzzIl5mtJ7ij0=;
        b=AWgp7s5Eh4S2bjGYtFgEGjfwxJs7/OjvlygWaYvSzWKBtFJizas66Va7guLL1q7+3C
         wROBQtBoTSoPGHvikAPShXlBSzDLFzYRXTJ8Dghs2xWlh3NhY5k6mAoWRYI0rz6K6F7d
         93I5SIEB58YOpl6XAFOjKBbaldrlcSI8AjbgwkDtIuDOS9rjVHfTiqzCU43tH4e3vSlq
         8Cg+wncspruFnj+DQpq8W+Fl9gdJyXchmUNPsra7C7tRH7qf2QNewMec1woZnbkmWphl
         3o7qF7qD0MOTLUKB/M5eePbmc5mcEV1vjVIzbKPzg33SJ/X3DQqj+s34ejiIgUNHDR1n
         Hcrg==
X-Forwarded-Encrypted: i=1; AJvYcCV228o3Yf355yDi5e0ykdM9RYx2cl3W/AJQ72qfrGxJXtBnqnM/JkdYblsFP9s9O1utodiorRfBlpXp1nn+8JmG@lists.infradead.org
X-Gm-Message-State: AOJu0YwlgCRNy3Ota8mtA8lg7Tuj8dinNcXI2CDRlfOVfGVtdXT3axqq
	RJSqoUgBFXnnDX7FkWVmJn3U/h8cyO/PLXt+/rwGrDI7wAnQ2YfS73+4h8F2M2B1Ph5LNJt7rMz
	qoO22J7e1j8ctZ41s1YI/vieGkvoh9J1Ni/MgxA==
X-Gm-Gg: ASbGncuWTNe1GYGQtuijjFRr6NIcGAKFbT1JAyDtwV2J/FY9pvHQeom3FhQ0kD+cfMN
	kShOoEut4y3a8yDc2H1kmO4B86k61I0e31JF/
X-Google-Smtp-Source: AGHT+IE9CA2Xfhzw3GHaovQ1IHfqCWAXv4doOMw3356PJ8sdDTE1sLuY9FIcA5CUBN/UDJxnGUnMXzDsrursJPWiJDo=
X-Received: by 2002:a05:6902:72a:b0:e38:af38:de3c with SMTP id
 3f1490d57ef6-e54ee138757mr17712009276.17.1736845861696; Tue, 14 Jan 2025
 01:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com> <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
In-Reply-To: <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Jan 2025 10:10:51 +0100
X-Gm-Features: AbW1kvak2sUesICzzkmsj5TX2inw2Pxvk9l2RhEMwr_4GvlhnKKbrVqsFXF8zsk
Message-ID: <CABGWkvqu10dyW6y5S7qvY4G7uh0OaUgr6k-F7BA1AU0H9bA9GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: convert stm32 rcc bindings to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_011103_156499_7D953BBC 
X-CRM114-Status: GOOD (  14.01  )
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

On Sat, Jan 11, 2025 at 10:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Thu, Jan 09, 2025 at 10:18:28PM +0100, Dario Binacchi wrote:
> > +maintainers:
> > +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > +
> > +description: |
> > +  The RCC IP is both a reset and a clock controller.
> > +  The reset phandle argument is the bit number within the RCC register=
s bank,
> > +  starting from RCC base address.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - enum:
> > +              - st,stm32f469-rcc
> > +          - const: st,stm32f42xx-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - const: st,stm32f746-rcc
>
> Why this isn't just part of enum with first group/list? Different
> groups/lists are for different fallbacks and I am pretty sure fallback
> is the same.

I tried running tests after applying the changes you suggested, but
the tests are failing.
Thanks and regards,
Dario

>
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - enum:
> > +              - st,stm32f769-rcc
> > +          - const: st,stm32f746-rcc
> > +          - const: st,stm32-rcc
> > +      - items:
> > +          - const: st,stm32h743-rcc
>
> Same here.
>
> Rest looks good, so with combining entries above:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

