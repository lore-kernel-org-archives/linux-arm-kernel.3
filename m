Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD1606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwmafD0f;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qGYbY9De
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=; b=gwmafD0fuRcyTk2mAowYf13Q+H
	VzUMrdJjGEPWzMBIsHm2kUavYT+t/8EsAWTQyI9kDb1xL9EnK2DpIa/uv27ZdW/9TrNfhn8gflo9h
	y4c9j3jT8HfMZTnlKWiVIo0bymB9fNz5ATom+lyxpJHiWK/KdBy4LfO43+cOnmy9pNznRjjTNMfan
	BUmWeNJ2N60Xyc7baI6O1XWCuWgCmZ7M0V9VT/YauXLc4Lb2EaRwTIAifipXbtlTm6KAXsoV7X6cl
	h5+mwNjnPa5iUt1TP6fIyDBPfEL6g26DUXRSpaOiEWgvFWeYHo3JbaJUGqv34pAZUUnWZBVhxhIDu
	UA+eeIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8m4-00000009eDz-0mwl;
	Tue, 20 Oct 2026 12:17:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8m1-00000009eDW-2zfQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:16:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2025093f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792498616; x=1793103416; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
        b=qGYbY9DezrWOebmDD8PHGyANAcDihV4F5MMh+gPmBZYZ3G4N2J6HgdUdUEU2NJGCYu
         pNe/lkXZzi0LLWnin3kDQ43sEPU2c8OqT9uMCqKDxYegzRVcSjUD6dPhofo486Tgd63T
         /vZEChZcFCU7kKImzywQSjzGR6R9LuCpJZnIokG+z3+2JoaEQS1oZzBSTvJ5B9a5ydys
         yRvCW0CPS9XSw+UWHjWHdwomkW7qUhT58rB3ZO4Bf6X0KZ9NsTzE0ooavoE0tH5KcdFW
         IwLg9y6+iR2jDs1AtIbzy6leoAGWMHsWnbvRV0b2saEb1kLhDiTygwtT/A1C9Cwz6F2Z
         wnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498616; x=1793103416;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eQ/XppcwzISrseZ5RcFWPSpwGbmbzSYupMPgcj1BFE=;
        b=vjUZdfBIbcKOb4SUGtY3tT2sGQBrpuU3Fgb75UCP0dIVAWRjiwXPXvtvjM7urX/QjL
         mwAvDAhhiV4Lg45ExN7KVwIPwKmbauiJ2HJlLRcbDrZ2sBP2XMtbb2m7gHYvWUiyjPiX
         3iAyW8/8YhOoA4IcdhaA4lquaUDDDCVv3CUlwXU3vV9Qdq1GUYyQBzUL8IvHTygfVOKc
         FyxiRHVyBRl1J+3YITvpYVZVHQv6QbiDgScfltU8urczoEK+eLOqQmljPdWcXNNLce3F
         Xjh0NNKeLk0tT/5QkUYNRd+o/0BcISd00i4sZVFwpIGLkdV3u/eIVEegDQo+C5U/0kL2
         F5zg==
X-Forwarded-Encrypted: i=1; AKwUvBylQBZD7PB5iMGb4l42WgLe5WIlSayW1fJA/FmiUPWS20Dk79QZ/ctn9KxoVnEzz9yLa/zPMGpxIyrWe3U35Uni@lists.infradead.org
X-Gm-Message-State: AFq9FYJVUw4MwtuKhySOaxGOYOzFkG0WoItObNmkVqSRPUzeEtSRvJXE
	92HuqBwdXRNiWUiAhGvdJipijvj/s+aevpP0vtg16DSHs5CTTdmT4rBvA8EZTPXIWbA=
X-Gm-Gg: AYBFou3iqqWYGgzp7dV8IWX06SU67JN6QbPgP4mp2DtjyvpKRwdIl/2KxEm2O4+hO9E
	7jMQJwoXTl+txyIWoxeEoZ8XQ4yfW4ctkjleMzOCGBU57cMLqtDL1LkWwUcuxTzUeejNAI44Chd
	BkTpx1vgQtZBDeJ/vD4kvXL87Tmby73vookxlDKBNrHFvs73SwtLV84cI1fZ+yl1Ts8UGIS0130
	Yh5dsxRXF6+2KFSu4nD64/PGHY0dOeNvXc8nz0slmIChOjXENm0hDG8PDLf/ugxRBJD3mCDvY1L
	Fp2Cnqi10E0wggiSGJlNJZAMfYvAmWEBVaI2M58wkh0ArFe5gmvuPl+Fe3D1cx5lkLxhzsneC27
	CrFqgESBOR6i+N8UwaKDfg3Gv149y1q6F3CvOOPNFCyKKT6YiMwGRBHfGzFk0inG489GJ0qFNZX
	XD9X9WhzpUJBFBcx+8sldqUJSA+vssvmua+tR0bfqVGUBmOChu4pW1fS4WdHlEdQu+KnbQ/+cZp
	Ansv9UynWVQTmLOYDSGEBsX8Rzdf1fLhO/wbwBStY8PzBvha8TnL1Qi9mDkP04bW145nOgAfHk=
