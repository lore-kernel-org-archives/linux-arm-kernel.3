Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4350E67800
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAYb8ZWo+6oqgopAoB/L+X6KhCpnV2TRcgj8aWyRjcs=; b=o1z69Af30OfOkWRW0gt1cqlHmX
	llXYiIR8X95F6THGjfLCSJRaN55Hx73yaqTEUTHfI3qYL+5LMcQb8c2RQGueGE5vwDn5AyB5EftqK
	2UVfA8DmH/DOoZLKKjwNC9yiEQ4RYcSs+Uwyq/i2B1HYPjtmK0Vzm+0QlNJskukHTHgVe8enPR/UR
	VFqb/yikRt8M3kkhFSjc92eRWuL+iAHasbTFM/PBgWKfET3Bd3FjgaLIX5iBHOa+1ZCfQyAqjivwF
	fqMv31RFloIbhgYO+BikgnjaBYI5i7+y+GrD89EEQvc7u3+9Y5pwDqun4Ga0hi0p04SVi8U0dw9T9
	kjJgV6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7FCD-00000009rhB-1pew;
	Sat, 02 Nov 2024 14:33:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7FAX-00000009rUl-0hgZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 14:32:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso22894485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 07:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730557919; x=1731162719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uAYb8ZWo+6oqgopAoB/L+X6KhCpnV2TRcgj8aWyRjcs=;
        b=Lw86HFojQepLJVn9lUN+pp7lM8IMhyFmdEBH0LZtkmz9ZxHSyFkZRPkmHX8N3QoNaT
         Su3RRuuJwIjX3cBQS8xM/J9zmxfqLN/8/gASyyxF8y9eLqQPdlbk0EeyxBxYB33RZVz5
         uc0TbBNiz2SRMjwy9Crj4G8MlPbVx1/pYLl+BdH5GYjsaeJHVr2HuUz5dM3VMq+f+gpd
         NxkOYBdvZcczE5MaXbn1KvKFjenDPLZ6XUCclwnVOrBNAHyuPFrzDpFo7Uvs1yCo4p34
         P9M/RVJckn+bIZy+MDD6QGwo3j44354aPquqMHb7G7EYjZqY3mUjUPWUmdJRy4tr+i64
         p/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730557919; x=1731162719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAYb8ZWo+6oqgopAoB/L+X6KhCpnV2TRcgj8aWyRjcs=;
        b=MHRJQhWMDRC2VE9M58K82WtNRY+856IKxhIrRCNGfnZ52JZXILyeJ4RVc2QUGp8i61
         1yoZjsSoEoKP28dnBN51o+zQ3J+wk+4BWi+O0cWz4qyYalI+MH2a7+uKozLMnpWK6guJ
         7/8ywXN0xHGLJgllG07odY7Qxy/IE7dt0/Sj3p7aQ8BxcKr1ZDMt6qxUalGWkC9XgnT5
         +uHJHU657TPNjn47gRwvsq2NM/I3JKxfJcPg66TjSLECvvCM/kqgV1So/sckEL/utuYS
         qzF1YYqNU3Qf5kemX51pj0zQyS0ZWAz0bElN3zDtMP0952d+VADZwwqvLM09WqF5womG
         9OVw==
X-Forwarded-Encrypted: i=1; AJvYcCVtdwYQZbfOzGFhgHtFnnu4dciY4cZQwA4mDVEMH+e+1EyTsKO2q+533IQoNebOw6+T2nyCs1jiNxkia9J6bztG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbkn/1Kv9WEOuKSyNQ4CfMZf2YMOhDbLJWzcmGW649/D83GFSs
	RmwrKaJYEAoOadUtRybUAIpkjvOQLrUzQA5cuGqh1ajuYA+eTVGWi1lhBPv2
X-Google-Smtp-Source: AGHT+IHO7EK4WejfjK60Ywe/XJsJA7dpSEF+xjKyDkwV41ZCRX7ykEoI4QfPPkh6TJrgd+sMtyrihA==
X-Received: by 2002:adf:a15b:0:b0:37d:4ebe:163e with SMTP id ffacd0b85a97d-38061206a7emr18644432f8f.53.1730557918570;
        Sat, 02 Nov 2024 07:31:58 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:492c:2677:72f4:9f57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189118sm8196240f8f.116.2024.11.02.07.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 07:31:58 -0700 (PDT)
Date: Sat, 2 Nov 2024 15:31:56 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-verdin: add single-master
 property to all i2c nodes
Message-ID: <ZyY33Ai6xndqTHzi@eichest-laptop>
References: <20241025095915.22313-1-eichest@gmail.com>
 <20241025095915.22313-2-eichest@gmail.com>
 <ZyWv+BVp91xYr4UZ@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyWv+BVp91xYr4UZ@dragon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_073201_284228_C33014D5 
X-CRM114-Status: GOOD (  22.01  )
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

Hi Shawn,

On Sat, Nov 02, 2024 at 12:52:08PM +0800, Shawn Guo wrote:
> On Fri, Oct 25, 2024 at 11:58:02AM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > By default we expect all i2c nodes to be single-master, we do not have
> > any module or carrier board that uses multi-master mode on any i2c
> > controller. With this property set, we benefit from optimisations made
> > exclusively for single-masters.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 5fa3959141911..95d5d2333ca1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -367,6 +367,7 @@ &i2c1 {
> >  	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> >  	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >  	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	single-master;
> 
> Hmm, I do not see this property is documented in i2c-imx bindings.

According to the discussion we had in this thread
https://lore.kernel.org/linux-i2c/2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3/
it is not necessary to have the property documentation in the i2c-imx
binding because it is already documented in the dt-schema:
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
In the initial discussion, it was addressed for multi-master setups, but
it also applies for single-master. See also this discussion:
https://lore.kernel.org/all/bcdd6cae28edd9dd05a71118f9979e7460688775.camel@pengutronix.de/

Let me know if I have missed anything or misunderstood.

Regards,
Stefan

