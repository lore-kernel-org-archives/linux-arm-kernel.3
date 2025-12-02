Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C8DD11700
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=; b=I7qMdKVzjJGTkL38Z7oiKGleN7
	H0RedA4Kfibzrsv3QqcCmgGyXnOBoMgCehO6jR9HRk+ZLwiYHOMTX8TSg6x4VEgteeo0/1aOzyk3M
	PyJY+xSGUlCSc310DFa6rGnqj1lM0GH4VJ4TLcNPrt69uHLh8KgtAHHeF5itdL6q18KJh4fCQhiuI
	Fl8/TthwExqvDVLounkasDLReWbKu1sBkOLA+I0m65TYocSO6lDoE/5s4rX9HR4M4axSisziBR905
	tRQVvp+Y63nuxReuIzr7dOAirZSJsDwnyLkedEVn9YYFAsq9WC03dPD/9wr0G8OUl5YkeVXbnZ45O
	dR1HeXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTBz-00000005cDN-0661;
	Tue, 02 Dec 2025 16:25:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTBu-00000005cCr-2Nki
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 16:25:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so35084255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764692724; x=1765297524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=;
        b=fk4WnwjNYY/2v1nZARwdM38TUcB9UJ3zKMPVXvAGa44IprJy6oIls/0a7SEDvWz7ZD
         rxgmqIfBmQGzPYyCUfaSKRFOH8zrGy39a1n8nHWal/eWRyKfF4Wx89QNpoE8j0rYOe9l
         v7p3intUBZO5i+FtVCOhK8v2/uz3ejfSTNSKYsLS0ctwwAt6chgtfVoP6gBP5Qbe2Q7+
         DjfDjCM9/ByESThAYzJj8pfCWFB79nMGinPuTIe1yKKK0jLdxTVaYnrhRNiD8suar0KE
         1NWSPR0PpVJuM7SSyQc7vmDDIAnzUE98il1hYkvGJkXhqicvybynS6MCDCL8dDR1QoK2
         nOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692724; x=1765297524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=;
        b=tfiJG9n2de2KJuVYfnN8Hm2XiI6dAnLjbFAdgh/MDLgWboeJt3k0DgP17PtTJHl2FY
         MOYbg4NjRNx+9NYm8FhV6BUFs3HOMTo6lvLOKsx5DNdR0WMlTUq4wQpkrSbRnCDqrCYX
         E/Faq+/vzXfg+pdq/9NQCEtaqkWWLYVj4zpMe0VB9NYWXVgokzzUW1qJ35tReBWthYpe
         Plz8ZPzBdEcTFgW4vcIHWCIKrkMzqCg66tPI9RfhpmUbqnv9RfKCcQ9ZGVfi50vbQycl
         QBMRRrzLIFE4ckg0wl6bUk3JIubhaxzbMCBoLkokYDi1WAtK5f6Ko+pVFc74Zmd741MQ
         /aeA==
X-Forwarded-Encrypted: i=1; AJvYcCUhlnoxaffyvpY0tVIxuTP/FpfVBqGdmnMIHhm18NyI+7t8OwTNP/RLulejspO2jUsFx0g5YmvFsozt6MYRwSUq@lists.infradead.org
X-Gm-Message-State: AOJu0YxN6o/ULnfivwD4rlIkuYsWuBhYTWB+sA5Y621LQKN4pPUyNpwh
	KeiSqcjuVBWL2mKUSlSOGxhFFEf8YfDL1iYp6CFIZAlB6EhfTvvgrX9FM7QwE0ZQ2CtmvBFFJ02
	2+1+j4AErcLBq1dkmxvDfpwTq1dvm6VO2Xu3Xcq02
X-Gm-Gg: ASbGncsCCfHBWKgy9eJzzNFNalDfVcupepAH6iYO8Jg7Wiw3a8NRZaW0huL+v2gW6CM
	+/DAiZMQFPXJCsxEb5zAPuFDqe3fyFXCdI5XAHA4zYdo8HD+hF3gLiJ262U0P+iLurWjuHTkalE
	WyhAH7XlZQoRRbc0Ys+3EYmqbD9BBjIP0jo6P8IJ+YVlKdJjiP18MDpDWRx5QBlEy9n3AZ9d1lv
	Rg+jCPWj28o+/OfMWvV1UKauj+92WsiwwRFS5Q4FPM06woOj6rykzdlMcijTa7Azcu05nyNkcwc
	CyBPPvswxzNxVTKU8dY+cH6OXw58XeR5TQc5
X-Google-Smtp-Source: AGHT+IE4G9icvFTi4G31CX4WGeT5pU2lGVP4hWaU0UtxQPpBaqTsf8OMaEZe1X38AnxII3RFCgHJu8dMtfftlpYsffA=
X-Received: by 2002:a05:600c:1547:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-47904adff1cmr325914555e9.13.1764692723568; Tue, 02 Dec 2025
 08:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
 <2025120209-unstylish-john-2a6c@gregkh> <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
In-Reply-To: <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
From: Doug Anderson <dianders@google.com>
Date: Tue, 2 Dec 2025 08:25:12 -0800
X-Gm-Features: AWmQ_blwqi9oyEjuzVvnRUnzW3pTAJekeVpgwKfN72pLxhs1IzFYcf2tLSKp3Dg
Message-ID: <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roy Luo <royluo@google.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_082526_631758_8A820525 
X-CRM114-Status: GOOD (  31.64  )
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

Hi,

On Tue, Dec 2, 2025 at 1:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> >> I plan to add ARCH_GOOGLE as a dependency in the next
> >> version per [1], so the "depends on" would probably look like
> >> the following per your suggestion:
> >
> > But "Google" is not an arch :(
> >
> > And really, the whole "only have a sub-arch symbol" is something that
> > personally, I think is totally wrong and prevents kernel images from
> > being built for more than one "arch".  As an example, the Android GKI
>
> Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
> case. ARCH_FOO in this context is SoC platform, so e.g.
> arch/arm64/boot/dts/FOO/.
>
> All of ARCH_FOO build into one image and that's recommended way to limit
> unnecessary drivers.
>
> It's just confusing naming for whatever reason.
>
> > kernel has to support more than one of these, so what does putting this
> > behind a symbol that no one will actually use mean anything?  Android
> > will never be only building a ARCH_GOOGLE kernel.
>
> But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
> ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more.
>
> We had this talk in the past. The point is that these drivers here are
> unusable outside of that hardware platform, so only when you choose
> hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be able
> to choose these drivers.
>
> You can also look at ARCH_FOO a bit orthogonal to actual kernel
> architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. The
> drivers should be available for all Exynos-platforms, regardless whether
> this is arm32 or arm64.

FWIW I don't feel strongly about the ARCH_XYZ Kconfig settings, but
I'd tend to agree with Krzysztof that I personally find them useful.
Sure, it's fine to just turn all of the ARCH_XYZ values on and they
shouldn't conflict with each other, but it provides an easy way for
someone to know that certain drivers are only useful if the kernel
you're building supports a given arch. If I'm building a kernel that
doesn't need to support any Qualcomm boards, for instance, I can just
turn that arch off and I don't even need to think about all of the
Qualcomm-related config options.

FWIW, if you do add a "depend" on ARCH_GOOGLE you should mention
somewhere (maybe "after the cut" in your patch) that ARCH_GOOGLE
doesn't exist yet. It should eventually exist when some version of
this patch lands:

https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a=
1f1395814@changeid/

...but it's not there yet. ;-)

-Doug

