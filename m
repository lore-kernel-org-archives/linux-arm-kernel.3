Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C8C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD88yMHNIqJLGJNkFMm447HbjKIEZj0pTYj6EiAF6fU=; b=2M76pt4OZKbxPeeZBom96mQUaA
	9uaktIELKZQ4961DxNPA7PTR0dtpgFT7bhGHxOrwhU6ajVRBr3pgeaCuD+aG7/yFJxS3RQzKjdJp6
	MPft43PcvyyRPXvpcyLVNO4YKGzYm8YrwTJLdMlNSmzlRWIp6fM6rmfstOC68z3H0Mnrw8tcdT6je
	eXydp2PYaB2AJpYm5rWTTtw4WeoBVl1xgKketvv+rrY1xk5ZOCZKAz0zCDYUqNkuCvQrw9XHvrMHX
	SmiRvVvhRw9M9rePzlzpInzZJvKUdhggwU1kApwYxDcopfZJcRp5mSb7tMvC+IcaM/DzJwMmZvpg8
	lbZDw2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2qJ-00000009N0O-1rac;
	Wed, 02 Jul 2025 19:10:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Nj-00000009IYA-0xs1;
	Wed, 02 Jul 2025 18:40:32 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so213433b3a.0;
        Wed, 02 Jul 2025 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751481630; x=1752086430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JD88yMHNIqJLGJNkFMm447HbjKIEZj0pTYj6EiAF6fU=;
        b=JgMEE6vOaIyyWogroVhaiBc4pGqx1CGXgbHvf+F9HilKczDiGQXXUfhp4oaQa57xr7
         C6u+5TBII25PdYxj/YLGVULcku7AarQ+UAWt3opCnFwJHEtJid78apLKHq9Z0fEM8RLi
         5wxkrUOqcvIkQtYfrhEoq+EMV69Ts+7Gk555Ve2hA2rrz3I8wOtE7dedhJJ4h6CX5T1e
         3axJifVdvgixbKxH7x/3Si357Rv4nL4fGeXIm7JAGQmzrWG2kdMVsX8/zc2y/0BaaKSe
         Wlp5gAzmxlvwlpK+xEDTqRKmhmpupwczRGrtVkL6GM2JJoq0WaK5IVqaYVJhRNp4XyeU
         5SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481630; x=1752086430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JD88yMHNIqJLGJNkFMm447HbjKIEZj0pTYj6EiAF6fU=;
        b=LaLvMOTDni5EmB56L2rYrqhsg0a7m+EN3DBImyPGXrsy9C4DLujNVTKSYIDOCS9PcL
         ON6meBjfM/ukqus2LDlPgYqcuVy4xtoE6TBg5D2bafLe6IlxwOpAYMn0d8JXZ1sRPfJ+
         VFRdr5BY3Sg0wR8HzYxqZEPULsjecL2LC7jXiTZjFprDVno4naoSOVZZIC3Lyl/PcLDu
         jYPPS8eomSJAYWw7eExgQeup97LCe+VIrhSVcZh09zaNzyJdcJ8rACsnkcd9M4i6MVPI
         yM4gShnI5xT80JiTSjhcZi/wQPTQAZl06vmsXpSszZLumxHGwilCYcqWfzEl8MGrfocb
         /SaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs7rj94ZqQB4KYbnaXR/qNwiNytiEkQttvyCXp5M64TcNtL4R/+7agafuA5iIeMmcH1DWeb5WpBMpiX9/o@lists.infradead.org, AJvYcCWC5n6tIJ6VYSBhfP7V/BQTvJFGft31iVn8ZjwO7QCV71OnuykbigujyUNgNH72j7ec3/vMXub6nrt1njrgs4pQeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAXv0mYCpmlGrBi9feBWwa9FSom0HZfbMTCFtaprFYELMMB75v
	dJLzhWOAbjwI7O9ISZ+YooqQEaNDEDLhVkntfTJLL5FZILSStTFYjd7BliQsP6AFTx+6e3zJ1TI
	EkBQFRg3LFGM4z6kWQKzQac7A9Y7hpfg=
X-Gm-Gg: ASbGncs08hXWGK0YeYLQrJv2D1ISu9itz+56wmKPCs3TxYcnqRlvV4UU8so6/qgSwOS
	Mb96Se8eMoK/RTKJotEs9AESw3VTFaYkRUssKLWKEm/PjuOOeazvubt/AbJ5djmmvcND61rf6bX
	yFP4veDMtkdX+wejjpq60nUV5yAUEKxN/Aedv16/umxbvDbcpxjmJEWlCm/oXKZHhFNJ1cA5ESj
	7oY8eGyM97KkT8=
X-Google-Smtp-Source: AGHT+IG65z5JM5OzIy1s20zy0osr0gbaem7rZyJo8s4662EGg8M9d+IcT5RnhEheXmCheH3vHusHJ+Ckhe0dlVQMHpE=
X-Received: by 2002:a17:902:fc4c:b0:215:b1e3:c051 with SMTP id
 d9443c01a7336-23c793c0efcmr7045825ad.11.1751481630377; Wed, 02 Jul 2025
 11:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
In-Reply-To: <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jul 2025 20:40:19 +0200
X-Gm-Features: Ac12FXyR3mTzwKK3QsWJnUHD7XVn0YOVkSs2GNj-PlIQxt00gwgIj8Cr0AYFXDE
Message-ID: <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Da Xue <da@libre.computer>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Anand Moon <linux.amoon@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_114031_267793_6F1DCC69 
X-CRM114-Status: GOOD (  13.06  )
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

On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> ...
> > If, as the description suggest, the regulator framework somehow ignore
> > the timing set in DT, maybe this is what needs to be checked ?
>
> The regulator framework only cares about timing for regulator on.
> Regulator off just turns off the regulator and returns without delay.
There's an exception to this: gpio-regulators without an enable-gpios
property. My understanding is that regulator_disable() is a no-op in
that case (meson_mmc_set_ios() even has a comment above the
switch/case statement), see [0].

> The code makes incorrect assumptions. Then the kernel resets the board
> without having enough time.
Can you please name the board you're testing? I'm worried that I'll be
looking at one .dts but you're looking at another one.


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/core.c#=
L2980

