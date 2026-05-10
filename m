Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F90CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 15:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=; b=TdkLJP6ZvQ2VSPpSEpQsJlPo0r
	2TvuIRyRTcxGCVePufdPE6si9ORSz+dl4H/LrTkhoKA3BletcPic/3B7aG0Xb7TV1bhLj4ASsUAAm
	wClDTEVuql3oQ6RQ5JD8jq5UjPEXsObZBgZjJZZGzUXmNPiFerrxD4lo8ZhwVTAEdN3cCpHbvUjlp
	nmYupNDJYmltW92XMtRjrFSQwsQXYfVQ5QDB1h/Yp1/Hv7t/f91vYXY/wUWGIiT1M+s6zYh1EigWy
	9fReKuEt+qi2OrCAIh6g5LJp6fOkaGsoTORV5TCmhgR1yZ2oDFtbcDNsn7y8aUQGGjFxmtvGIMgEA
	pkrJMHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM66C-0000000B3xg-3cDJ;
	Sun, 10 May 2026 15:29:44 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM66A-0000000B3wz-1wfX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 15:29:44 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4271947eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778426981; x=1779031781; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=;
        b=a+JY/GzLumG37xefhaqUR5yvJlRHoyxkhZADxfzTnCCCytat3L97oYcsTF2xKdZiXa
         ltsgnSC8HSo19kYsOsu/jQ4ZtnFcoxaujtUIVV4iWfra41SF8Tq/11+X5spaU170UF8R
         px36KoXFSRLVwedFixP29bVLW/BhGczv97LfbsTbo5jU4ZgvVNDoBW+5DF3mY7e/77My
         iL7ouZ8TEH0tfsQQoO82Bi9gGJPDiUGZ1REzMvoE4kHOMI4VObINyDcfcVAlJYlI3Zc2
         CZzVG1WsXwbYQnDERNqw1b7gMw2+aFwbxJxQS52MSn/qWs6+1mCq1M8KbD1fQtr9KRZZ
         G0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778426981; x=1779031781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=;
        b=KwVWnnlA0W21IrBlP/YjMugp2t3Riqv/DnOmfxgBPgC8GtDMdGuwa4IbhJmPHGyuoF
         MPYil/9vDg2qe8OgVtGqFtkZAaT1FTO7hmoikXQF/S7M9OrVNuq9Aw78mFnXWPMrLJq+
         J/gy/G0B/t83/7UItXxeH0kFwYr3EKYmrO/B5AWmr/Jn3v2rBvnwJPgfYY4+63fGozqT
         +ojNlCUf6Asi/zPHg16qw/ifC6bzRAI0aDBubBdPbWJyUM1b5PjhGoj64TA5rJegtefW
         G1xb1XrtNKmxOBSjg6m+JyChh8wsJduxQxbjh2vktW0mSee1JDAEUyYJVwS/3pcr5SZX
         gPaA==
X-Forwarded-Encrypted: i=1; AFNElJ/g6E5icbq9sepCISY19GJkmXcdrVSsXo1VyiryZQGnWXIZqaSEzTxADYjo+8b191Kqn9iU4YLCRwJVYgBlTeWb@lists.infradead.org
X-Gm-Message-State: AOJu0YwqlhtJQFCMOfXYKDugS2qume3WC049WGludscVI//n2AevabpF
	BJdxRInw1PYWFc+VNi4HQS+oiH8tSmCxXixqy3jEbiEBmKRIrEDhYpqb
X-Gm-Gg: Acq92OFQfaQnaECUzpvrXWMC+0fvdt9mZChILPa9gCvwgzXFMDQwGXzsNYWNHYgBo4k
	i9tEpU9O/1yK34GZPpJ6p1+BXIp8qAbXsZuEQusaVHweVJgFA3THFZAfrwqSbE46chcZQ484qAu
	QDQG5Hu1vewQmQdMGmdkIBOX3PECkAjhetEzULA9ZuDSc9oS/X1DKLZ1L/Tq5VnMMJaPM3hJLBy
	atzBcNd1EK92jjRow0g9DUcIVs4Z2dMncT3X7veXoOXFGTsCCCgtVzoAXk5PAO5wUeCUCyFcuqf
	wzw6eL8CWhXpA11U4D+yG5ftDik5+TVVf61opHE+XzTXquVd59/S81ZJo29ztEtLkCEAyznTiv3
	8nfJ1R2sbwGoKvrDHMWhWmLaMYZG2xhmHIXG6fM52XQfANO4lm8irKnFKh27h/P8+DC9Lrbcr1a
	kUNjlFy7g2tCnmF8jP/GzvBN2FccS5eAkZFBoCevfwQJZ3YIc=
X-Received: by 2002:a05:693c:300b:b0:2ea:5057:a2f9 with SMTP id 5a478bee46e88-2f549f7c2aamr9650588eec.16.1778426981133;
        Sun, 10 May 2026 08:29:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm8525864eec.0.2026.05.10.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:29:40 -0700 (PDT)
Date: Sun, 10 May 2026 08:29:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_082942_553184_B01844B9 
X-CRM114-Status: GOOD (  18.40  )
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

On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.

'"apple,t8103-wdt" used by the driver' is not true. The watchdog driver
only supports "apple,wdt".

> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 05602678c070..845b5e8b5abc 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -16,7 +16,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: apple,t6020-wdt
> +          - enum:
> +              - apple,t6020-wdt
> +              - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
>            - enum:

I second Sashiko's findings that the driver will fail to bind because it
only supports "apple,wdt". I would not mind and apply the patch anyway,
but the statement in the description is just plain wrong and thus
misleading. Please fix.

Thanks,
Guenter

