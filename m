Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DABDE7544D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=; b=N1pPiQ+owGwAWUKaKDb4JcL2Le
	Eb934yVS7VW6G7zqm2f8wabWnIHVtvWNn0SjtH9XLQfmUYwrYfwcJ12QhzD0Psrb51AUr+jHQXn+a
	p0LDXLX5vprvnAgRcWSA/74MEvIJKS0Bxrdie1NZssf+33XKY9WuHtyUJnBuCtpedJMb/EjI5KWEI
	gBgs3FLMQjOt5qub2zLpZ6dbDKI6Hlt682UeG3AaA6cS7vtfhTvhXRZTm8fZjhGCdoi2xWE6anNWE
	LivhPIgvX1Icdh3/q+MB1W42WcxVrxZ0a86PWS0vNkRjvsONrVTKpvbtybOI17VMrRe+rXWjl6b1L
	xjZVLOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYM8V-0000000GhAb-1Zez;
	Wed, 24 Dec 2025 10:30:31 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYM8R-0000000GhAB-2nsU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 10:30:30 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b7cee045187so1040199166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766572225; x=1767177025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
        b=0V2QtF++4TVygM1CFSDEW4btSqjcTOeClQfrXXERXZlJfSg0FiknReVTM9QvLyELGH
         w9fOOSzm8TtdmuyBhEUDjZB08P7fWdCE5C8/jMtxEvfuaQ+ojaLkJ6dPjsn5HgQIK+vP
         F0kYKG1PbvWkGveade0w3m2X7yxuRDsrK2kKWYjOjk10+dttOHXOp3kXFkZfw5H8qzif
         dD7K02GdyChiElz1bDqdVy+N+YHgsONP8cHkSNk+BNHwOYOomu1xTqmVs2elybkItqj5
         iQaC1sUacs5XDG8VvzGC0+xUlu8pkqPsV/+fXcfD8GvOcwZhyP9rr7cB5I7OaQFou6sN
         iuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572225; x=1767177025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNz2TcJzJmqF7rsKjUpwytr/M43/Sc2TIAVK6pF3yUw=;
        b=FCugu0cImgS7HqL/G3ztpYE1qdOzqAy2qTkywHo10A+oJxdi/0C2tG4mIyA1R2Tvti
         4OjURvCRMRYi7VdvudL/7TJIEMf8DSWh8Zx5snz0l85c+wo5q6+wgWaFkJyjAbYI+W+n
         eC7jX0JKxncWXMwSpXmNw1BwzbSRXG1QqErwlWY6h8ulHd9RxAR48iFniyUk4we5rjK5
         FQ6jG/wtnC1qaLAeSk+NuhYdwws5D1xpFFjKv7SpPSKBxPyflqqr/R1Rq88XVT4IPirM
         9NVwcw8bYwBfNT9fxVKBmdQdh5QpVzcsdR0AITjG0VkQHUz3/vct9pOAu8jPwhL52R3O
         bzXw==
X-Forwarded-Encrypted: i=1; AJvYcCU35B/NRn4sUbTkaXQ5zttJCV1/Ln5HMBM22vErmjxjfRaFBBnHFO1UY/bdZvnlKTQjz/xIsZDzwy8trrJ+Nnb5@lists.infradead.org
X-Gm-Message-State: AOJu0YzHhxsKH7roZ+IZ/SAHvoeefjqlhorsJswrV95yzbOTunWj3Nid
	N5EYmXL8ljHDj2sNX6d/c8rkT0Yp2qn7DT8may4uTzSZINzsV9NmtBtDr6E1re/h8PCLFRcPEvY
	3Xai88qq2kkkNZuv50U0YbkGBdcY6YgqDhvPl+nR4yQ==
X-Gm-Gg: AY/fxX6ajIbD9XbRhdCQKtglkL5z1kL7HoAxRGlJlOD0UgGr1nJLDO2VlsWUaFN6YW6
	EeXlD/xyXRPKmfZ+8GSY/in6JhDEcALPQWDlVOXX7xxdcTE/jOaJ9giI73xPnUm2OF2q895TbKa
	zSbvmf0sV4wZCcVVhRLlw71H/Fj99+y4AlUgYe7ZwKjuajuHaaTiyWIxu7rp9nDRXqVXftQ+Yel
	6KvAd0ngW0NZkNZvnAC51BNQhkP/tkdUDVkbIZshdkg2/S+6x9bRSfUElNcrlIjDkpaigusHzwP
	MgnwmEh6W5IemUOphxZ4hpklP9Z7ihjT3lsgf6XHCv0f+cHIbxxLUcnPRm2A
X-Google-Smtp-Source: AGHT+IFeflXA2mce6O+1rdmvPjP/12/Umt2Y99WbRQ8cM3OEzOcKAWgIne20UzsSB0V8xKjPoflCDtb5j1Pn52N5SuA=
X-Received: by 2002:a17:907:7f01:b0:b71:ea7c:e501 with SMTP id
 a640c23a62f3a-b80355b2523mr2261188266b.4.1766572225170; Wed, 24 Dec 2025
 02:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr> <20251224-berserk-mackerel-of-snow-4cae54@quoll>
In-Reply-To: <20251224-berserk-mackerel-of-snow-4cae54@quoll>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 24 Dec 2025 11:30:14 +0100
X-Gm-Features: AQt7F2rVNXRXeSbgmjkb2SKB7p5AiaNihNvuJMBrgMZ7XIKTnJcRJJO5brWpKNE
Message-ID: <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_023027_727083_58EA450E 
X-CRM114-Status: GOOD (  16.59  )
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

On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > Add the required LAN969x clock bindings.
>
> I do not see clock bindings actually here. Where is the actual binding?
> Commit msg does not help me at all to understand why you are doing this
> without actual required bindings.

I guess it is a bit confusing, there is no schema here, these are the
clock indexes that
reside in dt-bindings and are used by the SoC DTSI.

I guess I should have titled this something like:
dt-bindings: clock: lan969x: add binding includes for LAN969x clock IDs

Regards,
Robert

>
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
> Bindings never have a "include" prefix.
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> Best regards,
> Krzysztof
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

