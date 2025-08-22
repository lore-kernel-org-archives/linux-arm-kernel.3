Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D86CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=; b=MXyFCz0DDiQaCYELehbLlTvc+n
	WAV1twH4rBpF+10AVL5+oml7HzU7LZwmrSBLAHQePY4ObzFN8CaiavfzCZ6+yKxav3bVXa0i4YY0n
	j4PXGRnulxklGULn7NvWg8NSkVdAzzZfFBZVyo/maGd55dxddv0nzhohHvMvYiqPRzDflKO9YSKHP
	v/U8+tSRVykf80nMx1RMkboHffMeTmdM68RCHuXZC+TNdGDBLG7tbiCcLeHVc9+TjDUtD86pI+QnS
	SiRd8iGsJ2gqbC/DBi4kP5k/4QoNFsSqzrtXsaoeq5SQSF6b2VwIUtanVlB6tcCQmKVrduD9ff5bJ
	HCFuewqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTPA-00000002xJA-0t38;
	Fri, 22 Aug 2025 15:10:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOwB-00000002BaG-0qxQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755858237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=;
	b=DbOyIrT0oo3LaxWkFj22kgDGX32LmZAJ6K90PumU/WTQ1QrCv57MdnQJWOEVVRJ2RYkUhX
	07wLcaedNudYfRpzD50tdzwd5JJVEoQrnMcOrG0vPRwAxIKcrBoHHQYvwkyj4OI8d5hOfo
	fC9Mc8reo21nbwEfUbVMSXfPd0nQzHY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-zEQVB6VSMjegHgJ3iC8VOA-1; Fri, 22 Aug 2025 06:23:56 -0400
X-MC-Unique: zEQVB6VSMjegHgJ3iC8VOA-1
X-Mimecast-MFC-AGG-ID: zEQVB6VSMjegHgJ3iC8VOA_1755858236
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e864817cb8so812062185a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858236; x=1756463036;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=;
        b=tKZ9k0Bc9SYrMmrWEKuD9Ddh4zmm/bQZ2WdRpTMu99xA5IDMHTR0gX7XUABM39EFOJ
         Qq10maPLT8L2IU/YreZryVSfe1Lb9+5VJay7xf7pQc49tWuT/o5fkCDaZsXIKK2MGcEs
         rg/upEmFMjEX0Az+ealgxIhgW/hVISUqj6HHF7g+rMqIXEV0MkmLYAS6coaOYRady+uN
         uKxP/MCFFlhQtRGcPNG910nnyS/DCw9+8/qr0f0Jg9X3MUz0XG3EryRaGhnbmRtwabpV
         AD+TlYy0SxZvloI5opaGhAnd8R44GsH9+HgRJALfp1LIoWLWDMf34gMkzsYWKe4S2hfS
         9U+g==
X-Forwarded-Encrypted: i=1; AJvYcCXbL9JjtVQnxps2VkLUHMbKw+2jl929QXYi9ucRWu/2ZNh3RnYWTx9WwEDo0icX+Pdn/qfmi3If74yQMvc0l88w@lists.infradead.org
X-Gm-Message-State: AOJu0YyVx3JuL0wSzuqB+AZ4qySdUWCy5x+1BegSEVsgUYLO7aRlxXaf
	ABbqNq3t4EUh3n1F8b5S9qxIt4/2pOmRvzkYWLWz8nID75YQ2aVwhwztWiYwqVql/3X1qb5iSPH
	dZ+7aBe9u9JuZccLeO8OXbQntKYiru+GOtxmr3fDe0DB8eoWtrNfuGfaCpLBLOmNRxCP6T8QTR1
	im
X-Gm-Gg: ASbGnctr7vvDyrezZ+U0ywa2+tsRH0od0USyRa0QOJw5QygovbrdeMCjfTT9fYJ/TDt
	gf6XFO62CQ4ppBQol6QmMgj7g/n+Pg5dsNRGlL9/k8jlJWBjNvUhFY84KgAZYMReCdEDxsv6s3I
	W90U4YcOLs8OLrY6GQFDC0kHIBrscpWXHrdKr4ObQpTlnk9nlOOzBxaNGZD5n+gNPqpXnAS5UVR
	WLVeSUvALPuBxDc2C6buD1n9itUJ1Z3Mjjr+/VEwn3Souk5d9w8yECWf1IWjRKaUsJwzJxGHp44
	C90BG7L2/RKVCb5o4LDq/mn5WKM1rphLR5p9e6RAqIVal9qL28NxjEJm7E1NOVs+3+180sAyfsV
	O9ozzYfgB0zP1fzk+HVM=
X-Received: by 2002:a05:620a:2985:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ea11515112mr250142385a.4.1755858235947;
        Fri, 22 Aug 2025 03:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzbF5my1f7sWP1hvt+Ae8lWAWkUFPWkmMGpX8yUvMXDR4PmNo9Qp3wmQyKLcPE30uIWwQ98Q==
X-Received: by 2002:a05:620a:2985:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ea11515112mr250139985a.4.1755858235417;
        Fri, 22 Aug 2025 03:23:55 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7eb1123ce2asm16520885a.65.2025.08.22.03.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:23:54 -0700 (PDT)
Date: Fri, 22 Aug 2025 06:23:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
Message-ID: <aKhFOHFGKPYXgIri@x1>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
 <aKdmurrT1pFtLSI8@x1>
 <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
MIME-Version: 1.0
In-Reply-To: <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: khzCWdLzcNY7md-EnA4rUNPK-e8Ba4ZNpqHcls-2IZU_1755858236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_032359_344878_C0581D62 
X-CRM114-Status: GOOD (  21.95  )
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

Hi Tudor,

On Fri, Aug 22, 2025 at 09:14:03AM +0100, Tudor Ambarus wrote:
> On 8/21/25 7:34 PM, Brian Masney wrote:
> > On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
> >> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> >> +				unsigned long *parent_rate)
> >> +{
> >> +	/*
> >> +	 * We can't figure out what rate it will be, so just return the
> >> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> >> +	 * after the rate is set and we'll know what rate the clock is
> >> +	 * running at then.
> >> +	 */
> >> +	return rate;
> >> +}
> > 
> > ...
> > 
> >> +
> >> +static const struct clk_ops acpm_clk_ops = {
> >> +	.recalc_rate = acpm_clk_recalc_rate,
> >> +	.round_rate = acpm_clk_round_rate,
> >> +	.set_rate = acpm_clk_set_rate,
> >> +};
> > 
> > The round_rate clk op is deprecated. Please convert this over to use
> > determine_rate.
> 
> I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
> as deprecated and add your Suggested-by tag? It would help other newcomers.

I am working to remove round_rate from the clk core and the various
drivers. Your driver just needs to be updated similar to this:

https://lore.kernel.org/all/20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com/

Brian


