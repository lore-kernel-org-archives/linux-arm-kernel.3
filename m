Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCEEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XkI+wm+NB2N9LIlwo90xT0gHZyWpbSFjMquVIxSSJc=; b=xoBlPZboSWSpw53IDC+E9hc5b3
	Ei55JBFm6tG/gslK+UEGJWJSnXfrun22qdqp5rebk5ncpneVmr+vrevOqx4/G5PVhw/fL0m/GZuJX
	czY/1+aahRLLgwcFulmDMlNWqkp9wSpkTq4flNrpgHROiS4nkFHOQX9mq/M/WeqjMdQPP7HF8DeMx
	tFQ7azs0jGzhVFNVHY4m2ZObEVvHRsIVayd/54h+fIILhBsEtZivLOQWb1NXTEn8ZjI78REdYjUOy
	0oKXBbYVaC7gmHyVKuisFb2/dKpRPDLf3aWl/P8AK7gO1VUw8P9qjALScQacO2xbmhwwkWhu0C43h
	JiHzC7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY7z-00000009y2v-0aGz;
	Wed, 22 Jan 2025 10:38:31 +0000
Received: from mail-vk1-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taY3S-00000009xCp-06IS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:33:51 +0000
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-51e2dfab53bso406558e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542024; x=1738146824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XkI+wm+NB2N9LIlwo90xT0gHZyWpbSFjMquVIxSSJc=;
        b=ojHSdhP5Kc9hfy5PRLgMuAC23S9cWB7BEyPWEW9YzYd/wiBIs4gun5zAp9viF0bix3
         afuJcxTBvjr4OyB3TcpgkhU+mSFr7PpUjJyp+9CLageDlXfWSQonVhYLAyX8jCEuz7dp
         Kwzc76mXppZAdZhz9eVbKVZPRD6NKrrhVA32qp6WI3ZHmfnx4vgvI5F8ybKWLQu0y9PF
         8u5mHQpRKK8qVjQIgF3YIHX5B4mFCPaAe7jarEtgoVqWyNsRxRdmMVjuHNzidrLFSica
         +UGxGuV/pAuqpncyxqz/MQUpJjA8AtbdavroJFjibccCEYYxUxSz5B8RFY3LtUVJIiR4
         fCvg==
X-Forwarded-Encrypted: i=1; AJvYcCViyCWLIFDPfqwAbAkF1FQkSyHiz1gsP0LOi+/HY0tPQy+Leim7dDtUrG94yqpNhdSrDKBBu1LyPmR2XsV/TcNq@lists.infradead.org
X-Gm-Message-State: AOJu0YzYtd9J4Udzt2RASlPcxpEFdNULqH/bwpjsyCoQm/IlLu9telAz
	1R7mgAg7JPQBrpYOIYJOE3jccjVLzGmNjZe0zCDJpQWt2EpXNnGTWeNwE+vI
X-Gm-Gg: ASbGncvPcCUWkautJDkMQU5afveM8Hol3C5UL2Pec+9/hD+pfQQi37sYw5SXTEJrUa7
	fns+Pg5n9CR8pEu6y0UXKeAkdJhOPQC2o7I3DVCRe9OknHrdYDAMhonHubKRBMvlH+b3qXIJQQZ
	yDg5c2/U9k1cO7Qe/Y+236Si+19IeDiIepvvRfg7oT8vcUPtkgjftbmkq7QEoya36WAWpK0yUSR
	SCe1XU1FENUevxkcuvph/324lsxVJhw3gJKvOSxRLFm3wblLL6/WirSToy9+X+Y/oloBOHGavQs
	gPAvPQPZX7v7i7AqGaabo2NZEH1BHIB2
X-Google-Smtp-Source: AGHT+IGZfwziLEBS+t4P3ksxoMn6Z2nHZnJcEzQRkQfrXw7KYJInive0UPjEbtq3LTWlqFgn5tbcNw==
X-Received: by 2002:a05:6122:1698:b0:518:91b3:5e37 with SMTP id 71dfb90a1353d-51d5b26bbafmr14527326e0c.5.1737542024056;
        Wed, 22 Jan 2025 02:33:44 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642cacabb4sm3003714241.8.2025.01.22.02.33.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:33:43 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afeccfeda2so3628027137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:33:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9jXsXFQO0vrkDFFlKZVM0n7gI1G17lFo6nXfLqZK6g/MLTEobM52GxZ8z8QOK0t/QEoQrBT+1n7RwKPqz1wLY@lists.infradead.org
X-Received: by 2002:a05:6102:3f41:b0:4b2:5ca3:f82a with SMTP id
 ada2fe7eead31-4b690bb6273mr17446848137.7.1737542022886; Wed, 22 Jan 2025
 02:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com> <20250103163805.1775705-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250103163805.1775705-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 11:33:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJGWaTAxOnMXr4mCfzON8QZX8yPQn3P=14Qh5OswLYtg@mail.gmail.com>
X-Gm-Features: AWEUYZkJPokStUOT3TcAsrnueI2Vk5EIGp1vwEy5bGWF1hObbHDG-k1nE2SBS9Y
Message-ID: <CAMuHMdXJGWaTAxOnMXr4mCfzON8QZX8yPQn3P=14Qh5OswLYtg@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: defconfig: Enable RZ/G3S thermal
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, ulf.hansson@linaro.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_023350_059287_916AA440 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queueing in renesas-devel is postponed, pending acceptance of the
driver by the thermal maintainers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

