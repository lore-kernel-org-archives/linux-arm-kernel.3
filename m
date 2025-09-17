Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F7CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE5z6SStGstCRNv9ltTlbMEXuvhA93B8hSvu3mrmaPk=; b=h7RS0mSQO6ZzZipCp7S57287tc
	jADVDqxWLmFqHvVfeBP6FbujtTzSTOWxdUrATKxTlCygb8CWtH69PyimxWslrTQp6AsmouvbZQ0JV
	aIbIv9Krxm2RM34pO6OXzLSz9J54pAYv5vpD3I9qdX9mGOMHvn5p9Hg06u2Zq8Xeu2ouersyKA2bP
	Lf1iNidVVyLaP0qowKUGrTPOM7Og2r+9SwyI5rVh8z8oaX/Lbyv220NYwRIsipD0ZM5r/nygHoJjY
	BcL7/9DO884QTf5r9ndHN8JOLVA+74BVDURlF7v82jGkCiGqVy1ArMqR6aj2mKCgj4/Aa7PsqOUJ3
	SDA2OKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvqJ-0000000DWKL-1g3X;
	Wed, 17 Sep 2025 17:21:19 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvqH-0000000DWHw-2Vj9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:21:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso5360a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 10:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758129675; x=1758734475; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jE5z6SStGstCRNv9ltTlbMEXuvhA93B8hSvu3mrmaPk=;
        b=gQFFyaul0VmsTJdpFFzrmLCUAvt62TJ6wYe5XP48cwqo6QmFmCWmjnBt3/iXxmV3cf
         ZL5+UvYqNM4eryme22LAJwH/W/s1jihZs6o5ozk2eLHdMmBBc1lIMeRN8U4NobC6FD3w
         xIo/bHPlstGPkf0ZQSCnQkSfGVnjX/kjGDYw0v5D5Y9YYRvhuCE1Q+Ib7zbRn5N31A7A
         ZZsMM5EPpnUYU0j4c0xqd5/itsQ53P3v81w2Cy1E7ClUsV8wy0tYb3S5EYgk+NKRf+VP
         w+5Xq5QJAjNPqUx5sg/M+33eNGSoyyV3KA8aFu65aLpEocPdhsmjQ/U0PkRtHYHahi9v
         Wx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758129675; x=1758734475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jE5z6SStGstCRNv9ltTlbMEXuvhA93B8hSvu3mrmaPk=;
        b=RixW6FxDcAtZPgmGKJ/nz/cw3HAHs3an6aTB3lenuN/GWrdUBnnjoeEnrWSnWJGJvR
         EdtkWeLB2AoQG4w7/ZT2+/9HYNKxbui3P68pB+v096N1kohG7uZFpXeEkY1xvFTqiTS6
         c8hKb3Z3uF34zhi9WEZPt/cusACachbFtSOKDvvSfDoG8JAKYyiq2FdteXp76vqbz5oo
         2b/qWNdUyh7hRvGECfFXg4Xqj+Dmp7RY0/qEp5fJZy16wYKHeBQLtwAQNWe+RsRBU6dd
         vlRO69KcueG+aIYol/1jayGzpLUOFpOXFchr6Zm2mJIT+1Xht2GzIGraeaZn3xcGqQZc
         mgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDt7wW9YI7kiEXhEZE4TU4KEhNWUYBcquO2RQvVVs5GDXt02UpHB00WJVUiFLNrbl3wNQLh/ZeUdbdXknvmhHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwnrMJhPwBTS/UanV6IAhSDqKtja+chqr60djDwk17XFh9YESi8
	RdW3bfQ6IsT9eV1OM3m3/R/7JApDGjVPF1oEZP4I7XGGsKdOs2H9acDv3SOp25hTztIhUyRLTjw
	Gy06bxKbPXRnQdoA4CRtWbIqPpQcyBqXPal+8Mr1l0g==
X-Gm-Gg: ASbGncve6JivQXMvrNYIknShAG5Hpg4WxLc+RerQmMaTvwjWF2C2jroIPrtQjhP7Bzv
	pbqykt4S2aJExqfFf/yJdBkxdieKbjbIuy86nyXNAixl7l2692UKB3SpfnFETdTk+i6JndH++fe
	0sD+87OYX+A4uY47LpOIq/JUmCMjrxPAQ130FkE+lHn4LvAZEb7A4GtFJ9t0fJKR+zxG1zWNcFq
	tHmTLe45CC7rVoV5xbIL/j4UqURNih5YnOC6IR5c+4oQbc=
