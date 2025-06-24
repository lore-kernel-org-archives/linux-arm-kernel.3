Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FDDC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=; b=OCmnstR14by1Lilr5UIqxAlNuI
	tAmWvogqxfQLaRJVzCFiu55khhHrHwWB2yhR639LMs+W/ZLBVp5zbkt45yArEsvGRQLm2Wq7hzTQf
	OzOfsi+y4mbsFW1Vku1zd31HJc0QWPuyN6rV6mb3SS60PDD7wlaJmF7E1yA/Tb3OWol2PuRw8jlzW
	n9awyRascKrfRVtd5oBXJpB4Tk6OcF6fvdzKsyMIxyLsibGC+sGPj+1Ciy2bD/+0p8k6iOA5zOLv1
	lqos1SmBYFFJNFxjl1opzbWVqHGTmIr/eRz9qFdo+WMQO0zt8PRU7Tep+dRZc5zzsVTQo41CSGq9S
	u7iNKJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBON-00000006tno-2QB6;
	Tue, 24 Jun 2025 21:41:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9LH-00000006bWk-1MfJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:30:05 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso2127401fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793401; x=1751398201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=w1uSzjtUfXgsEpVcRLS8nssd2hxNF3+5SgjA4XNaMf35CnKNUlLAr2c1kEkzf9KkB7
         3vsPdG1BZp9zjV0i2VT1piyI03aJHI57jfHfAslg5OB2fBPz9ZeezaWE/SOlbPeuhK56
         ylU+8xPCkJ0dotNcGBlct7BrImD2xeF1jOnYZFOvo+w2uj1sZ08cKvS93ugrhTeQJQ4j
         S3NeE7CBzArTRHKfBB0TkwR2HiIsNKBcCNP8wqXeT/fvkDVlSXt3cjeytKvoJwdOVw9B
         W1JJc6ILahBsZvxy/lFB7LH9N8eMWeMKRLTFZF8PT25w6jdP1EfzNTI9f8KoUqMOmK3d
         HvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793401; x=1751398201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=rXAK/y7ZKnqBsxR8n8906ysAzmGrmKuA5eK0nzlVo8PYF30aAWiS4QceMLwuYzSbDn
         BgjLCq/vsmZNNA3zCwjyWZYGdSNPHquS/1AvMgGuB2fqpL69FWdDGx6wx1zv1rSGwBAv
         n6N0YwXWY5YxjZSBnMT6IBG+I9WwXpENq4V2npNnZWAlKWM7gBqVmTlqcZq41i3+7Fez
         uhzSEXuktGhFpqrS/Lp/N2DRvn4KwdqbfBU3t4Nz6/1NYCwaA3T6o3WqZek8uBaOgaNw
         cfvoeDvIwlXlOmf6HafuJTnFQ58jPcdlJmaKVC8X3/F8Gtd3gl7lVirexF/A4+t630IB
         t2nw==
X-Forwarded-Encrypted: i=1; AJvYcCX2GdE5BHhLIsjNH9X+tgbxv/Y8f1N1wZgERNlRd5Gxu4gi1QMjOhSOSHlKngt8DuRNwbguIGT1RL0CjHSypnrt@lists.infradead.org
X-Gm-Message-State: AOJu0YwBiRt2Rnnxch2GhUJ0fPIK8xuwX+drkZGAgBF0itpQzvWvBWZy
	D6QGRHaLpl/k/bzRDVE36clbfa8Wpbt+Qaye8CZJ6Ey0xLXBuAdiaAIz8DavMhsgSNm5PGoCxu1
	IIJdPcW0PHmHt9ilVDNz1fy5Ka3gM0Mo9jkIB4XxPlw==
X-Gm-Gg: ASbGnct5BnyGcBPpEchWTAbL+Qj94jD2ToYXa85c0eMv6uDb7DDPVU9otoEkxxXYAcx
	h51tcDDeslTHpTOHovmKjAXpGeQMmtq//RYEERTN3uD8+qTgaqQahmUIPUV9AlVisVRHznWcvBK
	1Ob3YziKsmq4xYaCRdkpDMLbKQX8GFdh1CicK9lHH7EfY=
X-Google-Smtp-Source: AGHT+IF98ZSPZ/cGMxtHIlOFYXqQCIVwb3pGxoVI1+8dIHaRQQbONGD63qWy0teQhv/zjiwvc80I0VajZL9v8jDE+HY=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1536330e87.9.1750793401366; Tue, 24 Jun 2025
 12:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250619022337.43900-1-da@libre.computer>
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:29:49 +0200
X-Gm-Features: AX0GCFsG5W-9LgBD5SxFAUBKe02Az2IUJvG3jsvR1-qxVNZZOZnEgYf3pYYd0gE
Message-ID: <CACRpkdbxLVncSn_=030PiDnbtOc6aBz-Et+5WPSARHj2Gc5Q+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_123003_370204_FAE6780F 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, Jun 19, 2025 at 4:24=E2=80=AFAM Da Xue <da@libre.computer> wrote:

> g12b and sm1 have additional pwm pinmuxes for b, c, and d
>
> Signed-off-by: Da Xue <da@libre.computer>

Patch applied!

Yours,
Linus Walleij

