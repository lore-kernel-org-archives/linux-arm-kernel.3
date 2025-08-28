Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B00CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 02:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tr8fRegpwWz9Z2Jl9ViCSuc9Ne2scbBZyW6N5v6Io8g=; b=KjrUWyNoyk+K3YHRqAKVQLDqtN
	ZRLg3102aOvns3FVPQEV2PyARdroBZO09Ca9vNuGEvYVnkn5S8Oicg7zaLi+OZyVs0s4mTCI93W97
	STdJrEVr8tU7SAD11aVTxLT0kDk9tXogNvc/o+kGVvRbFxq9Qn1h1DIa0FcH3LFgUka/9J0fH/lvm
	CGatntvV1EEvOJB+MAUZl8O8gf/B6lWdR+6fhNFGBxVuUW0vXSNwU+bZ2+4q6eY1/PZhsq6s59xwi
	jOfRTVKPdPX+KbkFBGYjXeXbOJ4ff31ejuOJi8jflIDdorT1JMBaFr73Tm7D2Z0GJhcv5crDAnF3E
	FUATOXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSm1-000000003xn-26om;
	Thu, 28 Aug 2025 02:54:01 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSjJ-000000003jq-0sjZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 02:51:14 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ace3baso74284666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349470; x=1756954270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr8fRegpwWz9Z2Jl9ViCSuc9Ne2scbBZyW6N5v6Io8g=;
        b=RP4K9lDB3RZnQEEG04ozsK66YFqQ2XWtTvkoJBRJNU/EjWDjx+F/6zNoWUnCm1YcKE
         Bnj/v1jeJ0Viv0w27Zhmz/AaQUfbyserm050M5aEhMmb7ykzMttEJ+lt5vK5BTsO+AQz
         A/9t7o9irLwkXVyfzfRLOJ1pQjOZ2djHKdF/KEnudYF/0aS92lsDb+9xMqwxDzzm+fTB
         bpIwT+yniC6Vlg5TylEhUtg57WRVTXfcwvNLB/+DArjn0+qar8YHHuBwV1SDm2c9Yfa8
         wLG7J/VtDl8jcgkzr1JygwUdl9/YVY1upiLxdp/J76mmedlCefVmZg47mWsILNz+A0pL
         lRhA==
X-Forwarded-Encrypted: i=1; AJvYcCUawFad2NNXeyYTJZJFsx/Ik7Gmz/vhTYExhn6c6mmQcxRKCxnRFZkgx0eCXLYoLgAGQfTFNM4HQUXOutMWcCQm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ItkOVYMUxTTyapPp6obBQ2plpSbqGxxMHTgQddUCyZtDR9W3
	/5FxC1u07mOkIq8mZcg3TRyHSZVEcCQH/pMgpanHu/tEwDcbdgutsmErWuLUACm8Qk4=
X-Gm-Gg: ASbGncugu11Co+/exK3VyB/ysgv+3QW+qfpJ/wAPqgpObQ8CDVtF9IoB6QOvYncURx+
	VR0eBCy6bSnwEDZ0AtffroLcOw6VcDg77QCx/JgDLsR583TnYpx9ndhYJG1jil/nYVMVQSKyWlT
	yluUMuR6IkfORMQCN+twRrNtpQiasENfkCFt42jN7u7KxKaQZC48S/gqrtfKcXUSc4dhhoE0c2U
	thI6jvzBfCz0/cGrTGJ/Z2cgFH/kyu6hLC6oeE6Ncy26TrXdLpAuupF26soPA4z6OF9UXT7DMlK
	qJrO+SIzz50WQgedlR4ME2tongb0Xn6vYy0FT8U900N3vQuvizI1Y6dmNYMd+V71OTe9dURp6ZW
	ajwh4dr19GHH9kXd+59eP0Zi14D7f4CuKHYfi2WwPumektskiOIAI2UWgRW6kPdKfAuN6uZbQsR
	x00A2bhzUBogZPDkjbffk=
X-Google-Smtp-Source: AGHT+IFayRgVNzYQbCPbSaj279uj4xsQ9yVKGryphEpaBTLvial3go/rTFVgm486unURDuSK2jBiPg==
X-Received: by 2002:a17:907:3f97:b0:ae3:bb0a:1cd8 with SMTP id a640c23a62f3a-afe28fc55damr2087876266b.19.1756349470374;
        Wed, 27 Aug 2025 19:51:10 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afecb2de06csm202763866b.27.2025.08.27.19.51.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b7550c0so661334a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+pDowruHm+j1hBRRN04rYhvzOdNe8wpkYlFKwarEFL8zMzFVtqr5fygbVe5ban2PYi5ublw3B6sw1CabDIr8j@lists.infradead.org
X-Received: by 2002:a17:906:4786:b0:ae0:ad5c:4185 with SMTP id
 a640c23a62f3a-afe295c1d7cmr2038306966b.57.1756349468922; Wed, 27 Aug 2025
 19:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net> <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
In-Reply-To: <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Aug 2025 22:50:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_iyVc-VAUAZa8MNwhBqc301R4qTbKghYqJiw--5+DvwQ@mail.gmail.com>
X-Gm-Features: Ac12FXxvfDB4kcNEaDqCMIyxqJYPH_rJJ8_AlceL3uhtx24kHMPD9Nj5WNKrAVg
Message-ID: <CAEg-Je_iyVc-VAUAZa8MNwhBqc301R4qTbKghYqJiw--5+DvwQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_195113_250284_26D745E1 
X-CRM114-Status: GOOD (  17.72  )
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

On Wed, Aug 27, 2025 at 6:07=E2=80=AFPM James Calligeros
<jcalligeros99@gmail.com> wrote:
>
> On Wed, Aug 27, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > > ---
> > > Changes in v2:
> > > - Added Rob's R-b tag to RTC DT binding
> > > - Removed redundant nesting from hwmon DT binding
> > > - Dedpulicated property definitions in hwmon DT schema
> > > - Made label a required property for hwmon DT nodes
> > > - Clarified semantics in hwmon DT schema definitions
> > > - Split mfd tree changes into separate commits
> > > - Fixed numerous style errors in hwmon driver
> > > - Addressed Guenter's initial feedback on the hwmon driver
> >
> > Don't you think that is a bit useless ? You might as well say "Addresse=
d
> > feedback comments" and be done with the change log.
> >
> > Guenter
>
> I don't think this warrants a v3, so hopefully the amended
> changelog below will suffice.
>
> ---
> Changes in v2:
> - Added Rob's R-b tag to RTC DT binding
> - Removed redundant nesting from hwmon DT binding
> - Dedpulicated property definitions in hwmon DT schema
> - Made label a required property for hwmon DT nodes
> - Clarified semantics in hwmon DT schema definitions
> - Split mfd tree changes into separate commits
> - Fixed numerous style errors in hwmon driver
> - Removed log messages sysfs read/write functions in hwmon driver
> - Removed ignored errors from hwmon driver
> - Removed uses of dev_err for non-errors in hwmon driver
> - Made it more obvious that a number of hwmon fan properties are optional
> - Modified hwmon driver to reflect DT schema changes
> - Added compatible property to hwmon node
> - Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df=
6c3e5f19@gmail.com
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

