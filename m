Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56585C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owGjS9GEb6JZAL9yeS9UGk88aYVHU6W0zz47VKrfioU=; b=2q/KUv2NUDVhpySA5vU1jj4d/p
	Ql+eVJ/wqToTEBCCZ0O69IF6NAPZjSRHFfZOB/BlS0dRgRz6bxx6hoJjOrm5rV6rAHHfl1hKsRB2o
	BTnMUPN0zmtj60rHtT7D6fwPzo5+XdHjUyH8gFW5e+DZ2V+v7UeqiGT6SAdi8wNUlfOgYv+h/xdvs
	QdBj/vbiWLM7txKrPvnv06RTdFm7E5NYM3RXSrKuNAHZ11rOMEFHckLU5md7sz9KRbYULsucExHdp
	QDWjQuunSkFvhERSAsQKJjx0zh4rCnFd+9T9dOwylg+X9zj5WRvELRYzIvXM8P6Sa1Gmn+er2SPLn
	Kse+nN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6WB-00000008wIP-2K2v;
	Tue, 21 Jul 2026 09:12:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6W9-00000008wHT-1E5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:12:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFF214509F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F0A1F01563
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625120;
	bh=owGjS9GEb6JZAL9yeS9UGk88aYVHU6W0zz47VKrfioU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YiPHC8zb+pExl6ZEXHE+3iy3gQmHX2ikNmew/jFcwvkRziWguGcxfAADe0WtSoI7A
	 8ZkFHjxiWrVOiJ1pIwmkl9706O2lhpWQQmxcZWB76DjDfuyCbP3nRqGQFeRYgz/hEv
	 oXsXCD9Z/47mZknKOjuv4pCxVaawZ1OBmgeCudZDFaqE8neLUQ3i5Tb6lbQVi/eYlJ
	 9LC80MKibo4W/itfwbS0AH44tHcz1/AmU/RzIhpNmPX3VEGVf3TIvAgo0lIL4pvIbE
	 PW2OF+IE2d54dmKR9SkzCSEcMhrsoy2r/cp1B1CX819eEua+f6uyM+ZSTwSfFLdo2Y
	 8a8nkkv9XHpLA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c953950dfso83816381fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:12:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqAewIeb85MWklVVxBOdR54ZcQVwriDpMBeYNMCJfeHgM27b462pSeXRWl4J9Cuvt6yzgTPYLc22H0iTN4K+aEv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo1XOGORLmPXZDRmaCsPSSSYYjQ+f8eBtXswu7iedPpdpOuqrc
	MWnpYGxEi2Xaq2IQ0hlsOF+AzUOA84pZUZoIoIA1sgb4AkE5javDY1777E6SGqsbGfrM1KkApA9
	rLi0htzMQRfE66xcxeApAm0eWa2v9XBzRPWFGDJ9S5g==
X-Received: by 2002:a2e:be27:0:b0:39e:a64f:d7a9 with SMTP id
 38308e7fff4ca-39eb274e864mr35869361fa.2.1784625119589; Tue, 21 Jul 2026
 02:11:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 02:11:57 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 02:11:57 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <0337442c-0278-48e7-9a69-9f11d7325f1f@axiado.com>
MIME-Version: 1.0
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-2-c429095143ec@axiado.com>
 <20260717-prudent-indefinable-labradoodle-fcaa9e@quoll> <0337442c-0278-48e7-9a69-9f11d7325f1f@axiado.com>
Date: Tue, 21 Jul 2026 02:11:57 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdfUXBAm54RyCQXiPMxCp9pLR5mPfM5hnC6_X6O9UhyTg@mail.gmail.com>
X-Gm-Features: AUfX_mwH0TpNMo9EZd0P-t0js313q4iPqh8W5BqP6DPj-e4tX6QwH3FcJB6hj2U
Message-ID: <CAMRc=MdfUXBAm54RyCQXiPMxCp9pLR5mPfM5hnC6_X6O9UhyTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 21 Jul 2026 05:35:42 +0200, Swark Yang <syang@axiado.com> said:
> On 7/17/2026 4:33 PM, Krzysztof Kozlowski wrote:
>>
>> This should stay enum which would also make your diff easier to read.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Best regards,
>> Krzysztof
>>
>
> Hi Krzysztof,
>
> Agreed on the enum, and thanks for the tags.
>
> Since Bartosz already applied this to the GPIO tree, should I send an
> incremental patch to fix the formatting, or is it fine as-is?
>

Feel free to send a separate follow-up patch.

Bart

