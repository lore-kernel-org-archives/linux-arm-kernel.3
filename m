Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB25D74977
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 06:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Cc:To:Subject:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQB2skrqNyBBtXr9NvGq3k5U2F5Farr1AhF3+r/DnZY=; b=CFWkS13FnVgtsNF+HvCKwMWvCf
	mpeBHjn92eDmUrQQ+ppCcEgxgeh9O6PXqfxG3nyVfjcmIrc9lK8T3yGiewk18hA+raZSMm2IrE09f
	iqcQuYpMm/U6r1hChiU3kv5THqRjgjB2SPLAZ1AgHkKwn1K/NS6ABZTQDFTYgCfoCyZdPOK/v6p1A
	v+YyV6lkmcMLHOrOm1Km4mpFajyZpOwEL+llY62lazrV64cEtNpXAPeoc78uUua6uJviMJ0YvWxtC
	SL2mQlJEYAIZ8MPIwAz4a+xTB0grhJlwBpYCl6UCwLA6BND6+Sy6gOKJ5qGLSmrq6JchO4ZB0CVvo
	gNwUUHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62IL-0000000GyId-17aj;
	Wed, 30 Oct 2024 06:35:05 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62Gg-0000000Gxkp-0Yoh;
	Wed, 30 Oct 2024 06:33:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso920603266b.1;
        Tue, 29 Oct 2024 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730270000; x=1730874800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQB2skrqNyBBtXr9NvGq3k5U2F5Farr1AhF3+r/DnZY=;
        b=fu67ussxRczIyzkC0QaszT5JYVmZHSs5zq22lL4b9j1KzmEGk9iJ7XlxCJy+olXr3y
         6Y41yOfUHeyq0bpovZi8eydamblZCJ/2tyK968iAVEa2a9jH0dU2AJX7RUQyNYgBwwbc
         4M/rixrRaqHxIYH9Kit5Hj0jr7AafjZbQgrYj4cNkBThMFRgrVLvMIB/3TLxbHXRKJB5
         /iMZHUIy7vfTAHeltvHCnVSNhMuUBGUzLeB2MjEf8jYXqz4moLl5zx1PxrpiqoE20fdh
         S/PmCvaMr/kxKpjPvsRagx01x8nDvKLRNjGhxND/KjZSiDP2BZO6ZzA587hUvUK8u+Eq
         bNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270000; x=1730874800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQB2skrqNyBBtXr9NvGq3k5U2F5Farr1AhF3+r/DnZY=;
        b=bt3Ho/Xu8DiN0VhU6gnbig/xKzC0Ux8HC7uXXok5tuJnRvZH8L+8QsnEqTWq0ED21z
         DQ5jgcOQO/0mTRDfXJmutCVpdLs6YTo6qzVPW+MZTL0crNBbq3xKgQetWt3Fa1XUNksT
         aKZ62+haCmDviLxcuzFO00DtBPOM1r/4CnpEDSgaP9NPL7PiT9XyGeL/QShQ4qVG1yXV
         lbskAJ66ckK6O1HTGCtbf675EerPXhJQxXYluFb0s+VwOi9wb/7lQ+IAcQsjNlUnFOgA
         m+rSFQ0E8jlc+LRbqqS/aPrm/lHjrk+A/xCLnDv9HnnsITziewSY/rhbn9YoXeQiu+L3
         /6xA==
X-Forwarded-Encrypted: i=1; AJvYcCVVndxncSEQWGuwFafrJLWUXX3qu7BlejOSAMJHOIiOS0sV2lpPEwzUvMzKljpr9QM1bedvEkxjnq5mWBp2vMqW@lists.infradead.org, AJvYcCXs9paCuCg3axbf/JMUGowKbSE6SByiQTRPTmRMPs3p9Q/JqRCwJu0UDC2P0/8nIWVy0cpFV8YS1FBk2GB2XH0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMR6m8h+oJCx61crn8HD6J5ZvFOd4wgyEeryedpLQvWrk10Y8i
	UmdjZOZp+TemYrH/uKLXWg/aVuBM0OcZIv+MrSn/o9U3M1RDKwA6
