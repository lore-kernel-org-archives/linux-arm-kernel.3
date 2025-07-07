Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D36C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEoYgZVPqV6REtyvNEYkqmdU4AlOYV3bBv9n+zrtW+0=; b=nuk13RnN81LaT2DX+F9F6B0ZS7
	8qe7mRaYMR1FG+8t2IzHzZx7hvmt5SV8madTCsSo2hj4sSIjDfhLxh50xT2UyAvBa8hliCyZLW5eD
	vmiJTXD84fjpBxHFN3TBlNm4kJPv8D0qjOM1XnHpBqfAnP8au+QxJQfFS1ys6kkFEGihCcwJgSBoL
	fVccqp1WdxW/OfBnRMPC0TPpcX/mwRmy2cXP+XtsGJ3EVcPpJVsBEPiXMwNPNt7ZAsJq8U32pHrjs
	rKxKNQmbPtx9A5YePdrTX3+pNqFUtpVdUYkT/AEHKnroIR3w/l+qU8ibnGrMwHk8y4FKRmg7I4QzE
	uLYFatFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhjG-00000001uzF-0wdj;
	Mon, 07 Jul 2025 09:01:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgpm-00000001nNn-2eII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:04:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451d6ade159so23311855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751875457; x=1752480257; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEoYgZVPqV6REtyvNEYkqmdU4AlOYV3bBv9n+zrtW+0=;
        b=H86r0n9mwkzcIKlYQZqHdlGM0JvjOl6NjwU7eUv/FnNADSX9/qqUyBoTMlODG3oa3e
         8H4OE+vexVBQ4w2XYwon4nAkLE2alpk0zujuiKXm2Mtie1IFRhUHzEUjcG5ZRPzgVWLY
         Q3G52jUnJCw0dFdW8fh7qz6sYkzzvRwaa2INXu/KQQ9Mtk6sUia3MQmi12IEpcMn8Pkb
         x59F/POLTizd4VgIDV9aG9ugrDFksG2CdX+3pr54ncLsjG8jVt6ZzvwgHqL++r5KVpQi
         NTkFynptUjAt6teT8VWcT+3K7LPg1T4zcfo2XNzAQx6u/b8alBZ9edBDZ1GFv6JBYORk
         yl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875457; x=1752480257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEoYgZVPqV6REtyvNEYkqmdU4AlOYV3bBv9n+zrtW+0=;
        b=HF1MrSWhz7FGS71TzDceEV0Hh5FVo/3YSNh3/HFm41K2tsNxpG+wGwJyMi30Z58IJE
         XBuoz5JXn2CTznyvwS3R18JdjZQbLUvNaL/2zdj4uSCmZkMOlzlszAfCce362oCOaFN/
         8P5zpfiLnL84Fwv8Buo/1Q+7nLRxYOnWvn0xRtLlBqPm2OxIoM3IzKm4/OQuMG8YLIhu
         /nRun2qS+LFcctQXfVOkKJS3iz4ppeysKDLUMy4skr6G/0L3VVAEIp0ndhzJEHbVMNP3
         0md0CPDQIxY/T/gGFWjMS+uKn/ar8bMwWE9Oh8yCRM1wlkjDGNHWeWBDb36zKLemH38o
         OvLg==
X-Forwarded-Encrypted: i=1; AJvYcCVLv9i60te0H1KjFVX38AygrCLavYG1SslGoFVU99OFuQ2yAajh+zt60wNDaWQgd+NqcEsUCfndpKzN+QtbT0Xn@lists.infradead.org
X-Gm-Message-State: AOJu0YzlMQef8CZe1n2/4pjLn+vXHrgJYf7mGaxrLvub0NmC+PQLuMHB
	qbncTWikdjllMbiVeJ0HnZedYxTQRGm3Fidd/I4qIcQCwDpNxn5JOs5RBQwSWzy6oYk=
