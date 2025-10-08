Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ED9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjbFp+AAJ0GPQMOTx6ZjwxXhALOLADjgQf3T5Jpj/T4=; b=q7Tk+IGMrxfxe2Lr3ZwV/rpa9p
	Lrw0Z6Tk9ar8BiDFujejHBUARfM7Q4tWixDvlrMGML99swfNC6U8/zjWqdt/nFqJ0VoIH+SeoOtYp
	+tLpft7lOnULYBmIcpM4rysugjLxj7H9FtCrwezfVNMwha0wtH9j+/gbraL814UrCarWQGpCiG+O1
	Tlm4mRYCC0w6KppVK7C03jB4iq8XNfyiIXyNfoGoMW+vQfzuQsoEzeKAXQZ0mG6rSfXqsGsIHH4kg
	JwgjYKwJ4Q8zGJnN/W9QTvjgQPW64hDeDfNoyTgKUFVpa4a8mO5uXeOhEnkalyNRLGBlT6Huojkkf
	76S8qEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XUk-00000004Lxa-2scQ;
	Wed, 08 Oct 2025 16:58:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XUh-00000004LwX-3Rgx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 16:58:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3ee18913c0so3911566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942705; x=1760547505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjbFp+AAJ0GPQMOTx6ZjwxXhALOLADjgQf3T5Jpj/T4=;
        b=e+B0R6xB+mhYzrgMOjSve+x3uMTP3RAKlRCsgInNnHXUbOQkgoO5Lx8MdOMxOaVD2C
         TT1Sl6d6lCE8z8r2aUXMep2bhzHQ1G9U1Lez3X8WnTthX/U8yYr9eIP6BsjV0bJraXmt
         U9jt1eTbiiIc5++eldT98xfqUZk9VkOO7YVybALIHs4uPGsVOzHKtY78lIRToqNnpbX6
         ZzKns9vZsSnTrvzJr8rXM3ImOr5OyZyLM4/EQkj+1LenNW4EJWixeJhj/0dnbz1tzRIT
         Lr6sXiPnkf4sR1Oey6WNsSN1oiUqfFdecAm2CbB8zlg550KDwXVEN9+uK66kGMcgaIP/
         Kx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942705; x=1760547505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjbFp+AAJ0GPQMOTx6ZjwxXhALOLADjgQf3T5Jpj/T4=;
        b=JscilTRkrw8IZ3ns88Kg09vgH3VDEWvkiUvw992xvkGsl8CyVzIjZzumeCXrrTAY8q
         vX2YFk2FVBzuMu/JOJdQN9o6FkR2F7P6CWlvMKy29LShA/NA2Z5S7EUsL+lqjyQeDb5Z
         AjtCD349WzXElByVDlpPRlxudew4KhcDjZ8eavExqen42mPzke+LSxOeJs6s0Df6JHoY
         O2juphEEWsXHo6/xLmIIEK3fHZvRgeeOuN2rJOVRsfnfb9ZjrVXW0+0lMsA8ktqDd8HY
         OY51sSz8pNIuEly8hrDjSLZjhipFahm9Sn14V39dSJtDnlPrrwV/QHKxRAoEaRztYGu3
         pKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrdllnnLOi3IjPUMidtkgZFiPwKlZMZErd21bwjspxT5is2jjq062Vy8nFjkPryeLE/ObPFXGXdKaYGwt3NXlf@lists.infradead.org
X-Gm-Message-State: AOJu0YyDDP9A80wp2tKcYB6yfSviLg8VkuIwmmRsvIOK5a4pe+M+BMt9
	5/3lF8Y4h2qPqAAJnTR+kNskzp0/QrxNVFPI0hElsKcixrfESMqLtjB/G4b3El9JYgHNr4xn272
	zv+Gjm4WA60tqw8pSLSsfWNXMpvhY3i8=
X-Gm-Gg: ASbGnctUq67vPsGlHvu+Te/nHkQqcXNMtuXt/SEB152oTylbFwYM/899xFoxNm2dYX9
	ug08t0aKH/Y8Pt3J15+6Nad/uciDitXc2XMYqAgV9jnEZDdEH1/8J0wFvxXwQBwoYfth9IVpMjn
	0+Yb3zae7ca2GOAmRzwb0PZSJ7SS/ocoXNMNfMiHkIPF4g9q/B0d9p4Q6u3gX5istr+G9Ne+Pab
	HCKGCxXgGN6yxytVXm8ria777mInSM=
X-Google-Smtp-Source: AGHT+IFM8B+yRjNiQWgGuDgYf4XUl4H+hx1IOIfC8pC6J7gmFamfZw32Vs0iDE5FnPT00Hq1ICxP2bzhEgGRBLspIeY=
X-Received: by 2002:a17:907:7213:b0:b47:c1d9:51c9 with SMTP id
 a640c23a62f3a-b50ac4d3a5fmr452540666b.62.1759942705378; Wed, 08 Oct 2025
 09:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <aOaWpVGZSCY6kN-6@homelab>
In-Reply-To: <aOaWpVGZSCY6kN-6@homelab>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Oct 2025 19:57:47 +0300
X-Gm-Features: AS18NWCT0X_F7IZWKb87X-14WoCCTqsfTJlR0tHQft1sveRDBANcDJ27fz9ygt4
Message-ID: <CAHp75VdKLoCyYHZsEpkmXNJQ5QSpA_crrWR+MS4-=xmn=g9azw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: Fix pm runtime clean-up in sun4i_gpadc_probe
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Jonathan Cameron <jic23@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_095827_862819_6576A853 
X-CRM114-Status: UNSURE (   9.30  )
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

On Wed, Oct 8, 2025 at 7:52=E2=80=AFPM Shuhao Fu <sfual@cse.ust.hk> wrote:
>
> In `sun4i_gpadc_probe`, in case of thermal register failure, the runtime
> PM usage counter would not be decreased, resulting in a possible
> inconsistency of runtime PM state.
>
> Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal =
after registering in pm")

This might fix this problem, but it doesn't fix the whole mess in the
probe with devm/non-devm ordering.

--=20
With Best Regards,
Andy Shevchenko

