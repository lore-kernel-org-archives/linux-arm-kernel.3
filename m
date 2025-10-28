Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0B1CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:In-Reply-To:From:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/d1nVDJ7emVNTsvQ68M7pKA7Zb5SHnnPUqNukDQj+RA=; b=N3vjqHO2O3Ex7KFjsoJ6NQOjWJ
	0lYfDwuz3xPG6j+ab4SpL0zbcCzYzU2+jBLqE9d2TyclwydinTA/WqP4bFGd+L/sYaO6qBPAvwpfl
	uD0MT3vb5Wi009NUbJorhnTuGDt94Nlm+iBhEccwlC2tpGQQ+4BxV85p/WMgLFxThD6jGDkXd4UJi
	BDaqvnCoe47JaafpiIdXOQoT4IuaKcpcw1JI0gTCZzBfZz6hpkjEwXA2F0TnZCFe693lImZQgJEAX
	iAZpZafkpkKqq9mTEbnM9RuBaW0NInNtmfmer3bk5QgqJuLQ8LM0w6EBWyDelyBfuTSuytJ3L5wVG
	LirY/gPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpWK-0000000GYkd-0cxh;
	Tue, 28 Oct 2025 19:38:16 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDpWH-0000000GYju-1cnO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 19:38:14 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b3e9d633b78so54431166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 12:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761680291; x=1762285091; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/d1nVDJ7emVNTsvQ68M7pKA7Zb5SHnnPUqNukDQj+RA=;
        b=dGQeH8jk1Efp5+Kyk9ZXpFMWxtrrnNf9yK3t7/wynV4un9yCc6ib0zfisJMialfSV4
         Vo+wkxLpbhWbUpbZwnVoMnogh+aYq2bABODT2fuDeBGngG8n0qxZRWZyWoaOIcVD0yVu
         NvCUFX3yECVsgb//wScPCDzBmmzvreurcBNddBNqCW1f1TUcUnQ6bjudickJZbqQMLHf
         dx5l8n0k5XlFSHHbZHBfTimKuCU5DW3Ad7238lzGhw7vfVcSG2PAFdhw21mf4V45vY8/
         xPqfng74e40Fp/4IrgokRx9mzDs12D/JXIvOLLoS8huswFnP+OndubsE2CdsJKfjb93H
         7tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761680291; x=1762285091;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/d1nVDJ7emVNTsvQ68M7pKA7Zb5SHnnPUqNukDQj+RA=;
        b=oHP/rKDGSgFrohwwlmvmy7Eib8mEmMNlu6PW4IPxoQZfIyW8mzb5bW5RRBPoQn3xRP
         7URYXw85PdLiSY1YQ1aEDY9CRJo46R86HhFaCz6xgxiNzeKLLPX6CrhQ0XwRO23ahuFP
         G2N9w9M8dexycZkb9Y6EIvixAryo22iorVmlGU6KIZkm2o4l5bsCl/xxIPp+QEwx09s5
         vog5OLXHWJPmOFLrzJF89zwDIIhG58xWyPLTm/lDRA+1MUmQtZtYrSiF6fsaRpGnCdJc
         xbcl6rmebkBEhy1YuTete94IO2SK54KLCPkSUqpFpCwJYYg0DbjR0/A/SivL/XsZBBBk
         i7jg==
X-Forwarded-Encrypted: i=1; AJvYcCXLgYvjQtcThxN7PoRFnQizX8KK1WjsX6JgNe69quHy9q8gdfQV3ArdWki+ew5a0dmZXTSCDwIh1pbrVJBysWgH@lists.infradead.org
X-Gm-Message-State: AOJu0YzmIBqczj03LI+EcGCxGSxLfh5hkUmdXlVlm0SBzqf2hJWS2+Ca
	izwm/LZo51doW0J9XBghmaZ0l7SNlawWedgZWgZ2vZ0MA7L11v5dqPImFsmu8MJv6Dxhk2PfDQ8
	/9ZBlPRLFyLOjeZQCzUjH0X+CKvFrMzg=
X-Gm-Gg: ASbGncvM3NvFoInXsIPk+Xo/MJ114wNFf8/lTVN67HYPy9h02DCfZdW98cd/UGNWQas
	qu0TSGVl+PdCJizg27UMxUk20/2LIJe+DxpZShajplJTZqnlX7CPSUtMaXlWfIafvlAm5yUl7Y3
	IqYi6/x7OqwRkcwbcdif5MhbgSt5kqfNz1/sfgLup8IYXNCHf/RK2bRq2P8ymcOvVT2PfR4UoHD
	WRwusvAK6amhxqduxNBHsSlx1j3qR8S8SJ4Yw/huepPTL1pTCAX0BiXoVM0jxgEV8MiPg==
X-Google-Smtp-Source: AGHT+IFXCv3NLTqCfuR85Tev/aBDdsf4JrxkYAhURFZZFkUVV5Guf6SWg8m7dcZhUo+L4eIXn4zfs5S9vSsND2tSgig=
X-Received: by 2002:a17:907:3d10:b0:afa:1d2c:bbd1 with SMTP id
 a640c23a62f3a-b703c1f1e89mr42748766b.30.1761680291324; Tue, 28 Oct 2025
 12:38:11 -0700 (PDT)
Received: from 724652696919 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Oct 2025 12:38:10 -0700
Received: from 724652696919 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Oct 2025 15:38:08 -0400
Mime-Version: 1.0
From: Coia Prant <coiaprant@gmail.com>
In-Reply-To: <20251028-haste-amusing-78c28e834b5b@spud>
References: <20251028-haste-amusing-78c28e834b5b@spud>
Date: Tue, 28 Oct 2025 12:38:10 -0700
X-Gm-Features: AWmQ_bn7Qe26tzowtppaIPQCwjocMKpUT9bEG-eaS4l2nl7sB4xnwDMEoMgE1XA
Message-ID: <CALj3r0jQ-Y3wt=iyykrFVWDXyA+2feCtYy+budYzqOaVY6WqnQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add NineTripod
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_123813_457016_113FCC94 
X-CRM114-Status: GOOD (  14.06  )
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

At first, it was to avoid problems with the beginning of numbers.

Given that it is already used by downstream projects, we have retained
this to ensure that users can seamlessly migrate to the mainline
version.

Thanks.

2025-10-28 19:35 (GMT+00:00), Conor Dooley <conor@kernel.org> said:
> On Sun, Oct 26, 2025 at 10:36:44PM +0800, Coia Prant wrote:
> Add NineTripod to the vendor prefixes.
>
> Signed-off-by: Coia Prant
> ---
> Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d188200..37687737e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1124,6 +1124,8 @@ patternProperties:
> description: National Instruments
> "^nicera,.*":
> description: Nippon Ceramic Co., Ltd.
> +  "^ninetripod,.*":
> Why ninetripod instead of 9tripod? That's what the company uses and in
> the marketing fluff for the boards.
> +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
> "^nintendo,.*":
> description: Nintendo
> "^nlt,.*":
> --
> 2.47.3
>

