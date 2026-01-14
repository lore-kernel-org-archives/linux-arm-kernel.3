Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8FED31A3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG9zT1M5JtL8PrqjGVTSA0LQwsZKFnwHyBL1SQPctlY=; b=xANFIIdPT6iBZJHt0cLnixt3ps
	wkPFRmzWBZWicERvPo31INzxbVPU1ghyoOeBVTuJdTDxVfzfdr+usQumEGBfPVGXKs3VUtCapRqrV
	082c1268RLCeFMeZlsAOwuzS53nKnMIhoRD6MvZRpQbSK9J6JjvnbsH4IJsT2rQGCtFNyvOGosK8u
	tybCAoITw0o5Cmg5VOx1rzAaAkISOtXhbenO0AyyO8jARsEbyk2Mfzq2JjocRB3ZH2hNQuTuTDYsY
	t6aGHI7lek2PXz7sCFtZ5IvqivkyjdU35VwpMSbmJLSQ3jY/73zt7EmDJ//j0u1jww2XqGlpZRryV
	9dQxU15g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxpZ-00000008iDj-1QAf;
	Wed, 14 Jan 2026 10:10:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxp2-00000008hhg-21ev
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:09:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so2779665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768385389; x=1768990189; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uG9zT1M5JtL8PrqjGVTSA0LQwsZKFnwHyBL1SQPctlY=;
        b=RNHx9Vf2SSdQuV6Wv9zWazCEiRjAMj3QbTsnAdwGRIJ3lP9xCB9Y8S3kJPMW30mG8r
         1XNwl7bgz+E9DPA27ZXHL704zYmYSSGtACz5hejlWMiPAqNVD0MNaCDmDpWAq4KRDHD+
         F03nk9oXItM2oyx5mjm0ixGCYmgNL1j1NLKDN8iE0ig79Ru7sakGCaEi0A2qIKo77ZOS
         hAUze0+eI+96Xw3D93m6BE8FutYR0JJjvJl0GFJc0JdJNzinM2jVA3rH369FYH1v8dwD
         oIJ51oqm2WlZnTbg6w/QsZPmiO/1/s5jwAAoW649Nu0HetbAEuV1QIVO+HGxXE4rqurI
         1SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385389; x=1768990189;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uG9zT1M5JtL8PrqjGVTSA0LQwsZKFnwHyBL1SQPctlY=;
        b=IWzsAMkiYobXxVF/z17WnHy8dZ5oSt+PVXErS8gSV4DNBLKSjAKiphetBC6AAIzjW1
         xI1nJ2Q6WDnpkmpW6EnYsr3O5V6Fg02EHVLA6UqAqld1U8LKEsif576kTPY9HwEOE01i
         wsIUQjlZOPqnjUL2jEXp5J0jbFGKVi5IN+5OeG4xADQCunzGI5GPN9pLBgnU0QoRgWdH
         U2uPO9/BOm/ANGiKiG6KiCvJqJOegVwV2gPiHH/hFLUtTWHi4eIsKxP8yfF44dodW7yY
         c+8ofA6VH1OzcC+KruKdS4d7UmsmmrAU3jKoFdWRJznzf2W0RnNCt7KsF58uxsekVqIi
         rgdA==
X-Forwarded-Encrypted: i=1; AJvYcCVHm2qKtdGdUsd5gKniFqikORaTpEiEcd/9FoEnYef7K7LhZmmVBEymi6EysCwkcZiGDsmxY6M2rmYeROxw/lgu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz61BvxwOBUHvRxIOkm/532axS9FS7+ghsiYpDpKY9iRyPwlkOI
	OSrinDiKymPIwGsZQVTTh7ORHisyTVsLnl9JcNgKTst2qqgONDmEY3pe
X-Gm-Gg: AY/fxX7wYGtBz8FX5WzUKpRqsWmrWIMPmfpV/xj2FfgzLb/rpb9T6ncrAhs00R4ZDOG
	GVD6l+TgX3fo2qE+ff/6zvX6kWALRTrPkttDO8h4paZQYHJWVw38mpNv5XHMK/x9mZ7Sz1092Db
	86MgLvNNupkaf+E7AkcgKoUHcmTeUz9U8lB6DjADnCZr3SZNh6W8mQj7LIq5/oHjur8ri+LkjZX
	NMEiX0skqqB3kdgBO3S3akAQDocdnbTq69qdWWGkzmdhQJ/eItGIMU+9sGlNKTZsqxsNrcBYDS6
	/d2tR9slcMGvXMh1QRdW6K8h01hJWAKXWOlOrwtaLorQHjWesHsRct0mA8cohzOWoBIE19fD7zl
	8MKB9jgL8X/bbVbnWfCd+55QqsVmBtyxzRtiN0qnUgnRifvUnb33165t+4CTkU49dvt76aqBI6E
	NYNj9ngnM7va/RzkNgAva3iqylNyasa8TFzwzHa64=