X-Google-Smtp-Source: AGHT+IGoO/JgCl6tIFd8tMOpxidHIIxUPkp1DnQ/++FPlMXZXQ2ix6vSKLM04UkK2EC6h5bxjO2Xow==
X-Received: by 2002:a17:906:6a0e:b0:a9a:2afc:e4da with SMTP id a640c23a62f3a-a9e3a7f433bmr177110766b.63.1730269999630;
        Tue, 29 Oct 2024 23:33:19 -0700 (PDT)
Received: from [10.34.27.4] ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7adadsm544485066b.175.2024.10.29.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:33:17 -0700 (PDT)
Date: Wed, 30 Oct 2024 09:33:07 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Message-Id: <7VO5MS.DLTH7ISEUBUE1@gmail.com>
In-Reply-To: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
	<20241011120520.140318-2-y.oudjana@protonmail.com>
	<20241011165640.GA2475122-robh@kernel.org>
	<2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
	<CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_233322_199818_5A6FB17F 
X-CRM114-Status: GOOD (  22.68  )
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


On Mon, Oct 14 2024 at 14:02:37 -05:00:00, Rob Herring=20
<robh@kernel.org> wrote:
> On Mon, Oct 14, 2024 at 3:27=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>=20
>>  Il 11/10/24 18:56, Rob Herring ha scritto:
>>  > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
>>  >> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>  >>
>>  >> mediatek,pinctrl-mt6795.yaml has different node name patterns=20
>> which match
>>  >> bindings of other MediaTek pin controllers, ref for=20
>> pinmux-node.yaml which
>>  >> has a description of the pinmux property, as well as some=20
>> additional
>>  >> descriptions for some pin configuration properties. Pull those=20
>> changes
>>  >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to=20
>> match in
>>  >> preparation to combine the MT6795 document into it.
>>  >>
>>  >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  >> ---
>>  >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38=20
>> ++++++++++++++-----
>>  >>   1 file changed, 28 insertions(+), 10 deletions(-)
>>  >>
>>  >> diff --git=20
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml=
=20
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  >> index 3bbc00df5548d..352a88d7b135e 100644
>>  >> ---=20
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  >> +++=20
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  >> @@ -111,12 +111,12 @@ allOf:
>>  >>           - "#interrupt-cells"
>>  >>
>>  >>   patternProperties:
>>  >> -  '-[0-9]*$':
>>  >> +  '-pins$':
>>  >
>>  > Worst case, this could be an ABI break. Best case, it's churn for
>>  > mt6779. Is it worth unifying?
>>  >
>>  All those MediaTek pinctrl bindings are mostly the same, where only=20
>> the pin
>>  definitions in the binding header does actually change.
>>=20
>>  I think that it's worth unifying them, not only to get rid of the=20
>> duplication
>>  but mostly for consistency between all of those subnode names which=20
>> are wildly
>>  differing for no real reason... and consistency is a long time=20
>> issue with
>>  MediaTek bindings/dts in general (which is way way way better now,=20
>> but still)...
>>=20
>>  Besides - just for context and nothing else: the driver doesn't=20
>> care about
>>  the names of the subnodes, anyway... so while this is technically=20
>> an ABI break
>>  it's not really creating any functionality issue, and then,=20
>> actually, Yassine
>>  is also modifying the devicetrees to comply with his consistency=20
>> changes, so,
>>  in my own perspective, it's still acceptable.
>=20
> Wait, I thought there were no users?

Right, When I said there were no users I was thinking of MT6779=20
strictly, but MT6797 is included in the bindings so it counts too.=20
mt6797.dtsi is currently the only place where these bindings are used.

>=20
> We generally only consider node names ABI when/if something or someone
> cares. Most of the time it doesn't matter. For the pinctrl nodes, it's
> really just a question of churn renaming a lot of nodes.
>=20
> Ultimately, it's up to you. I only care that the implications of the
> changes are clear in the commit msg.

I'll mention MT6797 in the commit message.




