Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4033CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=; b=4ZGIdytHCIZfrrKHXVs07NDUwo
	gISainOgf7XNpLe0B8j7JmfNnIvdDvwgw+buyqW+GUMzIWt7Sx0EBLJVC3V72ncum2OEOiHQ3HApq
	VEv332SjSKgFY1aNi4MLd6zEVr1QeATr0mRx/PTYNwi4vYRv5X69o1BHLt6hS2s1ctU1rC8dRVCe8
	OSCdNBpv7pS2TaI06/6wT2Ao309FlFaps4OojnVs2VjDL4Br4FWTfBmwhHoAJeYzkp5JP/KHzVq71
	fnV/7S71IKneNdmfaRDSNZ7yCzk/IQsZSSWWz6ITPGe9L9aBNpGsLUlzQPGmFj3OiYK1xzrnlF4+B
	Xqe6Mqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTo-00000004LOq-0mh4;
	Sat, 23 Aug 2025 08:20:04 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upO4l-000000022r6-3Ft7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:28:49 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-74381ff87fdso975687a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755854927; x=1756459727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
        b=lbUrfm/7jq3JucQorEpBacUQ3hVmjU0HLDFxD2TLcv3b8UF9lL2QW2ZOvybFWz7hpY
         fOZ+60YDBzzSREVzUdho5Nwa5u48aYaxQB7b70kkK5PLH+wxOpdI6D6UChaWPJS+37QS
         h6N8MkGm4lb7fMXd+3cwLvHD3/CxbPMEhyFqjYyTReGbIVhyM8Y/4V6Yi+61MqavMFGq
         YJfQOHVErJvNth3HH5DxVSLYqrkOs2iDe1Pqlbb0sEfvWfh6v4cnFhJ3MKsGp9Hs7KeW
         /JEgbMFrZQfeQi7vDZQg/SiDS/JpZ8B9hRsLKWfT9qw5zm0c3XZ+9LwonkKa1dffJedr
         VzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854927; x=1756459727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqlMfpxirxZlbM+EOIPx1jKbcg0mazAKdivQSHylYck=;
        b=SWF9o50NIQ/iTwmf6l+r/itgcKh1p5C4KEn5wXfD2dkDk+JjVjXXz8qu3CFuVZpKlR
         M0Raf1DdPn1iyX9WiXGowjP8AWpgY7xR1XljKr0rSbdgZ9TJHCyb1c0v2junf2yKCSFa
         nbCI+F7PQZXFExnhAnI6fZ+s7lB9jXwA310fITfYx4KRZAUmxkkD+0ity4eh39NR1LZk
         jH+RriecxVzB/4XBon9pHa7hSYM3eBqvIM5oTEK2H2hoCOqQUBpdy0yAaRgTFT3xkbmj
         a66JoH1y5mcRo9nas8Vy3+0c/A7Beco9u+cDakkT8XkeKcb2YzzZ4LcI00oZzmiWHxSm
         GN0w==
X-Forwarded-Encrypted: i=1; AJvYcCXLks8dNjdgThCF6Cu8cLd2VfB5jyaMD9x0xtlQvDx7Opzr2pHuhI5N/VGfGDf2cY0yH/i+l8wJQIUUq/rqSHS3@lists.infradead.org
X-Gm-Message-State: AOJu0YzuoeaXtmyzOUBhW7AWAzq58i2UWIaitwRztLBDEvekDDpSSVz/
	e03TqPH/1pWeylOIoG/Eux31qP0U6590TCcRDw9ahT/+MMX5ahFfnekLazCnRsVa0uN3NePxbA8
	ZU2KSZpGDQjgyD/gkQxN8IEyDJhZm70w=
X-Gm-Gg: ASbGncvkb5aasM3c4nOwPL9ChUKMiKl7SiRBLDD72ZlC+61sDYqL4He6y96ZR0JOMTo
	xtjIVOpzS1VjxK1SG77EhHNHxtHIOYPyyObmPL2WF87vKT5ymX/nsUwzpZDqITCh1zFmqEVcwc2
	feUNeuBioj+Hd++O+We47UE0O+TG0iImoNG7y+wZ+5lUerN6/lwO5DtuHMy1wkssRNuhhPzt534
	cYKZe7MdhHC
X-Google-Smtp-Source: AGHT+IG0WUhPdSZY22zjNFYLvLkRtJyOHuecSxMaftHRAg40biaWvqUVTZ0TEJKgzzIWavFPuLuDyvykjJqKjLkk/oI=
X-Received: by 2002:a05:6830:6007:b0:742:fd4c:53b5 with SMTP id
 46e09a7af769-745008e592emr1631143a34.4.1755854926647; Fri, 22 Aug 2025
 02:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com> <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
In-Reply-To: <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 14:58:34 +0530
X-Gm-Features: Ac12FXxMSIjWb7zWOXJ_ncO-BRx2eimh_ZSSxq_sHgWo2d3eJFCXvRVqNXXDoHg
Message-ID: <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022847_812881_24E71D6B 
X-CRM114-Status: GOOD (  13.86  )
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

On Fri, Aug 22, 2025 at 11:49=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> I don't understand. Don't you have a subscription to linux-iio@ ML?
> https://lore.kernel.org/linux-iio/CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEg=
U=3DM7FSYBv0ww@mail.gmail.com/T/#t
> If you found something new, please base it on that series as it was
> already sent and reviewed.
Thanks. I do have subscription to linux-iio@ML and did check the patch
series you mentioned.
That patch series by Xichao Zhao removes dev_err_probe() for -ENOMEM
cases whereas
this series is targeting slightly different cleanup of removing the
plain dev_err() log messages
that are there for -ENOMEM.
As far as I can see, both the series are modifying completely
different driver files without overlapping changes.
Since the objectives are related but independent and addressing
different type of change, I thought to keep
these patches in different patch series and have clear differentiation.
Although to establish similarity it would have made more sense If I
would have added the link to that patch series here.
Thanks,
Dixit