X-Received: by 2002:adf:e001:0:10b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e1bdf80a0mr5011790f8f.48.1792498615536;
        Tue, 20 Oct 2026 05:16:55 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d8bsm5130862f8f.24.2026.10.20.05.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:16:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 14:16:52 +0200
Message-Id: <DM9NQ6MMED9N.3QP4ZDCCAZ85Z@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
 <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
 <c91b063f-69b9-4e9b-8e1b-af503de672b7@kernel.org>
In-Reply-To: <c91b063f-69b9-4e9b-8e1b-af503de672b7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_051657_792520_2803C5AA 
X-CRM114-Status: GOOD (  26.07  )
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

On Tue Oct 20, 2026 at 1:22 PM CEST, Krzysztof Kozlowski wrote:
> On 20/10/2026 12:18, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 17:07, Ettore Chimenti wrote:
>>>> Hi Krzyszrof,
>>>>
>>>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>>>> Using same definition as OMAP2/3 except pullup/down enable macros, w=
hich
>>>>>> are inverted in this SoC.
>>>>>>
>>>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>>>> ---
>>>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>>>  1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindi=
ngs/pinctrl/dm816x.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..15aa15bca9bd
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>>>> @@ -0,0 +1,20 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * This header provides constants specific to DM816X pinctrl bindin=
gs.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>>>> +
>>>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>>>
>>>>> I do not see this being used here, IWYU.
>>>>>
>>>>>> +
>>>>>> +#undef PULL_UP
>>>>>> +#undef PULL_ENA
>>>>>
>>>>> Why are you undefining other macros? That's not a easy to follow code=
.
>>>>
>>>> Do you prefer to duplicate `omap.h` defines? Only the defines above do=
 not
>>>> apply to DM816x.
>>>
>>> Not sure what you need to duplicate, but if you add header with binding=
s
>>> for this device, then you should not include headers for other devices.
>>=20
>> I basically used dm814x.h as a template which does that, is that not
>> correct?
>>=20
>>>
>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +/* DM81xx mux bit defines */
>>>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>>>> +#define PULL_DN			(0 << 4)
>>>>>> +#define PULL_UP			(1 << 4)
>>>>>
>>>>> I do not see this used by drivers, so why do we need one more header?
>>>>> What part of SW are you binding here?
>>>>>
>>>>
>>>> I added those (DN/UP) because they are not defined in `omap.h`. It may=
 be
>>>> convenient for future board upstreaming. I can drop those if undesired=
.
>>>
>>> Just add the header to proper place - DTS. These are just not looking a=
s
>>> bindings.
>>=20
>> Sorry, does dm814x.h not look as bindings? I'm a bit confused.
>
> I asked  which part of SW are you binding. There was no answer, but
> question. So if you cannot point which part of software you bind, then
> we can assume it is not a binding. I did not do any extensive look,
> because I assume that contributor will bring the argument in favor of
> their patch, not me.
>

Thanks for the clarification, that makes sense. These macros are only
used by the DTS files and not by driver C code, I got confused by an old
header (2015). I will drop the dt-bindings patch and move the
definitions locally into arch/arm/boot/dts/ti/omap/ for v2.

>
>> FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
>> Following=20
>>=20
>> Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20
>>=20
>> For a better solution, you would prefer:
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
>> - Replace defines in dm8168-evm.dts
>> - Add the header in dm8168-evm.dts
>>=20
>> or:
>>=20
>> - Keep omap.h in dm816x.dtsi
>> - Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
>> - Replace defines in dm8168-evm.dts
>
> I gave you one idea, but feel free to implement it in other ways aligned
> with that platform maintainer.
>

I'll do.=20

Thanks for the review,
Ettore
>
> Best regards,
> Krzysztof




