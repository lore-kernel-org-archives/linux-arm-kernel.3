Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99132CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 15:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIFGJkIeWdUt+CmNJefoaOlO/byGEQ4fNf280dgFKws=; b=S70Oxk3NwIc+2BR57a9HRBGnq1
	xjKnrFLyBQVyZzAhvyQBceVAJUjbgvlvZ1lLBYT8Lvpn+c+Xj3LhCs8s5lZTlttW+mnMTuyfzvr8k
	uJlajBCNtcyQHLLcUnbSJR/cQgV2xCW1/dyAJXcqYHaI6wHnuvyNEbP0aCFYSyOVNXG/4ACU1GyYx
	t1LbmQ/rY+AtmeFHzF4SybQfgB6Eg3Fw7zg8+VQZxvYYD/q7Y5Tcm357t42dzWg97Rsq/QYy1EbSR
	HVnFzRfI9rJPSeGNl2vTSygD2s6qew1M1txbQbZff2oImYrorG01vrDcaRBx23lqNkfHRvrzgEn0T
	0HwAAf6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIprQ-00000007LtI-1yrG;
	Fri, 01 May 2026 15:33:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIprO-00000007LtC-2rGy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 15:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nIFGJkIeWdUt+CmNJefoaOlO/byGEQ4fNf280dgFKws=; b=OhR+21xut8tPvt4O8tb56d+E6g
	egV9edH2QwmEwrAvoCMcj+aUM6oP1xh7Zw2++vX7/dqCMwY3fXmpOoxuV+H0BXlkRe5LOuUOuPmut
	QJvB+JXZTJcxTZxw+6igloEFRkEBAwV89YmUO9ZfRTHTSP2qpyOfJH2PLPncxnet3SjmDKJ5RqBJe
	jS1bBfNtLZDBNX9rR9PvzGsRitRJ+cVe88U0MF/7CwnglZyZ8GsvgkWsy9nOIj8Nq3oPzjvYA0Vxb
	t7dQ5wV9RL+u6RNESvftW/JM/ZXytonhWYhVh6/inuQ1p5WaCm1sCFowDjEUXCcP19HOjeonVtNs7
	nVSjHoGg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIprL-000000095vy-1uEi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 15:32:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488d2079582so22565305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777649573; x=1778254373; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIFGJkIeWdUt+CmNJefoaOlO/byGEQ4fNf280dgFKws=;
        b=mcE4+daMWnin/Yf3FFrSZ+26c/YM+lvEJNoNGAuUTDbYn3d2VLIlRNj7ZyBXFkS/IG
         qvAfTMIuvFRlRE41AAtqqyOytrx8qEm/oMrVgoHM0GhiC8ufQwnN5on/DqKmxd5kEKTX
         G6MdrgVKREv6uVtCT0QqjH6/H8SB9eH/o5lAQB2hcyl1YnMNYkR/4LtZ8BSmDfrwIDA/
         w01t0/RdLiEAkD43wqtamfzYoOGMBe+ekGhxYJUo0ESF27Fwo8Edf1oHDpJ4gPuXH7F0
         2tzAxHx7ZmYIt52/N/mmXkTcexXnED2r7VAMcN4aX6lBYLd47l9KBBKuHtjBggVpUQMJ
         SnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649573; x=1778254373;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIFGJkIeWdUt+CmNJefoaOlO/byGEQ4fNf280dgFKws=;
        b=lUBp9OVSVQtzRC5Q6wiauLY0Tbf9XSl6ZRvgBU0sa2crCvQSqnbfGvFcH7mu89DZVt
         9yzYFcv0h3GzWsEMB3oKLOEmseruG0gqgqVa22IU0sZvtDS9fCaeMeU0vkPHc4QE+Iy9
         TPAyUH2vYnBY92PDo9coS6ZeBNXlxl5KXmx1xFcehbU0/GnQWVqH/fv8UvWJQuiX5qsH
         jOBPcz1jGwOhFgcVpopvFSSDsTI1oYgdcC903mG68hijLcIzmsyegQ8BIZTwmF5WDHsF
         nagYOYCpbykCksRbeLk7gsklIIccgQQA0BenrJreVWnUUhmN1e779Yj5RUhI/N+uKPQ9
         Aqkg==
X-Forwarded-Encrypted: i=1; AFNElJ/nbsjrXjKW1iXg2eetWsUxLOaikvbH8/rPzWxUJj8g8PN8h7x1N828mcneXS1/aGwTXpJ9tOWy4NZKR8/TdDUO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0vOBz1Gy7xGBN4fPU5/dJ3xx81Wu8ojM0sk6cRuhCzqyGqcYE
	2d+XDGYEwTACTOHtnkRjoutmDK555m0pt837iObr4XoOxGNPZUa12fHmqskuUrUxBso=
