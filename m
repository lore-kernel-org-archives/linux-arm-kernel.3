Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC19ACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=; b=PXL99q9ElSPo9RlfFEtBICI6gp
	yHBTI10So0a6Xs3HIUk5VAjGpfqcgLUraA2/6sgwpbt8k0v6aMKZwHGj1JLX2WpOVA2RDS+V/mcmc
	1Uug54Bw9gBJTtse1L6Qaoc1GVm3KO93j7En6N8aFXaORlb8fXqITUhvytLhWlKEolchh9l7PCbf7
	pVzheQm/AL+i513+lcQPmTkv7PUx8505k87IbknHBoOiOtdq83+iNheKHMNdkjK6YfAbGf8Mn3v1Q
	vTloIde4AIQcP2bUsRlKRsEf/z2bzVp74spLuUXTlsEHi1vDYZ5R19mcLTqNSdSR11ln6Adk7S04g
	loQ7oexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTXu-00000002zPv-3WMi;
	Fri, 22 Aug 2025 15:19:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL7j-00000001g9s-1PB1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:19:40 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-afcb7a3a085so286526366b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755843578; x=1756448378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
        b=Ep8nreTObWh0Jn3rg0iYYjnoKP5ypdfUDdQy1mR8qIIbXAUxBdSvhyPOEB4HcXU3Vv
         Yc58O8xRMV2e68Pzg0XICx4/OWAeAHlGvPZ4JRrkA2Gb2+n4gIEE+9FMFJkaQhmiQkg5
         55RfNOBY5taduvH66AEq5kXYGahyqzw7PM2JkEuvtHeP17xU7dAKY5bm2G2Mv/DvxQ4H
         r3h3cdltYYoNquDZEsAfDWuZed6C9VEdZLI6nS584r9kpShtFTwpVgfCVL8X38LyizEv
         DoRtmYnJzXg0yPYdiztiUKD9pWL1qxVb8KMCnW8sq8cisiLPqRE5rkjcEWPB0hGqNjTI
         0LxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843578; x=1756448378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
        b=h+weBYw68lukNFe2rVPaEuLYfCinNn0dItZgcfUh8ZHT3q4lmi4tyzYqIJLpN7mPrQ
         uqghnMzPmM98MEmgW3PcOhFuqP6Rg8djGo0iV0atmJdmy9gH6y9Nz3QqMMi7QYecgtyT
         +O4K3UVYxPKcTRKGQGayTlVUUKyrFLhY+rpH6GQyqrfI8VYAzjTTg8GX/B8uFzDpn21w
         XLFaoPTlfMHAapVdHoYNFLsggeTO4lztjzYhO+b1dxQDlnljmwe9Lhnnf/0nq+K6FxWB
         3oBAAyFFJNNtY9Ugj45nvmJVnqgjCISBb4Fe8g1RGyljShamN5INlJRR3gRd35xin90j
         hOFg==
X-Forwarded-Encrypted: i=1; AJvYcCVhOYeXH1SxVh5vDTyKU4otrtUVS+ou4PC4m2XtlAYvdlC3/WMJpLU6/dTFLWYgGXuX/3hjVrBU5H6WEwdDuLlS@lists.infradead.org
X-Gm-Message-State: AOJu0YxI7qFLqXg72h58+XnIY2nxa/2xsk0TL/pwjdyZihPsVxLvyHGl
	w7Jso6B5HSc9EtcJQYbS7AwpZVjkbCYEZk3bfbr/T8kMNbuikwP9ZZ5aEq2dwQEmEA0uICmvkOX
	Z/vRO+i1U0/O0sN5nblNami62n6DVm7s=
X-Gm-Gg: ASbGncsv82ucAIzGeywjcPid2aH/K1KGJ9rlMBQIx1NI91Fl57oDpeaIVfFHS/6pmvh
	WNkjvoGEDXcbYSQraW5Zdo+TX+Oef0H8NNPf4w/jSKeAFL/+zsWVGPhfBDCKHrPnI8iF8H+TBHT
	pO3hVynsTahEZsKXgoodBbQh2g5uGTeKxoU9eNcgJEfBRIZGd3Loqie1reNKbO6RZzuTzLsN70/
	IpdqTOvmJy934awwQ==
X-Google-Smtp-Source: AGHT+IE+QSuwTRWNnEst85zd/nVk0XCWCT3dBHW+V785HwC5spF07O83YE3tf7aS5P/QoM3Upoe1DUKm+4/yzGTsmC4=
X-Received: by 2002:a17:907:1c17:b0:af9:1184:68b3 with SMTP id
 a640c23a62f3a-afe296358ebmr171036766b.55.1755843577528; Thu, 21 Aug 2025
 23:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Aug 2025 09:19:01 +0300
X-Gm-Features: Ac12FXwT5-FuVxm-aLv8k_QiDyCdQQYyidQq38gD1A8xq-6f9ed_haxl-pVwx0A
Message-ID: <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
To: Dixit Parmar <dixitparmar19@gmail.com>
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
X-CRM114-CacheID: sfid-20250821_231939_374446_065340C9 
X-CRM114-Status: GOOD (  11.90  )
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

On Fri, Aug 22, 2025 at 6:50=E2=80=AFAM Dixit Parmar <dixitparmar19@gmail.c=
om> wrote:
>
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> With these patches, all the iio drivers now has uniform handling
> of the -ENOMEM while device_allocation and trigger_allocation
> calls.

I don't understand. Don't you have a subscription to linux-iio@ ML?
https://lore.kernel.org/linux-iio/CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEgU=
=3DM7FSYBv0ww@mail.gmail.com/T/#t
If you found something new, please base it on that series as it was
already sent and reviewed.

--=20
With Best Regards,
Andy Shevchenko

