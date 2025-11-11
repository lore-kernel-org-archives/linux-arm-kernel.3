Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D99CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=; b=09nYbFefuMh3pUCmBAFXMi7a3G
	CwQo+eCFJfR/40bgnOmpnmPuOYyQ+t0D+hwIQGXzdAFrhjW80+DpqKcKWqzVZ21/kWy6Aymk2jbYS
	lXSPsyCfBnxpV8udQn641PXuPIib9SEgVT7wm6/SP4mSZD4cq048lQX0tpKoJUScw3d7k9YNvyBI1
	wDz8AixaLcWtlx3pfU3plnaoWKyqAxyNPBFM9n9Dh2jWUYzyJ/v6O2Lo0ekinWnTPCUfxrMEJfz5s
	NgXsBT256uW6G8xFAe9BxBzGg7OEZg8KvFpbnQwQWkRTWDQZa3hB+f4KUOEzj7DB+ObZ6fZgfOYbH
	0XCGrwog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqx6-00000007Qv8-1GRg;
	Tue, 11 Nov 2025 16:10:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqx3-00000007Qu5-3zFe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 16:10:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47773cd29a4so18451365e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 08:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762877436; x=1763482236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=;
        b=FLJ8jN92Cv7csSQuxhhiJnmSPXf3D7TNsza2jfurezc6oQNkMEvY4xTgug62GrO+uZ
         1qcCsHw//WBBNTXwrHFEjm6CyG4ONOGIiixUGFUExvAm7MmYaS8ojIddK17HrqyBd17L
         EUsxB4n09PLvHE7FOQyDYnp+9VFuJfxTlUZ4MgrwsMGRH5HSNzuBrqYslJe5QNjxq9/8
         5A5O0FwDoRgi8UTILP9VFpPhL5F6+sJuW0zAGl1usj3pBbOaGBV2OaUmDNUaLEtl+tuA
         wvnWXnhqc6TG+JkGJ2yi+a+ExFtNoByQH4OyZF1K2qyFEJi24zowvvFDLp+iAIX5WVik
         t6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877436; x=1763482236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoJADF8RVNix0LYicXeY00wntRyKPKYW1PP4cuBTQ0E=;
        b=VCldnTzVguecmAAYJspKEGurXCrScQ0CVIX2VFPirGfZ2qIypP93dQpd9A/mVrlJfU
         jD4RAS1z4gZGqGKp0capPhOx16p+jD2I4wKvBy+5PQI56CvXdiM9bDUc/4VxjwxiV36S
         e3Wob++KQUZFKz0QPQTJsfN+8LVlUGaQFNr+nwa5AcUb+FKJvqaowKd72JkzyopYH+ha
         QuM67tomZsPXwrFILQ2M6JBUOp+6uHpCawJS6VL3oaripV4H8w8T6HHKCt5puuamRqZQ
         1hsr5Yrlp0BCG/hEzCOQiXIHpULzaTJ7Xp+ubnrEVKUVPjjtGis2ZiEgzVUxhg9XkB1O
         K5bw==
X-Forwarded-Encrypted: i=1; AJvYcCU+3uF5nwL7/AEzezILlI3RlWE50QxOFGO+Ul1/NWDeGn1B/tFuNVCX9SncuHkRqsfOGe1KtXyZoS2Aje/UmTiD@lists.infradead.org
X-Gm-Message-State: AOJu0YypKTo4ECJDltFOpGU7rrwzJywLXvBrUpBYzTUvYrttJJI4nDC0
	xRNPHN5S7hrpsU6bDp0HULQ47E+yfdZpfSFaHnvv95f7VP02i8ZD0UqBhLW+c5/VOBI=
X-Gm-Gg: ASbGnctEQtJVszl0Ke9GADchpQZBN2VLjc47iptrCwtN/WzjdnzvZc+bDtGavbQP5Ym
	IUWRU2IGnCzX+vjwHwpnjAb2oLMmUvB1S1ln6MjumZz32zm0OGf97gSRkP/MDusPVLHoL261KeY
	sxKPQOoYgJYesmRnDxhbg+DwEv4IdQpkh8rSxlF7GSSKQAZoyDDfXY9pj1KKA0c3xOft1XdET8K
	/VVmqgP7aYtQGIbprnBxfGj1FxySfItxkajgAD5fhx0avZt1VhfA3nY7szenxa1XLG186JlXy3L
	aJYKMu2BPYNgl5YcVFX7kwk3PznTwKI/ZfoHH7ePRA5lguIOOjaGuPsuoE6pkB9Z1HCO9CEH0FD
	o9Ox1+BgRGzbtno93Td0CWT5xj/I/kQ7eTOIB9A3JDv2xRCiDOJrqkAB+ECvvrgRs2bTc8zj6V+
	LHAouR7Ac=
X-Google-Smtp-Source: AGHT+IGf3h4aOkXPIFGmt6Elh6BLQ2gmD9PXDCWL3w2nhAYHGTWFyL3xlC5Ggf4g6An8feZ4EFRkWg==
X-Received: by 2002:a05:600c:1d1d:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47773236fb7mr110096475e9.5.1762877436034;
        Tue, 11 Nov 2025 08:10:36 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc528sm390576215e9.7.2025.11.11.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:10:35 -0800 (PST)
Date: Tue, 11 Nov 2025 18:10:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Message-ID: <rqtqzjjn35pibh42holg7ld6pjkjdyf4taljycu3zw32cr6inr@b7xck2bicm7s>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
 <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_081038_004799_9469DC0B 
X-CRM114-Status: GOOD (  17.22  )
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

On 25-11-11 18:05:39, Abel Vesa wrote:
> 
> On Tue, 04 Nov 2025 04:02:53 -0800, Laurentiu Mihalcea wrote:
> > The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> > LPAV subsystem, which offers clock gating, reset line
> > assertion/de-assertion, and various other misc. options.
> > 
> > This series adds support for the IP by introducing a new clock HW provider
> > driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> > allow it to be used for i.MX8ULP's SIM LPAV as well.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/8] dt-bindings: clock: document 8ULP's SIM LPAV
>       commit: 3b521bf8c51246466e2c337f1f2b60acfdfe82d6
> [3/8] clk: imx: add driver for imx8ulp's sim lpav
>       commit: fdc1dc7dd53b95805d3943ed36785c1ec812915e

I only applied the two ones above. None of the rest.

Sorry for the mess-up.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

