Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCDAC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=; b=F6+IRMmixwa6fjqdUXQGmU6ndI
	o4tAdrntdo82a5DnLDcwvuRImZGBA00EflJgsea3l544/EPWJmcRR6B8D+MIWnEtreuKvlVo6tqrY
	Osa8/vsKUtQpbk+pzGiYAQKgr7pu2E+OBuyxcc83oHP+2NOZSWEfzoJHuJpnYOiZzeux3T+dLn+4p
	Eh+PRV9H9hA1ZxnwWKNC0zv5heZuvNAazSyOyAkDfuWEhRZaF19nEMS/ErAf9Qoxxc22tdgrytB5C
	kq1HP83ONWdkPbeoZhBAkXHkNpzKajMCfFgvK0q+JF9pwZC9RwyupjOgQPBcRalDIHU9hdCY4lGUm
	AAewIyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MiK-000000014rY-0nSC;
	Fri, 04 Sep 2026 05:43:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MiG-000000014rC-1vHD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 05:43:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d560775ca2so5287085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 22:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788500623; x=1789105423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=wt06UJOnOBSFrA6qi4z5Rg8yrwsiK4roObCjpVRenp8xwz2OaA8bLM8C3DOWNS+UaQ
         dI8keCNiwpahDW3797wI9psFym6rNuSEhflVe/c6nROcy891iI3v/Nd2ok0vNeSIrTLj
         C9LGOoGwzM1Zj98rw86Quzwg9AU8YJKdhqNRHCxjD3etbMzv1MC8LahpDM3QROPLenls
         D3kxHNfdH98G7EekMRPxbG6dbfiZNQCeJaRFMZchbpLS5qKwXRy8CsLsBVlPbOAGXbbZ
         MsMtA1d3dDPs3iiiseoHCUMRZ65hHX2JXV/dVCj2hLoOTX8PcA015kx56DnA9XDHPH9W
         0BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500623; x=1789105423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=KiWlI1QpmHvf2EkZSGx1vkvH87kE1c8dGydXxDm1ZTyrNW9Rgr4GS/GjO1KiE1ILtN
         d77icyZz5t3uNwlGt6lCUTVTdD53DWzp2fBKkfvP2ySg8duABl+x8pj4F8Sr5nQFuFKo
         45e36k5yFJWKCTopZSai8fU9v2bcwywWh929XNIR6qrLwXxvIlpYKX9iAer4xV5CBeiN
         CkyWkwQj3l0ku36R3YErJPZzpLhTCiLw0y6kLzgy+ns87bVcZH28HVl4B5oIC5Ilipio
         Z1oO0z99EFxe+9A7EDCFSBASG0Ezd5BV4KStwmODhEv+S7ZpfUxjOws+EXXjYooDjUV8
         rgtg==
X-Forwarded-Encrypted: i=1; AKwUvBydxSJlH05gcQKVuohzxhm3JPUcNqu1PWB2WaFapp0hf4ANHm9KnHtZnWVrnjFd2u7u6c0ncmpnWpbZzRDKta6g@lists.infradead.org
X-Gm-Message-State: AFuF++mml3G+IjsEvzPFGxeh7W53Zog29Czp8p0aJ7VDnEvW2rRRrNrA
	t9XpnQEnJ1DVYzMZtE8WVkiTdq+JVc4nLFsbkzXmMYYpicsrUqdHVAEApCkFHRdJmA8=
X-Gm-Gg: AYBFou05+ICFgj9+BZdYQO7impgZod3Vi0qTNFHtrGV6FEYLBS/IPZNM6zTRyf9tkqT
	awkuQPNAX406nKeNMqNXqUzhz7sIeysed8S5CuTAHMTdMf6vc8uRyUOkZWhEbvEUSS5M8mSewJv
	QqsccBP3C+XfFEE9LwlJHubz8oTSdiow/mD4I8NjnQmhFVuNBSVccDlFfIC33t1faeopZhlBdyV
	hjTDprRohL16FIRHKq8XR4zveDQmvE6a2JG+uPdWrOMR2UT6zgIx2p1NcV0jlkqUS0vc8rWCjAA
	GbpomDlfFTMup9MqJ7swK6CTObrianY3kP/RPtWTmvUcQOzTaNK+YpxpPtQ9+Fg6ImApvHvpFFK
	uAZDg3nna9+aNVd6lkvvxvChphdcylsCJfL8+AO5k97PdF7DJG4pe3iyXv1IzAVGAdZfKlvuKH6
	QI9tUiC5b4qsTc/NfiQSeCQ+BSSpvYQH03Lfi1LjE158F+Kt976nyQPgzlC5UGKJs=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr5553870a91.9.1788500621351;
        Thu, 03 Sep 2026 22:43:41 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm3885069c88.13.2026.09.03.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <appaikrdwu6GpSGy@vireshk-B250M-D3H>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <apmunD8bkKOu5_Vm@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmunD8bkKOu5_Vm@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_224344_518938_E6E97591 
X-CRM114-Status: GOOD (  10.24  )
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

On 03-09-26, 11:30, Mathieu Poirier wrote:
> I'm proposing something like this:
> 
>                         $(transport) {
>                                 compatible = "$(transport),rpmsg";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 gpio {
>                                         compatible = "virtio,device29";

I would just change a minor thing here:

s/virtio/rpmsg/

This isn't a simple virtio-gpio device, since it doesn't have its own virtqueues
and uses virtqueues of virtio-rpmsg instead. So this may better be a
rpmsg,deviceX (where X is virtio ID) ?

>                                         reg = <3>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                                 gpio {
>                                         compatible = "virtio,device29";
>                                         reg = <4>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                         }

-- 
viresh