X-Google-Smtp-Source: AGHT+IEkd1wU5hGZ/gLYNvwM0MAW/mjMU6QrKeYk8BM4gj6vi/UmJm+Bn6+Gz2aNpC1XRxR9/RFUm05c3RIj8Ydo0XM=
X-Received: by 2002:a05:6402:5205:b0:62f:5968:ae0c with SMTP id
 4fb4d7f45d1cf-62f83a3c874mr3294259a12.16.1758129675198; Wed, 17 Sep 2025
 10:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250912141436.2347852-1-vincent.guittot@linaro.org>
 <20250912141436.2347852-2-vincent.guittot@linaro.org> <aMp0hNnBUwTV5cbp@ryzen>
In-Reply-To: <aMp0hNnBUwTV5cbp@ryzen>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 17 Sep 2025 19:21:03 +0200
X-Gm-Features: AS18NWCc9Wuje5i2tQbCh3xBqxRFBZcfMF6Z2ZM58muUKw4hiti-IcbYy-eSg-E
Message-ID: <CAKfTPtDTnzyksa4Om1HgZTJX7dGeM_vYiEV2eQnEi9AmZK7KEw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
To: Niklas Cassel <cassel@kernel.org>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_102117_666090_281C1545 
X-CRM114-Status: GOOD (  36.40  )
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

Hi Niklas,

On Wed, 17 Sept 2025 at 10:42, Niklas Cassel <cassel@kernel.org> wrote:
>
> Hello Vincent,
>
> Nice to see you sending some PCIe patches :)
>
> Quite different from the scheduler and power management patches that you
> usually work on :)

Yeah, It's always interesting to explore different areas

>
> (snip)
>
> > +  nxp,phy-mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: Select PHY mode for PCIe controller
> > +    enum:
> > +      - crns  # Common Reference Clock, No Spread Spectrum
> > +      - crss  # Common Reference Clock, Spread Spectrum
> > +      - srns  # Separate reference Clock, No Spread Spectrum
> > +      - sris  # Separate Reference Clock, Independent Spread Spectrum
>
> This does not seem to be anything NXP specific, so I really think that this
> should be some kind of generic property.

I agree. Thanks for having shared the email threads on the subject.

>
>
> Note that I tried to add a similar property, but for the PCIe endpoint side
> rather that the PCIe root complex side:
> https://lore.kernel.org/linux-pci/20250425092012.95418-2-cassel@kernel.org/
>
> However, due to shifting priorities, I haven't been able to follow up with
> a new version/proposal.
>
> My problem is not exactly the same, but even for a root complex, the PCI
> specification allows the endpoint side to provide the common clock, which
> means that the root complex would source the refclk from the PCIe slot,
> so I would say that our problems are quite similar.

yes, they are all the same

- common or separate clock
- Spread spectrum or not

and finally which clock to use as the reference behind internal or external

In my case, I only need to know the first 2 items


>
> Rob Herring suggested to use the clock binding rather than an enum.
> I can see his point of view, but personally I'm not convinced that his
> suggestion of not having a clock specified means "source the refclock from
> the slot" is better than a simple enum.

Having a clock binding to define where the clock(s) comes from could
be a good way to describe the various ways to provide the ref clock
and an empty "ref" clock can suggest using an internal clock for those
which have one.

But I don't see an easy way to describe common vs separate and with or
without spread spectrum.


>
> To me, it seems way clearer to explicitly specify the mode in device tree,
> rather than the mode implictly being set if a "clk" phandle is there or not.

I tend to agree that getting the common/separate and w/ or w/o spread
spectrum is not straightforward.

> That approach seems way easier to misunderstand, as the user would need to
> know that the clocking mode is inferred from a "clk" phandle being there or
> not.
>
>
> I also note that Rob Herring was not really a fan of having separate spread
> spectrum options. Instead, it seems like he wanted a separate way to define
> if SSC was used or not.
>
> I have seen the following patch merged:
> https://github.com/devicetree-org/dt-schema/pull/154
> https://github.com/devicetree-org/dt-schema/commit/d7c9156d46bd287f21a5ed3303bea8a4d66d452a
>
> So I'm not sure if that is the intended way they want SSC to be defined or
> not.

The above provides much more than what we need as it is mainly a
boolean for pcie than characterizing the spread spectrum itself

>
>
> I apologize for bringing up my own problem in this discussion, but at least
> it is clear to me that we cannot continue with each PCIe driver adding their
> own vendor specific properties (with completely different names) for this.
> Some kind of generic solution is needed, at least for new drivers.

I agree.

Regards,
Vincent

>
>
> Kind regards,
> Niklas