X-Gm-Gg: ASbGncuYHQIFjS/aKK7H7o8+MQX8mBiJpbiey5aEPtBhWYLVKLSKNue2KRAEJQcgSu7
	iFTIcTi5kVi2GejVSlKMa5QVBC/u7D0L6PZY3jlG7Y3ZE5osybLIML0WoYzRLQjBGtJmMis2MaE
	pJ7oSHb+n4cI830Xsi9mZbeAIbDucL4VPGuC4I7sMtEgcdw93HNWf8fNl7heCNnaxcHBz3Hs2MA
	WBMFOkFxcUP7Eub8n8Dioiz9JqHhaD8awQBEXBh3FHvQ1qEBoYf1/BZeXMbYuGtFyX8jJ7j1cIG
	re/f6GOMAkrBgjqX4LFsJ0w1BMQFMepomL8+UkphQF0T2EbSzGq6tdprrGxeYfj7dA==
X-Google-Smtp-Source: AGHT+IHEIeX1O24CgOzuWsNBfkxeH6TOmmWEVLZJcsdlbgvxYrZII56COdsRCTeJJ4eyH1AmqDGCWg==
X-Received: by 2002:a5d:64e5:0:b0:3a4:e609:dc63 with SMTP id ffacd0b85a97d-3b49701fd14mr7926081f8f.20.1751875456566;
        Mon, 07 Jul 2025 01:04:16 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1698f54sm103519225e9.33.2025.07.07.01.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:04:16 -0700 (PDT)
Message-ID: <2e26f8f534284b280e9d5e8d4ae556a452e93ff5.camel@linaro.org>
Subject: Re: [PATCH v4 2/5] power: supply: add support for max77759 fuel
 gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Thomas Antoine
	 <t.antoine@uclouvain.be>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau	 <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon	 <will@kernel.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>,
 linux-pm@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Date: Mon, 07 Jul 2025 09:04:14 +0100
In-Reply-To: <CADrjBPo2=FajKA0t7TTMdH6iK_qbWCSJK-hEqh+UWEuzC7wyGQ@mail.gmail.com>
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be>
	 <20250523-b4-gs101_max77759_fg-v4-2-b49904e35a34@uclouvain.be>
	 <CADrjBPqOMOyHP=aQ1+fg2X58NWRp-=MJBRZfpbEhQsTzaZ9LHw@mail.gmail.com>
	 <bc40326f-db40-4657-84a7-152def2ca9e3@uclouvain.be>
	 <CADrjBPo2=FajKA0t7TTMdH6iK_qbWCSJK-hEqh+UWEuzC7wyGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_010418_672333_8E664F17 
X-CRM114-Status: GOOD (  21.02  )
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

Hi,

On Mon, 2025-07-07 at 08:16 +0100, Peter Griffin wrote:
> Hi Thomas,
>=20
> On Tue, 24 Jun 2025 at 16:45, Thomas Antoine <t.antoine@uclouvain.be> wro=
te:
>=20
> > I am unsure about what to do about this initalization, especially for v=
alues
> > which slightly differ from the devicetree. I think for next version, I
> > will have the same parameters be passed in the devicetree like android.
>=20
> We don't really pass register values like the downstream driver is
> doing in the device tree. I think you will likely need to add a
> max77759-gs101-oriole compatible to the driver and then have the
> application specific values, and m5 gauge model algorithm as static
> info in the driver applied from the dedicated compatible. It would
> also be worth checking whether any more of those register values can
> be represented by the standard power-supply binding properties that
> already exist.

I believe these are likely battery specific values, and were obtained durin=
g
battery characterization by the vendor (or Maxim). They can change (with a
different battery supplier etc, hence I don't think basing this on a
max77759-gs101-oriole would be correct here.

As we learned from the Pixel 6a battery updates, the same phone may use
batteries (e.g. from different suppliers).

Either it needs to know about the specific battery model, or the values
should be passed from DT in some way.

Cheers,
Andre'

