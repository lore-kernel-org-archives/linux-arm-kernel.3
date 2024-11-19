Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D1D591D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 06:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNZYHo5AjgwQKszUv3ztHfv1oGJtqmjUz1revEZlEUc=; b=zYDzuHQyTUqNi2dWnYWH4LkETl
	07HpaLZj+zNLUoQQwdu16D+mJFM+Px29LxZFpqgIs5dOivScupCyNkwVAVhFtompZE0U9A2eGJhdU
	jznW7G681k2q6AW/n4SjbeHrdwb2y0H7c9IDb+EX6oldoocA3PPLaPecDmQeTpuzQxMcyk6S1f0yQ
	qoKjSy4oUF6oy2ryupLjfKoNOx1zpJizHyVzECTN3J/vnwNifge1tVgmudlhua8rNOa+IiBeDrt6l
	oyRzqOf61ObfuKiyQhkZTZDsVkfumvrwUXF9qXszd7antjCrfrizHN8aVTTVd0Pt5Y755yYtdPfv0
	HeUqET6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHqg-0000000BXcm-43Bx;
	Tue, 19 Nov 2024 06:36:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHpl-0000000BXUG-26Mj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 06:35:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-431695fa98bso4386865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 22:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731998132; x=1732602932; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zNZYHo5AjgwQKszUv3ztHfv1oGJtqmjUz1revEZlEUc=;
        b=EGwJZGssYY82Hc0vaQU5EcM520jrvsiadvPI0fSz+ULSgB+EYXQsCuoPmOdKJKmRvV
         26zWwDFXNSP+OcckkfBFQq0SX4tHbNpGtnIJ9fFlUXHVmJf4jiPp/G5ODe8lJKwVLErr
         jTl7v2xm3vpxAB8NDl9ZzB1xwE9MWRlwI6tIUEbvfzANzzsetwx078XolZ0blmaGxM3l
         LJ1eyAfGDoezNQKR/GAf+KZ2sUTr6znF04ysUQYjIpomKKEc+BWKEQb60bex1+5r9os2
         CgbQhfeOwqIEkHoeHb8cuWHTYV58YCuoFCENsjnsB9IDMN7JvVzxwZ9t0mz3J7v6/DrH
         U0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731998132; x=1732602932;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNZYHo5AjgwQKszUv3ztHfv1oGJtqmjUz1revEZlEUc=;
        b=YnCwonfydayVyXrb4WH45P+E2d3wFHN0FdTPlvUJ/x+FUHwkRjKzRj5ZsqwVUXIdLU
         DcAp0xNqZNxaJFZWgbm0n3u8ULHxZNl4hzTtpPTcoCBZH9aYjSqdmDikq15/a2lw1EkK
         MkjOzrO78d6cQ7nu2D/8nPdvlrjvAg44es0aYvBLJeBWfdh1JMJypKCApsE+qDl0tKaw
         ootja9JeolCM9R33Q8gBCPhqGkwMHUoVP9NKjgZ9dbai2l1/Gfi0IWmM7IiXLjHkQfwf
         1D3a/c2rwy5eyK09nCQohafC0Jhn+FQraaI87NjDz++bZpmvD8KYVw/nzgXwxgOnNwEM
         qNjg==
X-Forwarded-Encrypted: i=1; AJvYcCVYHeY0Y+OxPDBPaGW3XHnR39Bb+HiAIJ8Oc/zewOaLAHDS/x0vuoSp6OONKnCPGwptYXoxqIisLKRVvbxqo/aV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw4QjGDQGVM/PYR1hZdr5x3IlJNf1HcWpoFs96/CGT0ro5scmc
	RESHZGx9S6jD8DBJdo8LWSwaS5BVnQNn5hHzu8h3e35mL1QVTnhepk8QbvDACic=
X-Google-Smtp-Source: AGHT+IHzG2/enHhdlPAuToRJeBEJCmXUH0svKHMarp1l6IkpQ01Im2PyZbGkMtinAJk9lLigLM7j+g==
X-Received: by 2002:a05:6000:1882:b0:382:2cbd:9a4b with SMTP id ffacd0b85a97d-3822cbda266mr10043080f8f.24.1731998131536;
        Mon, 18 Nov 2024 22:35:31 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78918sm177862585e9.17.2024.11.18.22.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 22:35:31 -0800 (PST)
Message-ID: <0cc57d5746de472129b3fa7ba02e1289fab91069.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs
 in exynos_irq_demux_eint16_31()
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Date: Tue, 19 Nov 2024 06:35:29 +0000
In-Reply-To: <c8358dc9-24e0-40f9-b559-18cf7b93f5c3@wanadoo.fr>
References: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
	 <939800a57d356771b405de49bc198d33327b4fe8.camel@linaro.org>
	 <c8358dc9-24e0-40f9-b559-18cf7b93f5c3@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_223533_559720_FD9F809A 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Christophe,

On Mon, 2024-11-18 at 21:40 +0100, Christophe JAILLET wrote:
> Also wondering if it is needed in exynos_irq_release_resources() if=20
> clk_enable() fails and we early return.
>=20
> I don't know how these callbacks are used and if we could dead-lock in=
=20
> such a situation.
>=20
> What do you think?

This was pointed out indeed in
https://lore.kernel.org/all/9a960401-f41f-4902-bcbd-8f30f318ba98@kernel.org=
/
but irq_chip::irq_release_resources() is not expected to fail.

_mask(), _unmask(), and _ack() have a similar issue. In practice, I don't
think the enable has ever failed in our usecase - it's just a simple bit
flip after all.

There are two options, update the callback signatures (and all users...), o=
r
keep the clock on for the whole duration. Given the clock really is needed
for register access only, we didn't do the latter originally:
https://lore.kernel.org/all/0106b6f58ce19752c2c685d128e5a480103ee91c.camel@=
linaro.org/

Not sure what the preference would be, 2nd option is likely easier to do an=
d
it would be surprising if _mask() etc. suddenly could fail.


Cheers,
Andre'