X-Received: by 2002:a05:600c:3d96:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47ee37a442fmr23416685e9.11.1768385388706;
        Wed, 14 Jan 2026 02:09:48 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-81.ip49.fastwebnet.it. [93.34.88.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee27d9aaesm17665225e9.3.2026.01.14.02.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:09:48 -0800 (PST)
Message-ID: <69676b6c.050a0220.5afb9.88e4@mx.google.com>
X-Google-Original-Message-ID: <aWdraCzEqwc4D_1x@Ansuel-XPS.>
Date: Wed, 14 Jan 2026 11:09:44 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: airoha: npu: Add
 EN7581-7996 support
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
 <20260113-airoha-npu-firmware-name-v2-1-28cb3d230206@kernel.org>
 <20260114-heretic-optimal-seahorse-bb094d@quoll>
 <aWdbWN6HS0fRqeDk@lore-desk>
 <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75f9d8c9-20a9-4b7e-a41c-8a17c8288550@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020952_682113_BF99CF16 
X-CRM114-Status: GOOD (  31.73  )
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

On Wed, Jan 14, 2026 at 10:26:33AM +0100, Krzysztof Kozlowski wrote:
> On 14/01/2026 10:01, Lorenzo Bianconi wrote:
> >> On Tue, Jan 13, 2026 at 09:20:27AM +0100, Lorenzo Bianconi wrote:
> >>> Introduce en7581-npu-7996 compatible string in order to enable MT76 NPU
> >>> offloading for MT7996 (Eagle) chipset since it requires different
> >>> binaries with respect to the ones used for MT7992 on the EN7581 SoC.
> >>>
> >>> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>> index 59c57f58116b568092446e6cfb7b6bd3f4f47b82..96b2525527c14f60754885c1362b9603349a6353 100644
> >>> --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> >>> @@ -18,6 +18,7 @@ properties:
> >>>    compatible:
> >>>      enum:
> >>>        - airoha,en7581-npu
> >>> +      - airoha,en7581-npu-7996
> >>
> >> This does not warrant new compatible. There is some misunderstanding and
> >> previous discussion asked you to use proper compatible, not invent fake
> >> one for non-existing hardware.  Either you have en7996-npu or
> >> en7581-npu. Not some mixture.
> > 
> > Hi Krzysztof,
> > 
> > We need to specify which fw binaries the airoha NPU module should load
> > according to the MT76 WiFi chipset is running on the board (since the NPU
> > firmware images are not the same for all the different WiFi chipsets).
> > We have two possible combinations:
> > - EN7581 NPU + MT7996 (Eagle)
> > - EN7581 NPU + MT7992 (Kite)
> > 
> > Please note the airoha NPU module is always the same (this is why is just
> > added the -7996 suffix in the compatible string). IIUC you are suggesting
> > to use the 'airoha,en7996-npu' compatible string, right?
> 
> No. I am suggesting you need to describe here the hardware. You said
> this EN7581 NPU, so this is the only compatible you get, unless (which
> is not explained anywhere here) that's part of MT799x soc, but then you
> miss that compatible. Really, standard compatible rules apply - so
> either this is SoC element/component or dedicated chip.
> 
>

Hi Krzysztof,

just noticing this conversation and I think there is some confusion
here.

The HW is the following:

AN/EN7581 SoC that have embedded this NPU (a network coprocessor) that
require a dedicated firmware blob to be loaded to work.

Then the SoC can have various WiFi card connected to the PCIe slot.

For the WiFi card MT7996 (Eagle) and the WiFi card MT7992 (Kite) the NPU
can also offload the WiFi traffic.

A dedicated firmware blob for the NPU is needed to support the specific
WiFi card.

This is why v1 proposed the implementation with the firmware-names
property.

v2 introduce the compatible but I feel that doesn't strictly describe
the hardware as the NPU isn't specific to the WiFi card but just the
firmware blob.


I still feel v1 with firmware-names should be the correct candidate to
handle this.

Hope now the HW setup is more clear.

-- 
	Ansuel

