Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1798DCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3bGHFhpGLfnAz44t2195BtLKMUmpRbBq7DT8OQzDS4=; b=QOhyjniT5sZQJ6P53dWcbXzZxS
	GfyCukWve+Up08cMXAnIdUfg+yTjx+7nrLlnHt4LfYS5foHiI477nTKCpRFxiqCzNkdEkVULMSKId
	Bs1AoAtK187Ojrh0mFhkdPh3D59TKR5oKB4bQNTueQkeANIiidSm1oBuawsRxD9tpteWTwFmRQW7x
	A6PxP1CIfegav/9gvYxVFpR20pzHDctRJ9rWpDhMhL03j8VnMhUbeQjJustSQzneCGlBB5wmV8IEi
	ofyOPc/43J5Xn+KKmQ7S8rYx4J9x8VJj0BSAEilSfNey4BKIdvPSD+nBChXaf7YoSM+WgZa/lq5vf
	NvNRWl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgoG-00000004N6s-24AW;
	Mon, 08 Jun 2026 20:43:00 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWgoE-00000004N6W-1GL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:42:59 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-bebc80100efso515464366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 13:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780951376; cv=none;
        d=google.com; s=arc-20240605;
        b=XUchvH83zHwr5OcllurvPUZM6FTRvj6NwK/94jJea5hh8VaAcf51J1eM5Cah8GV4sE
         jtkRE2R0KSbBo/XBme3I+8ykKPi3IEMeZgqtWKb8WHrprJmXTgpr7TuWmdhXuTeUIYvN
         B4qErBvbO4GDhXy76KnNZjRutweRvACOYqr4wnJ4kJ1cTDzKzcmx1+WEri+4smCK2jwS
         lZjtZ//hklOXIT8U3vW4saGcOQz74nkmTfPaTzftjFtrt2WkY7XHjmaE+1Dkzhu8ggid
         3cS33Qa77MLmCEGS6sT9pXbZfkxuc19dlJSBk1NLpU5hmn6z5kCGqsP2QJFnJHmQmPRn
         fFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w3bGHFhpGLfnAz44t2195BtLKMUmpRbBq7DT8OQzDS4=;
        fh=TmmbYif1uPfxvGn8qR4/yQzrdpw+8E1Jfush82Gvm3M=;
        b=hQEGk3XNls72mKQnq6w4fNUe0CQw1zzWjWCsJUEgzbq6xaYGlnVkiMqgrMTNICUC5Q
         G9Gb6MqBydvZqbxkZOhf11le/7WmQX8CovRnuZOO4xJnRFNHmqnk/c3E+vIYYuRCYzEW
         +MVyztsU4y9YBFta9qEjfu5tKLM5y7wHAV1kX5EORQZ0jhtbxLd5j3zCN3px5CgCJy51
         8I9scLX/KSr0vxFIunCIWi89meq3GlmH8EaWdoRYlGQYe1i9Q5gUNiW67cLVQqaBl75Y
         6L0wLdo2Rvjo5e0fYJEg+QsoiSXZ84G9V7FqdC0hpn7Qw7EAkVav86IKzweOeATQUcHB
         CF5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780951376; x=1781556176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3bGHFhpGLfnAz44t2195BtLKMUmpRbBq7DT8OQzDS4=;
        b=jyyvKnrLGMRaB/X2nsD6XMhLh0ujH/EST71shRobseA1H/i+rHNns9KPL6thm09+uK
         XCYvxkkJcm39VHlWlINUMWl4dfIWWjPoWwDxkDwQtTQIFCom1KxK/gdVd6+nu56ZNewt
         n8YEFtBsGqXXbWtWjme3YDo+rvLHHsst8Lt6pUUXhMZnCXaSVWkwbh/F0tPhQMAWbWsA
         uA2HE0bbNQmm9uGdMe0JfJ29w0DRzpUWITF1HPuQt6QRv2m3rrxBj6x9EiBy2r89WLCG
         eGxZSEk/zFnQ8PMgfWjIjvgDb3/UDDzsHmOtoIpQ9GzT1kSBDPc64S/9yrMRqxTIYZ3A
         ibuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780951376; x=1781556176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3bGHFhpGLfnAz44t2195BtLKMUmpRbBq7DT8OQzDS4=;
        b=gvVdJKJEEcZoIHuxZvk+ZVup2exMP32/ZHr/DDJ5/nusRfzwNjU0HB8BtlUsXRPC3f
         HfnYFglqUcSIjpa0dpuRwy+Smi+6KM8LhM7OeR/pU10mX38co5aqfrN0NTs6cEyQyeSG
         Zp6nNW5ofo7OqAlqpdVUKJxETOcGwugClZk9qKJGXCog8GTL5c4oBns6yIflENyhN0yc
         x2GCvkOwzL4J33s4ofSQ0+ujw0TBpuA+77hjyIu9wwVMGJw3EOsyK8FqeDv7p4nLPRk6
         ln275NN6+kXKTW6P/EoEG8kgQh2CBDqYMtAnJNi+2+6kiGJ7NZzlmhSyH78F1Pcoguq6
         8mkw==
