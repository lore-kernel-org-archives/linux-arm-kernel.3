Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7617E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 03:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWwXRg1VmAks2w4R97EeyIv6mOzZzD/tfl3wr1RNSkc=; b=OwoPRGmIH4MyAj9V4CBAcvmEt1
	ZfVaxatDFpOxkz71Zv6VVaVkzBppP71TG7oE5Vrv5sZGqqWmRmMipcOW2Q9IM0m0XEnFpFTgqwZ8h
	Ab3T947IHyE2h7fzlxxP02k1wFSnQx2xqwUHRiM9dT0djIi60/K/zxZqXzWKPr1Ym8Jpu/jdyPxst
	uPHHI5GZ330hnX7SHEq0RXQdZXBC7TAvMx7PsyCBpr9iCNrDY80KU5rLJY77JrMhIWiQL0pBsq4ZJ
	hvoq94dLjMrZxQ+R4FyfhhmDaQqhUQ7dH3f3nPqQXLjOtOsc1LQi5+XB6xkYxphXbWw4MfYHlLPUl
	AOMD3T5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYY0-0000000C1l8-1iQ6;
	Fri, 03 Jan 2025 03:40:28 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYWr-0000000C1en-2LfT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 03:39:18 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2a8690dcb35so2947820fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 19:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735875556; x=1736480356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWwXRg1VmAks2w4R97EeyIv6mOzZzD/tfl3wr1RNSkc=;
        b=R6OkD+qYuT29HyY2FUgoUH7+n9HQJ8AgXOlAknWjx5vv/4Ebi+mfNUsDvSqX53fSXs
         yEJ1tNQw2Bbzs7QfyiEAmNQJNwsYOPvvgZpEiSU5XsoahNm/cfC4nA+VGqPVhSwh/MkO
         kfPXNMLTO0+rVvZT4xs9ZZLpGNTDuF0ZNGH0nWBrzoq3KwiQ7hRTXJiijaRfT3bd0hmn
         L6lt1JuB102KmU9XFFW0VSajZSJgoyRHM8Xmqq2wZbnjM/51lciZsWgdRLjYJMAixkbf
         7//4gicwMrCJRrf1HOJe1U/okXbmBpZ5NwHjfrw8D3dKlGF9V39EEKfcR7cXlRiRcDfw
         YDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735875556; x=1736480356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWwXRg1VmAks2w4R97EeyIv6mOzZzD/tfl3wr1RNSkc=;
        b=OQLNvajoQ9uUmzMAewY00AhzjL9di1kGuR23ptKU89uA8n2VSPmajWiYzWMflFCysF
         cIcmlBKmyZuLgfHq9SNMHapoV50dBskjhnPmpYbwZ4ZsecGdpeJjzHSP1NJinIgBvxQN
         Kr8LUC9lHCatE3jf4mKOo5WgLUx/T2PbECo/ynVIqCaSIIJsae85FrTPOvFjJRsPprSX
         gBtYwIy2ALj0NzbCMSCyg01b55lfJHtQbHQBNadTWqS7HBVJkYt8+NJHrU5uK8QI5c/n
         kUhiF3/iV8iSbiA4Z0YO8i6WvezCg8vg5C1ZoMVAruXuk6oh1+qj3ag+iySFHB3x8HVe
         +OIA==
X-Forwarded-Encrypted: i=1; AJvYcCWpIQ4nBW93Aa25OB9I/UbsNNvxDW6+Jij7yBuP8XB+Kf0RgUytxbVXjmmdA/MCDmOswYZ1ff4+Dm8fTpS0Bxx+@lists.infradead.org
X-Gm-Message-State: AOJu0YyRJFYT4lMdItenHR8zKRm/8BRvp1UXB4W7Wqfj17iRiCHb9FCB
	HBR3BOnGllmjzu5jbt6W7NDaoZu8zK5eREZx3GviwWH6zipbO1223f/O+TjSYSw5LljZ/KZh5dz
	yEGXKN15z/0un9hqmYh77pWnJgVUpAGqJ
X-Gm-Gg: ASbGncsAK1/CrgfMrxj6V6UEGJxPUbA+0QO3nArCCsIpBZx0bSbKWF55LCkaSevSLHZ
	fk9Pz0Z+f2vm/RVNEXKpQRllyKo2PLm9T69O4wJQ=
X-Google-Smtp-Source: AGHT+IHM1WCCKkxCeYI87hg9rwTax0tUBhbUiByr3hkQB9kRpKdWUFzlO6HSwMJZ0R/M6soUxC9LGmKn4xDFLQOUr50=
X-Received: by 2002:a05:6871:522b:b0:29e:40f8:ad9b with SMTP id
 586e51a60fabf-2a7fb0bfc5emr24896900fac.14.1735875555689; Thu, 02 Jan 2025
 19:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org> <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
In-Reply-To: <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Jan 2025 21:39:04 -0600
Message-ID: <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mailbox: add google,gs101-mbox
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	daniel.lezcano@linaro.org, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_193917_598249_565F46E4 
X-CRM114-Status: GOOD (  26.66  )
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

On Sat, Dec 21, 2024 at 12:45=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> Hi, Jassi,
>
> Thanks for the review!
>
> On 12/21/24 2:19 AM, Jassi Brar wrote:
> > On Thu, Dec 19, 2024 at 4:51=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> Hi, Krzysztof, Jassi,
> >>
> >> On 12/17/24 9:40 AM, Tudor Ambarus wrote:
> >>
> >>> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-m=
box.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> >>
> >> cut
> >>
> >>> +
> >>> +  '#mbox-cells':
> >>> +    description: |
> >>> +      <&phandle type channel>
> >>> +      phandle : label name of controller.
> >>> +      type    : channel type, doorbell or data-transfer.
> >>> +      channel : channel number.
> >>> +
> >>> +      Here is how a client can reference them:
> >>> +      mboxes =3D <&ap2apm_mailbox DOORBELL 2>;
> >>> +      mboxes =3D <&ap2apm_mailbox DATA 3>;
> >>> +    const: 2
> >>> +
> >>
> >> Revisiting this, I think that for the ACPM interface mailbox client us=
e
> >> case, it would be better to introduce a mbox property where I referenc=
e
> >> just the phandle to the controller:
> >>         mbox =3D <&ap2apm_mailbox>;
> >>
> >> The ACPM interface discovers the mailbox channel IDs at runtime by
> >> parsing SRAM. And all ACPM's channels are of type DOORBELL, thus
> >> specifying the type and channel in DT is redundant.
> >>
> >> It would require to extend a bit the mailbox core to provide a
> >> mbox_request_channel_by_args() method. I already wrote a draft and
> >> tested it.
> >>
> >> Do you find the idea fine?
> >>
> > Looking at v6, I prefer this version... maybe modify it a bit.
>
> Just to summarize for the readers, in the end I chose for the
> controllers to allow #mbox-cells =3D <0>; and for the clients to still us=
e
> the mboxes property, but just to reference the phandle to the controller:
>         mboxes =3D <&ap2apm_mailbox>;
>
This was already supported, see drivers/mailbox/bcm2835-mailbox.c for examp=
le.

> Then I updated the mailbox core to allow clients to request channels by
> passing some args containing channel identifiers to the controllers,
> that the controllers xlate() using their own method.
>
This is unnecessary.
If you don't pass the doorbell number from DT, each channel populated
by the driver is just a s/w construct or a 'virtual' channel. Make use
of 'void *data'  in send_data() to specify the doorbell.

Cheers.
Jassi

