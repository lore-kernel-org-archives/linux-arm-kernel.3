Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C455BC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xyt88DTwvTCEU6IZGu6Ff5eOVi1/kjHctehvZyzlhzk=; b=PeOgoNAwnDxkQ8g6tpqssyEbnS
	y95zvg0FZTwu4pAtA9/GrkXCBoLF3KrYS4pAJ3CA4frfM6T/K/kLSmsvnNAwLBZUMCSxWQhGdcV9M
	xVdJ+zJJ26DPL8X2AaymBhWrXg1MQ9KdQ0SGOpJAifG8cCEAV3pbiWYS+jeXkC3jECVXkVWWqE3fL
	ZAoL+E3blifdAu2qQ6oTZ47CyTdt71OTvz/LKMzcJYj8/ke4Mbufg9iv0NjYKcIq3UO4dsDLPI4sU
	mOGavDZgWwNzVmNqZHJH3e4hX4H34B2si/jhB2C0UrTLybJKVUbBudmB7pA+Qf1Ose1VKmKJxAUIr
	8hkFehtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNj4-00000005xCi-0f2o;
	Mon, 13 Jan 2025 16:55:42 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNgU-00000005woI-1Xo6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:53:03 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-71e10e6a1ceso1158160a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 08:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736787181; x=1737391981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xyt88DTwvTCEU6IZGu6Ff5eOVi1/kjHctehvZyzlhzk=;
        b=Y+iBiyWdh8dGt/OSViYnwtLmA2XLzJDrV17V97khYxm5AXFZvpMTfooFsmnCC9Mh51
         bbES2PwwM6IQ64zSuaBkFfYjOR09py0WGcLMl6PVORePZedWXGkQ9uoZgCfq5NijUsji
         ur7CNfhsN7VjYiU4sdCQ8qiBiWeymzFmaJ6DFEJlrOKf88+XTo2mSFufyF+rn7GlTqAV
         rXjBkLqFnlZLA8iBdMFHmZgHJXt8mjLzG6+ccIaqINV+aaFYA1YFzruzYfhpTqutkfZC
         e4mYxvCHhRlNxZ+AvTbTGzCE6crLTL4d7BTrHg9SR4LPZlKPqf98zeirtD6T+oS/uZE+
         twxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787181; x=1737391981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xyt88DTwvTCEU6IZGu6Ff5eOVi1/kjHctehvZyzlhzk=;
        b=nphqA5T4/byUWWVJPm0xqHcHfHgvNz7OqUGo16IXiQBRYkphvXhNZMcKGNLcYWgSPe
         2OXS4bqEx4CXYO0ufPB98+h28ZifLbFzxDz2N2Vtw1x0Be+OO+ngSaYglLXxBIX2zhLW
         lcw7E9hLnf+g201C4gR3JdKB3SI+FaZJNfeMCYXV/Rt16MBQqd5+L8B3Z31sE+mVTqbi
         wXmCFW1ooM/KuxUrmrW+cSIoGTiNiOI3jA8464Sb5hH1kcI+6OIXSht+Nh9glod4DVzB
         j7s6eagcn0zSKHeo+g9kuUFxsO26Yw0MDNL1ZgYK7KX57poSd1dOq++YQbiIv4wWHg88
         WcTA==
X-Forwarded-Encrypted: i=1; AJvYcCV67Vb/ZJYZW+x7mRWYKe2VZ3/ru2YLvmGx8kceVWx13nwcvzI5j6XNDCYJ3HU2MNyq1fk2m9390YtDeH8xSkn3@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/g3LSqsm8RuZTUQzH++FfBTcqnnZ5FIaRDhnz1E146SRHe/v
	jCGwHIcmTsMw1XCm216bqjbrwN8vo9JxTqGYQTPGuejjNMr1dkCEoD8QJLXb4lN1q/5rIytR6IO
	+Q/DcswlFIL9GzDccm6Yg30KwOmY=
