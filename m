Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F01CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9u83kC+rt7nZCWulip1b6xtkpKKymTmDmInRZDupgQ=; b=cOVuEz101zTmP/u5mTiOtrwTFm
	HQeOL6C7o5lraS5c5AfL5Pdk7Nzq0bmMq9UHCmqmuvRxuMrTKUnhWSxJlqwMxke9Qc2VxJkh8qEw/
	PsPPEc8Ao9HcZVafNNdLt0QredJphEdMy2OOhvVa+MvQUjYnWh0sJLRXqzlIk+QP0HluJxeyyK+80
	EZM6mb80FGzfhT08fIc8xa9qyYs+WQUWEj3WbekHd0AkfSuUHAiNYrUwoTfv4YUXtAzv0IdbDUuEh
	n3uc/YVklgDSGQzP5EKxnvJo2MAeLhlGX094E866eLTZeK2rjJCQjM7bKsqfLaRf4kFiXEKOt8bVc
	pxryKi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAQSX-0000000AuVI-01uM;
	Sun, 19 Oct 2025 10:16:17 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAQSU-0000000AuUv-2tIz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 10:16:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso1992072a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760868973; x=1761473773; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9u83kC+rt7nZCWulip1b6xtkpKKymTmDmInRZDupgQ=;
        b=MKyq7AKJ5GddikYFqWxFQmj/oBhsWLGCsmA2zABVUyxWmYuf1NWWKtsQhL7N0RQjxg
         iI9CSkt3K++Q+mVsYgFEDtv99LZnbpQpgGHEUjew9aW3bKH62jEd0BGCcCinZBd3HXTZ
         utqSjbPnhDp6TKR5eQTUo4xYxCIU1ZhuI6swo5ADpsxGYyIPgrO4T+BLbxlC3XzalYlF
         vENaZDehMZqZe+kO5K3YyUqdx1qST7XaVetyzg9wxzRd/mVz+KU8wXKj+MhxK/xLs4E6
         j4o+2WVaggwCPv2ZXyswgg0VS1huDYZPgBH8TQaTg6Fo1FMzsINAnNCU9gRZREQs4glT
         Ohng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760868973; x=1761473773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9u83kC+rt7nZCWulip1b6xtkpKKymTmDmInRZDupgQ=;
        b=jpBlUZbSK6EiZNOUXZ6m4q7322eGFjEzBAoUZAAyQExg6qNYmpUNNX8okQ/bVZ0iWo
         RMl1cFNYvn4SxeGBA11On6a435OKJU2Bat4sw1xIP4Th+G+h+EecO1sqUvAjaNoFS3sX
         yNnR08KYvkxGve3MUNMLlyoWJ5g0Z1bH29+DGMvQElWDW6Go+VnZ5gSVQKjiWrJto6C9
         kOpLR8ubLbjhtHuMAnkBv9WHoasiyOBX+fxZ/v1bTm+x3MqXZWnPHEuA3elChRVxw9jE
         S1m6fjUs2wiIEor451el9e1avsu1Qslt/KBPAun6I2SzFg/ZdS9+QiBkI82+GZ12wpO/
         sOTw==
X-Forwarded-Encrypted: i=1; AJvYcCUxFivtGONpcYqMn6hjj3iOKnB9JfraaZZZzworwz4bk1Mu+u7QolC76LyrrfjsNqxE759bt6nEOrCBNHfFQkqu@lists.infradead.org
X-Gm-Message-State: AOJu0YySCxFhrKqxyRrpzLcDIIqhT4fjlVPCgW4DdY2Kd/N308D2N3qA
	3SPTGHLYPfSAqi7ePaDU7v+5AgTOQKOHA++je5AefypWYDsd6qzWuOaXNobVdB7sbbaopIDzlnS
	z4KOKV6A7hWlBDjuJMWhkEepvRHQldxdS0+HJ
X-Gm-Gg: ASbGnctDoRt3M6UmX2NcbLHtXhmxLiSTiua61HBZN93NmDV8UiD4J7YDa6pc3YvBs3B
	DwhxVYpt0OS1nmdfejh7RTstZdf9Fmxv2DB83FKiH8msthkRlnfqJSHO3uMr+Hq5gNfT5aT5/Md
	ms21U5tt4Omg/hj04CGbtAKe4FTvpdpEonf1cOMBnrsw9YVS+x51e7vV75tZDJXuV8C5Qh1C5JP
	W3VzksPK6+6pWwCWVLiG22xfOKmB/FAZpAsksLCfk0kmAEb9tsqYUUU7guqddY7NCKsXw==
X-Google-Smtp-Source: AGHT+IHF5j3FxHGqGSMc6gTJFWS25mlgIJJ+B9ZAQH84yMytfrS9hAu85pLm9QkNmBBzhedGsITk+O2Ty5GQr/NWr/Y=
X-Received: by 2002:a05:6402:3492:b0:633:7017:fcc1 with SMTP id
 4fb4d7f45d1cf-63c1f6458b6mr9014013a12.14.1760868972724; Sun, 19 Oct 2025
 03:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251014113234.44418-2-linux.amoon@gmail.com> <a2cefc72-de44-4a23-92d2-44b58c8c13fe@web.de>
 <CANAwSgTtaAtCxtF+DGS-Ay4O3_9JMwk-fJ27yoijhWWbF2URrg@mail.gmail.com> <cf656a57-bb2f-447e-ac6c-0ab118606dc9@web.de>
In-Reply-To: <cf656a57-bb2f-447e-ac6c-0ab118606dc9@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 19 Oct 2025 15:45:58 +0530
X-Gm-Features: AS18NWDvRsVHc0V4iNWmDuNrhP4ZScJhRSS4H0sOBjz9i6y50fgIVE5YKoNz78A
Message-ID: <CANAwSgT0jSQ3pFR3MQo-ENziqrm=yn-rFBTdHegmknMeFd44OQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: j721e: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_031614_767675_93CDA138 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Markus, Vignesh,

On Sat, 18 Oct 2025 at 16:12, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> >> I propose to take another source code transformation approach better i=
nto account.
> >> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5=
031-L5075
> >>
> >> Example:
> >> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/pci/controller=
/cadence/pci-j721e.c#L444-L636
> >>
> >>         ret =3D dev_err_probe(dev, cdns_pcie_init_phy(dev, cdns_pcie),=
 "Failed to init phy\n");
> >>         if (ret)
> >>                 goto err_get_sync;
> >>
> > No, the correct code ensures that dev_err_probe() is only called when
> > an actual error
> > has occurred, providing a clear and accurate log entry. =E2=80=A6
>
> Where do you see undesirable technical differences?

The primary issue I wanted to confirm was the function execution order.
since cdns_pcie_init_phy within dev_err_probe function

If other developers agree with the approach, I will modify this in a
separate patch

As Dan Carpenter pointed out - " Wait, no, this doesn't make sense.
It's just assigning ret to itself."

This patch seems irrelevant to me as the return value gets propagated
to the error path.
Sorry for the noise. Let's drop these changes.

Since I don't have this hardware for testing, I will verify it on
another available device.
>
> Regards,
> Markus

Thanks
-Anand

