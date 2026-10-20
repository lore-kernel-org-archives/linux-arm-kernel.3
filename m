Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WZMR8DG2;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FPTJlJ1q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=; b=WZMR8DG22paTubWjYkyKroMC5J
	ZTa3MWo6U0V3+TQ1yINnFrvhVgnCbWmiSQlFylNJnxIlKuZWMQ4GPZ9GcDGSxkjOdxX2E32Lmtuqb
	8SMTktnYzsYGYzcJxHY5m4iMiaHNiC/A2rHQ+mU1H6pfDZIDra69d2Nf4PQ/bSXWEJxKwVoeyrZAi
	0kjxQmudpdo+e+mCMs4BXlRNgCYxnbwwdC3YgFsiMik3TNcu0rT3NUqKgmQQQj6E+5ry5sGD0+d4d
	RHyyBfRvfJB+kvCAmsJVmXJROsgX4IwQi9OdtmUy30Mlwbtnz5FCQGj1grJTHJ6UQhhvTfKZqI/Pi
	CpUyxfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6vm-00000009Pgx-3IYx;
	Tue, 20 Oct 2026 10:18:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6vi-00000009Pfm-2fHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 10:18:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so25904515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792491527; x=1793096327; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=FPTJlJ1qfV0awId+hJNgjTrI4PhbXU+to/eNyyPhVMPKZ6lmdDWiCwpWweMl83U1Z8
         5KPvuMBk6Ink/Gq11dYdv06BEdH9SYnJIXXLdLeA12L0KdAJ0lL4e6j4JTdamAkVMBiL
         88+0HB9N3ISPkINOYMsOHmjVTvUoFj4pCSRVRDBprtQCbaGwvpMiGlHC4PyAMitEeTpH
         rLqHeJlCRCAOi5J+MpOoJ5s4hblQ/UMwsqp99W/wem04r8sZyDiWhnj28rO72CZRN+Wv
         TyVaRZE8KACsMbu/Ll9H0vOnRGBVfl5HsNtANHXvdg6iR3DzoJsxI3lH32Gji2d9af0u
         mpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491527; x=1793096327;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=uezIyVqLkpqLZSE5XlUlEKhjdtj4M6lym2Wmmkp1/bVYO9+EiugiVjyMsB9XWsgyed
         kD6CuwcCS1zxia34YCNnxKeTlxhvJi3IwSho38jjPICBgVy27eHspFebD67AWAr3YX2q
         bRaGlXNm8I6fIW/VBZ/WWrVFd1AYj1fweQk5K+Zjd+5RaD+Ch8jBTVmv/RzioXYh0xM4
         s6h7qVYq0vEHhjoBfoqFzqcY1GiA+n9NxsyXajwdR9qYFdRPYKa8m3CvPw7a4eU0LWII
         sq1I7NBB1AgpY7w5IWj9iFSy95IN+hKSxxn5uyC9YqZkCuWPG8gKUrhG4grhT56vMRj/
         q98Q==
X-Forwarded-Encrypted: i=1; AKwUvBzLyoYbY4y/6TYQgJntJ67l6mb9K/e8kVozAppK1LSCxsewFfLeI5Ami8Lto+R144ybwIvxEuhx2Tr96TEbqiYV@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2wj/FpoJeYeaZKg8VX9FSek+LBkfle5B4FVpdN8r3nJ1KoxAY
	pPqOcSFVrBRI6AUaIEa/Gj4rGQpFq+xmtdQLKN1Cx+CMFVjKXGvVjDwYGUngJ47Reg7OJLpMU61
	ZxyKZlC8PlA==
X-Gm-Gg: AYBFou0b/GRGUhTAWjMJgQB2T7N1yW5fhiP+OSj3YQEmejS5zchgBopkbP6g+qwM9VE
	OSHD0q/bvxlBSURBr1lB6gj4vgE9/Safg+0RuBTXEolGdS45YMGjUbIoRaUMTm5hEKTDOqkzBnV
	b1XEn8jwtWJ47KtdTcOPRk/dhJFmvov4VV7ReVYwO/YAgFDUcBcZjRy1mAAvDmUDpIyFu3HxehI
	pdvVto9l2OqlvlbCxuGp6ptT8IQrIA8RKB4vFwisFrg/h/DQai2yp31UprFlhMaay5Hz+RrmhBg
	NDXO7tIxSPYhTIYNUYNDzQgenPj2EGcPiV6WuC1qH/yTWy8V8SkKlg96otRo0PhmhkjNeaiTtTA
	NnMvLBtFZ9EJ7XvkAN4BquSpk2Il+H8MQVPXyCc3t1MaRta8BXqB8CYCGkgGEupsbRAqjGwm272
	LlwpjuoEZ/wb5b0XUKrtAXUExh7HQeuTkgfAGCYReYsE5NKeUQwFWDgii/yYkUeJl8/wthqYmF6
	yaC2HuP7JaCiijwsWOB7w8o88TUNYC7qpG8nGUudhFCTCpub/HghBWvLZ67e9uz
X-Received: by 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr141959155e9.18.1792491526824;
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm63088925e9.8.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:18:45 +0200
Message-Id: <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Christopher
 Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
In-Reply-To: <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_031850_712740_067C23E5 
X-CRM114-Status: GOOD (  20.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzyszrof,

On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 17:07, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>> Using same definition as OMAP2/3 except pullup/down enable macros, whi=
ch
>>>> are inverted in this SoC.
>>>>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-binding=
s/pinctrl/dm816x.h
>>>> new file mode 100644
>>>> index 000000000000..15aa15bca9bd
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * This header provides constants specific to DM816X pinctrl bindings=
.
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +
>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>
>>> I do not see this being used here, IWYU.
>>>
>>>> +
>>>> +#undef PULL_UP
>>>> +#undef PULL_ENA
>>>
>>> Why are you undefining other macros? That's not a easy to follow code.
>>=20
>> Do you prefer to duplicate `omap.h` defines? Only the defines above do n=
ot
>> apply to DM816x.
>
> Not sure what you need to duplicate, but if you add header with bindings
> for this device, then you should not include headers for other devices.

I basically used dm814x.h as a template which does that, is that not
correct?

>
>>=20
>>>
>>>
>>>> +
>>>> +/* DM81xx mux bit defines */
>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>> +#define PULL_DN			(0 << 4)
>>>> +#define PULL_UP			(1 << 4)
>>>
>>> I do not see this used by drivers, so why do we need one more header?
>>> What part of SW are you binding here?
>>>
>>=20
>> I added those (DN/UP) because they are not defined in `omap.h`. It may b=
e
>> convenient for future board upstreaming. I can drop those if undesired.
>
> Just add the header to proper place - DTS. These are just not looking as
> bindings.

Sorry, does dm814x.h not look as bindings? I'm a bit confused.
FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
Following=20

Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20

For a better solution, you would prefer:
- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
- Replace defines in dm8168-evm.dts
- Add the header in dm8168-evm.dts

or:

- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
- Replace defines in dm8168-evm.dts

Thanks for your review,=20
Ettore

>
> Best regards,
> Krzysztof



