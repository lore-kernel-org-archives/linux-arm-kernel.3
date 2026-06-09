Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016ADCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5HJL58J1eZJZ2b60pokq8zoselIZjiEHemGuH3SCnY=; b=lTgIjVUURqvyQWufjpLU37lGpa
	o2fiD35zCMFp5ptRqO1qEU3YBKpELqGcygAsAUo2TI6z4/SnmL22vsmYuKBNswyA8p6mP7Xt7NtfR
	D1CFK/yQafcmCGGV72wNr00B1W2u5rtzLxDfTODc8JdAsHOjFPcB2JX4LwLlp5OunAuKvG5tD68Kj
	o9a+wk/o3VGHegsIhTlHErMFZfPpDO2XBkhaNKNL3TBeiCS571TR7bOw1M7+6vtt4EjKxdYRntBgm
	DDh5jeD6mnmxPVDdPCPsr2f5D8G6MMyB0rfsvonshxfoMMdFU5v7izXZf574hQfv8OL0Mv2izU0hC
	ubQFn1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzUs-000000064QO-2XXU;
	Tue, 09 Jun 2026 16:40:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzUo-000000064Pk-2xHl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:40:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf30d530bdso58090315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781023210; x=1781628010; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5HJL58J1eZJZ2b60pokq8zoselIZjiEHemGuH3SCnY=;
        b=zuldTBGjAVk8JkzHqUCvrrqI+vAVEUOMF7s577F0J355kavz/2DsPQtmJf0jTS3uhC
         3rnUfGvMJMuWHOEioCHY6sZpUmxmkWmvn9urh4IXAT38+olaxTVaRS4VkSgzpCV331/f
         JTq+MAxlsO9NjtNreVta7HwpvnIYMdvdLQRWYet/Gx7hHcHqcxtAkwNaoIkiE4saajQp
         38BDIEDGk4NKfw9zBN3WUuySQqb1KZZ8BmBnAi6u51kEJz8AmMvOhYLAB5MJ8ABc3AXk
         8ukUiFSbPjaZxmD+h0TXyBgIPU2MHUmkIWh8RpQeJRpj5tYxK6u+pIM7betLc+efuR1p
         X//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023210; x=1781628010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5HJL58J1eZJZ2b60pokq8zoselIZjiEHemGuH3SCnY=;
        b=O0tI2YMgjUVwbTIACTbWB4WRmvv+tERtuRgWm0t6S+9D0VsR0ZoB6G50G6yCctNU2t
         CwsbyTGSOV5BOqVaotgUJT5H7pV85hIfbC7X1cqs/7vlXAnSMKVU829P6KiF13bIqeiy
         oktOOo5OIq7XTmTP4xXASXX3i8wuhSTSyF4pgNRmG6vX5yEL1tFbM4AmIICIcKIS1NOl
         99Gh7lYveMDG0ykCJiOxbL/FRvL3x8zkv8FfRfo0ubNL9dBm2n5BzU9iAXcvsZocnt5D
         E12n0esq/HxOjOF55i0zNYM3A7e9FvcaAriogIsdusWaBIp8o6Jbi0HzOpV5D2r5T5Nx
         iIlA==
X-Forwarded-Encrypted: i=1; AFNElJ/JQPmtF+zoikyHp4oPuRfTdHmZIvpXdqLZNGCBnKeoqrteKoh4Yv6O6KyPWvSGZhpsgtOI/osmqQKzIvhtXqai@lists.infradead.org
X-Gm-Message-State: AOJu0YzbIvEs46vZXbFOwnYrRraqkaDMRgouLkMrDwJHrrHQw4EjDr07
	v3zqVcj0fml7iZRiwMT0A0tWhUAuGeWVDGp//jBhpixoGrvWI++ItyBpGzSg8R55n4I=
X-Gm-Gg: Acq92OH80Wf1pAMduIGOH6KSL59SHV8XyvFg393xqbCmhujlEaVKaR9s87L1heHcd8c
	Dv/whrX//uODbTvZWKF2Mmank7MD7xNIDuTLLXBQPINRKaGShWEOI5ArDBKGHvvEpZeruOr3lcL
	5dLJ4A8fmYRgeVuDtWi7OuPfX7kk6WaFzZx6CpDF8/shoh34W4m5CE0cHoUnbqm4W+IOBO/brly
	2atf5Tr5YaCD9fzyBac6D5frFfSFUCbRK8CD90QbXRX6FI7XKU8d+1rePMeYj2mu1eOdtra2ZAb
	4S78FvbD137fKWbh/Gu8EBkhOixTkdzkcwkdQNPNXGcVRJHo/hAlRKP21vFu/CoGimrxaMQjV11
	mwB2SygmJZCE1K96xg8U6Cg9q/pEImzsHXjkw7vRQcgWy0JHL1mJzB0BXukWhl+Darnb5hubqIp
	HLMAktP/6vvr6JehHEAxODmmm/YScrO4jP+ltE
X-Received: by 2002:a17:903:2450:b0:2c0:3400:5c42 with SMTP id d9443c01a7336-2c1e820bffemr225857055ad.26.1781023209568;
        Tue, 09 Jun 2026 09:40:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7f00:843c:9d87:e9dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0a2sm225550575ad.46.2026.06.09.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:40:08 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:40:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <aihB5rVLsVqzg6cb@p14s>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094010_781211_87A77C06 
X-CRM114-Status: GOOD (  23.91  )
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

On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The names of the carveout regions are derived using the names of the
> reserved memory devicetree nodes, which are referenced using the
> "memory-region" property. This adds a restriction on the names of said
> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> specification's recommendation, which states that the devicetree node
> names should be generic.

I don't see what is so restrictive in using the node name of the reserved-memory
regions.  Function of_reserved_mem_region_to_resource() is already doing all the
parsing, packaging everything in a neat and easy to use "struct resource".  What
will you gain with this new "memory-region-names" that can't be done with the
current solution?

> 
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the carveout names can use the values
> passed via "memory-region-names", while keeping the devicetree node
> names of the reserved memory regions generic.
> 
> There are no restrictions imposed on the values of the strings passed via
> the new property since the software allows any name to be used, with some
> names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> special meaning.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..8e3e6676a95e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,10 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8
> -- 
> 2.43.0
> 

