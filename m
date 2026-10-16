Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF6BCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=; b=AmFMoM1pbEw340THjuyN+CggyB
	Yqfsm5mNov5MsehdMNkvvNI1I/Z6doeEG9r1VqO0SUMcJC+SOR1FNQPkOvVkvL0kclvnTxpfRyvDp
	LeaGw9rgJeS7xZ4D3PypBdkRLzxzg1M8PC1W5XZfnx5r0LcrnDmi6vuMukgfzAQhMly2lMivLJokg
	SglImV7Z7bf7btM2XI7rBu5AidNndu7XyCvvpNK49wxu+XRWmqsVKQTGzMTVakjmTvjD1WN/qyuRA
	WNq4/2krT6ElAvi90hHTeCU63JivvGkgqggVDpObD7hfnf0rgfRs1XBeyqTCrN907PtWIVkS2tuLD
	z7KO1h4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjX2-00000003F2y-1I83;
	Fri, 16 Oct 2026 15:07:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjWz-00000003F2E-3OPe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:07:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso419235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792163256; x=1792768056; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=;
        b=jSXQSTHDM8POVIc2YgX5Qky3pQ+mHctDsgJv5PeYR8Bbpe9FTFV5JVdvLYPaX+KG56
         AfAgpQRZVYsclSwuw6596sKoTA+PPc7CQE04l6HeZGyfhMw/MCOBdKxcIYHaYpBjD0uO
         xhWX47tf0AWsDj2gbpGqYdQSbmb9ewUVNG9QvaQLem5ZFGv5wkIyU1DfLiJ3uQ/myWVN
         M9ZkphFnj31QugwJU1NV0hN7aje6vb+UWXReTYRY62txdzl+oSxsE5iwHglPq69v/nhz
         JMzhRrJW3ksdT6sC5p4lBA2zueT9QZyN6IxHxQkWPTNFPmZjP3JbvMjq7qQQF1oq/HeR
         z4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163256; x=1792768056;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQBXFtSQf7WJJHzyT6nR2Bw3zqoZgRsxsOc7UBU3Xv4=;
        b=aEfMNC1WloXHiUlCT703leWQQ046rfYKj5DtNJrgZBHJcLE7YunI+t5fcMDhd6/pQ1
         lBBmH81QqiUFqVHAMpaSdpi+EFcl8bUjSeB0i54KOEsuyXVtXAArJV+VGuXJlm4lSefG
         ODA3qhDjwD1aGQHBuqeRhAQfJBr0TpQJdWbSrVv/kl+aeFP1yv6FqKWcDaTl2i390qYt
         T9IT1zv4vdAoLP6120RCLg0RJ3SddFWUHHQN8PITxVzCyMdjrrMRiUEXwXgruvYHD1j+
         MdqW+FvwUmNCbGWLuCLYaxJD0jTPcLWYj+XWqn7OPk3Omkpj6urzciF2YyvwWk4kA8p/
         a1qw==
X-Forwarded-Encrypted: i=1; AKwUvBxN4Odzm+87mVB8BZ6TujAMwdknGl5JcBr8POXqPxFo3F2ljMQ+vEl1gzp5GHdLhgYssz+nbJWpz7ewJKgfY6w2@lists.infradead.org
X-Gm-Message-State: AFq9FYImB1smOcV1JZgbpBDtuiAtWp4YMBauN9ugd/TE2Sw3zV1BiOMT
	qnzT7IDjtvVtA4ZfW2Resm96iuTtyIxNRyNiX4oJULowfYE8JsvsarKr8AImO7PdTps=
X-Gm-Gg: AYBFou3RUNW8rMmrAix1XdfUzLZiNeHKetnXwqeMR8265ghOwMYhGQSfEhwLlFAFRcb
	74hcj/fJjrB/h/+95rYF0OKH+pDEPWG9OuyJSQXjTC65Ip8NCSYqRXDTR5mXDdJ05eOknEfoLnp
	MC1UmmMWOr2UrA4etBZ2zI3ES5VyWJjht/eMvHEJHSyOW3Cw5Tg5XtoBBaKEsA8OIWspCCW4RiP
	3q/PlFbKBtOmWBB4rEOvhsPxQCsuOfy2TS/X98ICtOM3LLTL+dk5RiaIVhFVZZQ3OR7VafvlNyL
	Z3EjTinZKjyVcqOf5P/OIX7BU9S+PkvOkIYTB8hZYKlTL05BghfzCHrdkDFGKjG3GkM3LO47DS0
	Jey3F4UDFtHUMZn6CJxU0kjCyYfTmg1kZN7s1Qg1jJsJXj0GBlN2QBcxeOqk5S9L0/wMAjElVqs
	5fokzz5Fb1AsAzfF9o9XZfgz6v+h6krYKYA6O5+20DlzW/3iSmz+zyUk07Nt5SFN5ULvFNf9G8N
	xUB5Sc/K8I/DZRGDGhuV7fI5C5prs1wsY0bNltNi4nHgAsC9OniJU2HuiGqxwoA
X-Received: by 2002:a05:600d:644f:20b0:4a1:d307:d56f with SMTP id 5b1f17b1804b1-4a1d75fa37fmr1458705e9.15.1792163255733;
        Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510ba3sm5544284f8f.56.2026.10.16.08.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 17:07:34 +0200
Message-Id: <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
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
In-Reply-To: <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_080737_866305_D8D5E00D 
X-CRM114-Status: GOOD (  17.73  )
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

Hi Krzyszrof,

On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 16:41, Ettore Chimenti wrote:
>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>> Using same definition as OMAP2/3 except pullup/down enable macros, which
>> are inverted in this SoC.
>>=20
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>=20
>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-bindings/=
pinctrl/dm816x.h
>> new file mode 100644
>> index 000000000000..15aa15bca9bd
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * This header provides constants specific to DM816X pinctrl bindings.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>> +
>> +#include <dt-bindings/pinctrl/omap.h>
>
> I do not see this being used here, IWYU.
>
>> +
>> +#undef PULL_UP
>> +#undef PULL_ENA
>
> Why are you undefining other macros? That's not a easy to follow code.

Do you prefer to duplicate `omap.h` defines? Only the defines above do not
apply to DM816x.

>
>
>> +
>> +/* DM81xx mux bit defines */
>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>> +#define PULL_DN			(0 << 4)
>> +#define PULL_UP			(1 << 4)
>
> I do not see this used by drivers, so why do we need one more header?
> What part of SW are you binding here?
>

I added those (DN/UP) because they are not defined in `omap.h`. It may be
convenient for future board upstreaming. I can drop those if undesired.

>
> Best regards,
> Krzysztof

Best regards,
Ettore


