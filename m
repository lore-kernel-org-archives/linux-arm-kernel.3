Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118DBC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P47b/dtjhtFriTT7t5XplkIRw7292i/HwH3cMz65lgM=; b=xitHd9Y4MauLgVYO71gEsLQd/y
	miy8DPrJhLVCZPdZEnBzYG68P0ZapN67ZbS1qb7HJZQ8vXl8lK+g/qkWR5LDsSElCEeADtkyO7gxI
	rLhnlMMe6cMcq2lea7ayjqwNQHkRehHaIcX5NjAkpoEDFqlINKIbjcOzYyVkKLUod16rnEfGlfjNl
	k+3wOwQMQs+CedaxDXFgB3nSzhfgoFevNSrx4LE7elww+O21BGjcEPvLtRpY9AiUVxU0799KYcWh5
	BMhepNSzhfZZLYEj9TZhDzTm3URimvUl/wcbPuXzo8IpV7AGjAqLGQGTcyD5juBve6xgBWngLF75V
	+WhYwxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgLq-0000000FHW7-2X6c;
	Mon, 24 Feb 2025 21:50:58 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgKM-0000000FHK7-1FDZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:49:27 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so8149728a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 13:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740433763; x=1741038563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P47b/dtjhtFriTT7t5XplkIRw7292i/HwH3cMz65lgM=;
        b=NRdZBTF+9eOINLKs5Tgi+pxhvGWuUdmbqQ8p0WpxuWpWMXo2ay6P1AUVNWo7dYjcmH
         7OXUucqn6iDnDjPXuKwmtTogNI1KnACELfOl0SeouSJEx0eE8uhuISPxAPicX8gPTUug
         RKP7sStgGEPaCzK4yVs2n+kLnklx+57oKRHx1K/qpHI2K6Be6NlnuHOJNR9dIyugL9Qe
         NM5413Ovz/s3j5BBeXBYV3b3Sm7qsvdpxNfmxPUGABj8Am3ocuo/n2wRtF0ejvRXehfV
         VFR7QXiP/Z7yfsUXS/Y6KZkXA5n45D66BfLqYe47+OsW8XF6oMG8c/xeYAdhNPhZmrLM
         qFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVEL02xtURQFFGeLoyuc4T5qQaS4mBDNwp80coL88U8+w2fxmNRe+9uIX+THFf3rdCfP6Icqab5emAC57UeZbl@lists.infradead.org
X-Gm-Message-State: AOJu0YxyPwje1gcEf4LY9oiI+AHwEwyjZCAl16CpXExLJnkIwgXmwDUs
	jMCJpcuTrPbMGx23MgaerfPfPHSU5fWBzIYXzlbUjVLQ093cXaYBHSXvOdQgmJY=
X-Gm-Gg: ASbGncs5f+rjH32Mzx++tjuKRJDhF2CPyCfJMIYNm0gx6r3/x/ie4kMqpdj9JrYYpCa
	obgPNfhlysJi8iSrwY0Apf77F7RcmT4L74h44NjYBVRHx1FC4EED2oIiZobaVRhlMM8vCee/LzC
	17YoeXgxDvS9g9hmTEXdWY2XtLup4ab626qeA+Yqle1GRUnE0E1OLRjxiZc8+ENqBy26k1M4a4+
	HpGfgphq3sMEUwzhn9El9QTx//XWBItdYylZH3TRPFK0V/17pUGCsiaPEn/3wsrku8zyzeE4un/
	mKXT61R6gsg55DJBDOccR+fvb5b+1LQ3XGbAELGLCFPLlTfsbImUOfuy
X-Google-Smtp-Source: AGHT+IEMMSLIA1BgoExL6WswEUGQbkRNVsOpaLpeqsx9o8OmACTohKYsJkbDZ0/SLMzkatsckTsXLQ==
X-Received: by 2002:a05:6402:2548:b0:5e0:7ff3:20c with SMTP id 4fb4d7f45d1cf-5e0b710743bmr15500734a12.17.1740433763414;
        Mon, 24 Feb 2025 13:49:23 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460d1bcfesm195687a12.54.2025.02.24.13.49.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 13:49:22 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso716174466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 13:49:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6sNrtmTcdQPNoab3WtVfFHw9tY86Nu6ViV2f+5lvi+Oaxi1Q4XwZX2cFqHtw+OnGzjxIeCyZ+nlwfG7MWXTvl@lists.infradead.org
X-Received: by 2002:a17:906:308c:b0:ab7:ec7c:89e4 with SMTP id
 a640c23a62f3a-abc09a0a2c1mr1144051266b.21.1740433761758; Mon, 24 Feb 2025
 13:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 24 Feb 2025 16:48:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
X-Gm-Features: AWEUYZnTgmy8Wh3cNs6Z5TiDd6mBDwseYtK_5ZJpLXo_D79Innf9WD-b_IfXjLU
Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_134926_333589_5C014E4D 
X-CRM114-Status: GOOD (  14.79  )
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

On Sat, Feb 22, 2025 at 8:38=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---=
------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
>
> Best regards,
> --
> Sven Peter <sven@svenpeter.dev>
>
>
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

