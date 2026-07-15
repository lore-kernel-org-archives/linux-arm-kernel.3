Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEBFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKMpslmS1nZLwbcYPHb8iOZLrmPISU+0dOPEfAdriDw=; b=GNN1O7hojhz8hY6ih4Hy91nG3p
	fUwY37QiteeW2eYLE7vcZzOkhsqveiz7cNzsfOiwknuCC7w+dtYZxPlUjnJmOh3moqrQnvBp9ANw8
	qYpjaQlsj6ZEbLQ9J/UDR+zAJK2L073kDBMBEpnnCHaIlgmsHiZm+RuT3OuhR5Nd9Z7YkwMbaIz98
	nhLjTst90tdMRNU6m/1LODfu/c0dpgSpfWqsuLlTBlgBoT0nAUszemJnnnIuQ2NdgvsuC1jfyNJIn
	h6r/Iq3xfOBqQXNYEI5EFiwjgCCrv2KgQmlJXm4vGPAzOXv39X8j0HoYot3VAR1Cj/Kv6SLG7s6AE
	IdyC/PWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2aM-0000000FTo7-1GrG;
	Wed, 15 Jul 2026 16:35:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2aJ-0000000FTnJ-28Xn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:35:48 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-848593533cbso3103623b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133346; x=1784738146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKMpslmS1nZLwbcYPHb8iOZLrmPISU+0dOPEfAdriDw=;
        b=UpD1D3sTL6ZZM+NIr0gCOq/o/9QTIbOQwIb0PCKlNG1eEXNf+maqLbGg+CPxwl/mOJ
         vaWZnNHqjFZpRrXBxMQFzn9K0jnDCd+ku3XkdT++RGGjGa5aAzXUF5ql0Q9AssiG9m3R
         ZySNgAk2UcqaM45sqX8b1+gHUu6+uhxBx0FiuM2JTHXVNbwAVb3N79S0Zu1J0J6gqMWa
         F5pXtnf0wEO2uWCoZv372rS5ucv2uqzfdKDWgtNS8PSi+q7mYmBn3kgi7s/6eEzPFn//
         mAFwF7RE+j6uyk/pJA/bnLH5ui1cH6nMSLp556H8Wa5RG1vs0mun0ZUJGx4KWpctjFr3
         34fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133346; x=1784738146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKMpslmS1nZLwbcYPHb8iOZLrmPISU+0dOPEfAdriDw=;
        b=BxMBpBAVQEqa99YF9qMUn5gHg75fetTxRuLKXEQsbXhRZpwRF3RuJBhXky0IDxuW3G
         UO6bWeR2X9Cou+4EGAV45dyBJKgoKis6qvX3DGBKagZG9Ej/1Rvpno7UCswo/6VA8qlR
         tvSqcYD6i/O1lOl2cVBqertD5P3dfqtjtP9SCaQLz6PtiBYnyZR2L2uGnBSo1KZC5jmp
         o/xkuHyV4IW3nNaYC7IMs5atQ8AKjXeiPj+kcCR3APf2yanADSzKvBEiwXOiTYgsvxDB
         meh4T0ABC9OXiBMBQQtN4/rOw3vGE5zFDkhdAWM56REUUVtjL1iARyuU6XRMu2rGkWnE
         l2gw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5RILlt85N5if7apjnbdHPu4Sw8DcSoqDFu6tn+jyEXhdPy3uhiKCL0aFgVCrSRj3j3vNngH0O4rjRW1TyFIpr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5V1HK1zEAfJIRvAARW0CraJDZ5gC60Phkid6XCRpFL2iascYD
	41K0tShGdUf2e3A1JfmrD2QF1fraxZGJymBhQLXnwKEy6eSYDripDEVi
X-Gm-Gg: AfdE7clTHUPA9/pV/CAYWISD3MTmbxqQFNA2lp9EWXzIwqZiJZg3zIykxUb20Ls/Fbt
	5rVpI11f8A9xZcInOZ0T593oXh9Ric603rpmq06+Z0itjM3rcQvR8bMPYXserx6xwKgzvA+9OkV
	FQ993CSOUaPxB8nbnDun06l/ymts93WpmoTK+e+sH16lYb1nhYCbarcwCA3mi9hmJqchJsISSPY
	mq9gZhCErhNZkl/qSWbNGlhh7Wx3fUGe1hgI4GOwFY9ReTST2vVXKxb5VAIQb3QLGU0UUG9Thmw
	X1I816cTsS0RCe72hzUJR6qDrjZV33iLm2B0ohddsVsbROxsrMVaRy/C1TXtkWu+A++nTskZlCu
	ftjIGGkIwQ6bcMTRsGYGu/ro71zHihJ8TGY7scQD3vzNWRwZRNdWeatpxGPc3n7qNBxhCpqVbiZ
	RrQgk+pI4pZzvU/TOsHgW48ak1Ww==
X-Received: by 2002:a05:6a00:2d8b:b0:847:770f:da4c with SMTP id d2e1a72fcca58-84a672425fdmr2861024b3a.16.1784133346501;
        Wed, 15 Jul 2026 09:35:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238b21sm3470359b3a.7.2026.07.15.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:35:45 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:35:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
Message-ID: <990ec316-5050-4e7b-93f4-b5a2a85ef447@roeck-us.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
 <20260715-apple-t603x-initial-devices-v2-6-df65b2485710@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-6-df65b2485710@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_093547_550110_6DEADC0B 
X-CRM114-Status: GOOD (  15.32  )
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

On Wed, Jul 15, 2026 at 11:11:53AM +0200, Janne Grunau wrote:
> The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
> with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
> "apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

This patch didn't trigger any conflicts against watchdog-next,
so I applied it directly.

Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 845b5e8b5abc..bef8255022fa 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -18,6 +18,8 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-wdt
> +              - apple,t6030-wdt
> +              - apple,t6031-wdt
>                - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:

