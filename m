Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10D8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhDgvl7uPRs3CMEExuv1J69kWjAxPIo3iySve0DDFCQ=; b=HT6obWujzJnNyNFC+2LycraKta
	ItanR9N+qQYKqtC4sfHKUJIYXcj+8xMs5V5v87O9HM2RCueu2f56lYIx3Xc4i4eTWyJR+NyZZL4z6
	XiccX8U+OYOINeHP1yjv8mHDXx+0Ha8Dq7/sF9N6Qm3SN4W9ypr31u0sYUg7/BInMhs3nSwPUx44F
	mWqwu+GtoGu19GygylQvUUGZsymijuIz1bxqY/xDrOztUX1r5ME4BGHWNsg9sn9faveJ88jPk1qHV
	mPEQCT7/DPStRWuznMr2ge9aENXknDeJ9H9HoaNLh8k+JMSlCGATykmV1y0Y/QneFlVZNPOkdVGro
	9oU3AxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkqb-0000000GVXQ-3bmn;
	Tue, 12 May 2026 11:00:21 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMkqY-0000000GVVw-1pQW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 11:00:21 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so3584524a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 04:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778583615; cv=none;
        d=google.com; s=arc-20240605;
        b=Ro6+1a9fJQiUw5T4MeLgfCGfu8DGUZj4EeyxvoVQwUt29ZtZ7XjVFVw/cRzMfINDz2
         bEkM4GN9jU3P0pGDGx+Zp2HmjIXgvXh1DuLorZM4QDpKH6b9TpD9E5EkgZgFK1tHjHWt
         ZWUJ3YV5aKlnMXhsk+FWy7sGQIPk/avHqVJToHGkseOmob0XMIV9JzNd9eQDkOO+ZOMT
         sx9rbsj0rgvhDSiuEB34T0fPsDNV34slV52mjSMe0+0lHGmP/LIsDeLb3nPffCCWGTjw
         g54AZk6jttPFXKjvBG+CjFvV71VgEuvwbfWQjaOixYpBE5o36NQtmMpadLXAH4Dhq1rX
         DPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LhDgvl7uPRs3CMEExuv1J69kWjAxPIo3iySve0DDFCQ=;
        fh=ctlHtU4EJb3Xq3wfSg4J9qaH7+nX/VvXEIsgFXcW9RE=;
        b=SCfHpDan36FOgYWHoG+lEJmXMQO7Cei79mDNTYslzl2Z3X/N9Pwnw2WMNpe2vdS9nx
         YFjLYx6S2t03JqWx8D2wMMee5wn5PaNqo5dMB6ABREWrslzmQdoRBvCtgYTKiRhlEts+
         TU/hrJ8CTFa90ToCvLtycWzfcZixzYL4ErukC3fRKL74YcySGzPiPtHh3gFxEeeVHKUj
         n+K8xd06zYC0MS7l74yjBfBwR1DLZtV5fiyn0AlU/vlaOVzzIGVqAmff8mRelXYGdmMY
         8rp6vzRz9w6/Lc2ypPa2uHA7UO8qAJ/faKBhlDgnw5fpHVkWNIg8k3mu/o4vQTvF/Bve
         sPfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778583615; x=1779188415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhDgvl7uPRs3CMEExuv1J69kWjAxPIo3iySve0DDFCQ=;
        b=KrQduURhailJ4Qrgf0eNaaqtr6KBycyH87kmCDKJn2Sm5WxC2+IVjTYeHEFFVqlUEv
         DteDXIYUI9/dEwGqLq4HIb3i3o7MXvmWW4sfqx58CBvDPx7+fttce//wi9ygb4NyEikn
         JdXoMHKO9dy7m/SIpHSfvdOaeKZrKl64vr4msOEqNpaZJ8UwxFYZkYB42tR4VU00Xcmo
         nJQH89Vv3pS2qgnsWTlLIIklkOrvMARbW3E7PGY7bxU9ISgKN6SK8j6AzOIaFY8ZRzti
         obKk6FpBCTWaIFBqP6BBktygquZiThcUF6KkApM8QVbTA3aIiDISj+m7LvrL7epB/5H+
         n5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778583615; x=1779188415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LhDgvl7uPRs3CMEExuv1J69kWjAxPIo3iySve0DDFCQ=;
        b=XNcFXjddpQJ+Rdvl0yYPdPnTnI5OGu4gEEAcfnxmWbpFVY6+fcXRga2j3bciL4BEnv
         FRxDr+tNYH16XwgL791JUtbWBxo3hNQ74ZkMKAn0QWDzLjzh4Xyp9/IKdBapr2rmqioa
         XqMXrcrYZipyr2M16Rry1wxzao1Ojqnmvv99wynuNzTkIIvF5YNNEIm5/xjhPUyN3O/S
         9IneDJXtC35DSHgk1jROeyxEcikyGrOBIlrM+wipP/dZ9CSSqxHMIeiMhOa+onjDCWOv
         U962a1FKL47t9AlzZIsWjOQpYUaBrwDS4Xs61gzW+KV1caIIcVGMUan132nRYmZOnmaA
         2zYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0Y8r69OR7HcjiZ5idvaEEfFJZ4ddW/2W7Cq6pz8kdFdm5zwF9zZl/uY6tGJJVqiZUxoh06/4jAYnTgd/qMf1p@lists.infradead.org
