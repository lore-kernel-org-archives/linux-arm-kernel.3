Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5D2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quwvRH4bGbRvrQGvh2yWVM8KSskEfHUR5/oizr6Kep4=; b=Mjl71vfdsp3u6EFnkZbZ47iCav
	8UrBiJVjhX0VtB084bnSyqudWnVnvo9EF5Qi9fFHmtnzalEVR9fyDDbpZrTzkT8671j98N3HinBhX
	sreVmg4xVJ8PoZJuLaFIbuo99WymRdNCGBlv+PKMiTYHKwHQqvGE71VOnMBcoXJ8tRRX/qU6wsSUg
	XFUQ+K8bYRK+qi/xKp9zpp5Cpg79kAS9Vr5oecOJDn5DSfG2rQYNwM77lFOzWd/6pXLpbwIqbl6bu
	IND2hRGF872gZnYCbAWhRqCJHl8Dpvsec2fTjuThK9cuAVGoweRmK3foL8+4Hmy3nU2KpDuhrokcA
	ly2+DTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1Kj-000000036rg-0rEe;
	Sun, 12 Jan 2025 17:01:05 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1JS-000000036hg-2xUP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 16:59:48 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5f88b61399dso1415491eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 08:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736701185; x=1737305985; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quwvRH4bGbRvrQGvh2yWVM8KSskEfHUR5/oizr6Kep4=;
        b=Hp4cB0dAFtIuGcsHI6qA6XyvhMMWshRmpVsmu9dzwYTZ296U/aB8lr9iKw0aJZnsPc
         Ptprc/XqzED2hWKwN/oc4EIq6QiT+FwO+htyaIfP3eZToQKJhqcu+HU0tJkTLHoZ2T3+
         JUXjTlSh2HAlR4KMFW+0hx3AM6IrzIXRAPTUE0OZISYRAOgbsjKRFiM/1VbKn5Unh5tW
         euwQi+MGh1VofZXQb0LSrfmNNkM2uUlg+jm8dKZRcSJmYYHI4wNqWA2IfTa3nNAY4YqU
         tGSHmPEXsGe8tnNuWJfFlS95np5/8HOnqPjmhL8gnwVq1Yrz4OWtOpasodCJ6KI6pMYS
         fGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736701185; x=1737305985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quwvRH4bGbRvrQGvh2yWVM8KSskEfHUR5/oizr6Kep4=;
        b=aJpi6++Ikq0FvgU5JjA+kj2RdS/kRtoahhsD8svlxf+y0siKmP8dXOEhcaD8SuSkvd
         qnhUGsvQrsAUxPSnbRy03bVeifPhezT++Z0zMkO3gAchXHM2i0sy9qwDBEmqRpp3t6Bu
         siDjq5dRqPSXL6PAAWDd2tvZFYLce0bPjyn6NCwZUuffFxeUizqeTaqr8IR7vbrVHYqN
         h+zcUc6mK+N7neolVLvugpuyOgADdZiUhOCONnMx2P7uxsCFeA4j9FCbcOjDtVh3Xwt2
         SV8OBNaDU3esU3AOR9yRouhAM3FP6qL7XlJdDgZARPZT+pMqwIeOSZzWj0QFjsl217Zp
         mwAw==
X-Forwarded-Encrypted: i=1; AJvYcCVwD+3jBZxRmgrm0mN7Zh1TqDn/jvvH/+yNNgB+ymSJDBm4JvwuOtXWr0jZZrfNGlSHnEd+yyCWhH15gcZlXm1B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8vtBqHwqhOL9CZPpya3vFJEkm0b3EPVzcH7d22u9H/akWSsPP
	bV3/2rqQr4rETbKJwiP7FginnJ7hW+GZIcjP93rquUYJR8oU0jrsMSOb8IYFRgdOxd+vCSw1LNY
	YW/BKbO72lpb4H35BZuXzrRXgi5A=
X-Gm-Gg: ASbGncuZldscqEhCQDxqGJcXlk/fSm8SV8bbvm6boR0fG2V50jufDeCWP6VFC99VPbd
	vVA5jq7v+60Xu+1KGuBWFNdC5Ew5Afx4pBM19LNA=
X-Google-Smtp-Source: AGHT+IEQfGA2U8QldzatkkBgSiG0ZMHBvwWPEdHTVVXcVjAFGGsjXDL6nXJioSINr/i9gFuWSbwMCv44uKtuvxQmJnQ=
X-Received: by 2002:a05:6871:5e10:b0:29e:37af:a943 with SMTP id
 586e51a60fabf-2ad80907cc8mr8709428fac.18.1736701185046; Sun, 12 Jan 2025
 08:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org> <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org> <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org> <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
In-Reply-To: <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Jan 2025 10:59:32 -0600
X-Gm-Features: AbW1kvbTrH1X7Mg1VWhps-7-6TpTz4UKuTz3YpkSXF5eHOwG7kdqYiJ57bLEtrs
Message-ID: <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250112_085946_746154_1334A052 
X-CRM114-Status: GOOD (  19.95  )
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

On Wed, Jan 8, 2025 at 3:38=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Hi, Jassi,
>
> On 1/3/25 9:57 AM, Tudor Ambarus wrote:
> >>> Then I updated the mailbox core to allow clients to request channels =
by
> >>> passing some args containing channel identifiers to the controllers,
> >>> that the controllers xlate() using their own method.
> >>>
> >> This is unnecessary.
> >> If you don't pass the doorbell number from DT, each channel populated
> >> by the driver is just a s/w construct or a 'virtual' channel. Make use
> >> of 'void *data'  in send_data() to specify the doorbell.
> >>
> > I think this introduces concurrency problems if the channel identifiers
> > passed by 'void *data' don't match the virtual channel used for sending
> > the messages. Do we want to allow this?
> >
> > Also, if we use 'void *data' to pass channel identifiers, the channel
> > checks will have to be made at send_data() time. Thus if passing wrong
> > channel type for example, the mailbox client will eventually get a
> > -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I find
> > misleading.
>
> Shall I still use 'void *data' to pass channel identifiers through
> send_data()? I'd like to respin everything.
>
Yes, please do.

thanks