X-Gm-Gg: ASbGncu86izg87SI28jiCct85AqbARynOEXdI1Ofjo/yv/n/AdGE31jTaOQjTPrDADU
	XdBVB4J1i7TpLoQIwIVObQD4OwDOzoek9xtnZHvc=
X-Google-Smtp-Source: AGHT+IE5cxXt5JR2u+4N8NH2RBAsVODsNa5JluDfwkyKK+baKOF8L+HdL9nECoJbbVjINZwSD4iihC1AJMlo6/b1Pu4=
X-Received: by 2002:a05:6870:2a42:b0:29d:c5e8:e424 with SMTP id
 586e51a60fabf-2aa065478eamr12278674fac.9.1736787181336; Mon, 13 Jan 2025
 08:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org>
 <20241217-acpm-v4-upstream-mbox-v5-1-cd1d3951fe84@linaro.org>
 <ec3cdfd1-df7a-466c-8581-c9546ca6b089@linaro.org> <CABb+yY0rBzP8JPAik5aaXp6GivQKEf++sgiMM9fTPgd_5YXT1w@mail.gmail.com>
 <eaab647a-f6f4-4562-89fa-e64daa80bdf4@linaro.org> <CABb+yY0AkpqC_P-3cHeuWDu-gJzxCnarsNFNQWk45+tHKrDLmg@mail.gmail.com>
 <4e97b33f-b4a5-4875-a65d-9e25bcc5a46c@linaro.org> <8f21d5f2-5327-488c-878c-a62d85857240@linaro.org>
 <CABb+yY0JMZfwR9xQ8s80Kmg0gE1DRDJ9bHB=eMnw70uw5nBshw@mail.gmail.com> <7dc02926-905e-430d-91f5-e1ad7af7135e@linaro.org>
In-Reply-To: <7dc02926-905e-430d-91f5-e1ad7af7135e@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 13 Jan 2025 10:52:50 -0600
X-Gm-Features: AbW1kvYv4JplEEr5H_7RAD_-cm61d0McdldDJA9WpeTQeMp8PAvtnMQYQCFpZzc
Message-ID: <CABb+yY0k7rWoJ6foQLHqxsvZuAiE1XnopP5cOceFgNocygQhSQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250113_085302_404648_F65BF1FD 
X-CRM114-Status: GOOD (  18.10  )
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

On Mon, Jan 13, 2025 at 3:34=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
> On 1/12/25 4:59 PM, Jassi Brar wrote:
>
> >>>>> Then I updated the mailbox core to allow clients to request channel=
s by
> >>>>> passing some args containing channel identifiers to the controllers=
,
> >>>>> that the controllers xlate() using their own method.
> >>>>>
> >>>> This is unnecessary.
> >>>> If you don't pass the doorbell number from DT, each channel populate=
d
> >>>> by the driver is just a s/w construct or a 'virtual' channel. Make u=
se
> >>>> of 'void *data'  in send_data() to specify the doorbell.
> >>>>
> >>> I think this introduces concurrency problems if the channel identifie=
rs
> >>> passed by 'void *data' don't match the virtual channel used for sendi=
ng
> >>> the messages. Do we want to allow this?
> >>>
> >>> Also, if we use 'void *data' to pass channel identifiers, the channel
> >>> checks will have to be made at send_data() time. Thus if passing wron=
g
> >>> channel type for example, the mailbox client will eventually get a
> >>> -ENOBUFS and a "Try increasing MBOX_TX_QUEUE_LEN" message, which I fi=
nd
> >>> misleading.
> >>
> >> Shall I still use 'void *data' to pass channel identifiers through
> >> send_data()? I'd like to respin everything.
> >>
> > Yes, please do.
> >
>
> What shall I do in driver's of_xlate method, always return
> &mbox->chans[0], as bcm2835 does?
>
No, not the first. The first _free_ channel. One way to identify a
free channel is by checking mbox_chan.cl is NULL.

thnx

