Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB63C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 22:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSwUO8B5vwdfcnexH40Nc2DnuOoNta8XhHEpoFTOGEs=; b=2e75BoFIe7Af3pSXhX2Sjsfe5V
	whkv3vehYn6bgXKZrOC+3ZVq6KDzR4363T1niHL5fwA8NGwGsxr+vVwVx0wxiRKiUM/fA55biqi4q
	WN7JQF9lmZ+7BzbyE0hMsSZQ1rOcX3CAf/qszMK/pRQZZCNhs7xQf4YsY3l2EfUn/24DZZuRd2vSo
	H4AR6oZiZYnZKBNhykWYFv8IIausA0Chp17LgQMvJhrood6aLANoB4MXlYuLlxaSKws/D30zSboBH
	/BW41XhgV7YqIAXZsJ9npIE9nxsCgSmqdjvCuE2yBtUc8zCehK93hJdnK7qmiN0zpxBUkx4v8mcml
	wQyY3QLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ME0-00000008jjx-453C;
	Tue, 22 Apr 2025 22:36:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7MC1-00000008jVT-1NHL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 22:34:18 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5f620c5f7b9so6032144a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 15:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745361256; x=1745966056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSwUO8B5vwdfcnexH40Nc2DnuOoNta8XhHEpoFTOGEs=;
        b=ckqkg83xM96yH5d9PHPVxp604cX8uomVGa3W5aJJhIyrl8MOqlMpWilWuZJsfrSa5I
         OXR70myehmW4S4T4FSEkkPVJBoTxuiwRW6Rln80YOAb3PD/NcSXHtNrQx5b6beJsJeyu
         +kvEnC/nN+8UDd6CB+ckZcXWWKNYgIDrqZGuwwNxTRWZKLJU+M2iXxy3uUdIvjYqAZ4j
         ZOGcUCa4HGKxqfpuwDNfKd/RbuHDNDMmIEFLLR4r94L1v+hFSfg0i8aDYBj4xAWOzY/C
         WYe1rpTHDxKLclQpvzfs6fYpYfoe/VNoxTfINqJycTUxadtrXAfLlxOd95NvkWiOkY30
         0IiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361256; x=1745966056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSwUO8B5vwdfcnexH40Nc2DnuOoNta8XhHEpoFTOGEs=;
        b=ZdHr5SmdDG+TJQ7Fc1tQGdyZWE2TIoCX0ZeVod98b/eoyuhM8ODi9AP6btlkrmzsts
         t3PrARZTSqV0ZTyj89jMynrdxCQXTiCtGEw3zkrntHufRr5QzwlRqU4WIDhQqYmBjn9+
         npJZ+MYaZ9iuek4aEc3BuaScslvVkeX5DS2IdqsnLyjjk0EqST9cI/G//ySJ3/07QaIb
         FFPlRpTrIntZAcYaCJ+nvpjufhUdyY7GcUdy287j4LiAs9porhKi9jWRdR+THWR+BDAA
         U0OxlYbHJ0JtYiW5g9XCZOIsyWYNqh6hGvb1ZmF5ru/JgvBWbLXrmDjtgxZmWjigNBho
         CKWA==
X-Forwarded-Encrypted: i=1; AJvYcCX2AElQp8uuYU/iEw+Mvl/8aEIckXI5zf/elIgbO+GTOdGu1QEMqBf+21YUIabEpNjYpbuVTsxYTfD5Y7SUPhUR@lists.infradead.org
X-Gm-Message-State: AOJu0YxBa79STWh+aMCQyfLFbIcrd6VGUADWvs/CqYajDvDiqTBvo4ag
	9+R4wbNPrhFTTo2KlD/tx/eBf+P2PmztmVVxkEgwl31UBtLlc6b4WN98Xz5K5eB5umSOna5int7
	RzEkOpQKUo6qNP9z2Q4r8FgbNVac=
X-Gm-Gg: ASbGncvEIKyQXczrR2YGg1iYDkP7cT2fSFasHdhg3u8GrWhAtSexgyJCjC1be2bJTje
	SrLEsaOSK0HJbiLq6k7cBX7CUWeW3kt5aJpwWxfgi91cv0dIuWJ9u+qduMufbo9UU2lTNKNqgL7
	5/CvE3p6Oc42lcQxIldULYYA==
X-Google-Smtp-Source: AGHT+IGEdEyDJ7eLl/WPHqEG6RPTd58T1qtwdpGHMY7GLLjHzgOyyUSyU3WSKL+Ol0SHi9HYxX2HTVhMhy2PuqK/6L8=
X-Received: by 2002:a17:907:7288:b0:aca:d6fd:39a with SMTP id
 a640c23a62f3a-acb74dd403dmr1341111566b.51.1745361255480; Tue, 22 Apr 2025
 15:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
 <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-4-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-4-3fd36475c706@baylibre.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 01:33:39 +0300
X-Gm-Features: ATxdqUEloA-ZEhkwZ1BjOVJpOHMzDaj9rmKVF64izawsOdJZZCwOJujrDjEDXtU
Message-ID: <CAHp75VdqanGpwB5raE8AmH-Tmb82N9yYmhB+k_rQtc2_Zb8HQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] iio: adc: ad7380: use IIO_DECLARE_BUFFER_WITH_TS
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_153417_365894_8CBAE4CA 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Apr 23, 2025 at 1:08=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> Use IIO_DECLARE_BUFFER_WITH_TS to declare the buffer that gets used with
> iio_push_to_buffers_with_ts(). This makes the code a bit easier to read
> and understand.

...

> +       IIO_DECLARE_BUFFER_WITH_TS(u8, scan_data, MAX_NUM_CHANNELS * size=
of(u32))

Btw, why not DECLARE_IIO_...() as other DECLARE_*() look like?

> +               __aligned(IIO_DMA_MINALIGN);

Forgot to drop and use the DMA variant?

--=20
With Best Regards,
Andy Shevchenko