X-Gm-Message-State: AOJu0YymcLtIJC6Nq+Dkq/8XDo+XvVV5Vw2TCjsAeNgxcwSaZO9ezUnD
	juIbmZoKIufoN7vhOAPL/oYpNPxGxZPPCFFcVDp3YeUU/tM8V+ZgK7BGi3aWs+VRDrYMen091GK
	qrsOEpX1UlHRcS1TC62qBmK6DN8E05p0URQI5IIzOFg==
X-Gm-Gg: Acq92OFJE6ncbrEeyzSDgJA2keM2XWheNuO8h2fZln3U3xUUD6C7j9Xsag12d5TUuSP
	VO3xf1QRtD+rcCGsLzmrZtdoNkuIjBbH33GGdn6DBDXStrMcozLpCn9mXgI/GapYy5w6VmlJvf+
	FpqC03QJe4FkuvdNJUcb6L/fFQSicg3B2nwOJMRwg7qwLRSbr8mtea5pwh1hB9VjFFbzAHKAXE8
	tsw+/zGpDpBJMH2GqhgX0VN3PzE4lpz8wmo49RPry/S136edv8Z5brFM64ynVMSrI2OWbzrr+IZ
	TmYoWp1KraXK6Tx94ZYzXVEuOUYKjAUgHRGtC1nWBTP1o0eVQ2s7U3oFtdB46k01FyBDuWve2Ol
	k3rxw2VcnxvWt+NgTJi3eXgBc
X-Received: by 2002:a05:6402:404d:20b0:67c:4e1b:9134 with SMTP id
 4fb4d7f45d1cf-680cfe24becmr1173638a12.14.1778583615257; Tue, 12 May 2026
 04:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260414224245.8493-1-guilherme.bozi@usp.br> <20260425163449.547b7ed9@jic23-huawei>
In-Reply-To: <20260425163449.547b7ed9@jic23-huawei>
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Date: Tue, 12 May 2026 08:00:00 -0300
X-Gm-Features: AVHnY4JOYBBFrty7L67g9NKspgD2Gbz4Gg9WVL7Yka7j0SH0JfRIOzMv0nT0aZ0
Message-ID: <CAJgF-xv2SpaOu+6K6k3CzFVNfWTx8LyeGJMZjLheCSETOR3Yzg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] iio: adc: xilinx-ams: refactor alarm handling to
 table-driven design
To: Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>, "Conall O'Griofa" <conall.ogriofa@amd.com>, 
	Michal Simek <michal.simek@amd.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_040019_186125_A6EEACAA 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

> This series looks fine to me.
>
> Given the AMD Xilinx folk are fairly active reviewers I'm just
> waiting on them taking a look.
Hi, just checking in on this series since it=E2=80=99s been some time.
Any updates from AMD Xilinx review or anything else needed from
my side?

--
Thanks,
Guilherme Ivo

