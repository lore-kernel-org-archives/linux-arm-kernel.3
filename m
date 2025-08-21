Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=; b=nVVabftOoiN+iXKGDDfvQr1oxm
	9MQay8BO2pJmD4vbxhlc0g/sVopixWvK3Opu6NyPR3FSf6SnfTCmZHMaKtpyAzw6wNvGQ3RZ0XIF0
	aBsTr08JCKbTCLfX8Z3ixXFOzmI34TWBtC1bCSOpOFsL1aDv4jhipVAURc0xRBpv3r5ISUFxb1MOT
	laKMT0shp14o5509kRxJUxCO0mWVKUcCNqhtolpsrgKUhxBy0zoICIbWCMfCJKzMA30QzeAIvxT6/
	y+kEq2NGbvNNwu5PqO0KcXQalzJH9o62e6MeOyWg+6wtY8E6gNMSVluGJ+MLnVhVX1oDsIMqOv8Rh
	jjJefg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEyb-00000000xWx-1gfY;
	Thu, 21 Aug 2025 23:45:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upA7U-00000000B7k-3Rnx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755801279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=;
	b=JdSAEXpaFGZ/sTErFkF3PSMmCQEM9xibsz8uyiLJrXb6+ZMdVrp1QFe0yVayR18sEjxCTy
	Sw7bpsRUaHZX005KN2El57czkJKIJGdKLBsZzarJ1tzgF03fL+CxOYKay0MADu3gkTjFFU
	jVLfuEwwQWb7e34pXrdIUI6TNvze8Tc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-WN9X8FnNMnOufnVJrMwcCg-1; Thu, 21 Aug 2025 14:34:38 -0400
X-MC-Unique: WN9X8FnNMnOufnVJrMwcCg-1
X-Mimecast-MFC-AGG-ID: WN9X8FnNMnOufnVJrMwcCg_1755801277
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ea01ed5d7cso145314385a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 11:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755801277; x=1756406077;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IdtsQzzrEsnVQCR1m8AsOo08J6mLd4OylRDhAWo4nw=;
        b=vPXpF2aVN5Cvffs2qR/7QaxTt1TTfCJZIE2MjwlB+kSAQo67fVvITMsTyyyEL0dO8o
         npUaY/gRNSifaExlp+667946qKsrk1KPRp0JcbbIeSumjCrHGS9AUtT800UpWDfpERoT
         ButT0nAf59dNhQo8r6UFckaZaAT0KOn1kYRCh2ZCasy2OyzIndqlwoh9SD9MKgLY1EhW
         +Q4EmS438Rr4BCVn27iPWSvzk5ROrJ0uUqHG2PvKw/DzOmm7F0SIAUMcr21yN3MGV+gm
         kfLNIVS+R2YprlYDpz9J+3+3Zmnuuu50di4h69a681Grn5bLG3Q412gyejrvujPNz6Oo
         J++A==
X-Forwarded-Encrypted: i=1; AJvYcCUpbQzEuPYn/xn8sKdeXoWp0ZNp9WRicaKoJD1UBoGC1Xj80L3qnJHP/JMRcJQOOfEjYDHDcQAFvtgLqxx0kloN@lists.infradead.org
X-Gm-Message-State: AOJu0YwNXlbVqprQ7YJJ2eJZdyJIcnkrFkS3Mh5lPUAmuMfXe9+SlCtF
	pCenUJUdHA1OGminAjnN+nf1ZggNuBJkTs8wi5sjJJJvz55ieRTxsmeZrnkbkVIySvr/x+cc87b
	poXUHfo5/iQs8TzgBp1c53aDVQd+AngajTlmniFvjdnc3T3UHerAF0QZNNaXs+anWMgJKolDj6V
	9X
X-Gm-Gg: ASbGncsN4FWC7Uf6wcDm6+6pUPnHNRHFjCqta0EiQGUlfzkUXWEynJhSiyfy9cPt6kp
	IQjLlEmd9+LR6TD69kxK2xmbQ4cFNl6uA79GvF5AGUSpaC/vFBLk8W0pSeYqB2DE3Z26bovF+Vh
	v2NKHrGlIX/nrTpu6ocDGI01h08G8fNGb0lTtRvpJau+dw1FYKuus7OZqWjM/hhLu3UJsW38WbU
	uYMFBafYhS4tNvgLCmUksfjO6XPz/uYMQiuWob49jpMaz0wtxT4flLZBP1dY9PS3wU1w8nTj7Pa
	grn5MxK0G7KygcboXP7ngr5hVRS4PHOmA/O480LmNtXxJgUQqeVFKKaRyfsXysQ=
X-Received: by 2002:a05:6214:627:b0:70d:86ab:6f95 with SMTP id 6a1803df08f44-70d9738f7f7mr6593446d6.36.1755801277405;
        Thu, 21 Aug 2025 11:34:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGhBCfL4CK1vaEmXkCImS1C3Q00vXihd0Pi1g9BmtPkaC8+Yz1YnsuRpshrKZpYpvvdxsepA==
X-Received: by 2002:a05:6214:627:b0:70d:86ab:6f95 with SMTP id 6a1803df08f44-70d9738f7f7mr6593076d6.36.1755801276990;
        Thu, 21 Aug 2025 11:34:36 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba937390dsm110337596d6.60.2025.08.21.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:34:36 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:34:34 -0400
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
Message-ID: <aKdmurrT1pFtLSI8@x1>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GFyic97cvOWa9Sd4o1fHe8kneDdc2D-giLxnjs5xlTQ_1755801277
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_113440_926711_9ABBD8EB 
X-CRM114-Status: GOOD (  16.05  )
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

On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	/*
> +	 * We can't figure out what rate it will be, so just return the
> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> +	 * after the rate is set and we'll know what rate the clock is
> +	 * running at then.
> +	 */
> +	return rate;
> +}

...

> +
> +static const struct clk_ops acpm_clk_ops = {
> +	.recalc_rate = acpm_clk_recalc_rate,
> +	.round_rate = acpm_clk_round_rate,
> +	.set_rate = acpm_clk_set_rate,
> +};

The round_rate clk op is deprecated. Please convert this over to use
determine_rate.

Brian


