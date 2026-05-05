Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D39CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAxbkpqBCKTE79BmMO4+ohI26sWtDnSzhbxpx26l2V8=; b=Ir6tMe6TJtcdxU36ub0+/5uqzh
	im+ZsceaLdiA3XpeRGLbph2JndYaUU2hWuhjJEKMrycviT8ZPBz1ag86AHlea4Tjh4hOmBPn3EJHr
	vrXw84RUMvQg+t17Z8YGtciuiR/gNVR6rXle18eur4Ba2poH4MR54NBpuH75uPKDOhRZGHe9w5IQg
	0H0pBTUFp6xLCxdbl/1XJb2m85Y9uV7C8R4FJH2/fD6AifozGk3pWoesA6/HLd+6ok0WgbYN+G87j
	tWIZ9JNXj0PbdWE+merT9PZ/UgTjLFtOa/i1Mzt67fbdBpHI7K6QmyHYxP9FTEPv8Bx+f+fRd714r
	QQONRdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDE9-0000000FvQK-12oR;
	Tue, 05 May 2026 10:42:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDE7-0000000FvPb-0jw0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA8E9443B4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EB4C32781
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 10:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777977726;
	bh=QAxbkpqBCKTE79BmMO4+ohI26sWtDnSzhbxpx26l2V8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iB3LP/gBTdkL681ekJ6SD7SzFnjeEi0S7q13Uso5teGhN4R9KYvcrXC4myk/6zJ9Y
	 2psnd+tfE0mclve2Zz2qh9NG4Ht3aPQe37v+qJerfkOQ/ImhraqadrpeVodLewPo12
	 PaU+AnLGj7Tf7GtmVl9ZyCQgl973aaKYdipuKSCq4BUg6N3orsVxuXcZyb3FQoBELf
	 CBUarz8RynkQW0ZE/REclid3FDXRanLQIi+zq/ELKKn4xQaMeymZPrk7vs5czGy2ER
	 c9Ac3gL9ItUiB9KwHsuNCbxzkt7LXDN+O76QcEREmz/T3dpZfcxc/ZocILw7NNJLph
	 im4ok6XRSXD/Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso19551421fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ//rmuQd/Sv1K+eMvAgz7Q6wRupWe18130bDEprS91PP8v6OfpJ6RfJIR1uxmoaZ5At4uLKW62Tk5hEDm7Bm0gt@lists.infradead.org
X-Gm-Message-State: AOJu0YzJHlkSKONs1PEVn8KGmJ5WjMw6J9kWYaUMW7ggUzXIQ7e7DsnF
	NrpVCdHW3umigVEJrEVpAMxH1TElyneDddGt3jIYDHUqTrLF3TI77S5pF+SS/iDoYOwl0/ITTr7
	tBUFaqh21DUBb1Ro93OnKKPqvlzZHBSk=
X-Received: by 2002:a2e:bc09:0:b0:393:9cf1:78a with SMTP id
 38308e7fff4ca-393b2bda7c5mr11198661fa.22.1777977725320; Tue, 05 May 2026
 03:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260430081242.3686993-1-arnd@kernel.org> <20260430081242.3686993-4-arnd@kernel.org>
In-Reply-To: <20260430081242.3686993-4-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:41:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLkDmQ5eK3Lzg4N2X=_iQMoeh9TWh67hvOLBh1r_x=afoQ@mail.gmail.com>
X-Gm-Features: AVHnY4LQ-69b-VeuKsX-tQijtzj4ctkK9Gpn7v8pkwosSSN69m0jMPm2kOmRFFg
Message-ID: <CAD++jLkDmQ5eK3Lzg4N2X=_iQMoeh9TWh67hvOLBh1r_x=afoQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3 omap] ARM: dts: omap2: add stlc4560 spi-wireless node
To: Arnd Bergmann <arnd@kernel.org>
Cc: netdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	"David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-wireless@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_034207_260489_B961966E 
X-CRM114-Status: GOOD (  10.61  )
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

On Thu, Apr 30, 2026 at 10:13=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Converted from the platform_device creation in board-n8x0.c.
>
> Link: https://lore.kernel.org/all/20230314163201.955689-1-arnd@kernel.org=
/
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