X-Gm-Gg: AeBDietVushWHNuU3/uldLts0fbHnRDBAgwc+QLe2U38kS8EDemgUj0IRd2h0KoB91a
	R8PHCek4AMEVWuFvpgwX+/0iGun+LGYhPLW9SgF1YHdQDXmApAr0yevZvEjMyJEgGAuNIM3EAgN
	wzdWa5QSVjKPHbpgnggGYLgr9Ot+BQvEKdCd+89ucpEq/jBiaUfrDoS5G468NgqoXqfKffVrRAn
	HesXir1I7RkdWX4tv6FA01AHbXdt3tRP5fkV3SDw3/oB5RWNivYtYtDuuflO3xkgipENw8eDmCm
	/dCi7/OgBw97XI74hLH12ojLiUFWv6gzbvNLQL2i9b3L/NbyylPgtuATu+DC+nzEP9s91ROUW75
	OkKNV+DhbvVo725AG9+5p4sFKzB64IMmWsdLCMf1+KB8vTqYL3EgOVGCJtQi4GfXgy0Wqa3aZqF
	oARFgtfU+GcpoHXZcTZso7/b6uj1OdbHrhd/E84DgT1xnBxMvhfrmdh6codm1ThxUpmWSxrsSwr
	bCxeIJOr+aEgnswq5dtjkmLOd1EEF5sSYY=
X-Received: by 2002:a05:600c:354d:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-48a8445e8bcmr124239825e9.28.1777649573128;
        Fri, 01 May 2026 08:32:53 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ef50e59sm5648768f8f.10.2026.05.01.08.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 08:32:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 16:32:51 +0100
Message-Id: <DI7G6J6LMC4T.2LQ8SEC6HMM1L@linaro.org>
Subject: Re: [PATCH v4 00/11] thermal: samsung: Add support for Google GS101
 TMU
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Bartlomiej
 Zolnierkiewicz" <bzolnier@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones" <lee@kernel.org>
Cc: <willmcvicker@google.com>, <jyescas@google.com>, <shin.son@samsung.com>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <DI7D7JXW4RGK.XB0BE6ZXNMHS@linaro.org>
 <b9fa48f1-0ace-4a8b-b2bf-b5e01f789f7b@linaro.org>
In-Reply-To: <b9fa48f1-0ace-4a8b-b2bf-b5e01f789f7b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_163255_599236_6DBB041B 
X-CRM114-Status: GOOD (  10.56  )
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

On Fri May 1, 2026 at 3:33 PM BST, Tudor Ambarus wrote:
>
>
> On 5/1/26 4:13 PM, Alexey Klimov wrote:
>>> Dependencies
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> - context dependency on the ACPM fixes sent at:
>>>   Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-fixes-s=
ashiko-reports-v1-0-2217b790925e@linaro.org/T/#t
>
> cut
>
>> I've took series locally using b4 and result doesn't compile:
>
> take the set linked above as well please.

Okay, now I am lost. Were dependencies incorrectly described in this
series?

Log below of applying patches below:

Total patches: 11
---
 Base: using specified base-commit 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
 Deps: looking for dependencies matching 4 patch-ids
Grabbing search results from lore.kernel.org
 Deps: Applying prerequisite patch: [PATCH v3 1/6] firmware: samsung: acpm:=
 Fix cross-thread RX length corruption
 Deps: Applying prerequisite patch: [PATCH 2/4] firmware: samsung: acpm: Fi=
x sequence number leak and infinite loop
 Deps: Applying prerequisite patch: [PATCH 3/4] firmware: samsung: acpm: Fi=
x mailbox channel leak on probe error
 Deps: Applying prerequisite patch: [PATCH v3 3/6] firmware: samsung: acpm:=
 Fix dummy stubs to return ERR_PTR
Applying: firmware: samsung: acpm: Fix cross-thread RX length corruption
Applying: firmware: samsung: acpm: Fix sequence number leak and infinite lo=
op
Applying: firmware: samsung: acpm: Fix mailbox channel leak on probe error
Applying: firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
Applying: dt-bindings: thermal: Add Google GS101 TMU
Applying: firmware: samsung: acpm: Consolidate transfer initialization help=
er
Applying: firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_=
ptr
Applying: firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops m=
embers
Applying: firmware: samsung: acpm: Make acpm_ops const and access via point=
er
Applying: firmware: samsung: acpm: Add TMU protocol support
Applying: firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper
Applying: thermal: samsung: Add Exynos ACPM TMU driver GS101
Applying: MAINTAINERS: Add entry for Samsung Exynos ACPM thermal driver
Applying: arm64: dts: exynos: gs101: Add thermal management unit
Applying: arm64: defconfig: enable Exynos ACPM thermal support

Best regards,
Alexey