X-Forwarded-Encrypted: i=1; AFNElJ9lIgtqJb58EBoCofNMyX60bid0HV/00HBpCh2bhSUJoaAGIK8c+UAWbvlxHMdrIuUe+AF9rr4Ff9zPDwC7++er@lists.infradead.org
X-Gm-Message-State: AOJu0YyACmKli4ehcQYitO8LUYlgTCwDsHsHm5H7BEQMf8V7NoBt2aON
	k2yirqWskfx075Y3eQcpvWsiEtnppMROkb8ocgC5YoWt+Ff75JS/DzGF9EsSfpbUMHsHFME9HlM
	4R+Rgdgh8qiND/Vz9xV/SKi3P78LbvUc=
X-Gm-Gg: Acq92OFuYgn4VuKRqQNtielcp28u9DAMY1/WQVd4zSUCB/Ya4G7L+MxRhobFsujVXaV
	/DG0SpdtMfY0VHI4nx6Jbu57diEVnyrADbHMMGuEeg8fwY9wbANnM8ULF7Rtupc8KXhL1HqNgHo
	udSoDCKB58h9XD85bA0Xkf78RJebWqL8f8rSzV0swNhLi4c7eOaw8CQ3dj0yKgtCHdRJ78ylbk3
	aWf7dimLEqcpmYcuHgDvz2Lc4ILj9sQkI50UVcCWy9FsRnsBqCx2jn6FLg/CSC+euLUj3X6zXps
	BUahYPj/15iDK045FfWv/+LjErKxA7xbETJt8/B0lVZhcecBy/ulHi48AAX7Z2vOrHH494gnM52
	R8yyey8IIl/7cthVknUYHPUljm0EgqTKY9L6+wS8SLlxlTfw8dlHEWIzYuKfOGGl81JQK
X-Received: by 2002:a17:907:971b:b0:bec:6c5c:ccea with SMTP id
 a640c23a62f3a-bf370c66034mr767931066b.19.1780951376036; Mon, 08 Jun 2026
 13:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260608200933.18669-1-rosenp@gmail.com> <10b595d3-d44b-4fbb-a834-a94b154a0381@microchip.com>
In-Reply-To: <10b595d3-d44b-4fbb-a834-a94b154a0381@microchip.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 8 Jun 2026 13:42:44 -0700
X-Gm-Features: AVVi8CdwMe9gWTnYb2abcAqrWRZzmpLGd7USbf1AK_7yOiRD9ZHMhsEYn-srq1g
Message-ID: <CAKxU2N8-kydmRRY8ry488t0s1dybp1oKgpPcuX-dU80UqYjfQg@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] watchdog: sama5d4: fix IRQ and timeout bugs, use platform_get_irq_optional
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: linux-watchdog@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_134258_361671_3F4B6836 
X-CRM114-Status: GOOD (  18.71  )
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

On Mon, Jun 8, 2026 at 1:38=E2=80=AFPM Nicolas Ferre
<nicolas.ferre@microchip.com> wrote:
>
> On 08/06/2026 at 13:09, Rosen Penev wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> >
> > This series fixes three issues in the sama5d4 watchdog driver:
> >
> > Patch 1: Return IRQ_NONE when the status register indicates no watchdog
> > interrupt is pending, and pass the configured timeout (not the hardcode=
d
> > default) to sama5d4_wdt_init().
> >
> > Patch 2: Replace irq_of_parse_and_map() with platform_get_irq_optional(=
)
> > for simpler error handling and EPROBE_DEFER support.
> >
> > Patch 3: Move platform_set_drvdata() before devm_request_irq() to preve=
nt
> > a NULL pointer dereference in the interrupt handler if the shared Syste=
m
> > IRQ fires immediately after registration.
> >
> > v2: address sashiko review
>
> Rosen,
>
> I'd like to hear how these issues where found and how the patches were
> tested.
They were not. Maintainer has explicitly asked me to fix issues
discovered by https://sashiko.dev

I originally only had patch 2, which is true of multiple places.
>
> Best regards,
>    Nicolas
>
> > Rosen Penev (3):
> >    watchdog: sama5d4: fix shared IRQ and hardcoded timeout issues
> >    watchdog: sama5d4: use platform_get_irq_optional()
> >    watchdog: sama5d4: fix NULL deref in irq handler
> >
> >   drivers/watchdog/sama5d4_wdt.c | 32 +++++++++++++++++---------------
> >   1 file changed, 17 insertions(+), 15 deletions(-)
> >
> > --
> > 2.54.0
> >
>

