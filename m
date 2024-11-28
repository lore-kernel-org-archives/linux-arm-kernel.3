Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D742AD690F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ehekiZACHQTnSExEqnoLJzOhJU4i7ihd93wvSZd3eI=; b=Rr7esfqa5OJDbbSdaXdU9dCrlQ
	y+pSm6KrFk7t8lV9apmN0rVuoPOQg48RSO8heJ6Asar5+fBNDXBcbi3PprfXm+SEY2hbH7YohUXlI
	LxcZNor25Z4PGRuv8WvU6fWokrO52eLWVD74rqtSALxJuRKKXq0WC+IfRo84PU/VkJiqGLN2hGDxo
	J+PYcEO0mAkEVGT3g/vKifYmnkC9S83qVJTkYA1ClYXyGl6YQ/uesoK372BJepOqxyTJeP/P00tkm
	p6unRXpqP4IbDxiohLfIYtA+BLn5fXQX6LLyiVJho0G71NYzkf3AQINMz8kgZCzBvmk09jzkvELy9
	4zoLIOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcBf-0000000FJ02-08gd;
	Thu, 28 Nov 2024 10:55:55 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGcAf-0000000FIsP-2URv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:54:55 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5ee1c3dbeb9so356856eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 02:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732791292; x=1733396092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ehekiZACHQTnSExEqnoLJzOhJU4i7ihd93wvSZd3eI=;
        b=jCjISWjStnHniYAUj6b2rc4U1k79QK5aM+OClHO/xx/cYyOEocrUXrKbc8VSV1UTQT
         ODvRgkhcoqYA7ZhCPMV27GEHE+CByn7HfQSElPQBboA4YqrowxsaxV02eaNxq3KnCf/2
         8PEcbSdia7w359LlrlyHYNoWjh4MQcFWCXfkVMEak1PieVDRrHe0lf6T1qpquxc5DVTL
         5/FRunSVBUPNrbyzfvAaULDXS+6jnYFF7CAD543OAU/Q8gRt5LNcjGPAAgD/qGpCmpiL
         HtSkZlh466z71jsvp3nyPd/bvpAMchHhXd+fjp2eEmTbhjehqHFtYzMFc2iEZPWGZrdi
         OEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732791292; x=1733396092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ehekiZACHQTnSExEqnoLJzOhJU4i7ihd93wvSZd3eI=;
        b=NATWOncnFgWUlkPo/kfH27ooTxcCekAUU2b3LnFwQ+1yBEldNl1HhBhRe3UDW8Wj+v
         g0Pw2tJVtnreVcO+RJV3bmYx8SoebPpJHsyW/KeyuAmdOs5S0JLYBoEnMnn5zZCJ71wb
         gm3pxw0SPYkiLkEh4pfDhT7Pwis53EF4e+InJJtQdYbaF3SIJuiarjDuzEEFVC8BQu/L
         KOXDgBBszrXLfbMW2JX11JJx8KaZ1JXKI68LlGBNqUrK22YFvkiv94+vYW0N7Yrs1xDr
         vmK3Ya43NVF4R8Fs+lyVJ00TeIq30zMDWKVMDtaL3hMsASMFS8debF9T/qn2qwyvf7qY
         0gsA==
X-Forwarded-Encrypted: i=1; AJvYcCWDKdivJq+/nSmTrQkQCkDy1lyLX5+an6+bt497RJQ6c5Lqf1UhG3g3Bw5BcRLPCbjhWRptXyunhSnw3khDQAyZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwaBFBVhbwrP3tlB4FXngczlbsJgxPhWDCn38phycEvrK1n+lFO
	owjbCw6jHsCrR7gbHOxbP4q7BM6tNTzg6ffQVuaSO1KcCUk5yWbv7+TSdL/Lfc8bxPGP+sXhxCj
	Ge9Ra5FoYz5ZvjuUNRB44CmIgARqt564UXksl5w==
X-Gm-Gg: ASbGnctYOwArp67ZK4I+RWw3mj1AY4a7sMYQgYXExB3nBJ022QrwbBIqlBx0wMm40fd
	qG0Q+XL47uWed18DT+Mt9RXhdy0nHDbEN
X-Google-Smtp-Source: AGHT+IFRspzNKnz4//d6oD1niqAfNdEx+VyAphVEPqsddVm2R+EgqYzGwfP+qAkW+vpL9icCdahFMF+IE7WYtI+pC5c=
X-Received: by 2002:a05:6820:50e:b0:5f1:dc89:fa85 with SMTP id
 006d021491bc7-5f2179fa1eemr1438491eaf.3.1732791292366; Thu, 28 Nov 2024
 02:54:52 -0800 (PST)
MIME-Version: 1.0
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Nov 2024 10:54:41 +0000
Message-ID: <CADrjBPqWh6z=1+9svYw8H=DZSpo+93rhO123LwFOAMOHMraLkA@mail.gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Roy Luo <royluo@google.com>, kernel-team@android.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_025453_639078_365F7129 
X-CRM114-Status: GOOD (  10.98  )
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

Hi Andr=C3=A9,

On Wed, 27 Nov 2024 at 10:58, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The USB PHY on gs101 needs to be configured based on the orientation of
> the connector. For that the DTS needs a link between the phy's port and
> a TCPCi, and we'll need to inform the phy driver that it should handle
> the orientation (register a handler).
>
> Update the schema to enforce that by requiring the orientation-switch
> and port properties (on gs101 only).
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

